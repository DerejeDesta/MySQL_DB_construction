-- 84-----------------------------------------------------------------------------------------------------
DELIMITER // 
CREATE FUNCTION LastNameFirst
(	
varFirstName	VARCHAR(35),    
varLastName	VARCHAR(35)    
)
RETURNS Varchar(70) DETERMINISTIC
BEGIN	    
DECLARE varFullName VARCHAR(70);       
SET varFullName = CONCAT(varLastName,', ',varLastName );          
RETURN varFullName;
END
//
DELIMITER ;
-- ----------------------------------------------------------------------------------------------------------


-- 85-------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS EmployeeDepartmentDataView;
CREATE VIEW EmployeeDepartmentDataView AS
      SELECT LastNameFirst(Employee.FirstName, Employee.LastName) AS EmployeeName,
             EMPLOYEE.Department,
             DEPARTMENT.OfficeNumber,
             DEPARTMENT.Phone AS DepatmentPhone,
             EMPLOYEE.Phone AS EmployeePhone
      FROM EMPLOYEE
      JOIN DEPARTMENT ON EMPLOYEE.Department = DEPARTMENT.DepartmentName ;
# test the view
SELECT * FROM wpc.EmployeeDepartmentDataView; 
-- --------------------------------------------------------------------------------------------------------



-- 45 -----------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER ValidateDates
BEFORE INSERT ON PROJECT
FOR EACH ROW
BEGIN
  IF (NEW.EndDate < NEW.StartDate) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'EndDate must be a date later than StartDate';
  END IF;
END;
//DELIMITER ;

# Insert Query to check 
INSERT INTO PROJECT VALUES(1000,'2017 Q3 Product Plan', 'Accounting', 155.00, '2017-06-10', '2014-01-01');
-- -----------------------------------------------------------------------------------------------------------

