create database Bank;
use Bank;

create table Customers(
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null,
    gender char(1),
    date_of_birth date,
    phone_number varchar(15),
    email varchar(100),
    address varchar(150),
    city varchar(50),
    state varchar(50),
    pincode int,
    join_date date,
    check(gender in('M','F','O'))
);

create table Branches(
	branch_id int auto_increment primary key,
    branch_name varchar(50),
    branch_city varchar(50),
    branch_manager varchar(50),
    contact_number varchar(15)
);

create table Accounts(
	account_id bigint auto_increment primary key,
    balance decimal(12,2),
    account_type varchar(20),
    open_date date,
    account_status varchar(20),
    customer_id int,
    branch_id int,
    
    foreign key(customer_id)
    references Customers(customer_id),
    
    foreign key(branch_id)
    references Branches(branch_id)
);

create table Transactions(
	transaction_id int auto_increment primary key,
    transaction_type varchar(20),
    amount decimal(12,2),
    transaction_date date,
    transaction_mode varchar(20),
    receiver_account bigint,
    transaction_status varchar(20),
    account_id bigint,
    
    foreign key(account_id)
    references Accounts(account_id)
);

create table Loans(
	loan_id int auto_increment primary key,
    loan_type varchar(30),
    loan_amount decimal(12,2),
    interest_rate decimal(5,2),
    loan_start_date date,
    loan_end_date date,
    loan_status varchar(20),
    monthly_emi decimal(12,2),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Employees(
	employee_id int auto_increment primary key,
    employee_name varchar(50),
    designation varchar(30),
    salary decimal(12,2),
    hire_date date,
    phone_number varchar(15),
    branch_id int,
    
    foreign key(branch_id)
    references Branches(branch_id)
);

create table Credit_Cards(
	card_id int auto_increment primary key,
    card_type varchar(20),
    card_number varchar(25),
    expiry_date date,
    card_limit decimal(12,2),
    card_status varchar(20),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table ATM_Transactions(
	atm_transaction_id int auto_increment primary key,
    atm_location varchar(100),
    transaction_type varchar(20),
    amount decimal(12,2),
    transaction_date date,
    account_id bigint,
    
    foreign key(account_id)
    references Accounts(account_id)
);

create table Payments(
	payment_id int auto_increment primary key,
    payment_type varchar(30),
    payment_amount decimal(12,2),
    payment_date date,
    payment_status varchar(20),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Login_History(
	login_id int auto_increment primary key,
    login_time datetime,
    logout_time datetime,
    ip_address varchar(45),
    device_type varchar(30),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Beneficiaries(
	beneficiary_id int auto_increment primary key,
    beneficiary_name varchar(50),
    beneficiary_account bigint,
    bank_name varchar(50),
    ifsc_code varchar(20),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Fixed_Deposits(
	fd_id int auto_increment primary key,
    deposit_amount decimal(12,2),
    interest_rate decimal(5,2),
    start_date date,
    maturity_date date,
    fd_status varchar(20),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Insurance_Policies(
	policy_id int auto_increment primary key,
    policy_type varchar(30),
    premium_amount decimal(12,2),
    start_date date,
    end_date date,
    policy_status varchar(20),
    customer_id int,
    
    foreign key(customer_id)
    references Customers(customer_id)
);

create table Fraud_Alerts(
	alert_id int auto_increment primary key,
    alert_type varchar(50),
    alert_date date,
    risk_level varchar(20),
    alert_status varchar(20),
    transaction_id int,
    
    foreign key(transaction_id)
    references Transactions(transaction_id)
);

create table Customer_Feedback(
	feedback_id int auto_increment primary key,
    rating tinyint,
    feedback_text varchar(500),
    feedback_date date,
    customer_id int,
    branch_id int,
    
    foreign key(customer_id)
    references Customers(customer_id),
    
    foreign key(branch_id)
    references Branches(branch_id)
);

insert into Customers (customer_name,gender,date_of_birth,phone_number,email,address,city,state,pincode,join_date)
values ('Rahul','M','2003-05-10','9876543210','rahul@gmail.com','KPHB','Hyderabad','Telangana',500072,curdate()),
	   ('Anjali','F','2002-08-15','9123456789','anjali@gmail.com','Hanamkonda','Warangal','Telangana',506001,curdate()),
	   ('Kiran','M','2001-12-20','9988776655','kiran@gmail.com','Jyothinagar','Karimnagar','Telangana',505001,curdate());

insert into Branches (branch_name,branch_city,branch_manager,contact_number) values
('SBI Main Branch','Hyderabad','Ramesh','9876543210'),
('HDFC Central','Warangal','Suresh','9123456780'),
('ICICI Finance','Karimnagar','Mahesh','9988776655');

insert into Accounts (balance,account_type,open_date,account_status,customer_id,branch_id) values
(50000,'Savings','2025-01-10','Active',1,1),
(75000,'Current','2025-02-15','Active',2,2),
(30000,'Savings','2025-03-01','Active',3,3);

insert into Transactions (transaction_type,amount,transaction_date,transaction_mode,
receiver_account,transaction_status,account_id) values
('Deposit',10000,'2026-05-01','UPI',10002,'Success',1),
('Withdrawal',5000,'2026-05-03','ATM',10003,'Success',2),
('Transfer',7000,'2026-05-04','Net Banking',10001,'Success',3);

insert into Loans (loan_type,loan_amount,interest_rate,loan_start_date,loan_end_date,loan_status,monthly_emi,customer_id)
values ('Home Loan',500000,8.5,'2025-01-01','2030-01-01','Active',12000,1),
('Education Loan',200000,7.2,'2025-03-01','2029-03-01','Active',5000,2);

insert into Employees (employee_name,designation,salary,hire_date,phone_number,branch_id)
values ('Ravi Kumar','Manager',75000,'2020-05-10','9876501234',1),
('Sowmya','Cashier',35000,'2021-08-15','9123409876',2),
('Mahesh Babu','Clerk',30000,'2022-02-20','9988771122',3);

insert into Credit_Cards (card_type,card_number,expiry_date,card_limit,card_status,customer_id)
values ('Visa','4567123412341111','2028-05-01',100000,'Active',1),
('MasterCard','5678234523452222','2027-09-01',75000,'Active',2),
('Visa','6789345634563333','2029-01-01',50000,'Blocked',3);

insert into ATM_Transactions (atm_location,transaction_type,amount,transaction_date,account_id)
values ('Hyderabad','Withdrawal',5000,'2026-05-02',1),
('Warangal','Balance Check',0,'2026-05-03',2),
('Karimnagar','Deposit',10000,'2026-05-04',3);

insert into Payments (payment_type,payment_amount,payment_date,payment_status,customer_id)
values ('Electricity Bill',2500,'2026-05-01','Paid',1),
('Mobile Recharge',399,'2026-05-02','Paid',2),
('Water Bill',1200,'2026-05-03','Pending',3);

insert into Login_History (login_time,logout_time,ip_address,device_type,customer_id)
values ('2026-05-01 09:00:00','2026-05-01 09:30:00','192.168.1.1','Mobile',1),
('2026-05-02 10:15:00','2026-05-02 10:45:00','192.168.1.2','Laptop',2),
('2026-05-03 08:20:00','2026-05-03 08:40:00','192.168.1.3','Tablet',3);

insert into Beneficiaries (beneficiary_name,beneficiary_account,bank_name,ifsc_code,customer_id)
values ('Ajay',200011,'SBI','SBIN0001234',1),
('Deepika',200022,'HDFC','HDFC0005678',2),
('Varun',200033,'ICICI','ICIC0003456',3);

insert into Fixed_Deposits (deposit_amount,interest_rate,start_date,maturity_date,fd_status,customer_id)
values (100000,6.5,'2025-01-01','2027-01-01','Active',1),
(200000,7.0,'2025-03-01','2028-03-01','Active',2),
(150000,6.8,'2025-05-01','2027-05-01','Closed',3);

insert into Insurance_Policies (policy_type,premium_amount,start_date,end_date,policy_status,customer_id)
values ('Health Insurance',15000,'2025-01-01','2026-01-01','Active',1),
('Life Insurance',25000,'2025-02-01','2035-02-01','Active',2),
('Vehicle Insurance',12000,'2025-03-01','2026-03-01','Expired',3);

insert into Fraud_Alerts (alert_type,alert_date,risk_level,alert_status,transaction_id)
values ('Large Transaction','2026-05-01','High','Investigating',1),
('Multiple Failed Attempts','2026-05-02','Medium','Resolved',2),
('Suspicious Login','2026-05-03','High','Pending',3);

insert into Customer_Feedback (rating,feedback_text,feedback_date,customer_id,branch_id)
values (5,'Excellent banking service','2026-05-01',1,1),
(4,'Good customer support','2026-05-02',2,2),
(3,'Average experience','2026-05-03',3,3);

select * from Customers;

select * from Accounts;

select * from Accounts where account_type='Savings';

select * from Accounts where account_status='Active';

select sum(balance) as Total_Balance from Accounts;

select avg(balance) as Average_Balance from Accounts;

select max(balance) as Highest_Balance from Accounts;

select count(*) as Total_Customers from Customers;

select c.customer_name, a.account_type, a.balance from Customers c join Accounts a on c.customer_id=a.customer_id;

select c.customer_name, l.loan_type, l.loan_amount from Customers c join Loans l on c.customer_id=l.customer_id;

select b.branch_name, a.account_type, a.balance from Branches b join Accounts a on b.branch_id=a.branch_id;

select branch_id, sum(balance) as Total_Balance from Accounts group by branch_id;

select account_type, count(*) as Total_Accounts from Accounts group by account_type;

select * from Accounts where balance > (select avg(balance) from Accounts);

select c.customer_name,a.balance,rank() over(order by balance desc) as Ranking from Customers c join Accounts a
on c.customer_id=a.customer_id;

select transaction_date,amount,sum(amount) over(order by transaction_date) as Running_Total from Transactions;

select c.customer_name,a.balance from Customers c join Accounts a
on c.customer_id=a.customer_id order by balance desc limit 1;

select * from Transactions where amount > 50000;

select month(transaction_date) as Month_No,sum(amount) as Total_Transactions from Transactions
group by month(transaction_date);

create view High_Balance_Customers as
select c.customer_name,a.balance from Customers c join Accounts a on c.customer_id=a.customer_id
where balance>50000;

select * from High_Balance_Customers;

create view Active_Loans as
select c.customer_name,l.loan_type,l.loan_amount
from Customers c join Loans l on c.customer_id=l.customer_id where loan_status='Active';

select * from Active_Loans;

select c.customer_name,sum(a.balance) as Total_Balance
from Customers c join Accounts a
on c.customer_id=a.customer_id group by c.customer_name having sum(a.balance)>40000;

select transaction_type,sum(amount) as Total_Amount
from Transactions group by transaction_type;

select account_type,avg(balance) as Average_Balance
from Accounts group by account_type;

select customer_id,count(*) as Total_Transactions
from Transactions t join Accounts a on t.account_id=a.account_id group by customer_id;

select c.customer_name,a.balance, dense_rank() over(order by balance desc) as Dense_Ranks
from Customers c join Accounts a on c.customer_id=a.customer_id;

select customer_name,
row_number() over(order by customer_name) as Row_Num
from Customers;

select transaction_date,amount,
lag(amount) over(order by transaction_date) as Previous_Transaction
from Transactions;

select transaction_date,amount,
lead(amount) over(order by transaction_date) as Next_Transaction
from Transactions;

with Loan_Details as
(
select c.customer_name,l.loan_amount
from Customers c
join Loans l
on c.customer_id=l.customer_id
)
select * from Loan_Details;

select customer_name,city
from Customers
where city in('Hyderabad','Warangal');

select customer_name,balance
from Customers c
join Accounts a
on c.customer_id=a.customer_id
where balance between 30000 and 80000;

select customer_name
from Customers
where customer_name like 'R%';

select transaction_status,count(*) as Total_Status
from Transactions
group by transaction_status;

select branch_id,
min(balance) as Minimum_Balance,
max(balance) as Maximum_Balance
from Accounts
group by branch_id;

select c.customer_name,a.account_type,a.balance
from Customers c
left join Accounts a
on c.customer_id=a.customer_id;

select c.customer_name,l.loan_type
from Customers c
right join Loans l
on c.customer_id=l.customer_id;