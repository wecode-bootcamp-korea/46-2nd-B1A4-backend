-- migrate:up
ALTER TABLE `studios` DROP COLUMN `average_rating`

-- migrate:down
DROP TABLE `studios`