--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;



CREATE OR REPLACE function public.schema_bulk_drop()
    RETURNS boolean
    LANGUAGE plpgsql
AS $body$
DECLARE
    cur1 CURSOR FOR
        SELECT nspname FROM pg_namespace where nspname NOT LIKE '%pg_%' and nspname NOT IN ('public','information_schema','version');
    nsname_rec RECORD;
    dropsql text;
BEGIN
    OPEN cur1;
    LOOP
        FETCH cur1 INTO nsname_rec;
        EXIT WHEN NOT FOUND;
        RAISE INFO '%',nsname_rec.nspname;
        dropsql := 'DROP SCHEMA IF EXISTS '||nsname_rec.nspname|| '  CASCADE;';
        EXECUTE dropsql;
    END LOOP;
    CLOSE cur1;
    RETURN true;
END;
$body$
    VOLATILE
    COST 100;

SELECT public.schema_bulk_drop();
DROP FUNCTION public.schema_bulk_drop();
--
-- Roles
--
DROP SCHEMA IF EXISTS sample CASCADE;

ALTER ROLE sample WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
ALTER ROLE sample SET search_path TO 'sample', 'public';


--
-- Role memberships
--



--
-- PostgreSQL database cluster dump complete
--

