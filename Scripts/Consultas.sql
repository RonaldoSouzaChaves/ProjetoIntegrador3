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