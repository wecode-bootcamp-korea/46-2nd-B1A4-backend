-- migrate:up
ALTER TABLE `hosts`
DROP COLUMN `overall_rating`;

-- migrate:down
DROP TABLE `hosts`
