-- migrate:up
ALTER TABLE `review_images` ADD FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`);

-- migrate:down
DROP TABLE `review_images`
