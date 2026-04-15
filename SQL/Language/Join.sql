/*******************************************************************************
  SCRIPT DE ESTUDO: TIPOS DE JUNÇÃO (INNER, LEFT E RIGHT JOIN)
  PADRONIZAÇÃO: VISUALIZAÇÃO DE CONJUNTOS E PRESERVAÇÃO DE REGISTROS.
*******************************************************************************/

-- 1. CONFIGURAÇÃO DE CONTEXTO
USE CURSO;


-- =============================================================================
-- 2. INNER JOIN (A INTERSECÇÃO)
-- =============================================================================

-- RETORNA APENAS O RESULTADO DAS CORRESPONDÊNCIAS EXATAS ENTRE AS TABELAS
-- O RESULTADO IGNORA ALUNOS SEM MATRÍCULA E DISCIPLINAS VAZIAS
SELECT 
      A.NOME AS NOME_ALUNO, 
      C.NOME_DISC AS DISCIPLINA, 
      B.PERIODO
FROM ALUNOS AS A
INNER JOIN MATRICULA AS B ON A.ID_ALUNO = B.ID_ALUNO
INNER JOIN DISCIPLINA AS C ON B.ID_DISCIPLINA = C.ID_DISCIPLINA;


-- =============================================================================
-- 3. LEFT JOIN (PRESERVAÇÃO DA ESQUERDA)
-- =============================================================================

-- GERA O RETORNO DE TODOS OS ALUNOS, INDEPENDENTE DE TEREM MATRÍCULA VINCULADA
-- CASO NÃO HAJA RELAÇÃO, O RESULTADO EXIBIRÁ VALORES NULOS NAS COLUNAS DA DIREITA
SELECT 
      A.NOME AS NOME_ALUNO, 
      C.NOME_DISC AS DISCIPLINA, 
      B.PERIODO
FROM ALUNOS AS A
LEFT JOIN MATRICULA AS B ON A.ID_ALUNO = B.ID_ALUNO
LEFT JOIN DISCIPLINA AS C ON B.ID_DISCIPLINA = C.ID_DISCIPLINA;


-- =============================================================================
-- 4. RIGHT JOIN (PRESERVAÇÃO DA DIREITA)
-- =============================================================================

-- ASSEGURA O RETORNO DE TODAS AS DISCIPLINAS, MESMO AQUELAS SEM ALUNOS INSCRITOS
-- O RESULTADO É ÚTIL PARA IDENTIFICAR DISCIPLINAS OCIOSAS NO SISTEMA
SELECT
	A.NOME AS NOME_ALUNO, 
	C.NOME_DISC AS DISCIPLINA, 
    B.PERIODO
FROM ALUNOS AS A
RIGHT JOIN MATRICULA AS BON A.ID_ALUNO = B.ID_ALUNO
RIGHT JOIN DISCIPLINA AS C ON B.ID_DISCIPLINA = C.ID_DISCIPLINA;