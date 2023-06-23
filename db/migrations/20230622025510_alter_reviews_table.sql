-- migrate:up
ALTER TABLE `reviews`
ADD `studio_id` int NOT NULL

-- migrate:down
DROP TABLE `reviews`
