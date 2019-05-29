create procedure DodajKlienta
    (@id_adresu smallint = null,
    @nazwa varchar(64),
    @mail varchar(64),
    @telefon varchar(12) = null)
as
insert into Klienci
    (id_adresu, nazwa, mail, telefon)
values
    (@id_adresu, @nazwa, @mail, @telefon)


create procedure DodajProducenta
    (@nazwa varchar(64),
    @id_adresu smallint = null,
    @telefon varchar(12) = null)
as
insert into Producenci
    (nazwa, id_adresu, telefon)
values
    (@nazwa, @id_adresu, @telefon)


create procedure DodajProdukt
    (@cena int,
    @id_producenta smallint = null,
    @ile_dostepnych int = null,
    @opis varchar(64),
    @id_kategorii varchar(64) = null)
as
insert into Produkty
    (cena,id_producenta, ile_dostepnych,
    opis, id_kategorii)
values
    (@cena, @id_producenta, @ile_dostepnych, @opis, @id_kategorii)


create procedure EdytujProdukt
    (@id_produktu smallint,
    @cena int = null,
    @id_producenta smallint = null,
    @ile_dostepnych int = null,
    @opis varchar(64) = null,
    @id_kategorii varchar(64) = null)
as
begin
    update Produkty
	set cena = ISNULL(@cena,cena),
		id_producenta = ISNULL(@id_producenta, id_producenta),
		ile_dostepnych = ISNULL(@ile_dostepnych, ile_dostepnych),
		opis = ISNULL(@opis, opis),
		id_kategorii = ISNULL(@id_kategorii, id_kategorii)
	where @id_produktu = id_produktu
end


create procedure EdytujKlienta
    (@id_klienta smallint,
    @id_adresu smallint = null,
    @nazwa varchar(64) = null,
    @mail varchar(64) = null,
    @telefon varchar(12) = null)
as
begin
    update Klienci
	set id_adresu = ISNULL(@id_adresu,id_adresu),
		nazwa = ISNULL(@nazwa, nazwa),
		mail = ISNULL(@mail, mail),
		telefon = ISNULL(@telefon, telefon)
	where @id_klienta = id_klienta
end