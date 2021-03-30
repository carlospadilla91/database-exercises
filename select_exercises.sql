USE codeup_test_db;
SELECT 'Pink Floyd' AS 'Albums by:';
SELECT album_name
       FROM albums
            WHERE artist = 'Pink Floyd';

SELECT 'Sgt. Peppers Lonely Hearts Club Band was released in' AS 'The Album:';
SELECT release_date
FROM albums
WHERE album_name = 'Sgt. Peppers Lonely Hearts Club Band';

SELECT 'Nevermind' AS 'Genre for';
SELECT genre
FROM albums
WHERE album_name = 'Nevermind';

SELECT 'Albums from 90s';
SELECT album_name
FROM albums
WHERE release_date > 1989 AND release_date < 2000;

SELECT 'Albums with sales less than 20m';
SELECT album_name
FROM albums
WHERE sales < 20;

SELECT 'Rock albums';
SELECT album_name
FROM albums
WHERE genre LIKE '%Rock%';