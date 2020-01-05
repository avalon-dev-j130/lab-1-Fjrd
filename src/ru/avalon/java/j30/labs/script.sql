/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

drop table order2product;
drop table product;
drop table supplier;
drop table "ORDER";
drop table "USER";
drop table user_info;
drop table roles;

create table supplier(
    id integer not null unique
        generated always as identity (start with 1, increment by 1),
    name varchar (255) not null,
    address varchar (255) not null,
    phone varchar (255),
    representative varchar (255) not null,
    primary key (name)
);

create table product(
    id integer not null unique
       generated always as identity (start with 1, increment by 1),
    code varchar (255),
    title varchar (255),
    supplier integer references supplier(id),
    initial_price double,
    retail_value double,
    primary key (code)
);

create table roles(
    id integer not null unique
       generated always as identity (start with 1, increment by 1),
    name varchar(255),
    primary key (name)
);

create table user_info(
    id integer not null unique
       generated always as identity (start with 1, increment by 1),
    name varchar(255) not null,
    surname varchar(255) not null
);

create table "USER"
(
    id integer not null unique
       generated always as identity (start with 1, increment by 1),
    email varchar(255) not null unique,
    password varchar(255) not null,
    info integer references user_info(id),
    role integer references roles(id)
);

create table "ORDER"
(
    id integer not null unique
       generated always as identity (start with 1, increment by 1),
    "USER" integer references "USER" (id),
    created timestamp,
    primary key (id)
);

create table order2product(
    "ORDER" integer references "ORDER" (id),
    product integer references product(id),
    primary key ("ORDER", product)
);

insert into supplier(name, address, phone, representative)
values ('Howard Bancorp, Inc.', '46994 Dahle Court', '255-178-5784', 'NASDAQ');
values ('HNI Corporation', '9888 Kingsford Hill', '637-915-8773', 'NYSE');
values ('Jensyn Acquistion Corp.', '5427 Banding Court', '242-947-5006', 'NASDAQ');

insert into product(code, title, supplier, initial_price, retail_value)
values ('48131-3T352','Pipe, Brake Booster Accumulator', '1', '$7.54', '$5.63');
values ('48131-3T352','Pipe Assy, Exhaust, Front NO.2', '2', '$1.57', '$5.25');
values ('48131-3T352', 'Hose, Flexible(For Rear RH)', '3', '$2.12', '$2.75');

insert into user_info (name, surname)
values ('Adelina', 'Muzzall');
values ('Sonnie', 'Casier');
values ('Darlleen', 'Morena');

insert into roles (name)
values ('CUSTOMER');
values ('REGULAR CUSTOMER');
values ('VIP CUSTOMER');

insert into "USER" (email, password, info, role)
values ('dalhirsi1@accuweather.com', 'obwWfM9K', '1', 'CUSTOMER' );
values ('tjaksic0@moonfruit.com', 'Pdpwf8vMBjc', '2','REGULAR CUSTOMER');
values ('mkaesmakers2@hao123.com', '5EXnfh', '3', 'VIP CUSTOMER');

insert into "ORDER" ("USER", created)
values ('1', '1578247478');
values ('2', '1376273489');
values ('3', '1181567894');

insert into order2product ("ORDER", product)
values ('1', '1');
values ('2', '2');
values ('3', '3');