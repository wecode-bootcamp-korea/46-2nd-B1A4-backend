-- migrate:up
CREATE TABLE `users` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `host_id` int NULL,
  `kakao_id` bigint NULL,
  `name` varchar(200) NOT NULL,
  `profile_image` varchar(1000) NULL,
  `email` varchar(200) NOT NULL UNIQUE,
  `password` varchar(200) NOT NULL,
  `phone_number` varchar(32) NOT NULL,
  `birth_date` DATE NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

-- migrate:down
DROP TABLE `users`
