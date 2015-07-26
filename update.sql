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

ROLLBACK