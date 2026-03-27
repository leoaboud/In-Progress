-- INNER: Apenas quem tem par correspondente (Alunos com matrícula)
SELECT a.nome, c.nome_disc, b.periodo
FROM   alunos a
INNER JOIN matricula b 
	ON a.id_aluno = b.id_aluno
INNER JOIN disciplina c
	ON b.id_disciplina = c.id_disciplina;

-- LEFT: Todos os alunos (Quem está matriculado e quem não está)
SELECT a.nome, c.nome_disc, b.periodo
FROM   alunos a
LEFT JOIN matricula b 
	ON a.id_aluno = b.id_aluno
LEFT JOIN disciplina c 
	ON b.id_disciplina = c.id_disciplina;

-- RIGHT: Foco na ponta final (Garante que a estrutura da matrícula seja respeitada)
SELECT a.nome, c.nome_disc, b.periodo
FROM   alunos a
RIGHT JOIN matricula b 
	ON a.id_aluno = b.id_aluno
RIGHT JOIN disciplina c 
	ON b.id_disciplina = c.id_disciplina;