CREATE TABLE administrator (
    id SERIAL PRIMARY KEY NOT NULL,
    login VARCHAR(50),
    password VARCHAR(255)
);

INSERT INTO administrator(id,login,password) VALUES (DEFAULT,'admin',md5('admin'));

CREATE TABLE driver(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(200),
    password VARCHAR(255),
    birth DATE
);

CREATE TABLE type(
    id SERIAL PRIMARY KEY NOT NULL,
    description VARCHAR(200)
);

INSERT INTO type(id,description) VALUES (DEFAULT,'SUV');
INSERT INTO type(id,description) VALUES (DEFAULT,'Legere');
INSERT INTO type(id,description) VALUES (DEFAULT,'Utilitaire');
INSERT INTO type(id,description) VALUES (DEFAULT,'Camion');

CREATE TABLE vehicle(
    number VARCHAR(7) PRIMARY KEY NOT NULL,
    idtype INT,
    mark VARCHAR(255),
    model VARCHAR(255),
    km DOUBLE PRECISION,
    FOREIGN KEY(idtype) REFERENCES type(id)
);

CREATE TABLE trajectory(
    id SERIAL PRIMARY KEY NOT NULL,
    numbervehicle VARCHAR(7),
    iddriver INT,
    motif VARCHAR(255),
    departure_time TIMESTAMP,
    departure_place VARCHAR(255),
    departure_km DOUBLE PRECISION,
    arrival_time TIMESTAMP,
    arrival_place VARCHAR(255),
    arrival_km DOUBLE PRECISION,
    fuel_price DOUBLE PRECISION,
    fuel_quantity DOUBLE PRECISION,
    FOREIGN KEY (numbervehicle) REFERENCES vehicle(number),
    FOREIGN KEY (iddriver) REFERENCES driver(id)
);