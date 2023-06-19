-- migrate:up
ALTER TABLE `booking_status` ADD FOREIGN KEY (`id`) REFERENCES `bookings` (`booking_status_id`);

-- migrate:down
DROP TABLE `booking_status`
