show databases;

use company;

show tables;

select * from dependent;
select * from dept_locations;

select * from employee;
select @@autocommit;
-- Desabilitando o autocommit

SET @@autocommit = 0;

START TRANSACTION;
	SELECT @Dnumber:= max(Dnumber) + 1 
    FROM dept_locations;
    
    select @Dnumber as Number ;
    
DELIMITER //

create procedure consulta_um()
	begin
		declare exit handler for sqlexception
		begin
		rollback;
        select 'A transação foi encerrada por erro ocorrido' as warning;
        end;
        
        start transaction;
        
        select 
			@nextDnumber := max(Dnumber) + 1 as  Next_number
            from dept_locations;
            
            INSERT INTO dept_locations values (nextDnumber, almoxarifado);
end//
            
        
    
    
    
    
    
