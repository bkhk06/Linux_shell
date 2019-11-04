SELECT
  b.file_name,
  b.tablespace_name,
  b.bytes - sum(a.bytes) "已使用",
  b.bytes
FROM
  dba_free_space A,
  dba_data_files b
WHERE
  A .file_id = b.file_id
AND b.tablespace_name = 'ATFM'
group BY b.file_name,
  b.tablespace_name,
  b.bytes
  
  SELECT b.file_name 物理文件名,
b.tablespace_name 表空间名, 
b.bytes / 1024 / 1024 大小M, 
(b.bytes - SUM (NVL(A .bytes, 0))) / 1024 / 1024 已使用M, 
substr ((b.bytes - SUM (NVL(A .bytes, 0))) / (b.bytes) * 100,1,5) 利用率 
from dba_free_space A, 
dba_data_files b 
where A .file_id = b.file_id 
group BY b.tablespace_name,b.file_name,b.bytes 
order BY b.tablespace_name;

alter tablespace ATFM add datafile 'D:\ORACLE_DATA\ATFMSW\ATFM30' size 20G 
autoextend on next 1024M maxsize unlimited;
,
SELECT a.tablespace_name "表空间名",
total / (1024 * 1024 * 1024) "表空间大小(G)",
free / (1024 * 1024 * 1024) "表空间剩余大小(G)",
(total - free) / (1024 * 1024 * 1024) "表空间使用大小(G)",
round((total - free) / total, 4) * 100 "使用率 %"
FROM (SELECT tablespace_name, SUM(bytes) free
FROM dba_free_space
GROUP BY tablespace_name) a
(SELECT tablespace_name, SUM(bytes) total
FROM dba_data_files
GROUP BY tablespace_name) b
WHERE a.tablespace_name = b.tablespace_name ;
