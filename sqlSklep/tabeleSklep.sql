create table pracownicy.Stanowiska
(
    id_stanowiska smallint identity(1,1) primary key,
    opis varchar(64) not null,
    dział varchar(64),
    pensja int not null
)

create table pracownicy.Pracownicy
(
    id_pracownika smallint identity(1,1) primary key,
    imie varchar(64) not null,
    nazwisko varchar(64) not null,
    id_stanowiska smallint foreign key references pracownicy.Stanowiska(id_stanowiska),
    telefon varchar(12),
    mail varchar(64)
)

create table Adresy
(
    id_adresu smallint identity(1,1) primary key,
    ulica varchar(64) not null,
    miasto varchar(64) not null,
    kod_pocztowy varchar(6) not null
)

create table Klienci
(
    id_klienta smallint identity(1,1) primary key,
    id_adresu smallint foreign key references Adresy(id_adresu),
    nazwa varchar(64) not null,
    mail varchar(64) not null,
    telefon varchar(12)
)

create table Producenci
(
    id_producenta smallint identity(1,1) primary key,
    nazwa varchar(64) not null,
    id_adresu smallint foreign key references Adresy(id_adresu),
    telefon varchar(12)
)

create table Platnosci
(
    id_platnosci smallint identity(1,1) primary key,
    data datetime not null
)

create table Kategorie
(
    id_kategorii varchar(64) primary key,
    opis_kategorii varchar(64)
)

create table Produkty
(
    id_produktu smallint identity(1,1) primary key,
    cena int not null,
    id_producenta smallint foreign key
        references Producenci(id_producenta),
    ile_dostepnych int,
    opis varchar(64) not null,
    id_kategorii varchar(64) foreign key
        references Kategorie(id_kategorii)
)

create table Zamowienia
(
    id_zamowienia smallint identity(1,1) primary key,
    id_produktu smallint foreign key
        references Produkty(id_produktu),
    id_klienta smallint foreign key
        references Klienci(id_klienta),
    komentarz varchar(256),
    id_platnosci smallint foreign key
        references Platnosci(id_platnosci),
    id_pracownika smallint foreign key
        references pracownicy.Pracownicy(id_pracownika)
)