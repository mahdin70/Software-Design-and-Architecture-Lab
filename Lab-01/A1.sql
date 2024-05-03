use kids_shop;

create table customer (
    id int not null auto_increment primary key,
    name varchar(100) not null,
    rating_timestamp timestamp not null
);