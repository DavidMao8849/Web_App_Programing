USE mysns;

INSERT INTO user VALUES("kim@abc.com", "111", "김시민", "010-1234-5679", now());
INSERT INTO user VALUES("lee@abc.com", "111", "이순신", "010-1234-5677", now());
INSERT INTO user VALUES("kwon@abc.com", "111", "권율", "010-1234-5768", now());

INSERT INTO feed(id, content) VALUES("kim@abc.com", "Hello");
INSERT INTO feed(id, content) VALUES("kwon@abc.com", "Aloha");

