-- migrate:up
ALTER TABLE `users`
DROP COLUMN `host_id`;

-- migrate:down
DROP TABLE `users`

