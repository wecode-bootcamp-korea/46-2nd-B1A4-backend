-- migrate:up
ALTER TABLE `studios`
MODIFY COLUMN `average_rating` DECIMAL(2,1)

-- migrate:down
DROP TABLE studios