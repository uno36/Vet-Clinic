/*Queries that provide answers to the questions from all projects.*/

--- 1. Find all animals whose name ends in "mon":
SELECT * FROM animals WHERE name LIKE '%mon';

--- 2. List the name of all animals born between 2016 and 2019:
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

--- 3. List the name of all animals that are neutered and have less than 3 escape attempts:
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

--- 4. List the date of birth of all animals named either "Agumon" or "Pikachu":
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

--- 5. List name and escape attempts of animals that weigh more than 10.5kg:
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

--- 6. Find all animals that are neutered:
SELECT * FROM animals WHERE neutered = true;

--- 7. Find all animals not named Gabumon:
SELECT * FROM animals WHERE name != 'Gabumon';

--- 8. Find all animals with a weight between 10.4kg and 17.3kg (inclusive):
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Start the transaction
BEGIN;

-- Update the species column to 'unspecified'
UPDATE animals SET species = 'unspecified';

-- Verify the change
SELECT * FROM animals;

-- Rollback the transaction
ROLLBACK;

-- Verify the species column reverted to the state before the transaction
SELECT * FROM animals;

-- Start the transaction
BEGIN;

-- Update the species column to 'digimon' for animals with a name ending in 'mon'
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update the species column to 'pokemon' for animals without a species already set
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

-- Verify the changes
SELECT * FROM animals;

-- Commit the transaction
COMMIT;

-- Verify that changes persist after commit
SELECT * FROM animals;

-- Start the transaction
BEGIN;

-- Delete all records from the animals table
DELETE FROM animals;

-- Verify that records are deleted
SELECT * FROM animals;

-- Roll back the transaction
ROLLBACK;

-- Verify that the records are restored after the rollback
SELECT * FROM animals;

-- Start the transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT my_savepoint;

-- Update all animals' weight to be their weight multiplied by -1

--- 1. How many animals are there?
SELECT COUNT(*) AS total_animals FROM animals;

--- 2. How many animals have never tried to escape?
SELECT COUNT(*) AS animals_no_escape_attempts
FROM animals
WHERE escape_attempts = 0;

--- 3. What is the average weight of animals?
SELECT AVG(weight_kg) AS average_weight
FROM animals;

--- 4. Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
FROM animals
GROUP BY neutered;

--- 5. What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

--- 6. What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
