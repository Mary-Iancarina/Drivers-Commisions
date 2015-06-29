CREATE PROCEDURE Sp_Reemplazar_Anticipo (tnid_anticipo Integer,tnid_sucursal int(4),tcid_vehiculo varchar(10),tnid_sucursal_v int(4),tcid_chofer varchar(9),tnid_sucursal_c int(4),tcobservacion text,tcid_usuario varchar(20),tcid_periodo varchar(10))
NOT DETERMINISTIC
CONTAINS SQL
BEGIN


   Declare nError,lNid_Anticipo,lNid_Viaje,lNid_Anticipo_nvo,lNid_Viaje_nvo integer;
   Set lNid_Anticipo = 0;
   Set lNid_Viaje = 0;
   Set lNid_Anticipo_nvo = 0;
   Set lNid_Viaje_nvo = 0;

   Start Transaction;
      Create Temporary Table ttAnticipo (nid_anticipo Integer,index using btree (nid_anticipo),cnro_recibo varchar(10),nmonto double,cobservacion text,
         dfecha date,nstatus tinyint(1),nid_relacion int(10),nrelacionado tinyint(1),nid_sucursal int(4),nid_anticipo_ant int(10));
      Create Temporary Table ttViaje (nid_viaje Integer,index using btree (nid_viaje),cid_chofer varchar(9),cid_vehiculo varchar(10),dfecha date,cobservacion text,cguia varchar(10),
         corden_carga varchar(10),dfecha_guia date,npeso_neto double,nid_origen int(4),nid_destino int(4),cid_periodo varchar(10),ntipo_viaje  tinyint(1),nid_sucursal_guia int(4),
         ndistancia double,nstatus tinyint(1),cfactura_ext varchar(10),ccliente_ext varchar(45),nid_sucursal_c int(4),nid_sucursal_v int(4),npeso_com double);
      Create Temporary Table ttAnticip_tViaje (nid_anticipo Integer,index using btree (nid_anticipo),nid_anticipo_nvo integer,
         nid_viaje Integer,index using btree (nid_viaje),nid_viaje_nvo integer);
      Create Temporary Table ttNid_Anticipo (nid_anticipo integer,index using btree (nid_anticipo));
      Create Temporary Table ttNid_Viaje (nid_viaje integer,index using btree (nid_viaje));
------agregar tabla temporal ttDetalle_Carga
      Create Temporary Table ttDetalle_Carga (nid_viaje integer, corden_carga char(25),cguia char(25),dfecha_guia date,npeso_neto double, blogico tinyint);

      insert into ttNid_Viaje select distinct tav.nid_viaje from tanticip_tviaje tav where tav.nid_anticipo = tnid_anticipo;
      insert into ttNid_Anticipo select distinct tav.nid_anticipo from tanticip_tviaje tav where nid_viaje in (select nid_viaje from ttNid_Viaje);
      insert into ttNid_Viaje select distinct tav.nid_viaje from tanticip_tviaje tav where tav.nid_anticipo in (select nid_anticipo from ttNid_Anticipo);
      insert into ttNid_Anticipo select distinct tav.nid_anticipo from tanticip_tviaje tav where nid_viaje in (select nid_viaje from ttNid_Viaje);
---insertando datos temporales ttDetalle_Carga
      insert into ttDetalle_Carga select * from tdetalle_carga where nid_viaje in (select nid_viaje from ttNid_Viaje);


      insert into ttAnticipo
         select distinct nid_anticipo,cnro_recibo,nmonto,cobservacion,dfecha,nstatus,nid_relacion,nrelacionado,nid_sucursal,nid_anticipo_ant from tanticipo
            where nid_anticipo in (select * from ttNid_Anticipo);

      insert into ttViaje
         select distinct nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,nid_origen,nid_destino,cid_periodo,ntipo_viaje,
            nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v,npeso_com from tviaje where nid_viaje in (select * from ttNid_Viaje);

      insert into ttAnticip_tViaje (nid_anticipo,nid_viaje)
         select nid_anticipo,nid_viaje from tanticip_tviaje where nid_anticipo in (select * from ttNid_Anticipo);

      While Exists(Select * From ttAnticipo) Do
         Set lNid_Anticipo = (Select nid_anticipo From ttAnticipo Order By nid_anticipo Limit 1);
         Set lNid_Anticipo_nvo = Fn_Corr_Nid_Anticipo(tnid_sucursal);
         insert into tanticipo (nid_anticipo,cnro_recibo,nmonto,nstatus,nid_anticipo_ant,dfecha,nid_sucursal,cid_usuario,cobservacion)
            select lNid_Anticipo_nvo,tan.cnro_recibo,tan.nmonto,tan.nstatus,tan.nid_anticipo,curdate(),tnid_sucursal,tcid_usuario,tcobservacion
            from tanticipo tan where tan.nid_anticipo = lNid_Anticipo;
         update ttAnticip_tViaje set nid_anticipo_nvo = lNid_Anticipo_nvo where nid_anticipo = lNid_Anticipo;
         update tanticipo set nstatus = 3 where nid_anticipo = lNid_Anticipo;
         Delete From ttAnticipo Where nid_anticipo = lNid_Anticipo;
      End While;

      While Exists(Select * From ttViaje) Do
         Set lNid_Viaje = (Select nid_viaje From ttViaje Order By nid_viaje Limit 1);
         Set lNid_Viaje_nvo = Fn_Corr_Nid_Viaje(tnid_sucursal);
         insert into tviaje (nid_viaje,cid_chofer,cid_vehiculo,dfecha,cobservacion,cguia,corden_carga,dfecha_guia,npeso_neto,cid_usuario,nid_origen,nid_destino,
            cid_periodo,ntipo_viaje,nid_sucursal_guia,ndistancia,nstatus,cfactura_ext,ccliente_ext,nid_sucursal_c,nid_sucursal_v,npeso_com)
            select lNid_Viaje_nvo,tcid_chofer,tcid_vehiculo,curdate(),tcobservacion,tvj.cguia,tvj.corden_carga,tvj.dfecha_guia,tvj.npeso_neto,
               tcid_usuario,tvj.nid_origen,tvj.nid_destino,tcid_periodo,tvj.ntipo_viaje,tvj.nid_sucursal_guia,tvj.ndistancia,tvj.nstatus,tvj.cfactura_ext,
               tvj.ccliente_ext,tnid_sucursal_c,tnid_sucursal_v,tvj.npeso_com
               from tviaje tvj where tvj.nid_viaje = lNid_Viaje;
       --- agregando detalle 
            while Exists(Select * from ttDetalle_Carga where nid_viaje=lNid_Viaje) Do
                insert into tdetalle_carga select lNid_Viaje_nvo, corden_carga, cguia, dfecha_guia, npeso_neto, blogico from ttDetalle_Carga where nid_viaje=lNid_Viaje;
                delete from ttDetalle_Carga where nid_viaje=lNid_Viaje;
            end while;
         update ttAnticip_tViaje set nid_viaje_nvo = lNid_Viaje_nvo where nid_viaje = lNid_Viaje;
         update tviaje set nstatus = 3 where nid_viaje = lNid_Viaje;
         Delete From ttViaje Where nid_viaje = lNid_Viaje;
      End While;
      Select * From ttAnticip_tViaje;
      While Exists(Select * From ttAnticip_tViaje) Do
         Set lNid_Anticipo = (Select nid_anticipo_nvo From ttAnticip_tViaje Limit 1);
         Set lNid_Viaje = (Select nid_viaje_nvo From ttAnticip_tViaje Limit 1);
         insert into tanticip_tviaje (nid_anticipo,nid_viaje) values(lNid_Anticipo,lNid_Viaje);
         Delete From ttAnticip_tViaje Where nid_anticipo_nvo = lNid_Anticipo and nid_viaje_nvo = lNid_Viaje;
      End While;
        select 1;
      Drop Temporary Table ttAnticipo;
      Drop Temporary Table ttViaje;
      Drop Temporary Table ttAnticip_tViaje;
      Drop Temporary Table ttNid_Anticipo;
      Drop Temporary Table ttNid_Viaje;
    ---Eliminando tabla temporal
       Drop Temporary Table ttDetalle_Carga;

   Set nError =(Select @Error);
   if(nError>0) then
      ROLLBACK;
   else
      COMMIT;
   end if;
END