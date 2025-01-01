import pymysql
import traceback
import logging
import yaml
import time

logger = logging.getLogger(__name__)

#https://github.com/MogicianXD/ZhihuCrawler/blob/886a9bc01edb42cc8a84c07122187a8fc3edebb5/db.py

class ZhihuDB:
    def __init__(self):
        with open("config.yaml", "r") as stream:
            conf_options = yaml.safe_load(stream)

        if conf_options["APP"]["MODE"] == "TEST":
            self.conn = pymysql.connect(
                host=conf_options["APP"]["DATABASE_TEST"]["DBHOST"],
                user=conf_options["APP"]["DATABASE_TEST"]["DBUSER"],
                password=conf_options["APP"]["DATABASE_TEST"]["DBPASS"],
                database=conf_options["APP"]["DATABASE_TEST"]["DBNAME"],
                port=conf_options["APP"]["DATABASE_TEST"]["DBPORT"],
                charset=conf_options["APP"]["DATABASE_TEST"]["DBCHARSET"],
                connect_timeout=conf_options["APP"]["DATABASE_TEST"]["DBCONNECT_TIMEOUT"],
                autocommit=True,
            )
            logger.info("Running in TEST mode using the test database.")
        elif conf_options["APP"]["MODE"] == "PROD":
            self.conn = pymysql.connect(
                host=conf_options["APP"]["DATABASE"]["DBHOST"],
                user=conf_options["APP"]["DATABASE"]["DBUSER"],
                password=conf_options["APP"]["DATABASE"]["DBPASS"],
                database=conf_options["APP"]["DATABASE"]["DBNAME"],
                port=conf_options["APP"]["DATABASE"]["DBPORT"],
                charset=conf_options["APP"]["DATABASE"]["DBCHARSET"],
                connect_timeout=conf_options["APP"]["DATABASE"]["DBCONNECT_TIMEOUT"],
                autocommit=True,
            )
            logger.info("Running in PROD mode using the production database.")
        else:
            logger.error("Invalid mode, please set to either TEST or PROD.")
            exit(1)
        self.cursor = self.conn.cursor()
        logging.info("DB INFO: __init__")

    def close(self):
        self.cursor.close()
        self.conn.close()
        logging.info("DB INFO: connection close")

    def execute(self, sql, args=None):
        try:
            self.conn.ping(reconnect=True)
            self.cursor.execute(sql, args)
            self.conn.commit()
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            
    def execute_write(self, sql, val):
        affected_rows = None
        try:
            self.conn.ping(reconnect=True)
            self.cursor.execute(sql, val)
            self.conn.commit()
            # https://stackoverflow.com/questions/77112815/python-get-result-of-an-update-query-mysql-when-performing-raw-sql
            # Get the number of affected rows
            affected_rows = self.cursor.rowcount

            # Check if the update was successful
            if affected_rows is not None and affected_rows > 0:
                # Update was successful, take appropriate action
                logging.info("DB INFO: Update was successful, take appropriate action")
                return True
            else:
                # No rows were affected, handle the error or raise an Exception
                logging.info("DB INFO: No rows were affected by the update query")
                return False
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))

    def executemany(self, sql, turples):
        try:
            self.cursor.executemany(sql, turples)
            self.conn.commit()
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))

    def exist(self, table, id_name, id):
        sql = "SELECT {} FROM {} WHERE {} = %s".format(id_name, table, id_name)
        try:
            self.cursor.execute(sql, id)
            self.conn.commit()
            return self.cursor.fetchone() != None
        except:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            logging.error("DB ERROR: ",traceback.format_exc())
            return False

    def fetch_all(self, sql, args=None):
        try:
            self.execute(sql, args)
            res = self.cursor.fetchall()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def fetch_one(self, sql, args=None):
        try:
            self.execute(sql, args)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None


#----------------------------------------------------------------------------------------------------------------------------------- CUSTOM MADE SQLs


    def remove_card_from_user_by_id(self, user, id):
        sql = 'DELETE FROM user_cards WHERE display_name = %s AND id = %s'
        val = (user, id)
        return self.execute_write(sql, val)

    def remove_card_from_user_by_card_name(self, user, card_name):
        sql = 'DELETE FROM user_cards WHERE display_name = %s AND card_name = %s'
        val = (user, card_name)
        return self.execute_write(sql, val)

    def get_points(self, user):
        sql = "SELECT points FROM users WHERE display_name = %s LIMIT 1"
        val = (user) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def add_points(self, user, points):
        sql = 'UPDATE users SET points = points + %s WHERE display_name = %s'
        val = (points, user)
        return self.execute_write(sql, val)

    def remove_points(self, user, points):
        sql = 'UPDATE users SET points = points - %s WHERE display_name = %s'
        val = (points, user)
        return self.execute_write(sql, val)
        #TODO: no negative values

    def fetch_one_card_from_user(self, user, card_name):
        sql = "SELECT id,display_name,card_name FROM user_cards WHERE display_name = %s AND card_name = %s"
        val = (user, card_name) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def count_all_cards_from_user(self, user):
        sql = "SELECT COUNT(*) AS row_count FROM user_cards WHERE login_name = %s"
        val = (user) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def fetch_collectionrank(self, user):
        sql = """
        SELECT 
            display_name,
            total_cards,
            rank
        FROM (
            SELECT 
                u.display_name,
                COUNT(uc.card_id) AS total_cards,
                RANK() OVER (ORDER BY COUNT(uc.card_id) DESC) AS rank
            FROM 
                users u
            JOIN 
                user_cards uc ON u.login_name = uc.login_name
            GROUP BY 
                u.display_name
        ) ranked_users
        WHERE display_name = %s
        """
        val = (user) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def count_all_users(self):
        sql = "SELECT COUNT(*) as all_users FROM users"
        try:
            self.execute(sql)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def fetch_all_queue_users(self, channel_name):
        sql = "SELECT display_name,channel_id FROM queue WHERE channel_name = %s "
        val = (channel_name) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchall()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def fetch_user(self, user):
        sql = "SELECT display_name FROM users WHERE display_name = %s"
        val = (user) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def fetch_trade(self, user, target):
        sql = "SELECT * FROM trade WHERE display_name_request = %s AND display_name_receive = %s AND result = 'pending' LIMIT 1"
        val = (user, target) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def exist_user(self, user):
        sql = "SELECT display_name FROM users WHERE display_name = %s"
        val = (user) 
        try:
            self.cursor.execute(sql, val)
            self.conn.commit()
            return self.cursor.fetchone() != None
        except:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            logging.error("DB ERROR: ",traceback.format_exc())
            return False

    def exist_card(self, user, card_name):
        sql = "SELECT display_name,card_name FROM user_cards WHERE display_name = %s AND card_name = %s"
        val = (user, card_name)
        try:
            self.cursor.execute(sql, val)
            self.conn.commit()
            return self.cursor.fetchone() != None
        except:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            logging.error("DB ERROR: ",traceback.format_exc())
            return Fals

    def exist_raffle(self, channel_name):
        sql = "SELECT channel_name FROM active_raffle WHERE channel_name = %s"
        val = (channel_name)
        try:
            self.execute(sql, val)
            self.conn.commit()
            return self.cursor.fetchone() != None
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def insert_trade(self, channel_name,mycard_id,mycard_name,othercard_id,othercard_name,display_name_request,login_name_request,display_name_receive,login_name_receive):
        sql = "INSERT INTO trade (channel_name,mycard_id,mycard_name,othercard_id,othercard_name,display_name_request,login_name_request,display_name_receive,login_name_receive) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        val = (channel_name,mycard_id,mycard_name,othercard_id,othercard_name,display_name_request,login_name_request,display_name_receive,login_name_receive)
        return self.execute_write(sql, val)

    def insert_raffle_user(self, display_name, name, channel_name):
        sql = "INSERT INTO queue (display_name, name,channel_name) VALUES (%s, %s, %s)"
        val = (display_name, name, channel_name)
        return self.execute_write(sql, val)

    def insert_card_from_user_by_card_name(self, login_name,display_name,channel_name,card_id,card_name,acquired):
        sql = "INSERT INTO user_cards (login_name,display_name,channel_name,card_id,card_name,acquired) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (login_name,display_name,channel_name,card_id,card_name,acquired)
        return self.execute_write(sql, val)

    def fetch_random_card_from_channel(self, channel_name):
        sql = "SELECT id, name, channel_name FROM cards WHERE channel_name = %s ORDER BY RAND() LIMIT 1"
        val = (channel_name) 
        try:
            self.execute(sql, val)
            res = self.cursor.fetchone()
            self.conn.commit()
            return res
        except Exception as e:
            self.conn.rollback()
            logging.error("DB ERROR: ",str(e))
            return None

    def insert_user_card(self, login_name, display_name, channel_name, card_id, card_name, acquired):
        sql = "INSERT INTO user_cards (login_name, display_name, channel_name, card_id, card_name, acquired) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (login_name, display_name, channel_name, card_id, card_name, acquired)
        return self.execute_write(sql, val)
        # except pymysql.IntegrityError as e:
            # print(f"{time.strftime('%d/%m %H:%M:%S')}| PyMySQL ERROR: Duplicate entry. {e.args[0]}: {e.args[1]}")
            # self.connection.rollback()

    def update_trade(self, result, updated_at, user, target):
        sql = 'UPDATE trade SET result = %s, updated_at = %s WHERE display_name_request = %s AND display_name_receive = %s'
        val = (result, updated_at, user, target)
        logging.info(f"DB SQL: {sql}")
        logging.info(f"DB VAL: {val}")
        return self.execute_write(sql, val)






























































































