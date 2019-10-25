/*  Execute this file from the command line by typing:
 *    mysql -u <USER> < schema.sql
 *    OR
 *    mysql -u <USER> -p < schema.sql
 *  For example, on a pairing station, it'll be
 *    mysql -u student -p < schema.sql
 *  and then you'll have to enter the password, student
 *  On your personal computer, if you haven't set up
 *  a password, it'll be
 *    mysql -u root < schema.sql
*/

DROP DATABASE IF EXISTS urbandiction;

CREATE DATABASE urbandiction;

USE urbandiction;

CREATE TABLE words (
  id int NOT NULL AUTO_INCREMENT,
  word varchar(20) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE visits (
  id int NOT NULL AUTO_INCREMENT,
  date varchar(150),
  word_id int,
  PRIMARY KEY (ID),
  FOREIGN KEY (word_id) REFERENCES words(id)
);

CREATE TABLE definitions (
  id int NOT NULL AUTO_INCREMENT,
  definition varchar(500),
  example varchar(500),
  hash_tags varchar(500),
  created_date varchar(150),
  created_by varchar(30),
  upvotes int,
  downvotes int,
  word_id int,
  PRIMARY KEY (ID),
  FOREIGN KEY (word_id) REFERENCES words(id)
);

-- INSERT INTO words (word) VALUES ('Yeet');
-- INSERT INTO words (word) VALUES ('Yeetster');
-- INSERT INTO visits (date, word_id) VALUES ("2017-08-02", 1);
-- INSERT INTO visits (date, word_id) VALUES ("2017-08-03", 1);
-- INSERT INTO definitions (definition, created_date, created_by, upvotes, downvotes, word_id) VALUES('To throw something', "2017-08-02", "Nick", 1, 1, 1);
-- INSERT INTO definitions (definition, created_date, created_by, upvotes, downvotes, word_id) VALUES('Person who yeets', "2017-08-02", "Nick", 1, 1, 2);
