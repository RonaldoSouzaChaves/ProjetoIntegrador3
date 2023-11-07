-- OBS: As SK com exceção das skDataTempo são auto incrementais de tipo SERIAL no PostgreSQL

CREATE TABLE fCasosDistrito (
    skBeat INTEGER,
    skID INTEGER,
    skDataTempo TIMESTAMP,
    NumeroCasos INTEGER
);

CREATE TABLE dTempo (
    skDataTempo TIMESTAMP PRIMARY KEY,
    Dia INTEGER,
    Mes VARCHAR,
    Ano INTEGER,
    NumeroMes INTEGER,
    Hora TIMESTAMP
);

CREATE TABLE dLocalizacao (
    skBeat INTEGER PRIMARY KEY,
    Distrito INTEGER
);

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

CREATE TABLE fCasosCrime (
    skID INTEGER,
    skIUCR INTEGER,
    skDataTempo TIMESTAMP,
    NumeroCrimeCategoria INTEGER,
    NumeroTotalCrimes INTEGER
);

CREATE TABLE dTipoCrime (
    skIUCR INTEGER PRIMARY KEY,
    CategoriaCrime VARCHAR,
    DescriçãoCrime VARCHAR,
    CodigoFBI VARCHAR
);

CREATE TABLE fPrisoesCrime (
    skTempo TIMESTAMP,
    skID INTEGER,
    skIUCR INTEGER,
    NumeroPrisoes INTEGER,
    NumeroCrimesCategoria INTEGER
);

CREATE TABLE fCrimesDomesticosCategoria (
    skDataTempo TIMESTAMP,
    skIUCR INTEGER,
    skID INTEGER,
    NumeroDomesticos INTEGER,
    NumeroCrimesCategoria INTEGER
);
 
ALTER TABLE fCasosDistrito ADD CONSTRAINT FK_fCasosDistrito_1
    FOREIGN KEY (NumerodeCasos)
    REFERENCES dTempo (skDataTempo);
 
ALTER TABLE fCasosDistrito ADD CONSTRAINT FK_fCasosDistrito_2
    FOREIGN KEY (skBeat???, skID???, skDataTempo???)
    REFERENCES ??? (???);
 
ALTER TABLE dCasos ADD CONSTRAINT FK_dCasos_2
    FOREIGN KEY (IUCR???, Beat???)
    REFERENCES ??? (???);
 
ALTER TABLE fCasosCrime ADD CONSTRAINT FK_fCasosCrime_1
    FOREIGN KEY (skID)
    REFERENCES dCasos (skID);
 
ALTER TABLE fCasosCrime ADD CONSTRAINT FK_fCasosCrime_2
    FOREIGN KEY (skIUCR???, skDataTempo???)
    REFERENCES ??? (???);
 
ALTER TABLE fPrisoesCrime ADD CONSTRAINT FK_fPrisoesCrime_1
    FOREIGN KEY (skTempo???, skID???, skIUCR???)
    REFERENCES ??? (???);
 
ALTER TABLE fPrisoesCrime ADD CONSTRAINT FK_fPrisoesCrime_2
    FOREIGN KEY (fk_dTipoCrime_skIUCR)
    REFERENCES dTipoCrime (skIUCR);
 
ALTER TABLE fCrimesDomesticosCategoria ADD CONSTRAINT FK_fCrimesDomesticosCategoria_1
    FOREIGN KEY (skDataTempo???, skIUCR???, skID???)
    REFERENCES ??? (???);