CREATE TABLE IF NOT EXISTS Employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	department VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS EmployeesBosses(
	id SERIAL PRIMARY KEY,
	id_employee INTEGER NOT NULL REFERENCES Employees(id),
	id_boss INTEGER NULL REFERENCES Employees(id),
	UNIQUE (id_employee, id_boss),
	CHECK (id_employee != id_boss)
);
