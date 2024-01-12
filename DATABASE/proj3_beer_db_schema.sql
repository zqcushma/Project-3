-- Creating the States table with StateID as the primary key
CREATE TABLE "States" (
    "StateID" varchar(2) PRIMARY KEY NOT NULL,
    "StateName" varchar(20) NOT NULL,
    "GeoCenterLat" float NOT NULL,
    "GeoCenterLong" float NOT NULL
);

-- Creating the StatesCensusData table with a composite primary key and a foreign key referencing States
CREATE TABLE "StatesCensusData" (
    "StateID" varchar(2) NOT NULL,
    "Year" smallint NOT NULL,
    "MalePop21Older" int NOT NULL,
    "FemalePop21Older" int NOT NULL,
    PRIMARY KEY ("StateID", "Year"),
    FOREIGN KEY ("StateID") REFERENCES "States" ("StateID")
);

-- Creating the QuarterlyProduction table with a composite primary key and a foreign key referencing States
CREATE TABLE "QuarterlyProduction" (
    "StateID" varchar(2) NOT NULL,
    "Year" smallint NOT NULL,
    "Quarter" varchar(2) NOT NULL,
    "TotalQuarterProd" float,
    "TaxableBottlesCansProd" float,
    "TaxableKegsProd" float,
    "TaxablePremUseProd" float,
    "TaxFreeExportProd" float,
    "TaxFreePremUseProd" float,
    "StocksOnHand" float,
    PRIMARY KEY ("StateID", "Year", "Quarter"),
    FOREIGN KEY ("StateID") REFERENCES "States" ("StateID")
);

-- Creating the AnnualCraftProduction table with a composite primary key
CREATE TABLE "AnnualCraftProduction" (
    "Year" smallint NOT NULL,
    "BreweryCat" varchar(20) NOT NULL,
    "AnnualCraftProductionAmount" int NOT NULL,
    PRIMARY KEY ("Year", "BreweryCat")
);

-- Creating the AnnualCraftBreweryCounts table with a composite primary key
CREATE TABLE "AnnualCraftBreweryCounts" (
    "Year" smallint NOT NULL,
    "BreweryCat" varchar(20) NOT NULL,
    "BreweryCounts" smallint,
    PRIMARY KEY ("Year", "BreweryCat")
);

-- Creating the AnnualStateCraftProduction table with a composite primary key and a foreign key referencing States
CREATE TABLE "AnnualStateCraftProduction" (
    "StateID" varchar(2) NOT NULL,
    "Year" smallint NOT NULL,
    "AnnualCraftStateProdAmount" int,
    PRIMARY KEY ("StateID", "Year"),
    FOREIGN KEY ("StateID") REFERENCES "States" ("StateID")
);

-- Creating the AnnualTTBStatePermitCount table with a composite primary key and a foreign key referencing States
CREATE TABLE "AnnualTTBStatePermitCount" (
    "StateID" varchar(2) NOT NULL,
    "Year" smallint NOT NULL,
    "StateTTBPermitCount" smallint,
    PRIMARY KEY ("StateID", "Year"),
    FOREIGN KEY ("StateID") REFERENCES "States" ("StateID")
);