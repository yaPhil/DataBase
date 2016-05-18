USE ShopList

if object_id (N'createMember', N'P') is not null
	drop procedure createMember;
GO
create procedure createMember (@FirstName nvarchar(MAX), @MiddleName nvarchar(MAX), @LastName nvarchar(MAX) = NULL)
as
	if (select ID from Member where (FirstName = @FirstName AND MiddleName = @MiddleName AND ISNULL(@LastName, '') = ISNULL(LastName, ''))) is not NULL
		raiserror('Member already exist', 16, 1)
	INSERT into Member (ID, FirstName, MiddleName, LastName, FullName)VALUES 
	((select COUNT(ID) from Member) + 1, @FirstName, @MiddleName, @LastName, dbo.updateFullName(@FirstName, @MiddleName, @LastName))
GO
exec dbo.createMember N'Иван', N'Иванов', N'Иванович'
select *
from Member
where FirstName = N'Иван'