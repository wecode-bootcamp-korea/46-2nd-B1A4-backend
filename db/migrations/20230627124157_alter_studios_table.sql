-- migrate:up
ALTER TABLE `studios`
ADD COLUMN `address_city` VARCHAR(255);

-- migrate:down
DROP TABLE `studios`
