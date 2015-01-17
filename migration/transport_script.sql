create table fta_driver (fta_driver_id int, value varchar(30),name varchar(60));
create table tad_org (ad_org_id int, value varchar(30), name varchar(30));
create table fta_vehicle (fta_vehicle_id int, value varchar(60),name varchar(60));

ALTER TABLE tviaje CHANGE COLUMN cguia cguia VARCHAR(30) NULL DEFAULT ' ';
ALTER TABLE tviaje CHANGE COLUMN corden_carga corden_carga VARCHAR(30) NULL DEFAULT ' ';

alter table tsucursal add column (ad_org_id int);
alter table tvehiculo add column (fta_vehicle_id int);
alter table tchofer add column (fta_driver_id int);


