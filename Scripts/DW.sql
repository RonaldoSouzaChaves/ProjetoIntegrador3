-- tabela de dimensão TipoCrime

CREATE TABLE dim_TipoCrime (
    IUCR VARCHAR(20) PRIMARY KEY,
    CategoriaCrime VARCHAR(100),
    DescricaoCrime VARCHAR(200)
);

SELECT * FROM dim_TipoCrime;

-- tabela de dimensão Localizacao

CREATE TABLE dim_Localizacao (
    Beat INTEGER PRIMARY KEY,
    Distrito INTEGER
);

SELECT * FROM dim_Localizacao;

-- tabela de dimensão Tempo
CREATE TABLE dim_Tempo (
    DataTempo DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia INT
);

-- script de população da tabela dim_Tempo

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

SELECT * FROM dim_Tempo;

-- tabela fato Casos

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

SELECT * FROM fato_Casos LIMIT 10;

-- CONSULTAS

-- quantidades de casos por distrito e por ano

SELECT 
    dL.Distrito,
    dt.Ano,
    COUNT(*) AS QuantidadeCasos
FROM 
    fato_Casos fc
JOIN 
    dim_Localizacao dl ON fc.Beat = dl.Beat
JOIN 
    dim_Tempo dt ON fc.Data = dt.DataTempo
GROUP BY 
    dl.Distrito, dt.Ano
ORDER BY 
    dl.Distrito, dt.Ano;

-- taxa de prisões por categoria de crime

SELECT 
    dtc.CategoriaCrime,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fato_Casos WHERE Prisao = TRUE) AS PorcentagemPrisoes
FROM 
    fato_Casos fc
JOIN 
    dim_TipoCrime dtc ON fc.IUCR = dtc.IUCR
WHERE 
    Prisao = TRUE
GROUP BY 
    dtc.CategoriaCrime
ORDER BY 
    PorcentagemPrisoes DESC;

-- taxa de crimes domésticos por categoria de crime

SELECT 
    dtc.CategoriaCrime,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fato_Casos WHERE Domestico = TRUE) AS PorcentagemCrimesDomesticos
FROM 
    fato_Casos fc
JOIN 
    dim_TipoCrime dtc ON fc.IUCR = dtc.IUCR
WHERE 
    Domestico = TRUE
GROUP BY 
    dtc.CategoriaCrime
ORDER BY 
    PorcentagemCrimesDomesticos DESC;