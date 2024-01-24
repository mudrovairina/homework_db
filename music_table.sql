CREATE TABLE IF NOT EXISTS Genres(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE
);

--DROP TABLE Genres;

CREATE TABLE IF NOT EXISTS Musicians(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE
);

--ALTER TABLE Musicians DROP COLUMN id_genre;
--DROP TABLE Musicians;

CREATE TABLE IF NOT EXISTS Albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	"year" SMALLINT NOT NULL CHECK ("year" > 1900)
);

--ALTER TABLE Albums DROP COLUMN id_musican;
--DROP TABLE Albums;

CREATE TABLE IF NOT EXISTS Tracks(
	id SERIAL PRIMARY KEY,
	id_album INTEGER NOT NULL REFERENCES Albums(ID),
	name VARCHAR(40) NOT NULL,
	duration SMALLINT NOT NULL CHECK (duration > 0)
);

--DROP TABLE Tracks;

CREATE TABLE IF NOT EXISTS GenresMusicians(
	id_genre INTEGER NOT NULL  REFERENCES Genres(ID),
	id_musican INTEGER NOT NULL REFERENCES Musicians(ID),
	CONSTRAINT pk_genres_musicians PRIMARY KEY (ID_genre, ID_musican)
);

--DROP TABLE GenresMusicians;

CREATE TABLE IF NOT EXISTS AlbumsMusicians(
	id_album INTEGER NOT NULL  REFERENCES Albums(ID),
	id_musican INTEGER NOT NULL REFERENCES Musicians(ID),
	CONSTRAINT pk_albums_musicians PRIMARY KEY (ID_album, ID_musican)
);

--DROP TABLE AlbumsMusicians;

CREATE TABLE IF NOT EXISTS Collections(
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	"year" SMALLINT NOT NULL CHECK ("year" > 1900)
);

--DROP TABLE Collections;

CREATE TABLE IF NOT EXISTS CollectionsTracks(
	id_track INTEGER NOT NULL REFERENCES Tracks(ID),
	id_collection INTEGER NOT NULL REFERENCES Collections(ID),
	CONSTRAINT pk_collections_tracks PRIMARY KEY (ID_track, ID_collection)
);

--DROP TABLE CollectionsTracks;

