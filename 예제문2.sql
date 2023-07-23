# 각 계정별로 어떤 기부를 했는지 조회
select
	gt.giver_id,
    #
    gt.user_id,
    ut.name,
    gpt.giving_page_id,
    gpt.story_title,
    # 이건 필요 없는듯
	-- if(gpt.giving_name = 'test', '', gpt.giving_name) as donation_to,
    gt.giving_total
from
	giver_tb gt
	left outer join user_tb ut on(ut.user_id = gt.user_id) # 좀 더 자세하게
	left outer join giving_page_tb gpt on(gpt.giving_page_id = gt.giving_page_id)
-- group by 그룹으로 묶는게 아니야
	
order by
    gt.giver_id;

# 센터별로 총 기부액이 얼마인지
select
	# 조회할 때 pk도 같이 띄워주는게 좋은가?
	if(ct.center_name = 'test', '', ct.center_name),
    # 주소 도 함께 보면 좋을 듯
    ct.center_address,
    ifnull(sum(gt.giving_total * gpt.giving_page_id), 0) as total_donation
from
	center_tb ct
    left outer join giving_page_tb gpt on(gpt.center_id = ct.center_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
group by
	ct.center_name,
    ct.center_address;
    

# 기부 항목별 총 기부액 조회 > page_id
select
	gpt.giving_name,
    gpt.category_id,
    ifnull(sum(gt.giving_total ), 0) as giving_name_total_donation # * gpt.giving_page_id 이거 왜함?
from
	giving_page_tb gpt
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
group by
	gpt.giving_name,
	gpt.category_id;


# 카테고리 별 총 기부액
select
    gct.giving_category_name,
    ifnull(sum(gt.giving_total), 0) as category_total_donation # gpt.category_id * 이거 왜 했니
from
	giving_category_tb gct
    left outer join giving_page_tb gpt on(gpt.category_id = gct.giving_category_id)
    left outer join giver_tb gt on(gt.giving_page_id = gpt.giving_page_id)
group by
	gct.giving_category_name;
