CREATE DATABASE gameOfSelect;
USE gameOfSelect;

CREATE TABLE Pessoa (
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkInfluencer INT,
CONSTRAINT pessoaInfluencer FOREIGN KEY (fkInfluencer) REFERENCES Pessoa (idPessoa) 
);

CREATE TABLE Mundo (
idMundo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
constraint chkMundo CHECK (nome in ('mundo real', 'mundo virtual'))
);

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

CREATE TABLE Mapa (
idMapa INT PRIMARY KEY AUTO_INCREMENT,
ambiente VARCHAR(45),
CONSTRAINT chkAmbiente CHECK (ambiente in ('Instagram', 'Facebook', 'Twitter')),
fkMundo INT,
CONSTRAINT mapaMundo FOREIGN KEY (fkMundo) REFERENCES Mundo (idMundo)
);

CREATE TABLE Arena (
idArena INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkMapa INT,
CONSTRAINT arenaMapa FOREIGN KEY (fkMapa) REFERENCES Mapa(idMapa)
);

CREATE TABLE Batalha (
idBatalha INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkBatalhaDuelo INT,
CONSTRAINT batalhaDuelo FOREIGN KEY (fkBatalhaDuelo) REFERENCES Batalha (idBatalha),
fkArena INT,
CONSTRAINT batalhaArena FOREIGN KEY (fkArena) REFERENCES Arena (idArena)
);

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




