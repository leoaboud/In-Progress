USE curso;

CREATE TABLE funcionarios (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    setor VARCHAR(30),
    PRIMARY KEY (id)
);

select * from funcionarios;

select id, nome, salario, setor as depto
from funcionarios;

-- update
/*
insert into funcionarios (nome, salario, setor) values
('Joao', 1000, ''), ('Jose', 2000, ''), ('Alexandre', 3000, '');

insert into funcionarios (nome, salario) values ('Pedro', 1000);
insert into funcionarios (nome, salario) values ('Cleiton', 5000);

update funcionarios set salario = salario * 1.5
where id = 2;

update funcionarios set salario = salario * 1.5, setor = 'TI'
where id <> '1';
*/

-- delete
delete
from funcionarios
where id = '1';