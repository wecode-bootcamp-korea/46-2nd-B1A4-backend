-- migrate:up
ALTER TABLE `reviews` ADD FOREIGN KEY(`studio_id`) REFERENCES `studios` (`id`);

-- migrate:down
DROP TABLE `reviews`
