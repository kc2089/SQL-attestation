/*
Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'.
*/

DELIMITER $$
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    SET days = FLOOR(seconds / 86400);
    SET hours = FLOOR((seconds % 86400) / 3600);
    SET minutes = FLOOR((seconds % 3600) / 60);
    SET remaining_seconds = seconds % 60;
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', remaining_seconds, ' seconds');
END $$
DELIMITER ;

SELECT FormatSeconds(123456) AS FormattedTime;

/*
Выведите чётные числа от 1 до 10.
Пример: 2, 4, 6, 8, 10.
*/

DELIMITER $$
CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SELECT i;
        END IF;
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

CALL PrintEvenNumbers();

