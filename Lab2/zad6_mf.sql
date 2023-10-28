-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-28 15:20:46.508

-- tables
-- Table: Magazyn
CREATE TABLE Magazyn (
    MagazynID int  NOT NULL,
    Adres varchar(50)  NOT NULL,
    Kraj varchar(50)  NOT NULL,
    CONSTRAINT Magazyn_pk PRIMARY KEY  (MagazynID)
);

-- Table: Produkt
CREATE TABLE Produkt (
    ProduktID int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    Marka varchar(50)  NOT NULL,
    DataWpr date  NOT NULL,
    DataWyp date  NOT NULL,
    CONSTRAINT Produkt_pk PRIMARY KEY  (ProduktID)
);

-- Table: StanMagaznowy
CREATE TABLE StanMagaznowy (
    StanID int  NOT NULL,
    DataStanu date  NOT NULL,
    LiczbaProduktow int  NOT NULL,
    Produkt_ProduktID int  NOT NULL,
    Magazyn_MagazynID int  NOT NULL,
    CONSTRAINT StanMagaznowy_pk PRIMARY KEY  (StanID)
);

-- foreign keys
-- Reference: StanMagaznowy_Magazyn (table: StanMagaznowy)
ALTER TABLE StanMagaznowy ADD CONSTRAINT StanMagaznowy_Magazyn
    FOREIGN KEY (Magazyn_MagazynID)
    REFERENCES Magazyn (MagazynID);

-- Reference: StanMagaznowy_Produkt (table: StanMagaznowy)
ALTER TABLE StanMagaznowy ADD CONSTRAINT StanMagaznowy_Produkt
    FOREIGN KEY (Produkt_ProduktID)
    REFERENCES Produkt (ProduktID);

-- End of file.

