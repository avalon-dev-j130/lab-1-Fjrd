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
values (123,123,123,123);
values (123,123,123,123);
values (123,123,123,123);

insert into product(code, title, supplier, initial_price, retail_value)
values (123,123,123,123,123);
values (123,123,123,123,123);
values (123,123,123,123,123);

insert into user_info (name, surname)
values (123,123);
values (123,123);
values (123,123);

insert into roles (name)
values (123);
values (123);
values (123);

insert into "USER" (email, password, info, role)
values (123,123,123,123);
values (123,123,123,123);
values (123,123,123,123);

insert into "ORDER" ("USER", created)
values (123,123);
values (123,123);
values (123,123);

insert into order2product ("ORDER", product)
values (123,123);
values (123,123);