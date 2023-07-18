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