-- migrate:up
ALTER TABLE `studios`
DROP COLUMN `studio_number`;


-- migrate:down
DROP TABLE `studios`
