-- migrate:up
CREATE TABLE `hosts` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `is_super_host` boolean NOT NULL,
  `overall_rating` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE `hosts`