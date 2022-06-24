## Lucas Zick

#1.
SELECT nmEmpregado, deEndEmp
FROM Empregado;

#2.
SELECT CONCAT(nmEmpregado," ",deEndEmp) AS NomeEndereco
FROM empregado;
#ou no sqlite
#SELECT nmEmpregado ' - ' deEndEmp AS NomeEndereco
#FROM Empregado;

#3.
SELECT cdMaterial, cdFornecedor, prMaterial
FROM MaterialFornecedor
WHERE prMaterial <= 20;

#4.
SELECT nmEmpregado, 'Gerente' AS Cargo
FROM empregado
WHERE cdGerente IS NULL;

#5.
SELECT cdCargo AS 'Código do Cargo'
FROM cargoempregado
WHERE dtFim IS NULL;

#6.
SELECT DISTINCT cdEmpregado
FROM cargoempregado
WHERE dtInicio BETWEEN '2001-02-11' AND '2022-01-01';

#7.
SELECT cdEmpregado, nuSalario AS 'Salário Antigo', nuSalario + (nuSalario*0.1) AS 'Salário Novo'
FROM cargoempregado
WHERE dtFim IS NULL;

#8.
SELECT cdObra, cdAtividade, cdEmpregado, dtIniPrev
FROM cronograma
WHERE dtIniPrev > '2022-04-01';

#9.
SELECT *
FROM custoatividade
WHERE cdMaterial != 404; 

#10.
SELECT *
FROM materialfornecedor
WHERE dtCompra NOT BETWEEN '2001-02-11' AND '2022-01-01';

#11.
SELECT DISTINCT cdCargo
FROM cargoempregado;

#12.
SELECT MIN(prMaterial) AS "Menor Preço", MAX(prMaterial) AS "Maior Preço"
FROM materialfornecedor;

#13.
SELECT SUM(nuSalario) AS "Valor Total Salários"
FROM cargoempregado
WHERE dtFim IS NULL;

#14.
SELECT cdObra AS "Código Obra",
csPrevisto AS "Custo Previsto",
cdReal AS "Custo Real",
(csPrevisto - cdReal) AS "Diferença"
FROM custoatividade;

#15.
SELECT dsMaterial AS "Nome Material"
FROM material
WHERE dsMaterial LIKE "P%";

#16.
SELECT dsMaterial AS "Nome Material"
FROM material
WHERE dsMaterial LIKE "__s%o";