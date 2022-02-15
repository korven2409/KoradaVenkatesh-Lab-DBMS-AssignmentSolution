create database E_commerce;
use E_commerce;
create table `Supplier`
(
	`Supp_ID` int primary key auto_increment,
    `Supp_Name` varchar(40),
    `Supp_City` varchar(30),
    `Supp_Phone` varchar(10)
);
create table `Customer`
(
	`Cus_ID` int primary key auto_increment,
    `Cus_Name` varchar(40),
    `Cus_Phone` varchar(10),
    `Cus_City` varchar(30),
    `Cus_Gender` CHAR
);
create table `Category`
(
	`Cat_ID` int primary key auto_increment,
    `Cat_Name` varchar(30)
);
create table `Product`
(
	`Pro_ID` int primary key auto_increment,
    `Pro_Name` varchar(20),
    `Pro_Desc` varchar(40),
    `Cat_ID` int NOT NULL,
	FOREIGN KEY(`Cat_ID`) REFERENCES Category(`Cat_ID`)
);
create table `Product_Details`
(
	`Prod_ID` int primary key auto_increment,
    `Pro_ID` int NOT NULL,
    `Supp_ID` int NOT NULL,
    `Prod_Price` int NOT NULL,
    FOREIGN KEY(`Pro_ID`) REFERENCES Product(`Pro_ID`),
    foreign key(`Supp_ID`) REFERENCES Supplier(`Supp_ID`)
);
create table `Orders`
(
	`Ord_ID` int NOT NULL primary key,
    `Ord_Amount` int NOT NULL,
    `Ord_Date` DATE,
    `Cus_ID` int NOT NULL,
    `Prod_ID` int NOT NULL,
    FOREIGN KEY(`Cus_ID`) REFERENCES Customer(`Cus_ID`),
    FOREIGN KEY(`Prod_ID`) REFERENCES Product_Details(`Prod_ID`)
);
create table `Rating`
(
	`Rat_ID` int primary key auto_increment,
    `Cus_ID` int NOT NULL,
    `Supp_ID` int NOT NULL,
    `Rat_Ratstars` int NOT NULL,
    FOREIGN KEY(`Cus_ID`) REFERENCES Customer(`Cus_ID`),
    foreign key(`Supp_ID`) REFERENCES Supplier(`Supp_ID`)
);
insert into `Supplier`(`Supp_Name`,`Supp_City`,`Supp_Phone`) values("Rajesh Retails", "Delhi", '1234567890');
insert into `Supplier`(`Supp_Name`,`Supp_City`,`Supp_Phone`) values("Appario Ltd.", "Mumbai", '2589631470');
insert into `Supplier`(`Supp_Name`,`Supp_City`,`Supp_Phone`) values("Knome products", "Banglore", '9785462315');
insert into `Supplier`(`Supp_Name`,`Supp_City`,`Supp_Phone`) values("Bansal Retails", "Kochi", '8975463285');
insert into `Supplier`(`Supp_Name`,`Supp_City`,`Supp_Phone`) values("Mittal Ltd.", "Lucknow", '7898456532');
select * from Supplier;
insert into `Customer` values(1,"AAKASH", '9999999999', "DELHI", "M");
insert into `Customer` values(2,"AMAN", '9785463215', "NOIDA", "M");
insert into `Customer` values(3,"NEHA", '9999999999', "MUMBAI", "F");
insert into `Customer` values(4,"MEGHA", '9994562399', "KOLKATA", "F");
insert into `Customer` values(5,"PULKIT", '7895999999', "LUCKNOW", "M");

select * from Customer;
insert into `Category`(`Cat_Name`) values("BOOKS");
insert into `Category`(`Cat_Name`) values("GAMES");
insert into `Category`(`Cat_Name`) values("GROCERIES");
insert into `Category`(`Cat_Name`) values("ELECTRONICS");
insert into `Category`(`Cat_Name`) values("CLOTHES");
select * from Category;

insert into `Product`(`Pro_Name`,`Pro_Desc`,`Cat_ID`) values("GTA V","DFJDJFDJFDJFDJFJF",2);
insert into `Product`(`Pro_Name`,`Pro_Desc`,`Cat_ID`) values("TSHIRT","DFDFJDFJDKFD",5);
insert into `Product`(`Pro_Name`,`Pro_Desc`,`Cat_ID`) values("ROG LAPTOP","DFNTTNTNTERND",4);
insert into `Product`(`Pro_Name`,`Pro_Desc`,`Cat_ID`) values("OATS","REURENTBTOTH",3);
insert into `Product`(`Pro_Name`,`Pro_Desc`,`Cat_ID`) values("HARRY POTTER","NBEMCTHTJTH",1);
select * from Product;

insert into `Product_Details`(`Pro_ID`,`Supp_ID`,`Prod_Price`) values(1,2,1500);
insert into `Product_Details`(`Pro_ID`,`Supp_ID`,`Prod_Price`) values(3,5,30000);
insert into `Product_Details`(`Pro_ID`,`Supp_ID`,`Prod_Price`) values(5,1,3000);
insert into `Product_Details`(`Pro_ID`,`Supp_ID`,`Prod_Price`) values(2,3,2500);
insert into `Product_Details`(`Pro_ID`,`Supp_ID`,`Prod_Price`) values(4,1,1000);
select * from Product_Details;

insert into `Orders`(`Ord_ID`,`Ord_Amount`,`Ord_Date`,`Cus_ID`,`Prod_ID`) values(20,1500,"2021-10-12",3,5);
insert into `Orders`(`Ord_ID`,`Ord_Amount`,`Ord_Date`,`Cus_ID`,`Prod_ID`) values(25,30500,"2021-09-16",5,2); 
insert into `Orders`(`Ord_ID`,`Ord_Amount`,`Ord_Date`,`Cus_ID`,`Prod_ID`) values(26,2000,"2021-10-05",1,1); 
insert into `Orders`(`Ord_ID`,`Ord_Amount`,`Ord_Date`,`Cus_ID`,`Prod_ID`) values(30,3500,"2021-08-16",4,3);
insert into `Orders`(`Ord_ID`,`Ord_Amount`,`Ord_Date`,`Cus_ID`,`Prod_ID`) values(50,2000,"2021-10-06",2,1);
select * from Orders;

insert into `Rating`(`Cus_ID`,`Supp_ID`,`Rat_Ratstars`) values(2,2,4);
insert into `Rating`(`Cus_ID`,`Supp_ID`,`Rat_Ratstars`) values(3,4,3);
insert into `Rating`(`Cus_ID`,`Supp_ID`,`Rat_Ratstars`) values(5,1,5);
insert into `Rating`(`Cus_ID`,`Supp_ID`,`Rat_Ratstars`) values(1,3,2);
insert into `Rating`(`Cus_ID`,`Supp_ID`,`Rat_Ratstars`) values(4,5,4);
select * from Rating;
# Query 3
select `Customer`.Cus_Gender, count(Customer.Cus_Gender) as count from `Customer` inner join `Orders` on `Customer`.Cus_ID = `Orders`.Cus_ID where `Orders`.Ord_Amount >= 3000 group by `Customer`.Cus_Gender;

#Query 4
select `Orders`.*,Product.Pro_Name from `Orders`, Product_Details, Product where `Orders`.Cus_ID = 2 and
`Orders`.Prod_ID = 	Product_Details.Prod_ID and Product_Details.Prod_ID = Product.Pro_ID;

#Query 5
select Supplier.* from Supplier, Product_Details where Supplier.Supp_ID in
(select Product_Details.Supp_ID from Product_Details group by Product_Details.Supp_ID having
count(Product_Details.Supp_ID)>1) group by Supplier.Supp_ID;

#Query 6
select Category.* from `Orders` inner join Product_Details on `Orders`.Prod_ID = Product_Details.Prod_ID
inner join Product on Product.Pro_ID = Product_Details.Pro_ID inner join Category on 
Category.Cat_ID = Product.Cat_ID having min(`Orders`.Ord_Amount);

#Query 7
select Product.Pro_ID, Product.Pro_Name from `Orders` inner join Product_Details on Product_Details.Prod_ID = `Orders`.Prod_ID
inner join Product on Product.Pro_ID = Product_Details.Pro_ID where `Orders`.Ord_Date > 
"2021-10-05";

#Query 8
select Customer.Cus_Name,Customer.Cus_Gender from Customer where Customer.Cus_Name like 'A%'
or Customer.Cus_Name like '%A';

#Query 9
select Supplier.Supp_ID,Supplier.Supp_Name,Rating.Rat_Ratstars,
case
 when Rating.Rat_Ratstars > 4 then 'genuine Supplier'
 when Rating.Rat_Ratstars > 2 then 'average Supplier'
 else 'Supplier should not be considered'
end
as verdict from Rating inner join Supplier on Supplier.Supp_ID  = Rating.Supp_ID;