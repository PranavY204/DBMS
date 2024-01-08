use bank_204;
create table borrower_204(
	customer_name varchar(20),
    loan_no int, 
    foreign key(customer_name) references bank_customer_204(customer_name),
    foreign key(loan_no) references loans_204(loan_no)
);

insert into branch_204 values ("SBI_MantriMarg", "Delhi", 200000);
insert into bank_account_204 values (12, "SBI_MantriMarg", 2000);
insert into deposits_204 values("Nikhil", 12);

insert into borrower_204 values
	("Avinash", 1),
    ("Dinesh", 2),
    ("Mohan", 3), 
	("Nikhil", 4), 
    ("Ravi", 5);
-- 1
select deposits_204.customer_name, deposits_204.acc_no, branch_204.branch_city from deposits_204, branch_204, bank_account_204 
where branch_204.branch_city = "Delhi"
group by branch_204.branch_city;
-- 2
select customer_name, loans_204.loan_no 
from (borrower_204 right outer join loans_204 
on loans_204.loan_no = borrower_204.loan_no)
where customer_name not in (select customer_name 
from deposits_204, bank_account_204 where deposits_204.acc_no = bank_account_204.acc_no group by customer_name, branch_name);
-- 3
select distinct customer_name from deposits_204 
where customer_name in (select deposits_204.customer_name from branch_204, bank_account_204, deposits_204 
where branch_204.branch_city = "Banglore" and branch_204.branch_name = bank_account_204.branch_name and bank_account_204.acc_no = deposits_204.acc_no)
and customer_name in (select customer_name from borrower_204, loans_204 where branch_name in (select branch_name from branch_204 where branch_city = "Banglore"));
-- 4
select branch_name from branch_204 where assets_in_lks > all(select assets_in_lks from branch_204 where branch_city = "Banglore");
-- 5
delete from bank_account_204 where branch_name in (select branch_name from branch_204 where branch_city = "Bombay");
-- 6
update bank_account_204 set balance = 1.05*balance;
select * from bank_account_204;


