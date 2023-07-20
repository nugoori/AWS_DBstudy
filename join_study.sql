# order_detail_tb + order_tb 

# user_tb에 들어있는 name이 상구인 사람의 구매 총액 조회
select 
	ut.name,
    sum(pt.product_price * odt.count_number) as total_order_price
from 
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
    left outer join user_tb ut on(ut.user_id = ot.user_id)
    left outer join address_tb at on(at.address_id = ot.address_id)
where
	ut.name = '상구'
group by
	ut.name;
    
select 
	*
from 
	order_detail_tb odt
    left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
    left outer join user_tb ut on(ut.user_id = ot.user_id)
    left outer join category_tb ct on(ct.category_id = pt.category_id);
    
# 2023-06-01 ~ 06-07 까지의 카테고리별 판매 수량 / odt.product_id odt.count_number
select 
	ct.category_name,
    sum(odt.count_number) as total_order_stack
from 
	order_detail_tb odt
	left outer join product_tb pt on(pt.product_id = odt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
    left outer join category_tb ct on(ct.category_id = pt.category_id)
where
	ot.order_date between '2023-06-01' and '2023-06-07'
group by
	ct.category_name;

	