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

INSERT INTO vets (name, age, date_of_graduation) VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT
  a.id AS animal_id,
  v.id AS vet_id,
  visit_date::date
FROM
  animals a
JOIN
  vets v ON a.name IN ('Agumon', 'Gabumon', 'Pikachu', 'Devimon', 'Charmander', 'Plantmon', 'Squirtle', 'Angemon', 'Boarmon', 'Blossom')
  AND v.name IN ('William Tatcher', 'Stephanie Mendez', 'Jack Harkness', 'Maisy Smith')
JOIN
  (VALUES
    ('Agumon', 'William Tatcher', '2020-05-24'),
    ('Agumon', 'Stephanie Mendez', '2020-07-22'),
    ('Gabumon', 'Jack Harkness', '2021-02-02'),
    ('Pikachu', 'Maisy Smith', '2020-01-05'),
    ('Pikachu', 'Maisy Smith', '2020-03-08'),
    ('Pikachu', 'Maisy Smith', '2020-05-14'),
    ('Devimon', 'Stephanie Mendez', '2021-05-04'),
    ('Charmander', 'Jack Harkness', '2021-02-24'),
    ('Plantmon', 'Maisy Smith', '2019-12-21'),
    ('Plantmon', 'William Tatcher', '2020-08-10'),
    ('Plantmon', 'Maisy Smith', '2021-04-07'),
    ('Squirtle', 'Stephanie Mendez', '2019-09-29'),
    ('Angemon', 'Jack Harkness', '2020-10-03'),
    ('Angemon', 'Jack Harkness', '2020-11-04'),
    ('Boarmon', 'Maisy Smith', '2019-01-24'),
    ('Boarmon', 'Maisy Smith', '2019-05-15'),
    ('Boarmon', 'Maisy Smith', '2020-02-27'),
    ('Boarmon', 'Maisy Smith', '2020-08-03'),
    ('Blossom', 'Stephanie Mendez', '2020-05-24'),
    ('Blossom', 'William Tatcher', '2021-01-11')
  ) AS data(animal, vet, visit_date) ON a.name = data.animal AND v.name = data.vet;
  
  INSERT INTO visits (animal_id, vet_id, visit_date)
  SELECT * FROM (SELECT id FROM animals) animal_ids, 
  (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

  insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

SELECT COUNT(*) FROM visits where animal_id = 4;


