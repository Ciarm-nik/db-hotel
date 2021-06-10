-- 1.Conta gli ospiti raggruppandoli per anno di nascita
	SELECT COUNT(`id`), YEAR(`date_of_birth`) AS 'Anno di nascita' 
	FROM `ospiti` 
	GROUP BY YEAR(`date_of_birth`);


-- 2.Somma i prezzi dei pagamenti raggruppandoli per status
    SELECT status, SUM(`price`) 
	FROM `pagamenti`
	GROUP BY (status);


-- 3.Conta quante volte è stata prenotata ogni stanza
    SELECT `stanza_id` AS 'Numero camera', COUNT(`id`)
	FROM `prenotazioni`
	GROUP BY `stanza_id`;


-- 4.Fai un' analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti


-- 5.Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!)
    SELECT `ospite_id`, COUNT(`id`)
	FROM `prenotazioni_has_ospiti`
	GROUP BY `ospite_id`
	ORDER BY COUNT(`id`) DESC
	LIMIT 1;