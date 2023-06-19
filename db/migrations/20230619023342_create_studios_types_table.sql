-- migrate:up
CREATE TABLE `studio_types` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `studio_type` varchar(200)
);

-- migrate:down
DROP TABLE `studios_types`
