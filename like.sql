# like + % , _ : 문자열에만 숫자는 크기비교! join할 때도 사용가능

select
	product_name,
	product_price
from
	product_tb
where
	-- product_name in('NO.4 TEE', 'PROPERTY OF TEE');
    product_name like 'NO%' or
    product_name like 'PROPERTY%';