SELECT id_1 as area_id,geom FROM public.gadm28_adm1 WHERE name_1 = 'Lazio';

SELECT id_1 as area_id,geom 
FROM public.gadm28_adm1 as a
WHERE a.iso='ITA'
AND a.name_1 = 'Lazio';

SELECT ST_Band(rast,1) FROM public.globcov1000x1000 WHERE rid IN (10,25,60);

SELECT PostGIS_Full_Version();

SELECT id_1,SUM((ST_SummaryStats(a.rast, 1, true)).count)
FROM public.globcov1000x1000 AS a, public.gadm28_adm1 as b
WHERE ST_Intersects(b.geom,a.rast)
AND b.name_1 = 'Lazio'
GROUP BY id_1;

SELECT COUNT(f1.geom) as "Fires 2001" --, COUNT(f2.geom) as "Fires 2002"
FROM public."gadm28_adm0" a, public."Fires_Europe_1_1_2001" f1 --, public."Fires_Europe_1_1_2002" f2
WHERE a.iso='CMR'
AND ST_Within(f1.geom,a.geom);
--OR ST_Within(f2.geom,a.geom);
--GROUP BY f1.idate,f2.idate;

SELECT COUNT(f2.geom) as "Fires 2002"
FROM public."gadm28_adm0" a, public."Fires_Europe_1_1_2002" f2
WHERE a.iso='CMR'
AND ST_Within(f2.geom,a.geom);

SELECT COUNT(f1.geom) as "Fires 2001"
FROM public."gadm28_adm2" a, public."Fires_Europe_1_1_2001" f1 
WHERE a.iso='CMR'
AND a.name_1 = 'Centre'
AND ST_Within(f1.geom,a.geom);

--MOLTO LUNGA EVITARE QUERY SPATIAL DOPPIE
--MOLTO LUNGA EVITARE QUERY SPATIAL DOPPIE
--MOLTO LUNGA EVITARE QUERY SPATIAL DOPPIE
SELECT COUNT(f1.geom) as "Fires 2001",COUNT(f1.geom) as "Fires 2002"
FROM public."gadm28_adm2" a, public."Fires_Europe_1_1_2001" f1 , public."Fires_Europe_1_1_2002" f2
WHERE a.iso='CMR'
AND a.name_1 = 'Centre'
AND ST_Within(f1.geom,a.geom)
OR ST_Within(f2.geom,a.geom);

SELECT COUNT(f2.geom) as "Fires 2002"
FROM public."gadm28_adm2" a, public."Fires_Europe_1_2_2001" f2 
WHERE a.iso='CMR'
AND a.name_1 = 'Centre'
AND ST_Within(f2.geom,a.geom);

SELECT COUNT(f3.geom) as "Fires 2003"
FROM public."gadm28_adm2" a, public."Fires_Europe_1_3_2001" f3 
WHERE a.iso='CMR'
AND a.name_1 = 'Centre'
AND ST_Within(f3.geom,a.geom);

/*
WITH lazio AS(SELECT id_1 as area_id, geom as geometria FROM public.gadm28_adm1  WHERE name_1 = 'Lazio'),
b_stats AS (SELECT area_id, (stats).*
	    FROM(SELECT area_id, ST_SummaryStats(ST_Clip(rast,1,geometria)) As stats
		 FROM public.globcov1000x1000
		 INNER JOIN lazio
	         ON ST_Intersects(lazio.geometria, rast) 
    ) AS foo
)
-- finally summarize stats
SELECT area_id, SUM(count) As num_pixels
  ,MIN(min) As min_pval
  ,MAX(max) As max_pval
  ,SUM(mean*count)/SUM(count) As avg_pval
   FROM b_stats
WHERE count > 0
GROUP BY area_id
ORDER BY area_id;
*/

SELECT ST_Clip(rast,
	ST_Buffer(ST_Centroid(ST_Envelope(rast)), 20),
	false
	) 
FROM public.globcov1000x1000
WHERE rid = 4;

SELECT * 
FROM public.gadm28_adm2 as b
WHERE b.iso='CMR'
AND b.name_1 = 'Centre'
AND b.objectid =  10910;

SELECT ST_Intersects(clipper.geom, raster.rast)
FROM (SELECT *
      FROM public.gadm28_adm2 as b
      WHERE b.iso = 'CMR'
      AND b.name_1 = 'Centre'
      AND b.objectid =  10910) as clipper,
      public.globcov1000x1000 as raster;

WITH
-- feature of interest
    feat AS(SELECT id As area_id, geom FROM public.gadm28_adm2 as b
             WHERE b.iso='CMR'
	     AND b.name_1 = 'Centre'
	     AND b.objectid =  10910
             ),
-- clip all bands to boundaries
-- then get stats for these clipped regions
     b_stats AS(SELECT area_id, (stats).*
	        FROM (SELECT area_id, ST_SummaryStats(ST_Clip(rast,1,geom)) AS stats
		      FROM public.globcov1000x1000
		      INNER JOIN feat
		      ON ST_Intersects(feat.geom,rast)) AS foo)
-- finally summarize stats
SELECT area_id,
	SUM(count) as num_pixels,
	MIN(min) as min_pval,
	MAX(max) as max_pval,
	SUM(mean*count)/SUM(count) AS avg_pval
	FROM b_stats
WHERE count>0
	GROUP BY area_id
	ORDER BY area_id;

--CREATE TABLE poly_stat AS 
SELECT * 
FROM public.gadm28_adm2 as b
WHERE b.iso='CMR'
AND b.name_1 = 'Centre'
AND b.objectid =  10910;

SELECT rid, (stats).*
FROM (SELECT rid, ST_SummaryStats(rast) As stats
      FROM public.globcov1000x1000 --CROSS JOIN generate_series(1,3) As band
      WHERE rid=2) As foo;


