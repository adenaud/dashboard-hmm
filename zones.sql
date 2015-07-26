BEGIN;

--Zonnes communes
INSERT INTO zones (codeName,name,id_alliance) VALUES ('coldharbor/coldharbour_base','Havreglace',1);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('cyrodiil/ava_whole','Cyrodiil',1);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('craglorn/craglorn_base','Raidelorn',1);

-- Aalliance de Daguefillante
INSERT INTO zones (codeName,name,id_alliance) VALUES ('glenumbra/glenumbra_base','La Glénumbrie',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('stormhaven/stormhaven_base','Havre-temête',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('rivenspire/rivenspire_base','Fendretour',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('alikr/alikr_base','Désert d’Alik’R',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('bangkorai/bangkorai_base','Bangkorai',2);

INSERT INTO zones (codeName,name,id_alliance) VALUES ('glenumbra/strosmkai_base','Stros M''kai',2);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('glenumbra/betnihk_base','Betnikh',2);


--Pact de coeurebene

INSERT INTO zones (codeName,name,id_alliance) VALUES ('stonefalls/stonefalls_base','Les Éboulis',3);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('deshaan/deshaan_base','Deshaan',3);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('shadowfen/shadowfen_base','Fangeombre',3);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('eastmarch/eastmarch_base','Estemarche',3);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('therift/therift_base','La Brèche',3);

--Domaine Aldmeri

INSERT INTO zones (codeName,name,id_alliance) VALUES ('auridon/auridon_base','Auridia',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('grahtwood/grahtwood_base','Le Bois de Graht',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('greenshade/greenshade_base','Prasin',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('malabaltor/malabaltor_base','Malaba Tor',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('reapersmarch/reapersmarch_base','La Marche de la Camarde',4);


INSERT INTO zones (codeName,name,id_alliance) VALUES ('auridon/khenarthisroost_base','Perchoir de Khenarthi',4);
INSERT INTO zones (codeName,name,id_alliance) VALUES ('grahtwood/haven_base','Haven',4);



SELECT z.id, codeName, z.name, a.name FROM zones z INNER JOIN alliances a ON a.id = z.id_alliance;
