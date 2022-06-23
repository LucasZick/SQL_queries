#ALUNO: LUCAS ZICK

# 1 - Implemente um gatilho que grava em uma tabela de auditoria(#&cdEmpregado, #dtAuditoria,
# nuSalarioNovo, deMsg) todas as vezes que existir um registro de empregado com salário > 10000.
# Para o campo deMsg gravar “Salário suspeito.”


CREATE TABLE auditoria (
	cdEmpregado INTEGER,
    dtAuditoria DATE,
    nuSalarioNovo DECIMAL,
    deMsg TEXT,
    PRIMARY KEY(cdEmpregado, dtAuditoria),
    FOREIGN KEY(cdEmpregado) REFERENCES empregado(cdEmpregado)
);


delimiter //
CREATE TRIGGER salario_suspeito AFTER UPDATE
ON cargoempregado
FOR EACH ROW
IF (NEW.nuSalario > 10000.00) THEN 
	INSERT INTO auditoria
    VALUES (NEW.cdEmpregado, DATE(NOW()), NEW.nuSalario, "SALÁRIO SUSPEITO");
ELSE INSERT INTO auditoria
    VALUES (NEW.cdEmpregado, DATE(NOW()), NEW.nuSalario, "ALTERAÇÃO NORMAL");
END IF;
// delimiter ;


UPDATE cargoempregado 
SET nuSalario = 20000
WHERE cdEmpregado = 603;


UPDATE cargoempregado 
SET nuSalario = 1500
WHERE cdEmpregado = 602;

SELECT * FROM auditoria;


# 2 - Implementar um gatilho onde o salário do empregado nunca possa ser reduzido.

delimiter //
CREATE TRIGGER salariocrescente BEFORE UPDATE
ON cargoempregado
FOR EACH ROW
IF (NEW.nuSalario < OLD.nuSalario) THEN 
	SIGNAL SQLSTATE '50004' SET MESSAGE_TEXT = 'O SALÁRIO NÃO DEVE SER REDUZIDO';
END IF;
// delimiter ;

UPDATE cargoempregado
SET nuSalario = 100
WHERE cdEmpregado = 603;