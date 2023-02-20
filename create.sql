DROP TABLE genre, performer, performer_genre, album, album_performer, track, complitation, track_complitation;

CREATE TABLE IF NOT EXISTS Genre (
	Genre_id INTEGER PRIMARY KEY,  
	Name VARCHAR(40) NOT NULL 
);
CREATE TABLE IF NOT EXISTS Performer (
	Performer_id INTEGER PRIMARY KEY, 
	Name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Performer_genre (
	Id INTEGER PRIMARY KEY,
	Performer_id INTEGER REFERENCES Performer(Performer_id),
	Genre_id INTEGER REFERENCES Genre(Genre_id) 
);
CREATE TABLE IF NOT EXISTS Album (
	Album_id INTEGER PRIMARY KEY,
	Name VARCHAR(40) NOT NULL,
	Released_year INTEGER CHECK (released_year > 1900) NOT NULL
);
CREATE TABLE IF NOT EXISTS Album_performer (
	Id INTEGER PRIMARY KEY,
	Album_id INTEGER REFERENCES Album(Album_id),
	Performer_id INTEGER REFERENCES Performer(Performer_id)
);
CREATE TABLE IF NOT EXISTS Track (
	Track_id INTEGER PRIMARY KEY,
	Name VARCHAR(40) NOT NULL,
	Duration INTEGER CHECK (duration < 1800) NOT NULL,
	Album_id INTEGER REFERENCES Album(Album_id)
);
CREATE TABLE IF NOT EXISTS Complitation (
	Complitation_id INTEGER PRIMARY KEY,
	Name VARCHAR(40) NOT NULL,
	Released_year INTEGER CHECK (released_year > 1901) NOT NULL
);
CREATE TABLE IF NOT EXISTS Track_complitation (
	Id INTEGER PRIMARY KEY,
	Track_id INTEGER REFERENCES Track(Track_id),
	Complitation_id INTEGER REFERENCES Complitation(Complitation_id) 
);
