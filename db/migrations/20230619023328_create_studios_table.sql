-- migrate:up
CREATE TABLE `studios` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `host_id` int NOT NULL,
  `studio_name` varchar(500) NOT NULL,
  `studio_type_id` int NOT NULL,
  `studio_category_id` int NOT NULL,
  `amenities_id` int NOT NULL,
  `description` text NOT NULL,
  `address` varchar(500) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rules` text NOT NULL,
  `max_guests` int NOT NULL,
  `location_latitude` decimal(10, 8) NOT NULL,
  `location_longitude` decimal(11,8) NOT NULL
);

-- migrate:down
DROP TABLE `studios`