CREATE TABLE [dbo].[StudentDB]
(
[StudentID] [int] IDENTITY (1,1) NOT NULL ,
[StudentJMBAG] [int] NOT NULL,
[StudentName] [varchar] (100) NOT NULL,
[StudentSurname] [varchar] (100) NOT NULL,
[StudentGender] [varchar] (1) NOT NULL,
[StudentCity] [varchar] (100) NOT NULL,
[StudentDirection] [varchar] (100) NOT NULL,
[YearOfCollage] [int]  NOT NULL CHECK (YearOfCollage BETWEEN 0 AND 3),
CONSTRAINT AK_UnqueJMBAG UNIQUE(StudentJMBAG) ,



 CONSTRAINT [PK_StudedntDB] PRIMARY KEY CLUSTERED 
(
[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


SELECT * FROM dbo.StudentDB

INSERT INTO dbo.StudentDB values('1233456781','Nikolina','Marinić','Ž','Slavonski Brod','Računarstvo','1')



SELECT StudentID,StudentJMBAG,StudentName,StudentSurname,StudentGender,StudentCity,StudentDirection,YearOfCollage
FROM dbo.StudentDB;




GO
SET QUOTED_IDENTIFIER ON
GO

--Stored Procedure to delete records from StudentDB by JMBAG
CREATE PROC [dbo].[GetStudentByID]
@StudentID int
as
SELECT StudentJMBAG,StudentName,StudentSurname,StudentGender,StudentCity,StudentDirection,YearOfCollage from StudentDB  where StudentID=@StudentID;
GO