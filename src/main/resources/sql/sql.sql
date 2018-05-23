
USE bookStore;

CREATE TABLE user (
  id INT(10) NOT NULL AUTO_INCREMENT,
  userName VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  phone INT(11),
  PRIMARY KEY(id)
)engine = InnoDB default charset=utf8;

CREATE TABLE category (
  id INT(10) NOT NULL AUTO_INCREMENT,
  categoryName VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
)engine = InnoDB default charset=utf8;

CREATE TABLE book (
  id INT(10) NOT NULL AUTO_INCREMENT,
  bookName VARCHAR(255) NOT NULL,
  description VARCHAR(5000) NOT NULL,
  remainNum INT(5) NOT NULL DEFAULT 0,
  price DOUBLE NOT NULL,
  categoryId INT(10) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT book_category FOREIGN KEY(categoryId)
    REFERENCES category(id)
)engine=InnoDB default charset=utf8;

CREATE TABLE t_order (
  id INT(10) NOT NULL AUTO_INCREMENT,
  address VARCHAR(500) NOT NULL default '',
  userId INT(10) NOT NULL,
  totalPrice DOUBLE NOT NULL,
  state INT(1) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT order_user FOREIGN KEY(userId)
    REFERENCES user(id)
)engine=innoDB default charset=utf8;

CREATE TABLE orderItem (
  id INT(10) NOT NULL AUTO_INCREMENT,
  bookId INT(10) NOT NULL,
  num INT(3) NOT NULL default 1,
  orderId INT(10) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT orderItem_book FOREIGN KEY(bookId)
    REFERENCES book(id),
  CONSTRAINT orderItem_order FOREIGN KEY(orderId)
    REFERENCES t_order(id)
)engine=InnoDB default charset=utf8;

CREATE TABLE afterService (
  id INT(10) NOT NULL AUTO_INCREMENT,
  userId INT(10) NOT NULL,
  orderId INT(10) NOT NULL,
  bookId INT(10) NOT NULL,
  num INT(5) NOT NULL default 1,
  type INT(1) NOT NULL,
  reason VARCHAR(5000),
  PRIMARY KEY(id),
  CONSTRAINT afterService_user FOREIGN KEY(id)
    REFERENCES user(id),
  CONSTRAINT afterService_order FOREIGN KEY(id)
    REFERENCES t_order(id),
  CONSTRAINT afterService_book FOREIGN KEY(id)
    REFERENCES book(id)
);