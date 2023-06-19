-- migrate:up
ALTER TABLE `studios` ADD FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`);
ALTER TABLE `studios` ADD FOREIGN KEY (`studio_type_id`) REFERENCES `studio_types` (`id`);
ALTER TABLE `studios` ADD FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`);
ALTER TABLE `studios` ADD FOREIGN KEY (`studio_category_id`) REFERENCES `studio_category` (`id`);

-- migrate:down
DROP TABLE `studios
