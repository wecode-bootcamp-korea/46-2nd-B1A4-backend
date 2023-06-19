-- migrate:up
CREATE TABLE `studio_category` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `category_name` varchar(500)
);

-- migrate:down
DROP TABLE `studio_category`
