use prodaja
go

--1b
alter table dbo.narudzba
add god_narudz as year(dtm_narudzbe)

--2a create dimensional tables and DW

create database prodaja_DW
use prodaja_DW

create table dim_narudzba(
narudzbaKey int constraint PK_narudzba primary key identity (1,1),
narudzbaID int not null,
kupac_naziv nvarchar(40) not null,
kupac_grad nvarchar(15) not null,
kupac_drzava nvarchar(15) not null,
god_narudz int not null,
ispor_naziv nvarchar(40) not null,
cijena_dostave money
)

create table dim_popust(
popustKey int constraint PK_popust primary key identity(1,1),
popustID int not null,
vr_popusta real
)

create table dim_proizvod(
proizvodKey int constraint PK_proizvod primary key identity(1,1),
proizvodID int not null,
kateg_naziv nvarchar(15) not null,
proiz_naziv nvarchar(40) not null,
dobav_naziv nvarchar(40) not null,
dobav_grad nvarchar(15),
dobav_drzava nvarchar(15)
)

create table fact_nar_pr(
factNarPrKey int constraint PK_fact primary key identity (1,1),
narudzbaKey int constraint FK_naruzba foreign key (narudzbaKey) references dim_narudzba(narudzbaKey),
popustKey int constraint FK_popust foreign key (popustKey) references dim_popust(popustKey),
proizvodKey int constraint FK_proizvod foreign key(proizvodKey) references dim_proizvod(proizvodKey),
proiz_cijena money,
kolicina smallint
)