USE MASTER
CREATE DATABASE MDB
USE MDB

CREATE TABLE COUNTRY (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name varchar(50) UNIQUE,
  );

  CREATE TABLE CATEGORY (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name varchar(50) UNIQUE
  );
ALTER TABLE CATEGORY
ADD UNIQUE (id);

CREATE TABLE DIRECTOR (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name varchar(50),
    age int,
	CHECK (Age>=11),
	countryID int FOREIGN KEY REFERENCES Country(id)
  );

CREATE TABLE ACTOR (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name varchar(50),
    age int,
	countryID int FOREIGN KEY REFERENCES Country(id)
  );

ALTER TABLE ACTOR
ADD UNIQUE (id);

CREATE TABLE MOVIE (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name varchar(50),
    release_date date,
	rate float DEFAULT 0,
	photo image,
	directorID int FOREIGN KEY REFERENCES DIRECTOR(id),
	countryID int FOREIGN KEY REFERENCES Country(id),
	categoryID int FOREIGN KEY REFERENCES Category(id),
  );
ALTER TABLE MOVIE ADD RunTimeMinutes INT;

CREATE TABLE REWARD (
    id int PRIMARY KEY NOT NULL identity(1,1),
    name VARCHAR(50),
	reward_year INT,
	movieID int FOREIGN KEY REFERENCES MOVIE(id)
  );


CREATE NONCLUSTERED INDEX IX_RewardYear   
 ON REWARD (reward_year);  

CREATE TABLE MOVIE_CAST (
    
    actorID int FOREIGN KEY REFERENCES Actor(id),
	movieID int FOREIGN KEY REFERENCES MOVIE(id)
  );

CREATE TABLE MOVIE_CATEGORY (

 movieID int FOREIGN KEY REFERENCES MOVIE(id),
categoryID int FOREIGN KEY REFERENCES Category(id)
    );

INSERT INTO COUNTRY( name) VALUES('UNITED STATES');
INSERT INTO COUNTRY( name) VALUES('ENGLAND');
INSERT INTO COUNTRY( name) VALUES('FRANCE');
INSERT INTO COUNTRY( name) VALUES('ITALY');
INSERT INTO COUNTRY( name) VALUES('RUSSIA');
INSERT INTO COUNTRY( name) VALUES('INDIA');
INSERT INTO COUNTRY( name) VALUES('TURKEY');
INSERT INTO COUNTRY( name) VALUES('SPAIN');
INSERT INTO COUNTRY( name) VALUES('CHINA');
INSERT INTO COUNTRY( name) VALUES('AUSTRALIA');
INSERT INTO COUNTRY( name) VALUES('GERMANY');
INSERT INTO COUNTRY( name) VALUES('NEW ZEALAND');
INSERT INTO COUNTRY( name) VALUES('PORTUGAL');
INSERT INTO COUNTRY( name) VALUES('JAPON');
INSERT INTO COUNTRY( name) VALUES('CANADA');
INSERT INTO COUNTRY( name) VALUES('IRELAND');
INSERT INTO COUNTRY( name) VALUES('NIGERIA');
INSERT INTO COUNTRY( name) VALUES('BRAZIL');
INSERT INTO COUNTRY( name) VALUES('LEBANON');
INSERT INTO COUNTRY( name) VALUES('DENMARK');
INSERT INTO COUNTRY( name) VALUES('PORTO RICO');
INSERT INTO COUNTRY( name) VALUES('MOROCCO');
INSERT INTO COUNTRY( name) VALUES('ISRAEL');



INSERT INTO CATEGORY( name) VALUES('ACTION');
INSERT INTO CATEGORY( name) VALUES('ADVENTURE');
INSERT INTO CATEGORY( name) VALUES('COMEDY');
INSERT INTO CATEGORY( name) VALUES('CRIME');
INSERT INTO CATEGORY( name) VALUES('DRAMA');
INSERT INTO CATEGORY( name) VALUES('FANTASY');
INSERT INTO CATEGORY( name) VALUES('HORROR');
INSERT INTO CATEGORY( name) VALUES('SCIENCE FICTION');
INSERT INTO CATEGORY( name) VALUES('ANIMATION');
INSERT INTO CATEGORY( name) VALUES('ROMANCE');
INSERT INTO CATEGORY( name) VALUES('SUPER HERO');
INSERT INTO CATEGORY( name) VALUES('BIOGRAPHY');
INSERT INTO CATEGORY( name) VALUES('WAR');
INSERT INTO CATEGORY( name) VALUES('THRILLER');
INSERT INTO CATEGORY( name) VALUES('HISTORY');
INSERT INTO CATEGORY( name) VALUES('FAMILY');
INSERT INTO CATEGORY( name) VALUES('MYSTERY');

INSERT INTO DIRECTOR( name,age,countryID) VALUES('CHRISTOPHER NOLAN',58,2);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('STEVEN SPEILBERG',72,1);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('STANLEY KUBRICK',70,1);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('MARTIN SCRORSESE',76,4);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('ALFRED HITCHOCK',80,2);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('HAYAO MIYAZAKI',77,14);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('CHARLES CHAPLIN',88,2);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('QUENTIN TARANTINO',55,1);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('BILLY WILDER',95,1);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('AKIRA KUROSAWA',88,14);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('SERGIO LEONE',60,4);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('FRANCIS FORD COPPOLA',79,4);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('PETER JACKSON',57,12);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('DAVID FINCHER',56,1);
INSERT INTO DIRECTOR( name,age,countryID) VALUES('FRANK DARABONT',59,3);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('ROBERT ZEMECKIS',68,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('IRVIN KERSHNER',87,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('MILOS FORMAN',86,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('LANA WACHOWSKI',54,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('FERNANDO MEIRELLES',64,18);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('GEORGE LUCAS',74,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('JONATHAN DEMME',73,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('BOB PERSÝCHETTI',43,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('BRYAN SINGER',54,1);
INSERT INTO DIRECTOR(name,age,countryID) VALUES('LUC BESSON',60,3);



INSERT INTO ACTOR(name,age,countryID) VALUES('Christian Bale ',44,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Heath Ledger ',28,10);
INSERT INTO ACTOR(name,age,countryID) VALUES('Aaron Eckhart ',50,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Michael Caine ',85,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Sam Neill ',71,12);
INSERT INTO ACTOR(name,age,countryID) VALUES('Laure Dern',51,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jeff Goldblum ',66,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Richard Attenborough ',90,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bob Peck ',53,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Martin Ferrero ',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tim Robbins ',61,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Morgan Freeman ',82,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bob Gunton ',73,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('William Sadler ',69,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Clancy Brown ',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('LEONARDO DICAPRIO ',45,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Joseph Gordon-Levitt ',38,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ellen Page',32,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tom Hardy ',42,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ken Watanabe ',60,14);
INSERT INTO ACTOR(name,age,countryID) VALUES('Liam Neeson',67,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ben Kingsley',76,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ralph Fiennes',57,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Caroline Goadall',60,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jonathan Sagall',60,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Embeth Davidtz',54,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jack Nicholson',82,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Shelley Duvall',70,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Danny Lloyd',46,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Dee Wallace',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Henry Thomas',48,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Coyote',78,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Robert MacNaughton',53,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Drew Barrymore',34,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('K.C. Martell',53,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Katie Holmes',41,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gary Oldman',61,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Cillian Murphy',43,16);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tom Wilkinson',71,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Edward Norton',50,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Brad Pitt',55,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Meat Loaf',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Zach Grenier',65,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Richmond Arquette',56,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Andrews',67,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('George Maguire',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ben Affleck',47,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Rosamund Pike',40,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Neil Patrick Harris',45,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tyler Perry',51,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Carrie Coon',38,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Kim Dickens',54,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Patrick Fugit',76,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Clennon',37,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Elijah Wood',38,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Viggo Mortensen',61,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ian McKellen',80,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Sean Bean',60,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Orlando Bloom',41,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Miranda Otto',51,10);
INSERT INTO ACTOR(name,age,countryID) VALUES('Andy Serkis',54,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Hugo Weawing',59,17);
INSERT INTO ACTOR(name,age,countryID) VALUES('Liv Tyler',42,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Wenham',54,10);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gil Bellows',52,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Mark Rolston',63,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jeffrey DeMunn',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Larry Brandenburg',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Neil Giuntoli',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Marlon Brando',80,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Al Pacino',79,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('James Caan',79,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Robert Duvall',88,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('John Travolta',65,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Uma Thurman',49,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Samuel L. Jackson',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tim Roth',58,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Amanda Plummer',62,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bruce Willis',64,11);
INSERT INTO ACTOR(name,age,countryID) VALUES('Sean Astin',38,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Christopher Lee',93,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tom Hanks',62,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Robin Wright',52,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gary Sinise',63,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Rebecca Williams',59,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Sally Field',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Harold G. Herthum',79,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Michael Conner Humphreys',34,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Dobson',55,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Mark Hamill',68,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Harrison Ford ',77,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Carrie Fisher',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Billy Dee Williams',82,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Anthony Daniels',73,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Prowse',84,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Mayhew',79,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Kenny Baker',81,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Frank Oz',75,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Alec Guinness',86,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Louise Fletcher',85,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Will Sampson',53,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Michael Berryman',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Alonzo Brown',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Brocco',89,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Robert De Niro',76,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ray Liotta',65,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Joe Pesci',76,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Lorraine Bracco',65,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Paul Sorvino',80,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Keanu Reeves',55,19);
INSERT INTO ACTOR(name,age,countryID) VALUES('Laurence Fishburne',58,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Carrie-Anne Moss',52,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gloria Foster',67,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Joe Pantoliano',68,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Marcus Chong',52,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Julian Arahanga',47,12);
INSERT INTO ACTOR(name,age,countryID) VALUES('Matt Doran',43,10);
INSERT INTO ACTOR(name,age,countryID) VALUES('Robert Taylor',58,10);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Aston',61,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Andrew Kevin Walker',55,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Daniel Zacapa',68,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gwyneth Paltrow',46,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('John Cassini',55,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bob Mack',54,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Crombie',63,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Alexandre Rodrigues',39,18);
INSERT INTO ACTOR(name,age,countryID) VALUES('Leandro Firmino',40,18);
INSERT INTO ACTOR(name,age,countryID) VALUES('Phellipe Haagensen',31,18);
INSERT INTO ACTOR(name,age,countryID) VALUES('Douglas Silva',31,18);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jodie Foster',57,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Anthony Hopkins',82,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Kasi Lemmons',58,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Scott Glenn',78,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Shameik Moore',23,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jake Johnson',41,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Hailee Steinfeld',22,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Mahershala Ali',45,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Brian Tyree Henry',28,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Lilt Tomlin',80,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Rumi Hiiragi',32,14);
INSERT INTO ACTOR(name,age,countryID) VALUES('Miyu Irino',31,14);
INSERT INTO ACTOR(name,age,countryID) VALUES('Mari Natsuki',67,14);
INSERT INTO ACTOR(name,age,countryID) VALUES('Stephen Baldwin',53,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Gabriel Byrne',68,16);
INSERT INTO ACTOR(name,age,countryID) VALUES('Benicio Del Toro',52,21);
INSERT INTO ACTOR(name,age,countryID) VALUES('Kevin Pollak',62,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Kevin Spacey',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Chazz Palminteri',67,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Giancarlo Esposito',61,20);
INSERT INTO ACTOR(name,age,countryID) VALUES('Dan Hedaya',78,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Suzy Amis',57,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Pete Postlethwaite',64,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Tom Sizemore',58,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Edward Burns',51,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Barry Pepper',49,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Adam Goldberg',48,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Vin Diesel',52,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Giovanni Ribisi',45,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Matt Damon',49,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ted Danson',72,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Paul Giamatti',52,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Jean Reno',71,22);
INSERT INTO ACTOR(name,age,countryID) VALUES('Natalie Portman',38,23);
INSERT INTO ACTOR(name,age,countryID) VALUES('Danny Aiello',86,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Peter Appel',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Willi One Blood',25,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Don Creech',71,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Stuart Rudin',78,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Elizabeth Regen',34,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ellen Greene',68,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Morse',66,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bonnie Hunt',58,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Michael Clarke Duncan',54,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('James Cromwell',78,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Michael Jeter',50,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Graham Greene',67,15);
INSERT INTO ACTOR(name,age,countryID) VALUES('Doug Hutchison',59,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Sam Rockwell',51,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Patricia Clarkson',60,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Ellen Burstyn',87,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Matthew McConaughey',50,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Mackenzie Foy',19,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('John Lithgow',74,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Timothee Chalamet',24,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('David Oyelowo',43,2);
INSERT INTO ACTOR(name,age,countryID) VALUES('Collette Wolfe',39,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Bill Irwin',69,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Anne Hathaway',36,1);
INSERT INTO ACTOR(name,age,countryID) VALUES('Wes Bentley',41,1);




















INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Inception ','2010-07-30',8.8,1,1,8,148);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Jurassic Park ','1993-09-17',8.1,2,1,8,127);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Dark Knight ','2008-07-25',9.0,1,1,11,152);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Schindler’s List ','1994-03-04',8.9,2,1,5,195);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Shining','1980-06-06',8.4,3,1,7,146);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('E.T.','1984-01-01',7.9,2,1,8,115);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Batman Begins','2005-06-17',8.3,1,1,1,120);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Fight Club','1999-12-10',8.8,14,1,1,139);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Gone Girl','2014-10-10',8.1,14,1,4,149);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Lord of the Rings: The Return of the King ','2003-12-19',8.9,13,1,1,178);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Shawshank Redemption ','1995-03-10',9.3,15,1,5,142);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The GodFather','1972-03-14',9.2,12,1,4,175);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The GodFather Part II','1993-09-17',9,12,1,4,202);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Pulp Fiction','1994-04-14',8.9,8,1,4,154);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Lord of the Rings: The Fellowship of the Ring','2001-12-21',8.8,13,1,1,178);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Forrest Gump','1994-11-11',8.8,16,1,5,142);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Star Wars Episode V - The Empire Strikes Back ','1980-01-05',8.8,17,1,1,124);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Lord of the Rings: The Two Towers','2002-12-20',8.7,13,1,1,179);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('One Flew Over The Cuckoos Nest','1975-11-20',8.7,18,1,5,133);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Goodfellas','1990-12-28',8.7,4,1,4,146);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Matrix','1999-09-03',8.7,19,1,1,136);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Se7en','1995-02-19',8.6,14,1,5,127);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Cidade de Deus','2002-07-18',8.6,20,18,4,130);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Star Wars: A New Hope','1977-01-17',8.6,21,1,1,121);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Silence of the Lambs','1991-10-11',8.6,22,1,4,118);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Spider-Man:Into the Spider-Verse','2018-12-14',8.7,23,1,9,117);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Sen to Chihiro no Kamikakushi','2018-06-18',8.6,6,14,9,125);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Usual Suspects','1995-12-15',8.6,24,11,4,106);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Saving Private Ryan','1998-09-11',8.6,2,1,5,169);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Leon','1995-04-28',8.6,25,3,5,110);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('The Green Mile','2000-03-17',8.5,15,1,5,189);
INSERT INTO MOVIE( name,release_date,rate,directorID, countryID, categoryID,RunTimeMinutes) VALUES('Intersteller','2014-11-07',8.6,1,1,2,169);


INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(16,1);
INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(17,1);
INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(18,1);
INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(19,1);
INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(20,1);
INSERT INTO MOVIE_CAST(actorID,movieID) VALUES(5,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(6,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(7,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(8,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(9,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(10,2);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(1,3);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(2,3);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(3,3);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(4,3);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(21,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(22,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(23,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(24,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(25,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(26,4);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(27,5);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(28,5);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(29,5);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(30,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(31,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(32,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(33,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(34,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(35,6);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(1,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(4,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(21,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(36,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(37,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(38,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(39,7);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(40,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(41,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(42,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(43,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(44,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(45,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(46,8);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(47,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(48,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(49,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(50,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(51,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(52,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(53,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(54,9);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(55,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(56,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(57,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(58,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(59,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(60,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(61,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(62,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(63,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(64,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(11,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(12,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(13,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(14,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(15,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(65,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(66,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(67,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(68,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(69,11);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(70,12);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(71,12);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(72,12);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(73,12);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(70,13);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(71,13);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(72,13);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(73,13);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(74,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(75,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(76,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(77,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(78,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(79,14);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(55,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(56,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(57,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(58,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(59,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(60,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(61,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(62,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(63,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(64,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(80,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(81,15);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(80,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(81,10);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(82,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(83,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(84,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(85,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(86,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(87,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(88,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(89,16);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(90,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(91,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(92,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(93,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(94,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(95,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(96,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(97,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(98,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(99,17);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(55,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(56,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(57,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(58,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(59,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(60,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(61,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(62,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(63,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(64,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(80,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(81,18);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(27,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(100,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(101,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(102,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(103,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(104,19);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(105,20);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(106,20);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(107,20);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(108,20);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(109,20);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(110,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(111,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(112,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(113,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(114,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(115,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(116,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(117,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(118,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(119,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(62,21);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(12,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(41,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(120,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(121,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(122,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(123,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(124,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(125,22);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(126,23);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(127,23);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(128,23);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(129,23);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(90,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(91,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(92,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(93,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(94,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(95,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(96,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(97,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(98,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(99,24);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(130,25);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(131,25);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(132,25);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(133,25);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(134,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(135,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(136,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(137,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(138,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(139,26);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(140,27);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(141,27);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(142,27);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(143,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(144,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(145,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(146,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(147,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(148,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(149,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(150,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(151,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(152,28);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(153,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(154,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(155,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(156,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(157,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(158,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(159,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(160,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(161,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(82,29);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(162,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(163,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(164,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(165,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(166,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(167,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(168,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(169,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(170,30);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(171,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(172,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(173,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(174,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(175,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(176,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(177,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(178,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(179,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(67,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(155,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(82,31);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(180,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(181,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(182,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(183,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(184,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(185,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(186,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(187,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(188,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(189,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(4,32);
INSERT INTO MOVIE_CAST( actorID,movieID) VALUES(159,32);





INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(1,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(1,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(1,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(2,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(2,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(2,14);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(3,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(3,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(3,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(4,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(4,12);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(4,15);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(5,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(5,7);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(6,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(6,16);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(7,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(7,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(7,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(8,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(9,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(9,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(9,17);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(10,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(10,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(10,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(11,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(12,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(12,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(13,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(13,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(14,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(14,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(15,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(15,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(15,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(16,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(16,10);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(17,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(17,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(17,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(17,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(18,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(18,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(18,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(19,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(20,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(20,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(21,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(21,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(22,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(22,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(22,17);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(23,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(23,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(24,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(24,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(24,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(24,8);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(25,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(25,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(25,14);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(26,1);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(26,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(26,9);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(27,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(27,9);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(27,16);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(28,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(28,14);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(28,17);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(29,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(29,13);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(30,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(30,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(30,14);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(31,4);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(31,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(31,6);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(32,2);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(32,5);
INSERT INTO MOVIE_CATEGORY( movieID, categoryID) VALUES(32,8);




INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Achievement in Cinematography',2011,1)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Achievement in Visual Effects',2011,1)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Sound',1994,2)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Effects Editing',1994,2)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Effects, Visual Effects',1994,2)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Picture',2003,10)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Film Editing',2003,10)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Costume Design',2003,10)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Makeup',2003,10)
INSERT INTO REWARD(name,reward_year,movieID) VALUES('Best Music, Original Song',2003,10)