CREATE INDEX idx_borrowing_member_id ON borrowing (member_id);


ALTER TABLE members ADD COLUMN email VARCHAR(100) DEFAULT NULL AFTER date_of_birth;
