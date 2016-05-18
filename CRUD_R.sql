USE ShopList

if object_id (N'returnMember', N'IF') is not null
	drop function returnMember;
GO
create function returnMember(@ID int) 
returns table as return (
	SELECT * 
	FROM Member
	WHERE (@ID IS NULL) OR ID = @ID
	)
GO
select * from returnMember(101)