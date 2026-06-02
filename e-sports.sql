create table arenas (
	id int primary key,
	nome varchar(30) not null,
	capacidade int not null,
	modalidadePrincipal varchar(50) not null
)

insert into arenas (id,nome,capacidade,modalidadePrincipal)
values (1, 'Grêmio', 300, 'FPS');
insert into arenas (id,nome,capacidade,modalidadePrincipal)
values (2, 'Maracanã', 200, 'MOBA');
insert into arenas (id,nome,capacidade,modalidadePrincipal)
values (3, 'Milão', 250, 'FPS');
insert into arenas (id, nome,capacidade,modalidadePrincipal)
values (4, 'São paulo', 300, 'Battle royale');

create table equipe(
id int primary key,
nome varchar(30) not null
)

insert into equipe(id,nome) values (1, 'Loud');
insert into equipe(id,nome) values (2, 'Mibr');
insert into equipe(id,nome) values (3, 'Cloud9');

select *
from equipes

create table jogadores(
id serial primary key,
nome varchar(60) not null,
nickname varchar(20) not null unique,
dataNascimento date not null,
salario int not null,
equipeid int not null,
foreign key (equipeid) references equipe(id)
)

insert into jogadores (nome, nickname, dataNascimento, salario, equipeid) 
values ('Erick Santos', 'Aspas', '15-06-2003', 3000, 1);

insert into jogadores (nome, nickname, dataNascimento, salario, equipeid) 
values ('Lee Sang', 'Faker', '07-05-1996', 4000, 2 );

insert into jogadores (nome, nickname, dataNascimento, salario, equipeid) 
values ('Heitor Tomazela', 'Tck', '26-09-2000', 2000, 3 );

create table partidas (
id serial primary key,
dataPartida date not null,
arenaid int not null,
equipeid int not null,
equipeid2 int not null,

check (equipeid <> equipeid2),

foreign key (equipeid) references equipe(id),
foreign key (equipeid2) references equipe(id),
foreign key (arenaid) references arenas(id)
)

insert into partidas(datapartida,arenaid,equipeid,equipeid2)
values ('30-05-2026',1,1,3)

select 
id as IdPartida,
datapartida,
arenaid as Arena,
equipeid  as equipe1,
equipeid2 as equipe2
from partidas 

create table patrocinadores(
id serial primary key,
nomeEmpresa varchar(40) not null,
categoria varchar(50) not null,
valorInvestido int not null
)

insert into patrocinadores(nomeEmpresa,categoria,valorInvestido)
values ('ifood', 'FPS', 40000)

insert into patrocinadores(nomeEmpresa,categoria,valorInvestido)
values ('Uber', 'Battle royale', 35000)

insert into patrocinadores(nomeEmpresa,categoria,valorInvestido)
values ('Betano', 'MOBA', 49000)


create table ingressosVisitante(
id int primary key,
tipoDeAcesso varchar(40) not null
)

insert into ingressosVisitante(id,tipoDeAcesso)
values(1, 'diário')

insert into ingressosVisitante(id,tipoDeAcesso)
values(2, 'premium')

insert into ingressosVisitante(id,tipoDeAcesso)
values(3, 'backstage')

create table visitantes(
id serial primary key,
NomeVisitante varchar(50) not null,
ingressoId int not null,
Compareceuid boolean default false,
foreign key (ingressoid) references ingressosVisitante(id)
)

insert into visitantes(nomevisitante,ingressoid,Compareceuid)
values
('João paulo', 1, true),
('Ana Silva', 1, false),
('Bruno Costa', 2, false),
('Carla Souza', 3, true),
('Diego Martins', 1, false),
('Eduarda Lima', 2,false),
('Felipe Rocha', 3, true),
('Gabriela Alves', 1, true),
('Henrique Pereira', 2,true)

create table plataformaid(
id int primary key,
nome varchar(30) not null
)

insert into plataformaid(id,nome)
values 
(1, 'Twitch'),
(2, 'Kick'),
(3, 'Youtube')


create table streamers(
id int primary key,
nickStreamer varchar(30) not null,
plataformaid int not null,
seguidores int not null,
foreign key (plataformaid) references plataformaid(id)
)

insert into streamers(id, nickStreamer,plataformaid,seguidores)
values 
(1,'Cellbit',1, 9500000),
(2,'Cereaw',2, 350000),
(3,'Alanzoka',1,10000000),
(4,'Godenot',3, 5000000)

select *
from streamers 

select
    j.nome,
    j.nickname,
    e.nome as equipe
from jogadores j
join equipe e
    on j.equipeid = e.id;
   
   select
    p.id,
    p.datapartida,
    a.nome as arena,
    e1.nome as equipe_casa,
    e2.nome as equipe_visitante
from partidas p
join arenas a
    on p.arenaid = a.id
join equipe e1
    on p.equipeid = e1.id
join equipe e2
    on p.equipeid2 = e2.id;
   
   select
    NomeVisitante,
    Compareceuid
from visitantes
where Compareceuid = true;
