CREATE DATABASE reto_bookshop;

USE reto_bookshop;

CREATE TABLE roles(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	role_id INT NOT NULL,
    
    FOREIGN KEY (role_id) REFERENCES roles(id)
);
    
CREATE TABLE authors(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100)
);
    
CREATE TABLE books(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50),
    author_id INT NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE book_favourite(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    UNIQUE KEY user_book_unique (user_id, book_id)
);

CREATE TABLE loans(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATETIME NOT NULL DEFAULT current_timestamp,
    due_date DATETIME NOT NULL,
    return_date DATETIME ON UPDATE current_timestamp,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    UNIQUE KEY user_book_unique (user_id, book_id, loan_date)
);

