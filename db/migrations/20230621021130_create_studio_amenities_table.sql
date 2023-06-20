-- migrate:up
CREATE TABLE `studio_amenities` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `studio_id` int,
  `amenity_id` int
);

-- migrate:down
DROP TABLE `studio_amenities`
