import requests
from datetime import timedelta, datetime
from . import engine
from models import Currency, CurrencyValue, Base
from . import session
ACCESS_KEY = ''  # https://currencylayer.com/
Base.metadata.create_all(engine)


def addNewCurrencyValue(url, debug=None):
    print url
    response = requests.get(url)
    objs = response.json()
    quotes = objs["quotes"]
    currencies = session.query(Currency).filter_by(stopGetValue=None).all()
    for currency in currencies: 
        newCurrencyValue = CurrencyValue(timestamp = datetime.utcfromtimestamp(objs['timestamp']).date(), value = quotes['USD' + currency.code], currencyId = currency.id)
        if session.query(CurrencyValue).filter_by(timestamp=newCurrencyValue.timestamp, currencyId=newCurrencyValue.currencyId).first() == None:
            session.add(newCurrencyValue)
    if debug == None:
        session.commit()


def run(parameter, debug=None):
    if parameter == 'c':
        #Get Currencies and register in table
        response = requests.get("http://apilayer.net/api/list?access_key=" + ACCESS_KEY + "&format=1")
        objs = response.json()
        print objs
        for currency in objs["currencies"]:
            stopGetValue = datetime.utcnow() if currency not in ["BRL","USD","EUR","ARS","BTC"] else None
            auxCurrency = Currency(code=currency, name=objs["currencies"][currency],stopGetValue=stopGetValue)
            if session.query(Currency).filter_by(code=auxCurrency.code).first() == None:
                session.add(auxCurrency)
        if debug == None:
            session.commit()
    elif parameter == 'h':
        #Get Historical Currency Values, 7 days.
        end_date = datetime.today()
        start_date = end_date - timedelta(days=7)
        delta = end_date - start_date
        for i in range(delta.days):
            date = (start_date + timedelta(days=i)).strftime("%Y-%m-%d")
            url = 'http://apilayer.net/api/historical?access_key=' + ACCESS_KEY + '&source=USD&format=1&date=' + date
            addNewCurrencyValue(url,debug=debug)
    elif parameter == 'k':
        #Get Historical Currency Values, 180 days.
        end_date = datetime.today()
        start_date = end_date - timedelta(days=180)
        delta = end_date - start_date
        for i in range(delta.days):
            date = (start_date + timedelta(days=i)).strftime("%Y-%m-%d")
            url = 'http://apilayer.net/api/historical?access_key=' + ACCESS_KEY + '&source=USD&format=1&date=' + date
            addNewCurrencyValue(url,debug=debug)
    else:
        url = 'http://apilayer.net/api/live?access_key=' + ACCESS_KEY + '&source=USD&format=1'
        addNewCurrencyValue(url,debug=debug)

#parse_args(sys.argv[1:])
