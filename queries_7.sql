use construcao;

#Exercicio 1
select e.cdEmpregado, e.nmEmpregado from empregado e
join (select cdEmpregado from cronograma c
 where c.dtIniPrev > '2022-04-01') as c on
 e.cdEmpregado = c.cdEmpregado;
 
#Exercicio 2
select c.cdObra, a.*, c.cdEmpregado, c.dtIniPrev from atividade a
join (select c.cdEmpregado, c.cdObra, c.dtIniPrev, c.cdAtividade from cronograma c
 join (select e.cdEmpregado from empregado e
 where e.nmEmpregado like 'A%')
 as e on c.cdEmpregado = e.cdEmpregado)
 as c on c.cdAtividade = a.cdAtividade;
 
#Exercicio 3
select e.nmEmpregado from empregado e
join (select c.cdEmpregado from cronograma c
 where day(c.dtIniPrev) < 9 ) as c on
 e.cdEmpregado = c.cdEmpregado;

#Exercicio 4
select e.cdEmpregado, e.nmEmpregado, e.dtNascEmp , o.* from orgao o
inner join empregado e on o.cdOrgao = e.cdOrgao
order by o.cdOrgao, e.nmEmpregado limit 2,3;

#Exercicio 5
select dtIniPrev, count(*) from cronograma
where cdObra = 801
group by dtIniPrev;

#Exercicio 6
select f.*, count(*) from fornecedor f
inner join materialfornecedor m on f.cdFornecedor = m.cdFornecedor
group by m.cdFornecedor
having count(*) > 2;