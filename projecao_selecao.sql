#ALUNO: Lucas Zick
#LISTA 12 - SELEÇÃO E PROJEÇÃO

# 1 - Buscar os dados dos empregados que trabalham no órgão 701.
SELECT * 
FROM empregado 
WHERE cdorgao = 701;

# 2 - Buscar os dados dos empregados que tenham data de nascimento entre 02/02/1972 e
# 15/03/1976.
SELECT * 
FROM empregado 
WHERE dtnascemp >= "1972/02/02" 
AND dtnascemp <= "1976/03/15";

# 3 - Buscar os dados do cronograma exceto das atividades 1 e 3.
SELECT * 
FROM cronograma 
WHERE cdAtividade != 1 
AND cdAtividade != 3;

# 4 - Buscar os dados de materialFornecedor, mas somente aqueles com preço < 10, dos
# fornecedores 502 ou 505.
SELECT * 
FROM materialfornecedor 
WHERE prmaterial < 10 
AND cdfornecedor IN (502, 505);

# 5 -  Buscar o código e a descrição de todos os materiais.
SELECT cdmaterial, dsmaterial 
FROM material;
# 5(VERSÃO DE RISCO)
SELECT * 
FROM material;

# 6 -  Buscar o código e a descrição das obras do engenheiro 601.
SELECT cdobra, dsobra
FROM obra
WHERE cdengenheiro = 601;

# 7 - Buscar o código do fornecedor e a data de compra do material 404.
SELECT cdfornecedor, dtcompra
FROM materialfornecedor
WHERE cdmaterial = 404;

# 8 - Buscar o código do empregado e o código do seu órgão, somente para os empregados
# admitidos no ano de 2012, com título 303.
SELECT * FROM empregado WHERE YEAR(dtadmissao) = 2012 AND cdtitulo = 303;


#APENAS PARA TESTAR O EXERCICIO 8#
INSERT INTO empregado VALUES(700, "Pedro Guedes", "Rua Servidão", "1994-05-26", "2012-08-13", 303, 701, 601);