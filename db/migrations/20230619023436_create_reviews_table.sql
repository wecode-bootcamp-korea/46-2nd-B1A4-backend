-- migrate:up
CREATE TABLE `reviews` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `review_content` text NULL,
  `rating` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE `reviews`
