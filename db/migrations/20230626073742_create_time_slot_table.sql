-- migrate:up
CREATE TABLE `time_slot` (
  `id` int PRIMARY KEY NOT NULL,
  `time` varchar(200)
)

-- migrate:down
DROP TABLE `time_slot`
