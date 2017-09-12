SELECT a.iso, a.name_engli, f.idate,f.type,f.id,f.fdate
FROM public."gadm28_adm0" a, public."Fires_Europe_1_1_2001" f
WHERE a.ISO='FRA'
AND f.type = 'FinalArea'
AND st_intersects(a.geom, f.geom);