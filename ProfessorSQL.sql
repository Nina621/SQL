CREATE TABLE [dbo].[ProfessorDB]
(
[ProfessorID] [int] IDENTITY (1,1) NOT NULL,
[ProfessorName] [varchar] (100) NOT NULL,
[ProfessorSurname] [varchar] (100) NOT NULL,
[ProfessorSubject] [varchar] (100) NOT NULL,
[Date_Time] [date] NOT NULL,
CONSTRAINT UQ_Date UNIQUE (Date_Time),
 CONSTRAINT [PK_ProfessorDB] PRIMARY KEY CLUSTERED 
(
[ProfessorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


select * from dbo.ProfessorDB


INSERT INTO dbo.ProfessorDB VALUES ('Krunoslav','Husak','C#','2020-01-12')
INSERT INTO dbo.ProfessorDB VALUES ('Dario','Vidić','IT','2020-09-15')



 SELECT ProfessorID,ProfessorName,ProfessorSurname,ProfessorSubject,convert(varchar(10),Date_Time,120) as Date_Time

 FROM dbo.ProfessorDB



GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to update record into ProfessorDB table by ID
CREATE PROC [dbo].[UpdateProfessor]
@ProfessorID int  ,
@ProfessorName varchar ,
@ProfessorSurname varchar,
@ProfessorSubject varchar ,
@Date_Time date
AS
UPDATE ProfessorDB SET ProfessorName=@ProfessorName,ProfessorSurname=@ProfessorSurname,ProfessorSubject = @ProfessorSubject,Date_Time=@Date_Time 
WHERE ProfessorID=@ProfessorID;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Stored Procedure to Insert record into ProfessorDB table
CREATE PROC [dbo].[InsertProfessor]
@ProfessorName varchar ,
@ProfessorSurname varchar,
@ProfessorSubject varchar ,
@Date_Time date
AS
INSERT INTO ProfessorDB (ProfessorName,ProfessorSurname,ProfessorSubject,Date_Time) values(@ProfessorName,@ProfessorSurname,@ProfessorSubject,@Date_Time) ;
GO

--Stored Procedure to get all records from ProfessorDB table
CREATE PROC [dbo].[GetProfessor]
AS
SELECT ProfessorName,ProfessorSurname,ProfessorSubject,Date_Time FROM ProfessorDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Stored Procedure to delete records from ProfessorDB table by ID
CREATE PROC [dbo].[DeleteProfessor]
@ProfessorID int
AS
DELETE FROM ProfessorDB  WHERE ProfessorID=@ProfessorID;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetProfessorByID]
@ProfessorID int
as
Select ProfessorName,ProfessorSurname,ProfessorSubject,Date_Time from ProfessorDB where ProfessorID=@ProfessorID;
GO