-- migrate:up
ALTER TABLE studios DROP FOREIGN KEY studios_ibfk_3;

-- migrate:down
DROP TABLE studios;
