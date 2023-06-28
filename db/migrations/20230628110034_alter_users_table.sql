-- migrate:up
ALTER TABLE `users`
DROP FOREIGN KEY `users_ibfk_1`;

-- migrate:down
DROP TABLE `users`
