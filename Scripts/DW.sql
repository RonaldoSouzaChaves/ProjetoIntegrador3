-- tabela de dimensão TipoCrime
BEGIN;
CREATE TABLE dim_TipoCrime (
    IUCR VARCHAR(20) PRIMARY KEY,
    CategoriaCrime VARCHAR(100),
    DescricaoCrime VARCHAR(200)
);
COMMIT;

-- tabela de dimensão Localizacao
BEGIN;
CREATE TABLE dim_Localizacao (
    Beat INTEGER PRIMARY KEY,
    Distrito INTEGER
);
COMMIT;

-- tabela de dimensão Tempo
BEGIN;
CREATE TABLE dim_Tempo (
    DataTempo DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia INT
);
COMMIT;

-- script de população da tabela dim_Tempo
BEGIN;
INSERT INTO dim_Tempo (DataTempo, Ano, Mes, Dia)
SELECT 
    DataTempo,
    EXTRACT(YEAR FROM DataTempo) AS Ano,
    EXTRACT(MONTH FROM DataTempo) AS Mes,
    EXTRACT(DAY FROM DataTempo) AS Dia
FROM generate_series(
    '2000-01-01'::date, 
    '2025-12-31'::date, 
    '1 day'::interval
) AS DataTempo;
COMMIT;

-- tabela fato Casos
BEGIN;
CREATE TABLE fato_Casos (
    IDCasos INTEGER,
    NumeroCaso VARCHAR(20),
    Data DATE,
    IUCR VARCHAR(20),
    DescricaoLocal VARCHAR(100),
    Prisao BOOLEAN,
    Domestico BOOLEAN,
    Beat INTEGER,
    Ala FLOAT,
    AreaComunitaria FLOAT,
    DataUltimaAtualizacao DATE,
    Latitude FLOAT,
    Longitude FLOAT,
    Local VARCHAR,
    CONSTRAINT fk_tipoCrime FOREIGN KEY (IUCR) REFERENCES dim_TipoCrime(IUCR),
    CONSTRAINT fk_localizacao FOREIGN KEY (Beat) REFERENCES dim_Localizacao(Beat),
    CONSTRAINT fk_tempo FOREIGN KEY (Data) REFERENCES dim_Tempo(DataTempo)
);
COMMIT;