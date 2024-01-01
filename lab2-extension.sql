use insurance_204;
select * from car_204 order by year asc;
select model, count(model) from participated_204, car_204 where participated_204.reg_no = car_204.reg_no group by model;
select avg(damage_amt) as average from participated_204;
delete from participated_204 where damage_amt < (select * from (select avg(damage_amt) from participated_204) as average);
select name from person_204, participated_204 where person_204.driver_id = participated_204.driver_id and participated_204.damage_amt > (select avg(damage_amt) from participated_204);
select max(damage_amt) from participated_204;
