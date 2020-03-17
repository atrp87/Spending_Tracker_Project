DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50),
  budget NUMERIC
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  amount NUMERIC,
  merchant_id INT REFERENCES merchants(id),
  user_id INT REFERENCES users(id),
  tag_id INT REFERENCES tags(id)
);
