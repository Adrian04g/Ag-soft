if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'empresas' AND T.COLUMN_NAME = 'email')
  alter table empresas add email nvarchar(200) NOT NULL DEFAULT ('')
   print 'empresas - email'
GO

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'empresas' AND T.COLUMN_NAME = 'passlogin')
  alter table empresas add passlogin nvarchar(200) NOT NULL DEFAULT ('')
   print 'empresas - passlogin'
GO
if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'empresas' AND T.COLUMN_NAME = 'cantusuarios')
  alter table empresas add cantusuarios int NOT NULL DEFAULT (0)
   print 'empresas - cantusuarios'
GO

-- CREACION TABLA PARAMETROS GLOBALSOFTLOGIN

if not exists(select* from INFORMATION_SCHEMA.COLUMNS T where T.TABLE_NAME = 'emp_parametros' )
CREATE TABLE emp_parametros (
    par_id INT PRIMARY KEY IDENTITY (1, 1),
    generallog BIT NOT NULL DEFAULT(0),
    --last_name VARCHAR (50) NOT NULL,
    FOREIGN KEY (par_id) REFERENCES emp_parametros (par_id)
);
GO
IF not exists(Select* from emp_parametros)
   BEGIN
      INSERT INTO emp_parametros(generallog)
      VALUES (0)
	END