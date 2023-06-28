-- migrate:up
ALTER TABLE `studios`
DROP FOREIGN KEY `studios_ibfk_1`;

-- migrate:down
DROP TABLE `studios`
