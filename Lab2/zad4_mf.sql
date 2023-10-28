-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-28 14:40:58.769

-- tables
-- Table: Czas
CREATE TABLE Czas (
    CzasID int  NOT NULL,
    Data date  NOT NULL,
    Godzina int  NOT NULL,
    Miesiac int  NOT NULL,
    CONSTRAINT Czas_pk PRIMARY KEY  (CzasID)
);

-- Table: KategoriaOwocu
CREATE TABLE KategoriaOwocu (
    KategoriaOwocu int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CONSTRAINT KategoriaOwocu_pk PRIMARY KEY  (KategoriaOwocu)
);

-- Table: Klient
CREATE TABLE Klient (
    KlientID int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    NIP int  NOT NULL,
    Adres varchar(50)  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY  (KlientID)
);

-- Table: MiejsceSprzedazy
CREATE TABLE MiejsceSprzedazy (
    MiejsceID int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CONSTRAINT MiejsceSprzedazy_pk PRIMARY KEY  (MiejsceID)
);

-- Table: Owoc
CREATE TABLE Owoc (
    OwocID int  NOT NULL,
    Nazwa varchar(50)  NOT NULL,
    CenaKg numeric(10,2)  NOT NULL,
    KategoriaOwocu_KategoriaID int  NOT NULL,
    CONSTRAINT Owoc_pk PRIMARY KEY  (OwocID)
);

-- Table: ZamowieniaOwocow
CREATE TABLE ZamowieniaOwocow (
    ZamowienieID int  NOT NULL,
    IloscZamowionych numeric(10,2)  NOT NULL,
    KwotaZamowienia numeric(10,2)  NOT NULL,
    MiejsceSprzedazy_MiejsceID int  NOT NULL,
    Czas_CzasID int  NOT NULL,
    Klient_KlientID int  NOT NULL,
    Owoc_OwocID int  NOT NULL,
    CONSTRAINT ZamowieniaOwocow_pk PRIMARY KEY  (ZamowienieID)
);

-- foreign keys
-- Reference: Owoc_KategoriaOwocu (table: Owoc)
ALTER TABLE Owoc ADD CONSTRAINT Owoc_KategoriaOwocu
    FOREIGN KEY (KategoriaOwocu_KategoriaID)
    REFERENCES KategoriaOwocu (KategoriaOwocu);

-- Reference: ZamowieniaOwocow_Czas (table: ZamowieniaOwocow)
ALTER TABLE ZamowieniaOwocow ADD CONSTRAINT ZamowieniaOwocow_Czas
    FOREIGN KEY (Czas_CzasID)
    REFERENCES Czas (CzasID);

-- Reference: ZamowieniaOwocow_Klient (table: ZamowieniaOwocow)
ALTER TABLE ZamowieniaOwocow ADD CONSTRAINT ZamowieniaOwocow_Klient
    FOREIGN KEY (Klient_KlientID)
    REFERENCES Klient (KlientID);

-- Reference: ZamowieniaOwocow_MiejsceSprzedazy (table: ZamowieniaOwocow)
ALTER TABLE ZamowieniaOwocow ADD CONSTRAINT ZamowieniaOwocow_MiejsceSprzedazy
    FOREIGN KEY (MiejsceSprzedazy_MiejsceID)
    REFERENCES MiejsceSprzedazy (MiejsceID);

-- Reference: ZamowieniaOwocow_Owoc (table: ZamowieniaOwocow)
ALTER TABLE ZamowieniaOwocow ADD CONSTRAINT ZamowieniaOwocow_Owoc
    FOREIGN KEY (Owoc_OwocID)
    REFERENCES Owoc (OwocID);

-- sequences
-- Sequence: Czas_seq
CREATE SEQUENCE Czas_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: KategoriaOwocu_seq
CREATE SEQUENCE KategoriaOwocu_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Klient_seq
CREATE SEQUENCE Klient_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: MiejsceSprzedazy_seq
CREATE SEQUENCE MiejsceSprzedazy_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Owoc_seq
CREATE SEQUENCE Owoc_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: ZamowieniaOwocow_seq
CREATE SEQUENCE ZamowieniaOwocow_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

