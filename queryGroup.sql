-- 1.Conta gli ospiti raggruppandoli per anno di nascita
    SELECT YEAR(`date_of_birth`) AS 'Anno di nascita', COUNT(`id`) AS 'ospiti_totali'
	FROM `ospiti` 
	GROUP BY YEAR(`date_of_birth`); 


-- 2.Somma i prezzi dei pagamenti raggruppandoli per status
    SELECT `status`, SUM(`price`) 
	FROM `pagamenti`
	GROUP BY `status`;


-- 3.Conta quante volte è stata prenotata ogni stanza
     SELECT `stanza_id` AS 'Numero camera', COUNT(`id`) AS `pren_totali`
	 FROM `prenotazioni`
	 GROUP BY `stanza_id`
     ORDER BY `pren_totali`


-- 4.Fai un' analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti
    SELECT HOUR(`created_at`) as `ora`, COUNT(`id`)
    FROM `prenotazioni`
    GROUP BY `ora`


-- 5.Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!)
    SELECT `ospite_id`, COUNT(`id`) AS `prenotazioni`
	FROM `prenotazioni_has_ospiti`
	GROUP BY `ospite_id`
	ORDER BY COUNT(`id`) DESC
	LIMIT 1;