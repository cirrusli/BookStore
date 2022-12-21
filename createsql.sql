create table if not exists books
(
    id int auto_increment
        primary key,
    title varchar(100) not null,
    author varchar(100) not null,
    price float(100,0) not null,
    sales int(100) not null,
    stock int(100) not null,
    img_path varchar(100) null
);

create table if not exists users
(
    id int auto_increment
        primary key,
    username varchar(100) not null,
    PASSWORD varchar(100) not null,
    email varchar(100) null,
    constraint username
        unique (username)
);

create table if not exists carts
(
    id varchar(100) not null
        primary key,
    total_count int not null,
    total_amount double(11,2) not null,
    user_id int not null,
    constraint carts_ibfk_1
        foreign key (user_id) references users (id)
);

create table if not exists cart_items
(
    id int auto_increment
        primary key,
    COUNT int not null,
    amount double(11,2) not null,
    book_id int not null,
    cart_id varchar(100) not null,
    constraint cart_items_ibfk_1
        foreign key (book_id) references books (id),
    constraint cart_items_ibfk_2
        foreign key (cart_id) references carts (id)
);

create index book_id
    on cart_items (book_id);

create index cart_id
    on cart_items (cart_id);

create index user_id
    on carts (user_id);

create table if not exists orders
(
    id varchar(100) not null
        primary key,
    create_time datetime not null,
    total_count int not null,
    total_amount double(11,2) not null,
    state int not null,
    user_id int null,
    constraint orders_ibfk_1
        foreign key (user_id) references users (id)
);

create table if not exists order_items
(
    id int auto_increment
        primary key,
    COUNT int not null,
    amount double(11,2) not null,
    title varchar(100) not null,
    author varchar(100) not null,
    price double(11,2) not null,
    img_path varchar(100) not null,
    order_id varchar(100) not null,
    constraint order_items_ibfk_1
        foreign key (order_id) references orders (id)
);

create index order_id
    on order_items (order_id);

create index user_id
    on orders (user_id);

create table if not exists sessions
(
    session_id varchar(100) not null
        primary key,
    username varchar(100) not null,
    user_id int not null,
    constraint sessions_ibfk_1
        foreign key (user_id) references users (id)
);

create index user_id
    on sessions (user_id);

create index id
    on users (id);

