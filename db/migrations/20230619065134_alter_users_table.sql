-- migrate:up
ALTER TABLE `users` ADD FOREIGN KEY (`host_id`) REFERENCES `hosts` (`id`)

-- migrate:down
DROP TABLE `users`

