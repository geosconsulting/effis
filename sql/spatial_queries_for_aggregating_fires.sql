SELECT a.iso, a.name_engli, f.idate, f.type, f.fdate
FROM public."gadm28_adm0" a , public."Fires_Europe_1_1_2001" f
WHERE a.iso = 'CMR'
AND f.type = 'FinalArea'
AND ST_Intersects(a.geom,f.geom)

SELECT COUNT(f.geom) as "Number of Fires", SUM(ST_Area(f.geom)) as "Summed Area Fires for Cameroon"
FROM public."Fires_Europe_1_1_2001" f, public."gadm28_adm0" a
WHERE a.iso='CMR' 
AND ST_Within(f.geom,a.geom) 
GROUP BY f.type;

SELECT *
FROM public.globcov1000x1000
LIMIT 50;

SELECT (md).*, (bmd).* 
FROM (SELECT ST_Metadata(rast) AS md, 
             ST_BandMetadata(rast) AS bmd 
      FROM globcov1000x1000 LIMIT 1
      ) foo;