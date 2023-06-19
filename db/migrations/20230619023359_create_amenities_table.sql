-- migrate:up
CREATE TABLE `amenities` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `wifi` boolean,
  `kitchen` boolean,
  `aircon` boolean,
  `heating` boolean,
  `meeting_room` boolean,
  `tv` boolean,
  `swimming_pool` boolean,
  `chair` boolean,
  `desk` boolean,
  `bath_tub` boolean,
  `refrigerator` boolean,
  `parking` boolean
);

-- migrate:down
DROP TABLE `amenities`
