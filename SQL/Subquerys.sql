-- ========================================================
-- EXPLORAÇÃO SAKILA: ATORES E FILMES
-- ========================================================
USE sakila;

-- Consultas de reconhecimento de estrutura
SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

-- Atores que participaram de um filme específico (film_id = 1)
SELECT * FROM actor
WHERE  actor_id IN (SELECT actor_id FROM film_actor 
                    WHERE  film_id = '1');

-- Filmes de um ator específico (actor_id = 1)
SELECT * FROM film
WHERE  film_id IN (SELECT film_id FROM film_actor 
                    WHERE  actor_id = '1');

-- Filmes de um ator específico com classificação 'PG'
SELECT * FROM film
WHERE  film_id IN (SELECT film_id FROM film_actor 
                    WHERE  actor_id = '1')
  AND  rating = 'PG';

-- Filmes que NÃO pertencem ao critério (Ator 1 + PG)
SELECT * FROM film
WHERE  film_id NOT IN (SELECT film_id FROM film_actor 
                        WHERE  actor_id = '1' AND rating = 'PG');

-- ========================================================
-- CONTAGEM DE CIDADES POR PAÍS (SUBQUERY)
-- ========================================================
SELECT * FROM country;
SELECT * FROM city;

SELECT 
    a.country_id, 
    a.country,
    (SELECT COUNT(*) FROM city b 
     WHERE  a.country_id = b.country_id) AS qtda
FROM country a;

-- ========================================================
-- EXPLORAÇÃO WORLD: POPULAÇÃO E IDIOMAS
-- ========================================================
USE world;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

-- 1. Versão com Subqueries (Scalar e no WHERE)
SELECT 
    a.countrycode, 
    SUM(a.population) AS total_pop,
    (SELECT b.name FROM country b WHERE a.countrycode = b.code) AS pais
FROM city a
WHERE a.countrycode IN (SELECT c.countrycode FROM countrylanguage c 
                         WHERE  c.language = 'Spanish')
GROUP BY a.countrycode;

-- 2. Versão com INNER JOINS (Mais performática)
SELECT 
    a.countrycode, 
    SUM(a.population) AS total_pop,
    b.name 
FROM city a
INNER JOIN country b 
    ON a.countrycode = b.code 
INNER JOIN countrylanguage c 
    ON a.countrycode = c.countrycode
WHERE c.language = 'Spanish'
GROUP BY a.countrycode, b.name;