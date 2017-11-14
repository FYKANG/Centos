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
insert BookClass values('001','经济类')
insert BookClass values('002','外语类')
insert BookClass values('003','计算机类')
go
insert Book values('B200101001','001','政治经济学','宋涛','中国人民大学出版社','P1991010100010001',31.80,'19910101','19950111',100)
insert Book values('B200201001','002','大学英语','郑树棠','外语教学与研究出版社','P1992010100010001',35.20,'19920101','19960111',130)
insert Book values('B200301001','003','数据库系统原理','吴京慧','清华大学出版社','P1993010100010001',58.20,'19930101','19950111',160)
insert Book values('B200101002','001','微观经济学','张蕊','高等教育出版社','P1991010100010002',41.80,'19910102','19950112',110)
insert Book values('B200101003','001','宏观经济学','袁明圣','中国财经经济出版社','P1991010100010003',51.80,'19910103','19950113',120)
insert Book values('B200201002','002','商务英语','马升烨','上海外语学院出版社','P1992010100010002',45.20,'19920102','19960112',140)
insert Book values('B200201003','002','商务英语2','江宇佳','西安交通大学出版社','P1992010100010003',55.20,'19920103','19960113',150)
insert Book values('B200301002','003','组网技术','万征','浙江大学出版社','P1993010100010002',38.20,'19930102','19950112',170)
insert Book values('B200301003','003','人工智能','费翔林','电子工业出版社','P1993010100010003',43.20,'19930103','19950113',180)
insert Book values('B200301004','003','算法设计与分析','陈慧南','科学出版社','P1993010100010004',58.20,'19930104','19950114',190)
go
insert Reader values('R2005001','张小娟','F','412723199001014321','统一股份有限公司',0)
insert Reader values('R2006001','刘凤','F','412723199003014321','联合股份有限公司',0)
insert Reader values('R2007001','高代鹏','M','412723199005014321','洪都股份有限公司',0)
insert Reader values('R2008001','陈辉','M','412723199111014321','南昌市电脑研制公司',0)
insert Reader values('R2009001','李虹冰','F','412723199208014321','富士康科技集团',0)
insert Reader values('R2005002','张露','F','412723199002014321','兴隆股份有限公司',0)
insert Reader values('R2006002','喻自强','M','412723199004014321','万事达股份有限公司',0)
insert Reader values('R2007002','张晓梅','F','412723199112014321','世界技术开发公司',0)
insert Reader values('R2008002','张良','M','412723199110014321','上海生物研究室',0)
insert Reader values('R2009002','韩福平','M','412723199209014321','合生元有限公司',0)
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
from Reader --1.查询1991年出生的读者姓名、工作单位和身份证号；
go
select readerNO,readerName,sex 
from Reader 
where workUnit like '%富士康科技集团%'--2.查询在富士康科技集团工作的读者编号、姓名和性别;
go
select * 
from Book 
where bookName like '%数据库%'--3.查询图书名中含有"数据库"的图书的详细信息;
go
select bookNO,shopNum 
from Book 
where authorName like'吴文君' and price >=40--4.查询吴文君老师编写的单价不低于40元的每种图书的图书编号、入库数量；
go
select bookNO,publishingNO,shopDate,bookName 
from Book 
where year(shopDate) between 1995 and 1996 
order by shopDate --5.查询在1995-1996年之间入库的图书编号、出版时间、入库时间和图书名称，并按入库时间排序输出；
go
select readerName,borrowDate,returnDate 
from Reader rea,Borrow bor 
where rea.readerNO=bor.readerNO and  bookNO='B200101002'--6.查询借阅了图书编号为'B200101002'图书的读者姓名、借书日期、还书日期；
go
select book.bookNO,bookName,borrowDate,returnDate 
from Reader rea,Borrow bor,Book book 
where bor.readerNO=rea.readerNO and book.bookNO=bor.bookNO and rea.readerName='张晓梅'--7.查询读者张晓梅借阅的图书编号、图书名称、借书日期和归还日期；
go
select rea.readerNO,readerName,bookName,borrowDate,shouldDate,returnDate
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and rea.workUnit='洪都股份有限公司' and returnDate is null --8.查询'洪都股份有限公司'没有归还所借图书的读者编号、读者姓名、图书名称、借书日期和应归还日期；
go
select rea.readerNO,readerName,bookName,borrowDate,returnDate
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and publishingName='清华大学出版社'--9.查询借阅了清华大学出版社出版的图书的读者编号、读者姓名、图书名称、借书日期和归还日期；
go
select rea.readerNO,readerName,book.bookNO,bookName
from Reader rea,Book book,Borrow bor
where rea.readerNO=bor.readerNO and bor.bookNO=book.bookNO and year(borrowDate) between 2010 and 2011  --10.查询借书时间在2010-2011年之间的读者编号、读者姓名、图书编号、图书名称；
go
select bookC.classNO,max(book.price) as 最高价格,avg(book.price) as 平均价格
from BookClass bookC,Book book
GROUP BY bookC.classNO,book.classNo
HAVING bookC.classNO=book.classNo
order by max(book.price) DESC--11.查询每种类别的图书分类号、最高价格和平均价格，并按最高价格的降序输出；
go
select sum(shopNum) as 入库数量
from Book book,BookClass bookC
where bookC.classNO=book.classNO and book.classNO<009--12.查询图书分类号小于009号图书的入库数量；
go
select workout.readerNO,workout.readerName,sum(workout.price) as 所借图书的总价
from (select rea.readerNO,readerName,price from Reader rea,Book book,Borrow bor where rea.readerNO=bor.readerNO and bor.bookNo=book.bookNO) workout
group by workout.readerNO,workout.readerName
having sum(workout.price)>150--13.查询所借图书的总价在150元以上的读者编号、读者姓名和所借图书的总价；  --要求很短，看似简单，其实比较复杂；
go
select readerName,workUnit
from Reader 
where readerNO not in (select readerNO from Borrow) or readerNO in (select readerNO from Borrow where readerNO not in (select readerNO from Borrow where returnDate is null))--14.查询没有借书的读者姓名和工作单位(分别使用IN子查询和存在量词子查询表达)；
go
select readerName,workUnit
from Reader rea
where NOT EXISTS (select * from Borrow bor where bor.readerNO=rea.readerNO) or EXISTS (select * from Borrow bor where bor.readerNO=rea.readerNO and NOT EXISTS(select * from Borrow bor where bor.readerNO=rea.readerNO and returnDate is null )) --14.查询没有借书的读者姓名和工作单位(分别使用IN子查询和存在量词子查询表达)；
--15.查询借阅了图书编号为'B200101002'图书的读者编号、姓名以及他们所借阅尚未归还的所有图书的图书名称、借书日期(分别使用IN子查询和存在量词子查询表达)）