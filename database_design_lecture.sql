CREATE DATABASE IF NOT EXISTS design_test_db;

USE design_test_db;

DROP TABLE IF EXISTS quote_topic;
DROP TABLE IF EXISTS quotes;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS authors;

CREATE TABLE quotes (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        author_first_name VARCHAR(50) DEFAULT 'NONE',
        author_last_name  VARCHAR(100) NOT NULL,
        content TEXT NOT NULL,
        PRIMARY KEY (id)
);

CREATE TABLE authors (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE quotes DROP COLUMN author_first_name;
ALTER TABLE quotes DROP COLUMN author_last_name;
ALTER TABLE quotes ADD COLUMN author_id INT UNSIGNED NOT NULL;
ALTER TABLE quotes ADD FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE NO ACTION ON UPDATE CASCADE;

INSERT INTO authors (first_name, last_name) VALUES
('Michael', 'Scott'),
('Kobe', 'Bryant');

select * from authors;

INSERT INTO quotes (author_id, content) VALUES
((select id from authors where first_name = 'Michael' and last_name = 'Scott'),
 'Wikipedia is the best thing ever. Anyone in the world can write anything they want about any subject so you know you are getting the best possible information.');

INSERT INTO quotes (author_id, content) VALUES
((select id from authors where first_name = 'Michael' and last_name = 'Scott'),
 'That''s what she said.');

INSERT INTO quotes (author_id, content) VALUES
((select id from authors where first_name = 'Michael' and last_name = 'Scott'),
 'I love inside jokes. I hope to be a part of one someday.');

INSERT INTO quotes (author_id, content) VALUES
((select id from authors where first_name = 'Kobe' and last_name = 'Bryant'),
 'The moment you give up, is the moment you let someone else win.');

INSERT INTO quotes (author_id, content) VALUES
((select id from authors where first_name = 'Kobe' and last_name = 'Bryant'),
 'Haters are a good problem to have. Nobody hates the good ones. They hate the great ones.');



select * from quotes;

select content
from quotes
where quotes.author_id in (
    select id
    from authors
    where first_name = 'Michael'
    );

select concat(a.first_name, ' ', a.last_name) as full_name, q.content as quotes
from authors a
join quotes q on a.id = q.author_id;

CREATE TABLE topics (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        name VARCHAR(255),
        PRIMARY KEY (id)
);

insert into topics (name) values
('Motivational');


CREATE TABLE quote_topic (
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

select * from quotes;
select * from topics;

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 2), (2, 3),
       (3, 2), (3, 3), (4, 1), (4, 7), (4, 8), (5, 1), (5, 7), (5,8);

select * from quote_topic;

select concat(first_name, ' ', last_name) as full_name, content as quotes, t.name as topic
from quotes q
join authors a on a.id = q.author_id
join quote_topic qt on q.id = qt.quote_id
join topics t on t.id = qt.topic_id
where t.name = 'sports';

select concat(a.first_name, ' ', a.last_name) as full_name
from authors a
join quotes q on a.id = q.author_id
join quote_topic qt on q.id = qt.quote_id
join topics t on qt.topic_id = t.id
where t.name = 'humor';