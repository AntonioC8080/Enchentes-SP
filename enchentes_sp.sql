CREATE DATABASE enchentes_sp;
use enchentes_sp;
CREATE TABLE chuva (
id_chuva INT PRIMARY KEY,
tipo_predominante DECIMAL(2.2),
tempo_medio VARCHAR(50),
frequencia VARCHAR(50)
);
CREATE TABLE nivel_risco (
id_nivel_risco INT PRIMARY KEY,
R1 VARCHAR(50),
R2 VARCHAR(50),
R3 VARCHAR(50),
R4 VARCHAR(50),
id_chuva int not null,
FOREIGN KEY (id_chuva) REFERENCES chuva(id_chuva)
);
CREATE TABLE distrito_regiao (
id_distrito_regiao INT PRIMARY KEY,
nome_bairro VARCHAR(100),
corregos_e_bacias VARCHAR(50),
id_nivel_risco int not null,
FOREIGN KEY (id_nivel_risco) REFERENCES nivel_risco(id_nivel_risco)
);
CREATE TABLE classificacao_territorio (
id_classificacao_territorio INT PRIMARY KEY,
rendimento_medio VARCHAR(100),
tipo_territorio VARCHAR(50),
id_distrito_regiao int not null,
FOREIGN KEY (id_distrito_regiao) REFERENCES distrito_regiao(id_distrito_regiao)
);
CREATE TABLE populacao_estimada (
id_populacao_estimada  INT PRIMARY KEY,
quantidade INT,
id_classificacao_territorio int not null,
FOREIGN KEY (id_classificacao_territorio) REFERENCES classificacao_territorio(id_classificacao_territorio)
);
CREATE TABLE zona (
id_zona INT PRIMARY KEY,
nome_zona VARCHAR(100),
id_distrito_regiao int not null,
FOREIGN KEY (id_distrito_regiao) REFERENCES distrito_regiao(id_distrito_regiao)
);
CREATE TABLE enchente (
id_enchente INT primary key,
tipo_predominante varchar(30),
Fator_agravante varchar(100),
tempo_medio_escoamento decimal (2.4),
ponto_alagamento VARCHAR(100),
id_chuva int not null,
id_nivel_risco int not null,
id_zona int not null,
id_distrito_regiao int not null,
id_populacao_estimada int not null,
FOREIGN KEY (id_chuva) REFERENCES chuva(id_chuva),
FOREIGN KEY (id_nivel_risco ) REFERENCES nivel_risco (id_nivel_risco),
FOREIGN KEY (id_distrito_regiao) REFERENCES distrito_regiao(id_distrito_regiao),
FOREIGN KEY (id_zona) REFERENCES zona(id_zona),
FOREIGN KEY (id_populacao_estimada) REFERENCES populacao_estimada(id_populacao_estimada)
);







