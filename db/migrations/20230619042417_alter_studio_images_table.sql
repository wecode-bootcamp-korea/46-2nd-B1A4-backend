-- migrate:up
ALTER TABLE `studio_images` ADD FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`);

-- migrate:down
DROP TABLE `studio_images`
