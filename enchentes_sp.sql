CREATE DATABASE enchentes_sp;
use enchentes_sp;
create table chuva(
id_chuva INT AUTO_INCREMENT PRIMARY KEY,
tempo_medio VARCHAR (50),
frequencia VARCHAR(50)
);
create table classificacao_territorio(
id_classificacao_territorio INT AUTO_INCREMENT PRIMARY KEY,
redimento_medio varchar(50),
tipo_territorio varchar(50)
);
create table localizacao(
id_local INT AUTO_INCREMENT PRIMARY KEY,
id_classificacao_territorio int not null,
zona VARCHAR(50),
corrego_e_bacias VARCHAR(50),
foreign key (id_classificacao_territorio) references classificacao_territorio(id_classificacao_territorio)
);

create table nivel_risco(
id_nivel_risco INT AUTO_INCREMENT PRIMARY KEY,
descricao varchar(50)
);

Create Table enchente(
id_enchente INT AUTO_INCREMENT PRIMARY KEY,
id_chuva int not null,
id_nivel_risco int not null,
id_local int not null,
tipo_predominante VARCHAR(50),
fator_agravante VARCHAR(150),
tempo_medio_escoamento VARCHAR(50),
ponto_alagamento VARCHAR(150),
foreign key (id_chuva) references chuva(id_chuva),
foreign key (id_nivel_risco) references nivel_risco(id_nivel_risco),
foreign key (id_local) references localizacao(id_local)
);
insert into chuva(tempo_medio,frequencia) VALUES
('> 6 horas','Muito Alta (> 10 vezes)'),
('2 a 4 horas','Alta (5 a 10 vezes)'),
('3 a 5 horas','Alta (5 a 10 vezes)'),
('Dias / Semanas','Crítica (Constante no verão)'),
('1 a 2 horas','Média (3 a 5 vezes)'),
('2 a 4 horas','Alta (5 a 10 vezes)'),
('4 a 6 horas','Muito Alta (> 10 vezes)'),
('< 1 hora','Média (2 a 4 vezes)'),
('> 8 horas','Média (2 a 4 vezes)'),
('< 30 minutos','Baixa (Rara / Controlada)'),
('< 20 minutos','Baixa (Eventual)')
;
insert into classificacao_territorio(redimento_medio,tipo_territorio) values
('Menos de 1,5 SM','Favela / Ocupação Informal'),
('Entre 1,5 e 2 SM','Loteamento Irregular / Favela'),
('Menos de 1,5 SM','Favela / Encostas de Vale'),
('Menos de 1 SM','Várzea de Rio (Informal)'),
('Entre 1,5 e 2 SM','Periferia Consolidada / Encosta'),
('Entre 1,5 e 2 SM','Favela / Loteamento'),
('Menos de 1,5 SM','Favela'),
('Menos de 1,5 SM','Conjunto Habitacional / Favela'),
('Menos de 1,5 SM','Área de Manancial / Rural'),
('Mais de 10 SM	','Bairro Nobre / Estruturado'),
('Mais de 12 SM','Bairro Nobre / Estruturado')
;
insert into nivel_risco(descricao) values
('R4 - Muito Alto'),
('R4 - Muito Alto'),
('R4 - Muito Alto'),
('R4 - Muito Alto'),
('R3 - Alto'),
('R3 - Alto'),
('R3 - Alto'),
('R3 - Alto'),
('R2 - Médio'),
('R2 - Médio'),
('R1 - Baixo / Nulo'),
('R1 - Baixo / Nulo')
;

insert into localizacao(id_classificacao_territorio,zona,corrego_e_bacias) VALUES
(1,'Zona Leste','Córrego Itaim / Bacia do Rio Tietê'),
(2,'Zona Sul','Córrego Pirajussara'),
(3,'Zona Sul','Córrego Cabuçu de Baixo'),
(4,'Zona Leste','Várzea do Rio Tietê'),
(5,'Zona Norte','Córrego Bananal / Vertentes'),
(6,'Zona Sul','Córrego Moenda'),
(7,'Zona Leste','Rio Tamanduateí / Córrego da Vila'),
(8,'Zona Leste','Córrego Itaquera'),
(9,'Zona Sul','Córrego Parelheiros / Guarapiranga'),
(10,'Zona Oeste','Rio Pinheiros (Marginal)'),
(11,'Zona Sul','Bacia do Rio Uberabinha')
;
insert into enchente (id_chuva,id_nivel_risco,id_local,tipo_predominante,fator_agravante,tempo_medio_escoamento,ponto_alagamento
) VALUES 
(1,1,1,'Enchente Fluvial (Transbordo)','Calha do rio assoreada e topografia plana de várzea.','> 6 horas','Av. Marechal Tito / Córrego Itaim'),
(2,2,2,'Enxurrada Rápida / Alagamento','Alta impermeabilização do solo e declividade acentuada.','2 a 4 horas','Estrada do Campo Limpo / Av. Carlos Caldeira Filho'),
(3,3,3,'Inundação e Deslizamento','Ocupação de encostas e gargalos nas galerias pluviais.','3 a 5 horas','Estrada do M,Boi Mirim / Córrego Cabuçu'),
(4,4,4,'Inundação de Longa Duração','Nível das casas abaixo do leito do rio; bombeamento insuficiente.','Dias / Semanas','Ruas internas da Vila Itaim (Várzea do Tietê)'),
(5,5,5,'Enxurrada e Alagamento','Declive acentuado provoca descida violenta de água da chuva.','1 a 2 horas','Av. Inajar de Souza (trechos) / Córrego Bananal'),
(6,6,6,'Alagamento de Vias','Lixo em bueiros e subdimensionamento crônico da rede subterrânea.','2 a 4 horas','Av. Ellis Maas / Entorno do Córrego Moenda'),
(7,7,7,'Inundação Urbana Intransitável','Principal ponto crítico de SP; estrangulamento da bacia do Tamanduateí.','4 a 6 horas','Av. Prof. Luiz Ignácio Anhaia Mello'),
(8,8,8,'Enxurrada / Erosão de Solo','Rompimento de tubulações sob vias devido à força da água.','< 1 hora','Av. dos Têxteis / Linhas de Córrego de Encosta'),
(9,9,9,'Alagamento Rural e de Vias','Falta total de asfalto/drenagem estruturada em vias periféricas.','> 8 horas','Estrada da Colônia / Áreas baixas de Manancial'),
(10,10,10,'Alagamento Transitório','Sistema de piscinões funcionais e rápido escoamento por bombeamento.','< 30 minutos','Marginal Pinheiros (Baixo Jaguaré) / Av. Faria Lima'),
(11,11,11,'Alagamento Localizado','Rede de bueiros ampla; ocorrências limitam-se a picos de chuva extrema.','< 20 minutos','Av. Ibirapuera / Av. Santo Amaro (trechos)') 
;