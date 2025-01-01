from twitchio.ext import commands


class BasicCommandsCog(commands.Cog):
    def __init__(self, twitch_bot: commands.Cog) -> None:
        self.twitch_bot = twitch_bot



    @commands.command(name='burn')
    async def burn(self, ctx: commands.Context, card_name: str) -> None:
        logging.info(f"!burn in the chat by: {ctx.author.display_name}")
        logging.info(f"Card name: {card_name}")
        try:
            exist = db.fetch_one_card_from_user(ctx.author.display_name, card_name)
            logging.debug(f"Exist: {exist}")
            if exist is not None:
                logging.info(f"| Card id: {exist[0]}")
                added = db.add_points(ctx.author.display_name, conf_options["APP"]["BURN_POINTS"])
                if added == True:
                    remove = db.remove_card_from_user(ctx.author.display_name, exist[0])
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
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !burn command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !burn command failed.")



    @commands.command(name='collection')
    async def collection(self, ctx: commands.Context) -> None:
        logging.info(f"!collection in the chat by: {ctx.author.display_name}")
        try:
            count = db.count_all_cards_from_user(ctx.author.display_name)
            if count is not None:
                logging.info(f"@{ctx.author.display_name} You have {count['row_count']} cards.")
                await ctx.send(f"@{ctx.author.display_name} You have {count['row_count']} cards.")
            else:
                logging.error(f"@{ctx.author.display_name} ERROR getting your account cards")
                await ctx.send(f"@{ctx.author.display_name} ERROR getting your account cards")
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !collection command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !collection command failed.")



    @commands.command(name='collectionrank')
    async def collectionrank(self, ctx: commands.Context) -> None:
        logging.info(f"!collectionrank in the chat by: {ctx.author.display_name}")
        try:
            rank = db.fetch_collectionrank(ctx.author.display_name)
            if rank is not None:
                all_users = db.count_all_users()
                if all_users is not None:
                    logging.info(f"@{ctx.author.display_name} You are {rank['rank']} out of {all_users['all_users']} collectors.")
                    await ctx.send(f"@{ctx.author.display_name} You are {rank['rank']} out of {all_users['all_users']} collectors.")
                else:
                    logging.error(f"@{ctx.author.display_name} ERROR: counting users")
                    await ctx.send(f"@{ctx.author.display_name} ERROR: counting users")
            else:
                logging.error(f"@{ctx.author.display_name} ERROR getting user rank")
                await ctx.send(f"@{ctx.author.display_name} ERROR getting user rank")
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !collectionrank command failed.")
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
                    logging.info(f"| {ctx.author.display_name} has {USER_POINTS} points.")
                    #---------------------------------------------------------
                    # Does the user have enough points?
                    #---------------------------------------------------------
                    if USER_POINTS >= 7:
                        logging.info(f"| {ctx.author.display_name} has more of equal then 7 points.")
                        logging.info(f"| Channel name is: {ctx.channel.name}")
                        #---------------------------------------------------------
                        # Get a random card
                        #---------------------------------------------------------
                        random_card = db.get_points(ctx.channel.name)
                        #---------------------------------------------------------
                        # Check if we have a card or not
                        #---------------------------------------------------------
                        if random_card is not None:
                            CARD_ID = result2[0]
                            CARD_NAME = result2[1]
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
                                if insert_user_card == True:
                                    logging.info(f"@{ctx.author.display_name} You got {CARD_NAME}.")
                                    await ctx.send(f"@{ctx.author.display_name} You got {CARD_NAME}.")
                                else:
                                    logging.error(f"{ctx.author.display_name} ERROR: inserting card")
                                    await ctx.send(f"@{ctx.author.display_name} ERROR: nserting card")
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
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !drop command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !drop command failed.")



    @commands.command(name='lurkarts')
    async def lurkarts(self, ctx: commands.Context) -> None:
        logging.info(f"!lurkarts in the chat by: {ctx.author.display_name}")
        logging.info(f"Channel name is: {ctx.channel.name}")
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
                    await ctx.send(f"@{ctx.author.display_name}  added to the queue")
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
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !lurkarts command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !lurkarts command failed.")



    @commands.command(name='queue')
    async def queue(self, ctx: commands.Context) -> None:
        logging.info(f"!queue in the chat by: {ctx.author.display_name}")
        logging.info(f"Channel name is: {ctx.channel.name}")
        try:
            users = db.fetch_all_queue_users(ctx.channel.name)
            if users is not None:
                # Extract usernames into a list
                usernames = [user['display_name'] for user in QUEUE_USERS]
                # Join usernames with comma and space
                users_string = ", ".join(usernames)
                logging.info(f"@{ctx.author.display_name} Current viewers: {users_string}")
                await ctx.send(f"@{ctx.author.display_name} Current viewers: {users_string}")
            else:
                logging.info(f"@{ctx.author.display_name} No viewers in the queue.")
                await ctx.send(f"@{ctx.author.display_name} No viewers in the queue.")
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !queue command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !queue command failed.")



    @commands.command(name='trade')
    async def trade(self, ctx: commands.Context, target: str, mycard: str, other_card: str,) -> None:
        logging.info(f"!trade in the chat by: {ctx.author.display_name}")
        logging.info(f"Target: "+target)
        logging.info(f"Mycard: "+mycard)
        logging.info(f"Other_card: "+other_card)
        logging.info(f"Channel name: {ctx.channel.name}")
        try:
            exist_user = db.exist_user(ctx.author.display_name)
            if exist_user is not None:
                target_card_exist = db.exist_card(target, other_card)
                if target_card_exist is not None:
                    my_card_exist = db.exist_card(target, other_card)
                    if my_card_exist is not None:
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
        except:
            logging.error(f"@{ctx.author.display_name} ERROR: !trade command failed.")
            await ctx.send(f"@{ctx.author.display_name} ERROR: !trade command failed.")



    @commands.command(name='help')
    async def help(self, ctx: commands.Context) -> None:
        logging.info(f"!help in the chat by: {ctx.author.display_name}")
        await ctx.send(f"@{ctx.author.display_name} You can view the list of commands which this bot supports here:.")



    @commands.command()
    async def sctime(self, ctx: commands.Context) -> None:
        logging.info(f"!sctime in the chat by: {ctx.author.display_name}")
        await ctx.send(f"@{ctx.author.display_name} the current time in Streamer-Cards is: {datetime.now(timezone.utc).astimezone(pytz.timezone('Europe/Brussels')).strftime('%A %d %B %Y %I:%M %p')}")



def prepare(twitch_bot: commands.Bot) -> None:
    twitch_bot.add_cog(BasicCommandsCog(twitch_bot))
