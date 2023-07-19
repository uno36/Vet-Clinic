/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

--- \c vet_clinic;

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

  ALTER TABLE animals ADD species varchar(255);

  CREATE TABLE owners (
  id serial PRIMARY KEY,
  full_name varchar(20),
  age integer
);

CREATE TABLE species (
  id serial PRIMARY KEY,
  name varchar(20)
);

ALTER TABLE animals ADD new_id SERIAL PRIMARY KEY;
UPDATE animals SET new_id = id;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INTEGER,
CONSTRAINT fk_species_id
FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD owner_id INTEGER,
CONSTRAINT fk_owner_id
FOREIGN KEY (owner_id) REFERENCES owners (id);




