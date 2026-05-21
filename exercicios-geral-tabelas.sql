--1
select Nome, Email 
from Usuario 
where Ativo = true 

--2
select *
from usuario 
where ValorTotal > 500

--3
select u.Nome, p.ValorTotal
from pedido p 
inner join Usuario u 
on p.UsuarioId = .Id 

--4
select count (*)
from Usuario 
where Email like "gmail.com"

--5
select max (ValorTotal)
from pedido 

--6
select avg(ValorTotal)
from pedido p 
inner join Usuario u
on p.usuarioid = u.id 
where u.Ativo = true

--7
select sum(ValorTotal)
from Pedido p
inner join FormaPagamento f 
on p.FormaPagamentoId = f.id
where f.Nome = 'PIX'

--8
select Usuario.Nome, 
Pedido.DataPedido,
Status.Nome as Status
from Pedido 
inner join Usuario 
on Usuario.Id = Pedido.usuarioid 
on Pedido.StatusId = Status.Id 
where Pedido.StatusId = 2

--9
select u.Nome as NomeUsuario,
p.ValorTotal,
fp.Nome as FormaPagamento
from Pedido p 
inner join Usuario u 
on p.UsuarioId = u.id 
inner joi  FormaPagamento fp 
on p.FormaPagamentoId = fp.Id
where fp.Nome ilike '%Cartão%'
--where fp.Id = 1 or fp.Id = 2 

--12
select Usuario.nome,
Status.Nome as Status,
Pedido.Observacao
from Pedido 
inner join usuario 
on Pedido.UsuarioId = Usuario.id 
inner join status 
on Pedido.StatusId = Status.id 
where Pedido.Observacao is not null

--13
update usuario 
set Email = 'oliveira.maria@gmail.com',
Telefone = '(51) 99922-6385'
where Id = 2 




select *
from pedido 
