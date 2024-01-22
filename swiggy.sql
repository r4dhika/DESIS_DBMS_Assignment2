CREATE TABLE user(
	id int,
    name varchar(100),
    phone int,
    location_id int,
    email varchar(100),
    premium bool
);

ALTER TABLE user
ADD FOREIGN KEY (location_id) REFERENCES location(id);

INSERT INTO user
VALUES ('1', 'radhika', '1', 'rdhk2004@gmail.com', '0', '9116117581');
INSERT INTO user
VALUES ('2', 'rishika', '2', 'abc@gmail.com', '1', '911634523x');
INSERT INTO user
VALUES ('3', 'ritvik', '2', 'abcd@gmail.com', '0', '911543523x');
INSERT INTO user
VALUES ('4', 'anushka', '3', 'xyz@gmail.com', '0', '98137x987x');

ALTER TABLE user
DROP COLUMN phone;

ALTER TABLE user
ADD phone varchar(10);

CREATE TABLE location(
	id int,
    line1 varchar(100),
    line2 varchar(100),
    city varchar(100),
    state varchar(100),
    pincode int
);
SELECT * FROM location;

INSERT INTO location
VALUES ('1', '135', 'xyx colony', 'abc', 'rajasthan', '324010');
INSERT INTO location
VALUES ('2', 'abcd', 'xyz colony', 'bhopal', 'madhya pradesh', '400342');
INSERT INTO location
VALUES ('3', 'aef', 'vk colony', 'mumbai', 'maharashtra', '400000');

ALTER TABLE user
ADD PRIMARY KEY (id);

INSERT INTO user
VALUES ('1', 'radhika', '1', 'rdhk2004@gmail.com', '0', '9116117581');

CREATE TABLE saved_addresses(
	user_id int,
    location_id int
);

INSERT INTO saved_addresses
VALUES ('1', '1');

INSERT INTO saved_addresses
VALUES ('1', '2');

INSERT INTO saved_addresses
VALUES ('2', '2');

INSERT INTO saved_addresses
VALUES ('4', '3');

SELECT * FROM saved_addresses;


CREATE TABLE restaurant(
	id int,
    restaurant_name varchar(100),
    location_id int,
    restaurant_type bool
);

INSERT INTO restaurant
VALUES ('1', 'abc family restaurant', '1', '0');
INSERT INTO restaurant
VALUES ('2', 'xyz restaurant', '3', '0');
INSERT INTO restaurant
VALUES ('3', 'alpha restaurant', '2', '1');

ALTER TABLE restaurant
ADD PRIMARY KEY (id);

ALTER TABLE restaurant
ADD FOREIGN KEY (location_id) REFERENCES location(id);

ALTER TABLE restaurant
ADD FOREIGN KEY (location_id) REFERENCES location(id);


CREATE TABLE dish(
	id int,
    dish_name varchar(100),
	price int,
    dish_description varchar(300),
    dish_type bool,
    category_id int
);

INSERT INTO dish
VALUES ('1', 'biryani', '300', 'very tasty', '1', '1');
INSERT INTO dish
VALUES ('2', 'naan', '45', 'very tasty', '0', '3');
INSERT INTO dish
VALUES ('3', 'aloo tikka burgur', '179', 'McD', '0', '5');
INSERT INTO dish
VALUES ('4', 'margharita pizza', '300', 'medium, servers 3', '0', '4');

CREATE TABLE category(
	id int,
    cateogory_name varchar(100)
);

INSERT INTO category
VALUES ('1', 'rice');
INSERT INTO category
VALUES ('2', 'chinese');
INSERT INTO category
VALUES ('3', 'breads');
INSERT INTO category
VALUES ('4', 'pizza');
INSERT INTO category
VALUES ('5', 'burgur');
INSERT INTO category
VALUES ('6', 'continental');
INSERT INTO category
VALUES ('7', 'italian');
INSERT INTO category
VALUES ('8', 'rolls');

SELECT * FROM category;

ALTER TABLE category
ADD PRIMARY KEY (id);

ALTER TABLE dish
ADD PRIMARY KEY (id);

ALTER TABLE dish
ADD FOREIGN KEY (category_id) REFERENCES category(id);

CREATE TABLE favourite_restaurants(
	user_id int,
    restaurant_it int
);

INSERT INTO favourite_restaurants
VALUES ('1', '1');
INSERT INTO favourite_restaurants
VALUES ('2', '3');
INSERT INTO favourite_restaurants
VALUES ('4', '1');

ALTER TABLE favourite_restaurants
ADD FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE favourite_restaurants
RENAME COLUMN restaurant_it TO restaurant_id;

ALTER TABLE favourite_restaurants
ADD FOREIGN KEY (restaurant_id) REFERENCES restaurant(id);

CREATE TABLE favourite_dish(
	user_id int,
    dish_id int
);

INSERT INTO favourite_dish
VALUES ('1', '1');
INSERT INTO favourite_dish
VALUES ('2', '3');
INSERT INTO favourite_dish
VALUES ('4', '1');
INSERT INTO favourite_dish
VALUES ('4', '3');
INSERT INTO favourite_dish
VALUES ('2', '2');
INSERT INTO favourite_dish
VALUES ('2', '4');
INSERT INTO favourite_dish
VALUES ('1', '4');

SELECT * FROM favourite_dish;

ALTER TABLE favourite_dish
ADD FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE favourite_dish
ADD FOREIGN KEY (dish_id) REFERENCES dish(id);

CREATE TABLE delivery_boy(
	id int,
    boy_name varchar(100),
    contact int,
    location_id int
);

ALTER TABLE delivery_boy
MODIFY COLUMN contact varchar(10);

INSERT INTO delivery_boy
VALUES ('1', 'abc', '9123456789', '1');
INSERT INTO delivery_boy
VALUES ('2', 'def', '9876543876', '2');
INSERT INTO delivery_boy
VALUES ('3', 'ram', '8654434276', '3');
INSERT INTO delivery_boy
VALUES ('4', 'mohan', '9765543876', '2');

ALTER TABLE delivery_boy
ADD FOREIGN KEY (location_id) REFERENCES location(id);

CREATE TABLE place_order(
	order_number int,
	order_status varchar(100),
    delivery_address int,
    order_date_time datetime,
    delivery_date_time datetime,
    coupon_code varchar(6),
    discount int
);

alter table place_order
ADD offer int;

alter table place_order
ADD user_id int;

alter table place_order
ADD delivery_boy int;

ALTER TABLE place_order
ADD FOREIGN KEY (user_id) REFERENCES user(id);

SELECT * FROM place_order;

ALTER TABLE delivery_boy
ADD PRIMARY KEY (id);

ALTER TABLE place_order
ADD FOREIGN KEY (delivery_boy) REFERENCES delivery_boy(id);

INSERT INTO place_order
VALUES ('1', 'complete', '1', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', NULL, NULL, '1', '1');
INSERT INTO place_order
VALUES ('2', 'order prepared', '2', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', '50', '1', '1', '2');
INSERT INTO place_order
VALUES ('3', 'delivery guy on the way', '3', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', '150', '2', '2', '2');
INSERT INTO place_order
VALUES ('4', 'food cooking', '3', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', '100', '2', '3', '1');
INSERT INTO place_order
VALUES ('5', 'payment pending', '2', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', '50', '3', '3', '2');
INSERT INTO place_order
VALUES ('6', 'complete', '3', '2023-12-31 23:59:59.499999', '2024-1-1 23:59:59.499999', NULL, NULL, '4', '4');

ALTER TABLE place_order
ADD PRIMARY KEY (order_number);

ALTER TABLE place_order
ADD FOREIGN KEY (offer) REFERENCES offer(id);

ALTER TABLE place_order
ADD FOREIGN KEY (delivery_address) REFERENCES location(id);

SELECT * FROM place_order;

CREATE TABLE offer(
	coupon_code varchar(6),
    offer_name varchar(100),
    offer_description varchar(300)
);

INSERT INTO offer
VALUES ('PAYTM5', 'cashback via paytm', 'you will recieve cashback!!!', '1');
INSERT INTO offer
VALUES ('PIZZZA', 'flat 30% off on pizza', 'discount!!!', '2');
INSERT INTO offer
VALUES ('PHNPE4', 'cashback via phonepe', 'you will recieve cashback!!!', '3');

ALTER TABLE offer
ADD PRIMARY KEY (id);

ALTER TABLE offer
ADD id int;

CREATE TABLE payment(
	id int,
    payment_mode varchar(100),
    payment_status varchar(100),
    order_number int
);

ALTER TABLE payment
ADD PRIMARY KEY (id);

ALTER TABLE payment
ADD FOREIGN KEY (order_number) REFERENCES place_order(order_number);

CREATE TABLE rating(
	id int,
    rating int,
    rating_for int,
    rating_entity_id int,
    remarks varchar(300)
);

DROP TABLE rating;

ALTER TABLE rating
ADD FOREIGN KEY (rating_for) REFERENCES rating_for(id);

ALTER TABLE rating
ADD FOREIGN KEY (rating_entity_id) REFERENCES rating_entity_id(id);

ALTER TABLE rating
ADD PRIMARY KEY (id);

CREATE TABLE rating_for(
	id int,
    rating_entity int
);

ALTER TABLE rating_for
ADD PRIMARY KEY (id);

CREATE TABLE rating_entity_id(
	id int,
    rating_for int,
    rating_entity_id int
);

DROP TABLE rating_entity_id;

ALTER TABLE rating_entity_id
ADD FOREIGN KEY (rating_for) REFERENCES rating_for(id);

ALTER TABLE rating_entity_id
ADD PRIMARY KEY (id);

DROP TABLE rating;

ALTER TABLE user
ADD PRIMARY KEY (id);

ALTER TABLE user
ADD PRIMARY KEY (id);




    
    
    
