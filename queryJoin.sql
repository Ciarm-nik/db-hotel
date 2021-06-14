-- 1.Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
	SELECT `ospiti`.`name`, `ospiti`.`lastname`, 
	 COUNT(`prenotazioni_has_ospiti` .`prenotazione_id`) AS `numero_prenotazioni`
	FROM `prenotazioni_has_ospiti`
	LEFT JOIN `ospiti`
	  ON `prenotazioni_has_ospiti`.`ospite_id` = `ospiti`.`id`
	GROUP BY `ospiti` .`id`
	HAVING `numero_prenotazioni` > 2


-- 2.Stampare tutti gli ospiti per ogni prenotazione
    SELECT `prenotazioni_has_ospiti`.
           `prenotazione_id`, 
           `ospiti`.`name`, 
           `ospiti`.`lastname`
	FROM `prenotazioni_has_ospiti`
	LEFT JOIN `ospiti`
	       ON `prenotazioni_has_ospiti`.
        `ospite_id` = `ospiti`.`id`


-- 3.Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
  SELECT `pagamenti`.`pagante_id`, `paganti`.`name`, `paganti`.`lastname`, `pagamenti`.`price`
	FROM `pagamenti`
	JOIN `paganti`
	  ON `pagamenti`.`pagante_id` = `paganti`.`id`
	WHERE MONTH(`pagamenti`.`created_at`) = '05'
	AND YEAR(`pagamenti`.`created_at`) = '2018'


-- 4.Fai la somma di tutti i prezzi delle prenotazioniper le stanze delprimo piano
   SELECT SUM(`pagamenti` .`price`) AS `prezzo_totale`
   FROM `pagamenti`
   LEFT JOIN `prenotazioni`
          ON `prenotazioni` .`id` = `pagamenti` . `prenotazione_id`
   LEFT JOIN `stanze`
          ON `prenotazioni` .`stanza_id` = `stanze` .`id`
	WHERE `stanze` . `floor` = 1	  		  


-- 5.Prendi i dati di fatturazione per la prenotazionecon id=7
   SELECT * 
   FROM `pagamenti`
   LEFT JOIN `paganti`
       ON `pagamenti` .`pagante_id` = `paganti` . `id`
   WHERE `pagamenti` .`prenotazione_id` = 7


-- 6.Le stanze sono state tutte prenotate almeno una volta?(Visualizzare le stanze non ancora prenotate) 
	SELECT * 
	FROM `stanze`
	LEFT JOIN `prenotazioni` 
	       ON `prenotazioni`.`stanza_id` = `stanze`.`id`
	WHERE `prenotazioni`.`stanza_id` IS NULL