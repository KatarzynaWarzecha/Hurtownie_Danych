-- Created by Vertabelo (http://vertabelo.com)
-- tables
-- Table: FaktySprzedaz
CREATE TABLE FaktySprzedaz (
    DataSprzedazy date  NOT NULL,
    Produkt_ProduktID int  NOT NULL,
    Klient_KlientID int  NOT NULL,
    FirmaKurierska_FirmaID int  NOT NULL,
    CONSTRAINT FaktySprzedaz_pk PRIMARY KEY  (DataSprzedazy)
);

-- Table: FirmaKurierska
CREATE TABLE FirmaKurierska (
    FirmaID int  NOT NULL,
    NIP int  NOT NULL,
    Adres varchar(50)  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CONSTRAINT FirmaKurierska_pk PRIMARY KEY  (FirmaID)
);

-- Table: Klient
CREATE TABLE Klient (
    KlientID int  NOT NULL,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    Adres varchar(50)  NOT NULL,
    Telefon int  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY  (KlientID)
);

-- Table: Produkt
CREATE TABLE Produkt (
    ProduktID int  NOT NULL,
    Wydawca varchar(50)  NOT NULL,
    ISBN int  NOT NULL,
    Tytul varchar(50)  NOT NULL,
    Autor varchar(50)  NOT NULL,
    LiczbaStron int  NOT NULL,
    CONSTRAINT Produkt_pk PRIMARY KEY  (ProduktID)
);

-- foreign keys
-- Reference: FaktySprzedaz_FirmaKurierska (table: FaktySprzedaz)
ALTER TABLE FaktySprzedaz ADD CONSTRAINT FaktySprzedaz_FirmaKurierska
    FOREIGN KEY (FirmaKurierska_FirmaID)
    REFERENCES FirmaKurierska (FirmaID);

-- Reference: FaktySprzedaz_Klient (table: FaktySprzedaz)
ALTER TABLE FaktySprzedaz ADD CONSTRAINT FaktySprzedaz_Klient
    FOREIGN KEY (Klient_KlientID)
    REFERENCES Klient (KlientID);

-- Reference: FaktySprzedaz_Produkt (table: FaktySprzedaz)
ALTER TABLE FaktySprzedaz ADD CONSTRAINT FaktySprzedaz_Produkt
    FOREIGN KEY (Produkt_ProduktID)
    REFERENCES Produkt (ProduktID);

-- End of file.

