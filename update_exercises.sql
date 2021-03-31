USE codeup_test_db;
SELECT album_name FROM albums;
UPDATE albums SET sales = sales * 10;

SELECT release_date AS 'Released before 1980', album_name AS 'Album name' FROM albums WHERE release_date < 1980;
UPDATE albums SET release_date = 1800 WHERE release_date < 1980;

SELECT artist AS 'Artist', album_name AS 'Albums' FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';