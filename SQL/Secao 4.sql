/*
select * from senso
where cod_uf = '35'
and ano = '2014';
*/

-- operador =
/*
select * from senso
where nome_mun = 'Dourado'
*/

-- operador >
/*
select * from senso
where populacao > 100000
and ano = '2014';
*/

-- operador + 
/*
select 3 + 2 as retorno;
*/

-- operador -
/*
select 3 - 2 as retorno;
*/

-- operador *
/*
select 3 * 2 as retorno;
*/

-- operador /
/*
select 10 / 2 as retorno;
*/

-- operador %
/*
select 7 + 2 as retorno;
*/

-- Acrescimo 10%

select * from curso.senso
	populacao * 1.10 as pop_populacao
    from senso
    where ano ='2014'
    limit 50000;


