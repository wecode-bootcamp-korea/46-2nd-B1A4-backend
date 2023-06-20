-- migrate:up
ALTER TABLE studio_category
ADD COLUMN icon_img VARCHAR(1000);

-- migrate:down
DROP TABLE studio_category
