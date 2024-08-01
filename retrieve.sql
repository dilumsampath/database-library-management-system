SELECT * FROM members;
SELECT name, date_of_birth FROM members WHERE member_id=2;

SELECT name, city FROM members WHERE name LIKE "%do%";

SELECT isbn, title FROM books WHERE author_id = (
    SELECT author_id FROM authors WHERE name = 'George R.R. Martin'
); 

SELECT books.isbn, books.title, authors.name
FROM books
JOIN authors ON books.author_id = authors.author_id
WHERE authors.name = 'J.K. Rowling';

SELECT x.isbn, x.title, y.name
FROM books x
JOIN authors y ON x.author_id = y.author_id
WHERE y.name = 'J.K. Rowling';

SELECT x.isbn ISBN, x.title "Book Name", y.name Author
FROM books x
JOIN authors y ON x.author_id = y.author_id
WHERE y.name = 'J.K. Rowling';

SELECT x.isbn ISBN, x.title "Book Name", y.name Author
FROM books x
JOIN authors y ON x.author_id = y.author_id;

SELECT books.isbn, books.title, authors.name, reviews.rating, reviews.review
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN reviews ON books.isbn = reviews.isbn
WHERE authors.name = 'J.K. Rowling';

SELECT COUNT(*) FROM books;
SELECT COUNT(*) as num_books FROM books WHERE author_id=1;
SELECT author_id, COUNT(*) as num_books FROM books GROUP BY author_id;

SELECT reviews.isbn, books.title, COUNT(reviews.review_id) AS
review_count, AVG(reviews.rating) AS average_rating
FROM books
JOIN reviews ON books.isbn = reviews.isbn
GROUP BY reviews.isbn;

SELECT reviews.isbn, books.title, COUNT(reviews.review_id) AS
review_count, AVG(reviews.rating) AS average_rating
FROM books
JOIN reviews ON books.isbn = reviews.isbn
GROUP BY reviews.isbn, books.title;

SELECT books.isbn, books.title, reviews.rating FROM books
LEFT JOIN reviews ON books.isbn = reviews.isbn;

SELECT authors.author_id, authors.name, books.title FROM authors
LEFT JOIN books ON authors.author_id = books.author_id;

SELECT authors.author_id, authors.name, books.title FROM authors
RIGHT JOIN books ON authors.author_id = books.author_id;

SELECT authors.author_id, authors.name, books.title FROM books
LEFT JOIN authors ON authors.author_id = books.author_id;

SELECT authors.author_id, authors.name, books.title FROM books
RIGHT JOIN authors ON authors.author_id = books.author_id;

SELECT authors.author_id, authors.name, books.title FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
WHERE books.title IS NULL
;