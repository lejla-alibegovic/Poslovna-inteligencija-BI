create table items(
kljuc_id nvarchar(20) not null constraint PK_kljuc primary key(kljuc_id),
order_id int not null,
item_id int not null,
product_id int not null,
quantity int not null,
list_price decimal(10,2),
discount decimal(4,2)
)

insert into items
select 
kljuc_id=CAST(sales.order_items.order_id as nvarchar(15))+ '-'+CAST(sales.order_items.item_id as nvarchar(15)),
order_id,
item_id,
product_id,
quantity,
list_price,
discount
from sales.order_items


/* CREATING DATA WAREHOUSE*/

create database bikes_DW
use bikes_DW


/*Creating dimensional tables*/

create table dim_products(
productKey int not null constraint PK_products primary key(productKey),
product_id int not null,
product_name varchar(255) not null,
brand_id int not null,
category_id int not null,
model_year smallint not null,
list_price decimal(10,2)
)
create table dim_orders_customers(
orders_customersKey int not null constraint PK_orders_customers primary key(orders_customersKey),
order_id int not null,
customer_id int null,
order_date date not null,
state varchar(25)
)
create table dim_stores_orders(
stores_ordersKey int not null constraint PK_stores_orders primary key(stores_ordersKey),
order_id int not null,
store_id int not null,
store_name varchar(255) not null,
city varchar(255)
)


/*Creating fact table*/
create table fact_items(
factKey int not null constraint PK_fact primary key(factKey),
productKey int not null constraint FK_products foreign key references dim_products(productKey),
orders_customersKey int not null constraint FK_orders_customers foreign key references dim_orders_customers(orders_customersKey),
stores_ordersKey int not null constraint FK_stores_orders foreign key references dim_stores_orders(stores_ordersKey),
quantity int not null,
list_price decimal(10,2),
discount decimal(4,2)
)
