-- migrate:up
ALTER TABLE `studios`
ADD `average_rating` float NULL

-- migrate:down
DROP TABLE `studios`

