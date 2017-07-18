CREATE TABLE expenses(
id serial PRIMARY KEY,
amount NUMERIC(6,2) NOT NULL CHECK (amount > 0),
memo text NOT NULL,
created_on DATE NOT NULL DEFAULT NOW()
);