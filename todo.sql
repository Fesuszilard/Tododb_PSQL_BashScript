CREATE ROLE admin SUPERUSER LOGIN PASSWORD 'admin';

CREATE DATABASE tododb;
\c tododb;
CREATE TABLE "user" ( id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(50) NOT NULL);
CREATE TABLE todo ( id SERIAL NOT NULL PRIMARY KEY, task VARCHAR(100) NOT NULL , user_id INT REFERENCES "user"(id), done BOOLEAN );
 
INSERT INTO "user" (name) VALUES ('Dominic');
INSERT INTO "user" (name) VALUES ('Hamilton');
INSERT INTO "user" (name) VALUES ('Cassady');
INSERT INTO "user" (name) VALUES ('Jacob');
INSERT INTO "user" (name) VALUES ('Quinn');

INSERT INTO "todo" (task,user_id,done) VALUES ('Take out the thrash',5,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Buy eggs',1,FALSE);
INSERT INTO "todo" (task,user_id,done) VALUES ('50 pushups',2,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Relax',5,FALSE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Romantic dinner',5,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Meeting at 3pm',2,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Pick up mom at the airport',5,FALSE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Talk with Jerry',1,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Do the tax reports',4,TRUE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Order pizza for twelve',1,FALSE);
INSERT INTO "todo" (task,user_id,done) VALUES ('Prepare for presentation',1,TRUE);

