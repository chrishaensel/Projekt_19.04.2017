DROP TABLE IF EXISTS
profil CASCADE;

DROP DOMAIN IF EXISTS checkzero, checknull CASCADE;

--Prüft, ob ein Integer-Wert größer Null ist.
CREATE DOMAIN checkzero AS integer 
  	CHECK (VALUE > 0);

--Prüft, ob ein text ungleich '' ist, damit man keine leeren Strings angeben darf.
CREATE DOMAIN checknull AS text
	CHECK (VALUE != ''::text);

--Tabelle, in der die Hunderassen aufgelistet werden (Look-Up-Tabelle).
CREATE TABLE hunde_rassen(
	name checknull PRIMARY KEY
);

INSERT INTO hunde_rassen(name)
	VALUES 
    ('Berner Sennenhund'),
    ('Afghanischer Windhund'),
    ('Akita'),
    ('Alaskan Malamute'),
    ('Alaskan Husky'),
    ('Altdeutscher Schäferhund'),
    ('American Bulldog'),
    ('American Pit Bull Terrier'),
    ('American Staffordshire Terrier'),
    ('Australien Shepherd'),
    ('Basenji'),
    ('Basset Hound'),
    ('Beagle'),
    ('Bearded Collie'),
    ('Belgischer Schäferhund'),
    ('Berner Laufhund'),
    ('Bernhardiner'),
    ('Bichon Frisé'),
    ('Bloodhound'),
    ('Bobtail'),
    ('Bologneser'),
    ('Bolonka Franzuska'),
    ('Bolonka Zwetna'),
    ('Border Collie'),
    ('Boxer'),
    ('Fila Brasileiro'),
    ('Briard'),
    ('Broholmer'),
    ('Bullmastiff'),
    ('Bullterrier'),
    ('Englische Bulldogge'),
    ('Cairn Terrier'),
    ('Catahoula Bulldog'),
    ('Cavalier King Charles Spaniel'),
    ('Chihuahua'),
    ('Chow-Chow'),
    ('Collie'),
    ('English Cocker Spaniel'),
    ('Welsh Corgi Cardigan'),
    ('Welsh Corgi Pembroke'),
    ('Dackel'),
    ('Dalmatiner'),
    ('Deutsche Dogge'),
    ('Deutsch Drahthaar'),
    ('Deutsch Kurzhaar'),
    ('Deutsch Langhaar'),
    ('Deutsch Stichelhaar'),
    ('Deutsche Bracke'),
    ('Deutscher Boxer'),
    ('Deutscher Jagdterrier'),
    ('Deutscher Pinscher'),
    ('Deutscher Schäferhund'),
    ('Deutsche Spitze'),
    ('Deutscher Wachtelhund'),
    ('Dingo'),
    ('Dobermann'),
    ('English Foxhound'),
    ('English Pointer'),
    ('English Setter'),
    ('English Shepherd'),
    ('Finnischer Laufhund'),
    ('Finnischer Lapphund'),
    ('Flat Coated Retriever'),
    ('Foxterrier'),
    ('Französische Bulldogge'),
    ('Goldendoodle'),
    ('Golden Retriever'),
    ('Griechischer Schäferhund'),
    ('Grönlandhund'),
    ('Großer Münsterländer'),
    ('Grosser Schweizer Sennenhund'),
    ('Pudel'),
    ('Havaneser'),
    ('Hokkaido'),
    ('Hovawart'),
    ('Wolfsspitz'),
    ('Siberian Husky'),
    ('Irischer Wolfshund'),
    ('Irish Red Setter'),
    ('Irish Terrier'),
    ('Irish Water Spaniel'),
    ('Jack Russell Terrier'),
    ('Jakutischer Laika'),
    ('Japan Spitz'),
    ('Montenegrinischer Gebirgslaufhund'),
    ('Kanaan Hund'),
    ('Berger Blanc Suisse'),
    ('Karakatschan'),
    ('Kaukasischer Owtscharka'),
    ('Kleiner Münsterländer'),
    ('Kleinspitz'),
    ('Komondor'),
    ('Labradoodle'),
    ('Labrador Retriever'),
    ('Landseer'),
    ('Lancashire Heeler'),
    ('Lapphund'),
    ('Lappländischer Rentierhund'),
    ('Leonberger'),
    ('Longdog'),
    ('Löwchen'),
    ('Lurcher'),
    ('Alaskan Malamute'),
    ('Malteser'),
    ('Mops'),
    ('Neufundländer'),
    ('Nova Scotia Duck Tolling Retriever'),
    ('Polnische Bracke'),
    ('Osteuropäischer Schäferhund'),
    ('Otterhund'),
    ('Papillon'),
    ('Peruanischer Nackthund'),
    ('Pharaonenhund'),
    ('Phu Quoc Ridgeback'),
    ('Zwergpinscher'),
    ('Podenco'),
    ('Rat Terrier'),
    ('Barsoi'),
    ('Rottweiler'),
    ('Schnauzer'),
    ('Rhodesian Ridgeback'),
    ('Europäischer Schlittenhund'),
    ('Samojede'),
    ('Saluki'),
    ('Scottish Terrier'),
    ('Shar-Pei'),
    ('Shiba'),
    ('Shih Tzu'),
    ('Taiwanhund'),
    ('Tamaskan'),
    ('Tibet-Terrier'),
    ('Tschechischer Berghund'),
    ('Tschechischer Terrier'),
    ('Tschechoslowakischer Wolfhund'),
    ('Türkischer Mastiff'),
    ('Weimaraner'),
    ('Welsh Sheepdog'),
    ('Welsh Terrier'),
    ('Whippet'),
    ('Yorkshire Terrier');

--Tabelle, in der die Geschlechter stehen (Look-Up-Tabelle).
CREATE TABLE geschlechter(
	name checknull PRIMARY KEY
);

INSERT INTO geschlechter(name)
	VALUES 
    ('männlich'),
    ('weiblich');

--1) Tabelle, in der die allgemeinen Angaben zu einem Hund stehen.
CREATE TABLE allgemeine_angaben(
    id checkzero PRIMARY KEY,
    name checknull NOT NULL,  
    geschlecht checknull REFERENCES geschlechter NOT NULL, 
    alter checkzero,
    seit_wann_tierheim date,
    rasse checknull REFERENCES hunderassen NOT NULL DEFAULT 'unbekannt',
    groesse checkzero
);

INSERT INTO allgemeine_angaben(id, name, geschlecht, alter, seit_wann_tierheim, rasse, groesse)
	VALUES
	(0001,"Berry","männlich",3,2014-10-03,"Berner Sennenhund", 62);


--5) Tabelle, in der die Fähigkeiten aufgelistet werden.
CREATE TABLE faehigkeiten(
    stubenrein boolean,
    alleine_bleiben boolean,
    leine_gehen boolean,
    neben_fahrrad_gehen boolean,
    auto_fahren boolean,
    basis_kommandoes boolean,
    laerm_gewoehnt boolean,
    abrufbar boolean,
    apportieren boolean
);
d
--2) Tabelle, in der die Icons zu den Hunden aufgelistet werden.
CREATE TABLE icons(
    hundefreundlich_alle boolean,
    hundefreundlich_maennlich boolean,
    hundefreundlich_weiblich boolean,
    katzenfreundlich boolean,
    paarvermittlung boolean,
    schwierig boolean
);

--3) Tabelle, in der der Charakter zu den Hunden aufgelistet wird.
CREATE TABLE charakter(
    futterneid boolean,
    sportlich boolean,
    viel_beschäftigung boolean,
    ängstlich boolean,
    aggressiv boolean,
    scheu boolean,
    menschenbezogen boolean,
    mag_wasser boolean
);

--4) Tabelle, in der die Besonderheiten zu den Hunden aufgelistet wird.
CREATE TABLE charakter(
    
);


--Tabelle, in der dem Hund die Fähigkeiten, Icons, Charakter und Besonderheiten zugeordnet werden.
CREATE TABLE profil(
    id checkzero PRIMARY KEY,
    name checknull NOT NULL,  
    geschlecht checknull REFERENCES geschlechter NOT NULL, 
    alter checkzero,
    seit_wann_tierheim date,
    rasse checknull REFERENCES hunderassen NOT NULL DEFAULT 'unbekannt',
    groesse checkzero
);




