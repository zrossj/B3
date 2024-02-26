drop table if exists carteira, extrato_b3, cotacao, extrato_b3_raw;


create table if NOT exists carteira 
(id serial primary key,
date timestamptz,
ticker varchar(64),
quantidade integer,
pumedio decimal(6,3),
pumercado decimal(8,2),
constraint uk_carteira_date_ticker unique(date, ticker));



create table if not exists extrato_b3
(id serial primary key,
vector char(7) not null,
date timestamptz not null,
event varchar(64) not null,
asset varchar(64) not null,
quantidade numeric (7,2) not null, 
pu numeric(6,3) not null
);



create table if not exists cotacao
(
id serial primary key,
date timestamptz not null,
ticker varchar(64) not null,
pumercado decimal(5,2) not null,
constraint uk_cotacao_date_ticker UNIQUE(date, ticker)
);



create table if not exists extrato_b3_raw
(
vector char(7),
date char(10),
event varchar(64),
asset varchar(64),
broker varchar(64),
quantidade numeric (7, 2), 
pu money,
amount money
);


--\copy extrato_b3_raw from /home/peon/Documents/extratos/extrato_b3.csv with delimiter ',' HEADER;
--\i ~/Downloads/injection.sql
