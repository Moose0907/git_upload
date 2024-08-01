--�m�ߤG
create table VILLAGE(
 �����O�N�� char(4) primary key,
 �����O nvarchar2(20),
 �����줽�� nvarchar2(50),
 �����줽�ǹq�� nvarchar2(20)
);

create table POLICE(
 �Һޤ����N�X char(4) primary key,
 �Һޤ��� nvarchar2(20),
 �����a�} nvarchar2(50),
 �����q�� nvarchar2(20)
);

create table FACILITY(
 �N�� char(4) primary key,
 ���O nvarchar2(20),
 �a�} nvarchar2(50),
 �a�U�Ӽh�� number,
 �H�� number,
 �����N�X char(4) references �Һޤ�����T(�Һޤ����N�X),
 �����N�� char(4) references �Һާ�����T(�����O�N��)
);

--�Ĥ@�洫���A�Ť@��

--�m�ߤT
insert into POLICE 
 values ('M001', '�˫n����', '�]�߿��˫n����ڵ�72��', '037-474796');
insert into POLICE 
 values ('M002', '�]�ߤ���', '�]�߿��]�ߥ������109��', '037-320059');
insert into POLICE 
 values ('M003', '�Y������', '�]�߿��Y����������503��', '037-663004');

insert into VILLAGE 
 values ('C001', '�j�H��', '�˫n���q��1035��', '037-581072');
insert into VILLAGE 
 values ('C002', '�˫n��', '�˫n��˫n�����s��103��', '037-472735');
insert into VILLAGE 
 values ('C003', '�s�Ψ�', '�˫n��s�Ψ������14��', '037-614186');
insert into VILLAGE 
 values ('C004', '���H��', '���s��H����������136-1��', '037-724839');
insert into VILLAGE 
 values ('C005', '��]��', '�]�ߥ���]��������766��', '037-333240');
insert into VILLAGE 
 values ('C006', '���ڨ�', '���ڨ����ڸ�96��', '037-660001');
insert into VILLAGE 
 values ('C007', '������', '���������j��82��', '037-661145');
insert into VILLAGE 
 values ('C008', '�H�q��', '�H�q���H�q��53��1��', '037-616072');
    
insert into FACILITY 
 values ('B001', '���J', '�]�߿��˫n���H��20��', '1', '100', 'M001', 'C001' );
insert into FACILITY 
 values ('B002', '�j��', '�]�߿��˫n��M����79��', '1', '3142', 'M001', 'C002' );
insert into FACILITY 
 values ('B003', '�j��', '�]�߿��˫n���s�s���T�q142��', '1', '1072', 'M001', 'C003' );
insert into FACILITY 
 values ('B004', '���@�]�I', '�]�߿����s���ظ�1498��', '1', '32', 'M001', 'C004' );
insert into FACILITY 
 values ('B005', '���J', '�]�߿��]�ߥ��̥���80��', '1', '106', 'M002', 'C005' );
insert into FACILITY 
 values ('B006', '���J', '�]�߿��]�ߥ����_��117��', '1', '26', 'M002', 'C005' );
insert into FACILITY 
 values ('B007', '�j��', '�]�߿��]�ߥ��շR��109��', '2', '2038', 'M002', 'C005' );
insert into FACILITY 
 values ('B008', '�j��', '�]�߿��]�ߥ��j�P��53��', '2', '128', 'M002', 'C005' );
insert into FACILITY 
 values ('B009', '���@�]�I', '�]�߿��Y�������ڨ��M����102��', '1', '353', 'M003', 'C006' );
insert into FACILITY 
 values ('B010', '�p����', '�]�߿��Y�������������@��69��', '1', '501', 'M003', 'C007' );
insert into FACILITY 
 values ('B011', '���J', '�]�߿��Y�����H�q��������65��', '1', '194', 'M003', 'C008' );
insert into FACILITY 
 values ('B012', '�p����', '�]�߿��Y�����H�q��������116��', '1', '78', 'M003', 'C008' );

--�m�ߥ|
--4-1
select distinct B.�Һޤ���, B.�����q�� --�i�H���[distinct�A���D�سW�w
 from FACILITY A 
 inner join POLICE B on A.�����N�X = B.�Һޤ����N�X
 where A.�H�� > '1000';
    
--4-2
select distinct B.�Һޤ���, B.�����q��, count(A.�����N�X) as "�Һ޳]�I�ƶq" --as�᭱�[���޸�, �O�W���ݭn
 from FACILITY A
 inner join POLICE B on A.�����N�X = B.�Һޤ����N�X  --�����s���y�k�ۦP
 where A.�H�� > '1000'
 group by B.�Һޤ���, B.�����q��;

--4-3
select distinct B.�Һޤ���, B.�����q��, count(A.�����N�X) as "�Һ޳]�I�ƶq", A.�a�} as "�����]�I�a�}", A.���O as "����" 
 from FACILITY A
 inner join POLICE B on A.�����N�X = B.�Һޤ����N�X
 where A.�H�� > '1000'
 group by B.�Һޤ���, B.�����q��, A.�a�},A.���O ;

--4-4
select C.�����O, A.�a�} as "�����]�I�a�}", A.�H�� as "�e�H�ƶq", �Һޤ���, B.�����q�� as "�����s���q��"
 from FACILITY A
 inner join POLICE B on A.�����N�X = B.�Һޤ����N�X
 inner join VILLAGE C on A.�����N�� = C.�����O�N��
 where A.�a�} like '%��%';
        
--4-5
select C.�����O, C.�����줽�� as "�����줽�Ǧ�m", A.�a�} as "�����]�I�a�}", A.�H�� as "�e�H�ƶq"
 from FACILITY A
 inner join POLICE B on A.�����N�X = B.�Һޤ����N�X
 inner join VILLAGE C on A.�����N�� = C.�����O�N��
 where A.���O = '���J' 
 or A.���O = '�j��' ;
 --in ('���J', '�j��'); -- �\��}�o�ϥΡA��ĳ�o�䦳"���T����V" ���n��in ������ = OR

--�m�ߤ�
--5-1
update FACILITY
 set �H�� = '5000'
 where �a�} = '�]�߿��˫n��M����79��';

--5-2
delete from FACILITY
 where �H�� < '1000';
 
 commit;