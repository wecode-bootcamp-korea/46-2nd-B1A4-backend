-- migrate:up
ALTER TABLE users MODIFY COLUMN birth_date DATE NULL;
ALTER TABLE users MODIFY COLUMN phone_number varchar(32) NULL;
ALTER TABLE users MODIFY COLUMN password varchar(200) NULL;

-- migrate:down
DROP TABLE users