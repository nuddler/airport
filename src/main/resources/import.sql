INSERT INTO role (id, name) VALUES ('1', 'ADMIN');
INSERT INTO role (id, name) VALUES ('2', 'USER');
-- admin/admin
INSERT INTO user (id,password,username,activated,email) VALUES (1,'$2a$10$8qzEk1El3Nyonz5c9gxaNOTysnb0fmHPdofNjfmwE6qg76P9Nrrui','admin',1,'dlugosz.bartlomiej@gmail.com');
-- user1/user1
INSERT INTO user (id,password,username,activated) VALUES (2,'$2a$10$..Krg/Q4Ezmmi6wg63mXOuOgLe3Jp.2HDrzMxRxtCIcbAvnlckEyC','user1',1);

INSERT INTO user_role (user_id,role_id) VALUES (1,1);
INSERT INTO user_role (user_id,role_id) VALUES (1,2);

INSERT INTO user_role (user_id,role_id) VALUES (2,2);