import os
os.environ["DATABASE"] = "test"
from app.app import run, session
from app.models import Currency, CurrencyValue
import pytest

@pytest.fixture
def test_db(request):
    def fin():
        session.rollback()
    request.addfinalizer(fin)

def test_currency_last7(test_db):
    get_currencies()
    get_currencies_values_7_days()
    
def test_currency_today(test_db):
    get_currencies()    
    get_currencies_values_today()

def get_currencies():
    run('c', debug=True)
    currencies = session.query(Currency).filter_by(stopGetValue=None).all()
    assert len(currencies) == 4

def get_currencies_values_7_days():
    run('h', debug=True)
    currencyValues = session.query(CurrencyValue).all()
    assert len(currencyValues) == 28        

def get_currencies_values_today():
    run(None, debug=True)
    currencyValues = session.query(CurrencyValue).all()
    assert len(currencyValues) == 4        
