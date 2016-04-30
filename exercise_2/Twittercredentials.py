import tweepy

consumer_key = "bV985WyS90dJWqeZAJd3dfYS1";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "8nysCFtuSAVvm4AKNyEDhulF3cXYIFqvtVwezi9fedRX0MQj57";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "711260480115900416-1pXjqwT7ynTqy6PpkgW3TQJsZWhVvCO";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "Rufe41gni6fcOCnAwSOiIycXF4BJnenKSrDTuMyQsGfqs";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
