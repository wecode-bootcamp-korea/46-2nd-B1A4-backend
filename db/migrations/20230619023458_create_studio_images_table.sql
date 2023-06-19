-- migrate:up
CREATE TABLE `studio_images` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `studio_id` int NOT NULL,
  `image` varchar(1000) NOT NULL
);

-- migrate:down
DROP TABLE `studio_images`
