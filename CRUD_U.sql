USE ShopList

if object_id(N'changeName', N'P') is not NULL
	drop procedure changeName;
GO

create procedure changeName(@id int, @FirstName nvarchar(MAX), @MiddleName nvarchar(MAX), @LastName nvarchar(MAX) = NULL) 
	AS BEGIN
	if (select ID from Member where (FirstName = @FirstName AND MiddleName = @MiddleName AND ISNULL(@LastName, '') = ISNULL(LastName, ''))) is not NULL
		raiserror('Member already exist', 16, 1);
	update Member
		set FirstName = @FirstName, MiddleName = @MiddleName, LastName = @LastName, FullName = dbo.updateFullName(@FirstName, @MiddleName, @LastName)
		where ID = @id
	END
GO

execute changeName 101, 'pet', 'petrov', 'petrovich'
select * from Member where FirstName = 'pet'