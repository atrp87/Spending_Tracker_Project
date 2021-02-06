DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants (
id SERIAL PRIMARY KEY,
name VARCHAR(250)
);

CREATE TABLE tags (
id SERIAL PRIMARY KEY,
name VARCHAR(250)
);

CREATE TABLE transactions(
id SERIAL PRIMARY KEY,
cash INT,
value INT,
merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
tag_id INT REFERENCES tags(id) ON DELETE CASCADE
);