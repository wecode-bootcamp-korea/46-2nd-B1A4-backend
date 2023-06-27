-- migrate:up
ALTER TABLE booking_list
ADD CONSTRAINT uc_time_slot UNIQUE (time_slot),
ADD CONSTRAINT uc_booking_date UNIQUE (booking_date);

-- migrate:down
DROP TABLE booking_list;
