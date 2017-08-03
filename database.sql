CREATE TABLE farmer(
fid INT NOT NULL AUTO_INCREMENT,
password VARCHAR(50),
fname VARCHAR(50),
mobile_no BIGINT,
locality VARCHAR(50),
village VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
zipcode INT,
PRIMARY KEY(fid)
);


CREATE TABLE crop(
crop_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
crop_name VARCHAR(50) UNIQUE,
description VARCHAR(50)
);


CREATE TABLE grows(
crop_id INT,
fid INT,
current_stage VARCHAR(50),
start_time timestamp,
end_time timestamp,
PRIMARY KEY(crop_id,fid),
FOREIGN KEY(crop_id) REFERENCES crop(crop_id) ON DELETE CASCADE,
FOREIGN KEY(fid) REFERENCES farmer(fid) ON DELETE CASCADE
);

CREATE TABLE message(
fid INT,
mid INT,
content VARCHAR(60),
language VARCHAR(20),
time_stamp timestamp,
PRIMARY KEY(mid,fid),
FOREIGN KEY(fid) REFERENCES farmer(fid) ON DELETE CASCADE
);


CREATE TABLE ideal_conditions(
crop_id INT,
stage_id INT,
stage_name VARCHAR(50),
max_temp INT,
min_temp INT,
rainfall INT,
water_level INT,
PRIMARY KEY(crop_id,stage_id),
FOREIGN KEY(crop_id) REFERENCES crop(crop_id) ON DELETE CASCADE
);


CREATE TABLE admin(
admin_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) UNIQUE,
password VARCHAR(50)
);


CREATE TABLE can_be_grown(
crop_id INT,
state VARCHAR(50),
stage VARCHAR(50),
start_month VARCHAR(50),
end_month VARCHAR(50),
PRIMARY KEY(crop_id,state,stage),
FOREIGN KEY(crop_id) REFERENCES crop(crop_id) ON DELETE CASCADE
);
