-- migrate:up
CREATE TABLE `booking_list` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `studio_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `total_price` dec(10,2) NOT NULL,
  `total_guest` int NOT NULL
);


-- migrate:down
DROP TABLE `booking_list`
