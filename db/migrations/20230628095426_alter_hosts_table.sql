-- migrate:up
ALTER TABLE `hosts`
CHANGE COLUMN `is_super_host` `is_host` BOOLEAN DEFAULT 0 NOT NULL;

-- migrate:down
DROP TABLE `hosts`
