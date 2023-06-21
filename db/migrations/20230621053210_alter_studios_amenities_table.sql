-- migrate:up
ALTER TABLE `studio_amenities` ADD FOREIGN KEY (`amenity_id`) REFERENCES `amenities_options` (`id`);
ALTER TABLE `studio_amenities` ADD FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`);

-- migrate:down
DROP TABLE studio_amenities
