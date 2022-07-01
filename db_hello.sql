drop database if exists hello;
create database hello;
use hello;

drop table if exists comment;
drop table if exists post;
drop table if exists user;

create table user (
userID int NOT NULL AUTO_INCREMENT UNIQUE,
username varchar(64) NOT NULL UNIQUE,
password varchar(64) NOT NULL,
first_name varchar(64) NOT NULL,
middle_name varchar(64) NULL,
last_name varchar(64) NULL,
email varchar(128) NOT NULL UNIQUE,
birth_year int NOT NULL,
PRIMARY KEY (userID)
);

create table post(
postID int NOT NULL AUTO_INCREMENT UNIQUE,
userID int NOT NULL,
title varchar(128) NOT NULL,
content varchar(1024) NOT NULL,
date_create datetime NOT NULL,
karma int NOT NULL DEFAULT 0 NOT NULL,
PRIMARY KEY (postID),
FOREIGN KEY (userID) REFERENCES user(userID)
);

create table comment(
commentID int NOT NULL AUTO_INCREMENT UNIQUE,
postID int NOT NULL,
userID int NOT NULL,
parent_comment int NULL,
content varchar(1024) NOT NULL,
date_created datetime NOT NULL,
karma int NOT NULL DEFAULT 0 NOT NULL,
PRIMARY KEY (commentID),
FOREIGN KEY (postID) REFERENCES post(postID),
FOREIGN KEY (userID) REFERENCES user(userID)
);