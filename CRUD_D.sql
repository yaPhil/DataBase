USE ShopList

if object_id(N'deleteMember', N'P') is not NULL
	drop procedure deleteMember;
GO

create procedure deleteMember(@id int) AS
BEGIN
	delete from Member where ID = @id
END
GO
select * from Member where FirstName = 'pet'
exec deleteMember 101
select * from Member where FirstName = 'pet'