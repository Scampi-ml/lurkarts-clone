import asyncio
import importlib
import logging
import os
import random
import re
import requests
import sys
import time
import traceback
import yaml
import pytz
from db import ZhihuDB
from aiohttp import ClientSession
from aiohttp.web_runner import GracefulExit
from time import sleep
from twitchio.ext import commands
from typing import Any, Dict, List
from datetime import datetime
from datetime import timezone

print("Setting up logging...")



#---------------------------------------------------------
# Make some logging, comes in handy right?
# https://stackoverflow.com/questions/13479295/python-using-basicconfig-method-to-log-to-console-and-file
#---------------------------------------------------------
logging.basicConfig(
     filename=time.strftime("%d-%m-%y")+'_bot.log',
     level=logging.INFO, 
     format= '[%(asctime)s] {%(pathname)s:%(lineno)d} %(levelname)s - %(message)s',
     datefmt='%H:%M:%S'
 )


print("Logging to file set up...")

 # set up logging to console
console = logging.StreamHandler()
console.setLevel(logging.DEBUG)
# set a format which is simpler for console use
formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
console.setFormatter(formatter)
# add the handler to the root logger
logging.getLogger('').addHandler(console)

print("Logging to console set up...")

logger = logging.getLogger(__name__)

print("Logger for main module created...")

logger.info("---------- Streamer-Cards V0.1 ----------")



#---------------------------------------------------------
# Init Database Class
#---------------------------------------------------------
db = ZhihuDB()
#---------------------------------------------------------
# Define function to process yaml config file
#---------------------------------------------------------
def process_config_file() -> Any:
    with open("config.yaml", "r") as stream:
        config_options = yaml.safe_load(stream)

    return config_options


class TwitchBot(commands.Bot):
    def __init__(self,access_token: str,client_secret: str,prefix: str,initial_channels: List[str],conf_options: Dict[str, Any]):
        self.conf_options = conf_options
        self.refresh_token_url ="https://id.twitch.tv/oauth2/token"
        self.client_id = conf_options["APP"]["CLIENT_ID"]
        self.client_secret = client_secret
        super().__init__(token=access_token, client_secret=client_secret, prefix=prefix, initial_channels=initial_channels,  heartbeat=120)
        logger.info("Connecting to twitch")

    #---------------------------------------------------------
    # Init Client Session
    #---------------------------------------------------------
    async def tinit(self) -> None:
        self.session = ClientSession()
        logger.info("Init ClientSession")

    #---------------------------------------------------------
    # Stop the bot and its connections
    #---------------------------------------------------------
    async def stop(self) -> None:
        logger.info("Session closed")
        await self.session.close()

    #---------------------------------------------------------
    # Getting thhings ready
    #---------------------------------------------------------
    async def event_ready(self):
        logger.info("Logged into twitch")

    #---------------------------------------------------------
    # Did our token expire?
    #---------------------------------------------------------
    async def event_token_expired(self) -> None:
        logger.info("Token expired.")
        data = {
            "client_id": self.client_id,
            "client_secret": self.client_secret,
            "grant_type": "refresh_token",
            "refresh_token": self.refresh_token,
        }
        async with self.session.post(self.refresh_token_url, data=data) as response:
            response_data = await response.json()
            self.token = response_data["access_token"]
            self.refresh_token = response_data["refresh_token"]
            logger.info("Token refreshed.")
        
        ## Save the new token and refresh to the config file
        self.conf_options["APP"]["ACCESS_TOKEN"] = self.token
        self.conf_options["APP"]["REFRESH_TOKEN"] = self.refresh_token
        with open("config.yaml", "w") as stream:
            yaml.dump(self.conf_options, stream)

        logger.info("Token saved to config file")
        return self.token


    #---------------------------------------------------------
    # Start on events
    #---------------------------------------------------------
    async def event_message(self, message) -> None:
        # make sure the bot ignores itself and the streamer
        if message.echo:
            return

        await self.handle_commands(message)


    @commands.command(name='burn')
    async def burn(self, ctx: commands.Context, card_name=None) -> None:
        logging.info(f"!burn in the chat by: {ctx.author.display_name}")
        logging.info(f"Card name: {card_name}")
        try:
            if card_name is not None:
                exist = db.fetch_one_card_from_user(ctx.author.display_name, card_name)
                logging.debug(f"Exist: {exist}")
                if exist is not None:
                    logging.info(f"Card id: {exist[0]}")
                    added = db.add_points(ctx.author.display_name, conf_options["APP"]["BURN_POINTS"])
                    if added == True:
                        remove = db.remove_card_from_user_by_id(ctx.author.display_name, exist[0])
                        if remove == True:
                            #---------------------------------------------------------
                            # TODO On Error: @display_name [$card_name] doesn't exist
                            #---------------------------------------------------------
                            logging.info(f"@{ctx.author.display_name} You burnt {card_name} and got {conf_options["APP"]["BURN_POINTS"]} points")
                            await ctx.send(f"@{ctx.author.display_name} You burnt {card_name} and got {conf_options["APP"]["BURN_POINTS"]} points")
                        else:
                            logging.error(f"@{ctx.author.display_name} ERROR: cant remove card")
                            await ctx.send(f"@{ctx.author.display_name} ERROR: cant remove card")
                    else:
                        logging.error(f"@{ctx.author.display_name} ERROR: cant update points")
                        await ctx.send(f"@{ctx.author.display_name} ERROR: cant update points")
                else:
                    logging.error(f"@{ctx.author.display_name} You don't have card {card_name} in your inventory")
                    await ctx.send(f"@{ctx.author.display_name} You don't have card {card_name} in your inventory")
            else:        
                logging.error(f"@{ctx.author.display_name} Please indicate which card you would like to burn. E.g: !burn cardname")
                await ctx.send(f"@{ctx.author.display_name} Please indicate which card you would like to burn. E.g: !burn cardname")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !burn command failed.")


    @commands.command(name='collection')
    async def collection(self, ctx: commands.Context) -> None:
        logging.info(f"!collection in the chat by: {ctx.author.display_name}")
        try:
            count = db.count_all_cards_from_user(ctx.author.display_name)
            logging.info(f"count: {count}")
            if count is not None:
                logging.info(f"@{ctx.author.display_name} You have {count[0]} cards.")
                await ctx.send(f"@{ctx.author.display_name} You have {count[0]} cards.")
            else:
                logging.error(f"@{ctx.author.display_name} ERROR getting your account cards")
                await ctx.send(f"@{ctx.author.display_name} ERROR getting your account cards")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !collection command failed.")


    @commands.command(name='collectionrank')
    async def collectionrank(self, ctx: commands.Context) -> None:
        logging.info(f"!collectionrank in the chat by: {ctx.author.display_name}")
        try:
            rank = db.fetch_collectionrank(ctx.author.display_name)
            logging.info(f"rank: {rank}")
            if rank is not None:
                all_users = db.count_all_users()
                logging.info(f"all_users: {all_users}")
                if all_users is not None:
                    logging.info(f"@{ctx.author.display_name} You are {rank[2]} out of {all_users[0]} collectors.")
                    await ctx.send(f"@{ctx.author.display_name} You are {rank[2]} out of {all_users[0]} collectors.")
                else:
                    logging.error(f"@{ctx.author.display_name} ERROR: counting users")
                    await ctx.send(f"@{ctx.author.display_name} ERROR: counting users")
            else:
                logging.error(f"@{ctx.author.display_name} ERROR getting user rank")
                await ctx.send(f"@{ctx.author.display_name} ERROR getting user rank")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !collectionrank command failed.")


    @commands.command(name='drop')
    async def drop(self, ctx: commands.Context) -> None:
        logging.info(f"!drop in the chat by: {ctx.author.display_name}")
        try:
            exist_user = db.exist_user(ctx.author.display_name)
            if exist_user is not None:
                points = db.get_points(ctx.author.display_name)
                if points is not None:
                    USER_POINTS = int(points[0])
                    logging.info(f"{ctx.author.display_name} has {USER_POINTS} points.")
                    #---------------------------------------------------------
                    # Does the user have enough points?
                    #---------------------------------------------------------
                    if USER_POINTS >= 7:
                        logging.info(f"{ctx.author.display_name} has more of equal then 7 points.")
                        logging.info(f"Channel name is: {ctx.channel.name}")
                        #---------------------------------------------------------
                        # Get a random card
                        #---------------------------------------------------------
                        random_card = db.fetch_random_card_from_channel(ctx.channel.name)
                        logging.info(f"random_card is: {random_card}")
                        #---------------------------------------------------------
                        # Check if we have a card or not
                        #---------------------------------------------------------
                        if random_card is not None:
                            CARD_ID = random_card[0]
                            CARD_NAME = random_card[1]
                            logging.info(f"The random card is {CARD_NAME}.")
                            #---------------------------------------------------------
                            # Update the users points
                            #---------------------------------------------------------
                            remove_points = db.remove_points(ctx.author.display_name, 7)
                            if remove_points == True:
                                #---------------------------------------------------------
                                # Add card to user
                                #---------------------------------------------------------
                                insert_user_card = db.insert_user_card(ctx.author.name, ctx.author.display_name, ctx.channel.name, CARD_ID, CARD_NAME, "drop")
                                
                                logging.info(f"insert_user_card:  {insert_user_card}")
                                
                                if insert_user_card == True:
                                    logging.info(f"@{ctx.author.display_name} You got {CARD_NAME}.")
                                    await ctx.send(f"@{ctx.author.display_name} You got {CARD_NAME}.")
                                else:
                                    logging.error(f"{ctx.author.display_name} ERROR: inserting card")
                                    await ctx.send(f"@{ctx.author.display_name} ERROR: inserting card")
                            else:
                                logging.error(f"{ctx.author.display_name} ERROR: removing points")
                                await ctx.send(f"@{ctx.author.display_name} ERROR: removing points")
                        else:
                            logging.error(f"{ctx.author.display_name} ERROR: random card not found.")
                            await ctx.send(f"@{ctx.author.display_name} ERROR: random card not found.")
                    else:
                        logging.info(f"@{ctx.author.display_name} It costs 7 points to drop a card but you only have {USER_POINTS}.")
                        await ctx.send(f"@{ctx.author.display_name} It costs 7 points to drop a card but you only have {USER_POINTS} points.")
                else:
                    logging.error(f"@{ctx.author.display_name} ERROR: user does not have any points.")
                    await ctx.send(f"@{ctx.author.display_name} ERROR: user not have any points.")
            else:
                logging.error(f"@{ctx.author.display_name} ERROR: user not found")
                await ctx.send(f"@{ctx.author.display_name} ERROR: user not found")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !drop command failed.")


    @commands.command(name='lurkarts')
    async def lurkarts(self, ctx: commands.Context) -> None:
        logging.info(f"!lurkarts in the chat by: {ctx.author.display_name}")
        logging.info(f"Channel is: {ctx.channel.name}")
        try:
            raffle = db.exist_raffle(ctx.channel.name)
            if raffle:
                logging.info(f"Channel raffle is -ACTIF-")
                insert = db.insert_raffle_user(ctx.author.display_name, ctx.author, ctx.channel.name)
                if insert == True:
                    #---------------------------------------------------------
                    # Normaly we send a message, but it does not by default, just log it to console
                    #--------------------------------------------------------- 
                    logging.info(f"@{ctx.author.display_name} added to the queue")
                    #await ctx.send(f"@{ctx.author.display_name}  added to the queue")
                else:
                    logging.info(f"Hey @{ctx.author.display_name}, you have already joined this raffle.")
                    await ctx.send(f"Hey @{ctx.author.display_name}, you have already joined this raffle.")
            else:
                #---------------------------------------------------------
                # TODO:
                # log this error to db for tracking
                #---------------------------------------------------------
                logging.info(f"Channel raffle is -NOT ACTIF-")
                logging.info(f"@{ctx.author.display_name} No active raffles for this channel.")
                await ctx.send(f"@{ctx.author.display_name} No active raffles for this channel.")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !lurkarts command failed.")


    @commands.command(name='queue')
    async def queue(self, ctx: commands.Context) -> None:
        logging.info(f"!queue in the chat by: {ctx.author.display_name}")
        logging.info(f"Channel name is: {ctx.channel.name}")
        try:
            users = db.fetch_all_queue_users(ctx.channel.name)
            logging.info(f"users is: {users}")
            if users:
                # Extract usernames into a list
                usernames = [user[0] for user in users]
                # Join usernames with comma and space
                users_string = ", ".join(usernames)
                logging.info(f"@{ctx.author.display_name} Current viewers: {users_string}")
                await ctx.send(f"@{ctx.author.display_name} Current viewers: {users_string}")
            else:
                logging.info(f"@{ctx.author.display_name} No viewers in the queue.")
                await ctx.send(f"@{ctx.author.display_name} No viewers in the queue.")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !queue command failed.")


    @commands.command(name='trade')
    async def trade(self, ctx: commands.Context, target=None, mycard=None, other_card=None,) -> None:
        logging.info(f"!trade in the chat by: {ctx.author.display_name}")
        logging.info(f"Target: {target}")
        logging.info(f"Mycard: {mycard}")
        logging.info(f"Other_card: {other_card}")
        logging.info(f"Channel name: {ctx.channel.name}")
        try:
            if target is not None and mycard is not None and other_card is not None:
                exist_user = db.exist_user(target)
                logging.info(f"exist_user is: {exist_user}")
                if exist_user == True:
                    target_card_exist = db.exist_card(target, other_card)
                    logging.info(f"target_card_exist is: {target_card_exist}")
                    if target_card_exist == True:
                        my_card_exist = db.exist_card(ctx.author.display_name, mycard)
                        logging.info(f"my_card_exist is: {my_card_exist}")
                        if my_card_exist == True:
                            insert = db.insert_trade(ctx.channel.name, 0, mycard, 0, other_card, ctx.author.display_name, ctx.author.name, target, target)
                            if insert == True:
                                logging.info(f"@{target}, @{ctx.author.display_name} wants to give you card {mycard} for your card {other_card}")
                                await ctx.send(f"@{target}, @{ctx.author.display_name} wants to give you card {mycard} for your card {other_card}")
                            else:
                                logging.error(f"@{ctx.author.display_name} ERROR: insert trade")
                                await ctx.send(f"@{ctx.author.display_name} ERROR: insert trade")
                        else:
                            logging.info(f"@{ctx.author.display_name} You don't have card {mycard} in your inventory")
                            await ctx.send(f"@{ctx.author.display_name} You don't have card {mycard} in your inventory")
                    else:
                        logging.info(f"@{ctx.author.display_name} {target} doesn't own card {other_card}")
                        await ctx.send(f"@{ctx.author.display_name} {target} doesn't own card {other_card}")
                else:
                    logging.info(f"@{ctx.author.display_name} User not found")
                    await ctx.send(f"@{ctx.author.display_name} User not found")
            else:
                logging.info(f"Invalid command format. Usage: !trade @user mycard userscard. If a card name is multiple words, add quotes.")
                await ctx.send(f"Invalid command format. Usage: !trade @user mycard userscard. If a card name is multiple words, add quotes.")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !trade command failed.")

    @commands.command(name='tradeyes')
    async def tradeyes(self, ctx: commands.Context, target=None) -> None:
        logging.info(f"!tradeyes in the chat by: {ctx.author.display_name}")
        logging.info(f"Target: {target}")
        logging.info(f"Channel name: {ctx.channel.name}")
        try:
            if target is not None:
                exist_user = db.exist_user(target)
                logging.info(f"exist_user is: {exist_user}")
                if exist_user == True:
                    trade_info = db.fetch_trade(target, ctx.author.display_name)
                    logging.info(f"trade_info is: {trade_info}")
                    if trade_info is not None:
                        update = db.update_trade('accepted',  str(datetime.now()), trade_info[8], trade_info[10])
                        logging.info(f"target is: {trade_info[8]}")
                        logging.info(f"othercard_name is: {trade_info[6]}")
                        logging.info(f"mycard_name is: {trade_info[4]}")
                        logging.info(f"user is: {trade_info[10]}")
                        logging.info(f"update is: {update}")
                        if update == True:
                            #id,channel_name,message_id,mycard_id,mycard_name,othercard_id,othercard_name,result,display_name_request,login_name_request,display_name_receive,login_name_receive,created_at,updated_at
                            #(4, 'scampi_ml', None, 0, 'IetieIetie', 0, 'IetieEmo', 'pending', 'Scampi_ml', 'scampi_ml', 'janvier1985', 'janvier1985', datetime.datetime(2024, 7, 24, 10, 33, 5), None)
                            
                            
                            # 8 display_name_request
                            # 10 display_name_receivecard_name
                            #4 mycard_name
                            # 6 othercard_name
                            
                            #db.remove_card_from_user_by_card_name(target, trade_info[6])
                            #db.remove_card_from_user_by_card_name(ctx.author.display_name, trade_info[4])
                            
                            #db.insert_card_from_user_by_card_name(target, trade_info[4])
                            #db.insert_card_from_user_by_card_name(ctx.author.display_name, trade_info[6])                            
                            
                            
                            
                            db.remove_card_from_user_by_card_name(trade_info[10], trade_info[6])
                            db.remove_card_from_user_by_card_name(trade_info[8], trade_info[4])
                            
                            
                            # login_name, display_name, channel_name, card_id, card_name, acquired
                            
                            
                            db.insert_card_from_user_by_card_name(trade_info[10], trade_info[10], ctx.channel.name, 0, trade_info[4], 'trading')
                            db.insert_card_from_user_by_card_name(trade_info[8], trade_info[8], ctx.channel.name, 0, trade_info[6], 'trading')
                            
                            logging.info(f"Trade completed ✅ @{trade_info[10]} received {trade_info[4]} and {trade_info[8]} received {trade_info[6]}")
                            await ctx.send(f"Trade completed ✅ @{trade_info[10]} received {trade_info[4]} and {trade_info[8]} received {trade_info[6]}")
                        else:
                            logging.error(f"@{ctx.author.display_name} ERROR: updating trade")
                            await ctx.send(f"@{ctx.author.display_name} ERROR: updating trade")
                    else:
                        logging.error(f"@{ctx.author.display_name} ERROR: getting trade_info")
                        await ctx.send(f"@{ctx.author.display_name} ERROR: getting trade_info")
                else:
                    logging.info(f"@{ctx.author.display_name} User not found")
                    await ctx.send(f"@{ctx.author.display_name} User not found")
            else:
                logging.info(f"ERROR: user/target missing")
                #---------------------------------------------------------
                # Normaly we send a message, but it does not by default, just log it to console
                #---------------------------------------------------------                 
                #await ctx.send(f"Invalid command format. Usage: !trade @user mycard userscard. If a card name is multiple words, add quotes.")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !tradeyes command failed.")


    @commands.command(name='tradeno')
    async def tradeno(self, ctx: commands.Context, target=None) -> None:
        logging.info(f"!tradeno in the chat by: {ctx.author.display_name}")
        logging.info(f"Target: {target}")
        logging.info(f"Channel name: {ctx.channel.name}")
        try:
            if target is not None:
                exist_user = db.exist_user(target)
                logging.info(f"exist_user is: {exist_user}")
                if exist_user == True:
                    trade_info = db.fetch_trade(target, ctx.author.display_name)
                    logging.info(f"trade_info is: {trade_info}")
                    if trade_info is not None:
                        update = db.update_trade("rejected", str(datetime.now()), target, ctx.author.display_name)
                        if update == True:
                            logging.info(f"@{ctx.author.display_name} Trade was declined")
                            await ctx.send(f"@{ctx.author.display_name} Trade was declined")
                        else:
                            logging.error(f"@{ctx.author.display_name} ERROR: updating trade")
                            await ctx.send(f"@{ctx.author.display_name} ERROR: updating trade")
                    else:
                        logging.error(f"@{ctx.author.display_name} ERROR: getting trade_info or no trade found")
                        await ctx.send(f"@{ctx.author.display_name} ERROR: getting trade_info or no trade found")
                else:
                    logging.info(f"@{ctx.author.display_name} User not found")
                    await ctx.send(f"@{ctx.author.display_name} User not found")
            else:
                logging.info(f"ERROR: user/target missing")
                #---------------------------------------------------------
                # Normaly we send a message, but it does not by default, just log it to console
                #--------------------------------------------------------- 
                #await ctx.send(f"Invalid command format. Usage: !trade @user mycard userscard. If a card name is multiple words, add quotes.")
        except Exception as e:
            logging.error("ERROR: ",e)
            await ctx.send(f"@{ctx.author.display_name} ERROR: !tradeno command failed.")






    @commands.command(name='help')
    async def help(self, ctx: commands.Context) -> None:
        logging.info(f"!help in the chat by: {ctx.author.display_name}")
        await ctx.send(f"@{ctx.author.display_name} You can view the list of commands which this bot supports here: ")


    @commands.command()
    async def sctime(self, ctx: commands.Context) -> None:
        logging.info(f"!sctime in the chat by: {ctx.author.display_name}")
        await ctx.send(f"@{ctx.author.display_name} the current time in Streamer-Cards is: {datetime.now(timezone.utc).astimezone(pytz.timezone('Europe/Brussels')).strftime('%A %d %B %Y %I:%M %p')}")

    #---------------------------------------------------------
    # Block any ! commands we dont need in chat
    #---------------------------------------------------------
    async def event_command_error(self, ctx, error: Exception):
        return


if __name__ == "__main__":

    conf_options = process_config_file()
    channel_names = []
    
    for channel in conf_options["APP"]["ACCOUNTS"]:
        channel_names.append("#" + channel["name"])
        logging.info(f"listening to channel: {channel["name"]}")

    data = {
        "client_id": conf_options["APP"]["CLIENT_ID"],
        "client_secret": conf_options["APP"]["CLIENT_SECRET"],
        "grant_type": "refresh_token",
        "refresh_token": conf_options["APP"]["REFRESH_TOKEN"],
    }
    response = requests.post("https://id.twitch.tv/oauth2/token", data=data)
    response_data = response.json()
    conf_options["APP"]["ACCESS_TOKEN"] = response_data["access_token"]
    conf_options["APP"]["REFRESH_TOKEN"] = response_data["refresh_token"]

    with open("config.yaml", "w") as stream:
        yaml.dump(conf_options, stream)

    twitch_bot = TwitchBot(
        access_token=conf_options["APP"]["ACCESS_TOKEN"],
        client_secret=conf_options["APP"]["CLIENT_SECRET"],
        prefix="!",
        initial_channels=channel_names,
        conf_options=conf_options,
    )

    twitch_bot.loop.create_task(twitch_bot.tinit())
    twitch_bot.loop.create_task(twitch_bot.connect())

    try:
        twitch_bot.loop.run_forever()
        twitch_bot.loop.run_until_complete(twitch_bot.stop())
    except GracefulExit:
        twitch_bot.loop.run_until_complete(twitch_bot.stop())
        sys.exit(0)