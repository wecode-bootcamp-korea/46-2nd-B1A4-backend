-- migrate:up
ALTER TABLE `hosts`
DROP COLUMN `is_host`;

-- migrate:down
DROP TABLE `hosts`
