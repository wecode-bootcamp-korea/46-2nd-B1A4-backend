-- migrate:up
ALTER TABLE `studios`
ADD COLUMN `studio_number` VARCHAR(500);

-- migrate:down
DROP TABLE `studios`
