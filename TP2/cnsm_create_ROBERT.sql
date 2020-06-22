BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "se deroule (cours)" (
	"date_cours"	TEXT NOT NULL,
	"id_salle"	INTEGER NOT NULL,
	"enseignement"	INTEGER NOT NULL,
	FOREIGN KEY("enseignement") REFERENCES "Enseignement"("id_enseignement"),
	PRIMARY KEY("date_cours"),
	FOREIGN KEY("id_salle") REFERENCES "Salle"("id_salle")
);
CREATE TABLE IF NOT EXISTS "etudie" (
	"note"	REAL,
	"Professeur"	TEXT NOT NULL,
	"Etudiant"	TEXT NOT NULL,
	FOREIGN KEY("Etudiant") REFERENCES "etudiant"("id_etudiant"),
	PRIMARY KEY("note"),
	FOREIGN KEY("Professeur") REFERENCES "professeur"("id_professeur")
);
CREATE TABLE IF NOT EXISTS "instrument" (
	"id_instrument"	INTEGER,
	"instrument"	TEXT,
	PRIMARY KEY("id_instrument")
);
CREATE TABLE IF NOT EXISTS "Salle" (
	"id_salle"	INTEGER,
	"nom_salle"	TEXT,
	"capacite"	INTEGER,
	PRIMARY KEY("id_salle")
);
CREATE TABLE IF NOT EXISTS "Enseignement" (
	"id_enseignement"	INTEGER,
	"intitule"	TEXT,
	"coeff"	REAL,
	PRIMARY KEY("id_enseignement")
);
CREATE TABLE IF NOT EXISTS "Professeur" (
	"id_professeur"	INTEGER,
	"nom"	TEXT NON,
	"prenom"	TEXT,
	"date_de_naissance"	TEXT,
	PRIMARY KEY("id_professeur")
);
CREATE TABLE IF NOT EXISTS "Etudiant" (
	"id_etudiant"	INTEGER,
	"nom"	TEXT NON,
	"prenom"	TEXT,
	"date_de_naissance"	TEXT,
	"classe"	TEXT,
	PRIMARY KEY("id_etudiant")
);
INSERT INTO "Enseignement" VALUES (1,NULL,NULL);
COMMIT;
