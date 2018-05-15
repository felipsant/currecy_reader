from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey
from sqlalchemy import DateTime, Integer, Numeric, String


Base = declarative_base()


class Currency(Base):
    __tablename__ = "currency"
    id = Column(Integer, primary_key=True)
    name = Column(String(50), unique=True)
    code = Column(String(3), unique=True)
    stopGetValue = Column(DateTime, nullable=True)


class CurrencyValue(Base):
    __tablename__ = "currency_value"
    id = Column(Integer, primary_key=True)
    timestamp = Column(DateTime)
    value = Column(Numeric(10,6))
    currencyId = Column(Integer, ForeignKey('currency.id'))
