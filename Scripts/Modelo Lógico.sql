/* ModeloLogico: */

CREATE TABLE Localizacao (
    Beat INTEGER PRIMARY KEY,
    Distrito INTEGER
);

CREATE TABLE TipoCrime (
    IUCR INTEGER PRIMARY KEY,
    CategoriaCrime VARCHAR,
    DescricaoCrime VARCHAR,
    CodigoFBI VARCHAR
);

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
 
ALTER TABLE Casos ADD CONSTRAINT FK_Casos_2
    FOREIGN KEY (IUCR???, Beat???)
    REFERENCES ??? (???);