-- Create DB -----------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS WPC ;
CREATE DATABASE WPC;
USE WPC;
-- -----------------------------------------------------------------------------------------------------

-- 41 --------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT(DepartmentName    VARCHAR(35)      NOT NULL,
                        BudgetCode        VARCHAR(30)      NOT NULL,
                        OfficeNumber      VARCHAR(15)      NOT NULL, 
                        Phone             CHAR(12)         NOT NULL,
                        
                        CONSTRAINT	      DepartmentNamePK	PRIMARY KEY(DepartmentName));
-- ------------------------------------------------------------------------------------------------------

-- 42 ------------------------------------------------------------------------------------------------------                      
DROP TABLE IF EXISTS EMPLOYEE;                        
CREATE TABLE EMPLOYEE (EmployeeNumber     INT              NOT NULL     AUTO_INCREMENT,
                       FirstName          VARCHAR(25)      NOT NULL, 
                       LastName           VARCHAR(25)      NOT NULL, 
                       Department         VARCHAR(35)      NOT NULL     DEFAULT  "Human Resources",
                       Phone              CHAR(12)         NUll, 
					   Email              VARCHAR(100)     NOT NULL,
                      CONSTRAINT          EmployeePK       PRIMARY KEY(EmployeeNumber),
                      CONSTRAINT          EmployeeAK1      UNIQUE(Email),
					  CONSTRAINT          DepartmentEmployeeFK     FOREIGN KEY (Department)
                                           REFERENCES DEPARTMENT(DepartmentName)
                                              ON UPDATE CASCADE 
                                              ON DELETE NO ACTION);
-- ----------------------------------------------------------------------------------------------------------

-- 43 -------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS PROJECT;
CREATE TABLE PROJECT (ProjectID           INT               NOT NULL     AUTO_INCREMENT,
					  `Name`              VARCHAR(50)       NOT NULL,
					  Department          VARCHAR(35)       NOT NULL,
					  MaxHours            DECIMAL(8,2)      NOT NULL      DEFAULT 100 ,
					  StartDate           DATE              NULL,
					  EndDate             DATE              NULL,
						 
					  CONSTRAINT    ProjectPK     PRIMARY KEY(ProjectID),
					  CONSTRAINT    DepartmentProjectFK  FOREIGN KEY(Department)
							REFERENCES DEPARTMENT(DepartmentName)
						        ON UPDATE CASCADE 
						        ON DELETE NO ACTION);
 ALTER TABLE PROJECT AUTO_INCREMENT = 1000;
-- --------------------------------------------------------------------------------------------------------------

-- 44 ----------------------------------------------------------------------------------------------------------- 
 DROP TABLE IF EXISTS ASSIGNMENT; 
 CREATE TABLE ASSIGNMENT(ProjectID       INT              NOT NULL,
                         EmployeeNumber  INT              NOT NULL,
						 HoursWorked     DECIMAL(6,2)     NULL,
 
						
						CONSTRAINT ProjectIDEmployeeeNumPK    PRIMARY KEY(ProjectID,EmployeeNumber),
						CONSTRAINT ProjectIDFK                FOREIGN KEY(ProjectID)
                                     REFERENCES PROJECT(ProjectID)
                                      ON DELETE CASCADE
                                      ON UPDATE NO ACTION,
						CONSTRAINT EmployeeNumberFK           FOREIGN KEY(EmployeeNumber)
									 REFERENCES EMPLOYEE(EmployeeNumber)
                                       ON DELETE NO ACTION
                                       ON UPDATE NO ACTION);
-- ------------------------------------------------------------------------------------------------------------------

-- 46 ------------------------------------------------------------------------------------------------------------------
/**
DROP TABLE IF EXISTS ASSIGNMENT; 
 CREATE TABLE ASSIGNMENT(ProjectID       INT              NOT NULL,
                         EmployeeNumber  INT              NOT NULL,
						 HoursWorked     DECIMAL(6,2)     NULL,
 
					
						CONSTRAINT ProjectIDEmployeeeNumPK    PRIMARY KEY(ProjectID,EmployeeNumber),
						CONSTRAINT ProjectIDFK                FOREIGN KEY(ProjectID)
                                     REFERENCES PROJECT(ProjectID)
                                      ON DELETE CASCADE
                                      ON UPDATE NO ACTION,
						CONSTRAINT EmployeeNumberFK           FOREIGN KEY(EmployeeNumber)
									 REFERENCES EMPLOYEE(EmployeeNumber)
                                       ON DELETE NO ACTION
                                       ON UPDATE NO ACTION,
						CONSTRAINT UniqueEmployeeNumber        UNIQUE    (EmployeeNumber)
);

**/
 -- -----------------------------------------------------------------------------------------------------------------------
 
 -- 47 -----------------------------------------------------------------------------------------------------------------------
ALTER TABLE EMPLOYEE ADD AreaCode VARCHAR(30)  NULL ; 
-- ---------------------------------------------------------------------------------------------------------------------------

-- 48 -----------------------------------------------------------------------------------------------------------------------
ALTER TABLE EMPLOYEE DROP AreaCode;
-- ---------------------------------------------------------------------------------------------------------------------------

-- 49 -----------------------------------------------------------------------------------------------------------------------
ALTER TABLE EMPLOYEE ADD CONSTRAINT PhoneAK1 	UNIQUE(Phone);
-- --------------------------------------------------------------------------------------------------------------------------

-- 50 ---------------------------------------------------------------------------------------------------------------------
ALTER TABLE EMPLOYEE DROP KEY PhoneAK1;
-- -----------------------------------------------------------------------------------------------------------------------
 