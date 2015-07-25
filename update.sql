BEGIN;

CREATE SEQUENCE sq_alliance;

CREATE TABLE alliances (
  id BIGINT NOT NULL DEFAULT nextval('sq_alliance'),
  name VARCHAR(128),
  color VARCHAR(7),
  CONSTRAINT alliances_pkey PRIMARY KEY (id)
);

ALTER SEQUENCE sq_alliance OWNED BY alliances.id;

-- Zones

CREATE SEQUENCE sq_zone;

CREATE TABLE zones (
    id BIGINT NOT NULL DEFAULT nextval('sq_zone'),
    codeName VARCHAR(128) NOT NULL,
    name VARCHAR(128),
    id_alliance BIGINT NOT NULL,
    CONSTRAINT zones_pkey PRIMARY KEY (id),
    CONSTRAINT alliances_fk FOREIGN KEY (id_alliance) REFERENCES alliances (id)
);

ALTER SEQUENCE sq_zone OWNED BY zones.id;

-- Données

INSERT INTO alliances (name,color) VALUES ('Aucune','#BCBCBC');
INSERT INTO alliances (name,color) VALUES ('L''Alliance de Daguefilante','#3E72B2');
INSERT INTO alliances (name,color) VALUES ('Le Pact de Cœurébène','#C63F35');
INSERT INTO alliances (name,color) VALUES ('Le Domaine Aldmeri','#E8D54C');

SELECT * FROM alliances;

INSERT INTO zones (codeName,name,id_alliance) VALUES ('rivenspire/rivenspire_base','Fendretour',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('bangkorai/bangkorai_base','Bangkorai',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('stormhaven/stormhaven_base','Havre-temête',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('alikr/alikr_base','Désert d’Alik’R',2);

INSERT INTO zones (codeName,name,id_alliance) VALUES ('grahtwood/grahtwood_base','Le Bois de Graht',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('craglorn/craglorn_base','Raidelorn',1);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('auridon/khenarthisroost_base','Perchoir de Khenarthi',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('coldharbor/coldharbour_base','Havreglace',1);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('stonefalls/stonefalls_base','Les Éboulis',3);

SELECT z.id, codeName, z.name, a.name FROM zones z INNER JOIN alliances a ON a.id = z.id_alliance;

ROLLBACK

