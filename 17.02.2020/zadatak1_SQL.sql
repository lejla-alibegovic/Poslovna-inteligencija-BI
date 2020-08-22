create table god_voznje(
voznja_ID int not null primary key(voznja_ID),
godina_voznje int
)
insert into god_voznje
select voznja.voznja_ID,year(voznja.dtm_voznje)
from voznja

select *from god_voznje
