-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbit_id INTEGER references orbits,
  galaxy_id INTEGER references galaxies,
  has_moons BOOLEAN NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies
  planet_id INTEGER REFERENCES planets
)

INSERT INTO galaxies (name) VALUES ('Milky Way');

INSERT INTO orbits (orbital_period_in_years, orbits_around) VALUES
  (1.00, 'The Sun'),
  (1.88, 'The Sun'),
  (0.62, 'The Sun'),
  (164.8, 'The Sun'),
  (0.03, 'Proxima Centauri'),
  (0.23, 'Gliese 876');

INSERT INTO planets (name, orbit_id, galaxy_id, has_moons) 
VALUES
  ('Earth',1, 1, true),
  ('Mars', 2, 1, true),
  ('Venus', 3, 1, false),
  ('Neptune', 4, 1, true),
  ('Proxima Centauri b', 5, 1, false),
  ('Gliese 876 b', 6, 1, false);

INSERT INTO moons (name, planet_id, galaxy_id)
VALUES 
  ('The Moon', 1, 1),
  ('Phobos', 2, 1),
  ('Deimos', 2, 1),
  ('Naiad', 4, 1),
  ('Thalassa', 4, 1),
  ('Despina', 4, 1),
  ('Galatea', 4, 1),
  ('Larissa', 4, 1),
  ('S/2004 N 1', 4, 1),
  ('Proteus', 4, 1),
  ('Triton', 4, 1),
  ('Nereid', 4, 1),
  ('Halimede', 4, 1),
  ('Sao', 4, 1),
  ('Laomedeia', 4, 1),
  ('Psamathe', 4, 1),
  ('Neso', 4, 1);