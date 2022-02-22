CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(10,2) NOT NULL,
    generated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY(id)
);
