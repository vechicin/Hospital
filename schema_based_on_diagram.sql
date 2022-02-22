CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_patient
  FOREIGN KEY (patient_id)
  REFERENCES patients(id)
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(10,2) NOT NULL,
    generated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_invoices
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_invoice_items
  FOREIGN KEY (invoice_id)
  REFERENCES invoices(id),
  CONSTRAINT fk_invoice_items_treatment
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id)
);

CREATE TABLE treatment_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  treatment_id INT NOT NULL,
  medical_history_id INT NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_treatment_histories
  FOREIGN KEY (treatment_id)
  REFERENCES treatments(id),
  CONSTRAINT fk_treatment_histories_medical_history
  FOREIGN KEY (medical_history_id)
  REFERENCES medical_histories(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON treatment_histories (treatment_id);
CREATE INDEX ON treatment_histories (medical_history_id);
