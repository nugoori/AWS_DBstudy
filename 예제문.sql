 # 검색창에 상구라고 검색하면 해당 user에 등록된 모든 주소 조회
 select
	ut.name,
    at.address
from
	user_tb ut
	left outer join address_tb at on(at.user_id = ut.user_id)
where
	name = '상구';
 
 # 상품별 총 판매 수량, 판매 총액
 select
	pt.product_name,
	count(odt.count_number) as total_sell_count,
    sum(odt.count_number * pt.product_price) as total_sell_price
    
    # 안팔린거 표시
from
	product_tb pt
    left outer join order_detail_tb odt on(odt.product_id = pt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
group by
	pt.product_name;
 
 # 카테고리별 등록된 상품이 몇개씩 등록되었는지 조회
 select
	ct.category_name,
    count(pt.category_id) as registerd_product
from
	product_tb pt
    left outer join category_tb ct on(ct.category_id = pt.category_id)
group by
	ct.category_id;
 
 # address_tb sido 컬럼을 참조하여 지역별로 판매된 상품의 총액을 조회
 select
	at.address_sido,
    sum(odt.count_number * pt.product_price) as regional_product_price
from
	address_tb at
    left outer join user_tb ut on(ut.user_id = at.user_id)
    left outer join order_tb ot on(ot.user_id = ut.user_id)
    left outer join order_detail_tb odt on(odt.order_id = ot.order_id)
    left outer join product_tb pt on(pt.product_id = odt.product_id)
group by
	at.address_sido;
    
 
 # 상품명이 나이키가 포함된 제품이 몇개가 판매되었고 판매 총액은 얼마인지
 select
	*
from
	product_tb pt
    left outer join order_detail_tb odt on(odt.product_id = pt.product_id)
    left outer join order_tb ot on(ot.order_id = odt.order_id)
where
	product_name like '%나이키%'
    
