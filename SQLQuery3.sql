use BookDB
CREATE TABLE BookClass
(
classNO varchar(3) primary key,
className varchar(20),

)
go

CREATE TABLE Book
(
bookNO varchar(10) primary key,
classNO varchar(3),
bookName varchar(40) ,
authorName varchar(8),
publishingName varchar(20),
publishingNO varchar(17),
price DECIMAL(7,2),
publishingDate datetime,
shopDate datetime,
shopNum int,
check (price>0)
)
go
create table Borrow(
	readerNO varchar(8),
	bookNo varchar(10),
	borrowDate datetime,
	shouldDate datetime,
	returnDate datetime,
)
go
insert BookClass values('001','������')
insert BookClass values('002','������')
insert BookClass values('003','�������')
go
insert Book values('B200101001','001','���ξ���ѧ','����','�й������ѧ������','P1991010100010001',31.80,'19910101','19950111',100)
insert Book values('B200201001','002','��ѧӢ��','֣����','�����ѧ���о�������','P1992010100010001',35.20,'19920101','19960111',130)
insert Book values('B200301001','003','���ݿ�ϵͳԭ��','�⾩��','�廪��ѧ������','P1993010100010001',58.20,'19930101','19950111',160)
insert Book values('B200101002','001','΢�۾���ѧ','����','�ߵȽ���������','P1991010100010002',41.80,'19910102','19950112',110)
insert Book values('B200101003','001','��۾���ѧ','Ԭ��ʥ','�й��ƾ����ó�����','P1991010100010003',51.80,'19910103','19950113',120)
insert Book values('B200201002','002','����Ӣ��','������','�Ϻ�����ѧԺ������','P1992010100010002',45.20,'19920102','19960112',140)
insert Book values('B200201003','002','����Ӣ��2','�����','������ͨ��ѧ������','P1992010100010003',55.20,'19920103','19960113',150)
insert Book values('B200301002','003','��������','����','�㽭��ѧ������','P1993010100010002',38.20,'19930102','19950112',170)
insert Book values('B200301003','003','�˹�����','������','���ӹ�ҵ������','P1993010100010003',43.20,'19930103','19950113',180)
insert Book values('B200301004','003','�㷨��������','�»���','��ѧ������','P1993010100010004',58.20,'19930104','19950114',190)
go
insert Reader values('R2005001','��С��','F','412723199001014321','ͳһ�ɷ����޹�˾',0)
insert Reader values('R2006001','����','F','412723199003014321','���Ϲɷ����޹�˾',0)
insert Reader values('R2007001','�ߴ���','M','412723199005014321','�鶼�ɷ����޹�˾',0)
insert Reader values('R2008001','�»�','M','412723199111014321','�ϲ��е������ƹ�˾',0)
insert Reader values('R2009001','����','F','412723199208014321','��ʿ���Ƽ�����',0)
insert Reader values('R2005002','��¶','F','412723199002014321','��¡�ɷ����޹�˾',0)
insert Reader values('R2006002','����ǿ','M','412723199004014321','���´�ɷ����޹�˾',0)
insert Reader values('R2007002','����÷','F','412723199112014321','���缼��������˾',0)
insert Reader values('R2008002','����','M','412723199110014321','�Ϻ������о���',0)
insert Reader values('R2009002','����ƽ','M','412723199209014321','����Ԫ���޹�˾',0)
go
insert Borrow values('R2005001','B200101001','20110901','20111001',null)
insert Borrow values('R2006001','B200101001','20110907','20111007','20111005')
insert Borrow values('R2007001','B200201001','20110913','20111013','20111010')
insert Borrow values('R2008001','B200301001','20110915','20111015','20111013')
insert Borrow values('R2009001','B200301001','20110918','20111018',null)
insert Borrow values('R2005001','B200101002','20110902','20111002','20111001')
insert Borrow values('R2005001','B200101003','20110903','20111003',null)
insert Borrow values('R2005002','B200101001','20110904','20111004','20111003')
insert Borrow values('R2005002','B200101002','20110905','20111005',null)
insert Borrow values('R2005002','B200101003','20110906','20111006','20111008')
insert Borrow values('R2006001','B200101002','20110908','20111008','20111006')
insert Borrow values('R2006001','B200101003','20110909','20111009','20111012')
insert Borrow values('R2009002','B200201001','20110910','20111010','20111008')
insert Borrow values('R2006002','B200201002','20110911','20111011','20111008')
insert Borrow values('R2006002','B200201003','20110912','20111012','20111008')
insert Borrow values('R2007001','B200201002','20110914','20111014',null)
insert Borrow values('R2007001','B200201003','20110915','20111015','20111010')
insert Borrow values('R2009002','B200201001','20110916','20111016','20111014')
insert Borrow values('R2007002','B200201002','20110917','20111017','20111014')
insert Borrow values('R2007002','B200201003','20110917','20111017','20111014')
go
select readerName,workUnit,identitycard 
from Reader --1.��ѯ1991������Ķ���������������λ�����֤�ţ�
go
select readerNO,readerName,sex 
from Reader 
where workUnit like '%��ʿ���Ƽ�����%'--2.��ѯ�ڸ�ʿ���Ƽ����Ź����Ķ��߱�š��������Ա�;
go
select * 
from Book 
where bookName like '%���ݿ�%'--3.��ѯͼ�����к���"���ݿ�"��ͼ�����ϸ��Ϣ;
go
select bookNO,shopNum 
from Book 
where authorName like'���ľ�' and price >=40--4.��ѯ���ľ���ʦ��д�ĵ��۲�����40Ԫ��ÿ��ͼ���ͼ���š����������
go
select bookNO,publishingNO,shopDate,bookName 
from Book 
where year(shopDate) between 1995 and 1996 
order by shopDate --5.��ѯ��1995-1996��֮������ͼ���š�����ʱ�䡢���ʱ���ͼ�����ƣ��������ʱ�����������
go
select readerName,borrowDate,returnDate 
from Reader rea,Borrow bor 
where rea.readerNO=bor.readerNO and  bookNO='B200101002'--6.��ѯ������ͼ����Ϊ'B200101002'ͼ��Ķ����������������ڡ��������ڣ�
go
select book.bookNO,bookName,borrowDate,returnDate 
from Reader rea,Borrow bor,Book book 
where bor.readerNO=rea.readerNO and book.bookNO=bor.bookNO and rea.readerName='����÷'--7.��ѯ��������÷���ĵ�ͼ���š�ͼ�����ơ��������ں͹黹���ڣ�
go
select rea.readerNO,readerName,bookName,borrowDate,shouldDate,returnDate
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and rea.workUnit='�鶼�ɷ����޹�˾' and returnDate is null --8.��ѯ'�鶼�ɷ����޹�˾'û�й黹����ͼ��Ķ��߱�š�����������ͼ�����ơ��������ں�Ӧ�黹���ڣ�
go
select rea.readerNO,readerName,bookName,borrowDate,returnDate
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and publishingName='�廪��ѧ������'--9.��ѯ�������廪��ѧ����������ͼ��Ķ��߱�š�����������ͼ�����ơ��������ں͹黹���ڣ�
go
select rea.readerNO,readerName,book.bookNO,bookName
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and year(borrowDate) between 2010 and 2011  --10.��ѯ����ʱ����2010-2011��֮��Ķ��߱�š�����������ͼ���š�ͼ�����ƣ�
go
select bookC.classNO,max(book.price) as ��߼۸�,avg(book.price) as ƽ���۸�
from BookClass bookC,Book book
GROUP BY bookC.classNO,book.classNo
HAVING bookC.classNO=book.classNo
order by max(book.price) DESC--11.��ѯÿ������ͼ�����š���߼۸��ƽ���۸񣬲�����߼۸�Ľ��������
go
select sum(shopNum) as �������
from Book book,BookClass bookC
where bookC.classNO=book.classNO and book.classNO<009--12.��ѯͼ������С��009��ͼ������������
go
select workout.readerNO,workout.readerName,sum(workout.price) as ����ͼ����ܼ�
from (select rea.readerNO,readerName,price from Reader rea,Book book,Borrow bor where rea.readerNO=bor.readerNO and bor.bookNo=book.bookNO) workout
group by workout.readerNO,workout.readerName
having sum(workout.price)>150--13.��ѯ����ͼ����ܼ���150Ԫ���ϵĶ��߱�š���������������ͼ����ܼۣ�  --Ҫ��̣ܶ����Ƽ򵥣���ʵ�Ƚϸ��ӣ�
go
select readerName,workUnit
from Reader 
where readerNO not in (select readerNO from Borrow) or readerNO in (select readerNO from Borrow where readerNO not in (select readerNO from Borrow where returnDate is null))--14.��ѯû�н���Ķ��������͹�����λ(�ֱ�ʹ��IN�Ӳ�ѯ�ʹ��������Ӳ�ѯ���)��
go
select readerName,workUnit
from Reader rea
where NOT EXISTS (select * from Borrow bor where bor.readerNO=rea.readerNO) or EXISTS (select * from Borrow bor where bor.readerNO=rea.readerNO and NOT EXISTS(select * from Borrow bor where bor.readerNO=rea.readerNO and returnDate is null )) --14.��ѯû�н���Ķ��������͹�����λ(�ֱ�ʹ��IN�Ӳ�ѯ�ʹ��������Ӳ�ѯ���)��
--15.��ѯ������ͼ����Ϊ'B200101002'ͼ��Ķ��߱�š������Լ�������������δ�黹������ͼ���ͼ�����ơ���������(�ֱ�ʹ��IN�Ӳ�ѯ�ʹ��������Ӳ�ѯ���)��