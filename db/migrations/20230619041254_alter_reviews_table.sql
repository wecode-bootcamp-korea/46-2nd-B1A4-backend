-- migrate:up
ALTER TABLE `reviews` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

-- migrate:down
DROP TABLE `reviews`
