-- migrate:up
ALTER TABLE `likes`
ADD CONSTRAINT `unique_user_studio`
UNIQUE (user_id, studio_id);

-- migrate:down
DROP TABLE likes
