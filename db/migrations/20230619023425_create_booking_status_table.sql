-- migrate:up
CREATE TABLE `booking_status` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `booking_status` varchar(200) NOT NULL
);

-- migrate:down
DROP TABLE `booking_status`