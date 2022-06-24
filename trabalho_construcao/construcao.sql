BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "MaterialFornecedor" (
	"cdMaterial"	INTEGER NOT NULL,
	"cdFornecedor"	INTEGER NOT NULL,
	"dtCompra"	REAL,
	"prMaterial"	NUMERIC,
	FOREIGN KEY("cdMaterial") REFERENCES "Material"("cdMaterial"),
	PRIMARY KEY("cdMaterial","cdFornecedor")
);
CREATE TABLE IF NOT EXISTS "EmpregadoCargo" (
	"cdCargo"	INTEGER NOT NULL,
	"cdEmpregado"	INTEGER NOT NULL,
	"dtInicio"	REAL,
	"dtFim"	REAL,
	"nuSalario"	NUMERIC,
	FOREIGN KEY("cdEmpregado") REFERENCES "Empregado"("cdEmpregado") ON DELETE CASCADE,
	PRIMARY KEY("cdCargo","cdEmpregado"),
	FOREIGN KEY("cdCargo") REFERENCES "Cargo"("cdCargo")
);
CREATE TABLE IF NOT EXISTS "Empregado" (
	"cdEmpregado"	INTEGER NOT NULL,
	"nmEmpregado"	TEXT,
	"deEndEmp"	TEXT,
	"dtNascEmp"	REAL,
	"dtAdmissao"	REAL,
	"cdTitulo"	INTEGER,
	"cdOrgao"	INTEGER,
	"cdGerente"	INTEGER,
	FOREIGN KEY("cdOrgao") REFERENCES "Orgao"("cdOrgao"),
	FOREIGN KEY("cdTitulo") REFERENCES "Titulo"("cdTitulo"),
	PRIMARY KEY("cdEmpregado")
);
CREATE TABLE IF NOT EXISTS "EmpregadoCurso" (
	"cdCurso"	INTEGER NOT NULL,
	"cdEmpregado"	INTEGER NOT NULL,
	"dtInicio"	REAL,
	"dtFim"	REAL,
	PRIMARY KEY("cdCurso","cdEmpregado"),
	FOREIGN KEY("cdCurso") REFERENCES "Curso"("cdCurso"),
	FOREIGN KEY("cdEmpregado") REFERENCES "Empregado"("cdEmpregado") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "CustoAtividade" (
	"cdObra"	INTEGER NOT NULL,
	"cdMaterial"	INTEGER NOT NULL,
	"cdAtividade"	INTEGER NOT NULL,
	"csPrevisto"	NUMERIC,
	"csReal"	NUMERIC,
	PRIMARY KEY("cdObra","cdMaterial","cdAtividade"),
	FOREIGN KEY("cdObra") REFERENCES "Obra"("cdObra"),
	FOREIGN KEY("cdMaterial") REFERENCES "Material"("cdMaterial"),
	FOREIGN KEY("cdAtividade") REFERENCES "Atividade"("cdAtividade")
);
CREATE TABLE IF NOT EXISTS "Cronograma" (
	"cdObra"	INTEGER NOT NULL,
	"cdAtividade"	INTEGER NOT NULL,
	"cdEmpregado"	INTEGER NOT NULL,
	"dtIniPrev"	REAL,
	"dtFimPrev"	REAL,
	"dtIniReal"	REAL,
	"dtFimReal"	REAL,
	FOREIGN KEY("cdObra") REFERENCES "Obra"("cdObra"),
	PRIMARY KEY("cdObra","cdAtividade","cdEmpregado"),
	FOREIGN KEY("cdEmpregado") REFERENCES "Empregado"("cdEmpregado") ON DELETE CASCADE,
	FOREIGN KEY("cdAtividade") REFERENCES "Atividade"("cdAtividade")
);
CREATE TABLE IF NOT EXISTS "Material" (
	"cdMaterial"	INTEGER NOT NULL,
	"dsMaterial"	TEXT,
	PRIMARY KEY("cdMaterial")
);
CREATE TABLE IF NOT EXISTS "Fornecedor" (
	"cdFornecedor"	INTEGER NOT NULL,
	"dsFornecedor"	TEXT,
	PRIMARY KEY("cdFornecedor")
);
CREATE TABLE IF NOT EXISTS "Obra" (
	"cdObra"	INTEGER NOT NULL,
	"dsObra"	TEXT,
	"cdEngenheiro"	INTEGER,
	PRIMARY KEY("cdObra")
);
CREATE TABLE IF NOT EXISTS "Atividade" (
	"cdAtividade"	INTEGER NOT NULL,
	"dsAtividade"	INTEGER,
	PRIMARY KEY("cdAtividade")
);
CREATE TABLE IF NOT EXISTS "Cargo" (
	"cdCargo"	INTEGER NOT NULL,
	"dsCargo"	TEXT,
	PRIMARY KEY("cdCargo")
);
CREATE TABLE IF NOT EXISTS "Orgao" (
	"cdOrgao"	INTEGER NOT NULL,
	"dsOrgao"	TEXT,
	"cdGerente"	INTEGER,
	PRIMARY KEY("cdOrgao")
);
CREATE TABLE IF NOT EXISTS "Curso" (
	"cdCurso"	INTEGER NOT NULL,
	"dsCurso"	TEXT,
	PRIMARY KEY("cdCurso")
);
CREATE TABLE IF NOT EXISTS "Titulo" (
	"cdTitulo"	INTEGER NOT NULL,
	"dsTitulo"	TEXT,
	PRIMARY KEY("cdTitulo")
);
INSERT INTO "MaterialFornecedor" ("cdMaterial","cdFornecedor","dtCompra","prMaterial") VALUES (404,502,'2021/01/21','5,50'),
 (404,503,'2021/03/','5,40'),
 (405,504,'2022/02/12','20,00'),
 (406,504,'2022/02/12','10,00'),
 (407,505,'2022/02/12','200,00'),
 (408,502,'2022/02/12','300,00'),
 (409,503,'2022/02/12','6,00'),
 (410,504,'2022/02/12','50,00'),
 (411,505,'2022/02/12','110,00'),
 (412,505,'2022/02/12','500,00');
INSERT INTO "EmpregadoCargo" ("cdCargo","cdEmpregado","dtInicio","dtFim","nuSalario") VALUES (105,601,'02/03/2000',NULL,12000),
 (102,602,'02/04/2022',NULL,800),
 (102,603,'11/02/2001',NULL,900),
 (102,604,'23/10/2010',NULL,810),
 (102,605,'23/05/2008','21/01/2009',800),
 (103,605,'22/01/2009',NULL,1100),
 (102,607,'03/06/2010','04/04/2022',800),
 (103,607,'05/04/2011','12/12/2022',1100),
 (104,607,'13/12/2021',NULL,2000),
 (102,608,'09/07/2009',NULL,810),
 (103,610,'13/06/2007',NULL,1150),
 (104,611,'17/05/2009',NULL,2000),
 (106,612,'02/03/2000',NULL,12000);
INSERT INTO "Empregado" ("cdEmpregado","nmEmpregado","deEndEmp","dtNascEmp","dtAdmissao","cdTitulo","cdOrgao","cdGerente") VALUES (601,'Artur Rosa','Rua Arara','02/02/1972','02/03/2000',305,701,''),
 (602,'José Fernandes','Rua Uirapurú','30/07/1991','02/04/2011',NULL,701,601),
 (603,'Pedro Fagundes','Rua das Torres','24/06/1985','11/02/2001',NULL,701,601),
 (604,'Henrique Silva','Rua Imaginária','12/12/1992','23/10/2010',NULL,701,601),
 (605,'Antonio Pereira','Rua das Flores','20/06/1976','23/05/2008',NULL,701,601),
 (606,'Joelson Gomes','Rua das Tartarugas','09/11/1956','04/01/2007',NULL,701,601),
 (607,'Patricio Souza','Rua Tuiuti','26/05/1991','03/06/2010',303,701,601),
 (608,'Fernando Borba','Rua das Andorinhas','19/09/1980','09/07/2009',NULL,701,601),
 (609,'Evandro Costa','Rua das Andorinhas','08/08/1988','16/09/2008',NULL,701,601),
 (610,'Maicon Oliveira','SC 301','12/10/1965','13/06/2007',NULL,701,601),
 (611,'Paulo Cruz','Rua Antonio Costa','14/04/1977','17/05/2009',303,701,601),
 (612,'Francieli da Luz','Rua Beija Flor','15/03/1976','02/03/2000',304,701,601);
INSERT INTO "EmpregadoCurso" ("cdCurso","cdEmpregado","dtInicio","dtFim") VALUES (202,602,'04/03/1998','15/12/2008'),
 (202,603,'28/02/1993','29/11/2000'),
 (202,604,'01/03/1999','01/12/2007'),
 (202,605,'04/03/1983','12/12/1990'),
 (203,605,'01/03/1991','20/12/1996'),
 (202,607,'30/01/1998','27/12/2006'),
 (203,607,'01/03/2007','12/12/2010'),
 (202,601,'01/02/1979','21/12/1987'),
 (203,601,'23/02/1988','11/12/1991'),
 (204,601,'15/02/1992','01/12/1996'),
 (206,601,'03/03/1993','14/12/1993'),
 (202,608,'01/02/1987','01/12/1994'),
 (202,610,'31/03/1973','10/12/1980'),
 (203,610,'04/03/1981','23/12/1985'),
 (202,611,'30/01/1984','27/12/1991'),
 (203,611,'01/03/1992','12/12/1996'),
 (204,611,'05/02/1997','03/12/2002'),
 (202,612,'01/02/1983','21/12/1990'),
 (203,612,'23/02/1991','11/12/1994'),
 (205,612,'15/02/1995','01/12/1999'),
 (206,612,'03/03/1993','14/12/1993'),
 (204,607,'05/02/2022',NULL);
INSERT INTO "CustoAtividade" ("cdObra","cdMaterial","cdAtividade","csPrevisto","csReal") VALUES (801,404,1,550,430),
 (801,405,1,5000,6000),
 (801,408,1,1200,1000),
 (801,412,2,2000,'1890,5'),
 (801,405,2,1000,1100),
 (801,408,3,500,800),
 (801,405,3,4000,4500),
 (802,404,1,1550,1400),
 (802,405,1,7000,7500),
 (802,408,1,2000,1800);
INSERT INTO "Cronograma" ("cdObra","cdAtividade","cdEmpregado","dtIniPrev","dtFimPrev","dtIniReal","dtFimReal") VALUES (801,1,602,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,1,603,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,1,604,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,1,605,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,1,607,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,1,601,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (801,2,602,'2022/02/09','2022/02/13','2022/02/10','2022/02/17'),
 (801,2,603,'2022/02/09','2022/02/13','2022/02/10','2022/02/17'),
 (801,2,605,'2022/02/09','2022/02/13','2022/02/10','2022/02/17'),
 (801,2,607,'2022/02/09','2022/02/13','2022/02/10','2022/02/17'),
 (801,3,602,'2022/02/16','2022/02/20','2022/02/18','2022/02/25'),
 (801,3,603,'2022/02/16','2022/02/20','2022/02/18','2022/02/25'),
 (801,3,605,'2022/02/16','2022/02/20','2022/02/18','2022/02/25'),
 (801,3,607,'2022/02/16','2022/02/20','2022/02/18','2022/02/25'),
 (802,1,608,'2022/05/07','2022/05/14',NULL,NULL),
 (802,1,610,'2022/05/07','2022/05/14',NULL,NULL),
 (802,1,611,'2022/05/07','2022/05/14',NULL,NULL),
 (802,1,601,'2022/05/07','2022/05/14',NULL,NULL),
 (801,1,606,'2022/02/02','2022/02/06','2022/02/02','2022/02/09'),
 (802,1,609,'2022/05/07','2022/05/14',NULL,NULL);
INSERT INTO "Material" ("cdMaterial","dsMaterial") VALUES (404,'Prego'),
 (405,'Cimento'),
 (406,'Argamassa'),
 (407,'Tinta'),
 (408,'Madeira'),
 (409,'Pincel'),
 (410,'Piso cerâmico'),
 (411,'Piso madeira'),
 (412,'Tijolo');
INSERT INTO "Fornecedor" ("cdFornecedor","dsFornecedor") VALUES (502,'José Santos'),
 (503,'Marcos Freitas'),
 (504,'Alberta Daltro'),
 (505,'Antonio dos Santos');
INSERT INTO "Obra" ("cdObra","dsObra","cdEngenheiro") VALUES (801,'Construção Casa do Zezinho',601),
 (802,'Construção Mercado Boa Vista',601);
INSERT INTO "Atividade" ("cdAtividade","dsAtividade") VALUES (1,'Fazer fundamento'),
 (2,'Construir parede'),
 (3,'Construir laje
'),
 (4,'Construir telhado'),
 (5,'Colocar telhas'),
 (6,'Rebocar paredes'),
 (7,'Colocar portas'),
 (8,'Colocar janelas'),
 (9,'Pintar obra'),
 (10,'Decorar obra');
INSERT INTO "Cargo" ("cdCargo","dsCargo") VALUES (102,'Auxiliar de serviços gerais'),
 (103,'Pedreiro'),
 (104,'Mestre de obras'),
 (105,'Engenheiro civil'),
 (106,'Arquiteto');
INSERT INTO "Orgao" ("cdOrgao","dsOrgao","cdGerente") VALUES (701,'Construção Civil','');
INSERT INTO "Curso" ("cdCurso","dsCurso") VALUES (202,'Ensino básico'),
 (203,'Ensino médio'),
 (204,'Engenharia civil'),
 (205,'Arquitetura'),
 (206,'Informática básica'),
 (208,'Mecânica'),
 (209,'Mecatrônica');
INSERT INTO "Titulo" ("cdTitulo","dsTitulo") VALUES (302,'Graduado'),
 (303,'Especialista'),
 (304,'Mestre'),
 (305,'Doutor');
CREATE INDEX IF NOT EXISTS "IndexEmpregado" ON "Empregado" (
	"cdOrgao"	ASC
);
UPDATE Orgao
	SET cdGerente = 601
	WHERE cdOrgao = 701;	
UPDATE EmpregadoCurso
	SET dtInicio = "1983/02/12"
	WHERE cdCurso = 202 and cdEmpregado = 612
UPDATE MaterialFornecedor
	SET cdFornecedor = 505
   	WHERE cdMaterial = 406;
DELETE FROM Atividade
	WHERE cdAtividade = 10;
DELETE FROM Empregado
	WHERE deEndEmp = 'Rua das Tartarugas' OR cdEmpregado = 609;
DELETE FROM CursoEmpregado
	WHERE dtFim = Null
COMMIT;
