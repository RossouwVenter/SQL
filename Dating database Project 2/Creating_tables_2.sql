CREATE TABLE my_contacts (
	contact_id serial,
	last_name varchar(50),
	first_name varchar(50),
	phone varchar(10),
	email varchar(50),
	gender varchar(20),
	birthday varchar(50),
	interest_id serial REFERENCES interests (interest_ID),	
	prof_id serial REFERENCES profession (prof_id),
	seeking_id serial REFERENCES seeking (seeking_id),
	status_id serial REFERENCES status (status_id),
	zip_code serial REFERENCES  zip_code (zip_code),	
	CONSTRAINT contact_key PRIMARY KEY (contact_id)
);

CREATE TABLE contact_interest(
	contact_id serial REFERENCES my_contacts (contact_id),
	interest_id serial REFERENCES interests (interest_id)
	);

CREATE TABLE interests(
	interest_id serial,
	interest varchar(50),
	CONSTRAINT interest_pk PRIMARY KEY (interest_id)
	);

CREATE TABLE contact_seeking(
	contact_id serial REFERENCES my_contacts (contact_id),
	seeking_id serial REFERENCES seeking (seeking_id)
);

CREATE TABLE seeking(
	seeking_id serial,
	seeking varchar(50),
	CONSTRAINT seeking_pk PRIMARY KEY (seeking_id)
	);
	