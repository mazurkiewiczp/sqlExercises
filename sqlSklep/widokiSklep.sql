create view DostepneProdukty
as
    select p.opis, p.cena, p.ile_dostepnych, r.nazwa
    from Produkty p
        join Producenci r on p.id_producenta = r.id_producenta
    where p.ile_dostepnych > 0;

create view ProduktyKategoriiGitary
as
    select p.opis, p.cena, r.nazwa
    from Produkty p
        join Producenci r on p.id_producenta = r.id_producenta
        join Kategorie k on p.id_kategorii = k.id_kategorii
    where k.id_kategorii = 'Gitary';

create view ListaProducentów
as
    select r.nazwa, r.telefon, a.ulica, a.kod_pocztowy, a.miasto
    from Producenci r
        join Adresy a on r.id_adresu = a.id_adresu 