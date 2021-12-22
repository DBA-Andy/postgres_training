--Postgres
 \timing
 select prod.name, prod.productnumber, proch.enddate, proch.standardcost, proch.modifieddate
 from production.product prod
   inner join production.productcosthistory proch on proch.productid  = prod.productid
   inner join production.transactionhistory thist on thist.productid  = prod.productid
   inner join production.workorder word on word.productid = prod.productid 
   inner join production.workorderrouting wordr on wordr.workorderid  = word.workorderid
 order by prod.name;

 --Oracle
set lines 200
set pagesize 200
col customer_name format a80
select cust_last_name || ',' || ' ' || cust_first_name as customer_name, cnt.country_name, prod.prod_name
from sh.sales sls
  inner join sh.customers cust on cust.cust_id = sls.cust_id
  inner join sh.countries cnt  on cust.country_id = cnt.country_id
  inner join sh.products prod on prod.prod_id = sls.prod_id
order by customer_name, prod_name;