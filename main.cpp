#include<iostream>
#include<fstream>
#include<vector>
#include<string>

using std::endl;

std::string genStr()
{
	std::string ans = "";
	int len = 10 + rand() % 10;
	for (int i = 0; i < len; ++i)
	{
		ans += (char)('a' + rand() % 24);
	}
	return ans;
}

int main()
{

	std::ofstream out("insert_script.sql");
	out << "USE ShopList" << endl;
	out << "INSERT Member (ID, FirstName, MiddleName, FullName)VALUES" << endl;
	for (int i = 0; i < 100; ++i)
	{
		out << '(' << i + 1 << ", " << "N'" << genStr() << "', " << "N'" << genStr() << "', " << "N'" << genStr() << "')";
		if (i < 100 - 1)
			out << ',' << endl;
	}
	out << endl;
	out << endl;
	out << "INSERT Product (ID, Name, Type_t)VALUES" << endl;
	for (int i = 0; i < 100; ++i)
	{
		out << '(' << i + 1 << ", " << "N'" << genStr() << "', " << rand() % 20 + 1 << ")";
		if (i < 100 - 1)
			out << ',' << endl;
	}
	out << endl;
	out << endl;
	out << "INSERT Shop (ID, Name, Address_t)VALUES" << endl;
	for (int i = 0; i < 100; ++i)
	{
		out << '(' << i + 1 << ", " << "N'" << genStr() << "', " << "N'" << genStr() << "')";
		if (i < 100 - 1)
			out << ',' << endl;
	}
	out << endl;
	out << endl;
	out << "INSERT ProductCost (ProductID, ShopID, Cost)VALUES" << endl;
	for (int i = 1; i <= 100; ++i)
	{
		for (int j = 1; j <= 100; ++j)
		{
			if(i % 10 == 1 && i > 1 && j == 1)
				out << "INSERT ProductCost (ProductID, ShopID, Cost)VALUES" << endl;
			out << '(' << i << ", " << j << ", " << rand() + 1 << ")";
			if (i % 10 != 0 || j != 100)
				out << ',' << endl;
			else
				out << endl;
		}
	}
	out << endl;
	out << endl;
	out << "INSERT Purchase (ID, MemberID)VALUES" << endl;
	for (int i = 1; i <= 100; ++i)
	{
		out << '(' << i << ", " << i << ")";
		if (i < 100)
			out << ',' << endl;
	}
	out << endl;
	out << endl;
	out << "INSERT PurchaseItem (PurchaseID, ProductID, ShopID)VALUES" << endl;
	int cnt = 0;
	for (int i = 1; i <= 100; ++i)
	{
		int num = rand() % 100 + 1;
		for (int j = 1; j <= num; ++j)
		{
			if (cnt == 1000)
			{
				out << "INSERT PurchaseItem (PurchaseID, ProductID, ShopID)VALUES" << endl;
				cnt = 0;
			}
			out << '(' << i << ", " << rand() % 100 + 1 << ", " << rand() % 100 + 1 << ")";
			++cnt;
			if (cnt < 1000)
				out << ',' << endl;
			else
				out << endl;
		}
	}
	return 0;
}