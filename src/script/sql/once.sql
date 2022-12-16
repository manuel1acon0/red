-- this script should run on postgres
--
-- psql -U postgres \i setup.sql

drop schema if exists red cascade;
drop user if exists red;

create user red with password 'password';
create schema authorization red;
