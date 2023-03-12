

select b."name" as "Modelo" , c."name" as "Marca", d."name" as "Grupo",
a.matricula , a.dt_compra as "Fecha compra" , a.tot_kms as "Kilometros" , 
a.num_poliza_seguro , e."name" as "Aseguradora"
from practicaegla.kc_cars a
inner join practicaegla.carsmodels b on a.id_model =b.id_model 
inner join practicaegla.carsbrand c on b.id_marca = c.id_marca 
inner join practicaegla.carsgroup d on c.id_group = d.id 
inner join practicaegla.aseguradoras e on a.id_aseguradora = e.id
where a.dt_termination = '9999-12-31'

order by c."name" asc 