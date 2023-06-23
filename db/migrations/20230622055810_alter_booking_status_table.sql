-- migrate:up
ALTER TABLE `booking_status` DROP FOREIGN KEY `booking_status_ibfk_1`;

-- migrate:down
DROP TABLE `booking_status`
