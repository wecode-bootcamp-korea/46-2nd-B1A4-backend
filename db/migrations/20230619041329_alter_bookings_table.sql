-- migrate:up
ALTER TABLE `bookings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `bookings` ADD FOREIGN KEY (`booking_status_id`) REFERENCES `booking_status` (`id`);

-- migrate:down
DROP TABLE `bookings`
