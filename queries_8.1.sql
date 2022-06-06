# 1 - Código e nome dos empregados que possuem atividades com início previsto após 01/04/2022.

SELECT e.cdEmpregado, e.nmEmpregado 
FROM empregado e 
INNER JOIN (
	SELECT cdEmpregado 
    FROM cronograma 
    WHERE dtIniPrev > "2022-04-01") AS c 
ON e.cdEmpregado = c.cdEmpregado;

# 2 - Selecionar o código da obra, da atividade, a descrição da atividade, código do empregado,
# bem como a data de início prevista da atividade. Considerar somente as atividades dos funcionários
# que tenham nome que começam com a letra A.



# 3 - Nome dos empregados que possuem atividades com dias de início previstos anteriores ao dia 09.

SELECT DISTINCT e.cdEmpregado, e.nmEmpregado 
FROM empregado e 
INNER JOIN (
	SELECT cdEmpregado 
    FROM cronograma 
    WHERE DAY(dtIniPrev) < 9) AS c 
ON e.cdEmpregado = c.cdEmpregado
ORDER BY cdEmpregado;

# 4 - Buscar o código do empregado, nome do empregado, data de nascimento, órgão em que
# trabalha e a descrição do órgão. Ordenar pelo código e nome do empregado. Buscar apenas as tuplas
# 3 a 5, nesta ordem.

SELECT e.cdEmpregado, e.nmEmpregado, dtNascEmp, o.cdOrgao, o.dsOrgao 
FROM empregado e 
INNER JOIN orgao o 
ON e.cdOrgao = o.cdOrgao
LIMIT 2,3;

# 5 - Buscar a quantidade de empregados trabalhando por data de início prevista, mas somente
# para a obra 801.

SELECT dtIniPrev, COUNT(cdEmpregado) 
FROM cronograma 
WHERE cdObra = 801 
GROUP BY dtIniPrev;

# 6 - Código e descrição dos fornecedores que já forneceram mais que 2 produtos.

SELECT * 
FROM fornecedor
WHERE cdFornecedor = ANY(
	SELECT cdFornecedor
    FROM materialfornecedor 
    GROUP BY cdFornecedor
    HAVING COUNT(cdFornecedor)>2);


