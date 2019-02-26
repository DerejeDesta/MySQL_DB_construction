-- 67--------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS EmployeePhoneView;
CREATE VIEW EmployeePhoneView AS
      SELECT LastName AS EmployeeLastName,
              LastName AS EmployeeFirstName,
              Phone AS EmployeePhone
      FROM EMPLOYEE;
# test the view
SELECT * FROM wpc.employeephoneview; 
-- -----------------------------------------------------------------------------------------------------------------



-- 68----------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS FinanceEmployeePhoneView;
CREATE VIEW FinanceEmployeePhoneView AS
      SELECT LastName AS EmployeeLastName,
			 LastName AS EmployeeFirstName,
			 Phone AS EmployeePhone
      FROM EMPLOYEE
      WHERE Department = 'Finance';
# test the view
 SELECT * FROM wpc.financeemployeephoneview;    
-- ---------------------------------------------------------------------------------------------------------------------- 
 
 
 
-- 70--------------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS EmployeeProjectAssignmentView;
CREATE VIEW EmployeeProjectAssignmentView AS
      SELECT LastName AS EmployeeLastName,
			 LastName AS EmployeeFirstName,
			 Phone AS EmployeePhone, 
             `Name` As ProjectName
	  FROM EMPLOYEE
      JOIN ASSIGNMENT ON EMPLOYEE.EmployeeNumber = ASSIGNMENT.EmployeeNumber
      JOIN PROJECT ON ASSIGNMENT.ProjectID = PROJECT.ProjectID;
# test the view
SELECT * FROM wpc.EmployeeProjectAssignmentView;
-- -----------------------------------------------------------------------------------------------------------------------



-- 71 ---------------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS DepartmentEmployeeProjectAssignmentView;
CREATE VIEW DepartmentEmployeeProjectAssignmentView AS
      SELECT LastName AS EmployeeLastName,
			 LastName AS EmployeeFirstName,
			 Employee.Phone AS EmployeePhone,
             DepartmentName,
             department.Phone AS DepartmentPhone,
             `Name` As ProjectName
	  FROM EMPLOYEE
      JOIN DEPARTMENT ON EMPLOYEE.Department = DEPARTMENT.DepartmentName
      JOIN PROJECT ON DEPARTMENT.DepartmentName = PROJECT.department;
# test the view
SELECT * FROM wpc.DepartmentEmployeeProjectAssignmentView;
-- -------------------------------------------------------------------------------------------------------------------
