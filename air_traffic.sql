
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE "airlines" (
    "airline_id" SERIAL   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "airline_id"
     )
);

CREATE TABLE "flights" (
    "flight_id" SERIAL   NOT NULL,
    "departure" TIMESTAMP   NOT NULL,
    "arrival" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_flights" PRIMARY KEY (
        "flight_id"
     )
);

CREATE TABLE "origins" (
    "origin_id" SERIAL   NOT NULL,
    "origin_city" TEXT   NOT NULL,
    "origin_country" TEXT   NOT NULL,
    CONSTRAINT "pk_origins" PRIMARY KEY (
        "origin_id"
     )
);

CREATE TABLE "destinations" (
    "destin_id" SERIAL   NOT NULL,
    "destin_city" TEXT   NOT NULL,
    "destin_country" TEXT   NOT NULL,
    CONSTRAINT "pk_destinations" PRIMARY KEY (
        "destin_id"
     )
);

CREATE TABLE "passengers" (
    "pass_id" SERIAL   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    CONSTRAINT "pk_passengers" PRIMARY KEY (
        "pass_id"
     )
);

CREATE TABLE "tickets" (
    "ticket_id" SERIAL   NOT NULL,
    "seat_num" TEXT   NOT NULL,
    CONSTRAINT "pk_tickets" PRIMARY KEY (
        "ticket_id"
     )
);

ALTER TABLE "flights" ADD CONSTRAINT "fk_flights_flight_id" FOREIGN KEY("flight_id")
REFERENCES "airlines" ("airline_id");

ALTER TABLE "origins" ADD CONSTRAINT "fk_origins_origin_id" FOREIGN KEY("origin_id")
REFERENCES "flights" ("flight_id");

ALTER TABLE "destinations" ADD CONSTRAINT "fk_destinations_destin_id" FOREIGN KEY("destin_id")
REFERENCES "flights" ("flight_id");

ALTER TABLE "passengers" ADD CONSTRAINT "fk_passengers_pass_id" FOREIGN KEY("pass_id")
REFERENCES "tickets" ("ticket_id");

ALTER TABLE "tickets" ADD CONSTRAINT "fk_tickets_ticket_id" FOREIGN KEY("ticket_id")
REFERENCES "flights" ("flight_id");

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO flights
  (departure, arrival)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO origins
  (from_city, from_country)
VALUES
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Charlotte', 'United States'),
  ('Sao Paolo', 'Brazil');

INSERT INTO destinations
  (to_city, to_country)
VALUES
  ('Seattle', 'United States'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),
  ('Charlotte', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile');

INSERT INTO tickets
  (seat_num)
VALUES
('33B'),
('8A'),
('12F'),
('20A'),
('23D'),
('18C'),
('9E'),
('1A'),
('32B'),
('10D');

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');






