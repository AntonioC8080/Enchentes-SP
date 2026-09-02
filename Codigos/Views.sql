use sos_enchentes_sp;

CREATE VIEW vw_usuarioAP_enchente AS
SELECT 
    e.id_enchente,
    e.tipo_predominante,
    e.fator_agravante,
    e.tempo_medio_escoamento,
    e.ponto_alagamento,
    c.tempo_medio AS tempo_medio,
    c.frequencia AS frequencia,
    n.descricao AS nivel_de_risco,
    l.zona AS zona,
    l.corrego_e_bacias
FROM enchente e
INNER JOIN chuva c
    ON e.id_chuva = c.id_chuva
INNER JOIN nivel_risco n
    ON e.id_nivel_risco = n.id_nivel_risco
INNER JOIN localizacao l
    ON e.id_local = l.id_local;
    
    CREATE VIEW vw_fiscal_enchente AS
SELECT 
    e.id_enchente,
    e.tipo_predominante,
    e.fator_agravante,
    e.tempo_medio_escoamento,
    e.ponto_alagamento,
    c.tempo_medio AS tempo_medio,
    c.frequencia AS frequencia,
    n.descricao AS nivel_de_risco,
    l.zona AS zona,
    l.corrego_e_bacias,
    t.redimento_medio,
    t.tipo_territorio
FROM enchente e
INNER JOIN chuva c
    ON e.id_chuva = c.id_chuva
INNER JOIN nivel_risco n
    ON e.id_nivel_risco = n.id_nivel_risco
INNER JOIN localizacao l
    ON e.id_local = l.id_local
INNER JOIN classificacao_territorio t
	ON l.id_classificacao_territorio = t.id_classificacao_territorio
    ;
    
CREATE USER if not EXISTS 'usuarioAP'@'localhost'
IDENTIFIED BY 'senha1';
GRANT SELECT ON sos_enchentes_sp.vw_usuarioAP_enchente
TO 'usuarioAP'@'localhost';
CREATE USER if not EXISTS 'fiscal'@'localhost'
IDENTIFIED BY 'senha2';
GRANT SELECT ON sos_enchentes_sp.vw_fiscal_enchente
TO 'fiscal'@'localhost';
/*
SELECT * FROM vw_usuario_enchente;

SELECT 
id_enchente,
e.tipo_predominante,
e.fator_agravante,
e.tempo_medio_escoamento,
e.ponto_alagamento,
c.tempo_medio as tempo_medio,
c.frequencia as frequencia,
n.descricao as nivel_de_risco,
l.zona as zona,
l.corrego_e_bacias
 FROM enchente e
 INNER JOIN chuva c ON e.id_chuva =c.id_chuva
 INNER JOIN nivel_risco n ON e.id_nivel_risco =n.id_nivel_risco
 INNER JOIN localizacao l ON e.id_local = l.id_local;*/