-- OBS: As SK com exceção das skDataTempo são auto incrementais de tipo SERIAL no PostgreSQL

BEGIN;
CREATE TABLE fCasosDistrito (
    skBeat INTEGER,
    skID INTEGER,
    skDataTempo TIMESTAMP,
    NumeroCasos INTEGER
);
COMMIT;

BEGIN;
CREATE TABLE dTempo (
    skDataTempo TIMESTAMP PRIMARY KEY,
    Dia INTEGER,
    Mes VARCHAR,
    Ano INTEGER,
    NumeroMes INTEGER,
    Hora TIMESTAMP
);
COMMIT;

BEGIN;
CREATE TABLE dLocalizacao (
    skBeat INTEGER PRIMARY KEY,
    Distrito INTEGER
);
COMMIT;

BEGIN;
CREATE TABLE dCasos (
    skID INTEGER PRIMARY KEY,
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
CREATE TABLE fCasosCrime (
    skID INTEGER,
    skIUCR INTEGER,
    skDataTempo TIMESTAMP,
    NumeroCrimeCategoria INTEGER,
    NumeroTotalCrimes INTEGER
);
COMMIT;

BEGIN;
CREATE TABLE dTipoCrime (
    skIUCR INTEGER PRIMARY KEY,
    CategoriaCrime VARCHAR,
    DescriçãoCrime VARCHAR,
    CodigoFBI VARCHAR
);
COMMIT;

BEGIN;
CREATE TABLE fPrisoesCrime (
    skTempo TIMESTAMP,
    skID INTEGER,
    skIUCR INTEGER,
    NumeroPrisoes INTEGER,
    NumeroCrimesCategoria INTEGER
);
COMMIT;

BEGIN;
CREATE TABLE fCrimesDomesticosCategoria (
    skDataTempo TIMESTAMP,
    skIUCR INTEGER,
    skID INTEGER,
    NumeroDomesticos INTEGER,
    NumeroCrimesCategoria INTEGER
);
COMMIT;
 
BEGIN;
ALTER TABLE fCasosDistrito ADD CONSTRAINT FK_fCasosDistrito_1
    FOREIGN KEY (NumerodeCasos)
    REFERENCES dTempo (skDataTempo);
COMMIT;

BEGIN;
ALTER TABLE fCasosDistrito ADD CONSTRAINT FK_fCasosDistrito_2
    FOREIGN KEY (skBeat???, skID???, skDataTempo???)
    REFERENCES ??? (???);
COMMIT;

BEGIN;
ALTER TABLE dCasos ADD CONSTRAINT FK_dCasos_2
    FOREIGN KEY (IUCR???, Beat???)
    REFERENCES ??? (???);
COMMIT;

BEGIN;
ALTER TABLE fCasosCrime ADD CONSTRAINT FK_fCasosCrime_1
    FOREIGN KEY (skID)
    REFERENCES dCasos (skID);
COMMIT;

BEGIN;
ALTER TABLE fCasosCrime ADD CONSTRAINT FK_fCasosCrime_2
    FOREIGN KEY (skIUCR???, skDataTempo???)
    REFERENCES ??? (???);
COMMIT;

BEGIN;
ALTER TABLE fPrisoesCrime ADD CONSTRAINT FK_fPrisoesCrime_1
    FOREIGN KEY (skTempo???, skID???, skIUCR???)
    REFERENCES ??? (???);
COMMIT;

BEGIN;
ALTER TABLE fPrisoesCrime ADD CONSTRAINT FK_fPrisoesCrime_2
    FOREIGN KEY (fk_dTipoCrime_skIUCR)
    REFERENCES dTipoCrime (skIUCR);
COMMIT;

BEGIN;
ALTER TABLE fCrimesDomesticosCategoria ADD CONSTRAINT FK_fCrimesDomesticosCategoria_1
    FOREIGN KEY (skDataTempo???, skIUCR???, skID???)
    REFERENCES ??? (???);
COMMIT;