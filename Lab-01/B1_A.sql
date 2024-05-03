use kids_shop;

-- B1.a
alter table category
add column average_rating decimal(3, 2) default 0.00,
add column total_sale int default 0;

alter table product
add column average_rating decimal(3, 2) default 0.00,
add column sale_count int default 0;


drop table sale;
create table sale (
    id int not null auto_increment primary key,
    product_id int not null,
    invoice_id int not null,
    employee_id int not null,
    customer_id int not null,
    category_id int not null,
    unit_price decimal(10, 2) not null,
    count int not null,
    total_price decimal(10, 2) as (unit_price * count) stored,
    sale_timestamp datetime not null,
    foreign key (product_id) references product(id),
    foreign key (invoice_id) references invoice(id),
    foreign key (employee_id) references employee(id),
    foreign key (customer_id) references customer(id),
    foreign key (category_id) references category(id)
);

alter table invoice
add column total_price decimal(10, 2) not null;

