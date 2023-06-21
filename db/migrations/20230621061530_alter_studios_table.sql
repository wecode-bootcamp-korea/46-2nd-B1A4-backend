-- migrate:up
ALTER TABLE studios
DROP COLUMN amenities_id;

-- migrate:down
DROP TABLE studios;
