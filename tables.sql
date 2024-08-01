CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;

CREATE TABLE IF NOT EXISTS authors(
    author_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (author_id),
    UNIQUE KEY (name)
);

CREATE TABLE IF NOT EXISTS books (
    isbn INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(512) DEFAULT NULL,
    author_id INT NOT NULL DEFAULT 0,
    PRIMARY KEY (isbn),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id INT NOT NULL AUTO_INCREMENT,
    isbn INT NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (review_id),
    Foreign Key (isbn) REFERENCES books(isbn) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS member_cards (
    card_number INT NOT NULL AUTO_INCREMENT,
    issued_date DATE NOT NULL,
    expiry_date DATE DEFAULT NULL,    
    PRIMARY KEY (card_number)
);

CREATE TABLE IF NOT EXISTS members (
    member_id INT NOT NULL AUTO_INCREMENT,
    card_number INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    postal_code INT NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    PRIMARY KEY(member_id),
    Foreign Key (card_number) REFERENCES member_cards(card_number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS telephone (
    member_id INT NOT NULL,
    tel_no VARCHAR(15) NOT NULL,
    PRIMARY KEY (tel_no, member_id),
    Foreign Key (member_id) REFERENCES members(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT NOT NULL AUTO_INCREMENT,
    supervisor_id INT DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    nic VARCHAR(15) NOT NULL,
    PRIMARY KEY (employee_id),
    UNIQUE KEY (nic)
    -- Foreign Key (supervisor_id) REFERENCES employees(supervisor_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS working_schedule (
    schedule_id INT NOT NULL AUTO_INCREMENT,
    employee_id INT NOT NULL,
    schedule VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (schedule_id),
    Foreign Key (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS borrowing (
    borrowing_id INT NOT NULL AUTO_INCREMENT,
    issued_date DATETIME NOT NULL,
    due_date DATE NOT NULL,
    isbn INT NOT NULL,
    employee_id INT NOT NULL,
    member_id INT NOT NULL,
    PRIMARY KEY (borrowing_id),
    Foreign Key (isbn) REFERENCES books(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign Key (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign Key (member_id) REFERENCES members(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);



