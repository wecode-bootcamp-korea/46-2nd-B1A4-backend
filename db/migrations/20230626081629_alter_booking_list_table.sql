-- migrate:up
ALTER TABLE booking_list
DROP CONSTRAINT uc_time_slot,
DROP CONSTRAINT uc_booking_date,
ADD CONSTRAINT uc_time_slot_booking_date UNIQUE (time_slot, booking_date);

-- migrate:down
DROP TABLE booking_list;