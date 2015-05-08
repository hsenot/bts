CREATE TABLE zone_substation_load
(
  gid serial NOT NULL,
  zs_name character varying,
  distributor character varying,
  date_time character varying,
  ts timestamp without time zone,
  load_mw character varying,
  load_mvar character varying,
  CONSTRAINT zone_substation_load_pkey PRIMARY KEY (gid)
);