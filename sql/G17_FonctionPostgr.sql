-- VERSION PostgreSQL - Groupe 17 – Fonctions Politiques

-- Suppression des tables
DROP TABLE IF EXISTS G17_Exercer;
DROP TABLE IF EXISTS G17_Fonction;
DROP TABLE IF EXISTS G17_Responsable_Politique;

-- TABLE : Responsable Politique
CREATE TABLE G17_Responsable_Politique (
    rp_id SERIAL PRIMARY KEY,
    rp_nom VARCHAR(50) NOT NULL,
    rp_prenom VARCHAR(50) NOT NULL,
    rp_dateNaissance DATE NOT NULL,
    rp_dateDeces DATE
);

-- TABLE : Fonction
CREATE TABLE G17_Fonction (
    fonc_id SERIAL PRIMARY KEY,
    fonc_titre VARCHAR(80) NOT NULL,
    fonc_modNomination VARCHAR(80) NOT NULL
);

-- TABLE : Exercer (relation N:N)
CREATE TABLE G17_Exercer (
    rp_id INT NOT NULL,
    fonc_id INT NOT NULL,
    dateDebut DATE NOT NULL,
    dateFin DATE,
    partiPolitique VARCHAR(80),
    PRIMARY KEY (rp_id, fonc_id, dateDebut),
    FOREIGN KEY (rp_id) REFERENCES G17_Responsable_Politique (rp_id),
    FOREIGN KEY (fonc_id) REFERENCES G17_Fonction (fonc_id)
);



-- INSERTION DES DONNEES DANS LA TABLE G17_Fonction



INSERT INTO G17_Fonction (fonc_titre, fonc_modNomination) VALUES
('Président de la République', 'Élection'),
('Premier Ministre', 'Nomination'),
('Président du Sénat', 'Élection interne'),
('Président de l’Assemblée Nationale', 'Élection interne'),
('Président du Conseil Constitutionnel', 'Nomination');



-- INSERTION DES DONNEES DANS LA TABLE G17_Responsable_Politique



INSERT INTO G17_Responsable_Politique (rp_nom, rp_prenom, rp_dateNaissance, rp_dateDeces) VALUES

('Macron', 'Emmanuel', '1977-12-21', NULL),
('Chirac', 'Jacques', '1932-11-29', '2019-09-26'),
('Hollande', 'François', '1954-08-12', NULL),
('Sarkozy', 'Nicolas', '1955-01-28', NULL),
('Mitterrand', 'François', '1916-10-26', '1996-01-08'),
('Giscard d''Estaing', 'Valéry', '1926-02-02', '2020-12-02'),
('Pompidou', 'Georges', '1911-07-05', '1974-04-02'),
('De Gaulle', 'Charles', '1890-11-22', '1970-11-09'),
('Balladur', 'Édouard', '1929-05-02', NULL),
('Fabius', 'Laurent', '1946-08-20', NULL),
('Debré', 'Jean-Louis', '1944-09-30', NULL),
('Bartolone', 'Claude', '1951-07-29', NULL),
('Poncelet', 'Christian', '1928-08-24', '2020-09-11'),
('Jospin', 'Lionel', '1937-07-12', NULL),
('Villepin', 'Dominique', '1953-11-14', NULL),
('Coty', 'René', '1882-03-20', '1962-11-22'),
('Accoyer', 'Bernard', '1945-08-13', NULL),
('Mazeaud', 'Pierre', '1929-08-24', NULL),
('Ferrand', 'Richard', '1962-05-01', NULL),
('Larcher', 'Gérard', '1949-09-14', NULL),
('Braun-Pivet', 'Yaël', '1970-12-11', NULL),
('Lecornu', 'Sébastien', '1986-06-11', NULL),
('Fillon', 'François', '1954-03-04', NULL),
('Philippe', 'Édouard', '1970-11-28', NULL),
('Castex', 'Jean', '1965-06-25', NULL),
('Borne', 'Élisabeth', '1961-04-18', NULL),
('Barnier', 'Michel', '1951-01-09', NULL),
('Bayrou', 'François', '1951-05-25', NULL),
('Séguin', 'Philippe', '1943-03-21', '2010-01-07'),
('Forni', 'Raymond', '1926-04-30', '2008-03-05'),
('Ollier', 'Patrick', '1944-06-04', NULL),
('de Rugy', 'François', '1973-06-06', NULL),
('Monory', 'René', '1923-06-05', '2009-04-11'),
('Dumas', 'Roland', '1922-05-23', '2007-03-03'),
('Guéna', 'Yves', '1922-07-26', '2016-06-03');



-- INSERTION DES DONNEES DANS LA TABLE G17_exercer



INSERT INTO G17_exercer (rp_id, fonc_id, dateDebut, dateFin, PartiPolitique) VALUES


-- PRÉSIDENT DE LA RÉPUBLIQUE


((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Coty' AND rp_prenom='René'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1954-01-16', '1959-01-08', 'CNIP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='De Gaulle' AND rp_prenom='Charles'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1959-01-08', '1969-04-28', 'UNR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Pompidou' AND rp_prenom='Georges'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1969-06-20', '1974-04-02', 'UDR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Giscard d''Estaing' AND rp_prenom='Valéry'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1974-05-27', '1981-05-21', 'UDF'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Mitterrand' AND rp_prenom='François'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1981-05-21', '1995-05-17', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Chirac' AND rp_prenom='Jacques'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '1995-05-17', '2007-05-16', 'RPR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Sarkozy' AND rp_prenom='Nicolas'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '2007-05-16', '2012-05-15', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Hollande' AND rp_prenom='François'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '2012-05-15', '2017-05-14', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Macron' AND rp_prenom='Emmanuel'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de la République'), '2017-05-14', NULL, 'Renaissance'),


-- PREMIER MINISTRES


((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Balladur' AND rp_prenom='Édouard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '1993-03-29', '1995-05-17', 'RPR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Jospin' AND rp_prenom='Lionel'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '1997-06-03', '2002-05-06', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Villepin' AND rp_prenom='Dominique'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2005-05-31', '2007-05-17', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Fillon' AND rp_prenom='François'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2007-05-17', '2012-05-15', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Philippe' AND rp_prenom='Édouard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2017-06-21', '2020-07-03', 'Les Republicains'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Castex' AND rp_prenom='Jean'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2020-07-03', '2022-05-16', 'Independant'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Borne' AND rp_prenom='Élisabeth'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2022-05-16', '2024-01-09', 'Renaissance'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Barnier' AND rp_prenom='Michel'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2024-09-05', '2024-12-13', 'Les Republicains'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Bayrou' AND rp_prenom='François'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2024-12-13', '2025-09-09', 'MoDem'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Lecornu' AND rp_prenom='Sébastien'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Premier Ministre'), '2025-09-09', NULL, 'Renaissance'),




-- PRÉSIDENT DE L'ASSEMBLÉE NATIONALE


((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Séguin' AND rp_prenom='Philippe'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '1993-04-02', '1997-06-12', 'RPR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Fabius' AND rp_prenom='Laurent'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '1997-06-12', '2000-04-30', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Forni' AND rp_prenom='Raymond'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2000-04-30', '2002-06-18', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Debré' AND rp_prenom='Jean-Louis'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2002-06-18', '2007-03-02', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Ollier' AND rp_prenom='Patrick'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2007-03-06', '2007-06-26', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Accoyer' AND rp_prenom='Bernard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2007-06-26', '2012-06-20', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Bartolone' AND rp_prenom='Claude'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2012-06-20', '2017-06-20', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='de Rugy' AND rp_prenom='François'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2017-06-27', '2018-09-12', 'LREM'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Ferrand' AND rp_prenom='Richard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2018-09-12', '2022-06-28', 'LREM'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Braun-Pivet' AND rp_prenom='Yaël'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président de l’Assemblée Nationale'), '2022-06-28', NULL, 'Renaissance'),



-- PRÉSIDENT DU SÉNAT



((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Monory' AND rp_prenom='René'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Sénat'), '1992-10-02', '1998-10-01', 'UDF'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Poncelet' AND rp_prenom='Christian'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Sénat'), '1998-10-01', '2008-09-30', 'RPR / UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Larcher' AND rp_prenom='Gérard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Sénat'), '2008-10-01', NULL, 'LR'),


-- PRÉSIDENT DU CONSEIL CONSTITUTIONNEL


((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Dumas' AND rp_prenom='Roland'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '1995-03-08', '2000-03-01', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Guéna' AND rp_prenom='Yves'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '2000-03-01', '2004-03-09', 'RPR'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Mazeaud' AND rp_prenom='Pierre'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '2004-03-09', '2007-03-03', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Debré' AND rp_prenom='Jean-Louis'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '2007-03-05', '2016-03-04', 'UMP'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Fabius' AND rp_prenom='Laurent'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '2016-03-08', '2025-03-08', 'PS'),

((SELECT rp_id FROM G17_Responsable_Politique WHERE rp_nom='Ferrand' AND rp_prenom='Richard'),
 (SELECT fonc_id FROM G17_Fonction WHERE fonc_titre='Président du Conseil Constitutionnel'), '2025-03-08', NULL, 'Renaissance');

