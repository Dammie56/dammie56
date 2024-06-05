SET @Even_odd= 7; 
SELECT 
    CASE 
        WHEN @Even_odd % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS Number_Status;
    
    SELECT @Even_odd := (
       SELECT 
    CASE 
        WHEN @Even_odd % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS Number_Status) AS Status;
    
    DELIMITER $$

CREATE FUNCTION Even_Odd(
        num INT
) 
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(20);
    
    IF num % 2 = 0 THEN
        SET result = 'Even';
    ELSE
        SET result = 'Odd';
    END IF;
    
    RETURN result;
END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE Even_Odd(
       num INT
)
BEGIN
    DECLARE result VARCHAR(20);
    
    IF num % 2 = 0 THEN
        SET result = 'Even';
    ELSE
        SET result = 'Odd';
    END IF;
    
    SELECT result AS 'Status';
END$$

DELIMITER ;

DROP FUNCTION IF EXISTS two_numbers;
    DELIMITER $$

CREATE FUNCTION two_numbers(
       num_1 INT, 
       num_2 INT
) 
RETURNS VARCHAR(75)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(75);
    
    IF num_1 > num_2 THEN
       --  SET result = 'First_number is greater than the second_number';
		SET result = CONCAT(num_1, ' is greater than the ', num_2);
    ELSEIF num_1 < num_2 THEN
        SET result = CONCAT(num_2,' is greater than ', num_1);
    ELSE
        SET result = 'Both numbers are eqaul';
    END IF;
    
    RETURN result;
END$$

DELIMITER ;

SET @two_numbers = ;
SELECT 
     CASE 
        WHEN num_1 > num_2 THEN 'First_number is greater than the second_number'
        WHEN num_1 < num_2 THEN 'Second_number is greater than first_number'
        ELSE 'Both numbers are eqaul'
	END AS comparison;
use sql_invoicing;
DROP FUNCTION IF EXISTS Even_odd;

 DELIMITER $$

CREATE FUNCTION Even_Odd(
        num INT
) 
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(20);
    SET even_odd = (SELECT 
    CASE 
        WHEN @Even_odd % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS Number_Status);
    
    RETURN result;
END$$
DELIMITER ;




  DELIMITER $$

CREATE FUNCTION tiri_numbers(
       num_1 INT, 
       num_2 INT,
       num_3 INT
) 
RETURNS VARCHAR(75)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(75);
    
    IF num_1 > num_2 AND num_1 > num_3 THEN
        SET result = 'First_number is greater than the second_number and third_number';
    ELSEIF num_1 < num_2 AND num_2 > num_3 THEN
        SET result = 'Second_number is greater than first_number and the third_number';
	ELSEIF num_3 > num_1 AND num_3 > num_2 THEN
        SET result ='Third_number is greater';
    ELSE
        SET result = 'they are eqaul';
    END IF;
    
    RETURN result;
END$$
