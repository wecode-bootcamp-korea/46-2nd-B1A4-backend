-- migrate:up
CREATE TABLE `bookings` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `booking_status_id` int NOT NULL,
  `booking_number` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE `bookings`