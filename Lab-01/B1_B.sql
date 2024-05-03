use kids_shop;

create procedure get_average_rating(
    in product_id int,
    out avg_rating decimal(3, 2)
)
begin
    select average_rating
    into avg_rating
    from product
    where id = product_id;
end;
