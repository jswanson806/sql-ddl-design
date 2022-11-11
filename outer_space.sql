-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "galaxies" (
    "galaxy_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "type" TEXT   NOT NULL DEFAULT 'unknown',
    "dist_from_earth_in_lightyears" TEXT,
    "est_star_count" FLOAT,
    CONSTRAINT "pk_galaxies" PRIMARY KEY (
        "galaxy_id"
     )
);

CREATE TABLE "planets" (
    "planet_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "type" TEXT   NOT NULL DEFAULT 'unknown',
    "orbital_period_in_years" FLOAT,
    "orbits_around" TEXT DEFAULT 'unknown',
    "rotational_period_in_days" FLOAT,
    "mass" TEXT DEFAULT 'unknown',
    "has_atmosphere" BOOLEAN,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "planet_id"
     )
);

CREATE TABLE "moons" (
    "moon_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "orbital_period_in_days" FLOAT,
    "mass" FLOAT,
    CONSTRAINT "pk_moons" PRIMARY KEY (
        "moon_id"
     )
);

ALTER TABLE "galaxies" ADD CONSTRAINT "fk_galaxies_galaxy_id" FOREIGN KEY("galaxy_id")
REFERENCES "planets" ("planet_id");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_planet_id" FOREIGN KEY("planet_id")
REFERENCES "moons" ("moon_id");

INSERT INTO galaxies
  (name, type, dist_from_earth_in_lightyears)
VALUES
  ('Milky Way', spiral, "N/A"),
  ('Andromeda', spiral, '2.537 million');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun'),
  ('Mars', 1.88, 'The Sun'),
  ('Venus', 0.62, 'The Sun'),
  ('Neptune', 164.8, 'The Sun'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
  ('Gliese 876 b', 0.23, 'Gliese 876');

  INSERT INTO moons
    (name)
  VALUES
    ('Moon'),
    ('Phobos'),
    ('Deimos'),
    ('Naiad'),
    ('Thalassa'),
    ('Despina'),
    ('Galatea'),
    ('Larissa'),
    ('S/2004 N 1'),
    ('Proteus'),
    ('Triton'),
    ('Nereid'),
    ('Halimede'),
    ('Sao'),
    ('Laomedeia'),
    ('Psamathe'),
    ('Neso');