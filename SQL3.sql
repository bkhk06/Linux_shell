SELECT a.tablespace_name,
a.bytes total,
b.bytes used,
c.bytes free,
(b.bytes * 100) / a.bytes "% USED ",
(c.bytes * 100) / a.bytes "% FREE "
FROM sys.sm$ts_avail a, sys.sm$ts_used b, sys.sm$ts_free c
WHERE a.tablespace_name = b.tablespace_name
AND a.tablespace_name = c.tablespace_name;


select count(*) from v$session;

select  b.MACHINE, b.PROGRAM, b.USERNAME, count(*) from v$process a, v$session b 
where a.ADDR = b.PADDR and  b.USERNAME is not null   
group by  b.MACHINE, b.PROGRAM, b.USERNAME 
order by count(*) desc



select x.MACHINE, x.TERMINAL, x.PROGRAM
  from v$session x;

select COUNT(*), MACHINE from v$session GROUP BY MACHINE ;
select * from v$session;


select AP1_EN,AP2_EN,ROUTESTRING from ENV_CITYPAIRROUTE where AP1_EN='ZUUU' and AP2_EN='ZSSS';



select max(eobt) maxupdatetime,count(*) count 
from atfmsw.flight_coordination fc where position is not null and fc.depap = 'ZUGY'


select FLIGHTID,DEPAP,ARRAP,SOBT,COBT,CTD from ATFMSW.FLIGHT_COORDINATION where FLIGHTID='QDA6055'

select * from RWGAP_INFO_ARCHIVE where GENERATETIME between '2019070500' and '201907152359'

select * from user_tab_partitions where table_name ='FME.FME_ARCHIVE_TODAY'

SELECT * FROM USER_TAB_PARTITIONS WHERE TABLE_NAME='FME_ARCHIVE_TODAY';

select * from FME.FME_ARCHIVE_TODAY partition(HIS_20190715)


select * from ATF
