create table part
(
  pno number(10),
  pname varchar(20),
  colour varchar(20),
  primary key(pno)
);


Create table supplier
(
  sno number(10),
  sname varchar(20),
  address varchar(20),
  primary key(sno)
);

create table supply
(
  pno number(10),
  sno number(10),
  quantity varchar(20),
  primary key(pno,sno),
  foreign key(pno) references part(pno) on delete cascade,
  foreign key(sno) references supplier(sno) on delete cascade
);

  
insert into part values(1, 'plug', 'black');
insert into part values(2, 'bolt', 'blue');
insert into part values(3, 'nut', 'green');


insert into supplier values(10, 'Anoop', 'udupi');
insert into supplier values(15, 'Bharath', 'mangalore');
insert into supplier values(20, 'Ram', 'bangalore');


insert into supply values(1, 10, 50);
insert into supply values(2, 10, 30);
insert into supply values(1, 15, 70);
insert into supply values(3, 15, 40);
insert into supply values(1, 20, 55);
insert into supply values(2, 20, 65);
insert into supply values(3, 20, 75);

select * from part;

select * from supply ;

select pno
from supply
where sno IN(select sno
from supplier
where sname='Ram');

select sname, pname
from supplier, supply, part
where pname='bolt' AND supply.sno=supplier.sno AND part.pno=supply.pno;

delete from part where colour='green';
