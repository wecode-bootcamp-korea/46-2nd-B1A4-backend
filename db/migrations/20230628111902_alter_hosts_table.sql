-- migrate:up
ALTER TABLE `hosts`
ADD `studio_id` INT,
ADD `user_id` INT,
ADD FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`),
ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

-- migrate:down
DROP TABLE `hosts`
