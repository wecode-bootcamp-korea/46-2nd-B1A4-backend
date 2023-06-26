-- migrate:up
ALTER TABLE `booking_list`
ADD COLUMN `booking_date` DATE,
ADD COLUMN `time_slot` INT,
DROP COLUMN `start_time`,
DROP COLUMN `end_time`;

ALTER TABLE `booking_list`
ADD CONSTRAINT `fk_booking_list_time_slot`
FOREIGN KEY (`time_slot`) REFERENCES `time_slot` (`id`);

-- migrate:down
DROP TABLE `booking_list`