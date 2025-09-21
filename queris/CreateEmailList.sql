DELIMITER //

CREATE PROCEDURE CreateEmailList (
	INOUT email_list TEXT
)
BEGIN
	DECLARE done BOOL DEFAULT false;
	DECLARE email_address VARCHAR(100) DEFAULT "";
    
	-- declare cursor for employee email
	DECLARE cur CURSOR FOR SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET done = true;
	
    -- open the cursor
	OPEN cur;
	
    SET email_list = '';
	
    process_email: LOOP
		
        FETCH cur INTO email_address;
        
		IF done = true THEN 
			LEAVE process_email;
		END IF;
		
        -- concatenate the email into the emailList
		SET email_list = CONCAT(email_address,";",email_list);
	END LOOP;
    
    -- close the cursor
	CLOSE cur;

END //

DELIMITER ;