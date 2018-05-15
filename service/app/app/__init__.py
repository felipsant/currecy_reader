from sqlalchemy import create_engine
from sqlalchemy.orm import Session
import os
MACHINE = os.getenv("MACHINE", 'localhost') #On production mariadb
DATABASE = os.getenv("DATABASE", 'santiagodb')
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://sc_admin:ark@34#67&@' + MACHINE + '/' + DATABASE + '?charset=utf8' #Your own MYSQL URL
engine = create_engine(SQLALCHEMY_DATABASE_URI)
session = Session(bind=engine)    