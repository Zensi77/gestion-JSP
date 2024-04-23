DROP DATABASE peliculas;
CREATE DATABASE IF NOT EXISTS peliculas;

USE peliculas;

CREATE TABLE IF NOT EXISTS usuario(    
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    anio_nacimiento INT,
    ciudad VARCHAR(255),
    foto VARCHAR(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pelicula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    genero VARCHAR(255) NOT NULL,
    duracion INT NOT NULL,
    anio_grabacion INT NOT NULL
);

CREATE TABLE IF NOT EXISTS actor (
    id_pelicula INT NOT NULL,
    id_persona INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_persona),
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS direccion_pelicula(
    id_pelicula INT NOT NULL,
    id_persona INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_persona),
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);




INSERT INTO usuario (email, password, nombre_usuario) VALUES 
('root@root.es', 'root', 'Administrador'),
('user@user.es', 'user','Usuario Generico');

-- Hay 550 personas
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto) VALUE ('Carlos', 'Gomez', 1985, 'Madrid', 'foto5.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Laura', 'Rodriguez', 1995, 'Barcelona', 'foto6.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Miguel', 'Sanchez', 1978, 'Valencia', 'foto7.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sara', 'Fernandez', 1982, 'Sevilla', 'foto8.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Luis', 'Gonzalez', 1990, 'Madrid', 'foto9.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elena', 'Lopez', 1987, 'Barcelona', 'foto10.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Javier', 'Hernandez', 1975, 'Valencia', 'foto11.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Carmen', 'Garcia', 1989, 'Sevilla', 'foto12.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Diego', 'Martinez', 1983, 'Madrid', 'foto13.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Isabel', 'Perez', 1992, 'Barcelona', 'foto14.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Raul', 'Lopez', 1979, 'Valencia', 'foto15.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Natalia', 'Sanchez', 1986, 'Sevilla', 'foto16.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hugo', 'Fernandez', 1993, 'Madrid', 'foto17.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alicia', 'Gonzalez', 1977, 'Barcelona', 'foto18.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pablo', 'Lopez', 1984, 'Valencia', 'foto19.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eva', 'Hernandez', 1991, 'Sevilla', 'foto20.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mario', 'Garcia', 1976, 'Madrid', 'foto21.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lorena', 'Martinez', 1988, 'Barcelona', 'foto22.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Roberto', 'Perez', 1981, 'Valencia', 'foto23.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Clara', 'Sanchez', 1994, 'Sevilla', 'foto24.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Daniel', 'Fernandez', 1974, 'Madrid', 'foto25.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sofia', 'Gonzalez', 1989, 'Barcelona', 'foto26.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alejandro', 'Lopez', 1986, 'Valencia', 'foto27.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Carolina', 'Hernandez', 1993, 'Sevilla', 'foto28.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marcos', 'Garcia', 1978, 'Madrid', 'foto29.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ines', 'Martinez', 1985, 'Barcelona', 'foto30.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hector', 'Perez', 1992, 'Valencia', 'foto31.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Olivia', 'Sanchez', 1979, 'Sevilla', 'foto32.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucas', 'Fernandez', 1986, 'Madrid', 'foto33.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Valeria', 'Gonzalez', 1993, 'Barcelona', 'foto34.jpg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Juan', 'Perez', 1990, 'Barcelona', 'foto2.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('María', 'López', 1982, 'Valencia', 'foto3.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ana', 'Martínez', 1978, 'Sevilla', 'foto4.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pedro', 'Rodríguez', 1989, 'Bilbao', 'foto6.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Laura', 'García', 1987, 'Málaga', 'foto7.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Diego', 'Fernández', 1984, 'Alicante', 'foto8.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elena', 'Sánchez', 1980, 'Granada', 'foto9.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sergio', 'González', 1995, 'Zaragoza', 'foto10.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marta', 'Díaz', 1986, 'Murcia', 'foto11.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pablo', 'Hernández', 1983, 'Córdoba', 'foto12.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucía', 'Romero', 1992, 'Valladolid', 'foto13.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alejandro', 'Gutiérrez', 1975, 'Palma de Mallorca', 'foto14.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Natalia', 'Suárez', 1991, 'Las Palmas', 'foto15.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Javier', 'Torres', 1981, 'Santa Cruz de Tenerife', 'foto16.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Carmen', 'Reyes', 1988, 'Santander', 'foto17.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('José', 'Ortega', 1979, 'Gijón', 'foto18.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sara', 'Jiménez', 1983, 'Vitoria-Gasteiz', 'foto19.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Daniel', 'Molina', 1993, 'Logroño', 'foto20.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Isabel', 'Navarro', 1986, 'Pamplona', 'foto21.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alberto', 'Iglesias', 1984, 'Toledo', 'foto22.jpg'), 
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eva', 'Rubio', 1977, 'Santiago de Compostela', 'foto23.jpg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lyn', 'Allridge', 1993, 'La Virtud', 'OrciEgetOrci.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Orin', 'Torrie', 1987, 'Muzaffargarh', 'Sit.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Matthieu', 'Milbourn', 2008, 'Abuxarda', 'CumSociisNatoque.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sydel', 'Johnikin', 2007, 'Tarumizu', 'Massa.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Caralie', 'Jaksic', 2006, 'Rushankou', 'OdioCrasMi.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nikoletta', 'Gaspero', 2001, 'San Juan', 'Id.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Binky', 'Pizzie', 2009, 'Sakété', 'Libero.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ulrikaumeko', 'Bordes', 2013, 'Potok Złoty', 'ElementumPellentesqueQuisque.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Arte', 'Keavy', 2007, 'Quinta de Valadares', 'At.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Batholomew', 'Gowthrop', 2003, 'Nîmes', 'VolutpatErat.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nara', 'Hamal', 2010, 'Heemskerk', 'AtVelitVivamus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Abby', 'Lermit', 2003, 'Ýpsonas', 'Nam.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teddy', 'Beidebeke', 1997, 'Detroit', 'NullaNislNunc.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kacy', 'McFfaden', 2000, 'Byerazino', 'NullaJusto.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Margaux', 'Wimsett', 2000, 'Farmington', 'Blandit.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Chelsae', 'Chamberlain', 2006, 'Warburton', 'PosuereNonummyInteger.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Amelita', 'Classen', 1992, 'Faeanak Dua', 'NonPretium.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rolf', 'Froome', 1986, 'Cijoho', 'Purus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Harrie', 'Ghiraldi', 2006, 'Nagrumbuan', 'Iaculis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marley', 'Armal', 1997, 'Kawit', 'ConvallisTortorRisus.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Estel', 'Gumbley', 2011, 'Sandovo', 'MusVivamus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Othelia', 'Wipper', 1993, 'Yong’an', 'AeneanSit.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fergus', 'Ren', 1994, 'Aigínio', 'PhasellusSit.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Cordie', 'Sanford', 1998, 'Rancanyenang', 'QuisTortorId.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rowe', 'Fillery', 2005, 'Dongxing', 'MiSit.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rosina', 'Doerling', 1998, 'Phonphisai', 'Ipsum.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Humfrey', 'Cherrett', 1996, 'Jingyu', 'NullaPede.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Modesta', 'Treadgear', 1996, 'Detroit', 'VulputateJustoIn.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Zelma', 'Askell', 2011, 'Xiaomei', 'OrnareConsequatLectus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Huey', 'Trenear', 1998, 'Ufa', 'EgetRutrum.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Paxton', 'Demschke', 1995, 'Shalinskoye', 'MiSitAmet.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rip', 'Sharpley', 2005, 'Mikulintsy', 'IpsumPraesentBlandit.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Janka', 'McNutt', 2011, 'Ciperang', 'Rhoncus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lurline', 'Kemmis', 2007, 'Longgang', 'Ultrices.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Whittaker', 'Streeton', 2012, 'Ust’-Kut', 'FaucibusOrci.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucinda', 'Dewberry', 2003, 'Ūdalah', 'Faucibus.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kore', 'Tschierasche', 1996, 'Port Saint Lucie', 'InLibero.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Randell', 'Curner', 2011, 'Barang', 'NecMolestie.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gawen', 'MacKenny', 2013, 'Ignalina', 'Augue.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kristan', 'Quartermain', 2004, 'Libouchec', 'UtOdioCras.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eartha', 'Headan', 1995, 'Kedungbulu', 'ViverraDiamVitae.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pete', 'Jess', 2006, 'Ras al-Khaimah', 'CondimentumId.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Brana', 'Kettles', 2002, 'San Manuel Chaparrón', 'CuraeNullaDapibus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dulcie', 'Auton', 2005, 'Buritizeiro', 'Aliquam.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fan', 'Zack', 1985, 'Hesi', 'At.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Arvy', 'Hutcheons', 1996, 'Oemollo', 'Tempor.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Druci', 'Houlton', 2003, 'Dulag', 'VelitEuEst.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Moina', 'Dericot', 1993, 'Dhromolaxia', 'AccumsanTortor.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dare', 'Burcombe', 2003, 'Pasian', 'VivamusInFelis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Galvin', 'Cleaver', 2002, 'Horad Krychaw', 'Massa.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Joelie', 'Donnett', 1997, 'Majdal Banī Fāḑil', 'Pede.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Wald', 'Gilstin', 1995, 'Pajannangger', 'Odio.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Helsa', 'Prozescky', 1996, 'Schiedam postbusnummers', 'NuncViverraDapibus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lida', 'Gogie', 2001, 'Lebel-sur-Quévillon', 'LacusAtVelit.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Anica', 'Guiel', 1994, 'Komatsu', 'EnimLorem.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pietrek', 'Smaleman', 2003, 'Béziers', 'AugueVestibulumAnte.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Torin', 'Martine', 2011, 'Kobuleti', 'Sed.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teresina', 'Dunseath', 2005, 'Pananaw', 'SapienArcu.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mick', 'Dowthwaite', 1995, 'Komorów', 'TortorQuis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Diahann', 'Puddicombe', 1999, 'Puerto Quijarro', 'Et.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Christyna', 'Itzak', 2009, 'Oliveira', 'UtOdio.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Scarlet', 'Lalonde', 2010, 'Istaravshan', 'CursusIdTurpis.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Udale', 'MacDuff', 2009, 'Kromy', 'SitAmetConsectetuer.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Roth', 'Fairall', 2012, 'Johor Bahru', 'Parturitur.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Trever', 'Yankishin', 2001, 'Kusatsu', 'Vivamus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alain', 'Adanet', 1993, 'Bejuco', 'Ligula.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kelcie', 'Mandy', 1992, 'Manukau City', 'Blandit.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marco', 'De Giorgi', 2005, 'Guadalupe', 'ElitSodales.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Prue', 'Clemson', 2001, 'Leixlip', 'Primis.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hillary', 'Shorten', 2009, 'Raglan', 'NislVenenatisLacinia.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tommy', 'Hartropp', 1998, 'Stonewall', 'PortaVolutpat.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gideon', 'Whiles', 2002, 'Cikijing', 'Eu.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elga', 'Carnall', 2009, 'Middleton', 'UtAtDolor.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mychal', 'Stait', 1975, 'Xucheng', 'UtDolorMorbi.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sianna', 'Donisi', 2001, 'Ceres', 'PretiumIaculis.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Idalia', 'Iddy', 2006, 'Pasarkuok', 'SitAmetConsectetuer.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jewelle', 'Axtens', 2012, 'Shāhpur Chākar', 'ScelerisqueMauris.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Oralla', 'Northin', 2009, 'Bukhovo', 'IpsumPraesent.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fletcher', 'Barme', 1999, 'Dayton', 'NullamOrciPede.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gillan', 'MacDowal', 2005, 'Jiaobei', 'Magna.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kristopher', 'Peeter', 2001, 'Sośnicowice', 'LobortisEstPhasellus.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sibilla', 'O''Collopy', 1986, 'El Fahs', 'AmetNuncViverra.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Clarissa', 'Burkinshaw', 1987, 'Paraíso', 'DapibusAtDiam.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Minnie', 'Mannering', 2008, 'Umabay', 'Semper.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Burgess', 'Milam', 1994, 'Delodpeken', 'Lorem.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nyssa', 'Marrion', 2009, 'Salgueiro', 'Mattis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ellerey', 'Darrel', 2006, 'Tāngāil', 'EtTempusSemper.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Wilhelmine', 'Dunnaway', 2007, 'Castro Daire', 'In.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eden', 'Ireson', 2008, 'Jagodnjak', 'Donec.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Darn', 'Tolan', 1998, 'Tsinandali', 'Vestibulum.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Guillemette', 'O''Sirin', 1995, 'Pechenizhyn', 'Tellus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucienne', 'Eisikowitz', 2012, 'Pegongan', 'PretiumQuis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Clevey', 'Pettet', 1992, 'Bakersfield', 'LeoOdioPorttitor.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Deva', 'Elves', 2009, 'Lizhuang', 'EratNullaTempus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Melodee', 'Meynell', 1997, 'Stockholm', 'Ligula.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gerome', 'Sibille', 1995, 'Osoyoos', 'Magnis.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Cyndia', 'Bovaird', 1985, 'Fajões', 'LoremIpsum.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hale', 'Vettore', 2011, 'Zhongshangang', 'Porttitor.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tedman', 'Soutar', 2009, 'Huangmao', 'TinciduntEu.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Torr', 'Kalisz', 1988, 'Boca do Acre', 'UtVolutpatSapien.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Reynold', 'Sebring', 2003, 'Sukhobuzimskoye', 'EuSapienCursus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dacie', 'Prentice', 2003, 'Kebon', 'MassaQuisAugue.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fabe', 'Nuccii', 2007, 'Stockholm', 'SuspendissePotenti.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fabian', 'Gavini', 2004, 'Naples', 'Ut.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Charla', 'Merdew', 2002, 'Banepa', 'Pretium.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Aurie', 'Feedham', 2007, 'Lingyang', 'AcTellusSemper.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Osbourn', 'Daingerfield', 1990, 'Angan', 'CuraeMaurisViverra.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kristo', 'Djekic', 2010, 'Binangun', 'Et.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sharl', 'Antcliffe', 1995, 'Sremski Karlovci', 'Pede.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rodie', 'Angrave', 1995, 'Thepharak', 'MorbiVestibulumVelit.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Yolanda', 'Kamall', 2007, 'Sipocot', 'Ultrices.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jacinda', 'Broxup', 2008, 'Ushi', 'SapienVarius.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Norine', 'Maleney', 2012, 'Saba Yoi', 'UrnaPretium.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sandi', 'Tyer', 1997, 'Macinhata da Seixa', 'In.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lenee', 'Gerardin', 2010, 'Neya', 'Lectus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Danyelle', 'Starrs', 1998, 'Ciyu', 'ArcuSedAugue.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Thomasine', 'Padly', 2000, 'Katoúna', 'Non.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tymothy', 'Ashmore', 1985, 'Taodian', 'PosuereCubiliaCurae.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Galvin', 'Heaffey', 2006, 'Huayuanli', 'VelitDonecDiam.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Curtis', 'Schuh', 2002, 'Canomoy', 'OrciVehiculaCondimentum.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Worthington', 'Tavner', 2009, 'Kobylanka', 'TempusVel.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Germaine', 'Beniesh', 1962, 'Baojia', 'AmetNulla.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nolan', 'Click', 2001, 'Calauag', 'HabitassePlatea.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Boothe', 'Brealey', 1995, 'Blantyre', 'Et.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jeanine', 'Barwood', 2001, 'Kozhanka', 'EleifendLuctusUltricies.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Benedicta', 'Beere', 2006, 'Solţānābād', 'SemperInterdum.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Phillipp', 'Keune', 2007, 'Slobodskoy', 'AmetConsectetuer.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Slade', 'Melladew', 1995, 'Marelesu', 'CrasMi.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pietro', 'Cavill', 2001, 'Paritjunus', 'Vulputate.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dolf', 'Jaggar', 2009, 'Hetang', 'LeoPellentesque.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dacia', 'Takos', 2000, 'Lokavec', 'DisParturientMontes.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nolie', 'Hebbs', 2006, 'Shigou', 'Nam.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elissa', 'Koschke', 1999, 'Gabi', 'CuraeDuis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lotta', 'Goodanew', 2007, 'Piribebuy', 'AugueAliquam.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Chelsea', 'Toping', 1992, 'Pionerskiy', 'Convallis.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jojo', 'L''Episcopi', 1996, 'Iza', 'NullaEget.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Bernadene', 'Stuke', 1993, 'Weetombo', 'NuncCommodo.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ibbie', 'Thickpenny', 2010, 'Surup', 'Turpis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Daryl', 'Loney', 2000, 'Cairani', 'NibhInLectus.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Frank', 'Dreye', 1993, 'Saint Louis', 'Metus.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pierce', 'Della', 1998, 'Samut Sakhon', 'MorbiVelLectus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lorenzo', 'Paszek', 2006, 'Guradog', 'AcNibhFusce.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Janeva', 'Oatley', 1999, 'Eybens', 'UltricesPosuereCubilia.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Shelton', 'Peggs', 2008, 'San Francisco', 'PurusPhasellusIn.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marybeth', 'Jimson', 1992, 'Shali', 'CubiliaCuraeDuis.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Miranda', 'Murdoch', 1984, 'Trieste', 'Tincidunt.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Harmon', 'Luckes', 2005, 'Longra', 'CondimentumId.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ingamar', 'Pitkeathly', 2004, 'Akron', 'Dui.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Raddy', 'Doman', 2004, 'Ūdalah', 'PurusPhasellusIn.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alina', 'Gall', 1994, 'Nice', 'RidiculusMus.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jozef', 'Huckell', 1992, 'Ubonratana', 'AcNequeDuis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lek', 'Coskerry', 2008, 'Marale', 'DiamVitae.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lanie', 'Gaskell', 1998, 'Novouzensk', 'HacHabitassePlatea.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tiffany', 'Mapstone', 2008, 'Pira', 'DolorQuis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Oneida', 'Voller', 2005, 'Bandong', 'AcTellus.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Talyah', 'Bisson', 2011, 'Tuymazy', 'FermentumJustoNec.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Even', 'Saich', 1994, 'Miandrivazo', 'VelitEuEst.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Norbie', 'Mableson', 2006, 'Zgurovka', 'FusceConsequatNulla.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Saw', 'Woolstenholmes', 2013, 'Hobart', 'ArcuSed.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pryce', 'Jeffels', 2011, 'Stradbally', 'Luctus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Veronike', 'Khristoforov', 1995, 'Borås', 'ANibh.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Skipp', 'Olesen', 2004, 'Kota Kinabalu', 'Sem.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Geno', 'Duthie', 1997, 'Qiaotou', 'Tincidunt.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hyacinth', 'Lieb', 2011, 'Panite', 'AuctorGravidaSem.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kurtis', 'Skatcher', 1996, 'New Washington', 'AtNuncCommodo.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marcela', 'Mohun', 2010, 'Biritiba Mirim', 'TurpisNec.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ailyn', 'Jepperson', 2007, 'Chifeng', 'DuisAc.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gianni', 'Renwick', 1994, 'Denpasar', 'TristiqueIn.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Grata', 'Godmar', 2010, 'Kool Tengah', 'LoremQuisqueUt.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Shaylyn', 'Tapson', 2003, 'Moryń', 'AcDiamCras.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gus', 'Dooney', 1993, 'Sovetskiy', 'Quam.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Francine', 'Kopf', 1996, 'Ventsy', 'ElementumIn.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sonnnie', 'Bricksey', 1988, 'Igbo-Ukwu', 'TristiqueTortorEu.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Siward', 'Scully', 2013, 'Shayu', 'RhoncusAliquet.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fredric', 'Deshorts', 2000, 'Amboise', 'Nibh.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Myrna', 'Jantot', 2004, 'A’yi Take', 'CuraeDonecPharetra.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Giuditta', 'Scarsbrooke', 1994, 'Chubek', 'NullaMollisMolestie.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Artur', 'Dominy', 1995, 'Abomey-Calavi', 'AliquetMaecenasLeo.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Norbert', 'Renforth', 2009, 'Zhongtang', 'AmetEleifend.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Buiron', 'Farrand', 2004, 'Kyzylorda', 'Non.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dalis', 'Giller', 1998, 'Henan’an', 'TurpisA.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alberik', 'Lghan', 1996, 'Horodok', 'NasceturRidiculusMus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Karim', 'Brixham', 1993, 'Karangmulya', 'AmetNuncViverra.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Odella', 'Glazebrook', 2008, 'San Miguel del Padrón', 'ANibh.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Maggee', 'Hilary', 2011, 'Ketapang', 'ConsequatInConsequat.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nestor', 'Titcombe', 1992, 'São Domingos', 'SodalesSedTincidunt.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Garold', 'Flewin', 1988, 'Magistral’nyy', 'CondimentumIdLuctus.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Beitris', 'Ganny', 2008, 'Diang', 'Nunc.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kelcey', 'O''Boyle', 2003, 'Xingzi', 'Nisi.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Brena', 'Kaman', 1992, 'Majagual', 'CumSociis.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alexandrina', 'Dumblton', 1986, 'Paraipaba', 'Eu.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ardisj', 'Bartels-Ellis', 1971, 'Niš', 'Lectus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Bianka', 'Pietrzak', 2001, 'Qingshan', 'Volutpat.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kandy', 'Cosgrove', 2000, 'Takari', 'Viverra.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nettle', 'Delete', 2004, 'Xigangzi', 'DonecDiamNeque.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Thomasine', 'Poser', 2001, 'Bojong', 'Nulla.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Harriot', 'Carding', 1996, 'Qarqaraly', 'Nulla.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marinna', 'Antoniewicz', 2012, 'Cali', 'Purus.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Conrad', 'McGann', 1991, 'Anambongan', 'NislNuncNisl.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Padget', 'Vasey', 2007, 'Alenquer', 'Sem.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tanner', 'O''Hdirscoll', 2001, 'Masipi West', 'Leo.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jolene', 'Haker', 1993, 'Konispol', 'Blandit.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nichole', 'Attrie', 2000, 'Margita', 'JustoLaciniaEget.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Towney', 'Wainwright', 1977, 'Emiliano Zapata', 'Amet.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Willow', 'Trewhitt', 1968, 'Marull', 'CommodoVulputateJusto.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Guthry', 'O'' Liddy', 2007, 'Majayjay', 'Felis.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hildagarde', 'California', 2006, 'Santa Cruz', 'SapienPlaceratAnte.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Shane', 'Sandcraft', 2008, 'Wanzhai', 'SemperRutrum.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marlo', 'Swarbrick', 2007, 'Kamionka Strumitowa', 'NuncNislDuis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Liliane', 'Dinneen', 2011, 'Gwoźnica Górna', 'EgetErosElementum.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Staci', 'Knok', 2009, 'Xiheshan', 'NullaTellus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Skylar', 'Goodlet', 2009, 'Padre Bernardo', 'Consectetuer.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Coletta', 'Faires', 2003, 'Araguaína', 'DiamCrasPellentesque.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Albertine', 'Barendtsen', 1996, 'Si Bun Rueang', 'MorbiQuisTortor.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jeremias', 'Woodroof', 2001, 'Qinjia', 'DapibusNullaSuscipit.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Bradney', 'Finey', 1999, 'Omu Aran', 'Rutrum.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Callida', 'Hawkslee', 2002, 'Fengmen', 'Ligula.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Leonardo', 'Barnett', 2012, 'Bafatá', 'Id.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ivonne', 'Turgoose', 1995, 'Linpu', 'OrciPede.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teri', 'Cogswell', 1999, 'Huangqiao', 'Ante.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Barnett', 'Mennithorp', 2002, 'Gustavia', 'NonVelitNec.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Veda', 'Deeman', 2012, 'Birqīn', 'ParturientMontes.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ronni', 'Ziemecki', 2002, 'Berestechko', 'Dis.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Philip', 'Westfalen', 2004, 'San Agustin', 'Proin.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Samson', 'Gianulli', 2008, 'Yanshi', 'TurpisDonecPosuere.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lind', 'Brown', 1985, 'Aquia', 'SitAmetErat.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Greg', 'Downgate', 1967, 'Pingdi', 'Non.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pris', 'Arnaldy', 2003, 'Otukpa', 'SedLacus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Chrisy', 'Atte-Stone', 2000, 'Andongwei', 'Ornare.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Morse', 'Mewburn', 2008, 'Bealanana', 'QuisTurpisSed.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Raymund', 'Hincham', 1984, 'Parrita', 'SedTristique.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kora', 'Mander', 2007, 'Novi Bilokorovychi', 'UtSuscipitA.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mattias', 'Stiffkins', 1996, 'Kruty', 'PedeVenenatis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Brenn', 'Water', 2000, 'Lam Plai Mat', 'IpsumPrimis.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lynnea', 'Bursnall', 2003, 'Malaga', 'ASuscipitNulla.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Happy', 'Lezemore', 1992, 'Kazan', 'PedeVenenatis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Farrand', 'Fassan', 2006, 'Abastumani', 'HacHabitasse.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dee dee', 'Locker', 1993, 'Saba Yoi', 'OdioCurabiturConvallis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rodger', 'Brimble', 1964, 'Pantai Ceuremen', 'Porttitor.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Natalie', 'Polleye', 2011, 'Kuanheum', 'VelEnimSit.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Robbert', 'Cornewell', 2005, 'Dolní Studénky', 'NullaSedAccumsan.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kendrick', 'Crowdy', 2003, 'Chemal', 'AmetSem.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Christan', 'Savary', 1989, 'Aqtaū', 'In.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mona', 'Pittson', 1988, 'Frontignan', 'EratTortorSollicitudin.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alberta', 'Turle', 1994, 'Antalaha', 'CrasMiPede.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Zulema', 'Burford', 2006, 'Ehen Hudag', 'NibhLigula.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Nertie', 'Lazare', 2007, 'København', 'OdioDonec.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dottie', 'Starkings', 2011, 'Rybie', 'Ultrices.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jenna', 'Zincke', 2003, 'Velikovechnoye', 'ProinInterdum.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alphonso', 'Trevino', 2008, 'Aksakovo', 'ErosElementum.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Trevar', 'Silvester', 1993, 'Sobreiro', 'ConvallisMorbi.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alica', 'Mitchely', 2005, 'Longaví', 'EstEtTempus.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rosanna', 'Raigatt', 2004, 'Kamenný Přívoz', 'InBlanditUltrices.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Harmony', 'Gummery', 1987, 'Kansas City', 'HendreritAtVulputate.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Karim', 'Fakeley', 1997, 'Amvrosiyivka', 'ElitSodales.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pearla', 'Trimmell', 1992, 'Krasnyy Profintern', 'NecDuiLuctus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Holly', 'Sedman', 2003, 'Anh Son', 'OrciLuctus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jonell', 'Brusby', 1993, 'Gilin', 'Amet.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Worth', 'Spencers', 1998, 'Ploso', 'UltricesPosuere.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Maxim', 'Saunders', 1999, 'Alzamay', 'PosuereCubilia.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ree', 'Tallowin', 2002, 'Sakerta Timur', 'EnimBlandit.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Andris', 'Calvie', 2004, 'Qinggou', 'Sit.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Robena', 'Paling', 1996, 'Peishe', 'CongueEget.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Edmon', 'McKeating', 2009, 'Darungan', 'CommodoVulputate.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Catherin', 'Garnsey', 2010, 'Puteran Kidul', 'VenenatisNonSodales.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ernestus', 'Ewbanck', 2005, 'Palma Soriano', 'Elementum.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mariam', 'Raselles', 1997, 'Dali', 'PedeJustoLacinia.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tisha', 'Enderle', 1990, 'Hongos', 'Platea.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Denys', 'Penley', 2005, 'Banjar Tegal Belodan', 'OrciLuctus.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Aguie', 'Daniels', 1997, 'Armash', 'Arcu.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kayley', 'Behrendsen', 1995, 'Jin’an', 'NullaSed.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Igor', 'Ferrierio', 1997, 'Manggissari', 'Iaculis.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eryn', 'Alabone', 2006, 'New Sibonga', 'AliquamLacus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hobie', 'Sneller', 2004, 'Chocianów', 'RhoncusDui.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lanae', 'Gosford', 2005, 'Nyalindung', 'AtIpsum.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Donovan', 'Woodham', 2000, 'La Rochelle', 'VolutpatQuam.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elianora', 'Moresby', 1999, 'Zoumaping', 'Magna.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hedwiga', 'Hacun', 2011, 'Elefsína', 'Diam.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Stephen', 'Bool', 2003, 'Limoges', 'ErosVestibulumAc.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mohammed', 'Orcas', 1962, 'Jiulong', 'SagittisNam.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Brad', 'Evitt', 2012, 'Zhukovskiy', 'VestibulumProin.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ruthy', 'Rickertsen', 1994, 'Mestre', 'Tortor.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mathe', 'Kensit', 2003, 'Jiquilillo', 'Luctus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teresa', 'Wallace', 2000, 'Staré Hradiště', 'QuisAugueLuctus.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Corenda', 'Barby', 2007, 'Brejoeira', 'SapienIaculis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucius', 'Jery', 2001, 'Gondifelos', 'EgetNuncDonec.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Athena', 'Stinchcombe', 1995, 'Dashahe', 'Sollicitudin.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Vallie', 'Devanney', 1996, 'Novyye Gorki', 'CongueRisus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Henrietta', 'Held', 2005, 'Tegalsari', 'CubiliaCurae.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Karine', 'Stanaway', 1993, 'Panzhuang', 'AdipiscingElitProin.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Arne', 'Custed', 2003, 'Langxi', 'NonLectus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alleyn', 'Rawstron', 2004, 'Daxi', 'NullaUltrices.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Colas', 'Bellhanger', 1996, 'Batou', 'NullaAcEnim.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Werner', 'De Hailes', 2006, 'Omutninsk', 'MorbiQuis.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sosanna', 'Canet', 2010, 'Bokoro', 'MaurisNon.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ganny', 'Wardhaw', 2006, 'Dasht-e Lati', 'Eget.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lebbie', 'Kliesl', 2004, 'Spas’ke', 'ElementumInHac.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Myrilla', 'Bernhard', 2002, 'Jaboatão', 'AdipiscingElitProin.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rutter', 'Real', 2007, 'Kępice', 'JustoPellentesqueViverra.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Matias', 'Chavrin', 1998, 'Fandriana', 'MiIntegerAc.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Leoine', 'Minocchi', 1998, 'Jinanten', 'EtUltrices.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Erina', 'Mallon', 2007, 'Shangzhuang', 'NibhLigulaNec.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Katherina', 'Duckworth', 1985, 'Jingu', 'AeneanFermentum.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Laurianne', 'Kunisch', 2007, 'Lyubashivka', 'Lobortis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Humberto', 'Dumbreck', 1978, 'Daming', 'NullamVarius.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gilbertine', 'Cossom', 2003, 'Anyuan', 'MusVivamus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elenore', 'Masterman', 2011, 'Inabaan Sur', 'PorttitorId.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sasha', 'McNern', 1964, 'Rongai', 'Aliquam.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fey', 'Teodori', 1995, 'Hashaat', 'AcLeoPellentesque.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Doris', 'Pegden', 2010, 'Ruukki', 'SapienQuisLibero.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marianne', 'Bum', 1996, 'Rîbniţa', 'IdLigula.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Felicdad', 'Matis', 1996, 'Paraíso', 'LigulaVehicula.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alex', 'Swatridge', 2001, 'Papeete', 'AmetTurpisElementum.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Damon', 'Heikkinen', 1990, 'Huskvarna', 'IdOrnareImperdiet.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Carolynn', 'Clother', 1999, 'Palykavichy Pyershyya', 'SapienUtNunc.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Clovis', 'Matisse', 1993, 'Piranshahr', 'Amet.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Trisha', 'O''Malley', 2011, 'Calinaoan Malasin', 'InQuis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Aristotle', 'McGebenay', 2003, 'Jaro', 'DonecVitaeNisi.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Constantina', 'Richmont', 2001, 'Maria Cristina', 'VenenatisTristiqueFusce.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Violet', 'Mouat', 2005, 'Alfena', 'FacilisiCras.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pauli', 'Alloway', 2005, 'Cigeulis', 'UltricesPosuereCubilia.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Britney', 'Tann', 1988, 'Teluksantong', 'Tempus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Harman', 'Doree', 1994, 'Cerquilho', 'Maecenas.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Felicdad', 'Sibylla', 2004, 'Dowsk', 'Et.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Randy', 'Heathcote', 2008, 'Solna', 'Pede.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Genevieve', 'Poli', 2001, 'Shi’ao', 'Justo.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Loy', 'Lucks', 1997, 'Independencia', 'Dui.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Worthy', 'Borrie', 2003, 'Diang', 'At.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Belicia', 'Daviddi', 2005, 'Krasnovishersk', 'AeneanAuctor.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Claude', 'Saiger', 1989, 'Yesan', 'Orci.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Emera', 'Rothschild', 2003, 'Épinal', 'Posuere.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Armstrong', 'Dzenisenka', 1998, 'Cabaritan East', 'MaecenasPulvinar.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jorry', 'Gladtbach', 1992, 'Borovskoy', 'VelAugueVestibulum.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Karol', 'Rowlings', 1996, 'Carnot', 'Erat.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Phil', 'Beales', 2003, 'Sabaneta', 'AdipiscingElitProin.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Homere', 'Dumingo', 1992, 'Saint-Quentin', 'Ipsum.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hyatt', 'Bastistini', 1993, 'Krajan Atas Suger Lor', 'Ante.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Stinky', 'Kirsopp', 2007, 'Trollhättan', 'CursusIdTurpis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teodorico', 'Fry', 2001, 'Zaïo', 'PedeJusto.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Shandie', 'Thewlis', 2009, 'Boden', 'EuEstCongue.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Deborah', 'Montrose', 1995, 'Sabangan', 'VariusInteger.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eadith', 'Fanshawe', 2011, 'Tecpán Guatemala', 'Odio.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Marlon', 'Simeonov', 2001, 'Mamoudzou', 'EstRisusAuctor.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Atlante', 'Riggeard', 1998, 'Mangdang', 'UtUltricesVel.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Grace', 'Figge', 2001, 'Pulopaya', 'Sit.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sanders', 'Braithwaite', 2007, 'Kayukembang', 'SemDuisAliquam.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sullivan', 'Vesty', 1995, 'Nalsian Norte', 'Odio.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fitzgerald', 'Schutte', 1998, 'Yeyik', 'Massa.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Charil', 'Templar', 1999, 'Shibi', 'Vitae.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Timothy', 'Wykey', 2010, 'Haikou', 'TurpisEnimBlandit.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alvinia', 'Muddimer', 1991, 'Nangerang', 'JustoLacinia.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Emmanuel', 'Cartledge', 1999, 'Qiaobian', 'Vitae.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Susann', 'Eassom', 1994, 'Canala', 'RisusAuctor.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pepi', 'Van Halen', 1995, 'Phu Khiao', 'PorttitorIdConsequat.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pate', 'Antognazzi', 1990, 'Rače', 'EratId.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Yorker', 'Prudence', 2008, 'Ban Fang', 'In.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Patrizia', 'Wyant', 2009, 'Datun', 'IdConsequat.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Noel', 'Eyam', 2006, 'Bejsce', 'AnteVelIpsum.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ignacius', 'Napier', 1993, 'San Emilio', 'Donec.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ber', 'McMinn', 1993, 'Wakefield', 'ConsectetuerAdipiscing.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gunther', 'Espinos', 2002, 'Pyrgetós', 'NislDuis.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Christoforo', 'Yetts', 2010, 'North Perth', 'Est.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tobie', 'Beaford', 1989, 'Sydney', 'Quis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Vittorio', 'Crumpe', 1992, 'Podwilk', 'AeneanSitAmet.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Else', 'Maccrie', 2012, 'Qincheng', 'ProinEu.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Cass', 'Ancliffe', 1991, 'Langgen', 'Ornare.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lindon', 'Byars', 2006, 'Wolometang', 'Volutpat.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alecia', 'Phillpotts', 2012, 'Växjö', 'UtBlandit.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Kessiah', 'Royal', 1992, 'Saint-Laurent-Blangy', 'DisParturient.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Barbe', 'Boreland', 2001, 'Cibunar', 'Nam.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Iggy', 'Twinn', 2006, 'Kebonagung', 'ImperdietSapienUrna.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Byron', 'O''Cannovane', 1992, 'Dnestrovsc', 'PretiumIaculisJusto.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Robers', 'Abade', 1988, 'Jataí', 'TurpisSed.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Issy', 'Ginnane', 1986, 'Hengjing', 'Lectus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Francois', 'Doding', 1995, 'Wissembourg', 'AmetSapien.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Izabel', 'Fonquernie', 2008, 'Sibay', 'SuspendisseAccumsan.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Luci', 'Burrass', 1995, 'Cotmon', 'Nibh.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Alair', 'Goring', 2006, 'Salisbury', 'NullaSed.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elna', 'Chorlton', 2012, 'São Lourenço de Mamporcão', 'Phasellus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Anton', 'Brauns', 1992, 'Mollas', 'EnimInTempor.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lyndsay', 'Sussans', 2003, 'Bissen', 'Eget.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Archer', 'de Courcy', 2000, 'Dachun', 'Ullamcorper.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Natalie', 'Petruska', 1997, 'Tynne', 'NislNuncNisl.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Elenore', 'Brookshaw', 2001, 'Shirone', 'Phasellus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Luke', 'Trytsman', 2001, 'Mundão', 'DuisBibendumFelis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Berni', 'Lidgate', 2006, 'Shawan', 'Vivamus.gif'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Xerxes', 'McGookin', 1992, 'Göteborg', 'DolorQuisOdio.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lindy', 'McClymond', 2010, 'Åhus', 'LacusCurabiturAt.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Audi', 'Laudham', 1993, 'Ungus-Ungus', 'EgetCongue.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hobey', 'Rumens', 1997, 'Hengfeng', 'ErosElementum.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Osborn', 'Cromer', 1997, 'Tsalgar', 'Eget.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucilia', 'Muscott', 2008, 'Kuivaniemi', 'Duis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Aida', 'Tschierasche', 2005, 'Ōtawara', 'Rhoncus.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Samuele', 'Lavis', 2012, 'Canha', 'VelNulla.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ernestine', 'Corson', 1999, 'Chamni', 'PedeAcDiam.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Vinita', 'Wickenden', 2013, 'Zhoujiaba', 'CongueEtiamJusto.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Monah', 'Baumer', 2011, 'Shagedu', 'CumSociisNatoque.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Barth', 'Idell', 2011, 'Muravlenko', 'ConsequatNulla.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ingra', 'Tremaine', 2003, 'Ryazan’', 'LiberoNamDui.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Josselyn', 'Pachta', 2011, 'Ţūlkarm', 'Orci.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Gwenneth', 'Seed', 1998, 'Bodiosa a Velha', 'PortaVolutpatErat.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Benito', 'Bellini', 2007, 'Dajasongai', 'Felis.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tadeo', 'Hune', 1999, 'Gävle', 'LiberoConvallis.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Jarrid', 'Geekin', 2005, 'Molchanovo', 'Vulputate.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Uta', 'Meth', 2004, 'Grand Rapids', 'HabitassePlatea.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pavlov', 'Totterdell', 2006, 'Amānzī', 'Id.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Krista', 'Peschet', 2005, 'Soeng Sang', 'CrasPellentesque.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Astrix', 'Tomasi', 1997, 'Yiqi', 'UtTellus.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ellen', 'Ventum', 2012, 'Lenīnskīy', 'Lectus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Daryl', 'Huskinson', 2004, 'Independencia', 'EgetCongue.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hale', 'Sextie', 2002, 'Suso', 'Lacinia.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Michael', 'Bart', 2009, 'Kopang Satu', 'BlanditNam.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mord', 'Okenden', 1992, 'Tyresö', 'ViverraEgetCongue.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Isis', 'Loadwick', 1985, 'Zhayang', 'Leo.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dorree', 'Flury', 2005, 'Nicoya', 'PedeLibero.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dennet', 'Minchell', 2000, 'Koumra', 'Tristique.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Huberto', 'Biagini', 2010, 'Oro Timur', 'AnteIpsum.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Vittoria', 'Lydiate', 1997, 'Xihu', 'JustoNec.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Eddy', 'Haffner', 2008, 'Cortes', 'ErosViverraEget.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Maje', 'Caron', 1984, 'Whitwell', 'Suscipit.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Joeann', 'Ravenscroft', 2004, 'Kirovgrad', 'Lacus.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Cordelie', 'Torvey', 1996, 'Mendoza', 'AtDiamNam.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Valenka', 'Sabben', 2010, 'Pursat', 'FusceCongue.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Euell', 'Cuberley', 1989, 'Maduao', 'Vestibulum.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Armando', 'Varfolomeev', 2002, 'Hantai', 'Risus.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dan', 'Elfes', 2000, 'Dodoma', 'PharetraMagna.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hyacinthe', 'Carty', 2005, 'Yidu', 'Augue.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Dallon', 'Wein', 2010, 'Fada N''gourma', 'PurusPhasellus.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Maurise', 'Amaya', 1991, 'Menglie', 'EratIdMauris.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Abbie', 'Sunnex', 2010, 'Hrazdan', 'AliquetMassaId.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Radcliffe', 'Cowdery', 2006, 'Xiyang', 'AnteIpsumPrimis.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hank', 'Mundwell', 2005, 'Guojiaba', 'VivamusVestibulumSagittis.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Euphemia', 'Salter', 2007, 'Kouloúra', 'InFelisEu.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Faun', 'Clawley', 1997, 'Bousso', 'Platea.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Anthiathia', 'Tipler', 2006, 'Międzyrzecz', 'UltricesVelAugue.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Janeen', 'Worvill', 2003, 'Shimen', 'Quam.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sib', 'Styche', 1994, 'Uzunovo', 'Habitasse.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Horst', 'Grinyer', 2012, 'Stockholm', 'LoremIntegerTincidunt.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Stanislas', 'Veljes', 2010, 'Horta', 'AtIpsumAc.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Pearline', 'Verheijden', 1978, 'Reitoca', 'Volutpat.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Bertram', 'Sancraft', 2002, 'Hägersten', 'TurpisSed.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ami', 'Glanert', 1994, 'Tianzhuang', 'Nunc.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Garek', 'Pusill', 2006, 'Sollebrunn', 'InTempus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Filippo', 'Nevet', 2007, 'Bria', 'Tellus.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Laney', 'Glossup', 2009, 'Minna', 'CursusVestibulum.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Durand', 'Biaggetti', 2011, 'Barbalha', 'Sapien.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Madison', 'Schulkins', 2009, 'Trail', 'EstEtTempus.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lorelle', 'Yeates', 2006, 'Finspång', 'LuctusCum.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Katrine', 'Maken', 2010, 'Tanahwurung', 'CurabiturGravidaNisi.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Benji', 'Biggans', 1980, 'Sade', 'TortorDuisMattis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Paige', 'Fitchet', 2010, 'Pomabamba', 'Interdum.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Matthaeus', 'Mallabund', 2008, 'Nortelândia', 'FermentumJustoNec.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Chalmers', 'Brownsell', 1994, 'Haozigang', 'TortorDuis.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hortense', 'Iacobo', 1999, 'Maojia', 'Platea.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Arabela', 'Jorge', 1995, 'Little Current', 'Eleifend.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Flint', 'Grealy', 1992, 'Crasto', 'ProinAtTurpis.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Reggis', 'Redon', 1985, 'Shuangfeng', 'Semper.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Sandie', 'Biasini', 2008, 'Berezayka', 'VenenatisTurpisEnim.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Wyatan', 'Dumphry', 1989, 'Empangeni', 'DuisFaucibusAccumsan.jpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Oliviero', 'Mell', 2006, 'Liulimiao', 'FeugiatNonPretium.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Bernhard', 'Ebbing', 1992, 'Dashtavan', 'SemFusce.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Torie', 'Clohisey', 1993, 'Sempol', 'Justo.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ottilie', 'Cotgrave', 2009, 'Pô', 'EstQuamPharetra.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rosina', 'Boullen', 1992, 'Bandar ‘Abbās', 'TristiqueFusce.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Reinhold', 'Darch', 1965, 'Sovetskiy', 'Augue.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Garrett', 'Dudley', 2006, 'Baroy', 'SapienCursus.mpeg'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Frank', 'Wetherhead', 2002, 'Bebedahan', 'IpsumDolor.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Julienne', 'Bampkin', 2003, 'Kusi', 'NonLectusAliquam.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Fidelio', 'Booth-Jarvis', 1992, 'Cabangan', 'DiamVitaeQuam.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Goldina', 'McFaell', 1986, 'Los Rastrojos', 'NonQuamNec.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Onida', 'Mangenot', 2004, 'Skála', 'NuncProin.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Allix', 'Hydes', 1995, 'Säter', 'RhoncusDui.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lucie', 'Lyfield', 2004, 'Toupopu', 'SedNislNunc.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lesley', 'Honacker', 1991, 'Lemland', 'PhasellusId.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Teddie', 'Kovacs', 2011, 'New York City', 'FuscePosuereFelis.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Lorinda', 'Handforth', 1993, 'Guamal', 'UtBlandit.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Rianon', 'Wenn', 2011, 'Kupang', 'Morbi.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Hunfredo', 'Gammon', 2009, 'El Socorro', 'In.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ravi', 'Spino', 2003, 'Tqibuli', 'IpsumDolorSit.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Moira', 'Stote', 1999, 'Wuduhe', 'AtTurpis.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Ortensia', 'Sebley', 1964, 'Yuanhou', 'NamDuiProin.mov'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Reinold', 'Place', 1999, 'Sanhe', 'UtVolutpat.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Roslyn', 'Lindeboom', 1993, 'Kaédi', 'Consequat.doc'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Libbie', 'Amiranda', 1985, 'Lingyang', 'PraesentBlanditNam.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Waylan', 'Rambadt', 2008, 'Cernay', 'LuctusRutrum.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Tammie', 'Doust', 1995, 'Kamiennik', 'SemDuisAliquam.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Korry', 'Cavendish', 2011, 'Isabela', 'Euismod.png'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Frasquito', 'Mew', 2005, 'Paris 20', 'QuisLibero.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Golda', 'Gothard', 1985, 'Święciechowa', 'HabitassePlatea.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Wrennie', 'Blonfield', 2010, 'Elassóna', 'AugueLuctusTincidunt.xls'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Mayne', 'McMichael', 1992, 'Erniusuokou', 'AmetEleifendPede.tiff'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Faydra', 'Garza', 2007, 'Jiangqiao', 'SemperPorta.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Erinn', 'Gilluley', 2001, 'Zhongxing', 'Dapibus.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Darice', 'Peepall', 2006, 'San Marcos', 'InTempusSit.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Markos', 'Ossulton', 2005, 'Riberalta', 'Sit.mp3'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Corabelle', 'Cowlam', 2000, 'Buriti Bravo', 'VolutpatQuamPede.txt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Zacharie', 'Gabites', 1993, 'Igbo Ora', 'QuamSuspendissePotenti.avi'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Corinna', 'Stockwell', 2007, 'Dardhas', 'IpsumPrimisIn.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Norah', 'Erickssen', 2011, 'Ban Houayxay', 'Morbi.ppt'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Melessa', 'Clemintoni', 2010, 'Banaran', 'InHac.pdf'),
INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad, foto)('Juanma', 'es', 2000, 'Granada', 'esp@gmail.com');


-- Hay 250 peliculas
INSERT INTO pelicula (titulo, director, genero, duracion, anio_grabacion) VALUES 
('El padrino', 'Francis Ford Coppola', 'Drama', 175, 1972), 
('El padrino II', 'Francis Ford Coppola', 'Drama', 200, 1974), 
('El padrino III', 'Francis Ford Coppola', 'Drama', 162, 1990), 
('El caballero oscuro', 'Christopher Nolan', 'Accion', 152, 2008), 
('El caballero oscuro: La leyenda renace', 'Christopher Nolan', 'Accion', 164, 2012), 
('El caballero oscuro: La leyenda comienza', 'Christopher Nolan', 'Accion', 140, 2005), 
('Pulp Fiction', 'Quentin Tarantino', 'Drama', 154, 1994), 
('Kill Bill: Volumen 1', 'Quentin Tarantino', 'Accion', 111, 2003), 
('Kill Bill: Volumen 2', 'Quentin Tarantino', 'Accion', 137, 2004), 
('Reservoir Dogs', 'Quentin Tarantino', 'Drama', 99, 1992), 
('La naranja mecanica', 'Stanley Kubrick', 'Drama', 136, 1971), 
('2001: Una odisea del espacio', 'Stanley Kubrick', 'Ciencia Ficcion', 160, 1968), 
('La chaqueta metalica', 'Stanley Kubrick', 'Drama', 116, 1987), 
('El resplandor', 'Stanley Kubrick', 'Terror', 146, 1980), 
('La lista de Schindler', 'Steven Spielberg', 'Drama', 195, 1993), 
('Salvar al soldado Ryan', 'Steven Spielberg', 'Accion', 169, 1998), 
('Parque Jurasico', 'Steven Spielberg', 'Aventuras', 127, 1993), 
('E.T. El extraterrestre', 'Steven Spielberg', 'Aventuras', 115, 1982), 
('Tiburón', 'Steven Spielberg', 'Aventuras', 124, 1975), 
('Indiana Jones: En busca del arca perdida', 'Steven Spielberg', 'Aventuras', 115, 1981), 
('Indiana Jones: El templo maldito', 'Steven Spielberg', 'Aventuras', 118, 1984), 
('Indiana Jones: La ultima cruzada', 'Steven Spielberg', 'Aventuras', 127, 1989), 
('Indiana Jones: El reino de la calavera de cristal', 'Steven Spielberg', 'Aventuras', 122, 2008), 
('El imperio contraataca', 'Irvin Kershner', 'Aventuras', 124, 1980), 
('El retorno del Jedi', 'Richard Marquand', 'Aventuras', 131, 1983), 
('La guerra de las galaxias', 'George Lucas', 'Aventuras', 121, 1977), 
('La amenaza fantasma', 'George Lucas', 'Aventuras', 136, 1999), 
('El ataque de los clones', 'George Lucas', 'Aventuras', 142, 2002), 
('La venganza de los Sith', 'George Lucas', 'Aventuras', 140, 2005), 
('El señor de los anillos: La comunidad del anillo', 'Peter Jackson', 'Aventuras', 178, 2001), 
('El señor de los anillos: Las dos torres', 'Peter Jackson', 'Aventuras', 179, 2002), 
('El señor de los anillos: El retorno del rey', 'Peter Jackson', 'Aventuras', 201, 2003), 
('El hobbit: Un viaje inesperado', 'Peter Jackson', 'Aventuras', 169, 2012), 
('El hobbit: La desolacion de Smaug', 'Peter Jackson', 'Aventuras', 161, 2013), 
('El hobbit: La batalla de los cinco ejercitos', 'Peter Jackson', 'Aventuras', 144, 2014), 
('Titanic', 'James Cameron', 'Drama', 195, 1997), 
('Avatar', 'James Cameron', 'Aventuras', 162, 2009), 
('Alien, el octavo pasajero', 'Ridley Scott', 'Ciencia Ficcion', 117, 1979), 
('Blade Runner', 'Ridley Scott', 'Ciencia Ficcion', 117, 1982), 
('Gladiator', 'Ridley Scott', 'Aventuras', 155, 2000), 
('El club de la lucha', 'David Fincher', 'Drama', 139, 1999), 
('El curioso caso de Benjamin Button', 'David Fincher', 'Drama', 166, 2008), 
('La red social', 'David Fincher', 'Drama', 120, 2010), 
('Seven', 'David Fincher', 'Drama', 127, 1995), 
('El silencio de los corderos', 'Jonathan Demme', 'Terror', 118, 1991), 
('Philadelphia', 'Jonathan Demme', 'Drama', 125, 1993), 
('El diablo viste de Prada', 'David Frankel', 'Comedia', 109, 2006), 
('El lobo de Wall Street', 'Martin Scorsese', 'Drama', 180, 2013), 
('Uno de los nuestros', 'Martin Scorsese', 'Drama', 146, 1990), 
('Casino', 'Martin Scorsese', 'Drama', 178, 1995), 
('Taxi Driver', 'Martin Scorsese', 'Drama', 113, 1976), 
('El aviador', 'Martin Scorsese', 'Drama', 170, 2004), 
('El rey de la comedia', 'Martin Scorsese', 'Comedia', 109, 1983), 
('El color del dinero', 'Martin Scorsese', 'Drama', 119, 1986), 
('Uno de los nuestros', 'Martin Scorsese', 'Drama', 146, 1990), 
('El cabo del miedo', 'Martin Scorsese', 'Thriller', 128, 1991), 
('Pulp Fiction', 'Quentin Tarantino', 'Crimen', 154, 1994), 
('El silencio de los corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('Titanic', 'James Cameron', 'Romance', 195, 1997), 
('El caballero de la noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('La lista de Schindler', 'Steven Spielberg', 'Drama', 195, 1993), 
('El señor de los anillos: El retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('El club de la pelea', 'David Fincher', 'Drama', 139, 1999), 
('El padrino III', 'Francis Ford Coppola', 'Drama', 162, 1990), 
('El rey león', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('La naranja mecánica', 'Stanley Kubrick', 'Ciencia ficción', 137, 1971), 
('Interestelar', 'Christopher Nolan', 'Ciencia ficción', 169, 2014), 
('Cadena perpetua', 'Frank Darabont', 'Drama', 142, 1994), 
('Matrix', 'Lana Wachowski, Lilly Wachowski', 'Ciencia ficción', 136, 1999), 
('Ciudadano Kane', 'Orson Welles', 'Drama', 119, 1941), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El viaje de Chihiro', 'Hayao Miyazaki', 'Animación', 125, 2001), 
('Regreso al futuro', 'Robert Zemeckis', 'Ciencia ficción', 116, 1985), 
('Gladiador', 'Ridley Scott', 'Acción', 155, 2000), 
('El bueno, el malo y el feo', 'Sergio Leone', 'Western', 161, 1966), 
('El club de los cinco', 'John Hughes', 'Comedia', 97, 1985), 
('Ratatouille', 'Brad Bird', 'Animación', 111, 2007), 
('La vida es bella', 'Roberto Benigni', 'Comedia dramática', 116, 1997), 
('La tumba de las luciérnagas', 'Isao Takahata', 'Animación', 89, 1988), 
('La milla verde', 'Frank Darabont', 'Drama', 189, 1999), 
('Érase una vez en América', 'Sergio Leone', 'Crimen', 229, 1984), 
('Alien, el octavo pasajero', 'Ridley Scott', 'Ciencia ficción', 117, 1979), 
('El castillo en el cielo', 'Hayao Miyazaki', 'Animación', 125, 1986), 
('Buenos muchachos', 'Martin Scorsese', 'Crimen', 146, 1990), 
('El resplandor', 'Stanley Kubrick', 'Terror', 146, 1980),
('Interstellar', 'Christopher Nolan', 'Ciencia ficción', 169, 2014), 
('La La Land', 'Damien Chazelle', 'Musical', 128, 2016), 
('El Rey León', 'Jon Favreau', 'Animación', 118, 2019), 
('El Gran Hotel Budapest', 'Wes Anderson', 'Comedia', 99, 2014), 
('La forma del agua', 'Guillermo del Toro', 'Fantasía', 123, 2017), 
('El laberinto del fauno', 'Guillermo del Toro', 'Fantasía', 118, 2006), 
('La La Land', 'Damien Chazelle', 'Musical', 128, 2016), 
('Joker', 'Todd Phillips', 'Crimen', 122, 2019), 
('Parasite', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Joker', 'Todd Phillips', 'Crimen', 122, 2019), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('Interestelar', 'Christopher Nolan', 'Ciencia ficción', 169, 2014), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('Volver al Futuro', 'Robert Zemeckis', 'Ciencia ficción', 116, 1985), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Gladiador', 'Ridley Scott', 'Acción', 155, 2000), 
('La Lista de Schindler', 'Steven Spielberg', 'Drama', 195, 1993), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('Interestelar', 'Christopher Nolan', 'Ciencia ficción', 169, 2014), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Señor de los Anillos: La Comunidad del Anillo', 'Peter Jackson', 'Fantasía', 178, 2001), 
('Parasite', 'Bong Joon-ho', 'Drama', 132, 2019), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019),
('El Gran Hotel Budapest', 'Wes Anderson', 'Comedia', 99, 2014), 
('La forma del agua', 'Guillermo del Toro', 'Fantasía', 123, 2017), 
('El laberinto del fauno', 'Guillermo del Toro', 'Fantasía', 118, 2006), 
('La La Land', 'Damien Chazelle', 'Musical', 128, 2016), 
('Joker', 'Todd Phillips', 'Crimen', 122, 2019), 
('Parasite', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('Volver al Futuro', 'Robert Zemeckis', 'Ciencia ficción', 116, 1985), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Gladiador', 'Ridley Scott', 'Acción', 155, 2000), 
('La Lista de Schindler', 'Steven Spielberg', 'Drama', 195, 1993), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('Interestelar', 'Christopher Nolan', 'Ciencia ficción', 169, 2014), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Señor de los Anillos: La Comunidad del Anillo', 'Peter Jackson', 'Fantasía', 178, 2001), 
('Parasite', 'Bong Joon-ho', 'Drama', 132, 2019), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019),
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019),
('El Caballero de la Noche', 'Christopher Nolan', 'Accion', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991),
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994),
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019), 
('El Caballero de la Noche', 'Christopher Nolan', 'Acción', 152, 2008), 
('Guasón', 'Todd Phillips', 'Crimen', 122, 2019), 
('El Silencio de los Corderos', 'Jonathan Demme', 'Suspense', 118, 1991), 
('Forrest Gump', 'Robert Zemeckis', 'Drama', 142, 1994), 
('El Rey León', 'Roger Allers, Rob Minkoff', 'Animación', 88, 1994), 
('El Señor de los Anillos: El Retorno del Rey', 'Peter Jackson', 'Fantasía', 201, 2003), 
('Parásitos', 'Bong Joon-ho', 'Drama', 132, 2019);



-- 2 directores por pelicula
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (1, 1), (1, 2);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (2, 3), (2, 4);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (3, 5), (3, 6);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (4, 7), (4, 8);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (5, 9), (5, 10);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (7, 13), (7, 14);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (8, 15), (8, 16);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (9, 17), (9, 18);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (10, 19), (10, 20);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (11, 21), (11, 22);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (12, 23), (12, 24);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (13, 25), (13, 26);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (14, 27), (14, 28);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (15, 29), (15, 30);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (16, 31), (16, 32);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (17, 33), (17, 34);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (18, 35), (18, 36);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (19, 37), (19, 38);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (20, 39), (20, 40);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (21, 41), (21, 42);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (22, 43), (22, 44);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (23, 45), (23, 46);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (24, 47), (24, 48);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (25, 49), (25, 50);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (26, 51), (26, 52);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (27, 53), (27, 54);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (28, 55), (28, 56);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (29, 57), (29, 58);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (30, 59), (30, 60);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (31, 61), (31, 62);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (32, 63), (32, 64);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (33, 65), (33, 66);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (34, 67), (34, 68);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (35, 69), (35, 70);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (36, 71), (36, 72);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (37, 73), (37, 74);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (38, 75), (38, 76);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (39, 77), (39, 78);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (40, 79), (40, 80);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (41, 81), (41, 82);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (42, 83), (42, 84);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (43, 85), (43, 86);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (44, 87), (44, 88);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (45, 89), (45, 90);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (46, 91), (46, 92);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (47, 93), (47, 94);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (48, 95), (48, 96);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (49, 97), (49, 98);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (50, 99), (50, 100);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (51, 51), (51, 52);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (52, 53), (52, 54);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (53, 55), (53, 56);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (54, 57), (54, 58);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (55, 59), (55, 60);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (56, 61), (56, 62);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (57, 63), (57, 64);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (58, 65), (58, 66);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (59, 67), (59, 68);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (60, 69), (60, 70);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (61, 71), (61, 72);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (62, 73), (62, 74);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (63, 75), (63, 76);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (64, 77), (64, 78);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (65, 79), (65, 80);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (66, 81), (66, 82);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (67, 83), (67, 84);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (68, 85), (68, 86);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (69, 87), (69, 88);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (70, 89), (70, 90);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (71, 91), (71, 92);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (72, 93), (72, 94);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (73, 95), (73, 96);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (74, 97), (74, 98);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (75, 99), (75, 100);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (76, 101), (76, 102);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (77, 103), (77, 104);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (78, 105), (78, 106);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (79, 107), (79, 108);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (80, 109), (80, 110);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (81, 111), (81, 112);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (82, 113), (82, 114);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (83, 115), (83, 116);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (84, 117), (84, 118);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (85, 119), (85, 120);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (86, 121), (86, 122);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (87, 123), (87, 124);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (88, 125), (88, 126);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (89, 127), (89, 128);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (90, 129), (90, 130);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (91, 131), (91, 132);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (92, 133), (92, 134);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (93, 135), (93, 136);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (94, 137), (94, 138);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (95, 139), (95, 140);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (96, 141), (96, 142);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (97, 143), (97, 144);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (98, 145), (98, 146);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (99, 147), (99, 148);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (100, 149), (100, 150);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (101, 151), (101, 152);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (102, 153), (102, 154);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (103, 155), (103, 156);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (104, 157), (104, 158);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (105, 159), (105, 160);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (106, 161), (106, 162);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (107, 163), (107, 164);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (108, 165), (108, 166);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (109, 167), (109, 168);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (110, 169), (110, 170);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (111, 171), (111, 172);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (112, 173), (112, 174);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (113, 175), (113, 176);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (114, 177), (114, 178);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (115, 179), (115, 180);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (116, 181), (116, 182);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (117, 183), (117, 184);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (118, 185), (118, 186);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (119, 187), (119, 188);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (120, 189), (120, 190);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (121, 191), (121, 192);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (122, 193), (122, 194);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (123, 195), (123, 196);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (124, 197), (124, 198);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (125, 199), (125, 200);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (151, 251), (151, 252);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (152, 253), (152, 254);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (153, 255), (153, 256);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (154, 257), (154, 258);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (155, 259), (155, 260);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (156, 261), (156, 262);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (157, 263), (157, 264);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (158, 265), (158, 266);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (159, 267), (159, 268);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (160, 269), (160, 270);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (161, 271), (161, 272);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (162, 273), (162, 274);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (163, 275), (163, 276);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (164, 277), (164, 278);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (165, 279), (165, 280);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (166, 281), (166, 282);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (167, 283), (167, 284);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (168, 285), (168, 286);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (169, 287), (169, 288);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (170, 289), (170, 290);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (171, 291), (171, 292);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (172, 293), (172, 294);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (173, 295), (173, 296);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (174, 297), (174, 298);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (175, 299), (175, 300);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (176, 301), (176, 302);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (177, 303), (177, 304);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (178, 305), (178, 306);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (179, 307), (179, 308);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (180, 309), (180, 310);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (181, 311), (181, 312);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (182, 313), (182, 314);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (183, 315), (183, 316);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (184, 317), (184, 318);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (185, 319), (185, 320);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (186, 321), (186, 322);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (187, 323), (187, 324);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (188, 325), (188, 326);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (189, 327), (189, 328);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (190, 329), (190, 330);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (191, 331), (191, 332);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (192, 333), (192, 334);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (193, 335), (193, 336);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (194, 337), (194, 338);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (195, 339), (195, 340);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (196, 341), (196, 342);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (197, 343), (197, 344);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (198, 345), (198, 346);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (199, 347), (199, 348);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (200, 349), (200, 350);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (201, 351), (201, 352);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (202, 353), (202, 354);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (203, 355), (203, 356);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (204, 357), (204, 358);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (205, 359), (205, 360);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (206, 361), (206, 362);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (207, 363), (207, 364);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (208, 365), (208, 366);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (209, 367), (209, 368);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (210, 369), (210, 370);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (211, 371), (211, 372);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (212, 373), (212, 374);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (213, 375), (213, 376);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (214, 377), (214, 378);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (215, 379), (215, 380);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (216, 381), (216, 382);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (217, 383), (217, 384);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (218, 385), (218, 386);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (219, 387), (219, 388);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (220, 389), (220, 390);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (221, 391), (221, 392);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (222, 393), (222, 394);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (223, 395), (223, 396);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (224, 397), (224, 398);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (225, 399), (225, 400);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (226, 401), (226, 402);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (227, 403), (227, 404);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (228, 405), (228, 406);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (229, 407), (229, 408);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (230, 409), (230, 410);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (231, 411), (231, 412);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (232, 413), (232, 414);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (233, 415), (233, 416);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (234, 417), (234, 418);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (235, 419), (235, 420);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (236, 421), (236, 422);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (237, 423), (237, 424);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (238, 425), (238, 426);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (239, 427), (239, 428);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (240, 429), (240, 430);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (241, 431), (241, 432);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (242, 433), (242, 434);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (243, 435), (243, 436);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (244, 437), (244, 438);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (245, 439), (245, 440);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (246, 441), (246, 442);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (247, 443), (247, 444);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (248, 445), (248, 446);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (249, 447), (249, 448);
INSERT INTO direccion_pelicula (id_pelicula, id_persona) VALUES (250, 449), (250, 450);


-- 4 actores por pelicula
INSERT INTO actor (id_pelicula, id_persona) VALUES (1, 1), (1, 2), (1, 3), (1, 4);
INSERT INTO actor (id_pelicula, id_persona) VALUES (2, 5), (2, 6), (2, 7), (2, 8);
INSERT INTO actor (id_pelicula, id_persona) VALUES (3, 9), (3, 10), (3, 11), (3, 12);
INSERT INTO actor (id_pelicula, id_persona) VALUES (4, 13), (4, 14), (4, 15), (4, 16);
INSERT INTO actor (id_pelicula, id_persona) VALUES (5, 17), (5, 18), (5, 19), (5, 20);
INSERT INTO actor (id_pelicula, id_persona) VALUES (6, 21), (6, 22), (6, 23), (6, 24);
INSERT INTO actor (id_pelicula, id_persona) VALUES (7, 25), (7, 26), (7, 27), (7, 28);
INSERT INTO actor (id_pelicula, id_persona) VALUES (8, 29), (8, 30), (8, 31), (8, 32);
INSERT INTO actor (id_pelicula, id_persona) VALUES (9, 33), (9, 34), (9, 35), (9, 36);
INSERT INTO actor (id_pelicula, id_persona) VALUES (10, 37), (10, 38), (10, 39), (10, 40);
INSERT INTO actor (id_pelicula, id_persona) VALUES (11, 41), (11, 42), (11, 43), (11, 44);
INSERT INTO actor (id_pelicula, id_persona) VALUES (12, 45), (12, 46), (12, 47), (12, 48);
INSERT INTO actor (id_pelicula, id_persona) VALUES (13, 49), (13, 50), (13, 51), (13, 52);
INSERT INTO actor (id_pelicula, id_persona) VALUES (14, 53), (14, 54), (14, 55), (14, 56);
INSERT INTO actor (id_pelicula, id_persona) VALUES (15, 57), (15, 58), (15, 59), (15, 60);
INSERT INTO actor (id_pelicula, id_persona) VALUES (16, 61), (16, 62), (16, 63), (16, 64);
INSERT INTO actor (id_pelicula, id_persona) VALUES (17, 65), (17, 66), (17, 67), (17, 68);
INSERT INTO actor (id_pelicula, id_persona) VALUES (18, 69), (18, 70), (18, 71), (18, 72);
INSERT INTO actor (id_pelicula, id_persona) VALUES (19, 73), (19, 74), (19, 75), (19, 76);
INSERT INTO actor (id_pelicula, id_persona) VALUES (20, 77), (20, 78), (20, 79), (20, 80);
INSERT INTO actor (id_pelicula, id_persona) VALUES (21, 81), (21, 82), (21, 83), (21, 84);
INSERT INTO actor (id_pelicula, id_persona) VALUES (22, 85), (22, 86), (22, 87), (22, 88);
INSERT INTO actor (id_pelicula, id_persona) VALUES (23, 89), (23, 90), (23, 91), (23, 92);
INSERT INTO actor (id_pelicula, id_persona) VALUES (24, 93), (24, 94), (24, 95), (24, 96);
INSERT INTO actor (id_pelicula, id_persona) VALUES (25, 97), (25, 98), (25, 99), (25, 100);
INSERT INTO actor (id_pelicula, id_persona) VALUES (26, 101), (26, 102), (26, 103), (26, 104);
INSERT INTO actor (id_pelicula, id_persona) VALUES (27, 105), (27, 106), (27, 107), (27, 108);
INSERT INTO actor (id_pelicula, id_persona) VALUES (28, 109), (28, 110), (28, 111), (28, 112);
INSERT INTO actor (id_pelicula, id_persona) VALUES (29, 113), (29, 114), (29, 115), (29, 116);
INSERT INTO actor (id_pelicula, id_persona) VALUES (30, 117), (30, 118), (30, 119), (30, 120);
INSERT INTO actor (id_pelicula, id_persona) VALUES (31, 121), (31, 122), (31, 123), (31, 124);
INSERT INTO actor (id_pelicula, id_persona) VALUES (32, 125), (32, 126), (32, 127), (32, 128);
INSERT INTO actor (id_pelicula, id_persona) VALUES (33, 129), (33, 130), (33, 131), (33, 132);
INSERT INTO actor (id_pelicula, id_persona) VALUES (34, 133), (34, 134), (34, 135), (34, 136);
INSERT INTO actor (id_pelicula, id_persona) VALUES (35, 137), (35, 138), (35, 139), (35, 140);
INSERT INTO actor (id_pelicula, id_persona) VALUES (36, 141), (36, 142), (36, 143), (36, 144);
INSERT INTO actor (id_pelicula, id_persona) VALUES (37, 145), (37, 146), (37, 147), (37, 148);
INSERT INTO actor (id_pelicula, id_persona) VALUES (38, 149), (38, 150), (38, 151), (38, 152);
INSERT INTO actor (id_pelicula, id_persona) VALUES (39, 153), (39, 154), (39, 155), (39, 156);
INSERT INTO actor (id_pelicula, id_persona) VALUES (40, 157), (40, 158), (40, 159), (40, 160);
INSERT INTO actor (id_pelicula, id_persona) VALUES (41, 161), (41, 162), (41, 163), (41, 164);
INSERT INTO actor (id_pelicula, id_persona) VALUES (42, 165), (42, 166), (42, 167), (42, 168);
INSERT INTO actor (id_pelicula, id_persona) VALUES (43, 169), (43, 170), (43, 171), (43, 172);
INSERT INTO actor (id_pelicula, id_persona) VALUES (44, 173), (44, 174), (44, 175), (44, 176);
INSERT INTO actor (id_pelicula, id_persona) VALUES (45, 177), (45, 178), (45, 179), (45, 180);
INSERT INTO actor (id_pelicula, id_persona) VALUES (46, 181), (46, 182), (46, 183), (46, 184);
INSERT INTO actor (id_pelicula, id_persona) VALUES (47, 185), (47, 186), (47, 187), (47, 188);
INSERT INTO actor (id_pelicula, id_persona) VALUES (48, 189), (48, 190), (48, 191), (48, 192);
INSERT INTO actor (id_pelicula, id_persona) VALUES (49, 193), (49, 194), (49, 195), (49, 196);
INSERT INTO actor (id_pelicula, id_persona) VALUES (50, 197), (50, 198), (50, 199), (50, 200);
INSERT INTO actor (id_pelicula, id_persona) VALUES (51, 201), (51, 202), (51, 203), (51, 204);
INSERT INTO actor (id_pelicula, id_persona) VALUES (52, 205), (52, 206), (52, 207), (52, 208);
INSERT INTO actor (id_pelicula, id_persona) VALUES (53, 209), (53, 210), (53, 211), (53, 212);
INSERT INTO actor (id_pelicula, id_persona) VALUES (54, 213), (54, 214), (54, 215), (54, 216);
INSERT INTO actor (id_pelicula, id_persona) VALUES (55, 217), (55, 218), (55, 219), (55, 220);
INSERT INTO actor (id_pelicula, id_persona) VALUES (56, 221), (56, 222), (56, 223), (56, 224);
INSERT INTO actor (id_pelicula, id_persona) VALUES (57, 225), (57, 226), (57, 227), (57, 228);
INSERT INTO actor (id_pelicula, id_persona) VALUES (58, 229), (58, 230), (58, 231), (58, 232);
INSERT INTO actor (id_pelicula, id_persona) VALUES (59, 233), (59, 234), (59, 235), (59, 236);
INSERT INTO actor (id_pelicula, id_persona) VALUES (60, 237), (60, 238), (60, 239), (60, 240);
INSERT INTO actor (id_pelicula, id_persona) VALUES (61, 241), (61, 242), (61, 243), (61, 244);
INSERT INTO actor (id_pelicula, id_persona) VALUES (62, 245), (62, 246), (62, 247), (62, 248);
INSERT INTO actor (id_pelicula, id_persona) VALUES (63, 249), (63, 250), (63, 251), (63, 252);
INSERT INTO actor (id_pelicula, id_persona) VALUES (64, 253), (64, 254), (64, 255), (64, 256);
INSERT INTO actor (id_pelicula, id_persona) VALUES (65, 257), (65, 258), (65, 259), (65, 260);
INSERT INTO actor (id_pelicula, id_persona) VALUES (66, 261), (66, 262), (66, 263), (66, 264);
INSERT INTO actor (id_pelicula, id_persona) VALUES (67, 265), (67, 266), (67, 267), (67, 268);
INSERT INTO actor (id_pelicula, id_persona) VALUES (68, 269), (68, 270), (68, 271), (68, 272);
INSERT INTO actor (id_pelicula, id_persona) VALUES (69, 273), (69, 274), (69, 275), (69, 276);
INSERT INTO actor (id_pelicula, id_persona) VALUES (70, 277), (70, 278), (70, 279), (70, 280);
INSERT INTO actor (id_pelicula, id_persona) VALUES (71, 281), (71, 282), (71, 283), (71, 284);
INSERT INTO actor (id_pelicula, id_persona) VALUES (72, 285), (72, 286), (72, 287), (72, 288);
INSERT INTO actor (id_pelicula, id_persona) VALUES (73, 289), (73, 290), (73, 291), (73, 292);
INSERT INTO actor (id_pelicula, id_persona) VALUES (74, 293), (74, 294), (74, 295), (74, 296);
INSERT INTO actor (id_pelicula, id_persona) VALUES (75, 297), (75, 298), (75, 299), (75, 300);
INSERT INTO actor (id_pelicula, id_persona) VALUES (76, 301), (76, 302), (76, 303), (76, 304);
INSERT INTO actor (id_pelicula, id_persona) VALUES (77, 305), (77, 306), (77, 307), (77, 308);
INSERT INTO actor (id_pelicula, id_persona) VALUES (78, 309), (78, 310), (78, 311), (78, 312);
INSERT INTO actor (id_pelicula, id_persona) VALUES (79, 313), (79, 314), (79, 315), (79, 316);
INSERT INTO actor (id_pelicula, id_persona) VALUES (80, 317), (80, 318), (80, 319), (80, 320);
INSERT INTO actor (id_pelicula, id_persona) VALUES (81, 321), (81, 322), (81, 323), (81, 324);
INSERT INTO actor (id_pelicula, id_persona) VALUES (82, 325), (82, 326), (82, 327), (82, 328);
INSERT INTO actor (id_pelicula, id_persona) VALUES (83, 329), (83, 330), (83, 331), (83, 332);
INSERT INTO actor (id_pelicula, id_persona) VALUES (84, 333), (84, 334), (84, 335), (84, 336);
INSERT INTO actor (id_pelicula, id_persona) VALUES (85, 337), (85, 338), (85, 339), (85, 340);
INSERT INTO actor (id_pelicula, id_persona) VALUES (86, 341), (86, 342), (86, 343), (86, 344);
INSERT INTO actor (id_pelicula, id_persona) VALUES (87, 345), (87, 346), (87, 347), (87, 348);
INSERT INTO actor (id_pelicula, id_persona) VALUES (88, 349), (88, 350), (88, 351), (88, 352);
INSERT INTO actor (id_pelicula, id_persona) VALUES (89, 353), (89, 354), (89, 355), (89, 356);
INSERT INTO actor (id_pelicula, id_persona) VALUES (90, 357), (90, 358), (90, 359), (90, 360);
INSERT INTO actor (id_pelicula, id_persona) VALUES (91, 361), (91, 362), (91, 363), (91, 364);
INSERT INTO actor (id_pelicula, id_persona) VALUES (92, 365), (92, 366), (92, 367), (92, 368);
INSERT INTO actor (id_pelicula, id_persona) VALUES (93, 369), (93, 370), (93, 371), (93, 372);
INSERT INTO actor (id_pelicula, id_persona) VALUES (94, 373), (94, 374), (94, 375), (94, 376);
INSERT INTO actor (id_pelicula, id_persona) VALUES (95, 377), (95, 378), (95, 379), (95, 380);
INSERT INTO actor (id_pelicula, id_persona) VALUES (96, 381), (96, 382), (96, 383), (96, 384);
INSERT INTO actor (id_pelicula, id_persona) VALUES (97, 385), (97, 386), (97, 387), (97, 388);
INSERT INTO actor (id_pelicula, id_persona) VALUES (98, 389), (98, 390), (98, 391), (98, 392);
INSERT INTO actor (id_pelicula, id_persona) VALUES (99, 393), (99, 394), (99, 395), (99, 396);
INSERT INTO actor (id_pelicula, id_persona) VALUES (100, 397), (100, 398), (100, 399), (100, 400);
INSERT INTO actor (id_pelicula, id_persona) VALUES (101, 401), (101, 402), (101, 403), (101, 404);
INSERT INTO actor (id_pelicula, id_persona) VALUES (102, 405), (102, 406), (102, 407), (102, 408);
INSERT INTO actor (id_pelicula, id_persona) VALUES (103, 409), (103, 410), (103, 411), (103, 412);
INSERT INTO actor (id_pelicula, id_persona) VALUES (104, 413), (104, 414), (104, 415), (104, 416);
INSERT INTO actor (id_pelicula, id_persona) VALUES (105, 417), (105, 418), (105, 419), (105, 420);
INSERT INTO actor (id_pelicula, id_persona) VALUES (106, 421), (106, 422), (106, 423), (106, 424);
INSERT INTO actor (id_pelicula, id_persona) VALUES (107, 425), (107, 426), (107, 427), (107, 428);
INSERT INTO actor (id_pelicula, id_persona) VALUES (108, 429), (108, 430), (108, 431), (108, 432);
INSERT INTO actor (id_pelicula, id_persona) VALUES (109, 433), (109, 434), (109, 435), (109, 436);
INSERT INTO actor (id_pelicula, id_persona) VALUES (110, 437), (110, 438), (110, 439), (110, 440);
INSERT INTO actor (id_pelicula, id_persona) VALUES (111, 441), (111, 442), (111, 443), (111, 444);
INSERT INTO actor (id_pelicula, id_persona) VALUES (112, 445), (112, 446), (112, 447), (112, 448);
INSERT INTO actor (id_pelicula, id_persona) VALUES (113, 449), (113, 450), (113, 451), (113, 452);
INSERT INTO actor (id_pelicula, id_persona) VALUES (114, 453), (114, 454), (114, 455), (114, 456);
INSERT INTO actor (id_pelicula, id_persona) VALUES (115, 457), (115, 458), (115, 459), (115, 460);
INSERT INTO actor (id_pelicula, id_persona) VALUES (116, 461), (116, 462), (116, 463), (116, 464);
INSERT INTO actor (id_pelicula, id_persona) VALUES (117, 465), (117, 466), (117, 467), (117, 468);
INSERT INTO actor (id_pelicula, id_persona) VALUES (118, 469), (118, 470), (118, 471), (118, 472);
INSERT INTO actor (id_pelicula, id_persona) VALUES (119, 473), (119, 474), (119, 475), (119, 476);
INSERT INTO actor (id_pelicula, id_persona) VALUES (120, 477), (120, 478), (120, 479), (120, 480);
INSERT INTO actor (id_pelicula, id_persona) VALUES (121, 481), (121, 482), (121, 483), (121, 484);
INSERT INTO actor (id_pelicula, id_persona) VALUES (122, 485), (122, 486), (122, 487), (122, 488);
INSERT INTO actor (id_pelicula, id_persona) VALUES (123, 489), (123, 490), (123, 491), (123, 492);
INSERT INTO actor (id_pelicula, id_persona) VALUES (124, 493), (124, 494), (124, 495), (124, 496);
INSERT INTO actor (id_pelicula, id_persona) VALUES (125, 497), (125, 498), (125, 499), (125, 500);
INSERT INTO actor (id_pelicula, id_persona) VALUES (151, 501), (151, 502), (151, 503), (151, 504);
INSERT INTO actor (id_pelicula, id_persona) VALUES (152, 505), (152, 506), (152, 507), (152, 508);
INSERT INTO actor (id_pelicula, id_persona) VALUES (153, 509), (153, 510), (153, 511), (153, 512);
INSERT INTO actor (id_pelicula, id_persona) VALUES (154, 513), (154, 514), (154, 515), (154, 516);
INSERT INTO actor (id_pelicula, id_persona) VALUES (155, 517), (155, 518), (155, 519), (155, 520);
INSERT INTO actor (id_pelicula, id_persona) VALUES (156, 521), (156, 522), (156, 523), (156, 524);
INSERT INTO actor (id_pelicula, id_persona) VALUES (157, 525), (157, 526), (157, 527), (157, 528);
INSERT INTO actor (id_pelicula, id_persona) VALUES (158, 529), (158, 530), (158, 531), (158, 532);
INSERT INTO actor (id_pelicula, id_persona) VALUES (159, 533), (159, 534), (159, 535), (159, 536);
INSERT INTO actor (id_pelicula, id_persona) VALUES (160, 537), (160, 538), (160, 539), (160, 540);
INSERT INTO actor (id_pelicula, id_persona) VALUES (161, 541), (161, 542), (161, 543), (161, 544);
INSERT INTO actor (id_pelicula, id_persona) VALUES (162, 545), (162, 546), (162, 547), (162, 548);
INSERT INTO actor (id_pelicula, id_persona) VALUES (163, 549), (163, 550), (163, 1), (163, 2);
INSERT INTO actor (id_pelicula, id_persona) VALUES (164, 3), (164, 4), (164, 5), (164, 6);
INSERT INTO actor (id_pelicula, id_persona) VALUES (165, 7), (165, 8), (165, 9), (165, 10);
INSERT INTO actor (id_pelicula, id_persona) VALUES (166, 11), (166, 12), (166, 13), (166, 14);
INSERT INTO actor (id_pelicula, id_persona) VALUES (167, 15), (167, 16), (167, 17), (167, 18);
INSERT INTO actor (id_pelicula, id_persona) VALUES (168, 19), (168, 20), (168, 21), (168, 22);
INSERT INTO actor (id_pelicula, id_persona) VALUES (169, 23), (169, 24), (169, 25), (169, 26);
INSERT INTO actor (id_pelicula, id_persona) VALUES (170, 27), (170, 28), (170, 29), (170, 30);
INSERT INTO actor (id_pelicula, id_persona) VALUES (171, 31), (171, 32), (171, 33), (171, 34);
INSERT INTO actor (id_pelicula, id_persona) VALUES (172, 35), (172, 36), (172, 37), (172, 38);
INSERT INTO actor (id_pelicula, id_persona) VALUES (173, 39), (173, 40), (173, 41), (173, 42);
INSERT INTO actor (id_pelicula, id_persona) VALUES (174, 43), (174, 44), (174, 45), (174, 46);
INSERT INTO actor (id_pelicula, id_persona) VALUES (175, 47), (175, 48), (175, 49), (175, 50);
INSERT INTO actor (id_pelicula, id_persona) VALUES (176, 51), (176, 52), (176, 53), (176, 54);
INSERT INTO actor (id_pelicula, id_persona) VALUES (177, 55), (177, 56), (177, 57), (177, 58);
INSERT INTO actor (id_pelicula, id_persona) VALUES (178, 59), (178, 60), (178, 61), (178, 62);
INSERT INTO actor (id_pelicula, id_persona) VALUES (179, 63), (179, 64), (179, 65), (179, 66);
INSERT INTO actor (id_pelicula, id_persona) VALUES (180, 67), (180, 68), (180, 69), (180, 70);
INSERT INTO actor (id_pelicula, id_persona) VALUES (181, 71), (181, 72), (181, 73), (181, 74);
INSERT INTO actor (id_pelicula, id_persona) VALUES (182, 75), (182, 76), (182, 77), (182, 78);
INSERT INTO actor (id_pelicula, id_persona) VALUES (183, 79), (183, 80), (183, 81), (183, 82);
INSERT INTO actor (id_pelicula, id_persona) VALUES (184, 83), (184, 84), (184, 85), (184, 86);
INSERT INTO actor (id_pelicula, id_persona) VALUES (185, 87), (185, 88), (185, 89), (185, 90);
INSERT INTO actor (id_pelicula, id_persona) VALUES (186, 91), (186, 92), (186, 93), (186, 94);
INSERT INTO actor (id_pelicula, id_persona) VALUES (187, 95), (187, 96), (187, 97), (187, 98);
INSERT INTO actor (id_pelicula, id_persona) VALUES (188, 99), (188, 100), (188, 101), (188, 102);
INSERT INTO actor (id_pelicula, id_persona) VALUES (189, 103), (189, 104), (189, 105), (189, 106);
INSERT INTO actor (id_pelicula, id_persona) VALUES (190, 107), (190, 108), (190, 109), (190, 110);
INSERT INTO actor (id_pelicula, id_persona) VALUES (191, 111), (191, 112), (191, 113), (191, 114);
INSERT INTO actor (id_pelicula, id_persona) VALUES (192, 115), (192, 116), (192, 117), (192, 118);
INSERT INTO actor (id_pelicula, id_persona) VALUES (193, 119), (193, 120), (193, 121), (193, 122);
INSERT INTO actor (id_pelicula, id_persona) VALUES (194, 123), (194, 124), (194, 125), (194, 126);
INSERT INTO actor (id_pelicula, id_persona) VALUES (195, 127), (195, 128), (195, 129), (195, 130);
INSERT INTO actor (id_pelicula, id_persona) VALUES (196, 131), (196, 132), (196, 133), (196, 134);
INSERT INTO actor (id_pelicula, id_persona) VALUES (197, 135), (197, 136), (197, 137), (197, 138);
INSERT INTO actor (id_pelicula, id_persona) VALUES (198, 139), (198, 140), (198, 141), (198, 142);
INSERT INTO actor (id_pelicula, id_persona) VALUES (199, 143), (199, 144), (199, 145), (199, 146);
INSERT INTO actor (id_pelicula, id_persona) VALUES (200, 147), (200, 148), (200, 149), (200, 150);
INSERT INTO actor (id_pelicula, id_persona) VALUES (201, 151), (201, 152), (201, 153), (201, 154);
INSERT INTO actor (id_pelicula, id_persona) VALUES (202, 155), (202, 156), (202, 157), (202, 158);
INSERT INTO actor (id_pelicula, id_persona) VALUES (203, 159), (203, 160), (203, 161), (203, 162);
INSERT INTO actor (id_pelicula, id_persona) VALUES (204, 163), (204, 164), (204, 165), (204, 166);
INSERT INTO actor (id_pelicula, id_persona) VALUES (205, 167), (205, 168), (205, 169), (205, 170);
INSERT INTO actor (id_pelicula, id_persona) VALUES (206, 171), (206, 172), (206, 173), (206, 174);
INSERT INTO actor (id_pelicula, id_persona) VALUES (207, 175), (207, 176), (207, 177), (207, 178);
INSERT INTO actor (id_pelicula, id_persona) VALUES (208, 179), (208, 180), (208, 181), (208, 182);
INSERT INTO actor (id_pelicula, id_persona) VALUES (209, 183), (209, 184), (209, 185), (209, 186);
INSERT INTO actor (id_pelicula, id_persona) VALUES (210, 187), (210, 188), (210, 189), (210, 190);
INSERT INTO actor (id_pelicula, id_persona) VALUES (211, 191), (211, 192), (211, 193), (211, 194);
INSERT INTO actor (id_pelicula, id_persona) VALUES (212, 195), (212, 196), (212, 197), (212, 198);
INSERT INTO actor (id_pelicula, id_persona) VALUES (213, 199), (213, 200), (213, 201), (213, 202);
INSERT INTO actor (id_pelicula, id_persona) VALUES (214, 203), (214, 204), (214, 205), (214, 206);
INSERT INTO actor (id_pelicula, id_persona) VALUES (215, 207), (215, 208), (215, 209), (215, 210);
INSERT INTO actor (id_pelicula, id_persona) VALUES (216, 211), (216, 212), (216, 213), (216, 214);
INSERT INTO actor (id_pelicula, id_persona) VALUES (217, 215), (217, 216), (217, 217), (217, 218);
INSERT INTO actor (id_pelicula, id_persona) VALUES (218, 219), (218, 220), (218, 221), (218, 222);
INSERT INTO actor (id_pelicula, id_persona) VALUES (219, 223), (219, 224), (219, 225), (219, 226);
INSERT INTO actor (id_pelicula, id_persona) VALUES (220, 227), (220, 228), (220, 229), (220, 230);
INSERT INTO actor (id_pelicula, id_persona) VALUES (221, 231), (221, 232), (221, 233), (221, 234);
INSERT INTO actor (id_pelicula, id_persona) VALUES (222, 235), (222, 236), (222, 237), (222, 238);
INSERT INTO actor (id_pelicula, id_persona) VALUES (223, 239), (223, 240), (223, 241), (223, 242);
INSERT INTO actor (id_pelicula, id_persona) VALUES (224, 243), (224, 244), (224, 245), (224, 246);
INSERT INTO actor (id_pelicula, id_persona) VALUES (225, 247), (225, 248), (225, 249), (225, 250);
INSERT INTO actor (id_pelicula, id_persona) VALUES (226, 251), (226, 252), (226, 253), (226, 254);
INSERT INTO actor (id_pelicula, id_persona) VALUES (227, 255), (227, 256), (227, 257), (227, 258);
INSERT INTO actor (id_pelicula, id_persona) VALUES (228, 259), (228, 260), (228, 261), (228, 262);
INSERT INTO actor (id_pelicula, id_persona) VALUES (229, 263), (229, 264), (229, 265), (229, 266);
INSERT INTO actor (id_pelicula, id_persona) VALUES (230, 267), (230, 268), (230, 269), (230, 270);
INSERT INTO actor (id_pelicula, id_persona) VALUES (231, 271), (231, 272), (231, 273), (231, 274);
INSERT INTO actor (id_pelicula, id_persona) VALUES (232, 275), (232, 276), (232, 277), (232, 278);
INSERT INTO actor (id_pelicula, id_persona) VALUES (233, 279), (233, 280), (233, 281), (233, 282);
INSERT INTO actor (id_pelicula, id_persona) VALUES (234, 283), (234, 284), (234, 285), (234, 286);
INSERT INTO actor (id_pelicula, id_persona) VALUES (235, 287), (235, 288), (235, 289), (235, 290);
INSERT INTO actor (id_pelicula, id_persona) VALUES (236, 291), (236, 292), (236, 293), (236, 294);
INSERT INTO actor (id_pelicula, id_persona) VALUES (237, 295), (237, 296), (237, 297), (237, 298);
INSERT INTO actor (id_pelicula, id_persona) VALUES (238, 299), (238, 300), (238, 301), (238, 302);
INSERT INTO actor (id_pelicula, id_persona) VALUES (239, 303), (239, 304), (239, 305), (239, 306);
INSERT INTO actor (id_pelicula, id_persona) VALUES (240, 307), (240, 308), (240, 309), (240, 310);
INSERT INTO actor (id_pelicula, id_persona) VALUES (241, 311), (241, 312), (241, 313), (241, 314);
INSERT INTO actor (id_pelicula, id_persona) VALUES (242, 315), (242, 316), (242, 317), (242, 318);
INSERT INTO actor (id_pelicula, id_persona) VALUES (243, 319), (243, 320), (243, 321), (243, 322);
INSERT INTO actor (id_pelicula, id_persona) VALUES (244, 323), (244, 324), (244, 325), (244, 326);
INSERT INTO actor (id_pelicula, id_persona) VALUES (245, 327), (245, 328), (245, 329), (245, 330);
INSERT INTO actor (id_pelicula, id_persona) VALUES (246, 331), (246, 332), (246, 333), (246, 334);
INSERT INTO actor (id_pelicula, id_persona) VALUES (247, 335), (247, 336), (247, 337), (247, 338);
INSERT INTO actor (id_pelicula, id_persona) VALUES (248, 339), (248, 340), (248, 341), (248, 342);
INSERT INTO actor (id_pelicula, id_persona) VALUES (249, 343), (249, 344), (249, 345), (249, 346);
INSERT INTO actor (id_pelicula, id_persona) VALUES (250, 347), (250, 348), (250, 349), (250, 350);