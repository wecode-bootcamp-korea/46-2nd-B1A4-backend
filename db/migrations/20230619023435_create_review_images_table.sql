-- migrate:up
CREATE TABLE `review_images` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `image` varchar(1000) NOT NULL
);

-- migrate:down
DROP TABLE `review_images`
