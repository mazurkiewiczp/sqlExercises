--zapytanie wyświetla wszystkie towary których zamówiono więcej niż jest dostępne na stanie (i wyświetlenie ile więcej).

select p.opis as 'produkt', t.ilość_zamówionych-p.ile_dostepnych as 'ile brakuje'
from (
    select count(z.id_produktu) as 'ilość_zamówionych', p.id_produktu
    from
        Produkty p
        join Zamowienia z on p.id_produktu = z.id_produktu
    group by p.id_produktu) as t

    join Produkty p on p.id_produktu = t.id_produktu