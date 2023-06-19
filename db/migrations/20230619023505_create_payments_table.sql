-- migrate:up
CREATE TABLE `payments` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `total_price` dec(10, 2) NOT NULL,
  `payment_status_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE `payments`
