DROP TABLE bookings;
DROP TABLE fitness_classes;
DROP TABLE members;

CREATE TABLE members (
id serial8 primary key,
first_name varchar(255) not null,
last_name varchar(255) not null
);

CREATE TABLE fitness_classes (
id serial8 primary key,
name varchar(255) not null
);

CREATE TABLE bookings (
id serial8 primary key,
member_id INT8 REFERENCES members(id) ON DELETE CASCADE,
fitness_class_id INT8 REFERENCES fitness_classes(id) ON DELETE CASCADE
);

-- DO I NEED TO DELETE ON CASCADE FOR THE FOREIGN KEYS?
