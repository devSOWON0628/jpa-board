DROP TABLE IF EXISTS POST;
 
CREATE TABLE POST (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(45) NOT NULL,
writer VARCHAR(45) NOT NULL,
content text NULL,
time datetime NULL,
PRIMARY KEY (id));

INSERT INTO POST ( title , writer , content , time ) VALUES ( 'first data1first data1','first data1','first data1', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data222222222222','first data2','first data2', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data3333333333','first data3','first data3', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data44444444444','first data4','first data4', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data55555555555555','first data5','first data5', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data66666666666666','first data6','first data6', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data77777777777','first data7','first data7', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data88888888888','first data8','first data8', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data9999999999','first dat9','first data9', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data10101010101010','first data10','first data10', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data11111111111111','first data11','first data11', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data12121212121212','first data12','first data12', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data1313131313131313','first data13','first data13', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data14141414141414','first data13','first data13', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data1515151515151515','first data13','first data13', now());
INSERT INTO POST ( title , writer , content , time )VALUES ( 'first data1616161616161616','first data13','first data13', now());