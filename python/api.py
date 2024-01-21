from flask import Flask, jsonify
from sqlalchemy import create_engine, Column, String, Integer, Float, ForeignKey
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy.ext.declarative import declarative_base

app = Flask(__name__)

# Configure SQLAlchemy
dbName = 'Project_3'
DATABASE_URL = 'postgresql://postgres:postgres@localhost:5432/' + dbName
engine = create_engine(DATABASE_URL)
Base = declarative_base()
Session = sessionmaker(bind=engine)

# Define SQLAlchemy models
class State(Base):
    __tablename__ = 'States'

    StateID = Column(String(2), primary_key=True)
    StateName = Column(String(20), nullable=False)
    GeoCenterLat = Column(Float, nullable=False)
    GeoCenterLong = Column(Float, nullable=False)

    quarterly_productions = relationship('QuarterlyProduction', back_populates='state')

class QuarterlyProduction(Base):
    __tablename__ = 'QuarterlyProduction'

    StateID = Column(String(2), ForeignKey('States.StateID'), primary_key=True)
    Year = Column(Integer, primary_key=True)
    Quarter = Column(String(2), primary_key=True)
    TotalQuarterProd = Column(Float)
    TaxableBottlesCansProd = Column(Float)
    TaxableKegsProd = Column(Float)
    TaxablePremUseProd = Column(Float)
    TaxFreeExportProd = Column(Float)
    TaxFreePremUseProd = Column(Float)
    StocksOnHand = Column(Float)

    state = relationship('State', back_populates='quarterly_productions')

# Create tables in the database
Base.metadata.create_all(engine)

@app.route('/get_data')
def get_data():
    session = Session()
    results = session.query(QuarterlyProduction, State).join(State, QuarterlyProduction.StateID == State.StateID).all()
    
    data = []
    for quarterly_prod, state in results:
        data.append({
            'StateID': state.StateID,
            'Year': quarterly_prod.Year,
            'Quarter': quarterly_prod.Quarter,
            'TotalQuarterProd': quarterly_prod.TotalQuarterProd,
            'TaxableBottlesCansProd': quarterly_prod.TaxableBottlesCansProd,
            'TaxableKegsProd': quarterly_prod.TaxableKegsProd,
            'TaxablePremUseProd': quarterly_prod.TaxablePremUseProd,
            'TaxFreeExportProd': quarterly_prod.TaxFreeExportProd,
            'TaxFreePremUseProd': quarterly_prod.TaxFreePremUseProd,
            'StocksOnHand': quarterly_prod.StocksOnHand,
        })

    session.close()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
