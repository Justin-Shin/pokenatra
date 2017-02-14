DROP TABLE IF EXISTS pokemons;
-- DROP TABLE IF EXISTS trainers;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name TEXT,
  poke_type TEXT,
  cp INT,
  img_url TEXT,
  trainer_id INT
);

CREATE TABLE trainers(
  id SERIAL PRIMARY KEY,
  name TEXT,
  level INT,
  img_url TEXT
);
