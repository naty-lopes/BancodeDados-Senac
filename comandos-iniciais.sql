CREATE TABLE Cliente (    
Id SERIAL PRIMARY KEY,    
Nome VARCHAR(100) NOT NULL,    
Email VARCHAR(100),    
Genero VARCHAR(1) NOT NULL,    
DataNascimento DATE NOT NULL );

INSERT INTO Cliente (Nome, Email, Genero, 
DataNascimento)
VALUES ('João Silva', 'joao@email.com', 'M', 
'1990-05-12');

INSERT INTO Cliente (Nome, Genero, DataNascimento)
VALUES ('Maria Souza', 'F', '1988-09-23')

select *
from Cliente 

-- Todos os clientes
SELECT * FROM Cliente

-- Apenas Nome e Email
SELECT Nome, Email FROM Cliente;

-- Filtro (WHERE)
SELECT * FROM Cliente
WHERE Nome = 'Maria Souza'

-- Ordenação
SELECT * FROM Cliente
ORDER BY DataNascimento desc

UPDATE Cliente
SET Email = 'joao@email.com'
WHERE id  = 1;

DELETE FROM Cliente
where id = 2
