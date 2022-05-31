USE construcao;

# 1 - Mostre o código e a descrição do material, bem como o código do fornecedor, data de compra
#e o preço do material.

SELECT m.cdmaterial, m.dsmaterial, mf.cdfornecedor, mf.dtcompra
FROM material m 
INNER JOIN materialfornecedor mf 
ON m.cdmaterial = mf.cdmaterial;

# 2 - Selecionar o código da obra, da atividade, a descrição da atividade, código do empregado e a
#data de início prevista da atividade.

SELECT c.cdobra, c.cdatividade, a.dsatividade, c.cdempregado, c.dtiniprev 
FROM cronograma c 
INNER JOIN atividade a 
ON c.cdatividade = a.cdatividade;


# 3 - Mostre o código do curso, código e nome do empregado, mas somente para os empregados
#com nomes que começam com a letra “A”.

SELECT ce.cdcurso, e.cdempregado, e.nmempregado
FROM cursoempregado ce
INNER JOIN empregado e
ON ce.cdempregado=e.cdempregado
WHERE e.nmempregado LIKE "A%";

# 4 - Selecionar o nome dos empregados, a data de início prevista de suas atividades e a data de
#nascimento, mas somente dos empregados que possuem atividade com data de início prevista para o
#mesmo dia/mês em que fazem aniversário.

SELECT e.nmempregado, c.dtiniprev, e.dtnascemp
FROM empregado e
INNER JOIN cronograma c
ON e.cdempregado = c.cdempregado
WHERE DAYOFMONTH(c.dtiniprev) = DAYOFMONTH(e.dtnascemp);

# 5 - Selecione o nome dos empregados que possuem o título com descrição “Especialista”.

SELECT e.nmempregado
FROM empregado e
INNER JOIN titulo t
ON e.cdtitulo = t.cdtitulo
WHERE t.dstitulo = "Especialista";

# 6 - Selecionar o código da obra, da atividade, a descrição da atividade, código do empregado e o
#nome do empregado, bem como a data de início prevista da atividade. Considerar somente as
#atividades com data de início previsto após o dia 01/04/2022.

SELECT c.cdobra, c.cdatividade, a.dsatividade, c.cdempregado , e.nmempregado
FROM cronograma c 
INNER JOIN atividade a
INNER JOIN empregado e 
ON c.cdatividade = a.cdatividade AND c.cdempregado = e.cdempregado
WHERE c.dtiniprev > "2022/04/01";

# 7 - Selecione o código e descrição dos cursos e código dos empregados que fizeram esses cursos.
#Considerar todos os cursos, tendo eles sido cursados por algum empregado 

SELECT c.cdcurso, c.dscurso, ce.cdempregado 
FROM cursoempregado ce 
RIGHT JOIN curso c
ON ce.cdcurso = c.cdcurso
WHERE ce.cdempregado IS NOT NULL;

# 8 - Selecione o código e descrição dos cursos e a quantidade de empregados que o cursou.

SELECT c.cdcurso, c.dscurso, COUNT(ce.cdempregado) AS qtalunos 
FROM curso c 
INNER JOIN cursoempregado ce 
ON c.cdcurso = ce.cdcurso
GROUP BY c.cdcurso;

# 9 - Mostrar os nomes dos empregados, bem como o nome dos seus gerentes, incluindo os
#empregados que não possuem gerentes.

SELECT eg.nmempregado AS Empregado, e.nmempregado AS Gerente 
FROM empregado eg 
LEFT JOIN empregado e 
ON e.cdempregado = eg.cdgerente;

# 10 - Buscar o código e o nome dos empregados que tem a mesma titulação que o “Paulo Cruz”.

SELECT e.cdEmpregado, e.nmEmpregado, e.cdTitulo FROM empregado e
INNER JOIN empregado et ON e.cdTitulo = et.cdTitulo AND et.nmEmpregado = 'Paulo Cruz'
WHERE e.nmEmpregado != 'Paulo Cruz';
