        Seleciona ID dos pedidos que faturaram entre 100 e 500
SELECT id FROM pedido WHERE valor.total BETWEEN 100 AND 500;

SELECT COUNT(id) FROM usuario WHERE email ILIKE '%outlook%';

select  from pedido where valortotal = (select max(valortotal) from pedido);

select  from produto where preco = (select max(preco) from produto);

select avg(preco) from produto p
inner join pedido_produto pp
on p.id=pp.pedido_id;

select p.id,
p.valor_total,
p.data_pedido,
u.nome,
pr.nome
from produto pr
inner join pedido produto pp
on pr.id=pp.produto_id
inner join pedido p
on pp.pedido_id = p.id
inner join usuario u
on p.usuario_id=u.id
where p.valor_total > 300;