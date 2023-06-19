-- migrate:up
ALTER TABLE `payments` ADD FOREIGN KEY (`payment_status_id`) REFERENCES `payment_status` (`id`);
ALTER TABLE `payments` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
-- migrate:down
DROP TABLE `payments`
