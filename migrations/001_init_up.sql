CREATE EXTENSION IF NOT EXISTS vector;


-- Create the user_config table
CREATE TABLE client_config (
  id SERIAL PRIMARY KEY,
  prompt TEXT,
  model TEXT,
  tools JSON
);

-- Create the user table
CREATE TABLE client (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  config_id INTEGER REFERENCES user_config(id)
);

-- Create the data table
CREATE TABLE data (
  id SERIAL PRIMARY KEY,
  chunk TEXT NOT NULL,
  client_id INTEGER REFERENCES client(id),
  embedding vector(1536)
);


CREATE INDEX ON data USING ivfflat (embedding);
