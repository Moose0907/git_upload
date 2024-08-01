--練習二
create table VILLAGE(
 村里別代號 char(4) primary key,
 村里別 nvarchar2(20),
 村里辦公室 nvarchar2(50),
 村里辦公室電話 nvarchar2(20)
);

create table POLICE(
 轄管分局代碼 char(4) primary key,
 轄管分局 nvarchar2(20),
 分局地址 nvarchar2(50),
 分局電話 nvarchar2(20)
);

create table FACILITY(
 代號 char(4) primary key,
 類別 nvarchar2(20),
 地址 nvarchar2(50),
 地下樓層數 number,
 人數 number,
 分局代碼 char(4) references 轄管分局資訊(轄管分局代碼),
 村里代號 char(4) references 轄管村里資訊(村里別代號)
);

--第一行換行後，空一格

--練習三
insert into POLICE 
 values ('M001', '竹南分局', '苗栗縣竹南鎮民族街72號', '037-474796');
insert into POLICE 
 values ('M002', '苗栗分局', '苗栗縣苗栗市金鳳街109號', '037-320059');
insert into POLICE 
 values ('M003', '頭份分局', '苗栗縣頭份市中興路503號', '037-663004');

insert into VILLAGE 
 values ('C001', '大埔里', '竹南鎮公義路1035號', '037-581072');
insert into VILLAGE 
 values ('C002', '竹南里', '竹南鎮竹南里中山路103號', '037-472735');
insert into VILLAGE 
 values ('C003', '山佳里', '竹南鎮山佳里國光街14號', '037-614186');
insert into VILLAGE 
 values ('C004', '頂埔里', '後龍鎮埔頂里中興路136-1號', '037-724839');
insert into VILLAGE 
 values ('C005', '綠苗里', '苗栗市綠苗里中正路766號', '037-333240');
insert into VILLAGE 
 values ('C006', '民族里', '民族里民族路96號', '037-660001');
insert into VILLAGE 
 values ('C007', '忠孝里', '忠孝里光大街82號', '037-661145');
insert into VILLAGE 
 values ('C008', '信義里', '信義里信義路53巷1號', '037-616072');
    
insert into FACILITY 
 values ('B001', '公寓', '苗栗縣竹南鎮中埔街20號', '1', '100', 'M001', 'C001' );
insert into FACILITY 
 values ('B002', '大樓', '苗栗縣竹南鎮和平街79號', '1', '3142', 'M001', 'C002' );
insert into FACILITY 
 values ('B003', '大樓', '苗栗縣竹南鎮龍山路三段142號', '1', '1072', 'M001', 'C003' );
insert into FACILITY 
 values ('B004', '公共設施', '苗栗縣後龍鎮中華路1498號', '1', '32', 'M001', 'C004' );
insert into FACILITY 
 values ('B005', '公寓', '苗栗縣苗栗市米市街80號', '1', '106', 'M002', 'C005' );
insert into FACILITY 
 values ('B006', '公寓', '苗栗縣苗栗市光復路117號', '1', '26', 'M002', 'C005' );
insert into FACILITY 
 values ('B007', '大樓', '苗栗縣苗栗市博愛街109號', '2', '2038', 'M002', 'C005' );
insert into FACILITY 
 values ('B008', '大樓', '苗栗縣苗栗市大同路53號', '2', '128', 'M002', 'C005' );
insert into FACILITY 
 values ('B009', '公共設施', '苗栗縣頭份市民族里和平路102號', '1', '353', 'M003', 'C006' );
insert into FACILITY 
 values ('B010', '私營單位', '苗栗縣頭份市忠孝忠孝一路69號', '1', '501', 'M003', 'C007' );
insert into FACILITY 
 values ('B011', '公寓', '苗栗縣頭份市信義里中正路65號', '1', '194', 'M003', 'C008' );
insert into FACILITY 
 values ('B012', '私營單位', '苗栗縣頭份市信義里中正路116號', '1', '78', 'M003', 'C008' );

--練習四
--4-1
select distinct B.轄管分局, B.分局電話 --可以不加distinct，看題目規定
 from FACILITY A 
 inner join POLICE B on A.分局代碼 = B.轄管分局代碼
 where A.人數 > '1000';
    
--4-2
select distinct B.轄管分局, B.分局電話, count(A.分局代碼) as "轄管設施數量" --as後面加雙引號, 別名不需要
 from FACILITY A
 inner join POLICE B on A.分局代碼 = B.轄管分局代碼  --有關連的語法相同
 where A.人數 > '1000'
 group by B.轄管分局, B.分局電話;

--4-3
select distinct B.轄管分局, B.分局電話, count(A.分局代碼) as "轄管設施數量", A.地址 as "避難設施地址", A.類別 as "類型" 
 from FACILITY A
 inner join POLICE B on A.分局代碼 = B.轄管分局代碼
 where A.人數 > '1000'
 group by B.轄管分局, B.分局電話, A.地址,A.類別 ;

--4-4
select C.村里別, A.地址 as "避難設施地址", A.人數 as "容人數量", 轄管分局, B.分局電話 as "分局連絡電話"
 from FACILITY A
 inner join POLICE B on A.分局代碼 = B.轄管分局代碼
 inner join VILLAGE C on A.村里代號 = C.村里別代號
 where A.地址 like '%中%';
        
--4-5
select C.村里別, C.村里辦公室 as "村里辦公室位置", A.地址 as "避難設施地址", A.人數 as "容人數量"
 from FACILITY A
 inner join POLICE B on A.分局代碼 = B.轄管分局代碼
 inner join VILLAGE C on A.村里代號 = C.村里別代號
 where A.類別 = '公寓' 
 or A.類別 = '大樓' ;
 --in ('公寓', '大樓'); -- 功能開發使用，建議這邊有"明確的方向" 不要用in 直接用 = OR

--練習五
--5-1
update FACILITY
 set 人數 = '5000'
 where 地址 = '苗栗縣竹南鎮和平街79號';

--5-2
delete from FACILITY
 where 人數 < '1000';
 
 commit;