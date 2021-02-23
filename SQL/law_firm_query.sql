USE law_firm;
GO

IF not exists (select * from sysobjects where name='users')
    CREATE TABLE [users](
[id] [int] IDENTITY(1,1) NOT NULL,
[first_name] [nvarchar](50) NOT NULL,
[last_name] [nvarchar](50) NULL,
[email] [nvarchar](50) NOT NULL,
[passcode] [nvarchar](50) NOT NULL,
[gender] [nvarchar] (20) NOT NULL,
[country] [nvarchar](50) NOT NULL,
primary key(id)
);
GO

--select * from sysobjects where name='users' and xtype='U';
--drop table cars;
--drop table users;

IF OBJECT_ID('sp_AddUsers', 'P') IS NOT NULL
    DROP PROCEDURE sp_AddUsers;
GO


CREATE procedure [sp_AddUsers]
(
@first_name nvarchar(50),
@last_name nvarchar(50),
@email nvarchar(50),
@passcode nvarchar(50),
@gender nvarchar (50),
@country nvarchar(50)
)
as begin
Insert into users
(first_name,last_name,email,passcode,gender,country)
values
(@first_name,@last_name,@email,@passcode,@gender,@country);
end
GO


CREATE procedure [get_User]
(
@email nvarchar(50),
@passcode nvarchar(50)
)
as begin
select * from users where email = @email and passcode = @passcode;
end
GO

--drop procedure get_User;



--use master;
--select * from users;
--drop table users;
--drop procedure sp_AddUsers;
--drop procedure get_User;
--select * from sysobjects where name='users';