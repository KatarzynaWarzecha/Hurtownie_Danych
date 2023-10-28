-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-28 15:07:38.588

-- tables
-- Table: Pracownik
CREATE TABLE Pracownik (
    PracownikID int  NOT NULL,
    Pesel numeric(11,0)  NOT NULL,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    Adres varchar(50)  NOT NULL,
    Wnagrodzenia_ZdarzenieID int  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY  (PracownikID)
);

-- Table: Wnagrodzenia
CREATE TABLE Wnagrodzenia (
    ZdarzenieID int  NOT NULL,
    PracownikID int  NOT NULL,
    DataZdarzenia date  NOT NULL,
    Wynagrodzenie numeric(10,2)  NOT NULL,
    Ocena int  NOT NULL,
    CONSTRAINT Wnagrodzenia_pk PRIMARY KEY  (ZdarzenieID)
);

-- Table: scd4
CREATE TABLE scd4 (
    PracownikID int  NOT NULL,
    DataZdarzenia int  NOT NULL,
    obecne int  NOT NULL,
    ZdarzenieID int  NOT NULL,
    Wnagrodzenia_ZdarzenieID int  NOT NULL,
    CONSTRAINT scd4_pk PRIMARY KEY  (ZdarzenieID)
);

-- foreign keys
-- Reference: Pracownik_Wnagrodzenia (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Wnagrodzenia
    FOREIGN KEY (Wnagrodzenia_ZdarzenieID)
    REFERENCES Wnagrodzenia (ZdarzenieID);

-- Reference: scd4_Wnagrodzenia (table: scd4)
ALTER TABLE scd4 ADD CONSTRAINT scd4_Wnagrodzenia
    FOREIGN KEY (Wnagrodzenia_ZdarzenieID)
    REFERENCES Wnagrodzenia (ZdarzenieID);

-- End of file.

