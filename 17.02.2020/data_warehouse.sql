create database autobusi_DW
use autobusi_DW

create table dim_godina(
godinaKey int constraint PK_dimGodina primary key identity (1,1),
voznja_ID int not null, 
godina_voznje int
)

create table dim_linija(
linijaKey int constraint PK_linija primary key identity (1,1),
linija_ID int not null,
vrijeme_polaska datetime,
vrijeme_dolaska datetime,
duzina_putovanja datetime,
linija_tip_naziv nvarchar(30)
)

create table dim_radnik(
radnikKey int constraint PK_radnik primary key identity (1,1),
radnik_ID varchar(5) not null,
radnik_kval_opis nvarchar(20)
)

create table dim_vozilo(
voziloKey int constraint PK_vozilo primary key identity (1,1),
vozilo_ID int not null,
vozilo_reg_oznaka nvarchar(10),
vozilo_tip_naziv nvarchar(30),
vozilo_max_br_sjed int
)

create table fact_voznja(
factVoznjaKey int constraint PK_fact primary key identity (1,1),
godinaKey int constraint FK_godina foreign key (godinaKey) references dim_godina(godinaKey),
radnikKey int constraint FK_radnik foreign key (radnikKey) references dim_radnik(radnikKey),
voziloKey int constraint FK_vozilo foreign key(voziloKey) references dim_vozilo(voziloKey),
linijaKey int constraint FK_linija foreign key (linijaKey) references dim_linija(linijaKey),
voznja_prihod float,
zarada float
)