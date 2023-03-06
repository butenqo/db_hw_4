
SELECT genre.name, count(performer.name) FROM genre 
JOIN performer_genre ON genre.genre_id = performer_genre.genre_id
JOIN performer ON performer.performer_id = performer_genre.performer_id
GROUP  BY genre.name;

SELECT COUNT(track_id) FROM track
JOIN album ON album.album_id = track.album_id
WHERE released_year > 2018;

SELECT album.name, avg(duration) FROM track
RIGHT JOIN album ON album.album_id = track.album_id 
GROUP BY album.name;

SELECT performer.name FROM performer
WHERE performer.name NOT IN  (
SELECT performer.name FROM performer
JOIN album_performer ON performer.performer_id = album_performer.performer_id 
JOIN album ON album.album_id = album_performer.album_id 
WHERE released_year = 2020);

SELECT complitation.name FROM complitation
JOIN track_complitation  ON complitation.complitation_id = track_complitation.complitation_id 
JOIN track ON track.track_id = track_complitation.track_id 
JOIN album ON album.album_id = track.album_id 
JOIN album_performer ON album_performer.album_id = album.album_id
JOIN performer ON album_performer.performer_id = performer.performer_id
WHERE performer.name LIKE '%2Pac%';

SELECT album.name  FROM performer_genre
JOIN performer  ON performer.performer_id = performer_genre.performer_id
JOIN album_performer  ON album_performer.performer_id = performer.performer_id
JOIN album ON album.album_id = album_performer.album_id
GROUP  BY album.name
HAVING count(performer_genre.genre_id) > 1;

SELECT track.name FROM track
LEFT JOIN track_complitation ON track.track_id = track_complitation.track_id
WHERE complitation_id IS NULL;

SELECT performer.name FROM performer
JOIN album_performer  ON album_performer.performer_id = performer.performer_id
JOIN album ON album.album_id = album_performer.album_id
JOIN track ON track.album_id = album.album_id 
WHERE duration = (SELECT min(duration) FROM track);

SELECT album.name, COUNT(track.name) track_count FROM album 
JOIN track ON album.album_id = track.album_id
GROUP BY album.album_id
HAVING COUNT(track.name) = (  
	SELECT COUNT(track.name) FROM album
	JOIN track ON album.album_id = track.album_id
	GROUP BY album.album_id
	ORDER BY COUNT(track.name)
	LIMIT 1 );
	