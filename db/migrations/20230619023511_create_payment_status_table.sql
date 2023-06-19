-- migrate:up
CREATE TABLE `payment_status` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(200) NOT NULL
);

-- migrate:down
DROP TABLE `payment_status`
