create trigger sprawdzAdresEmail
on Klienci
for insert 
as 
declare @mail varchar(64)
select @mail = mail
from inserted
if @mail not like '%_@__%.__%'
begin
    rollback
    raiserror('Nieprawidlowy adres email, example@domain.com',1,2)
end


--trigger zapisujący zmiany zachodzące w tabeli Produkty w tabeli Historia.
create trigger historiaProdukty on Produkty
after insert, update, delete
as
declare @type char(1) 
set @type = null
if exists (select *
from inserted)
begin
    if exists (select *
    from deleted)
    begin
        set @type = 'U'
    end
    else
    begin
        set @type = 'I'
    end
    insert into Historia
        (typ, data, id_produktu, cena, id_producenta, ile_dostepnych,
        opis, id_kategorii)
    select @type, GETDATE(), id_produktu, cena, id_producenta,
        ile_dostepnych, opis, id_kategorii
    from inserted
end
else if exists (select *
from deleted)
begin
    set @type = 'D'
    insert into Historia
        (typ, data, id_produktu, cena, id_producenta, ile_dostepnych,
        opis, id_kategorii)
    select @type, GETDATE(), id_produktu, cena, id_producenta,
        ile_dostepnych, opis, id_kategorii
    from deleted
end