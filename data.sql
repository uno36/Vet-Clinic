/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23),
       ('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-01-07', 1, false, 15.04),
       ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23, 'Dinosaur'),
  ('Gabumon', '2018-11-15', 2, true, 8, 'Reptile'),
  ('Pikachu', '2021-01-07', 1, false, 15.04, 'Electric Mouse'),
  ('Devimon', '2017-05-12', 5, true, 11, 'Fallen Angel'),
  ('Charmander', '2020-02-08', 0, false, -11, 'Lizard'),
  ('Plantmon', '2021-11-15', 2, true, -5.7, 'Plant'),
  ('Squirtle', '1993-04-02', 3, false, -12.13, 'Turtle'),
  ('Angemon', '2005-06-12', 1, true, -45, 'Angel'),
  ('Boarmon', '2005-06-07', 7, true, 20.4, 'Boar'),
  ('Blossom', '1998-10-13', 3, true, 17, 'Flower'),
  ('Ditto', '2022-05-14', 4, true, 22, 'Transforming');
  
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
  
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals
SET species_id = s.id
FROM species s
WHERE animals.name LIKE '%mon' AND s.name = 'Digimon';

UPDATE animals
SET species_id = s.id
FROM species s
WHERE animals.name NOT LIKE '%mon' AND s.name = 'Pokemon';

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14);

UPDATE animals
SET owner_id = o.id
FROM owners o
WHERE animals.name = 'Agumon' AND o.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = o.id
FROM owners o
WHERE animals.name IN ('Gabumon', 'Pikachu') AND o.full_name = 'Jennifer Orwell';

UPDATE animals
SET owner_id = o.id
FROM owners o
WHERE animals.name IN ('Devimon', 'Plantmon') AND o.full_name = 'Bob';

UPDATE animals
SET owner_id = o.id
FROM owners o
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND o.full_name = 'Melody Pond';

UPDATE animals
SET owner_id = o.id
FROM owners o
WHERE animals.name IN ('Angemon', 'Boarmon') AND o.full_name = 'Dean Winchester';

