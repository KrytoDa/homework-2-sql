CREATE TABLE IF NOT EXISTS Genres 
(
	genres_id int primary key,
	genre_title VARCHAR(60) 
);

CREATE TABLE IF NOT EXISTS Perfomers 
(
	perfomer_id int primary key,
	perfomer_name VARCHAR(60) 
);

CREATE TABLE IF NOT EXISTS genresperfomers 
(
	genres_id INTEGER NOT NULL REFERENCES Genres(genres_id),
	perfomer_id INTEGER NOT NULL REFERENCES Perfomers(perfomer_id),
	PRIMARY KEY (genres_id, perfomer_id)
);


CREATE TABLE IF NOT EXISTS Albums 
(
	album_id int primary key,
	album_title VARCHAR(60),
	release_date DATE
);


CREATE TABLE IF NOT EXISTS albumsperfomers 
(
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	perfomer_id INTEGER NOT NULL REFERENCES Perfomers(perfomer_id),
	PRIMARY KEY (album_id, perfomer_id)
);

CREATE TABLE IF NOT EXISTS Tracks
(
	track_id int primary key,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	track_title VARCHAR(60),
	duration DECIMAL(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections 
(
	collection_id int primary key,
	collection_title VARCHAR(60),
	year_of_release DATE
);

CREATE TABLE IF NOT EXISTS collectiontracks 
(
	collection_id INTEGER NOT NULL REFERENCES Collections(collection_id),
	track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
	PRIMARY KEY (collection_id, track_id)
);
