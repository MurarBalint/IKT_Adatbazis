1. Listázd ki azokat a vevőket akiknek tudjuk, hogy google.com-os az email címük.
SELECT *
FROM vasarlo
WHERE email LIKE "%_google.com";

2. Listázd ki az összes audi autót a típusával és gyártási évével.
SELECT tipus, gyartasiev
FROM auto_tipus
WHERE marka = "Audi";

3. Listázd ki azoknak az autóknak a rendszámát amik 2M és 5M összeg közözzött megtalálhatóak a piacon.
SELECT rendszam, ar
FROM autok
WHERE ar >= 2000000 && ar <= 5000000;

4.Kik azok a vásárlók akik neve pontosan 10 karakter, szóközt is beleértve.
SELECT *
FROM vasarlo
WHERE CHAR_LENGTH(nev) = 10;

5. Kik azok az autó tulajdonosok akik Debrecenben laknak.
SELECT *
FROM elado JOIN varos ON elado.hely_id = varos.id && varos.nev = "Debrecen";

6. Az eladókat rendezd ABC sorrendbe a nevük alapján
SELECT *
FROM Elado
ORDER BY nev;

7. Listázd ki, hogy mely márlák készültek 2002-ben, ne szerepeljen egy márka kétszer.
SELECT DISTINCT marka
FROM auto_tipus
WHERE gyartasiev = 2016;

8. A BMW autómárka 15%-kal drágult frissítsd-e szerint az adatbázist.
UPDATE autok JOIN auto_tipus ON autok.tipus_id = auto_tipus.id && marka = "BMW"
SET ar = ar * 1.15;

9. A JTEBU5JR0B5191511 alvázszámú gépjárművet kivonták a forgalomból, töröld az egész rekordot.
DELETE autok, auto_tipus
FROM autok JOIN auto_tipus ON autok.tipus_id = auto_tipus.id
WHERE autok.alvazszam = "JTEBU5JR0B5191511";

10. A 35594412841 telefonszámó vásárló lakhelyet változtatott így ismeretlenné vált az.
UPDATE vasarlo
SET lakhely_id= null
WHERE telefonszam = 35594412841;

11. Számítsd ki, hogy az egyes autók hány éve kászültek, majd rendezd őket növekvő sorrendbe.
SELECT *, YEAR(CURRENT_DATE()) - auto_tipus.gyartasiev AS évesek
FROM autok JOIN auto_tipus ON autok.tipus_id = auto_tipus.id
ORDER BY évesek ASC;

12. Módosítsd Jenelle Jenton nevú eladó emailcímét 
UPDATE Elado
SET email = "jenelle.jenton@gmail.com"
WHERE nev = "Jenelle Jenton";

13. Listázd ki azokat az audikat amik 5milliónál drágábbak
SELECT *
FROM autok JOIN auto_tipus ON autok.tipus_id = auto_tipus.id
WHERE auto_tipus.marka = "Audi" && ar>5000000;

14. Írj egy lekérdezést, amely megadja, hogy minden városban hány vásárló van az adatbázisban.
SELECT v.nev AS Varos, COUNT(*) AS VasarlokSzama
FROM Varos v
LEFT JOIN Vasarlo va ON v.id = va.lakhely_id
GROUP BY v.nev;

15. Írj egy lekérdezést, amely meghatározza a legdrágább autót az adatbázisban, és kiírja annak minden részletét.
SELECT auto.*
FROM Autok auto
INNER JOIN (
    SELECT MAX(ar) AS MaxAr
    FROM Autok
) max_ar ON auto.ar = max_ar.MaxAr;