-- general purpose CSV format
select ts,sum(load_mw) as load_mw,sum(load_mvar) as load_mvar
from
(
select zs_name,case when extract('minutes' from ts) in (15,45) then ts-interval '15 minutes' else ts end
,avg(load_mw::numeric) as load_mw,avg(load_mvar::numeric) as load_mvar
from zone_substation_load
where distributor='Citipower'
group by zs_name,case when extract('minutes' from ts) in (15,45) then ts-interval '15 minutes' else ts end
union
select zs_name,ts,load_mw::numeric as load_mw,load_mvar::numeric as load_mvar
from zone_substation_load
where distributor='Jemena'
) t
where ts::date>=to_date('20140101','YYYYMMDD') and ts::date<=to_date('20140630','YYYYMMDD')
group by ts
order by ts;


-- empower.me format query
select ts::date-to_date('20100101','YYYYMMDD')+1 as day,
case extract('hour' from ts)||':'||extract('minute' from ts) 
when '0:0' then 1 when '0:30' then 2 when '1:0' then 3 when '1:30' then 4 when '2:0' then 5 when '2:30' then 6 when '3:0' then 7 when '3:30' then 8
when '4:0' then 9 when '4:30' then 10 when '5:0' then 11 when '5:30' then 12 when '6:0' then 13 when '6:30' then 14 when '7:0' then 15 when '7:30' then 16
when '8:0' then 17 when '8:30' then 18 when '9:0' then 19 when '9:30' then 20 when '10:0' then 21 when '10:30' then 22 when '11:0' then 23 when '11:30' then 24
when '12:0' then 25 when '12:30' then 26 when '13:0' then 27 when '13:30' then 28 when '14:0' then 29 when '14:30' then 30 when '15:0' then 31 when '15:30' then 32
when '16:0' then 33 when '16:30' then 34 when '17:0' then 35 when '17:30' then 36 when '18:0' then 37 when '18:30' then 38 when '19:0' then 39 when '19:30' then 40
when '20:0' then 41 when '20:30' then 42 when '21:0' then 43 when '21:30' then 44 when '22:0' then 45 when '22:30' then 46 when '23:0' then 47 when '23:30' then 48
else 99 end as prd,
round(sum(load_mw),3) as load_mw
from
(
select zs_name,case when extract('minutes' from ts) in (15,45) then ts-interval '15 minutes' else ts end
,avg(load_mw::numeric) as load_mw
from zone_substation_load
where distributor='Citipower'
group by zs_name,case when extract('minutes' from ts) in (15,45) then ts-interval '15 minutes' else ts end
union
select zs_name,ts,load_mw::numeric as load_mw
from zone_substation_load
where distributor='Jemena'
) t
where ts::date>=to_date('20140101','YYYYMMDD') and ts::date<=to_date('20140630','YYYYMMDD')
group by ts
order by 1,2;

