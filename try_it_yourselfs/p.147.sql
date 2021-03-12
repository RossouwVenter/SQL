--p147
CREATE TABLE albums (
 album_id bigserial,
 album_catalog_code varchar(100),
 album_title text,
 album_artist text,
 album_release_date date,
 album_genre varchar(40),
 album_description text,
	 Primary key (album_ID)
);
CREATE TABLE songs (
 song_id bigserial,
 song_title text,
 song_artist text,
 album_id bigint
);

--2. The album_artist or album_title could be a natural key as they
-- will be able to link with the song table and are unique values.

--3.

