-- migrate:up
ALTER TABLE `studios`
DROP COLUMN `host_id`;

-- migrate:down
DROP TABLE `studios`
