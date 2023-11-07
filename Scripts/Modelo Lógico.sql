/* ModeloLogico: */

BEGIN;
CREATE TABLE Localizacao (
    Beat INTEGER PRIMARY KEY,
    Distrito INTEGER
);
COMMIT;

BEGIN;
CREATE TABLE TipoCrime (
    IUCR INTEGER PRIMARY KEY,
    CategoriaCrime VARCHAR,
    DescricaoCrime VARCHAR,
    CodigoFBI VARCHAR
);
COMMIT;

BEGIN;
CREATE TABLE Casos (
    IDCasos INTEGER PRIMARY KEY,
    NumeroCaso VARCHAR,
    Data TIMESTAMP,
    DescricaoLocal VARCHAR,
    Prisao BOOLEAN,
    Domestico BOOLEAN,
    Ala INTEGER,
    AreaComunitaria INTEGER,
    DataUltimaAtualizacao TIMESTAMP,
    Latitude FLOAT,
    Longitude FLOAT,
    Local VARCHAR,
    IUCR INTEGER,
    Beat INTEGER
);
COMMIT;

BEGIN;
ALTER TABLE Casos ADD CONSTRAINT FK_Casos_2
    FOREIGN KEY (IUCR???, Beat???)
    REFERENCES ??? (???);
COMMIT;