-- Active: 1683917892325@@127.0.0.1@3306@projfbd

-- ============= CRIANDO TRIGGER =========================

-- DROP TRIGGER TRIGGER_CHECK_UPDATE_EMPREGADO;

DELIMITER $$

CREATE TRIGGER IF NOT EXISTS TRIGGER_CHECK_UPDATE_EMPREGADO
BEFORE UPDATE ON EMPREGADO FOR EACH ROW BEGIN
  IF NEW.idade < 14 THEN SET NEW.idade = OLD.idade;
  END IF;
END;

$$

DELIMITER;

UPDATE EMPREGADO SET idade = 11 WHERE id = 10;