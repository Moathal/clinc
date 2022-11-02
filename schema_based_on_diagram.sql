CREATE TABLE patients (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
date_of_birth date NOT NULL
);
SELECT * FROM patients;

CREATE TABLE medical_histories (
id SERIAL PRIMARY KEY,
admitted_at TIMESTAMP,
patient_id INT REFERENCES patients(id),
status text NOT NULL
);
SELECT * FROM medical_histories;

CREATE TABLE treatments (
id SERIAL PRIMARY KEY,
type text NOT NULL,
name text NOT NULL
);
SELECT * FROM treatments;

CREATE TABLE invoices (
id SERIAL PRIMARY KEY,
total_amount DECIMAL NOT NULL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT REFERENCES medical_histories(id)
);
SELECT * FROM invoices; 

CREATE TABLE invoice_items (
id SERIAL PRIMARY KEY,
unit_price DECIMAL NOT NULL,
quantity INT NOT NULL,
total_price DECIMAL NOT NULL,
invoice_id INT REFERENCES invoices(id),
treament_id INT REFERENCES treatments(id)
);
SELECT * FROM invoice_items;

CREATE TABLE patient_history (
id SERIAL PRIMARY KEY,
treament_id INT REFERENCES treatments(id),
medical_history_id INT REFERENCES medical_histories(id)
);
SELECT * FROM patient_history;
