SELECT a.iso, a.name_iso, a.name_local, f.idate, f.type, f.fdate
FROM public.countries_country a , modis_viirs.fires_1_1_2001 f
WHERE a.iso = 'CMR'
AND f.type = 'FinalArea'
AND ST_Intersects(a.geom,f.geom);

SELECT COUNT(f.geom) as "Number of Fires", SUM(ST_Area(f.geom)) as "Summed Area Fires for Cameroon"
FROM modis_viirs.fires_1_1_2001 f, public.countries_country a
WHERE a.iso='CMR' 
AND ST_Within(f.geom,a.geom) 
GROUP BY f.type;

SELECT *
FROM public.glc_1x1k 
LIMIT 50;

SELECT (md).*, (bmd).* 
FROM (SELECT ST_Metadata(rast) AS md, 
             ST_BandMetadata(rast) AS bmd 
      FROM glc_1x1k LIMIT 1
      ) foo;