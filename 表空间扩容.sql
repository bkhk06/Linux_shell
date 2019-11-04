SELECT
  b.file_name,
  b.tablespace_name,
  b.bytes - sum(a.bytes) "��ʹ��",
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
  
  SELECT b.file_name �����ļ���,
b.tablespace_name ��ռ���, 
b.bytes / 1024 / 1024 ��СM, 
(b.bytes - SUM (NVL(A .bytes, 0))) / 1024 / 1024 ��ʹ��M, 
substr ((b.bytes - SUM (NVL(A .bytes, 0))) / (b.bytes) * 100,1,5) ������ 
from dba_free_space A, 
dba_data_files b 
where A .file_id = b.file_id 
group BY b.tablespace_name,b.file_name,b.bytes 
order BY b.tablespace_name;

alter tablespace ATFM add datafile 'D:\ORACLE_DATA\ATFMSW\ATFM30' size 20G 
autoextend on next 1024M maxsize unlimited;
,
SELECT a.tablespace_name "��ռ���",
total / (1024 * 1024 * 1024) "��ռ��С(G)",
free / (1024 * 1024 * 1024) "��ռ�ʣ���С(G)",
(total - free) / (1024 * 1024 * 1024) "��ռ�ʹ�ô�С(G)",
round((total - free) / total, 4) * 100 "ʹ���� %"
FROM (SELECT tablespace_name, SUM(bytes) free
FROM dba_free_space
GROUP BY tablespace_name) a
(SELECT tablespace_name, SUM(bytes) total
FROM dba_data_files
GROUP BY tablespace_name) b
WHERE a.tablespace_name = b.tablespace_name ;
