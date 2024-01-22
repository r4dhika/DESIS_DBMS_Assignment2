CREATE TABLE user(
	id int NOT NULL PRIMARY KEY,
    name varchar(100),
    phone_number varchar(10),
    gender varchar(100),
    age int,
    pincode int
);

ALTER TABLE user
ADD FOREIGN KEY (pincode) REFERENCES location(pincode);

CREATE TABLE location(
	pincode int,
    city varchar(100),
    state varchar(100),
    country varchar(100),
    bus_stop varchar(100)
);

ALTER TABLE location
ADD PRIMARY KEY (pincode);

CREATE TABLE bus(
	id int,
    source_location int,
    destination_location int,
    bus_number varchar(100),
    total_seats int,
    departure_time datetime,
    arrival_time datetime
);

ALTER TABLE bus
ADD FOREIGN KEY (source_location) REFERENCES location(pincode);
ALTER TABLE bus
ADD FOREIGN KEY (destination_location) REFERENCES location(pincode);

ALTER TABLE bus
ADD PRIMARY KEY (id);

CREATE TABLE seat(
	id int,
    seat_number int,
    bus_id int,
    seat_type varchar(100),
    seat_price int
);

ALTER TABLE seat
ADD PRIMARY KEY (id);

ALTER TABLE seat
ADD FOREIGN KEY (bus_id) REFERENCES bus(id);

CREATE TABLE trip(
	id int,
    bus_number int,
    boarding int,
    destination int,
    insurance bool,
    departure_date_time datetime,
    arrival_date_time datetime,
    checkin_status bool
);

ALTER TABLE trip
ADD PRIMARY KEY (id);

ALTER TABLE trip
ADD FOREIGN KEY (bus_number) REFERENCES bus(id);
ALTER TABLE trip
ADD FOREIGN KEY (boarding) REFERENCES location(pincode);
ALTER TABLE trip
ADD FOREIGN KEY (destination) REFERENCES location(pincode);

CREATE TABLE ticket(
	id int,
    ticket_number int,
    ticket_price int,
    payment_id int,
    coupon_code int,
    discount int
);

ALTER TABLE ticket
ADD PRIMARY KEY (id);

ALTER TABLE ticket
ADD FOREIGN KEY (coupon_code) REFERENCES offer(coupon_code);

CREATE TABLE payment(
	id int,
    payment_mode varchar(100),
    payment_status varchar(100),
    ticket_id int
);

ALTER TABLE payment
ADD PRIMARY KEY (id);

ALTER TABLE payment
ADD FOREIGN KEY (ticket_id) REFERENCES ticket(id);

CREATE TABLE offer(
	coupon_code varchar(6),
    offer_name varchar(100),
    offer_description varchar(300)
);

ALTER TABLE offer
ADD PRIMARY KEY (coupon_code);

ALTER TABLE offer
MODIFY COLUMN coupon_code int;

CREATE TABLE route(
	id int,
    route_source int,
	route_destination int
);

ALTER TABLE route
ADD PRIMARY KEY (id);

ALTER TABLE route
ADD FOREIGN KEY (route_source) REFERENCES location(pincode);

ALTER TABLE route
ADD FOREIGN KEY (route_destination) REFERENCES location(pincode);

CREATE TABLE bus_goes_through(
    bus_id int,
    route_id int
);

ALTER TABLE bus_goes_through
ADD PRIMARY KEY (bus_id, route_id);

ALTER TABLE bus_goes_through
ADD FOREIGN KEY (bus_id) REFERENCES bus(id);

ALTER TABLE bus_goes_through
ADD FOREIGN KEY (bus_id) REFERENCES route(id);






