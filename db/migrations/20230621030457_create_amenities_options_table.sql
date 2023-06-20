-- migrate:up
CREATE TABLE `amenities_options` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `icon_img` varchar(1000) NOT NULL
);

-- migrate:down

