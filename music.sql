

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "producers" (
    "producer_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_producers" PRIMARY KEY (
        "producer_id"
     )
);

CREATE TABLE "artists" (
    "artist_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_artists" PRIMARY KEY (
        "artist_id"
     )
);

CREATE TABLE "albums" (
    "album_id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    "release_date" TEXT   NOT NULL,
    CONSTRAINT "pk_albums" PRIMARY KEY (
        "album_id"
     )
);

CREATE TABLE "songs" (
    "song_id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    "duration_in_seconds" INTEGER   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "song_id"
     )
);

ALTER TABLE "producers" ADD CONSTRAINT "fk_producers_producer_id" FOREIGN KEY("producer_id")
REFERENCES "albums" ("album_id");

ALTER TABLE "artists" ADD CONSTRAINT "fk_artists_artist_id" FOREIGN KEY("artist_id")
REFERENCES "albums" ("album_id");

ALTER TABLE "albums" ADD CONSTRAINT "fk_albums_album_id" FOREIGN KEY("album_id")
REFERENCES "songs" ("song_id");


INSERT INTO producers
  (name)
VALUES
  ("Dust Brothers"),
  ("Stephen Lironi"),
  ("Roy Thomas Baker"),
  ("Walter Afanasieff"),
  ("Benjamin Rice"),
  ("Rick Parashar"),
  ("Al Shux"),
  ("Max Martin"),
  ("Cirkut"),
  ("Shellback"),
  ("Benny Blanco"),
  ("The Matrix"),
  ("Darkchild");

  INSERT INTO artists
    (name)
  VALUES
    ("Hanson"),
    ("Queen"),
    ("Mariah Cary"),
    ("Boyz II Men"),
    ("Lady Gaga"),
    ("Bradley Cooper"),
    ("Nickelback"),
    ("Jay Z"),
    ("Alicia Keys"),
    ("Katy Perry"),
    ("Juicy J"),
    ("Maroon 5"),
    ("Christina Aguilera"),
    ("Avril Lavigne"),
    ("Destiny''s Child");

INSERT INTO albums
  (name, release_date)
VALUES
  ("Middle of Nowhere", '04-15-1997'),
  ("A Night at the Opera", '10-31-1975'),
  ("Daydream", '11-14-1995'),
  ("A Star Is Born", '09-27-2018'),
  ("Silver Side Up", '08-21-2001'),
  ("The Blueprint 3", '10-20-2009'),
  ("Prism", '12-17-2013'),
  ("Hands All Over", '06-21-2011'),
  ("Let Go", '05-14-2002'),
  ("The Writing''s on the Wall", '11-07-1999');

    INSERT INTO songs
  (title, duration_in_seconds)
VALUES
  ("MMMBop", 238)
  ("Bohemian Rhapsody", 355)
  ("One Sweet Day", 282)
  ("Shallow", 216)
  ("How You Remind Me", 223)
  ("New York State of Mind", 276)
  ("Dark Horse", 215)
  ("Moves Like Jagger", 201)
  ("Complicated", 244)
  ("Say My Name", 240);
