-- migrate:up
ALTER TABLE `likes` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `likes` ADD FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`);

-- migrate:down
DROP TABLE `likes`