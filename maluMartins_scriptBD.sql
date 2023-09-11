
CREATE TABLE cliente (
    cpf_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(50),
    data_nasc DATE,
    endereco VARCHAR(90),
    CNH VARCHAR (20)
);

CREATE TABLE endereco (
    cpf_cliente INT PRIMARY KEY,
    estado VARCHAR(2),
    cidade VARCHAR(20),
    numero INT,
    rua VARCHAR(50)
);
ALTER TABLE endereco ADD CONSTRAINT FK_endereco_1
    FOREIGN KEY (cpf_cliente)
    REFERENCES cliente (cpf_cliente);
    
CREATE TABLE veiculo (
    placa_veiculo VARCHAR (11) PRIMARY KEY,
    nome_veiculo VARCHAR(15),
    modelo VARCHAR(20),
    ano INT,
    fabricante VARCHAR(15),
    num_passageiros INT,
    capacidade_porta_malas INT,
    valor_dia FLOAT,
    valor_sem FLOAT,
    valor_mes FLOAT
);

CREATE TABLE Locação (
    cpf_cliente INT,
    placa_veiculo VARCHAR(15),
    data_inicial DATE,
    data_final DATE,
    valor_pago FLOAT,
    PRIMARY KEY (placa_veiculo, data_inicial)
);

ALTER TABLE Locação ADD CONSTRAINT FK_Locação_1
    FOREIGN KEY (cpf_cliente)
    REFERENCES cliente (cpf_cliente);
ALTER TABLE Locação ADD CONSTRAINT FK_Locação_2
    FOREIGN KEY (placa_veiculo)
    REFERENCES veiculo (placa_veiculo);
    
CREATE TABLE manutencao (
    id_manutencao VARCHAR(15) PRIMARY KEY,
    inicio_manu DATE,
    fim_manu DATE,
    custos_manutencao FLOAT,
    melhorias VARCHAR(50),
    placa_veiculo VARCHAR(20) 
);
ALTER TABLE manutencao ADD CONSTRAINT FK_manutencao
    FOREIGN KEY (placa_veiculo)
    REFERENCES veiculo (placa_veiculo);
    
    CREATE TABLE recebe (
    data_ultima_manutencao DATE,
    quantidade_manutencao INT,
    id_manutencao VARCHAR(15),
    placa_veiculo VARCHAR(20)
);

ALTER TABLE recebe ADD CONSTRAINT FK_recebe_3
    FOREIGN KEY (placa_veiculo)
    REFERENCES veiculo (placa_veiculo);
    
ALTER TABLE recebe ADD CONSTRAINT FK_recebe
    FOREIGN KEY (id_manutencao)
    REFERENCES manutencao (id_manutencao);

INSERT INTO cliente (cpf_cliente, nome_cliente, data_nasc, endereco, CNH) VALUES 
	(123456789-71, 'Joey Tribbiani', 05/05/1970, 'Rua Central Parque 125', 'CNH B'),
    (456789123-58, 'Phoebe Buffay', 16/02/67, 'Rua Nova Yorque, 230', 'CNH B'),
    (789456123-36, 'Ross Gueller', 20/03/69, 'Rua West Side, 45', 'CNH B'),
    (321654987-85, 'Chadles Bing', 08/04/68, 'Rua do Parque, 41, Central Parque', 'CNH A');
    
INSERT INTO endereco (cpf_cliente, estado, cidade, numero, rua) VALUES
	(123456789-71, 'RS', 'POA', 125, 'Rua Central Parque'),
    (456789123-58, 'SC', 'Garopaba', 230,'Rua Nova Yorque'),
    (789456123-36, 'RS', 'POA', 45, 'Rua West Side'),
    (321654987-85, 'RS', 'Gravataí', 41, 'Rua do Parque');
    
INSERT INTO veiculo (placa_veiculo, nome_veiculo, modelo, ano,fabricante, num_passageiros, capacidade_porta_malas, valor_dia, valor_sem, valor_mes ) VALUES
	('JAX123', 'FIAT MOBI', 'compacto', 2017, 'FIAT', 5, 200, 80.00, 220.00, 1.800),
	('JAH258', 'FORD KA', 'sedan', 2018, 'FORD', 5, 500,170.00, 440.00, 1.500),
    ('JBN741', 'CORSA', 'sedan', 2010, 'CHEFROLET', 5, 500, 50.00, 180.00, 900),
	('IQL693', 'HB20', 'subcompacto', 2022, 'HYUNDAI', 5,200, 180.00, 500.00, 2.000),
    ('IXP254', 'HB20', 'compacto', 2019, 'HYUNDAI', 5,300, 180.00, 500.00, 2.000),
    ('FIA173', 'FIAT MOBI', 'compacto', 2020, 'FIAT', 5, 200, 90.00, 300.00, 1.300);

INSERT INTO Locação (cpf_cliente, placa_veiculo, data_inicial, data_final, valor_pago) VALUES
	(123456789-71, 'JAX123', 03/05/2023, 10/05/2023, 800),
	(789456123-36, 'IXP254', 08/01/2023, 29/01/2023, 1500),
	(456789123-58, 'JBN741', 14/06/2023, 20/06/23, 750),
	(321654987-85, 'FIA173', 01/09/2023, 08/09/2023, 800);
    
INSERT INTO manutencao (id_manutencao, inicio_manu, fim_manu, custos_manutencao, melhorias, placa_veiculo) VALUES
	('M02', 20/07/2023, 22/07/2023, 400.00, 'troca óleo e revisão', 'IQL693'),
    ('M05', 02/02/2023, 04/02/2023, 700.00, 'troca de 01 pneu', 'IXP254'),
    ('M07', 09/04/2023, 11/04/2023, 100.00, 'revisao de rotina', 'JAH258'),
    ('M08', 11/08/2023, 13/08/2023, 900.90, 'geometria e balan.', 'IQL693');
    
INSERT INTO recebe (data_ultima_manutencao, quantidade_manutencao, id_manutencao, placa_veiculo) VALUES
    (30/07/2023, 02, 'M02', 'IQL693'),
    (15/02/2023, 05, 'M05', 'IXP254'),
    (20/04/2023, 07, 'M07', 'JAH258'),
    (19/08/2023, 08, 'M08', 'IQL693');