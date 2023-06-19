-- migrate:up
ALTER TABLE `amenities` ADD FOREIGN KEY (`id`) REFERENCES `studios` (`amenities_id`);

-- migrate:down
DROP TABLE `amenities`
