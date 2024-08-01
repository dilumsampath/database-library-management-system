INSERT INTO authors (name, description) VALUES 
('sample author 1', 'this is sample author 1. he is a very good man'),
('J.K. Rowling', 'British author, best known for the Harry Potter series.'),
('George R.R. Martin', 'American novelist and short-story writer, known for "A Song of Ice and Fire" series.'),
('J.R.R. Tolkien', 'English writer, poet, and philologist, known for "The Hobbit" and "The Lord of the Rings".'),
('Agatha Christie', 'English writer known for her sixty-six detective novels and fourteen short story collections.'),
('Stephen King', 'American author of horror, supernatural fiction, suspense, and fantasy novels.'),
('Isaac Asimov', 'American writer and professor of biochemistry, known for his works of science fiction and popular science.'),
('Jane Austen', 'English novelist known primarily for her six major novels, including "Pride and Prejudice" and "Sense and Sensibility".'),
('Ernest Hemingway', 'American novelist, short-story writer, and journalist. Known for works like "The Old Man and the Sea".'),
('Mark Twain', 'American writer, humorist, entrepreneur, publisher, and lecturer. Known for "The Adventures of Tom Sawyer" and "Adventures of Huckleberry Finn".'),
('F. Scott Fitzgerald', 'American novelist and short story writer, widely known for his novel "The Great Gatsby".')
-- ON DUPLICATE KEY UPDATE name = VALUES(name), description = VALUES(description)
;


INSERT INTO books (isbn, title, description, author_id) VALUES
(747532699, 'Harry Potter and the Philosopher\'s Stone', 'The first book in the Harry Potter series.', 1),
(553103540, 'A Game of Thrones', 'The first book in the "A Song of Ice and Fire" series.', 2),
(345339706, 'The Hobbit', 'A fantasy novel and children\'s book by J.R.R. Tolkien.', 3),
(007120840, 'Murder on the Orient Express', 'A detective novel by Agatha Christie.', 4),
(451169518, 'It', 'A horror novel by Stephen King.', 5),
(553283686, 'Foundation', 'The first book in the Foundation series by Isaac Asimov.', 6),
(141439518, 'Pride and Prejudice', 'A romantic novel by Jane Austen.', 7),
(684801223, 'The Old Man and the Sea', 'A short novel written by the American author Ernest Hemingway.', 8),
(486400778, 'The Adventures of Tom Sawyer', 'A novel about a young boy growing up along the Mississippi River.', 9),
(743273565, 'The Great Gatsby', 'A 1925 novel written by American author F. Scott Fitzgerald.', 10)
ON DUPLICATE KEY UPDATE isbn = VALUES(isbn), title = VALUES(title), description = VALUES(description), author_id = VALUES(author_id)
;

INSERT INTO reviews (isbn, rating, review) VALUES
(747532699, 5, 'This is a great book!'),
(553103540, 4, 'The plot of the book is interesting.'),
(345339706, 3, 'The book is not that bad.'),
(007120840, 2, 'The book is not that good.'),
(451169518, 1, 'The book is very bad.'),
(553283686, 5, 'This is a great book!'),
(141439518, 4, 'The plot of the book is interesting.'),
(684801223, 3, 'The book is not that bad.'),
(486400778, 2, 'The book is not that good.'),
(743273565, 1, 'The book is very bad.')
ON DUPLICATE KEY UPDATE isbn = VALUES(isbn), rating = VALUES(rating), review = VALUES(review)
;


INSERT INTO member_cards (card_number, issued_date, expiry_date) VALUES
(1, '2020-01-01', '2025-01-01'),
(2, '2020-01-01', '2025-01-01'),
(3, '2020-01-01', '2025-01-01')
ON DUPLICATE KEY UPDATE card_number = VALUES(card_number), issued_date = VALUES(issued_date), expiry_date = VALUES(expiry_date)
;

INSERT INTO members (member_id, card_number, name, date_of_birth, postal_code, street, city) VALUES
(1, 1, 'John Doe', '1990-01-01', 12345, '123 Main Street', 'Anytown'),
(2, 2, 'Jane Doe', '1995-01-01', 67890, '456 Elm Street', 'Othertown'),
(3, 3, 'Bob Smith', '1992-01-01', 34567, '789 Oak Street', 'Thistown')
ON DUPLICATE KEY UPDATE member_id = VALUES(member_id), card_number = VALUES(card_number), name = VALUES(name), date_of_birth = VALUES(date_of_birth), postal_code = VALUES(postal_code), street = VALUES(street), city = VALUES(city)
;

INSERT INTO telephone (member_id, tel_no) VALUES
(1, '012-345-6789'),
(2, '098-765-4321'),
(3, '555-123-4567')
ON DUPLICATE KEY UPDATE member_id = VALUES(member_id), tel_no = VALUES(tel_no)
;

INSERT INTO employees (employee_id, supervisor_id, name, nic) VALUES
(1, NULL, 'John Doe', '123456789'),
(2, 1, 'Jane Doe', '987654321'),
(3, 1, 'Bob Smith', '012345678')
ON DUPLICATE KEY UPDATE employee_id = VALUES(employee_id), supervisor_id = VALUES(supervisor_id), name = VALUES(name), nic = VALUES(nic)
;

INSERT INTO working_schedule (schedule_id, employee_id, schedule) VALUES
(1, 1, 'Monday to Friday, 9am to 5pm'),
(2, 2, 'Monday to Friday, 9am to 5pm'),
(3, 3, 'Monday to Friday, 9am to 5pm')
ON DUPLICATE KEY UPDATE schedule_id = VALUES(schedule_id), employee_id = VALUES(employee_id), schedule = VALUES(schedule)
;

INSERT INTO borrowing (borrowing_id, issued_date, due_date, isbn, employee_id, member_id) VALUES
(1, '2020-01-01 00:00:00', '2020-01-15', 747532699, 1, 1),
(2, '2020-01-01 00:00:00', '2020-01-15', 553103540, 2, 2),
(3, '2020-01-01 00:00:00', '2020-01-15', 345339706, 3, 3)
ON DUPLICATE KEY UPDATE borrowing_id = VALUES(borrowing_id), issued_date = VALUES(issued_date), due_date = VALUES(due_date), isbn = VALUES(isbn), employee_id = VALUES(employee_id), member_id = VALUES(member_id)
;
