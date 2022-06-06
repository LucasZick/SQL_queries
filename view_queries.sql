/**** ALUNO: LUCAS ALEXANDRE ZICK ****/

# 1 - Criar uma visão que retorne o código do curso, código e nome do empregado, mas somente
# para os empregados com nomes que começam com a letra “A”.

CREATE VIEW questao1 AS
	SELECT ce.cdcurso, e.cdempregado, e.nmempregado
    FROM cursoempregado ce
	INNER JOIN empregado e
	ON ce.cdempregado = e.cdempregado
	WHERE e.nmempregado LIKE "A%";
    
DROP VIEW questao1;

# 2 - Criar uma visão que retorne o nome dos empregados que possuem o título com descrição “Especialista”.

CREATE VIEW questao2 AS
	SELECT e.nmempregado
	FROM empregado e
	INNER JOIN titulo t
	ON e.cdtitulo = t.cdtitulo
	WHERE t.dstitulo = "Especialista";
    
DROP VIEW questao2;

# 3 - Criar uma visão que retorne o código e descrição dos cursos e a quantidade de empregados
# que o cursou.

CREATE VIEW questao3 AS 
	SELECT c.cdcurso, c.dscurso, COUNT(ce.cdempregado)
	FROM curso c
	INNER JOIN cursoempregado ce
	ON c.cdcurso = ce.cdcurso
	GROUP BY c.cdcurso;

DROP VIEW questao3;

# 4 - Criar uma visão que apresente os nomes dos empregados, bem como o nome dos seus
# gerentes, incluindo os empregados que não possuem gerentes.

CREATE VIEW questao4 AS 
	SELECT e.nmempregado, g.nmempregado
	FROM empregado e
	LEFT JOIN empregado g
	ON e.cdgerente = g.cdempregado;

DROP VIEW questao4;