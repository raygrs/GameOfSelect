CREATE DATABASE gameOfSelect;
USE gameOfSelect;

CREATE TABLE Pessoa (
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkInfluencer INT,
CONSTRAINT pessoaInfluencer FOREIGN KEY (fkInfluencer) REFERENCES Pessoa (idPessoa) 
);

INSERT INTO Pessoa (nome, fkInfluencer) VALUES 
('Alice', NULL), -- Alice não tem influencer
('Bob', 1), -- Bob é influenciado por Alice (idPessoa 1)
('Charlie', 1); -- Charlie é influenciado por Alice (idPessoa 1)

CREATE TABLE Mundo (
idMundo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
constraint chkMundo CHECK (nome in ('mundo real', 'mundo virtual'))
);

INSERT INTO Mundo (nome) VALUES 
('mundo real'), 
('mundo virtual');


CREATE TABLE Publicacao (
idPublicacao INT,
fkPessoa INT,
CONSTRAINT publicacaoPessoa FOREIGN KEY (fkPessoa) REFERENCES Pessoa (idPessoa),
fkMundo INT,
CONSTRAINT publicaoMundo FOREIGN KEY (fkMundo) REFERENCES Mundo (idMundo),
data DATE,
likes INT,
deslikes INT,
CONSTRAINT pkCompostaPublicacao PRIMARY KEY (idPublicacao, fkPessoa,fkMundo)
);

INSERT INTO Publicacao (idPublicacao, fkPessoa, fkMundo, data, likes, deslikes) VALUES 
(1, 1, 1, '2023-01-01', 100, 10), 
(2, 2, 2, '2023-01-02', 150, 5), 
(3, 3, 1, '2023-01-03', 200, 20);


CREATE TABLE Mapa (
idMapa INT PRIMARY KEY AUTO_INCREMENT,
ambiente VARCHAR(45),
CONSTRAINT chkAmbiente CHECK (ambiente in ('Instagram', 'Facebook', 'Twitter')),
fkMundo INT,
CONSTRAINT mapaMundo FOREIGN KEY (fkMundo) REFERENCES Mundo (idMundo)
);

INSERT INTO Mapa (ambiente, fkMundo) VALUES 
('Instagram', 1), 
('Facebook', 2), 
('Twitter', 1);


CREATE TABLE Arena (
idArena INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkMapa INT,
CONSTRAINT arenaMapa FOREIGN KEY (fkMapa) REFERENCES Mapa(idMapa)
);

INSERT INTO Arena (nome, fkMapa) VALUES 
('Arena1', 1), 
('Arena2', 2), 
('Arena3', 3);


CREATE TABLE Batalha (
idBatalha INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkBatalhaDuelo INT,
CONSTRAINT batalhaDuelo FOREIGN KEY (fkBatalhaDuelo) REFERENCES Batalha (idBatalha),
fkArena INT,
CONSTRAINT batalhaArena FOREIGN KEY (fkArena) REFERENCES Arena (idArena)
);

INSERT INTO Batalha (nome, fkBatalhaDuelo, fkArena) VALUES 
('Batalha1', NULL, 1), -- Primeira batalha não tem duelo anterior
('Batalha2', 1, 2), -- Segunda batalha é um duelo da primeira
('Batalha3', 2, 3); -- Terceira batalha é um duelo da segunda


CREATE TABLE Missao (
idMissao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
nivel VARCHAR(45),
CONSTRAINT chkNivel CHECK (nivel in ('Fácil', 'Médio', 'Díficil')),
fkPessoa INT,
CONSTRAINT missaoPessoa FOREIGN KEY (fkPessoa) REFERENCES Pessoa (idPessoa),
fkBatalha INT,
CONSTRAINT batalhaPessoa FOREIGN KEY (fkBatalha) REFERENCES Batalha (idBatalha)
);

INSERT INTO Missao (nome, nivel, fkPessoa, fkBatalha) VALUES 
('Missao1', 'Fácil', 1, 1), 
('Missao2', 'Médio', 2, 2), 
('Missao3', 'Díficil', 3, 3);

SELECT * FROM Pessoa;
SELECT * FROM Mundo;
SELECT * FROM Publicacao;
SELECT * FROM Mapa;
SELECT * FROM Arena;
SELECT * FROM Batalha;
SELECT * FROM Missao;





