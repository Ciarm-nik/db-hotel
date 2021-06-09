-- 1.Seleziona tutti gli ospiti che sono stati identificati con la carta diidentità

SELECT * FROM `ospiti` 
WHERE `document_type` = "CI";


-- 2.Seleziona tutti gli ospiti che sono nati dopo il 1988

SELECT * FROM `ospiti` 
WHERE `date_of_birth` >= 1988;


-- 3.Seleziona tutti gli ospiti che hanno più di 20anni(al momento dell’esecuzione della query)


-- 4.Seleziona tutti gli ospiti il cui nome inizia con la D


-- 5.Calcola il totale in cassato degli ordini accepted


-- 6.Qualè il prezz omassimo pagato?


-- 7.Seleziona gli ospiti riconosciuti con patente e nati nel 1975


-- 8.Quanti paganti sono ancheo spiti?


-- 9.Quanti posti letto ha l’hotel in totale?