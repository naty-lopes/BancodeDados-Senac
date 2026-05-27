CREATE TABLE Cidade (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Estado VARCHAR(2) NOT NULL
);

INSERT INTO Cidade (Nome, Estado) VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Curitiba', 'PR'),
('Fortaleza', 'CE');

ALTER TABLE Usuario
ADD COLUMN CidadeId INT;

UPDATE Usuario
SET CidadeId = 3
WHERE Id = 1; 
UPDATE Usuario
SET CidadeId = 3
WHERE Id = 2; 
UPDATE Usuario
SET CidadeId = 2
WHERE Id = 3; 

UPDATE Usuario
SET CidadeId = 1
WHERE Id = 4; 
UPDATE Usuario
SET CidadeId = 3
WHERE Id = 5; 
UPDATE Usuario
SET CidadeId = 2
WHERE Id = 6;

select
u.Id,
u.Nome,
u.Cpf,
c.Nome as NomeCidade,
c.Estado
from Usuario u left join Cidade c
on u.CidadeId = c.Id

CREATE TABLE Passaporte (
    Id SERIAL PRIMARY KEY,
    Numero VARCHAR(20) NOT NULL UNIQUE,
    UsuarioId INT UNIQUE, 
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
);

INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100001', 1);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100002', 2);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100003', 3);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100004', 4);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100005', 5);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100006', 6);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100007', 7);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100008', 8);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100009', 9);
INSERT INTO Passaporte (Numero, UsuarioId) VALUES ('BR100010', 10);

select 
u.Nome,
u.Cpf,
p.Numero,
p.UsuarioId
from usuario u 
inner join passaporte p
on u.id = p.usuarioid
where u.id = 2

select *
from Usuario u

select *
from Cidade

select 
p.Id,
p.ValorTotal,
u.Id as UsuarioId,
U.nome as NomeUsuario
from Usuario u 
inner join Pedido p 
on p.UsuarioId = u.id 
where u.Id = 1 

create table Produto (
Id SERIAL primary key,
Nome VARCHAR(150) not null,
Descricao text,
Preco DECIMAL(10,2) not null,
Estoque INTEGER default 0,
Ativo BOOLEAN default true,
CriadoEm TIMESTAMP default CURRENT_TIMESTAMP,
AtualizadoEm TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO Produto (Nome, Descricao, Preco, Estoque)
VALUES
('Mouse Gamer', 'Mouse RGB 7200 DPI', 150.00, 25),
('Teclado Mecânico', 'Teclado switch blue', 350.00, 15),
('Monitor 24"', 'Monitor Full HD IPS', 899.90, 10),
('Headset Gamer', 'Headset com microfone', 250.75, 20),
('Notebook i5', 'Notebook 16GB RAM SSD 512GB', 4500.00, 5),
('Cadeira Gamer', 'Cadeira ergonômica reclinável', 1200.50, 8),
('Webcam HD', 'Webcam 1080p', 89.90, 30),
('Mousepad XXL', 'Mousepad extra grande', 45.00, 40),
('SSD 1TB', 'SSD NVMe Gen4', 560.00, 12),
('Fonte 650W', 'Fonte modular 80 Plus Bronze', 310.20, 18);


INSERT INTO PedidoProduto
(PedidoId, ProdutoId, Quantidade, ValorUnitario, ValorTotal)
VALUES
(1, 8, 3, 45.00, 135.00),
(1, 1, 1, 115.75, 115.75),
(2, 7, 1, 89.90, 89.90),
(3, 8, 4, 45.00, 180.00),
(3, 1, 2, 150.00, 300.00),
(3, 7, 1, 80.00, 80.00),
(4, 8, 2, 45.00, 90.00),
(4, 1, 1, 30.50, 30.50),
(5, 3, 1, 899.90, 899.90),
(5, 8, 2, 45.00, 90.00),
(5, 1, 1, 10.09, 10.09),
(6, 8, 1, 45.00, 45.00),
(7, 8, 2, 45.00, 90.00),
(7, 1, 1, 150.00, 150.00),
(7, 7, 2, 35.10, 70.20),
(8, 9, 1, 560.00, 560.00),
(8, 8, 2, 45.00, 90.00),
(8, 1, 1, 130.40, 130.40),
(9, 8, 2, 45.00, 90.00),
(9, 1, 2, 30.00, 60.00),
(10, 8, 1, 45.00, 45.00),
(10, 1, 3, 7.63, 22.89);

CREATE TABLE PedidoProduto (
    Id SERIAL PRIMARY KEY,
    PedidoId INTEGER NOT NULL,
    ProdutoId INTEGER NOT NULL,
    Quantidade INTEGER NOT NULL,
    ValorUnitario NUMERIC(10,2) NOT NULL,
    ValorTotal NUMERIC(10,2) NOT NULL,
        FOREIGN KEY (PedidoId) REFERENCES Pedido(Id),
        FOREIGN KEY (ProdutoId) REFERENCES Produto(Id)
        
        select ped.Id as PedidoId, 
        ped.datapedido,
        prod.Nome,
        pp.valorunitario,
        pp.quantidade, 
        ped.ValorTotal
        from PedidoProduto pp 
        inner join Pedido ped
        on ped.id = pp.pedidoid
        inner join produto prod 
        on prod.id = pp.produtoid 
        where prod.id = 8 