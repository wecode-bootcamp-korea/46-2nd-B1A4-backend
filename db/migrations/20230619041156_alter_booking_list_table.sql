-- migrate:up
ALTER TABLE `booking_list` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `booking_list` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);
ALTER TABLE `booking_list` ADD FOREIGN KEY (`studio_id`) REFERENCES `studios` (`id`);

-- migrate:down
DROP `booking_list`