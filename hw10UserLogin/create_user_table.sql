create table if not exists user (
    id int not null auto_increment,
    user_name varchar(20) not null,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email_address varchar(30) not null,
    password varchar(20) not null,
    primary key (id)
);
