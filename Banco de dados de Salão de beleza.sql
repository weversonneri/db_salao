create database DB_Salao;
use DB_Salao;

create table tb_clientes (
id_cliente		int auto_increment primary key,
Nome			varchar(40) not null,
CPF				varchar(11) not null,
data_nasc		date,
email			varchar(30),
telefone		varchar(11) not null,
endereco		varchar(20)
);


create table tb_especialidades(
id_especi		int auto_increment primary key,
Descrição		varchar(12) not null
);


create table tb_profissional (
id_profi		int auto_increment primary key,
Nome			varchar(30) not null,
CPF				varchar(11)  not null,
data_nasc		date,
telefone		varchar(11)  not null,
Especialidade	int not null,
constraint fk_especi foreign key (Especialidade) references tb_especialidades (id_especi)
);


create table tb_servicos(
id_servico		int auto_increment primary key,
tipoServico		varchar (25) not null,
Preco			decimal(10,2),
Preco_promocao	decimal(10,2),
id_especi		int,
constraint fk_especi2 foreign key (id_especi) references tb_especialidades (id_especi)
);



create table tb_agendamento(
id				int auto_increment primary key,
data_agendamento	date not null,
horario_agendamento	time not null,
id_cliente		int not null,
id_servico		int ,
id_profi		int not null,
constraint fk_cliagenda	foreign key (id_cliente) references tb_clientes (id_cliente),
constraint fk_profiagenda foreign key (id_profi) references tb_profissional (id_profi),
constraint fk_agendaserv foreign key (id_servico) references tb_servicos (id_servico)
);



create table tb_caixa(
idcaixa			int primary key,
cData			datetime default now(),
saldo_inicial	decimal(10,2) ,
saldo_Atual		decimal(10,2) 
);


create table tb_formaPagamento(
idForma				int auto_increment primary key,
tipoPagamento		varchar(15) not null
);



create table tb_movimento(
codMovimento		int not null auto_increment primary key,
idcaixa				int,
mData				datetime default now(),
fkTipo				varchar(10) not null,
formaPagamento		int,
valor				decimal(10,2) default null,
descricao			varchar(30) default null,
constraint fk_idcaixa foreign key (idcaixa) references tb_caixa (idcaixa),
constraint fk_idforma foreign key (FormaPagamento) references tb_formaPagamento (idForma)
);




create table tb_Registros(
id_registro			int auto_increment primary key,
Movimento			varchar(15),
id					int,
nome				varchar(30)
)  ; 



/*************************************** INSERTS DAS TABELAS ***********************************************/
insert into tb_clientes (Nome, cpf, data_nasc, email, telefone, endereco)
values ('Carla Araujo Barbosa', '34776820250', '1978-04-03', 'CarlaAraB@dayrep.com', '977269392','Q.06 Planaltina'),
		('Ana Rocha Rodrigues', '34659274195', '1960-10-08', 'AnaRoc@jourrapide.com', '986819828', 'Marechal Deodoro'),
        ('Isabela Castro Souza', '60967394406','1976-12-25', 'IsaSouza@armyspy.com', '99189-5190', 'Buritis 3'),
        ('Carla Barros Goncalves', '32422271740','1979-09-03', 'barros.b@gmail.com.com', '99456-9890', '106 sul Brasilia'),
		('Beatrice Barros Souza', '31017681953','1999-06-18', 'BeaB@hotmail.com', '98521-3568', 'Av.Independencia'),
        ('Tais Martins', '49967394476','1984-02-06', 'Martinsbol@gmail.com', '98652-5142', 'Q. 07 Sobradinho'),
        ('Nicole Azevedo', '03266758395','1996-01-20', 'cole15@outlook.com', '99741-7598', 'Q. Res. Sudoeste 2'),
		('Sebastiana Vettel', '03569874152', '1985-11-18', 'vettelseb@yahoo.com', '993652140','Park Way'),
        ('Giovana Gomes Teixeira', '00216461391','1992-06-13', 'giovana.teixeira@yahoo.com', '99324-4752', 'Q. 06b'),
        ('Helena Amaral', '88332663466','1987-10-16', 'helena.amaral@yahoo.com', '99987-7411', 'Buritis 3'),
        ('Alice Gomes', '92744398144','1984-02-01', 'alice.gomes@hotmail.com', '99789-1235', 'Jardim Roriz'),
        ('Isabela Machado', '65283352226','1991-04-14', 'isabela.machado@icloud.com', '98961-4569', 'Vila de Fátima');

/****/
insert into tb_especialidades (Descrição)
values ('Manicure'),('Cabelereiro'),('Estética'),('Maquiagem');

/****/
insert into tb_profissional (Nome, CPF, data_nasc, telefone, especialidade)
values ('Carmem Aguiar', '59632145621', '1990-03-15','996541231', 2),
		('Carine Lucena', '15320489632', '1972-04-17', '994521058', 4),
        ('Daiane Silva', '76324785203', '1989-04-22', '994587562', 3),
        ('Lucia Santos', '03285147536', '1992-05-15', '985412369', 1),
        ('Lara Nunes', '05147856231', '1979-06-23', '996465626', 2);

/****/        
Insert into tb_servicos (tiposervico,preco,id_especi) 
values ('Pé',15,1),('Mão',15,1),('Unha Porcelana',120,1),('Unha Postiça',35,1),
('Unha Acrygel',90,1),('Corte',25,2),('Secagem',15,2),('Escova',18,2),('Hidratação',25,2),
('Coloração',30,2),('Penteado',60,2),('Limpeza de pele',50,3),('Massagem Corporal',50,3),
('Sobrancelha',25,3),('Sobrancelha de henna ',35,3),('Maquiagem',70,4),('Unha Porcelana',120,1),
('Massagem Corporal',50,3),('Penteado',60,2);
/****/
insert into tb_agendamento (data_agendamento, horario_agendamento, id_cliente,id_servico, id_profi)
values ('2018-12-01','16:00',1,9,2),('2018-11-30','11:00',2,1,1),('2018-11-30','11:00',2,2,1),
	   ('2018-11-29','10:00',3,8,2),('2018-12-01','17:00',4,16,4),('2018-11-24','14:00',5,14,3),
       ('2018-11-26','09:00',6,5,1),('2018-11-27','15:00',7,10,2),('2018-12-03','10:00',8,9,2),
       ('2018-11-27','15:00',9,15,3),('2018-11-24','13:00',10,12,3),('2018-11-29','11:00',11,3,1);

/****/
insert into tb_caixa (idcaixa, saldo_inicial, saldo_atual) 
values (1 , 0, 0);

/****/
insert into tb_formaPagamento (tipoPagamento) 
values('Dinheiro'),('Cartão Credito'),('Cartão Débito'),('Cheque');


/****/
insert into tb_movimento (idcaixa, fktipo,formapagamento, valor, descricao)
values(1,'entrada', 1, 30, 'Pé e mão'),(1,'entrada', 4, 120, 'Unha Porcelana'),(1,'entrada', 3, 25, 'Corte cabelo'),
	  (1,'entrada', 2, 70, 'Maquiagem'),(1,'entrada', 2, 25, 'Sobrancelha'),(1,'entrada', 1, 35, 'Sobrancelha de henna'),
      (1,'entrada', 1, 60, 'Penteado'),(1,'entrada', 2, 18, 'Escova'),(1,'entrada', 3, 35, 'Unha Postiça'),
      (1,'entrada', 3, 30, 'Coloraçao'),(1,'entrada', 3, 50, 'Limpeza de pele'),(1,'entrada', 1, 50, 'Massagem Corporal');
insert into tb_movimento (idcaixa, fktipo, valor, descricao)
values(1,'saida', 40, 'Alimentação'),(1,'saida', 100, 'Fornecedor'),(1,'saida', 10, 'Luvas'),(1,'saida', 3, 'Gilete'),
	  (1,'saida', 30, 'Produto'),(1,'saida', 15, 'Pente'),(1,'saida', 42, 'Henna'),(1,'saida', 6,'Esmalte'),(1,'saida', 7,'Lixas');

/****/
insert into tb_formaPagamento (tipoPagamento) 
values('Dinheiro'),('Cartão Credito'),('Cartão Débito'),('Cheque');

/*************************************************************************************************************/
SELECT COUNT(*) FROM tb_clientes, tb_especialidades,tb_profissional,
tb_servicos,tb_agendamento,tb_caixa,tb_movimento,tb_formaPagamento;
/******/
select * from tb_clientes;
select * from tb_profissional;
select * from tb_especialidades;
select * from tb_servicos;
select * from tb_agendamento;
select * from tb_caixa;
select * from tb_movimento;
select * from tb_formaPagamento;
select * from tb_registros;
/**/
select * from tb_movimento 
where fktipo = 'entrada'
group by valor;
/**/
select * from tb_movimento 
where fktipo = 'saida'
group by valor;
/**/
select formapagamento, valor, descricao 
from tb_movimento 
where fktipo = 'entrada';
/**/
select id_cliente,Nome , data_nasc, telefone
from tb_clientes order by data_nasc asc;
/**/
select * from tb_servicos
order by Preco;
/**/
select id_cliente,Nome , data_nasc, telefone 
from tb_clientes
where nome like 'a%';
/**/
select * from tb_agendamento 
order by data_agendamento asc;
/**/
SELECT tiposervico, MIN(Preco)
FROM tb_servicos;
/**/
SELECT fktipo, valor, descricao
FROM tb_movimento
WHERE valor BETWEEN 15 AND 80;
/**/
SELECT sum(valor)
FROM tb_movimento
WHERE fktipo like '%entrada';
/**/
SELECT sum(valor)
FROM tb_movimento
WHERE fktipo like '%saida';
/**/
SELECT count(id_cliente)
FROM tb_clientes;
/**/
select Nome, data_nasc from
tb_profissional order by data_nasc asc;
/**/
SELECT id_cliente,Nome, data_nasc
FROM tb_clientes
WHERE data_nasc BETWEEN '1985-01-01' AND '1995-01-01'
order by data_nasc desc;
/**************************************  TRIGGERS    ***************************************/


/**** ATUALIZA O SALDO DO CAIXA QUANDO É FEITO UM MOVIMENTO ***/    
delimiter $$
drop trigger if exists trg_movimento$$
create trigger trg_movimento
after insert on tb_movimento
for each row
begin
    if (new.fktipo = 'Entrada') then
       update tb_caixa
         set  saldo_Atual = saldo_Atual + new.valor
        where idcaixa = new.idcaixa;
    end if;
    
    if (new.fktipo = 'saida') then
       update tb_caixa
         set  saldo_Atual = saldo_Atual - new.valor
        where idcaixa = new.idcaixa;
      end if;
 end $$
 delimiter  ;
 
 /********/


/**** ATUALIZA O PREÇO DOS SERVIÇOS EM DIA DE PROMOÇÃO*****/
drop trigger if exists trg_promocao;
create trigger trg_promocao
before insert on tb_servicos
for each row
set new.preco_promocao = new.preco * 0.90;


/******/
 
 /**** REGISTRA O CADASTRO DELETADO DA TABELA CLIENTES NA TABELA REGISTROS ****/
 delimiter $$
 drop trigger if exists tgr_deleteCli$$
 create trigger tgr_deleteCli
 after delete on tb_clientes
 for each row
begin
insert into tb_registros (id_registro,movimento,id,nome)
values(null,'DELETE',OLD.id_cliente,OLD.nome);
end $$
delimiter ;

delete  from tb_clientes where id_cliente = 12;

 /******/
 
 
  /**** REGISTRA O AGENDAMENTO CANCELADO NA TABELA REGISTROS ****/
 delimiter $$
 drop trigger if exists tgr_cancelAgenda$$
 create trigger tgr_cancelAgenda
 after delete on tb_agendamento
 for each row
begin
insert into tb_registros (id_registro,movimento,id,nome)
values(null,'AGEN. CANCELADO',old.id,null);
end $$
delimiter ;

delete  from tb_agendamento where id = 4;
 
/****/

 /**** REGISTRA OS DADOS ANTIGOS DEPOIS DA ATUALIZAÇÃO NA TABELA REGISTROS ****/
 delimiter $$
 drop trigger if exists tgr_upHistorico$$
 create trigger tgr_upHistorico
 after update on tb_clientes
 for each row
begin
insert into tb_registros (id_registro,movimento,id,nome)
values(null,'Cad. Atualizado',old.id_cliente,null);
end $$
delimiter ;


update tb_clientes set nome = 'Adriana Martins' where id_cliente = 10;

 
 /***************************************** STORE PROCEDURES *****************************************************************************************************/
 
/**** MOSTRA TODOS OS ANIVERSARIANTES DO MES ****/
delimiter $$
drop procedure if exists sp_mesAniversariantes; $$
create procedure sp_mesAniversariantes()
begin

    select * from tb_clientes 
	WHERE date_format(data_nasc, '%m')= date_format(date(now()), '%m') order by data_nasc asc  ;
		
end $$
delimiter ; 
    
call sp_mesAniversariantes; 

/****/


/***** MOSTRA TODOS OS AGENDAMENTOS DO DIA ***/
delimiter $$
drop procedure if exists sp_agendaDia $$
create procedure sp_agendaDia()
begin

    select * from tb_agendamento
	WHERE date_format(data_agendamento, '%d')= date_format(date(now()), '%d')
    and time_format(horario_agendamento, '%k') between '09' and '24';
		
end $$
delimiter ;    

call sp_agendaDia;


/*****/

/**** MOSTRA OS REGISTROS DE ENTRADA ****/
delimiter $$
drop procedure if exists sp_movimentoDia $$
create procedure sp_movimentoDia()
begin
	declare Entrada_dia varchar(10);
    select *  from tb_movimento
    where fktipo = 'entrada' 
    ;
		
end $$
delimiter ; 

call sp_movimentoDia;

/*****/

/**** MOSTRA OS REGISTROS DE SAIDA ****/
delimiter $$
drop procedure if exists sp_movimentoDia2 $$
create procedure sp_movimentoDia2()
begin
	declare Entrada_dia varchar(10);
	select codMovimento, mdata, valor, descricao  from tb_movimento
    where fktipo = 'saida' 
    ;
		
end $$
delimiter ; 

call sp_movimentoDia2;

/******/
 
 /*** CONTA A QUANTIDADE DE CLIENTES CADASTRADOS ***/
delimiter $$
drop procedure if exists sp_totalClientes $$
create procedure sp_totalClientes()
begin
	declare total int;
    declare mensagem varchar(50);
    select count(id_cliente) into total from tb_clientes;
	if total <= 15 then
		set mensagem = 'A quantidade de clientes cadastrados e maior que 15';
	else
		set mensagem = 'Existem menos de 15 clientes cadastrados';
	end if;
    select mensagem;
end $$;
delimiter ;
    
 call sp_totalClientes;  

/******/

/**** MOSTRA OS DADOS DA TABELA SERV~ÇOS COM SUAS DEVIDAS ESPECIALIDADES ***/    
delimiter $$
    drop procedure if exists servicosXespecialidade $$
    create procedure servicosXespecialidade ()
    begin
    select * from tb_servicos where id_especi = id_especi;
    end $$
    delimiter ;
    
    call servicosXespecialidade;
    
    
 /************************************ VIEWS *****************************************************************************/   
drop view if exists vw_agendacli;
create view vw_agendacli
as select tb_clientes.Nome, tb_agendamento.id ,tb_agendamento.horario_agendamento,tb_servicos.id_servico
from tb_clientes
inner join tb_agendamento
on tb_clientes.ID_cliente = tb_agendamento.id
inner join tb_servicos
on tb_servicos.id_servico = tb_agendamento.id_servico;   
    
    
SELECT Nome, id,horario_agendamento,id_servico
FROM vw_agendacli
ORDER BY id;
    
 /****/
 drop view if exists vw_ProServ;
create view vw_ProServ
as select  tb_servicos.tipoServico ,tb_especialidades.id_especi,tb_profissional.nome
from tb_servicos
inner join tb_especialidades
on   tb_servicos.id_especi = tb_especialidades.id_especi
inner join tb_profissional 
on  tb_profissional.especialidade = tb_especialidades.id_especi ;
  
select tipoServico,id_especi, nome
from vw_ProServ;
 
 /****/
 
drop view if exists vw_ProfiAG;
create view vw_ProfiAG
as select  tb_agendamento.id ,tb_agendamento.data_agendamento,tb_profissional.id_profi
from tb_agendamento
inner join tb_profissional
on   tb_agendamento.id_profi = tb_profissional.id_profi;

  
select id,data_agendamento,id_profi
from vw_ProfiAG
where data_agendamento like '2018-12-01'
order by id;

/****/

drop view if exists vw_tipopag;
create view vw_tipopag
as select tb_formapagamento.tipopagamento,tb_movimento.valor,tb_movimento.descricao
from tb_movimento
inner join tb_formapagamento
on tb_movimento.codMovimento = tb_formapagamento.idforma;


select  tipoPagamento,valor,descricao
from vw_tipopag order by valor;
   
/****/

    
    
    
    
    
    
    
    
    
   
    