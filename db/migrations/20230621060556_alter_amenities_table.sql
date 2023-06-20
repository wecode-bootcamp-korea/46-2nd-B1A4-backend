-- migrate:up
ALTER TABLE amenities DROP FOREIGN KEY amenities_ibfk_1;

-- migrate:down
DROP TABLE amenities;
