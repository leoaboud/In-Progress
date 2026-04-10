select charset('123') retorno1, charset('ABC') retorno2;

use world;
select  name, charset(name)nome,
		continent, charset(continent) continent,
        population, charset(population) populacao
from country;

select  charset(convert(name using utf8))nome,
		convert(name using utf8)nome,
        charset(continent) cotinent,
        charset(population) populacao
from country;

use curso;
select collation('abc');

use world;
select collation('abc');
select collation(name) from country;

select connection_id();

select current_user();
select current_user;
select user();
select session_user();
select system_user();

select database();

use sakila;
select database();

select * from mysql.user;

use curo;
select sql_calc_found_rows nome_mun from senso;
select found_rows();

insert into alunos(nome) values('Catarina');
select last_insert_id();

insert into alunos(nome) values ('Greg'), ('Marla'), ('Jack');
select last_insert_id();

use curso;
select schema();

use sakila;
select schema();

use world;
select schema();

select version();