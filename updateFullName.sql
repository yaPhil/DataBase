USE ShopList

if object_id (N'updateFullName', N'FN') is not null
	drop function updateFullName;
GO
create function updateFullName (@FirstName nvarchar(MAX), @MiddleName nvarchar(MAX), @LastName nvarchar(MAX))
returns nvarchar(MAX) as 
begin 
declare @ret nvarchar(MAX) = CONCAT(@MiddleName, ' ', @FirstName,' ', @LastName)
return @ret
end