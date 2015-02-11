create table fta_driver (fta_driver_id int, value varchar(30),name varchar(60));
create table tad_org (ad_org_id int, value varchar(30), name varchar(30));
create table fta_vehicle (fta_vehicle_id int, value varchar(60),name varchar(60));

create table tcarga_viaje (ad_org_id int, cid_sucursal int(4), dfecha_carga DATE, fta_vehicle_id int,
cid_vehiculo VARCHAR(10), fta_driver_id int, cid_chofer VARCHAR(9), isprocessed TINYINT(1), fta_recordweight_id int, npeso_neto double, nid_guia VARCHAR(30));

ALTER TABLE tviaje CHANGE COLUMN cguia cguia VARCHAR(30) NULL DEFAULT ' ';
ALTER TABLE tviaje CHANGE COLUMN corden_carga corden_carga VARCHAR(30) NULL DEFAULT ' ';

alter table tsucursal add column (ad_org_id int);
alter table tvehiculo add column (fta_vehicle_id int);
alter table tchofer add column (fta_driver_id int);

create table tdocumento_caja (cfactura varchar(30), ncontrol varchar(30), dfecha date, ntotal double, crif_emp varchar(12), tipo_documento char(1), 
isprocessed TINYINT(1), cid_sucursal int(4), ad_table_id int, record_id int);
