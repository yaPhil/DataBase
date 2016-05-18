USE ShopList

CREATE TABLE Member
(
	ID int NOT NULL,
	FirstName nvarchar(MAX) NOT NULL,
	MiddleName nvarchar(MAX) NOT NULL,
	LastName nvarchar(MAX),
	FullName nvarchar(MAX) NOT NULL,
	CONSTRAINT PK_Member PRIMARY KEY(ID)
)

CREATE TABLE Product
(
	ID int NOT NULL,
	Name nvarchar(MAX) NOT NULL,
	Type_t nvarchar(MAX),
	CONSTRAINT PK_Product PRIMARY KEY(ID)
)

CREATE TABLE Shop
(
	ID int NOT NULL,
	Name nvarchar(MAX) NOT NULL,
	Address_t nvarchar(MAX),
	CONSTRAINT PK_Shop PRIMARY KEY(ID)
)

CREATE TABLE ProductCost
(
	ProductID int NOT NULL,
	ShopID int NOT NULL,
	Cost int NOT NULL,
	CONSTRAINT CK_ProductCost_Cost CHECK (Cost >= 1)
)

CREATE TABLE Purchase
(
	ID int NOT NULL,
	MemberID int NOT NULL
	CONSTRAINT PK_Purchase PRIMARY KEY(ID)
)

CREATE TABLE PurchaseItem
(
	PurchaseID int NOT NULL,
	ProductID int NOT NULL,
	ShopID int NOT NULL,
	Count_t int NOT NULL DEFAULT 1,
	PurchaseDate date NOT NULL DEFAULT SYSDATETIME()
)

ALTER TABLE ProductCost ADD CONSTRAINT FK_ProductCost_ProductID
FOREIGN KEY(ProductID) REFERENCES Product(ID)

ALTER TABLE ProductCost ADD CONSTRAINT FK_ProductCost_ShopID
FOREIGN KEY(ShopID) REFERENCES Shop(ID)

ALTER TABLE Purchase ADD CONSTRAINT FK_Purchase_MemberID
FOREIGN KEY(MemberID) REFERENCES Member(ID)

ALTER TABLE PurchaseItem ADD CONSTRAINT FK_PurchaseItem_PurchaseID
FOREIGN KEY(PurchaseID) REFERENCES Purchase(ID)

ALTER TABLE PurchaseItem ADD CONSTRAINT FK_PurchaseItem_ProductID
FOREIGN KEY(ProductID) REFERENCES Product(ID)

ALTER TABLE PurchaseItem ADD CONSTRAINT FK_PurchaseItem_ShopID
FOREIGN KEY(ShopID) REFERENCES Shop(ID)