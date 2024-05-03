use kids_shop;


create table employee (
    id int not null auto_increment primary key,
    name varchar(100) not null
);

create table invoice (
    id int not null auto_increment primary key,
    customer_id int not null,
    seller_id int not null,
    invoice_timestamp timestamp not null,
    foreign key (customer_id) references customer(id),
    foreign key (seller_id) references employee(id)
);

create table sale (
    id int not null auto_increment primary key,
    product_id int not null,
    invoice_id int not null,
    unit_price decimal(10, 2) not null,
    count int not null,
    foreign key (product_id) references product(id),
    foreign key (invoice_id) references invoice(id)
);

