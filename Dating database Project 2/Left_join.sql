SELECT 	my_contacts.last_name,my_contacts.first_name,
		interests.interest,
		profession.profession,
		seeking.seeking,
		status.status
		FROM my_contacts LEFT JOIN  interests
		ON my_contacts.interest_id = interests.interest_id
		LEFT JOIN profession 
		ON my_contacts.prof_id = profession.prof_id
		LEFT JOIN seeking
		ON my_contacts.seeking_id = seeking.seeking_id
		LEFT JOIN status
		ON my_contacts.status_id = status.status_id
		ORDER BY  my_contacts;