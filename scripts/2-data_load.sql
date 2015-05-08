truncate table zone_substation_load;

copy zone_substation_load (date_time,load_mw,load_mvar)
from '/home/herve/Workspace/DistributionNetwork/BTS66/data/Citipower/C_2014.csv' CSV HEADER DELIMITER ',';

update zone_substation_load set zs_name='C' where zs_name is null;

copy zone_substation_load (date_time,load_mw,load_mvar)
from '/home/herve/Workspace/DistributionNetwork/BTS66/data/Citipower/BK_2014.csv' CSV HEADER DELIMITER ',';

update zone_substation_load set zs_name='BK' where zs_name is null;

copy zone_substation_load (date_time,load_mw,load_mvar)
from '/home/herve/Workspace/DistributionNetwork/BTS66/data/Citipower/F_2014.csv' CSV HEADER DELIMITER ',';

update zone_substation_load set zs_name='F' where zs_name is null;


update zone_substation_load set distributor='Citipower' where distributor is null;
update zone_substation_load set ts=to_timestamp(date_time, 'DD/MM/YYYY HH24:MI')-interval '15 minutes' where ts is null;


copy zone_substation_load (date_time,load_mw,load_mvar)
from '/home/herve/Workspace/DistributionNetwork/BTS66/data/Jemena/FF-2013_2014.csv' CSV HEADER DELIMITER ',';

update zone_substation_load set zs_name='FF' where zs_name is null;

copy zone_substation_load (date_time,load_mw,load_mvar)
from '/home/herve/Workspace/DistributionNetwork/BTS66/data/Jemena/NS-2013_2014.csv' CSV HEADER DELIMITER ',';

update zone_substation_load set zs_name='NS' where zs_name is null;

update zone_substation_load set distributor='Jemena' where distributor is null;
update zone_substation_load set ts=to_timestamp(date_time, 'DD-Mon-YY HH24:MI:SS') where ts is null;
