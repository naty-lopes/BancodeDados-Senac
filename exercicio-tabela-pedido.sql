select *
from Pedido
order by ValorTotal desc

-- 2
update Pedido
set ValorTotal = 450.99
where Id = 7 

-- 3
delete from Pedido
where ValorTotal < 100

-- 4
select NomeCliente, DataPedido, ValorTotal
from pedido 
where DataPedido >= '2026-05-01' and Datal

-- 5
select Id, NomeCliente, Status, 
from Pedido
where FormaPagamento = 'PIX' 
order by DataPedido desc

-- 6 
select *
from Pedido 
order by ValorTotal desc 
limit 2 

CREATE TABLE Pedido (
    Id SERIAL PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataPedido timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ValorTotal DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    FormaPagamento VARCHAR(30) NULL,
    Observacao VARCHAR(200) NULL,

    FOREIGN KEY (UsuarioId) REFERENCES usuario (Id)
);
CREATE TABLE Usuario (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    DataCadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO Usuario (Nome, CPF, Email, Telefone, Ativo)
VALUES
('João Silva', '12345678901', 'joao.silva@gmail.com', '(11) 99876-1234', TRUE),
('Maria Oliveira', '23456789012', 'maria.oliveira@yahoo.com', '(21) 99765-4321', TRUE),
('Carlos Souza', '34567890123', 'carlos.souza@hotmail.com', '(31) 99654-3210', FALSE),
('Ana Pereira', '45678901234', 'ana.pereira@gmail.com', '(41) 99543-2109', TRUE),
('Fernanda Lima', '56789012345', 'fernanda.lima@outlook.com', '(51) 99432-1098', FALSE),
('Ricardo Gomes', '67890123456', 'ricardo.gomes@gmail.com', '(61) 99321-0987', TRUE),
('Patricia Alves', '78901234567', 'patricia.alves@yahoo.com', '(71) 99210-9876', TRUE),
('Lucas Martins', '89012345678', 'lucas.martins@hotmail.com', '(81) 99109-8765', FALSE),
('Juliana Rocha', '90123456789', 'juliana.rocha@gmail.com', '(91) 99098-7654', TRUE),
('Bruno Carvalho', '01234567890', 'bruno.carvalho@outlook.com', '(92) 98987-6543', TRUE);

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(1, 250.75, 1, 1, 'Entrega expressa'),
(2, 89.90, 2, 3, 'Cliente pediu embalagem presente'),
(3, 560.00, 3, 5, NULL),
(4, 120.50, 4, 2, 'Pagamento não aprovado'),
(2, 999.99, 1, 3, 'Entrega agendada'),
(2, 45.00, 2, 4, NULL),
(1, 310.20, 3, 1, 'Entregar após 18h'),
(3, 780.40, 1, 5, NULL),
(1, 150.00, 2, 3, 'Primeira compra do cliente'),
(5, 67.89, 1, 2, NULL);

select *
from FormaPagamento

select *
from status

select id 
from usuario

select Pedido.Id, Pedido.UsuarioId, Usuario.Nome, Pedido.DataPedido
from pedido 
inner join usuario 
on Pedido.UsuarioId = Usuario.Id
where Usuario.Id = 2 


insert into Pedido (usuarioId, ValorTotal, Status, FormaPagamento, Observaçao)
values 
(6, 120.99, 'Pago', 'PIX', 'Entrega Normal');


select *
from Usuario 

select *
from pedido 

CREATE TABLE Pedido (
    Id SERIAL PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataPedido timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ValorTotal DECIMAL(10,2) NOT NULL,
    StatusId  int not NULL ,
    FormaPagamentoId int NOT NULL,
    Observacao VARCHAR(200) NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    foreign key (FormaPagamentoId) references FormaPagamento(Id),
    foreign key (StatusId) references Status (Id)
);

create table FormaPagamento (
id int primary key, 
nome  varchar (30)
);

insert into FormaPagamento (Id, Nome)
values
(1, 'Cartão de Credito'),
(2, 'Cartão de Debito'),
(3, 'PIX'),
(4, 'Dinheiro'),
(5, 'Boleto')

create table Status (
id int primary key,
nome varchar (20)
);

insert into Status (Id, Nome)
values
(1, 'Pago'),
(2, 'Pendente'),
(3, 'Enviado'),
(4, 'Cancelado');

select P.Id as PedidoId,
P.UsuarioId,
U.Nome as NomeUsuario,
P.DataPedido,
FormaPagamento.Nome as NomeUsuario,
Status.Nome as Status,
P.ValorTotal
from pedido p
inner join usuario u
on P.UsuarioId = U.id 
inner join Status 
on P.StatusId = Status.id 
inner  join FormaPagamento
on P.FormaPagamentoId = FormaPagamento.Id