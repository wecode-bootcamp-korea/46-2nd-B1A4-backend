-- migrate:up
ALTER TABLE `likes`
ADD COLUMN `liked` BOOLEAN NOT NULL DEFAULT false;

-- migrate:down
DROP TABLE `likes`
