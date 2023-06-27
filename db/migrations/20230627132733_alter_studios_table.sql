-- migrate:up
ALTER TABLE `studios`
ADD COLUMN `address_neighborhood` VARCHAR(255);

-- migrate:down
DROP TABLE `studios`
