use publikacija_DW

--dim
CREATE TABLE dim_autor
(
	autor_key int IDENTITY(1,1) NOT NULL,
	autor_ID int NOT NULL,
	naziv_grada nvarchar(30) NULL,
	spol nvarchar(1) NULL,
	pub_ID int NOT NULL,
	CONSTRAINT PK_dim_autor PRIMARY KEY  (autor_key)
)

CREATE TABLE dim_citalac
(
	citalac_key int IDENTITY(1,1) NOT NULL,
	citalac_ID int NOT NULL,
	naziv_grada nvarchar(30) NULL,
	spol nvarchar(1) NULL,
	dtm_podizanja datetime NOT NULL,
	dtm_vracanja datetime NULL,
	br_dana_zadr int NULL,
	pub_id int NULL,
	CONSTRAINT PK_dim_citalac PRIMARY KEY  (citalac_key)
)

CREATE TABLE dim_forma_pub
(
	forma_pub_key int IDENTITY(1,1) NOT NULL,
	forma_pub_ID int NOT NULL,
	forma_pub_naziv nvarchar(50) NULL,
	max_duz_zadrz int NULL,
	CONSTRAINT PK_dim_forma_pub PRIMARY KEY (forma_pub_key)
)

CREATE TABLE dim_izdavac
(
	izdavac_key int IDENTITY(1,1) NOT NULL,
	izdavac_ID int NOT NULL,
	naziv_grada nvarchar(30) NULL,
	naziv_izdavaca nvarchar(50) NULL,
	CONSTRAINT PK_dim_izdavac PRIMARY KEY (izdavac_key)
)

CREATE TABLE dim_zanr
(
	zanr_key int IDENTITY(1,1) NOT NULL,
	zanr_ID int NOT NULL,
	zanr_naziv nvarchar(50) NULL,
	CONSTRAINT PK_dim_zanr PRIMARY KEY  (zanr_key ASC)
)


--fact 
CREATE TABLE fact_publikacija
(
	pub_key int IDENTITY(1,1) NOT NULL,
	autor_key int NULL,
	citalac_key int NULL,
	forma_pub_key int NULL,
	izdavac_key int NULL,
	zanr_key int NULL,
	pub_ID int NOT NULL,
	naziv_pub nvarchar(50) NULL,
	cijena float NULL,
	ISBN nvarchar(25) NULL,
	CONSTRAINT PK_fact_publikacija PRIMARY KEY  (pub_key ASC),
	CONSTRAINT FK_fact_publikacija_dim_autor FOREIGN KEY(autor_key) REFERENCES dim_autor (autor_key),
	CONSTRAINT FK_fact_publikacija_dim_citalac FOREIGN KEY(citalac_key) REFERENCES dim_citalac (citalac_key),
	CONSTRAINT FK_forma FOREIGN KEY(forma_pub_key) REFERENCES dim_forma_pub (forma_pub_key),
	CONSTRAINT FK_izdavac FOREIGN KEY(izdavac_key) REFERENCES dim_izdavac (izdavac_key),
	CONSTRAINT FK_zanr FOREIGN KEY(zanr_key) REFERENCES dim_zanr (zanr_key)
)