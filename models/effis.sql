-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.0-beta2
-- PostgreSQL version: 9.6
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: effis | type: DATABASE --
-- -- DROP DATABASE IF EXISTS effis;
-- CREATE DATABASE effis
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.UTF-8'
-- 	LC_CTYPE = 'en_US.UTF-8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: topology | type: SCHEMA --
-- DROP SCHEMA IF EXISTS topology CASCADE;
CREATE SCHEMA topology;
-- ddl-end --
ALTER SCHEMA topology OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,topology;
-- ddl-end --

-- object: postgis | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis CASCADE;
CREATE EXTENSION postgis
      WITH SCHEMA public
      VERSION '2.3.3';
-- ddl-end --
COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
-- ddl-end --

-- object: postgis_topology | type: EXTENSION --
-- DROP EXTENSION IF EXISTS postgis_topology CASCADE;
CREATE EXTENSION postgis_topology
      WITH SCHEMA topology
      VERSION '2.3.3';
-- ddl-end --
COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
-- ddl-end --

-- object: public."burntAreaForecast_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."burntAreaForecast_id_seq" CASCADE;
CREATE SEQUENCE public."burntAreaForecast_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."burntAreaForecast_id_seq" OWNER TO postgres;
-- ddl-end --

-- object: public."burntAreaForecast" | type: TABLE --
-- DROP TABLE IF EXISTS public."burntAreaForecast" CASCADE;
CREATE TABLE public."burntAreaForecast"(
	id integer NOT NULL DEFAULT nextval('"BurntAreaForecast_id_seq"'::regclass),
	date smallint,
	fire smallint,
	metadata smallint,
	shape geometry,
	time_horizon smallint,
	CONSTRAINT "BurntAreaForecast_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."burntAreaForecast" OWNER TO postgres;
-- ddl-end --

-- object: public."Choices_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."Choices_id_seq" CASCADE;
CREATE SEQUENCE public."Choices_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."Choices_id_seq" OWNER TO postgres;
-- ddl-end --

-- object: public.choice | type: TABLE --
-- DROP TABLE IF EXISTS public.choice CASCADE;
CREATE TABLE public.choice(
	id integer NOT NULL DEFAULT nextval('public."Choices_id_seq"'::regclass),
	type character varying(40),
	CONSTRAINT "Choices_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.choice OWNER TO postgres;
-- ddl-end --

-- object: public.country | type: TABLE --
-- DROP TABLE IF EXISTS public.country CASCADE;
CREATE TABLE public.country(
	name character varying(255),
	eu boolean,
	macro_area smallint,
	geom geometry,
	country_id character(3) NOT NULL,
	CONSTRAINT "Country_pk" PRIMARY KEY (country_id)

);
-- ddl-end --
ALTER TABLE public.country OWNER TO postgres;
-- ddl-end --

-- object: public.intensity | type: TABLE --
-- DROP TABLE IF EXISTS public.intensity CASCADE;
CREATE TABLE public.intensity(
	intensity_id integer NOT NULL,
	evo_id smallint,
	date date,
	map smallint,
	total double precision,
	average double precision,
	peak double precision,
	meta smallint,
	CONSTRAINT "Intensity_pk" PRIMARY KEY (intensity_id)

);
-- ddl-end --
ALTER TABLE public.intensity OWNER TO postgres;
-- ddl-end --

-- object: public.macroarea_macroarea_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.macroarea_macroarea_id_seq CASCADE;
CREATE SEQUENCE public.macroarea_macroarea_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.macroarea_macroarea_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.macroarea | type: TABLE --
-- DROP TABLE IF EXISTS public.macroarea CASCADE;
CREATE TABLE public.macroarea(
	macroarea_id integer NOT NULL DEFAULT nextval('public.macroarea_macroarea_id_seq'::regclass),
	name character varying(50),
	organization integer,
	CONSTRAINT macroarea_pk PRIMARY KEY (macroarea_id)

);
-- ddl-end --
ALTER TABLE public.macroarea OWNER TO postgres;
-- ddl-end --

-- object: public.hotspot_cluster | type: TABLE --
-- DROP TABLE IF EXISTS public.hotspot_cluster CASCADE;
CREATE TABLE public.hotspot_cluster(
	id integer NOT NULL,
	country smallint,
	province smallint,
	commune smallint,
	date date,
	area double precision,
	shape smallint,
	meta smallint,
	fire_id smallint,
	CONSTRAINT "HotSpotCluster_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.hotspot_cluster OWNER TO postgres;
-- ddl-end --

-- object: public."firePopulationDamageStatistic_FirePopulationDamageStatitic_id_s" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."firePopulationDamageStatistic_FirePopulationDamageStatitic_id_s" CASCADE;
CREATE SEQUENCE public."firePopulationDamageStatistic_FirePopulationDamageStatitic_id_s"
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."firePopulationDamageStatistic_FirePopulationDamageStatitic_id_s" OWNER TO postgres;
-- ddl-end --

-- object: public."fireEnvironmentalDamageStatistic_fireEnvironmentalDamageStatist" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."fireEnvironmentalDamageStatistic_fireEnvironmentalDamageStatist" CASCADE;
CREATE SEQUENCE public."fireEnvironmentalDamageStatistic_fireEnvironmentalDamageStatist"
	INCREMENT BY 1
	MINVALUE -2147483648
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."fireEnvironmentalDamageStatistic_fireEnvironmentalDamageStatist" OWNER TO postgres;
-- ddl-end --

-- object: public.emission | type: TABLE --
-- DROP TABLE IF EXISTS public.emission CASCADE;
CREATE TABLE public.emission(
	id integer NOT NULL,
	fire_id smallint,
	date date,
	chemical smallint,
	total double precision,
	average double precision,
	peak double precision,
	meta smallint,
	CONSTRAINT emission_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.emission OWNER TO postgres;
-- ddl-end --

-- object: public.organization_organization_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.organization_organization_id_seq CASCADE;
CREATE SEQUENCE public.organization_organization_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.organization_organization_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.organization | type: TABLE --
-- DROP TABLE IF EXISTS public.organization CASCADE;
CREATE TABLE public.organization(
	organization_id integer NOT NULL DEFAULT nextval('public.organization_organization_id_seq'::regclass),
	name character varying(25),
	CONSTRAINT organization_pk PRIMARY KEY (organization_id)

);
-- ddl-end --
ALTER TABLE public.organization OWNER TO postgres;
-- ddl-end --

-- object: public.emissionshapes | type: TABLE --
-- DROP TABLE IF EXISTS public.emissionshapes CASCADE;
CREATE TABLE public.emissionshapes(
	"emissionShapes_id" integer NOT NULL,
	emission_id integer,
	date date,
	shape geometry,
	altitude double precision,
	meta smallint,
	CONSTRAINT "emissionShapes_pk" PRIMARY KEY ("emissionShapes_id")

);
-- ddl-end --
ALTER TABLE public.emissionshapes OWNER TO postgres;
-- ddl-end --

-- object: public."fireEmissionStatistic_fireEmissionStatistic_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."fireEmissionStatistic_fireEmissionStatistic_id_seq" CASCADE;
CREATE SEQUENCE public."fireEmissionStatistic_fireEmissionStatistic_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."fireEmissionStatistic_fireEmissionStatistic_id_seq" OWNER TO postgres;
-- ddl-end --

-- object: public."fireEmissionStatistic" | type: TABLE --
-- DROP TABLE IF EXISTS public."fireEmissionStatistic" CASCADE;
CREATE TABLE public."fireEmissionStatistic"(
	"fireEmissionStatistic_id" integer NOT NULL DEFAULT nextval('public."fireEmissionStatistic_fireEmissionStatistic_id_seq"'::regclass),
	fire smallint,
	biomass double precision,
	ch4 double precision,
	co double precision,
	co2 double precision,
	ec double precision,
	nmhc double precision,
	nox double precision,
	oc double precision,
	pm double precision,
	pm10 double precision,
	pm2_5 double precision,
	voc double precision,
	CONSTRAINT "fireEmissionStatistic_pk" PRIMARY KEY ("fireEmissionStatistic_id")

);
-- ddl-end --
ALTER TABLE public."fireEmissionStatistic" OWNER TO postgres;
-- ddl-end --

-- object: public.chemical_chemical_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.chemical_chemical_id_seq CASCADE;
CREATE SEQUENCE public.chemical_chemical_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.chemical_chemical_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.chemical | type: TABLE --
-- DROP TABLE IF EXISTS public.chemical CASCADE;
CREATE TABLE public.chemical(
	chemical_id integer NOT NULL DEFAULT nextval('public.chemical_chemical_id_seq'::regclass),
	name character(80),
	CONSTRAINT chemical_pk PRIMARY KEY (chemical_id)

);
-- ddl-end --
ALTER TABLE public.chemical OWNER TO postgres;
-- ddl-end --

-- object: public.report_report_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.report_report_id_seq CASCADE;
CREATE SEQUENCE public.report_report_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.report_report_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.report | type: TABLE --
-- DROP TABLE IF EXISTS public.report CASCADE;
CREATE TABLE public.report(
	report_id integer NOT NULL DEFAULT nextval('public.report_report_id_seq'::regclass),
	data json,
	date date,
	filepath character varying(255),
	fire smallint,
	revision integer,
	CONSTRAINT report_pk PRIMARY KEY (report_id)

);
-- ddl-end --
ALTER TABLE public.report OWNER TO postgres;
-- ddl-end --

-- object: public.fire_fire_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.fire_fire_id_seq CASCADE;
CREATE SEQUENCE public.fire_fire_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.fire_fire_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.fire | type: TABLE --
-- DROP TABLE IF EXISTS public.fire CASCADE;
CREATE TABLE public.fire(
	fire_id integer NOT NULL DEFAULT nextval('public.fire_fire_id_seq'::regclass),
	admin_sublev_1 smallint,
	admin_sublev_2 smallint,
	admin_sublev_3 smallint,
	admin_sublev_4 smallint,
	updated date,
	area double precision,
	country smallint,
	detected date,
	meta smallint,
	CONSTRAINT fire_pk PRIMARY KEY (fire_id)

);
-- ddl-end --
ALTER TABLE public.fire OWNER TO postgres;
-- ddl-end --

-- object: public.grid_grid_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.grid_grid_id_seq CASCADE;
CREATE SEQUENCE public.grid_grid_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.grid_grid_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.grid | type: TABLE --
-- DROP TABLE IF EXISTS public.grid CASCADE;
CREATE TABLE public.grid(
	grid_id integer NOT NULL DEFAULT nextval('public.grid_grid_id_seq'::regclass),
	name character(100),
	"3d" smallint,
	CONSTRAINT "Grid_pk" PRIMARY KEY (grid_id)

);
-- ddl-end --
ALTER TABLE public.grid OWNER TO postgres;
-- ddl-end --

-- object: public."gridPoint_gridPoint_id_seq" | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public."gridPoint_gridPoint_id_seq" CASCADE;
CREATE SEQUENCE public."gridPoint_gridPoint_id_seq"
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public."gridPoint_gridPoint_id_seq" OWNER TO postgres;
-- ddl-end --

-- object: public."gridPoint" | type: TABLE --
-- DROP TABLE IF EXISTS public."gridPoint" CASCADE;
CREATE TABLE public."gridPoint"(
	"gridPoint_id" integer NOT NULL DEFAULT nextval('public."gridPoint_gridPoint_id_seq"'::regclass),
	grid character(100),
	point double precision,
	CONSTRAINT "gridPoint_pk" PRIMARY KEY ("gridPoint_id")

);
-- ddl-end --
ALTER TABLE public."gridPoint" OWNER TO postgres;
-- ddl-end --

-- object: public.wind_wind_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.wind_wind_id_seq CASCADE;
CREATE SEQUENCE public.wind_wind_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.wind_wind_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.wind | type: TABLE --
-- DROP TABLE IF EXISTS public.wind CASCADE;
CREATE TABLE public.wind(
	wind_id integer NOT NULL DEFAULT nextval('public.wind_wind_id_seq'::regclass),
	name character(100),
	grid integer,
	date date,
	CONSTRAINT wind_pk PRIMARY KEY (wind_id)

);
-- ddl-end --
ALTER TABLE public.wind OWNER TO postgres;
-- ddl-end --

-- object: public.windpoint_windpoint_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.windpoint_windpoint_id_seq CASCADE;
CREATE SEQUENCE public.windpoint_windpoint_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.windpoint_windpoint_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.windpoint | type: TABLE --
-- DROP TABLE IF EXISTS public.windpoint CASCADE;
CREATE TABLE public.windpoint(
	windpoint_id integer NOT NULL DEFAULT nextval('public.windpoint_windpoint_id_seq'::regclass),
	grid character(100),
	grid_point double precision,
	wind smallint,
	x double precision,
	y double precision,
	z double precision,
	CONSTRAINT windpoint_pk PRIMARY KEY (windpoint_id)

);
-- ddl-end --
ALTER TABLE public.windpoint OWNER TO postgres;
-- ddl-end --

-- object: public.temperature_temperature_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.temperature_temperature_id_seq CASCADE;
CREATE SEQUENCE public.temperature_temperature_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.temperature_temperature_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.temperature | type: TABLE --
-- DROP TABLE IF EXISTS public.temperature CASCADE;
CREATE TABLE public.temperature(
	temperature_id integer NOT NULL DEFAULT nextval('public.temperature_temperature_id_seq'::regclass),
	name character(100),
	grid smallint,
	date date,
	CONSTRAINT wind_id PRIMARY KEY (temperature_id)

);
-- ddl-end --
ALTER TABLE public.temperature OWNER TO postgres;
-- ddl-end --

-- object: public."firePopulationDamageStatistic" | type: TABLE --
-- DROP TABLE IF EXISTS public."firePopulationDamageStatistic" CASCADE;
CREATE TABLE public."firePopulationDamageStatistic"(
	"FirePopulationDamageStatitic_id" integer NOT NULL DEFAULT nextval('public."firePopulationDamageStatistic_FirePopulationDamageStatitic_id_s"'::regclass),
	burnt_area smallint,
	buffer_size integer,
	fire_builtup_area integer,
	fire_forecast smallint,
	fire_pop_avg integer,
	fire_pop_peak integer,
	fire_pop_total integer,
	on_forecast boolean,
	potential_builtup_area integer,
	potential_pop_avg integer,
	potential_pop_peak integer,
	potential_pop_total integer,
	CONSTRAINT "firePopulationDamageStatistic_pk" PRIMARY KEY ("FirePopulationDamageStatitic_id")

);
-- ddl-end --
ALTER TABLE public."firePopulationDamageStatistic" OWNER TO postgres;
-- ddl-end --

-- object: public."fireEnvironmentalDamageStatistic" | type: TABLE --
-- DROP TABLE IF EXISTS public."fireEnvironmentalDamageStatistic" CASCADE;
CREATE TABLE public."fireEnvironmentalDamageStatistic"(
	"fireEnvironmentalDamageStatistic_id" integer NOT NULL DEFAULT nextval('public."fireEnvironmentalDamageStatistic_fireEnvironmentalDamageStatist"'::regclass),
	burnt_area smallint,
	agricultural_area double precision,
	artificial_surface double precision,
	broad_leaved_forest double precision,
	coniferous double precision,
	mixed double precision,
	other_land_cover double precision,
	other_natural_landcover double precision,
	percentage_natura2k double precision,
	sclerophyllous double precision,
	transitional double precision,
	CONSTRAINT "fireEnvironmentalDamageStatistic_pk" PRIMARY KEY ("fireEnvironmentalDamageStatistic_id")

);
-- ddl-end --
ALTER TABLE public."fireEnvironmentalDamageStatistic" OWNER TO postgres;
-- ddl-end --

-- object: public.nuts_gid_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.nuts_gid_seq CASCADE;
CREATE SEQUENCE public.nuts_gid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.nuts_gid_seq OWNER TO postgres;
-- ddl-end --

-- object: public.nuts | type: TABLE --
-- DROP TABLE IF EXISTS public.nuts CASCADE;
CREATE TABLE public.nuts(
	gid integer NOT NULL DEFAULT nextval('public.nuts_gid_seq'::regclass),
	nuts_id character varying(14),
	stat_levl_ integer,
	shape_area numeric,
	shape_len numeric,
	geom geometry,
	CONSTRAINT nuts_pkey PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE public.nuts OWNER TO postgres;
-- ddl-end --

-- object: public.burnt_area_gid_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.burnt_area_gid_seq CASCADE;
CREATE SEQUENCE public.burnt_area_gid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.burnt_area_gid_seq OWNER TO postgres;
-- ddl-end --

-- object: public.burnt_area | type: TABLE --
-- DROP TABLE IF EXISTS public.burnt_area CASCADE;
CREATE TABLE public.burnt_area(
	gid integer NOT NULL DEFAULT nextval('public.burnt_area_gid_seq'::regclass),
	objectid numeric(10,0),
	id integer,
	country character varying(2),
	countryful character varying(100),
	province character varying(60),
	commune character varying(50),
	firedate character varying(10),
	area_ha integer,
	broadlea numeric,
	conifer numeric,
	mixed numeric,
	scleroph numeric,
	transit numeric,
	othernatlc numeric,
	agriareas numeric,
	artifsurf numeric,
	otherlc numeric,
	percna2k numeric,
	lastupdate character varying(10),
	class character varying(6),
	mic character varying(5),
	critech character varying(3),
	shape_area numeric,
	shape_len numeric,
	geom geometry,
	CONSTRAINT burnt_area_pkey PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE public.burnt_area OWNER TO postgres;
-- ddl-end --

-- object: public.hotspots_gid_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.hotspots_gid_seq CASCADE;
CREATE SEQUENCE public.hotspots_gid_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.hotspots_gid_seq OWNER TO postgres;
-- ddl-end --

-- object: public.hotspots | type: TABLE --
-- DROP TABLE IF EXISTS public.hotspots CASCADE;
CREATE TABLE public.hotspots(
	gid integer NOT NULL DEFAULT nextval('public.hotspots_gid_seq'::regclass),
	objectid numeric(10,0),
	hs_date character varying(10),
	hs_time character varying(5),
	conf integer,
	country character varying(2),
	province character varying(100),
	commune character varying(80),
	corine character varying(50),
	class character varying(4),
	lat numeric,
	lon numeric,
	critech character varying(3),
	geom geometry,
	CONSTRAINT hotspots_pkey PRIMARY KEY (gid)

);
-- ddl-end --
ALTER TABLE public.hotspots OWNER TO postgres;
-- ddl-end --

-- object: public.attributenuts_internal_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.attributenuts_internal_id_seq CASCADE;
CREATE SEQUENCE public.attributenuts_internal_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.attributenuts_internal_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.attributenuts | type: TABLE --
-- DROP TABLE IF EXISTS public.attributenuts CASCADE;
CREATE TABLE public.attributenuts(
	internal_id integer NOT NULL DEFAULT nextval('public.attributenuts_internal_id_seq'::regclass),
	cntr_code character varying(3),
	nut_id character(7),
	name_latin character varying(255),
	name_ascii character varying(255),
	CONSTRAINT internal_id_pk PRIMARY KEY (internal_id)

);
-- ddl-end --
ALTER TABLE public.attributenuts OWNER TO postgres;
-- ddl-end --

-- object: public.nuts_attr | type: MATERIALIZED VIEW --
-- DROP MATERIALIZED VIEW IF EXISTS public.nuts_attr CASCADE;
CREATE MATERIALIZED VIEW public.nuts_attr
AS 

SELECT a.gid,
    a.nuts_id,
    a.stat_levl_,
    a.geom,
    b.name_latin,
    b.name_ascii
   FROM nuts a,
    attributenuts b
  WHERE ((a.nuts_id)::bpchar = b.nut_id);
-- ddl-end --
ALTER MATERIALIZED VIEW public.nuts_attr OWNER TO postgres;
-- ddl-end --

-- object: public.countries | type: VIEW --
-- DROP VIEW IF EXISTS public.countries CASCADE;
CREATE VIEW public.countries
AS 

SELECT nuts_attr.gid,
    nuts_attr.nuts_id,
    nuts_attr.stat_levl_,
    nuts_attr.geom,
    nuts_attr.name_latin,
    nuts_attr.name_ascii
   FROM nuts_attr
  WHERE (nuts_attr.stat_levl_ = 0);
-- ddl-end --
ALTER VIEW public.countries OWNER TO postgres;
-- ddl-end --

-- object: public.macro_regions | type: VIEW --
-- DROP VIEW IF EXISTS public.macro_regions CASCADE;
CREATE VIEW public.macro_regions
AS 

SELECT nuts_attr.gid,
    nuts_attr.nuts_id,
    nuts_attr.stat_levl_,
    nuts_attr.geom,
    nuts_attr.name_latin,
    nuts_attr.name_ascii
   FROM nuts_attr
  WHERE (nuts_attr.stat_levl_ = 1);
-- ddl-end --
ALTER VIEW public.macro_regions OWNER TO postgres;
-- ddl-end --

-- object: public.regions | type: VIEW --
-- DROP VIEW IF EXISTS public.regions CASCADE;
CREATE VIEW public.regions
AS 

SELECT nuts_attr.gid,
    nuts_attr.nuts_id,
    nuts_attr.stat_levl_,
    nuts_attr.geom,
    nuts_attr.name_latin,
    nuts_attr.name_ascii
   FROM nuts_attr
  WHERE (nuts_attr.stat_levl_ = 2);
-- ddl-end --
ALTER VIEW public.regions OWNER TO postgres;
-- ddl-end --

-- object: public.provinces | type: VIEW --
-- DROP VIEW IF EXISTS public.provinces CASCADE;
CREATE VIEW public.provinces
AS 

SELECT nuts_attr.gid,
    nuts_attr.nuts_id,
    nuts_attr.stat_levl_,
    nuts_attr.geom,
    nuts_attr.name_latin,
    nuts_attr.name_ascii
   FROM nuts_attr
  WHERE (nuts_attr.stat_levl_ = 3);
-- ddl-end --
ALTER VIEW public.provinces OWNER TO postgres;
-- ddl-end --

-- object: "Organization_Country_fk" | type: CONSTRAINT --
-- ALTER TABLE public.country DROP CONSTRAINT IF EXISTS "Organization_Country_fk" CASCADE;
ALTER TABLE public.country ADD CONSTRAINT "Organization_Country_fk" FOREIGN KEY (macro_area)
REFERENCES public.organization (organization_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: emission_chemical_fk | type: CONSTRAINT --
-- ALTER TABLE public.emission DROP CONSTRAINT IF EXISTS emission_chemical_fk CASCADE;
ALTER TABLE public.emission ADD CONSTRAINT emission_chemical_fk FOREIGN KEY (chemical)
REFERENCES public.chemical (chemical_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "emissionShape_emission_fk" | type: CONSTRAINT --
-- ALTER TABLE public.emissionshapes DROP CONSTRAINT IF EXISTS "emissionShape_emission_fk" CASCADE;
ALTER TABLE public.emissionshapes ADD CONSTRAINT "emissionShape_emission_fk" FOREIGN KEY (emission_id)
REFERENCES public.emission (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: grid_gridpoint_fk | type: CONSTRAINT --
-- ALTER TABLE public."gridPoint" DROP CONSTRAINT IF EXISTS grid_gridpoint_fk CASCADE;
ALTER TABLE public."gridPoint" ADD CONSTRAINT grid_gridpoint_fk FOREIGN KEY ("gridPoint_id")
REFERENCES public.grid (grid_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: wind_grid_fk | type: CONSTRAINT --
-- ALTER TABLE public.wind DROP CONSTRAINT IF EXISTS wind_grid_fk CASCADE;
ALTER TABLE public.wind ADD CONSTRAINT wind_grid_fk FOREIGN KEY (wind_id)
REFERENCES public.grid (grid_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: windpoint_grid_fk | type: CONSTRAINT --
-- ALTER TABLE public.windpoint DROP CONSTRAINT IF EXISTS windpoint_grid_fk CASCADE;
ALTER TABLE public.windpoint ADD CONSTRAINT windpoint_grid_fk FOREIGN KEY (windpoint_id)
REFERENCES public.grid (grid_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: "FK_temperature_grid" | type: CONSTRAINT --
-- ALTER TABLE public.temperature DROP CONSTRAINT IF EXISTS "FK_temperature_grid" CASCADE;
ALTER TABLE public.temperature ADD CONSTRAINT "FK_temperature_grid" FOREIGN KEY (temperature_id)
REFERENCES public.grid (grid_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


