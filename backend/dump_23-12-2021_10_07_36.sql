--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(30) NOT NULL,
    level character varying(30) NOT NULL,
    declared_permission boolean NOT NULL,
    operate_from timestamp with time zone,
    operate_to timestamp with time zone,
    supervisor_id bigint,
    agency_id character varying(30)
);


ALTER TABLE public.account_user OWNER TO postgres;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO postgres;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_groups_id_seq OWNER TO postgres;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_user_groups_id_seq OWNED BY public.account_user_groups.id;


--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_id_seq OWNER TO postgres;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_user_id_seq OWNED BY public.account_user.id;


--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO postgres;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_user_user_permissions_id_seq OWNED BY public.account_user_user_permissions.id;


--
-- Name: agency_agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agency_agency (
    id character varying(30) NOT NULL,
    name character varying(100),
    level character varying(30) NOT NULL,
    completed_declare boolean NOT NULL,
    sup_agency_id character varying(30)
);


ALTER TABLE public.agency_agency OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: citizen_citizen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citizen_citizen (
    id bigint NOT NULL,
    name character varying(80) NOT NULL,
    dob date NOT NULL,
    gender character varying(30) NOT NULL,
    ethnic character varying(30) NOT NULL,
    declarer_id bigint NOT NULL,
    educational character varying(30) NOT NULL,
    religion character varying(40),
    address_line1 character varying(255) NOT NULL,
    address_line2 character varying(255) NOT NULL,
    home_town character varying(255) NOT NULL,
    id_number character varying(20),
    occupations character varying(255) NOT NULL,
    village_id_id character varying(30)
);


ALTER TABLE public.citizen_citizen OWNER TO postgres;

--
-- Name: citizen_citizen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citizen_citizen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citizen_citizen_id_seq OWNER TO postgres;

--
-- Name: citizen_citizen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citizen_citizen_id_seq OWNED BY public.citizen_citizen.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.account_user_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_groups ALTER COLUMN id SET DEFAULT nextval('public.account_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.account_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: citizen_citizen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citizen_citizen ALTER COLUMN id SET DEFAULT nextval('public.citizen_citizen_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, level, declared_permission, operate_from, operate_to, supervisor_id, agency_id) FROM stdin;
2506	123	2021-12-22 16:01:34+00	f				f	t	2021-12-22 16:01:29+00	01	1	t	2021-12-22 16:02:01.827814+00	2021-12-22 16:01:48+00	3	01
2	pbkdf2_sha256$260000$M0KHsPME4WfyiHPKwk0Brg$QdzaHY02SRfILhWA6l9fJyMIyqKx7QXTWgaP/6Wd360=	2021-12-17 15:06:27.243247+00	t				t	t	2021-11-17 15:22:38.092956+00	admin	0	t	2021-11-17 15:22:38.28132+00	\N	\N	\N
2507	123	\N	f				f	t	2021-12-22 16:05:58.226122+00	0101	2	t	2021-12-22 16:05:58.226641+00	\N	2506	0101
2508	123	\N	f				f	t	2021-12-22 16:05:58.393969+00	010101	3	t	2021-12-22 16:05:58.394212+00	\N	2506	010101
2509	123	\N	f				f	t	2021-12-22 16:05:58.55547+00	01010101	4	t	2021-12-22 16:05:58.555759+00	\N	2506	01010101
2510	123	\N	f				f	t	2021-12-22 16:05:58.716551+00	01010102	4	t	2021-12-22 16:05:58.716784+00	\N	2506	01010102
2511	123	\N	f				f	t	2021-12-22 16:05:58.876736+00	010102	3	t	2021-12-22 16:05:58.877184+00	\N	2506	010102
2512	123	\N	f				f	t	2021-12-22 16:05:59.053039+00	01010201	4	t	2021-12-22 16:05:59.053345+00	\N	2506	01010201
2513	123	\N	f				f	t	2021-12-22 16:05:59.227632+00	01010202	4	t	2021-12-22 16:05:59.227867+00	\N	2506	01010202
2514	123	\N	f				f	t	2021-12-22 16:05:59.398626+00	010103	3	t	2021-12-22 16:05:59.398862+00	\N	2506	010103
2515	123	\N	f				f	t	2021-12-22 16:05:59.561361+00	01010301	4	t	2021-12-22 16:05:59.561599+00	\N	2506	01010301
2516	123	\N	f				f	t	2021-12-22 16:05:59.727533+00	01010302	4	t	2021-12-22 16:05:59.727766+00	\N	2506	01010302
2517	123	\N	f				f	t	2021-12-22 16:05:59.886671+00	0102	2	t	2021-12-22 16:05:59.886966+00	\N	2506	0102
2518	123	\N	f				f	t	2021-12-22 16:06:00.052487+00	010201	3	t	2021-12-22 16:06:00.052721+00	\N	2506	010201
2519	123	\N	f				f	t	2021-12-22 16:06:00.223428+00	01020101	4	t	2021-12-22 16:06:00.223663+00	\N	2506	01020101
2520	123	\N	f				f	t	2021-12-22 16:06:00.403357+00	01020102	4	t	2021-12-22 16:06:00.403654+00	\N	2506	01020102
2521	123	\N	f				f	t	2021-12-22 16:06:00.567068+00	010202	3	t	2021-12-22 16:06:00.567545+00	\N	2506	010202
2522	123	\N	f				f	t	2021-12-22 16:06:00.740668+00	01020201	4	t	2021-12-22 16:06:00.740934+00	\N	2506	01020201
2523	123	\N	f				f	t	2021-12-22 16:06:00.91557+00	01020202	4	t	2021-12-22 16:06:00.915807+00	\N	2506	01020202
2524	123	\N	f				f	t	2021-12-22 16:06:01.079395+00	010203	3	t	2021-12-22 16:06:01.079628+00	\N	2506	010203
2525	123	\N	f				f	t	2021-12-22 16:06:01.245531+00	01020301	4	t	2021-12-22 16:06:01.245771+00	\N	2506	01020301
2526	123	\N	f				f	t	2021-12-22 16:06:01.413266+00	01020302	4	t	2021-12-22 16:06:01.413523+00	\N	2506	01020302
2527	123	\N	f				f	t	2021-12-22 16:06:01.57537+00	0103	2	t	2021-12-22 16:06:01.575609+00	\N	2506	0103
2528	123	\N	f				f	t	2021-12-22 16:06:01.741597+00	010301	3	t	2021-12-22 16:06:01.741903+00	\N	2506	010301
2529	123	\N	f				f	t	2021-12-22 16:06:01.901024+00	01030101	4	t	2021-12-22 16:06:01.901253+00	\N	2506	01030101
2530	123	\N	f				f	t	2021-12-22 16:06:02.06558+00	01030102	4	t	2021-12-22 16:06:02.065819+00	\N	2506	01030102
2531	123	\N	f				f	t	2021-12-22 16:06:02.232062+00	010302	3	t	2021-12-22 16:06:02.232295+00	\N	2506	010302
2532	123	\N	f				f	t	2021-12-22 16:06:02.408145+00	01030201	4	t	2021-12-22 16:06:02.408388+00	\N	2506	01030201
2533	123	\N	f				f	t	2021-12-22 16:06:02.572142+00	01030202	4	t	2021-12-22 16:06:02.572384+00	\N	2506	01030202
2534	123	\N	f				f	t	2021-12-22 16:06:02.734875+00	010303	3	t	2021-12-22 16:06:02.735118+00	\N	2506	010303
2535	123	\N	f				f	t	2021-12-22 16:06:02.895617+00	01030301	4	t	2021-12-22 16:06:02.895859+00	\N	2506	01030301
2536	123	\N	f				f	t	2021-12-22 16:06:03.057835+00	01030302	4	t	2021-12-22 16:06:03.058072+00	\N	2506	01030302
2537	123	\N	f				f	t	2021-12-22 16:06:03.224624+00	02	1	t	2021-12-22 16:06:03.224866+00	\N	3	02
2538	123	\N	f				f	t	2021-12-22 16:06:03.388007+00	0201	2	t	2021-12-22 16:06:03.388288+00	\N	2537	0201
2539	123	\N	f				f	t	2021-12-22 16:06:03.549137+00	020101	3	t	2021-12-22 16:06:03.549378+00	\N	2537	020101
2540	123	\N	f				f	t	2021-12-22 16:06:03.711154+00	02010101	4	t	2021-12-22 16:06:03.711395+00	\N	2537	02010101
2541	123	\N	f				f	t	2021-12-22 16:06:03.872567+00	02010102	4	t	2021-12-22 16:06:03.872848+00	\N	2537	02010102
2542	123	\N	f				f	t	2021-12-22 16:06:04.04768+00	020102	3	t	2021-12-22 16:06:04.047936+00	\N	2537	020102
2543	123	\N	f				f	t	2021-12-22 16:06:04.218802+00	02010201	4	t	2021-12-22 16:06:04.219036+00	\N	2537	02010201
2544	123	\N	f				f	t	2021-12-22 16:06:04.380958+00	02010202	4	t	2021-12-22 16:06:04.381226+00	\N	2537	02010202
2545	123	\N	f				f	t	2021-12-22 16:06:04.54153+00	020103	3	t	2021-12-22 16:06:04.541764+00	\N	2537	020103
2546	123	\N	f				f	t	2021-12-22 16:06:04.710564+00	02010301	4	t	2021-12-22 16:06:04.710848+00	\N	2537	02010301
2547	123	\N	f				f	t	2021-12-22 16:06:04.872909+00	02010302	4	t	2021-12-22 16:06:04.873458+00	\N	2537	02010302
2548	123	\N	f				f	t	2021-12-22 16:06:05.042399+00	0202	2	t	2021-12-22 16:06:05.042637+00	\N	2537	0202
2549	123	\N	f				f	t	2021-12-22 16:06:05.209355+00	020201	3	t	2021-12-22 16:06:05.209594+00	\N	2537	020201
2550	123	\N	f				f	t	2021-12-22 16:06:05.374932+00	02020101	4	t	2021-12-22 16:06:05.375168+00	\N	2537	02020101
2551	123	\N	f				f	t	2021-12-22 16:06:05.536356+00	02020102	4	t	2021-12-22 16:06:05.536594+00	\N	2537	02020102
2552	123	\N	f				f	t	2021-12-22 16:06:05.697043+00	020202	3	t	2021-12-22 16:06:05.697278+00	\N	2537	020202
2553	123	\N	f				f	t	2021-12-22 16:06:05.858426+00	02020201	4	t	2021-12-22 16:06:05.858657+00	\N	2537	02020201
2554	123	\N	f				f	t	2021-12-22 16:06:06.019564+00	02020202	4	t	2021-12-22 16:06:06.019807+00	\N	2537	02020202
2555	123	\N	f				f	t	2021-12-22 16:06:06.188032+00	020203	3	t	2021-12-22 16:06:06.188278+00	\N	2537	020203
2556	123	\N	f				f	t	2021-12-22 16:06:06.348872+00	02020301	4	t	2021-12-22 16:06:06.349107+00	\N	2537	02020301
2557	123	\N	f				f	t	2021-12-22 16:06:06.511479+00	02020302	4	t	2021-12-22 16:06:06.511739+00	\N	2537	02020302
2558	123	\N	f				f	t	2021-12-22 16:06:06.671707+00	0203	2	t	2021-12-22 16:06:06.671942+00	\N	2537	0203
2559	123	\N	f				f	t	2021-12-22 16:06:06.842928+00	020301	3	t	2021-12-22 16:06:06.843168+00	\N	2537	020301
2560	123	\N	f				f	t	2021-12-22 16:06:07.004036+00	02030101	4	t	2021-12-22 16:06:07.004275+00	\N	2537	02030101
2561	123	\N	f				f	t	2021-12-22 16:06:07.167708+00	02030102	4	t	2021-12-22 16:06:07.167944+00	\N	2537	02030102
2562	123	\N	f				f	t	2021-12-22 16:06:07.338803+00	020302	3	t	2021-12-22 16:06:07.339039+00	\N	2537	020302
2563	123	\N	f				f	t	2021-12-22 16:06:07.501169+00	02030201	4	t	2021-12-22 16:06:07.50141+00	\N	2537	02030201
2564	123	\N	f				f	t	2021-12-22 16:06:07.660942+00	02030202	4	t	2021-12-22 16:06:07.661174+00	\N	2537	02030202
2565	123	\N	f				f	t	2021-12-22 16:06:07.822753+00	020303	3	t	2021-12-22 16:06:07.823011+00	\N	2537	020303
2566	123	\N	f				f	t	2021-12-22 16:06:07.984748+00	02030301	4	t	2021-12-22 16:06:07.984981+00	\N	2537	02030301
2567	123	\N	f				f	t	2021-12-22 16:06:08.149285+00	02030302	4	t	2021-12-22 16:06:08.149517+00	\N	2537	02030302
2568	123	\N	f				f	t	2021-12-22 16:06:08.310611+00	03	1	t	2021-12-22 16:06:08.310852+00	\N	3	03
2569	123	\N	f				f	t	2021-12-22 16:06:08.472555+00	0301	2	t	2021-12-22 16:06:08.472844+00	\N	2568	0301
2570	123	\N	f				f	t	2021-12-22 16:06:08.632909+00	030101	3	t	2021-12-22 16:06:08.63324+00	\N	2568	030101
2571	123	\N	f				f	t	2021-12-22 16:06:08.801646+00	03010101	4	t	2021-12-22 16:06:08.801884+00	\N	2568	03010101
2572	123	\N	f				f	t	2021-12-22 16:06:08.963015+00	03010102	4	t	2021-12-22 16:06:08.963292+00	\N	2568	03010102
2573	123	\N	f				f	t	2021-12-22 16:06:09.129729+00	030102	3	t	2021-12-22 16:06:09.130004+00	\N	2568	030102
2574	123	\N	f				f	t	2021-12-22 16:06:09.29254+00	03010201	4	t	2021-12-22 16:06:09.292783+00	\N	2568	03010201
2575	123	\N	f				f	t	2021-12-22 16:06:09.455298+00	03010202	4	t	2021-12-22 16:06:09.455534+00	\N	2568	03010202
2576	123	\N	f				f	t	2021-12-22 16:06:09.614293+00	030103	3	t	2021-12-22 16:06:09.614529+00	\N	2568	030103
2577	123	\N	f				f	t	2021-12-22 16:06:09.778785+00	03010301	4	t	2021-12-22 16:06:09.779021+00	\N	2568	03010301
2578	123	\N	f				f	t	2021-12-22 16:06:09.938959+00	03010302	4	t	2021-12-22 16:06:09.939255+00	\N	2568	03010302
2579	123	\N	f				f	t	2021-12-22 16:06:10.100539+00	0302	2	t	2021-12-22 16:06:10.100775+00	\N	2568	0302
2580	123	\N	f				f	t	2021-12-22 16:06:10.263555+00	030201	3	t	2021-12-22 16:06:10.263796+00	\N	2568	030201
2581	123	\N	f				f	t	2021-12-22 16:06:10.427292+00	03020101	4	t	2021-12-22 16:06:10.427529+00	\N	2568	03020101
2582	123	\N	f				f	t	2021-12-22 16:06:10.588546+00	03020102	4	t	2021-12-22 16:06:10.588787+00	\N	2568	03020102
2583	123	\N	f				f	t	2021-12-22 16:06:10.751047+00	030202	3	t	2021-12-22 16:06:10.751308+00	\N	2568	030202
2584	123	\N	f				f	t	2021-12-22 16:06:10.910448+00	03020201	4	t	2021-12-22 16:06:10.91068+00	\N	2568	03020201
2585	123	\N	f				f	t	2021-12-22 16:06:11.074504+00	03020202	4	t	2021-12-22 16:06:11.074742+00	\N	2568	03020202
2586	123	\N	f				f	t	2021-12-22 16:06:11.241637+00	030203	3	t	2021-12-22 16:06:11.241879+00	\N	2568	030203
2587	123	\N	f				f	t	2021-12-22 16:06:11.403554+00	03020301	4	t	2021-12-22 16:06:11.40381+00	\N	2568	03020301
2588	123	\N	f				f	t	2021-12-22 16:06:11.563985+00	03020302	4	t	2021-12-22 16:06:11.564221+00	\N	2568	03020302
2589	123	\N	f				f	t	2021-12-22 16:06:11.724262+00	0303	2	t	2021-12-22 16:06:11.724497+00	\N	2568	0303
2590	123	\N	f				f	t	2021-12-22 16:06:11.885749+00	030301	3	t	2021-12-22 16:06:11.885987+00	\N	2568	030301
2591	123	\N	f				f	t	2021-12-22 16:06:12.047458+00	03030101	4	t	2021-12-22 16:06:12.047741+00	\N	2568	03030101
2592	123	\N	f				f	t	2021-12-22 16:06:12.215348+00	03030102	4	t	2021-12-22 16:06:12.215592+00	\N	2568	03030102
2593	123	\N	f				f	t	2021-12-22 16:06:12.374628+00	030302	3	t	2021-12-22 16:06:12.374862+00	\N	2568	030302
2594	123	\N	f				f	t	2021-12-22 16:06:12.539012+00	03030201	4	t	2021-12-22 16:06:12.539509+00	\N	2568	03030201
2595	123	\N	f				f	t	2021-12-22 16:06:12.70321+00	03030202	4	t	2021-12-22 16:06:12.703448+00	\N	2568	03030202
2596	123	\N	f				f	t	2021-12-22 16:06:12.875179+00	030303	3	t	2021-12-22 16:06:12.875634+00	\N	2568	030303
2597	123	\N	f				f	t	2021-12-22 16:06:13.038423+00	03030301	4	t	2021-12-22 16:06:13.038658+00	\N	2568	03030301
2598	123	\N	f				f	t	2021-12-22 16:06:13.203925+00	03030302	4	t	2021-12-22 16:06:13.20438+00	\N	2568	03030302
2599	123	\N	f				f	t	2021-12-22 16:06:13.367778+00	04	1	t	2021-12-22 16:06:13.368012+00	\N	3	04
2600	123	\N	f				f	t	2021-12-22 16:06:13.529583+00	0401	2	t	2021-12-22 16:06:13.529824+00	\N	2599	0401
2601	123	\N	f				f	t	2021-12-22 16:06:13.688758+00	040101	3	t	2021-12-22 16:06:13.688994+00	\N	2599	040101
2602	123	\N	f				f	t	2021-12-22 16:06:13.850716+00	04010101	4	t	2021-12-22 16:06:13.850951+00	\N	2599	04010101
2603	123	\N	f				f	t	2021-12-22 16:06:14.017101+00	04010102	4	t	2021-12-22 16:06:14.017341+00	\N	2599	04010102
2604	123	\N	f				f	t	2021-12-22 16:06:14.180542+00	040102	3	t	2021-12-22 16:06:14.180782+00	\N	2599	040102
2605	123	\N	f				f	t	2021-12-22 16:06:14.344271+00	04010201	4	t	2021-12-22 16:06:14.344524+00	\N	2599	04010201
2606	123	\N	f				f	t	2021-12-22 16:06:14.505492+00	04010202	4	t	2021-12-22 16:06:14.505723+00	\N	2599	04010202
2607	123	\N	f				f	t	2021-12-22 16:06:14.667793+00	040103	3	t	2021-12-22 16:06:14.668023+00	\N	2599	040103
2608	123	\N	f				f	t	2021-12-22 16:06:14.827956+00	04010301	4	t	2021-12-22 16:06:14.828187+00	\N	2599	04010301
2609	123	\N	f				f	t	2021-12-22 16:06:14.989648+00	04010302	4	t	2021-12-22 16:06:14.989879+00	\N	2599	04010302
2610	123	\N	f				f	t	2021-12-22 16:06:15.153693+00	0402	2	t	2021-12-22 16:06:15.154262+00	\N	2599	0402
2611	123	\N	f				f	t	2021-12-22 16:06:15.322612+00	040201	3	t	2021-12-22 16:06:15.322898+00	\N	2599	040201
2612	123	\N	f				f	t	2021-12-22 16:06:15.482874+00	04020101	4	t	2021-12-22 16:06:15.483108+00	\N	2599	04020101
2613	123	\N	f				f	t	2021-12-22 16:06:15.650567+00	04020102	4	t	2021-12-22 16:06:15.650799+00	\N	2599	04020102
2614	123	\N	f				f	t	2021-12-22 16:06:15.81125+00	040202	3	t	2021-12-22 16:06:15.811485+00	\N	2599	040202
2615	123	\N	f				f	t	2021-12-22 16:06:15.973897+00	04020201	4	t	2021-12-22 16:06:15.974419+00	\N	2599	04020201
2616	123	\N	f				f	t	2021-12-22 16:06:16.139265+00	04020202	4	t	2021-12-22 16:06:16.139498+00	\N	2599	04020202
2617	123	\N	f				f	t	2021-12-22 16:06:16.309711+00	040203	3	t	2021-12-22 16:06:16.31013+00	\N	2599	040203
2618	123	\N	f				f	t	2021-12-22 16:06:16.475121+00	04020301	4	t	2021-12-22 16:06:16.475358+00	\N	2599	04020301
2619	123	\N	f				f	t	2021-12-22 16:06:16.635954+00	04020302	4	t	2021-12-22 16:06:16.636187+00	\N	2599	04020302
2620	123	\N	f				f	t	2021-12-22 16:06:16.797182+00	0403	2	t	2021-12-22 16:06:16.797437+00	\N	2599	0403
2621	123	\N	f				f	t	2021-12-22 16:06:16.968622+00	040301	3	t	2021-12-22 16:06:16.968862+00	\N	2599	040301
2622	123	\N	f				f	t	2021-12-22 16:06:17.145302+00	04030101	4	t	2021-12-22 16:06:17.145563+00	\N	2599	04030101
2623	123	\N	f				f	t	2021-12-22 16:06:17.318418+00	04030102	4	t	2021-12-22 16:06:17.318809+00	\N	2599	04030102
2624	123	\N	f				f	t	2021-12-22 16:06:17.503419+00	040302	3	t	2021-12-22 16:06:17.503693+00	\N	2599	040302
2625	123	\N	f				f	t	2021-12-22 16:06:17.691951+00	04030201	4	t	2021-12-22 16:06:17.692203+00	\N	2599	04030201
2626	123	\N	f				f	t	2021-12-22 16:06:17.874975+00	04030202	4	t	2021-12-22 16:06:17.875237+00	\N	2599	04030202
2627	123	\N	f				f	t	2021-12-22 16:06:18.051494+00	040303	3	t	2021-12-22 16:06:18.051742+00	\N	2599	040303
2628	123	\N	f				f	t	2021-12-22 16:06:18.233015+00	04030301	4	t	2021-12-22 16:06:18.233265+00	\N	2599	04030301
2629	123	\N	f				f	t	2021-12-22 16:06:18.406767+00	04030302	4	t	2021-12-22 16:06:18.407006+00	\N	2599	04030302
2630	123	\N	f				f	t	2021-12-22 16:06:18.571937+00	05	1	t	2021-12-22 16:06:18.572185+00	\N	3	05
2631	123	\N	f				f	t	2021-12-22 16:06:18.757996+00	0501	2	t	2021-12-22 16:06:18.758366+00	\N	2630	0501
2632	123	\N	f				f	t	2021-12-22 16:06:18.944221+00	050101	3	t	2021-12-22 16:06:18.944508+00	\N	2630	050101
2633	123	\N	f				f	t	2021-12-22 16:06:19.129809+00	05010101	4	t	2021-12-22 16:06:19.130092+00	\N	2630	05010101
2634	123	\N	f				f	t	2021-12-22 16:06:19.318193+00	05010102	4	t	2021-12-22 16:06:19.318536+00	\N	2630	05010102
2635	123	\N	f				f	t	2021-12-22 16:06:19.504914+00	050102	3	t	2021-12-22 16:06:19.505165+00	\N	2630	050102
2636	123	\N	f				f	t	2021-12-22 16:06:19.679287+00	05010201	4	t	2021-12-22 16:06:19.679764+00	\N	2630	05010201
2637	123	\N	f				f	t	2021-12-22 16:06:19.848262+00	05010202	4	t	2021-12-22 16:06:19.848497+00	\N	2630	05010202
2638	123	\N	f				f	t	2021-12-22 16:06:20.011163+00	050103	3	t	2021-12-22 16:06:20.011402+00	\N	2630	050103
2639	123	\N	f				f	t	2021-12-22 16:06:20.174145+00	05010301	4	t	2021-12-22 16:06:20.174436+00	\N	2630	05010301
2640	123	\N	f				f	t	2021-12-22 16:06:20.343769+00	05010302	4	t	2021-12-22 16:06:20.344011+00	\N	2630	05010302
2641	123	\N	f				f	t	2021-12-22 16:06:20.5145+00	0502	2	t	2021-12-22 16:06:20.514756+00	\N	2630	0502
2642	123	\N	f				f	t	2021-12-22 16:06:20.685109+00	050201	3	t	2021-12-22 16:06:20.685352+00	\N	2630	050201
2643	123	\N	f				f	t	2021-12-22 16:06:20.845662+00	05020101	4	t	2021-12-22 16:06:20.845895+00	\N	2630	05020101
2644	123	\N	f				f	t	2021-12-22 16:06:21.010865+00	05020102	4	t	2021-12-22 16:06:21.01127+00	\N	2630	05020102
2645	123	\N	f				f	t	2021-12-22 16:06:21.191728+00	050202	3	t	2021-12-22 16:06:21.192012+00	\N	2630	050202
2646	123	\N	f				f	t	2021-12-22 16:06:21.376626+00	05020201	4	t	2021-12-22 16:06:21.376901+00	\N	2630	05020201
2647	123	\N	f				f	t	2021-12-22 16:06:21.556731+00	05020202	4	t	2021-12-22 16:06:21.557114+00	\N	2630	05020202
2648	123	\N	f				f	t	2021-12-22 16:06:21.73714+00	050203	3	t	2021-12-22 16:06:21.737383+00	\N	2630	050203
2649	123	\N	f				f	t	2021-12-22 16:06:21.904603+00	05020301	4	t	2021-12-22 16:06:21.904855+00	\N	2630	05020301
2650	123	\N	f				f	t	2021-12-22 16:06:22.080675+00	05020302	4	t	2021-12-22 16:06:22.080958+00	\N	2630	05020302
2651	123	\N	f				f	t	2021-12-22 16:06:22.248347+00	0503	2	t	2021-12-22 16:06:22.248587+00	\N	2630	0503
2652	123	\N	f				f	t	2021-12-22 16:06:22.411932+00	050301	3	t	2021-12-22 16:06:22.412163+00	\N	2630	050301
2653	123	\N	f				f	t	2021-12-22 16:06:22.575493+00	05030101	4	t	2021-12-22 16:06:22.575745+00	\N	2630	05030101
2654	123	\N	f				f	t	2021-12-22 16:06:22.757715+00	05030102	4	t	2021-12-22 16:06:22.757968+00	\N	2630	05030102
2655	123	\N	f				f	t	2021-12-22 16:06:22.940248+00	050302	3	t	2021-12-22 16:06:22.940509+00	\N	2630	050302
2656	123	\N	f				f	t	2021-12-22 16:06:23.121145+00	05030201	4	t	2021-12-22 16:06:23.121405+00	\N	2630	05030201
2657	123	\N	f				f	t	2021-12-22 16:06:23.299708+00	05030202	4	t	2021-12-22 16:06:23.299945+00	\N	2630	05030202
2658	123	\N	f				f	t	2021-12-22 16:06:23.472664+00	050303	3	t	2021-12-22 16:06:23.473085+00	\N	2630	050303
2659	123	\N	f				f	t	2021-12-22 16:06:23.642714+00	05030301	4	t	2021-12-22 16:06:23.642955+00	\N	2630	05030301
2660	123	\N	f				f	t	2021-12-22 16:06:23.80692+00	05030302	4	t	2021-12-22 16:06:23.80716+00	\N	2630	05030302
2661	123	\N	f				f	t	2021-12-22 16:06:23.972615+00	06	1	t	2021-12-22 16:06:23.972926+00	\N	3	06
2662	123	\N	f				f	t	2021-12-22 16:06:24.139634+00	0601	2	t	2021-12-22 16:06:24.139868+00	\N	2661	0601
2663	123	\N	f				f	t	2021-12-22 16:06:24.305371+00	060101	3	t	2021-12-22 16:06:24.305886+00	\N	2661	060101
2664	123	\N	f				f	t	2021-12-22 16:06:24.479403+00	06010101	4	t	2021-12-22 16:06:24.479738+00	\N	2661	06010101
2665	123	\N	f				f	t	2021-12-22 16:06:24.654202+00	06010102	4	t	2021-12-22 16:06:24.654497+00	\N	2661	06010102
2666	123	\N	f				f	t	2021-12-22 16:06:24.824392+00	060102	3	t	2021-12-22 16:06:24.824653+00	\N	2661	060102
2667	123	\N	f				f	t	2021-12-22 16:06:25.00096+00	06010201	4	t	2021-12-22 16:06:25.001274+00	\N	2661	06010201
2668	123	\N	f				f	t	2021-12-22 16:06:25.18147+00	06010202	4	t	2021-12-22 16:06:25.181736+00	\N	2661	06010202
2669	123	\N	f				f	t	2021-12-22 16:06:25.363183+00	060103	3	t	2021-12-22 16:06:25.363453+00	\N	2661	060103
2670	123	\N	f				f	t	2021-12-22 16:06:25.540368+00	06010301	4	t	2021-12-22 16:06:25.540647+00	\N	2661	06010301
2671	123	\N	f				f	t	2021-12-22 16:06:25.706051+00	06010302	4	t	2021-12-22 16:06:25.706349+00	\N	2661	06010302
2672	123	\N	f				f	t	2021-12-22 16:06:25.872171+00	0602	2	t	2021-12-22 16:06:25.872419+00	\N	2661	0602
2673	123	\N	f				f	t	2021-12-22 16:06:26.039183+00	060201	3	t	2021-12-22 16:06:26.039607+00	\N	2661	060201
2674	123	\N	f				f	t	2021-12-22 16:06:26.225204+00	06020101	4	t	2021-12-22 16:06:26.225493+00	\N	2661	06020101
2675	123	\N	f				f	t	2021-12-22 16:06:26.404038+00	06020102	4	t	2021-12-22 16:06:26.404285+00	\N	2661	06020102
2676	123	\N	f				f	t	2021-12-22 16:06:26.592428+00	060202	3	t	2021-12-22 16:06:26.592686+00	\N	2661	060202
2677	123	\N	f				f	t	2021-12-22 16:06:26.779389+00	06020201	4	t	2021-12-22 16:06:26.779642+00	\N	2661	06020201
2678	123	\N	f				f	t	2021-12-22 16:06:26.971655+00	06020202	4	t	2021-12-22 16:06:26.972+00	\N	2661	06020202
2679	123	\N	f				f	t	2021-12-22 16:06:27.15359+00	060203	3	t	2021-12-22 16:06:27.153837+00	\N	2661	060203
2680	123	\N	f				f	t	2021-12-22 16:06:27.349207+00	06020301	4	t	2021-12-22 16:06:27.349531+00	\N	2661	06020301
2681	123	\N	f				f	t	2021-12-22 16:06:27.528014+00	06020302	4	t	2021-12-22 16:06:27.528279+00	\N	2661	06020302
2682	123	\N	f				f	t	2021-12-22 16:06:27.718119+00	0603	2	t	2021-12-22 16:06:27.718564+00	\N	2661	0603
2683	123	\N	f				f	t	2021-12-22 16:06:27.910462+00	060301	3	t	2021-12-22 16:06:27.910891+00	\N	2661	060301
2684	123	\N	f				f	t	2021-12-22 16:06:28.099012+00	06030101	4	t	2021-12-22 16:06:28.099375+00	\N	2661	06030101
2685	123	\N	f				f	t	2021-12-22 16:06:28.280269+00	06030102	4	t	2021-12-22 16:06:28.280513+00	\N	2661	06030102
2686	123	\N	f				f	t	2021-12-22 16:06:28.44531+00	060302	3	t	2021-12-22 16:06:28.445548+00	\N	2661	060302
2687	123	\N	f				f	t	2021-12-22 16:06:28.607404+00	06030201	4	t	2021-12-22 16:06:28.607652+00	\N	2661	06030201
2688	123	\N	f				f	t	2021-12-22 16:06:28.774073+00	06030202	4	t	2021-12-22 16:06:28.774384+00	\N	2661	06030202
2689	123	\N	f				f	t	2021-12-22 16:06:28.939654+00	060303	3	t	2021-12-22 16:06:28.939977+00	\N	2661	060303
2690	123	\N	f				f	t	2021-12-22 16:06:29.124347+00	06030301	4	t	2021-12-22 16:06:29.124852+00	\N	2661	06030301
2691	123	\N	f				f	t	2021-12-22 16:06:29.305156+00	06030302	4	t	2021-12-22 16:06:29.305563+00	\N	2661	06030302
2692	123	\N	f				f	t	2021-12-22 16:06:29.481388+00	07	1	t	2021-12-22 16:06:29.48163+00	\N	3	07
2693	123	\N	f				f	t	2021-12-22 16:06:29.654184+00	0701	2	t	2021-12-22 16:06:29.654525+00	\N	2692	0701
2694	123	\N	f				f	t	2021-12-22 16:06:29.82642+00	070101	3	t	2021-12-22 16:06:29.826702+00	\N	2692	070101
2695	123	\N	f				f	t	2021-12-22 16:06:29.995807+00	07010101	4	t	2021-12-22 16:06:29.996229+00	\N	2692	07010101
2696	123	\N	f				f	t	2021-12-22 16:06:30.158217+00	07010102	4	t	2021-12-22 16:06:30.15856+00	\N	2692	07010102
2697	123	\N	f				f	t	2021-12-22 16:06:30.330506+00	070102	3	t	2021-12-22 16:06:30.330745+00	\N	2692	070102
2698	123	\N	f				f	t	2021-12-22 16:06:30.504041+00	07010201	4	t	2021-12-22 16:06:30.504394+00	\N	2692	07010201
2699	123	\N	f				f	t	2021-12-22 16:06:30.690818+00	07010202	4	t	2021-12-22 16:06:30.691106+00	\N	2692	07010202
2700	123	\N	f				f	t	2021-12-22 16:06:30.883487+00	070103	3	t	2021-12-22 16:06:30.883782+00	\N	2692	070103
2701	123	\N	f				f	t	2021-12-22 16:06:31.071015+00	07010301	4	t	2021-12-22 16:06:31.071383+00	\N	2692	07010301
2702	123	\N	f				f	t	2021-12-22 16:06:31.259471+00	07010302	4	t	2021-12-22 16:06:31.260073+00	\N	2692	07010302
2703	123	\N	f				f	t	2021-12-22 16:06:31.443482+00	0702	2	t	2021-12-22 16:06:31.443727+00	\N	2692	0702
2704	123	\N	f				f	t	2021-12-22 16:06:31.633738+00	070201	3	t	2021-12-22 16:06:31.633994+00	\N	2692	070201
2705	123	\N	f				f	t	2021-12-22 16:06:31.827392+00	07020101	4	t	2021-12-22 16:06:31.827879+00	\N	2692	07020101
2706	123	\N	f				f	t	2021-12-22 16:06:32.011772+00	07020102	4	t	2021-12-22 16:06:32.01218+00	\N	2692	07020102
2707	123	\N	f				f	t	2021-12-22 16:06:32.190108+00	070202	3	t	2021-12-22 16:06:32.190417+00	\N	2692	070202
2708	123	\N	f				f	t	2021-12-22 16:06:32.371124+00	07020201	4	t	2021-12-22 16:06:32.371396+00	\N	2692	07020201
2709	123	\N	f				f	t	2021-12-22 16:06:32.551403+00	07020202	4	t	2021-12-22 16:06:32.55165+00	\N	2692	07020202
2710	123	\N	f				f	t	2021-12-22 16:06:32.740709+00	070203	3	t	2021-12-22 16:06:32.741048+00	\N	2692	070203
2711	123	\N	f				f	t	2021-12-22 16:06:32.908554+00	07020301	4	t	2021-12-22 16:06:32.908862+00	\N	2692	07020301
2712	123	\N	f				f	t	2021-12-22 16:06:33.075126+00	07020302	4	t	2021-12-22 16:06:33.075366+00	\N	2692	07020302
2713	123	\N	f				f	t	2021-12-22 16:06:33.24069+00	0703	2	t	2021-12-22 16:06:33.24106+00	\N	2692	0703
2714	123	\N	f				f	t	2021-12-22 16:06:33.406505+00	070301	3	t	2021-12-22 16:06:33.406887+00	\N	2692	070301
2715	123	\N	f				f	t	2021-12-22 16:06:33.572559+00	07030101	4	t	2021-12-22 16:06:33.572875+00	\N	2692	07030101
2716	123	\N	f				f	t	2021-12-22 16:06:33.737041+00	07030102	4	t	2021-12-22 16:06:33.737279+00	\N	2692	07030102
2717	123	\N	f				f	t	2021-12-22 16:06:33.903652+00	070302	3	t	2021-12-22 16:06:33.903903+00	\N	2692	070302
2718	123	\N	f				f	t	2021-12-22 16:06:34.07557+00	07030201	4	t	2021-12-22 16:06:34.075809+00	\N	2692	07030201
2719	123	\N	f				f	t	2021-12-22 16:06:34.240904+00	07030202	4	t	2021-12-22 16:06:34.24117+00	\N	2692	07030202
2720	123	\N	f				f	t	2021-12-22 16:06:34.409063+00	070303	3	t	2021-12-22 16:06:34.409305+00	\N	2692	070303
2721	123	\N	f				f	t	2021-12-22 16:06:34.5754+00	07030301	4	t	2021-12-22 16:06:34.575643+00	\N	2692	07030301
2722	123	\N	f				f	t	2021-12-22 16:06:34.740565+00	07030302	4	t	2021-12-22 16:06:34.740915+00	\N	2692	07030302
2723	123	\N	f				f	t	2021-12-22 16:06:34.906475+00	08	1	t	2021-12-22 16:06:34.907005+00	\N	3	08
2724	123	\N	f				f	t	2021-12-22 16:06:35.070852+00	0801	2	t	2021-12-22 16:06:35.071081+00	\N	2723	0801
2725	123	\N	f				f	t	2021-12-22 16:06:35.235239+00	080101	3	t	2021-12-22 16:06:35.235468+00	\N	2723	080101
2726	123	\N	f				f	t	2021-12-22 16:06:35.403523+00	08010101	4	t	2021-12-22 16:06:35.403778+00	\N	2723	08010101
2727	123	\N	f				f	t	2021-12-22 16:06:35.569066+00	08010102	4	t	2021-12-22 16:06:35.569545+00	\N	2723	08010102
2728	123	\N	f				f	t	2021-12-22 16:06:35.751424+00	080102	3	t	2021-12-22 16:06:35.751783+00	\N	2723	080102
2729	123	\N	f				f	t	2021-12-22 16:06:35.934087+00	08010201	4	t	2021-12-22 16:06:35.934435+00	\N	2723	08010201
2730	123	\N	f				f	t	2021-12-22 16:06:36.120779+00	08010202	4	t	2021-12-22 16:06:36.121162+00	\N	2723	08010202
2731	123	\N	f				f	t	2021-12-22 16:06:36.317173+00	080103	3	t	2021-12-22 16:06:36.31753+00	\N	2723	080103
2732	123	\N	f				f	t	2021-12-22 16:06:36.508856+00	08010301	4	t	2021-12-22 16:06:36.509257+00	\N	2723	08010301
2733	123	\N	f				f	t	2021-12-22 16:06:36.707056+00	08010302	4	t	2021-12-22 16:06:36.707452+00	\N	2723	08010302
2734	123	\N	f				f	t	2021-12-22 16:06:36.900128+00	0802	2	t	2021-12-22 16:06:36.900487+00	\N	2723	0802
2735	123	\N	f				f	t	2021-12-22 16:06:37.088025+00	080201	3	t	2021-12-22 16:06:37.088274+00	\N	2723	080201
2736	123	\N	f				f	t	2021-12-22 16:06:37.272805+00	08020101	4	t	2021-12-22 16:06:37.273089+00	\N	2723	08020101
2737	123	\N	f				f	t	2021-12-22 16:06:37.457346+00	08020102	4	t	2021-12-22 16:06:37.457609+00	\N	2723	08020102
2738	123	\N	f				f	t	2021-12-22 16:06:37.641212+00	080202	3	t	2021-12-22 16:06:37.641532+00	\N	2723	080202
2739	123	\N	f				f	t	2021-12-22 16:06:37.825967+00	08020201	4	t	2021-12-22 16:06:37.826467+00	\N	2723	08020201
2740	123	\N	f				f	t	2021-12-22 16:06:38.013597+00	08020202	4	t	2021-12-22 16:06:38.013985+00	\N	2723	08020202
2741	123	\N	f				f	t	2021-12-22 16:06:38.197264+00	080203	3	t	2021-12-22 16:06:38.197745+00	\N	2723	080203
2742	123	\N	f				f	t	2021-12-22 16:06:38.384467+00	08020301	4	t	2021-12-22 16:06:38.384716+00	\N	2723	08020301
2743	123	\N	f				f	t	2021-12-22 16:06:38.56938+00	08020302	4	t	2021-12-22 16:06:38.569628+00	\N	2723	08020302
2744	123	\N	f				f	t	2021-12-22 16:06:38.757272+00	0803	2	t	2021-12-22 16:06:38.757805+00	\N	2723	0803
2745	123	\N	f				f	t	2021-12-22 16:06:38.94677+00	080301	3	t	2021-12-22 16:06:38.947018+00	\N	2723	080301
2746	123	\N	f				f	t	2021-12-22 16:06:39.131544+00	08030101	4	t	2021-12-22 16:06:39.131788+00	\N	2723	08030101
2747	123	\N	f				f	t	2021-12-22 16:06:39.322169+00	08030102	4	t	2021-12-22 16:06:39.322557+00	\N	2723	08030102
2748	123	\N	f				f	t	2021-12-22 16:06:39.507006+00	080302	3	t	2021-12-22 16:06:39.507263+00	\N	2723	080302
2749	123	\N	f				f	t	2021-12-22 16:06:39.687672+00	08030201	4	t	2021-12-22 16:06:39.687965+00	\N	2723	08030201
2750	123	\N	f				f	t	2021-12-22 16:06:39.862727+00	08030202	4	t	2021-12-22 16:06:39.863107+00	\N	2723	08030202
2751	123	\N	f				f	t	2021-12-22 16:06:40.044558+00	080303	3	t	2021-12-22 16:06:40.044822+00	\N	2723	080303
2752	123	\N	f				f	t	2021-12-22 16:06:40.237428+00	08030301	4	t	2021-12-22 16:06:40.237696+00	\N	2723	08030301
2753	123	\N	f				f	t	2021-12-22 16:06:40.430945+00	08030302	4	t	2021-12-22 16:06:40.431278+00	\N	2723	08030302
2754	123	\N	f				f	t	2021-12-22 16:06:40.618358+00	09	1	t	2021-12-22 16:06:40.61868+00	\N	3	09
2755	123	\N	f				f	t	2021-12-22 16:06:40.803953+00	0901	2	t	2021-12-22 16:06:40.804258+00	\N	2754	0901
2756	123	\N	f				f	t	2021-12-22 16:06:40.98902+00	090101	3	t	2021-12-22 16:06:40.989401+00	\N	2754	090101
2757	123	\N	f				f	t	2021-12-22 16:06:41.174797+00	09010101	4	t	2021-12-22 16:06:41.175127+00	\N	2754	09010101
2758	123	\N	f				f	t	2021-12-22 16:06:41.359899+00	09010102	4	t	2021-12-22 16:06:41.360202+00	\N	2754	09010102
2759	123	\N	f				f	t	2021-12-22 16:06:41.547848+00	090102	3	t	2021-12-22 16:06:41.548099+00	\N	2754	090102
2760	123	\N	f				f	t	2021-12-22 16:06:41.737224+00	09010201	4	t	2021-12-22 16:06:41.737805+00	\N	2754	09010201
2761	123	\N	f				f	t	2021-12-22 16:06:41.928607+00	09010202	4	t	2021-12-22 16:06:41.928991+00	\N	2754	09010202
2762	123	\N	f				f	t	2021-12-22 16:06:42.112448+00	090103	3	t	2021-12-22 16:06:42.112711+00	\N	2754	090103
2763	123	\N	f				f	t	2021-12-22 16:06:42.296063+00	09010301	4	t	2021-12-22 16:06:42.296318+00	\N	2754	09010301
2764	123	\N	f				f	t	2021-12-22 16:06:42.481476+00	09010302	4	t	2021-12-22 16:06:42.481738+00	\N	2754	09010302
2765	123	\N	f				f	t	2021-12-22 16:06:42.672499+00	0902	2	t	2021-12-22 16:06:42.672761+00	\N	2754	0902
2766	123	\N	f				f	t	2021-12-22 16:06:42.85622+00	090201	3	t	2021-12-22 16:06:42.856478+00	\N	2754	090201
2767	123	\N	f				f	t	2021-12-22 16:06:43.048339+00	09020101	4	t	2021-12-22 16:06:43.048794+00	\N	2754	09020101
2768	123	\N	f				f	t	2021-12-22 16:06:43.236541+00	09020102	4	t	2021-12-22 16:06:43.236861+00	\N	2754	09020102
2769	123	\N	f				f	t	2021-12-22 16:06:43.421942+00	090202	3	t	2021-12-22 16:06:43.422198+00	\N	2754	090202
2770	123	\N	f				f	t	2021-12-22 16:06:43.605245+00	09020201	4	t	2021-12-22 16:06:43.605511+00	\N	2754	09020201
2771	123	\N	f				f	t	2021-12-22 16:06:43.791513+00	09020202	4	t	2021-12-22 16:06:43.79177+00	\N	2754	09020202
2772	123	\N	f				f	t	2021-12-22 16:06:43.977925+00	090203	3	t	2021-12-22 16:06:43.978334+00	\N	2754	090203
2773	123	\N	f				f	t	2021-12-22 16:06:44.164285+00	09020301	4	t	2021-12-22 16:06:44.164558+00	\N	2754	09020301
2774	123	\N	f				f	t	2021-12-22 16:06:44.347754+00	09020302	4	t	2021-12-22 16:06:44.348052+00	\N	2754	09020302
2775	123	\N	f				f	t	2021-12-22 16:06:44.530983+00	0903	2	t	2021-12-22 16:06:44.531445+00	\N	2754	0903
2776	123	\N	f				f	t	2021-12-22 16:06:44.712361+00	090301	3	t	2021-12-22 16:06:44.712616+00	\N	2754	090301
2777	123	\N	f				f	t	2021-12-22 16:06:44.898166+00	09030101	4	t	2021-12-22 16:06:44.898473+00	\N	2754	09030101
2778	123	\N	f				f	t	2021-12-22 16:06:45.080342+00	09030102	4	t	2021-12-22 16:06:45.080596+00	\N	2754	09030102
2779	123	\N	f				f	t	2021-12-22 16:06:45.275822+00	090302	3	t	2021-12-22 16:06:45.27608+00	\N	2754	090302
2780	123	\N	f				f	t	2021-12-22 16:06:45.460353+00	09030201	4	t	2021-12-22 16:06:45.460624+00	\N	2754	09030201
2781	123	\N	f				f	t	2021-12-22 16:06:45.641645+00	09030202	4	t	2021-12-22 16:06:45.641902+00	\N	2754	09030202
2782	123	\N	f				f	t	2021-12-22 16:06:45.824445+00	090303	3	t	2021-12-22 16:06:45.824803+00	\N	2754	090303
2783	123	\N	f				f	t	2021-12-22 16:06:45.999394+00	09030301	4	t	2021-12-22 16:06:45.99965+00	\N	2754	09030301
2784	123	\N	f				f	t	2021-12-22 16:06:46.191416+00	09030302	4	t	2021-12-22 16:06:46.191668+00	\N	2754	09030302
2785	123	\N	f				f	t	2021-12-22 16:06:46.369693+00	10	1	t	2021-12-22 16:06:46.369943+00	\N	3	10
2786	123	\N	f				f	t	2021-12-22 16:06:46.547181+00	1001	2	t	2021-12-22 16:06:46.547434+00	\N	2785	1001
2787	123	\N	f				f	t	2021-12-22 16:06:46.727431+00	100101	3	t	2021-12-22 16:06:46.727687+00	\N	2785	100101
2788	123	\N	f				f	t	2021-12-22 16:06:46.903923+00	10010101	4	t	2021-12-22 16:06:46.904174+00	\N	2785	10010101
2789	123	\N	f				f	t	2021-12-22 16:06:47.088313+00	10010102	4	t	2021-12-22 16:06:47.088589+00	\N	2785	10010102
2790	123	\N	f				f	t	2021-12-22 16:06:47.27657+00	100102	3	t	2021-12-22 16:06:47.276823+00	\N	2785	100102
2791	123	\N	f				f	t	2021-12-22 16:06:47.453602+00	10010201	4	t	2021-12-22 16:06:47.453854+00	\N	2785	10010201
2792	123	\N	f				f	t	2021-12-22 16:06:47.629756+00	10010202	4	t	2021-12-22 16:06:47.629989+00	\N	2785	10010202
2793	123	\N	f				f	t	2021-12-22 16:06:47.81281+00	100103	3	t	2021-12-22 16:06:47.813044+00	\N	2785	100103
2794	123	\N	f				f	t	2021-12-22 16:06:47.986843+00	10010301	4	t	2021-12-22 16:06:47.98709+00	\N	2785	10010301
2795	123	\N	f				f	t	2021-12-22 16:06:48.164456+00	10010302	4	t	2021-12-22 16:06:48.164764+00	\N	2785	10010302
2796	123	\N	f				f	t	2021-12-22 16:06:48.340125+00	1002	2	t	2021-12-22 16:06:48.340357+00	\N	2785	1002
2797	123	\N	f				f	t	2021-12-22 16:06:48.51652+00	100201	3	t	2021-12-22 16:06:48.51677+00	\N	2785	100201
2798	123	\N	f				f	t	2021-12-22 16:06:48.692744+00	10020101	4	t	2021-12-22 16:06:48.692991+00	\N	2785	10020101
2799	123	\N	f				f	t	2021-12-22 16:06:48.8723+00	10020102	4	t	2021-12-22 16:06:48.872734+00	\N	2785	10020102
2800	123	\N	f				f	t	2021-12-22 16:06:49.055346+00	100202	3	t	2021-12-22 16:06:49.055589+00	\N	2785	100202
2801	123	\N	f				f	t	2021-12-22 16:06:49.247376+00	10020201	4	t	2021-12-22 16:06:49.247822+00	\N	2785	10020201
2802	123	\N	f				f	t	2021-12-22 16:06:49.422776+00	10020202	4	t	2021-12-22 16:06:49.423041+00	\N	2785	10020202
2803	123	\N	f				f	t	2021-12-22 16:06:49.601805+00	100203	3	t	2021-12-22 16:06:49.602045+00	\N	2785	100203
2804	123	\N	f				f	t	2021-12-22 16:06:49.777728+00	10020301	4	t	2021-12-22 16:06:49.777979+00	\N	2785	10020301
2805	123	\N	f				f	t	2021-12-22 16:06:49.954123+00	10020302	4	t	2021-12-22 16:06:49.954464+00	\N	2785	10020302
2806	123	\N	f				f	t	2021-12-22 16:06:50.130466+00	1003	2	t	2021-12-22 16:06:50.130715+00	\N	2785	1003
2807	123	\N	f				f	t	2021-12-22 16:06:50.31817+00	100301	3	t	2021-12-22 16:06:50.318493+00	\N	2785	100301
2808	123	\N	f				f	t	2021-12-22 16:06:50.493792+00	10030101	4	t	2021-12-22 16:06:50.494041+00	\N	2785	10030101
2809	123	\N	f				f	t	2021-12-22 16:06:50.670578+00	10030102	4	t	2021-12-22 16:06:50.670814+00	\N	2785	10030102
2810	123	\N	f				f	t	2021-12-22 16:06:50.861608+00	100302	3	t	2021-12-22 16:06:50.861903+00	\N	2785	100302
2811	123	\N	f				f	t	2021-12-22 16:06:51.0376+00	10030201	4	t	2021-12-22 16:06:51.037919+00	\N	2785	10030201
2812	123	\N	f				f	t	2021-12-22 16:06:51.22048+00	10030202	4	t	2021-12-22 16:06:51.220829+00	\N	2785	10030202
2813	123	\N	f				f	t	2021-12-22 16:06:51.399858+00	100303	3	t	2021-12-22 16:06:51.400108+00	\N	2785	100303
2814	123	\N	f				f	t	2021-12-22 16:06:51.574397+00	10030301	4	t	2021-12-22 16:06:51.574639+00	\N	2785	10030301
2815	123	\N	f				f	t	2021-12-22 16:06:51.752797+00	10030302	4	t	2021-12-22 16:06:51.753052+00	\N	2785	10030302
3	pbkdf2_sha256$260000$5COhjFrLiAuqaNLMLBhh8K$Kqp/yoTynel49p6+S8I9PUG6V5qVSVEUAdt77l2zlQ4=	2021-12-22 16:34:34.607264+00	f				t	t	2021-11-20 09:40:20+00	00	0	t	2021-11-20 09:46:39.695888+00	2021-11-20 09:44:45+00	\N	00
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: agency_agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agency_agency (id, name, level, completed_declare, sup_agency_id) FROM stdin;
01	Thành phố Hà Nội	1	f	00
0101	Quận Ba Đình	2	f	01
010101	Phường Phúc Xá	3	f	0101
01010101	Thôn 1	4	f	010101
01010102	Thôn 2	4	f	010101
010102	Phường Trúc Bạch	3	f	0101
01010201	Thôn 1	4	f	010102
01010202	Thôn 2	4	f	010102
010103	Phường Vĩnh Phúc	3	f	0101
01010301	Thôn 1	4	f	010103
01010302	Thôn 2	4	f	010103
0102	Quận Hoàn Kiếm	2	f	01
010201	Phường Phúc Tân	3	f	0102
01020101	Thôn 1	4	f	010201
01020102	Thôn 2	4	f	010201
010202	Phường Đồng Xuân	3	f	0102
01020201	Thôn 1	4	f	010202
01020202	Thôn 2	4	f	010202
010203	Phường Hàng Mã	3	f	0102
01020301	Thôn 1	4	f	010203
01020302	Thôn 2	4	f	010203
0103	Quận Tây Hồ	2	f	01
010301	Phường Phú Thượng	3	f	0103
01030101	Thôn 1	4	f	010301
01030102	Thôn 2	4	f	010301
010302	Phường Nhật Tân	3	f	0103
01030201	Thôn 1	4	f	010302
01030202	Thôn 2	4	f	010302
010303	Phường Tứ Liên	3	f	0103
01030301	Thôn 1	4	f	010303
01030302	Thôn 2	4	f	010303
02	Tỉnh Hà Giang	1	f	00
0201	Thành phố Hà Giang	2	f	02
020101	Phường Quang Trung	3	f	0201
02010101	Thôn 1	4	f	020101
02010102	Thôn 2	4	f	020101
020102	Phường Trần Phú	3	f	0201
02010201	Thôn 1	4	f	020102
02010202	Thôn 2	4	f	020102
020103	Phường Ngọc Hà	3	f	0201
02010301	Thôn 1	4	f	020103
02010302	Thôn 2	4	f	020103
0202	Huyện Đồng Văn	2	f	02
020201	Thị trấn Phó Bảng	3	f	0202
02020101	Thôn 1	4	f	020201
02020102	Thôn 2	4	f	020201
020202	Xã Lũng Cú	3	f	0202
02020201	Thôn 1	4	f	020202
02020202	Thôn 2	4	f	020202
020203	Xã Má Lé	3	f	0202
02020301	Thôn 1	4	f	020203
02020302	Thôn 2	4	f	020203
0203	Huyện Mèo Vạc	2	f	02
020301	Thị trấn Mèo Vạc	3	f	0203
02030101	Thôn 1	4	f	020301
02030102	Thôn 2	4	f	020301
020302	Xã Thượng Phùng	3	f	0203
02030201	Thôn 1	4	f	020302
02030202	Thôn 2	4	f	020302
020303	Xã Pải Lủng	3	f	0203
02030301	Thôn 1	4	f	020303
02030302	Thôn 2	4	f	020303
03	Tỉnh Cao Bằng	1	f	00
0301	Thành phố Cao Bằng	2	f	03
030101	Phường Sông Hiến	3	f	0301
03010101	Thôn 1	4	f	030101
03010102	Thôn 2	4	f	030101
030102	Phường Sông Bằng	3	f	0301
03010201	Thôn 1	4	f	030102
03010202	Thôn 2	4	f	030102
030103	Phường Hợp Giang	3	f	0301
03010301	Thôn 1	4	f	030103
03010302	Thôn 2	4	f	030103
0302	Huyện Bảo Lâm	2	f	03
030201	Thị trấn Pác Miầu	3	f	0302
03020101	Thôn 1	4	f	030201
03020102	Thôn 2	4	f	030201
030202	Xã Đức Hạnh	3	f	0302
03020201	Thôn 1	4	f	030202
03020202	Thôn 2	4	f	030202
030203	Xã Lý Bôn	3	f	0302
03020301	Thôn 1	4	f	030203
03020302	Thôn 2	4	f	030203
0303	Huyện Bảo Lạc	2	f	03
030301	Thị trấn Bảo Lạc	3	f	0303
03030101	Thôn 1	4	f	030301
03030102	Thôn 2	4	f	030301
030302	Xã Cốc Pàng	3	f	0303
03030201	Thôn 1	4	f	030302
03030202	Thôn 2	4	f	030302
030303	Xã Thượng Hà	3	f	0303
03030301	Thôn 1	4	f	030303
03030302	Thôn 2	4	f	030303
04	Tỉnh Bắc Kạn	1	f	00
0401	Thành Phố Bắc Kạn	2	f	04
040101	Phường Nguyễn Thị Minh Khai	3	f	0401
04010101	Thôn 1	4	f	040101
04010102	Thôn 2	4	f	040101
040102	Phường Sông Cầu	3	f	0401
04010201	Thôn 1	4	f	040102
04010202	Thôn 2	4	f	040102
040103	Phường Đức Xuân	3	f	0401
04010301	Thôn 1	4	f	040103
04010302	Thôn 2	4	f	040103
0402	Huyện Pác Nặm	2	f	04
040201	Xã Bằng Thành	3	f	0402
04020101	Thôn 1	4	f	040201
04020102	Thôn 2	4	f	040201
040202	Xã Nhạn Môn	3	f	0402
04020201	Thôn 1	4	f	040202
04020202	Thôn 2	4	f	040202
040203	Xã Bộc Bố	3	f	0402
04020301	Thôn 1	4	f	040203
04020302	Thôn 2	4	f	040203
0403	Huyện Ba Bể	2	f	04
040301	Thị trấn Chợ Rã	3	f	0403
04030101	Thôn 1	4	f	040301
04030102	Thôn 2	4	f	040301
040302	Xã Bành Trạch	3	f	0403
04030201	Thôn 1	4	f	040302
04030202	Thôn 2	4	f	040302
040303	Xã Phúc Lộc	3	f	0403
04030301	Thôn 1	4	f	040303
04030302	Thôn 2	4	f	040303
05	Tỉnh Tuyên Quang	1	f	00
0501	Thành phố Tuyên Quang	2	f	05
050101	Phường Phan Thiết	3	f	0501
05010101	Thôn 1	4	f	050101
05010102	Thôn 2	4	f	050101
050102	Phường Minh Xuân	3	f	0501
05010201	Thôn 1	4	f	050102
05010202	Thôn 2	4	f	050102
050103	Phường Tân Quang	3	f	0501
05010301	Thôn 1	4	f	050103
05010302	Thôn 2	4	f	050103
0502	Huyện Lâm Bình	2	f	05
050201	Xã Phúc Yên	3	f	0502
05020101	Thôn 1	4	f	050201
05020102	Thôn 2	4	f	050201
050202	Xã Xuân Lập	3	f	0502
05020201	Thôn 1	4	f	050202
05020202	Thôn 2	4	f	050202
050203	Xã Khuôn Hà	3	f	0502
05020301	Thôn 1	4	f	050203
05020302	Thôn 2	4	f	050203
0503	Huyện Na Hang	2	f	05
050301	Thị trấn Na Hang	3	f	0503
05030101	Thôn 1	4	f	050301
05030102	Thôn 2	4	f	050301
050302	Xã Sinh Long	3	f	0503
05030201	Thôn 1	4	f	050302
05030202	Thôn 2	4	f	050302
050303	Xã Thượng Giáp	3	f	0503
05030301	Thôn 1	4	f	050303
05030302	Thôn 2	4	f	050303
06	Tỉnh Lào Cai	1	f	00
0601	Thành phố Lào Cai	2	f	06
060101	Phường Duyên Hải	3	f	0601
06010101	Thôn 1	4	f	060101
06010102	Thôn 2	4	f	060101
060102	Phường Lào Cai	3	f	0601
06010201	Thôn 1	4	f	060102
06010202	Thôn 2	4	f	060102
060103	Phường Cốc Lếu	3	f	0601
06010301	Thôn 1	4	f	060103
06010302	Thôn 2	4	f	060103
0602	Huyện Bát Xát	2	f	06
060201	Thị trấn Bát Xát	3	f	0602
06020101	Thôn 1	4	f	060201
06020102	Thôn 2	4	f	060201
060202	Xã A Mú Sung	3	f	0602
06020201	Thôn 1	4	f	060202
06020202	Thôn 2	4	f	060202
060203	Xã Nậm Chạc	3	f	0602
06020301	Thôn 1	4	f	060203
06020302	Thôn 2	4	f	060203
0603	Huyện Mường Khương	2	f	06
060301	Xã Pha Long	3	f	0603
06030101	Thôn 1	4	f	060301
06030102	Thôn 2	4	f	060301
060302	Xã Tả Ngải Chồ	3	f	0603
06030201	Thôn 1	4	f	060302
06030202	Thôn 2	4	f	060302
060303	Xã Tung Chung Phố	3	f	0603
06030301	Thôn 1	4	f	060303
06030302	Thôn 2	4	f	060303
07	Tỉnh Điện Biên	1	f	00
0701	Thành phố Điện Biên Phủ	2	f	07
070101	Phường Noong Bua	3	f	0701
07010101	Thôn 1	4	f	070101
07010102	Thôn 2	4	f	070101
070102	Phường Him Lam	3	f	0701
07010201	Thôn 1	4	f	070102
07010202	Thôn 2	4	f	070102
070103	Phường Thanh Bình	3	f	0701
07010301	Thôn 1	4	f	070103
07010302	Thôn 2	4	f	070103
0702	Thị Xã Mường Lay	2	f	07
070201	Phường Sông Đà	3	f	0702
07020101	Thôn 1	4	f	070201
07020102	Thôn 2	4	f	070201
070202	Phường Na Lay	3	f	0702
07020201	Thôn 1	4	f	070202
07020202	Thôn 2	4	f	070202
070203	Xã Lay Nưa	3	f	0702
07020301	Thôn 1	4	f	070203
07020302	Thôn 2	4	f	070203
0703	Huyện Mường Nhé	2	f	07
070301	Xã Sín Thầu	3	f	0703
07030101	Thôn 1	4	f	070301
07030102	Thôn 2	4	f	070301
070302	Xã Sen Thượng	3	f	0703
07030201	Thôn 1	4	f	070302
07030202	Thôn 2	4	f	070302
070303	Xã Chung Chải	3	f	0703
07030301	Thôn 1	4	f	070303
07030302	Thôn 2	4	f	070303
08	Tỉnh Lai Châu	1	f	00
0801	Thành phố Lai Châu	2	f	08
080101	Phường Quyết Thắng	3	f	0801
08010101	Thôn 1	4	f	080101
08010102	Thôn 2	4	f	080101
080102	Phường Tân Phong	3	f	0801
08010201	Thôn 1	4	f	080102
08010202	Thôn 2	4	f	080102
080103	Phường Quyết Tiến	3	f	0801
08010301	Thôn 1	4	f	080103
08010302	Thôn 2	4	f	080103
0802	Huyện Tam Đường	2	f	08
080201	Thị trấn Tam Đường	3	f	0802
08020101	Thôn 1	4	f	080201
08020102	Thôn 2	4	f	080201
080202	Xã Thèn Sin	3	f	0802
08020201	Thôn 1	4	f	080202
08020202	Thôn 2	4	f	080202
080203	Xã Tả Lèng	3	f	0802
08020301	Thôn 1	4	f	080203
08020302	Thôn 2	4	f	080203
0803	Huyện Mường Tè	2	f	08
080301	Thị trấn Mường Tè	3	f	0803
08030101	Thôn 1	4	f	080301
08030102	Thôn 2	4	f	080301
080302	Xã Thu Lũm	3	f	0803
08030201	Thôn 1	4	f	080302
08030202	Thôn 2	4	f	080302
080303	Xã Ka Lăng	3	f	0803
08030301	Thôn 1	4	f	080303
08030302	Thôn 2	4	f	080303
09	Tỉnh Sơn La	1	f	00
0901	Thành phố Sơn La	2	f	09
090101	Phường Chiềng Lề	3	f	0901
09010101	Thôn 1	4	f	090101
09010102	Thôn 2	4	f	090101
090102	Phường Tô Hiệu	3	f	0901
09010201	Thôn 1	4	f	090102
09010202	Thôn 2	4	f	090102
090103	Phường Quyết Thắng	3	f	0901
09010301	Thôn 1	4	f	090103
09010302	Thôn 2	4	f	090103
0902	Huyện Quỳnh Nhai	2	f	09
090201	Xã Mường Chiên	3	f	0902
09020101	Thôn 1	4	f	090201
09020102	Thôn 2	4	f	090201
090202	Xã Cà Nàng	3	f	0902
09020201	Thôn 1	4	f	090202
09020202	Thôn 2	4	f	090202
090203	Xã Chiềng Khay	3	f	0902
09020301	Thôn 1	4	f	090203
09020302	Thôn 2	4	f	090203
0903	Huyện Thuận Châu	2	f	09
090301	Thị trấn Thuận Châu	3	f	0903
09030101	Thôn 1	4	f	090301
09030102	Thôn 2	4	f	090301
090302	Xã Phổng Lái	3	f	0903
09030201	Thôn 1	4	f	090302
09030202	Thôn 2	4	f	090302
090303	Xã Mường é	3	f	0903
09030301	Thôn 1	4	f	090303
09030302	Thôn 2	4	f	090303
10	Tỉnh Yên Bái	1	f	00
1001	Thành phố Yên Bái	2	f	10
100101	Phường Yên Thịnh	3	f	1001
10010101	Thôn 1	4	f	100101
10010102	Thôn 2	4	f	100101
100102	Phường Yên Ninh	3	f	1001
10010201	Thôn 1	4	f	100102
10010202	Thôn 2	4	f	100102
100103	Phường Minh Tân	3	f	1001
10010301	Thôn 1	4	f	100103
10010302	Thôn 2	4	f	100103
1002	Thị xã Nghĩa Lộ	2	f	10
100201	Phường Pú Trạng	3	f	1002
10020101	Thôn 1	4	f	100201
10020102	Thôn 2	4	f	100201
100202	Phường Trung Tâm	3	f	1002
10020201	Thôn 1	4	f	100202
10020202	Thôn 2	4	f	100202
100203	Phường Tân An	3	f	1002
10020301	Thôn 1	4	f	100203
10020302	Thôn 2	4	f	100203
1003	Huyện Lục Yên	2	f	10
100301	Thị trấn Yên Thế	3	f	1003
10030101	Thôn 1	4	f	100301
10030102	Thôn 2	4	f	100301
100302	Xã Tân Phượng	3	f	1003
10030201	Thôn 1	4	f	100302
10030202	Thôn 2	4	f	100302
100303	Xã Lâm Thượng	3	f	1003
10030301	Thôn 1	4	f	100303
10030302	Thôn 2	4	f	100303
00	Trung ương	0	f	\N
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add agency	7	add_agency
26	Can change agency	7	change_agency
27	Can delete agency	7	delete_agency
28	Can view agency	7	view_agency
29	Can add citizen	8	add_citizen
30	Can change citizen	8	change_citizen
31	Can delete citizen	8	delete_citizen
32	Can view citizen	8	view_citizen
33	Can add family	9	add_family
34	Can change family	9	change_family
35	Can delete family	9	delete_family
36	Can view family	9	view_family
\.


--
-- Data for Name: citizen_citizen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citizen_citizen (id, name, dob, gender, ethnic, declarer_id, educational, religion, address_line1, address_line2, home_town, id_number, occupations, village_id_id) FROM stdin;
46996	Võ Phương Vy	1963-12-14	female	Si La	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	205515201	Lao động thủ công và các nghề nghiệp có liên quan khác	04030201
46997	Phan Ngọc Bảo Trâm	1965-11-25	female	Kinh (Việt)	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	201859101	Lực lượng vũ trang	04030201
46998	Nguyễn Hữu Khôi Nguyên	1975-06-07	male	Kinh (Việt)	2625	none	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	202215501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030201
46999	Bùi Đức Tiến	2014-06-20	male	Kinh (Việt)	2625	None	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030201
47000	Nguyễn Ngọc Như Ý	2016-01-10	female	Kinh (Việt)	2625	None	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Lao động thủ công và các nghề nghiệp có liên quan khác	04030201
47001	Phan Thành Đạt	2002-01-05	male	Kinh (Việt)	2625		Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	205269101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030201
47002	Phạm Thị Kim Oanh	1963-09-24	female	Kinh (Việt)	2625	secondary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	208117001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030201
47003	Đinh Huỳnh Trúc Phương	2014-11-14	female	Kinh (Việt)	2625	None	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030201
47004	Lê Minh Triết	1985-06-05	male	Kinh (Việt)	2625	secondary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	208906601	Lao động giản đơn	04030201
47005	Trần Võ Thanh Trúc	1977-05-20	female	Kinh (Việt)	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	203740801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030201
47006	Nguyễn Đình Tiến	2006-11-04	male	Kinh (Việt)	2625	primary	Cơ đốc Phục lâm	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04030201
47007	Nguyễn Phan Yến Vy	1963-07-18	female	Kinh (Việt)	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	207372501	Nhân viên trợ lý văn phòng	04030202
47008	Trần Tấn Khanh	1978-05-29	male	Kinh (Việt)	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	206727001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030202
47009	Đặng Ngọc Chính	1939-05-12	male	Phù Lá	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	207099201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030202
47010	Phan Nguyễn Hồng Tiên	1969-07-15	male	Kinh (Việt)	2626	high	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	208897601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030202
47011	Võ Kim Ngọc	1990-06-20	female	Kinh (Việt)	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	204248301	Lao động giản đơn	04030202
47012	Bùi Gia Phong	1982-10-22	male	Kinh (Việt)	2626	primary	Bà-la-môn giáo	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	206139901	Tự do	04030202
47013	Nguyễn Trần Vân Tiên	1941-04-06	female	Kinh (Việt)	2626	high	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	200436201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030202
47014	Lê Thùy Duyên	1985-02-26	female	Kinh (Việt)	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	206030201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030202
47015	Ngô Võ Mỹ Duyên	2009-11-20	female	Kinh (Việt)	2626	primary	Baha'I	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030202
47016	Phạm Trần Thanh Vy	1984-07-28	female	Kinh (Việt)	2626	none	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	204956901	Lao động giản đơn	04030202
47017	Trần Đức Anh	2001-10-01	male	Kinh (Việt)	2626		Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	200967701	Lao động giản đơn	04030202
47018	Bùi Quang Anh	1998-05-05	male	Khơ-me	2626		Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	205245501	Lao động giản đơn	04030202
47019	Phạm Văn Hoàng Ân	2004-10-31	male	Kinh (Việt)	2626	primary	Minh Sư đạo	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	205077901	Lao động giản đơn	04030202
47020	Nguyễn Xuân Kỳ Duyên	1993-09-08	female	Kinh (Việt)	2626	secondary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	202804501	Lao động thủ công và các nghề nghiệp có liên quan khác	04030202
47021	Nguyễn Xuân Trung Đức	1966-02-28	male	Ba-na	2626	none	Mặc môn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	203085901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030202
47022	Võ Nguyễn Hồng Ánh	1959-09-09	female	Kinh (Việt)	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	206887201	Lao động giản đơn	04030202
47023	Trương Minh Nghĩa	1977-11-13	male	Kinh (Việt)	2626	none	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	207740201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030202
47024	Trần Thị Bích Vân	1982-10-18	female	Kinh (Việt)	2626	secondary	Phật giáo	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	201308301	Nhân viên dịch vụ và bán hàng	04030202
47025	Ngô Vương Thanh Thảo	2000-12-30	female	Kinh (Việt)	2626		Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	201553301	Lao động giản đơn	04030202
47026	Nguyễn Tuyết Hằng	1972-10-02	female	Tày	2626	primary	Không	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	205545401	Nhà chuyên môn bậc cao (đại học trở lên)	04030202
47027	Nguyễn Thái Nhi	1971-10-22	female	Kinh (Việt)	2628	secondary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	201915601	Lao động giản đơn	04030301
47028	Lại Trương Yến Vy	1993-03-26	female	Kinh (Việt)	2628	secondary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	204907401	Lao động giản đơn	04030301
47029	Nguyễn Thị Minh Phương	1964-03-22	female	Kinh (Việt)	2628	primary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203556301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030301
47030	Nguyễn Lê Tuyết Nhung	1979-08-09	female	Kinh (Việt)	2628	high	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	208013901	Lao động giản đơn	04030301
47031	Lê Nguyễn Anh Tài	2018-08-20	male	Sán Chay	2628	None	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04030301
47032	Văn Ngọc Minh Nguyệt	1962-09-07	female	Kinh (Việt)	2628	high	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	202141201	Nhân viên trợ lý văn phòng	04030301
47033	Vương Đình Quý	1994-05-10	male	Hmông (Mèo)	2628	high	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203002801	Lao động giản đơn	04030301
47034	Nguyễn Hoàng Mỹ Duyên	1991-12-22	female	Kinh (Việt)	2628		Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	202684501	Lao động giản đơn	04030301
47035	Vũ Thị Thanh Tâm	1992-12-04	female	Kinh (Việt)	2628	primary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	207039701	Lao động giản đơn	04030301
47036	Đỗ Trung Phát	2013-04-09	male	Kinh (Việt)	2628	None	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Tự do	04030301
47037	Nguyễn Hoàng Minh	1973-09-24	male	Kinh (Việt)	2628	none	Mặc môn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	200567701	Lao động giản đơn	04030301
47038	Nguyễn Phạm Đức Anh	2010-08-25	male	Kinh (Việt)	2628	primary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04030301
47039	Nguyễn Thái Ngọc Trân	2017-05-04	female	Kinh (Việt)	2628	None	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030301
47040	Nguyễn Phát Tài	1962-10-28	male	Kinh (Việt)	2628	primary	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203054201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030301
47041	Nguyễn Thái Gia Chấn	1936-05-07	male	Kinh (Việt)	2628	secondary	Minh Sư đạo	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	206474701	Lao động thủ công và các nghề nghiệp có liên quan khác	04030301
47042	Mai Thới Chinh	1981-08-31	male	Kinh (Việt)	2628	none	Cơ đốc Phục lâm	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	200785801	Lao động giản đơn	04030301
47043	Phạm Minh Quân	2017-12-14	male	Kinh (Việt)	2628	None	Baha'I	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030301
47044	Lại Thị Cẩm Nhung	1959-07-11	female	Kinh (Việt)	2628	none	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	205036701	Lao động giản đơn	04030301
47045	Nguyễn Ngọc Hải	2014-11-18	male	Kinh (Việt)	2628	None	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Nhân viên dịch vụ và bán hàng	04030301
47046	Hoàng Tú Quỳnh	2021-02-07	female	Kinh (Việt)	2628	None	Không	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030301
47047	Nguyễn Thanh Tuyền	2002-02-21	female	Kinh (Việt)	2629		Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203902001	Lao động giản đơn	04030302
47048	Vũ Minh Khôi	1999-03-12	male	Kinh (Việt)	2629		Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	208699401	Tự do	04030302
47049	Nguyễn Thị Trúc Phương	1988-09-10	female	Kinh (Việt)	2629	secondary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	207233101	Thợ lắp ráp và vận hành máy móc, thiết bị	04030302
47050	Nguyễn Thị Lan Anh	1985-08-14	female	Kinh (Việt)	2629	none	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203909501	Thợ lắp ráp và vận hành máy móc, thiết bị	04030302
47051	Nguyễn Thanh Vy	1997-10-13	female	Pà Thẻn	2629	primary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	201355701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030302
47052	Huỳnh Lâm Kim Xuyến	2018-09-13	female	Kinh (Việt)	2629	None	Cao đài	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Nhà chuyên môn bậc cao (đại học trở lên)	04030302
47053	Nguyễn Ngọc Hà	1998-09-07	female	Kinh (Việt)	2629		Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	201045701	Lao động giản đơn	04030302
47054	Trương Công Phát	1924-04-26	male	Kinh (Việt)	2629	primary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	207773801	Nhân viên trợ lý văn phòng	04030302
47055	Nguyễn Trường Thịnh	1978-12-15	male	Kinh (Việt)	2629	primary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	202782101	Lao động giản đơn	04030302
47056	Nguyễn Bùi Phương Quyên	2007-01-22	female	Kinh (Việt)	2629	primary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04030302
47057	Trần Đình Dũng	2017-01-15	male	Kinh (Việt)	2629	None	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030302
47058	Nguyễn Thị Quỳnh Hương	1964-07-25	female	Kinh (Việt)	2629	primary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	204876401	Thợ lắp ráp và vận hành máy móc, thiết bị	04030302
47059	Huỳnh Thị Minh Thư	1993-02-24	female	Kinh (Việt)	2629	secondary	Phật giáo	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	203569101	Thợ lắp ráp và vận hành máy móc, thiết bị	04030302
47060	Đặng Hoàng Khang	1923-02-28	male	Kinh (Việt)	2629	none	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	201110101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030302
47061	Lưu Anh Thư	1974-09-29	female	Thái	2629	secondary	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	200534901	Lực lượng vũ trang	04030302
47062	Tăng Nguyễn Bảo Ngọc	2020-12-20	female	Kinh (Việt)	2629	None	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030302
47063	Trần Thanh Quan	1992-10-24	male	Kinh (Việt)	2629	high	Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	204988801	Tự do	04030302
47064	Nguyễn Hoàng Minh Phương	2003-08-09	female	Kinh (Việt)	2629	high	Phật giáo Hòa Hảo	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	202443801	Lao động giản đơn	04030302
47065	Trần Đỗ Kim Khanh	2002-05-26	female	Tày	2629		Không	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	202969801	Thợ lắp ráp và vận hành máy móc, thiết bị	04030302
47066	Lê Hoàng Trân	2008-12-14	female	Kinh (Việt)	2629	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Xã Phúc Lộc Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030302
47067	Lê Quốc Cường	1962-09-11	male	Kinh (Việt)	2633	primary	Phật giáo Hòa Hảo	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201319401	Lao động giản đơn	05010101
47068	Nguyễn Bá Huy	2021-10-18	male	Kinh (Việt)	2633	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010101
47069	Trần Thị Lệ Khuyên	1963-05-19	female	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201701101	Nhân viên dịch vụ và bán hàng	05010101
47070	Lê Nhã Vy	2019-03-05	female	Kinh (Việt)	2633	None	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010101
47071	Nguyễn Thái Huy Hoàng	1990-01-22	male	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	206702201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010101
47072	Lê Đào Hồng Phúc	1984-10-25	female	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	202551401	Lao động giản đơn	05010101
47073	Nguyễn Hồng Hân	2002-07-20	female	Kinh (Việt)	2633		Tin lành	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201655701	Lao động giản đơn	05010101
47074	Hồ Đắc Minh Thy	2014-03-19	female	Kinh (Việt)	2633	None	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010101
47075	Đặng Xuân Chính	2019-07-22	male	Kinh (Việt)	2633	None	Bà-la-môn giáo	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010101
47076	Phạm Thị Thanh Trúc	1981-06-29	female	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	207624001	Nhân viên dịch vụ và bán hàng	05010101
47077	Trần Thị Yến Linh	1985-09-16	female	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	208099801	Lao động giản đơn	05010101
47078	Phan Dương Luật	1979-05-22	male	Kinh (Việt)	2633	university	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	208101901	Lao động giản đơn	05010101
47079	Nguyễn Hoài Thương	1994-01-04	female	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	204274901	Nhà chuyên môn bậc cao (đại học trở lên)	05010101
47080	Lý Thanh Chi	1977-11-13	female	Kinh (Việt)	2633	secondary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	205688201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010101
47081	Đào Ngọc Phương Thùy	2008-11-16	female	Kinh (Việt)	2633	primary	Phật giáo Hòa Hảo	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010101
47082	Lý Gia Huy	1980-06-21	male	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	208342401	Lao động giản đơn	05010101
47083	Lê Hoàng Bình	1959-02-24	male	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	203157201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010101
47084	Trương Duy Kha	2009-09-19	male	Kinh (Việt)	2633	primary	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05010101
47085	Lương Nguyễn Diễm Thy	1996-03-05	female	Kinh (Việt)	2633	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	202563801	Lao động giản đơn	05010101
47086	Nguyễn Ngọc Anh Thư	1997-01-14	female	Xơ-đăng	2633	high	Không	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	200655401	Lao động thủ công và các nghề nghiệp có liên quan khác	05010101
47087	Bùi Anh Thư	1976-06-13	female	Kinh (Việt)	2634		Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	206834601	Lao động thủ công và các nghề nghiệp có liên quan khác	05010102
47088	Nguyễn Hoàng Ngân	1964-03-09	female	Kinh (Việt)	2634	secondary	Baha'I	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201487301	Nhân viên trợ lý văn phòng	05010102
47089	Vũ Hải Quân	1952-06-12	male	Kinh (Việt)	2634	secondary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	200323101	Lao động giản đơn	05010102
47090	Phan Thanh Trúc	1958-09-14	female	Kinh (Việt)	2634	none	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	204946701	Nhân viên dịch vụ và bán hàng	05010102
47091	Lê Thị Minh Hương	2000-04-15	female	Kinh (Việt)	2634		Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201532801	Nhà chuyên môn bậc cao (đại học trở lên)	05010102
47092	Lý Quang Hưng	1976-03-23	male	Kinh (Việt)	2634		Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	202824501	Lực lượng vũ trang	05010102
47093	Ngô Kim Ngân	1968-12-06	female	Kinh (Việt)	2634	secondary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	200634001	Lao động giản đơn	05010102
47094	Nguyễn Hữu Bằng	1963-12-04	male	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201155101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010102
47095	Lê Ngọc Gia Huy	1996-11-13	male	Kinh (Việt)	2634	secondary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201334001	Nhân viên trợ lý văn phòng	05010102
47096	Nguyễn Hoàng Minh Chuyên	1959-10-18	female	Kinh (Việt)	2634	none	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	205085501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010102
47097	Nguyễn Hồ Thiên Thảo	1995-10-15	female	Pà Thẻn	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	200888801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010102
47098	Phạm Ngọc Khôi	1926-12-17	male	Thái	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201887301	Lao động giản đơn	05010102
47099	Dương Xuân Hậu	2017-12-03	male	Kinh (Việt)	2634	None	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010102
47100	Nguyễn Lê Mỹ Linh	2010-03-10	female	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05010102
47101	Phạm Minh Trí	1979-10-19	male	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	200055101	Lao động giản đơn	05010102
47102	Nguyễn Hiếu Nghĩa	2009-11-22	male	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên trợ lý văn phòng	05010102
47103	Đỗ Hoàng Triều	1992-10-03	male	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	204338201	Lao động giản đơn	05010102
47104	Mai Lê Hoàng Nhật	1989-11-30	male	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	202489101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010102
47105	Lê Kỳ Duyên	2009-06-19	female	Kinh (Việt)	2634	primary	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên trợ lý văn phòng	05010102
47106	Hồ Hào Kiệt	1987-10-29	male	Kinh (Việt)	2634	high	Không	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Phan Thiết Thành phố Tuyên Quang Tỉnh Tuyên Quang	201361201	Lao động giản đơn	05010102
47107	Nguyễn Quốc Hưng	2007-09-22	male	Kinh (Việt)	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lực lượng vũ trang	05010201
47108	Lê Thị Thanh Như	2003-10-14	female	Kinh (Việt)	2636	primary	Baha'I	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200879201	Lao động giản đơn	05010201
47109	Phạm Phúc Bảo	2000-08-04	male	Bố Y	2636		Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	202582801	Lao động giản đơn	05010201
47110	Nguyễn Gia Trúc Lam	2018-10-13	female	Kinh (Việt)	2636	None	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lực lượng vũ trang	05010201
47111	Nguyễn Nhật Tân	2007-01-01	male	Kinh (Việt)	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên trợ lý văn phòng	05010201
47112	Trần Ngọc Minh Trâm	1973-12-15	female	Kinh (Việt)	2636	none	Hồi giáo	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	208859301	Lực lượng vũ trang	05010201
47113	Đỗ Minh Khoa	1989-11-15	male	Tày	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	205772601	Lao động giản đơn	05010201
47114	Võ Thành Vinh	2009-09-30	male	Gié-Triêng	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Tự do	05010201
47115	Trần Quang Phú	2001-11-14	male	Kinh (Việt)	2636		Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	205470001	Lao động giản đơn	05010201
47116	Lê Ngọc Yến Vy	1975-09-12	female	Kinh (Việt)	2636	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	204550401	Nhân viên dịch vụ và bán hàng	05010201
47117	Nguyễn Phúc Nguyên Chương	1935-01-26	male	Kinh (Việt)	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200608601	Lao động thủ công và các nghề nghiệp có liên quan khác	05010201
47118	Trương Thành Phát	2020-12-10	male	Kinh (Việt)	2636	None	Bà-la-môn giáo	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên trợ lý văn phòng	05010201
47119	Võ Minh Thư	1972-08-27	female	Kinh (Việt)	2636	none	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	208856901	Lao động giản đơn	05010201
47120	Võ Ngọc Quỳnh Anh	1963-11-03	female	Tày	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200004101	Nhà chuyên môn bậc cao (đại học trở lên)	05010201
47121	Nguyễn Vũ Phương Thảo	1979-12-25	female	Kinh (Việt)	2636	none	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	202908601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010201
47122	Nguyễn Thị Bích Trâm	2013-06-10	female	Sán Dìu	2636	None	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05010201
47123	Nguyễn Hồng Đại Lực	1961-01-13	male	Kinh (Việt)	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	205795301	Nhà chuyên môn bậc cao (đại học trở lên)	05010201
47124	Nguyễn Quỳnh Hương	1924-12-29	female	Tày	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	208448901	Lao động giản đơn	05010201
47125	Trần Nguyễn Bình Minh	2015-08-27	female	Kinh (Việt)	2636	None	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010201
47126	Nguyễn Tường Vỹ	2004-03-20	male	Kinh (Việt)	2636	primary	Không	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	202309801	Nhân viên trợ lý văn phòng	05010201
47127	Đinh Đức Thiện	1968-01-17	male	Kinh (Việt)	2637	none	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200106501	Lao động giản đơn	05010202
47128	Hà Thị Lan Anh	1984-02-17	female	Hrê	2637	none	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	201809901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010202
47129	Đàm Thế Hiển	2017-01-22	male	Kinh (Việt)	2637	None	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Tự do	05010202
47130	Nguyễn Ngọc Trâm Anh	1980-11-15	female	Kinh (Việt)	2637	none	Minh Sư đạo	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	203709601	Nhân viên trợ lý văn phòng	05010202
47131	Đặng Hồ Đăng Khoa	1976-11-14	male	Kinh (Việt)	2637		Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	202857101	Lao động giản đơn	05010202
47132	Nguyễn Khang	1967-12-13	male	Kinh (Việt)	2637	secondary	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	201169301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010202
47133	Nguyễn Ngọc Anh Tú	2008-04-15	male	Kinh (Việt)	2637	primary	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên dịch vụ và bán hàng	05010202
47134	Nguyễn Ngọc Trúc Ly	1974-01-28	female	Kinh (Việt)	2637	primary	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	205796101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010202
47135	Lê Khắc Bình	1963-04-07	male	Kinh (Việt)	2637	none	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	208222801	Lao động giản đơn	05010202
47136	Nguyễn Thanh Trường	1993-03-24	male	Kinh (Việt)	2637	high	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	208908601	Lao động giản đơn	05010202
47137	Đặng Thanh Mai	1963-04-18	female	Kinh (Việt)	2637	primary	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	207528501	Nhân viên trợ lý văn phòng	05010202
47138	Nguyễn Thị Hồng Diệu	1966-11-10	female	Kinh (Việt)	2637	none	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	203401301	Lực lượng vũ trang	05010202
47139	Lâm Tấn Lộc	1998-07-21	male	Kinh (Việt)	2637		Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200565101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010202
47140	Trần Văn Cường	1964-02-24	male	Kinh (Việt)	2637	primary	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	204193601	Lao động giản đơn	05010202
47141	Trương Minh Khôi	1978-10-08	male	Cống	2637	none	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	205300101	Lao động giản đơn	05010202
47142	Quách Thùy Bảo Trân	2018-11-09	female	Kinh (Việt)	2637	None	Phật giáo Hòa Hảo	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05010202
47143	Nguyễn Thị Tuyết Linh	1932-09-08	female	Kinh (Việt)	2637	none	Cơ đốc Phục lâm	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	207212401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010202
47144	Lê Hải Đăng	2021-12-16	male	Kinh (Việt)	2637	None	Không	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010202
47145	Lê Hoàng Phúc	1991-04-26	male	La Chí	2637		Công giáo	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	200882001	Lao động thủ công và các nghề nghiệp có liên quan khác	05010202
47146	Nguyễn Ngọc Hải	2011-10-29	male	Kinh (Việt)	2637	primary	Bà-la-môn giáo	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Minh Xuân Thành phố Tuyên Quang Tỉnh Tuyên Quang		Tự do	05010202
47147	Trần Tú Quỳnh	2010-07-12	female	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010301
47148	Phạm Nguyễn Anh Thy	1980-01-01	female	Kinh (Việt)	2639	high	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208298501	Lao động giản đơn	05010301
47149	Vũ Hồng Ngân	2013-08-26	female	Kinh (Việt)	2639	None	Minh Sư đạo	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05010301
47150	Đỗ Anh Tuấn Kiệt	2010-10-15	male	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05010301
47151	Nguyễn Phúc Lê An	1978-12-04	female	Tày	2639	none	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	203147601	Lao động giản đơn	05010301
47152	Trần Quách Kim Phụng	2004-07-15	female	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	201732801	Nhân viên dịch vụ và bán hàng	05010301
47153	Mai Phương Anh	1973-12-09	female	Gié-Triêng	2639	none	Hồi giáo	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	206462601	Lao động giản đơn	05010301
47154	Huỳnh Thanh Nhã	1942-07-28	male	Kinh (Việt)	2639	secondary	Tin lành	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208010201	Lao động giản đơn	05010301
47155	Lê Minh Hiếu	2006-01-23	male	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010301
47156	Nguyễn Thùy Minh Hương	1997-11-03	female	Kinh (Việt)	2639	secondary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	202009901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010301
47157	Nguyễn Hoàng Phúc	1980-09-08	male	Kinh (Việt)	2639	primary	Minh Sư đạo	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	203622201	Lao động giản đơn	05010301
47158	Trần Bảo	1970-11-30	male	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	207476801	Lực lượng vũ trang	05010301
47159	Trần Hà Quốc Vinh	1976-04-13	male	Kinh (Việt)	2639		Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208918201	Lao động giản đơn	05010301
47160	Trần Hoàng Bảo Trân	1980-10-13	female	Kinh (Việt)	2639	university	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	201674701	Lao động giản đơn	05010301
47161	Phạm Trung Nhật	1980-04-11	male	Kinh (Việt)	2639	none	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	207765301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05010301
47162	Lê Gia Linh	2017-08-19	male	Kinh (Việt)	2639	None	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010301
47163	Phạm Huy Toàn	1988-08-20	male	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	206640501	Lao động giản đơn	05010301
47164	Huỳnh Hồng Cẩm Ly	1971-03-04	female	Kinh (Việt)	2639	secondary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	205028001	Lao động giản đơn	05010301
47165	Lê Nguyễn Trung Mẫn	2002-04-02	male	Kinh (Việt)	2639		Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208819601	Lao động giản đơn	05010301
47166	Nguyễn Minh Tiến	1979-08-13	male	Kinh (Việt)	2639	primary	Không	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 1 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208300001	Nhân viên dịch vụ và bán hàng	05010301
47167	Nguyễn Thị Thảo Nhi	1997-09-24	female	Kinh (Việt)	2640	primary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	202346301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05010302
47168	Triệu Thuần Trí	1993-11-02	male	Kinh (Việt)	2640	primary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	206200201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010302
47169	Phạm Nhựt Nguyên	1983-04-24	female	Kinh (Việt)	2640	none	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	200034401	Lao động giản đơn	05010302
47170	Lê Trần Tiến	2001-10-26	male	Kinh (Việt)	2640		Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	204327701	Tự do	05010302
47171	Nguyễn Kiến Quốc	2012-11-08	male	Kinh (Việt)	2640	None	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010302
47172	Lê Nguyễn Kim Chi Bạch Nga	1969-07-06	female	Kinh (Việt)	2640	secondary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	206754901	Lao động giản đơn	05010302
47173	Trầm Ngọc Bảo Vy	1988-05-27	female	Kinh (Việt)	2640	secondary	Phật giáo Hòa Hảo	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	200550401	Nhân viên dịch vụ và bán hàng	05010302
47174	Đỗ Quốc Vương	1962-07-31	male	Kinh (Việt)	2640	high	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	204057501	Lao động giản đơn	05010302
47175	Huỳnh Diệu Linh	1985-03-23	female	Kinh (Việt)	2640	none	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	202020601	Lao động thủ công và các nghề nghiệp có liên quan khác	05010302
47176	Nguyễn Thành Quân	1983-02-13	male	Kinh (Việt)	2640	primary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	205870301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010302
47177	Mai Lâm Như	1982-06-17	female	Kinh (Việt)	2640	secondary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	201918401	Lao động giản đơn	05010302
47178	Bùi Lê Quảng An	1971-03-11	male	Kinh (Việt)	2640	primary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	205004301	Lao động giản đơn	05010302
47179	Phạm Thanh Tuấn	1995-12-06	male	Kinh (Việt)	2640	secondary	Mặc môn	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	208667001	Nhân viên dịch vụ và bán hàng	05010302
47180	Đỗ Nguyễn Minh Tri	2021-12-20	male	Kinh (Việt)	2640	None	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Lao động giản đơn	05010302
47181	Vương Nguyễn Thiện Nhân	1988-03-10	male	Kinh (Việt)	2640	primary	Cơ đốc Phục lâm	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	202037001	Nhân viên trợ lý văn phòng	05010302
47182	Châu Nhuận Phát	2001-08-23	male	Kinh (Việt)	2640		Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	205891301	Tự do	05010302
47183	Trần Trọng Hiếu	1999-06-09	male	Kinh (Việt)	2640		Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	200528401	Lao động giản đơn	05010302
47184	Nguyễn Lê Diệu Linh	2013-08-21	female	Gia-rai	2640	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang		Nhân viên dịch vụ và bán hàng	05010302
47185	Vũ Nguyễn Xuân Uyên	1965-10-16	female	Cơ Lao	2640	none	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	206452001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05010302
47186	Nguyễn Trọng Hiệp	1980-06-23	male	Kinh (Việt)	2640	secondary	Không	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	Thôn 2 Phường Tân Quang Thành phố Tuyên Quang Tỉnh Tuyên Quang	204069901	Thợ lắp ráp và vận hành máy móc, thiết bị	05010302
47187	Trần Thanh Lan	1974-12-06	female	Tày	2643	none	Bà-la-môn giáo	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	200469801	Lao động giản đơn	05020101
47188	Phan Hồ Huỳnh Uyên	2008-11-30	female	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47189	Võ Thị Hồng Duy	2019-02-01	female	Kinh (Việt)	2643	None	Bửu Sơn Kỳ Hương	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47190	Văn Hào Thiên Phú	2015-01-02	female	Co	2643	None	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020101
47191	Phạm Ngọc Khánh Vân	1986-03-27	female	Kinh (Việt)	2643	high	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	202726901	Lực lượng vũ trang	05020101
47192	Hà Duy Thịnh	1940-07-25	male	Kinh (Việt)	2643	none	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	207812301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020101
47193	Nguyễn Hoàng Minh Nguyên	2017-12-24	male	Kinh (Việt)	2643	None	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47194	Phạm Gia Bảo	1992-03-12	male	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	200245301	Lao động giản đơn	05020101
47195	Tống Mỹ Linh	2010-09-06	female	Thái	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47196	Vũ Ngọc Phương Uyên	1985-05-20	female	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203202901	Lao động thủ công và các nghề nghiệp có liên quan khác	05020101
47197	Nguyễn Hữu Đang	2009-11-02	male	Rơ-măm	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47198	Lê Thế Công	2008-09-21	male	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47199	Ngô Khả Nhi	1962-10-23	female	Kinh (Việt)	2643	none	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	202992201	Lao động giản đơn	05020101
47200	Nguyễn Ngọc Thùy Linh	1958-10-18	female	Pà Thẻn	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203416301	Lao động giản đơn	05020101
47201	Trương Ngọc Linh	1968-11-09	female	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	202481001	Tự do	05020101
47202	Lê Trung Tuấn	2005-03-03	male	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	204175401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020101
47203	Hồ Thị Kim Ngân	2004-06-27	female	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	204760501	Nhân viên dịch vụ và bán hàng	05020101
47204	Phạm Dương Thanh Vy	1945-04-06	female	Kinh (Việt)	2643	primary	Cao đài	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	205514601	Lực lượng vũ trang	05020101
47205	Hà Nguyễn	2019-01-06	male	Kinh (Việt)	2643	None	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05020101
47206	Lê Ngọc Mai	2008-06-16	female	Kinh (Việt)	2643	primary	Không	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020101
47207	Huỳnh Lê Hữu Đăng	2010-11-18	male	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05020102
47208	Trương Thành Sơn	1969-01-18	male	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203005401	Lực lượng vũ trang	05020102
47209	Nguyễn Công Thái	1961-10-15	male	Kinh (Việt)	2644	secondary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203380201	Lao động giản đơn	05020102
47210	Phạm Trần Hoàng Anh	1956-11-26	female	Kinh (Việt)	2644	high	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	201401801	Lao động giản đơn	05020102
47211	Đặng Thanh Kim Phượng	2005-12-19	female	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	206622001	Lao động giản đơn	05020102
47212	Trần Thiện Nhân	1990-05-29	male	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203045901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020102
47213	Lê Hồng Hoài Thương	1964-07-11	female	Kinh (Việt)	2644	none	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	201557901	Lao động giản đơn	05020102
47214	Huỳnh Ngọc Tuấn	1975-07-10	male	Lô lô	2644	none	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	205386201	Nhân viên trợ lý văn phòng	05020102
47215	Nguyễn Sỹ Nguyên	2014-01-01	male	Kinh (Việt)	2644	None	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05020102
47216	Trần Tuấn Anh	1969-08-21	male	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203398001	Lao động thủ công và các nghề nghiệp có liên quan khác	05020102
47217	Đặng Ngọc Trâm	1970-03-24	female	Kinh (Việt)	2644	none	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	201443601	Lao động giản đơn	05020102
47218	Lê Phi Long	1970-09-19	male	Kinh (Việt)	2644	secondary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	206968801	Lao động giản đơn	05020102
47219	Trần Tuấn Tường	1987-09-29	male	Kinh (Việt)	2644	primary	Cao đài	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	202723901	Nhân viên trợ lý văn phòng	05020102
47220	Nguyễn Minh Luân	1984-01-05	male	Kinh (Việt)	2644	primary	Phật giáo Hòa Hảo	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203812201	Lao động giản đơn	05020102
47221	Bùi Bảo Ngân	2015-11-06	female	Kinh (Việt)	2644	None	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020102
47222	Lê Minh Tường Vy	2007-03-01	female	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05020102
47223	Liêu Huệ Quyên	1991-12-11	female	Kinh (Việt)	2644		Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	201339801	Lao động giản đơn	05020102
47224	Võ Trung Thịnh	2003-10-24	male	Kinh (Việt)	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	208196801	Nhân viên trợ lý văn phòng	05020102
47225	Lê Hoàng Thái	2008-09-16	male	Sán Dìu	2644	primary	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang		Tự do	05020102
47226	Nguyễn Đức Minh Trí	1962-11-22	male	Thái	2644	none	Không	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Phúc Yên Huyện Lâm Bình Tỉnh Tuyên Quang	203135601	Lao động giản đơn	05020102
47227	Trần Ngọc Yến Nhi	1986-11-15	female	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	206132001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020201
47228	Trần Bảo Khanh	2005-04-24	female	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	206074801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020201
47229	Nguyễn Võ Minh Nhi	1959-02-26	female	Lào	2646	none	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	205885601	Nhân viên trợ lý văn phòng	05020201
47230	Ngô Trịnh Đức Thiên	1995-11-25	male	Kinh (Việt)	2646	university	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	205926601	Lao động giản đơn	05020201
47231	Nguyễn Anh Tuấn	2014-02-14	male	Kinh (Việt)	2646	None	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05020201
47232	Nguyễn Cẩm Ly	2019-11-09	female	Kinh (Việt)	2646	None	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lực lượng vũ trang	05020201
47233	Cao Nhất Duy Linh	1966-10-23	male	Kinh (Việt)	2646	none	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	202863601	Nhân viên dịch vụ và bán hàng	05020201
47234	Hồ Liễu Trang Đài	1983-09-17	female	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	201645301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020201
47235	Nguyễn Thị Ngọc Phương	2010-11-01	female	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lực lượng vũ trang	05020201
47236	Đinh Đăng Khoa	1986-10-23	male	Ngái	2646	primary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	200082901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020201
47237	Lê Bùi Nhã Nguyên	1960-12-10	female	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	201066301	Tự do	05020201
47238	Nguyễn Hoàng Nam Anh	2017-12-31	male	Kinh (Việt)	2646	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020201
47239	Nguyễn Hoàng Tiến	1967-01-19	male	Kinh (Việt)	2646	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	208651001	Lao động giản đơn	05020201
47240	Nguyễn Tấn Lộc	1974-10-24	male	Kinh (Việt)	2646	none	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	200928301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05020201
47241	Võ Xuân Khoa	2019-04-10	male	Kinh (Việt)	2646	None	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05020201
47242	Lê Nguyễn Nhật Duy	1986-08-16	male	Kinh (Việt)	2646	none	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	203918201	Lực lượng vũ trang	05020201
47243	Lưu Huyền Trâm	1940-07-24	female	Kinh (Việt)	2646	none	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	203316401	Lao động giản đơn	05020201
47244	Nguyễn Anh Dương	1967-06-19	male	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	206680801	Lao động thủ công và các nghề nghiệp có liên quan khác	05020201
47245	Huỳnh Hà Nhật Tân	2008-10-11	male	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020201
47246	Nguyễn Đức Huy	1982-01-31	male	Kinh (Việt)	2646	primary	Không	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	207192101	Lực lượng vũ trang	05020201
47247	Nguyễn Minh Phúc	1999-10-25	male	Kinh (Việt)	2647		Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	200483401	Thợ lắp ráp và vận hành máy móc, thiết bị	05020202
47248	Trần Quang Thiên	1977-06-07	male	Kinh (Việt)	2647	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	207943401	Lao động giản đơn	05020202
47249	Lý Minh Luân	1973-07-21	male	Kinh (Việt)	2647	primary	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	204239401	Lao động giản đơn	05020202
47250	Lư Diệu Đông	1959-07-13	male	Kinh (Việt)	2647	none	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	204510101	Nhà chuyên môn bậc cao (đại học trở lên)	05020202
47251	Lương Cẩm Nhung	2009-06-17	female	Kinh (Việt)	2647	primary	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020202
47252	Trần Thị Phương Anh	1970-03-23	female	Kinh (Việt)	2647	none	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	207083101	Nhân viên dịch vụ và bán hàng	05020202
47253	Huỳnh Thiện Thái Hà	2003-11-21	male	Kinh (Việt)	2647	primary	Mặc môn	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	201977001	Lao động giản đơn	05020202
47254	Nguyễn Ngọc Trâm Anh	1968-05-21	female	Kinh (Việt)	2647	none	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	207468601	Lao động giản đơn	05020202
47255	Nguyễn Tấn Bảo	1991-08-26	male	Kinh (Việt)	2647		Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	208746101	Thợ lắp ráp và vận hành máy móc, thiết bị	05020202
47256	Nguyễn Thị Yến Nhi	1967-08-07	female	Kinh (Việt)	2647	high	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	208370801	Nhân viên dịch vụ và bán hàng	05020202
47257	Trần Khánh Hân	2018-08-01	female	Kinh (Việt)	2647	None	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05020202
47258	Nguyễn Linh Anh	1964-08-10	female	Kinh (Việt)	2647	primary	Hồi giáo	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	201957101	Lao động giản đơn	05020202
47259	Nguyễn Khắc Triệu	1947-10-30	male	Kinh (Việt)	2647	high	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	204538301	Nhân viên dịch vụ và bán hàng	05020202
47260	Trần Hưng Thịnh	2005-05-08	male	Kinh (Việt)	2647	primary	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	201752201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020202
47261	Lê Thị Kim Cúc	1971-03-09	female	Gié-Triêng	2647	none	Baha'I	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	206671101	Lực lượng vũ trang	05020202
47262	Trần Phạm Phương Dung	1948-12-27	female	Kinh (Việt)	2647	primary	Mặc môn	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	205411801	Lao động giản đơn	05020202
47263	Lê Hoàng Tuấn	1955-07-04	male	Kinh (Việt)	2647	primary	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	200718301	Lao động giản đơn	05020202
47264	Huỳnh Ngọc Hồng Phúc	1965-10-31	male	Kinh (Việt)	2647	none	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	208481401	Lao động giản đơn	05020202
47265	Nguyễn Đặng Thùy Linh	2014-01-15	female	Kinh (Việt)	2647	None	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020202
47266	Đỗ Thị Kim Ngân	2020-09-21	female	Kinh (Việt)	2647	None	Không	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Xuân Lập Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020202
47267	Nguyễn Lê Minh Tuấn	2013-10-15	male	Kinh (Việt)	2649	None	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lực lượng vũ trang	05020301
47268	Lâm Phúc Khang	2005-10-24	male	Tày	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205434601	Lực lượng vũ trang	05020301
47269	Nguyễn Minh Hoàng	2004-11-10	male	Kinh (Việt)	2649	secondary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	204521201	Lao động giản đơn	05020301
47270	Lâm Khả Hân	1997-07-28	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	201978801	Lao động giản đơn	05020301
47271	Trần Minh Huy	1995-12-28	male	Kinh (Việt)	2649	secondary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	207193001	Thợ lắp ráp và vận hành máy móc, thiết bị	05020301
47272	Phạm Trang Khả Ái	2014-11-04	female	Kinh (Việt)	2649	None	Phật giáo	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020301
47273	Nguyễn Văn Song	2015-07-06	male	Kinh (Việt)	2649	None	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05020301
47274	Hà Đường Thanh Phong	2010-07-14	male	Tày	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05020301
47275	Trần Huỳnh Hồng Chí A Sanh	1976-10-08	male	Tày	2649		Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205908101	Lao động giản đơn	05020301
47276	Nguyễn Thị Thu Ngân	1934-10-07	female	Kinh (Việt)	2649	university	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200573201	Lao động giản đơn	05020301
47277	Kiều Hoàng Nguyên	1984-05-05	male	Kinh (Việt)	2649	secondary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	207434501	Lao động giản đơn	05020301
47278	Trương Nguyễn Mai Khanh	1952-09-27	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200299901	Lao động giản đơn	05020301
47279	Trương Hiếu Quyền	1995-04-08	male	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	208875801	Lao động giản đơn	05020301
47280	Nguyễn Trần Kim Tuyền	1962-12-16	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	201253301	Lao động giản đơn	05020301
47281	Nguyễn Thanh Trúc	1972-09-13	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205382401	Lao động thủ công và các nghề nghiệp có liên quan khác	05020301
47282	Nguyễn Trường Phát	2017-07-28	male	Kinh (Việt)	2649	None	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020301
47283	Đinh Châu Lê Ngọc	1985-08-21	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	203674401	Lao động giản đơn	05020301
47284	Ngô Tuấn Kiệt	1930-11-26	male	Kinh (Việt)	2649	secondary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200022301	Nhà chuyên môn bậc cao (đại học trở lên)	05020301
47285	Nguyễn Hoàng Yến Nhi	1963-01-24	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200751301	Lao động giản đơn	05020301
47286	Trần Ngọc Uyên Nhi	2005-11-03	female	Kinh (Việt)	2649	primary	Không	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 1 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200480301	Tự do	05020301
47287	Trần Ngọc Nhi	2007-11-14	female	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020302
47288	Huỳnh Thị Minh Tâm	2017-11-26	female	Thổ	2650	None	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Nhân viên trợ lý văn phòng	05020302
47289	Diệp Quang Vinh	2019-02-14	male	Kinh (Việt)	2650	None	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020302
47290	Nguyễn Đỗ Mai Anh	1998-07-31	female	Kinh (Việt)	2650		Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205248401	Lao động giản đơn	05020302
47291	Nguyễn Gia Bảo	1988-11-25	male	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	207090001	Lao động giản đơn	05020302
47292	Nguyễn Văn Linh	1959-06-03	male	Kinh (Việt)	2650	none	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	203103601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020302
47293	Nguyễn Tạ Ngọc Trâm	2005-01-22	female	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	206443601	Lao động giản đơn	05020302
47294	Trần Nguyễn Văn Hậu	2014-02-09	male	Kinh (Việt)	2650	None	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020302
47295	Nguyễn Lê Minh Đăng	1983-08-14	male	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	200975701	Tự do	05020302
47296	Võ Trần Lâm	1964-12-16	male	Kinh (Việt)	2650	secondary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	207893901	Lao động thủ công và các nghề nghiệp có liên quan khác	05020302
47297	Nguyễn Thị Thu Ngân	1989-10-18	female	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	208790801	Lao động giản đơn	05020302
47298	Nguyễn Lê Minh Thư	2010-10-09	female	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05020302
47299	Hồ Nhật Anh	2000-04-22	female	Kinh (Việt)	2650		Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	204491701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05020302
47300	Nguyễn Xuân Mai	1963-02-17	female	Kinh (Việt)	2650	none	Công giáo	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205820501	Nhà chuyên môn bậc cao (đại học trở lên)	05020302
47301	Võ Nguyễn Trường Phúc	2006-07-29	male	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020302
47302	Trần Ngọc Khánh	2007-02-05	male	Kinh (Việt)	2650	primary	Minh Sư đạo	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Lao động giản đơn	05020302
47303	Bùi Hồng Thanh	1971-02-09	female	Cơ Lao	2650	none	Cơ đốc Phục lâm	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	206809001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05020302
47304	Võ Thành Tài	1969-05-30	male	Kinh (Việt)	2650	primary	Cao đài	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205911101	Lao động thủ công và các nghề nghiệp có liên quan khác	05020302
47305	Trần Ngọc Hiếu	2019-01-22	male	Thái	2650	None	Tin lành	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang		Tự do	05020302
47306	Dương Minh Khoa	1963-12-26	male	Kinh (Việt)	2650	primary	Không	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	Thôn 2 Xã Khuôn Hà Huyện Lâm Bình Tỉnh Tuyên Quang	205437601	Tự do	05020302
47307	Đỗ Minh Nhựt	1922-09-05	male	Kinh (Việt)	2653	none	Cao đài	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	201003101	Lực lượng vũ trang	05030101
47308	Nguyễn Thành Phát	1985-08-22	male	Thái	2653	none	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	202221301	Lao động giản đơn	05030101
47309	Nguyễn Hoàng Anh Thư	1981-06-20	female	Kinh (Việt)	2653	none	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	202709401	Lao động giản đơn	05030101
47310	Nguyễn Thị Bích Ngọc	1959-06-09	female	Kinh (Việt)	2653	high	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	204884301	Lao động giản đơn	05030101
47311	Nguyễn Thị Kim Xuân	1968-08-05	female	Khơ-me	2653	primary	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	201519301	Lao động giản đơn	05030101
47312	Thái Cao Anh Tài	1986-01-13	male	Kinh (Việt)	2653	university	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	207791701	Lao động giản đơn	05030101
47313	Nguyễn Huy Vinh	1973-03-27	male	Cơ-tu	2653	primary	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	207745901	Nhân viên dịch vụ và bán hàng	05030101
47314	Nguyễn Thị Ánh Linh	1988-02-16	female	Lô lô	2653	secondary	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	203337501	Lao động giản đơn	05030101
47315	Nguyễn Thị Lan Anh	1992-10-25	female	Kinh (Việt)	2653	high	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	208426201	Tự do	05030101
47316	Trần Thái Tú	2020-12-10	male	Kinh (Việt)	2653	None	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030101
47317	Nguyễn Hoàng Hoa	1935-03-20	female	Kinh (Việt)	2653	high	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	202596801	Tự do	05030101
47318	Vũ Thị Ngọc Linh	1962-09-24	female	Kinh (Việt)	2653	high	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	202977801	Lao động giản đơn	05030101
47319	Hồng Hạo Nhiên	1982-10-15	male	Kinh (Việt)	2653	none	Hồi giáo	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	202603901	Lao động thủ công và các nghề nghiệp có liên quan khác	05030101
47320	Thạch Thị Kim Ngọc	2002-12-21	female	Kinh (Việt)	2653		Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	205880301	Lao động giản đơn	05030101
47321	Nguyễn Quốc Anh	1988-01-11	male	Kinh (Việt)	2653	primary	Phật giáo	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	204186201	Nhân viên dịch vụ và bán hàng	05030101
47322	Trương Hoàng Sơ Dương	1972-03-01	female	Kinh (Việt)	2653	primary	Mặc môn	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	200520401	Lao động giản đơn	05030101
47323	Nguyễn Thị Bích Ngọc	2003-01-06	female	Ơ Đu	2653	primary	Phật giáo	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	203423101	Lao động giản đơn	05030101
47324	Bùi Quý Việt Phương	2014-08-24	male	Kinh (Việt)	2653	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030101
47325	Nguyễn Võ Bảo Phúc	2012-04-04	male	Kinh (Việt)	2653	None	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030101
47326	Lương Kỳ Anh	1987-06-11	female	Kinh (Việt)	2653	high	Không	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	206359101	Lao động giản đơn	05030101
47327	Nguyễn Ngọc Phúc Nguyên	1966-07-01	female	Kinh (Việt)	2654	high	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	200578501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05030102
47328	Nguyễn Hoàng Bảo Ngọc	1974-05-07	female	Tày	2654	none	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	201065701	Lao động giản đơn	05030102
47329	Nguyễn Ngọc Minh Thy	1993-08-09	female	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	204220601	Lao động giản đơn	05030102
47330	Mai Gia Huy	2014-06-27	male	Kinh (Việt)	2654	None	Hồi giáo	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030102
47331	Huỳnh Phúc Cẩm Quế	1945-05-09	female	Xinh-mun	2654	none	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	205178301	Nhà chuyên môn bậc cao (đại học trở lên)	05030102
47332	Ngô Thị Hồng Nhung	1993-06-09	female	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	205173401	Thợ lắp ráp và vận hành máy móc, thiết bị	05030102
47333	Nguyễn Ngọc Như Trinh	2010-04-18	female	Thái	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030102
47334	Võ Thị Hồng Thy	2002-04-04	female	Kinh (Việt)	2654		Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	206189501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030102
47335	Nguyễn Thị Hồng Loan	2004-02-03	female	Xtiêng	2654	primary	Phật giáo Hòa Hảo	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	201707801	Lao động giản đơn	05030102
47336	Võ Ngọc Phương Trang	1983-03-13	female	Kinh (Việt)	2654	primary	Cơ đốc Phục lâm	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	204535001	Nhân viên trợ lý văn phòng	05030102
47337	Phạm Thị Cát Tường	2020-05-18	female	Kinh (Việt)	2654	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05030102
47338	Nguyễn Minh Thắng	2003-10-18	male	Kinh (Việt)	2654	secondary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	206432801	Nhân viên trợ lý văn phòng	05030102
47339	Bùi Thị Đoan Phụng	2020-06-28	female	Kinh (Việt)	2654	None	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05030102
47340	Nguyễn Thanh Thảo Vy	1983-05-26	female	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	200901301	Nhân viên dịch vụ và bán hàng	05030102
47341	Nguyễn Thị Yến Nhi	2013-07-24	female	Kinh (Việt)	2654	None	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05030102
47342	Vũ Đình Thuận	2009-05-21	male	Ơ Đu	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030102
47343	Võ Thùy Dương	2008-02-18	female	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05030102
47344	Nguyễn Hải Đăng	1996-09-26	male	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	207136701	Lao động giản đơn	05030102
47345	Trần Ngọc Thùy Linh	1973-12-02	female	Kinh (Việt)	2654	primary	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	201173401	Tự do	05030102
47346	Lê Mạnh Duy	1963-03-24	male	Kinh (Việt)	2654	none	Không	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Thị trấn Na Hang Huyện Na Hang Tỉnh Tuyên Quang	204004701	Nhà chuyên môn bậc cao (đại học trở lên)	05030102
47347	Lê Lam Phương	1985-02-08	female	Tày	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	205198901	Lao động giản đơn	05030201
47348	Nguyễn Ngọc Cao Vân	1968-03-30	female	Kinh (Việt)	2656	none	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	200117501	Nhân viên trợ lý văn phòng	05030201
47349	Lại Hoàng Tuấn Anh	2008-06-23	male	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030201
47350	Vũ Uyên My	2011-01-03	female	Kinh (Việt)	2656	primary	Bà-la-môn giáo	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030201
47351	Phan Hồng Minh	2010-04-08	male	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05030201
47352	Đặng Đăng Đăng	1967-03-28	male	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	203084901	Lao động giản đơn	05030201
47353	Phạm Thị Như Ngọc	1988-04-30	female	Kinh (Việt)	2656	none	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	208831601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030201
47354	Phạm Thuần Phong	1994-04-11	male	Kinh (Việt)	2656	secondary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	205194001	Lao động giản đơn	05030201
47355	Đào Lưu Trung Nhật	2021-10-27	male	Mnông	2656	None	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05030201
47356	Đặng Thụy Minh Hạnh	2006-05-22	female	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030201
47357	Lưu Bảo Châu	1961-10-14	female	Kinh (Việt)	2656	none	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	205687001	Thợ lắp ráp và vận hành máy móc, thiết bị	05030201
47358	Nguyễn Hoàng Nam Anh	1972-06-30	male	Kinh (Việt)	2656	secondary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	203709001	Lao động giản đơn	05030201
47359	Nguyễn Trần Thúy Vy	1973-12-29	female	Kinh (Việt)	2656	secondary	Phật giáo	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	206408501	Lao động giản đơn	05030201
47360	Võ Thành Nhân	2006-08-24	male	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05030201
47361	Lê Ngọc Anh Tuấn	2006-05-19	male	Kinh (Việt)	2656	primary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030201
47362	Nguyễn Ngọc Quỳnh Anh	1988-12-14	female	Kinh (Việt)	2656	none	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	200237701	Lao động giản đơn	05030201
47363	Trần Đức Tính	2016-11-14	male	Kinh (Việt)	2656	None	Phật giáo	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030201
47364	Huỳnh Phan Tường Huy	1981-11-13	male	Kinh (Việt)	2656	secondary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	200794201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	05030201
47365	Bành Ngọc Bảo Trân	1992-06-16	female	Kinh (Việt)	2656	secondary	Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	200054401	Lao động giản đơn	05030201
47366	Nguyễn Đăng Trí Phúc	1998-06-18	male	Kinh (Việt)	2656		Không	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	201604901	Lao động giản đơn	05030201
47367	Nguyễn Diên Hy	2016-04-24	female	Kinh (Việt)	2657	None	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Nhân viên dịch vụ và bán hàng	05030202
47368	Tạ Trường Thịnh	1988-09-21	male	Kinh (Việt)	2657	high	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	204485001	Thợ lắp ráp và vận hành máy móc, thiết bị	05030202
47369	Đỗ Đình Chiến	1974-04-14	male	Cơ-tu	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	202799501	Lao động giản đơn	05030202
47370	Lương Quang Trí	2014-04-08	male	Tày	2657	None	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030202
47371	Cao Thanh Tuấn	2018-08-23	male	Kinh (Việt)	2657	None	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030202
47372	Nguyễn Lê Mỹ Thy	2013-03-14	female	Kinh (Việt)	2657	None	Tin lành	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05030202
47373	Võ Minh Trung	1959-03-01	male	Kinh (Việt)	2657	high	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	201864601	Nhà chuyên môn bậc cao (đại học trở lên)	05030202
47374	Triệu Phương Nam	2018-05-28	male	Kinh (Việt)	2657	None	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030202
47375	Trịnh Thị Kim Ngân	2007-12-22	female	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Nhân viên dịch vụ và bán hàng	05030202
47376	Nguyễn Trung Kiên	2012-03-25	male	Kinh (Việt)	2657	None	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Tự do	05030202
47377	Dương Thúy Nga	2009-12-20	female	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang		Nhân viên dịch vụ và bán hàng	05030202
47378	Trương Hoài Nam	1994-07-06	male	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	207904601	Nhân viên trợ lý văn phòng	05030202
47379	Nguyễn Hoàng Phúc Nguyên	1961-09-13	male	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	205462101	Tự do	05030202
47380	Phạm Đỗ Hoàng	1975-09-14	male	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	206702501	Lao động giản đơn	05030202
47381	Chu Hải Hưng	1975-12-17	male	Bru-Vân Kiều	2657	none	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	202602201	Lao động giản đơn	05030202
47382	Trần Vĩnh Hưng	2004-08-26	male	Kinh (Việt)	2657	primary	Cơ đốc Phục lâm	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	205020501	Nhà chuyên môn bậc cao (đại học trở lên)	05030202
47383	Nguyễn Hoàng Gia Huy	1985-07-31	male	Kinh (Việt)	2657	none	Mặc môn	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	200154101	Nhân viên dịch vụ và bán hàng	05030202
47384	Nguyễn Thị Kim Ngân	1961-03-09	female	Kinh (Việt)	2657	high	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	203967901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	05030202
47385	Nguyễn Đỗ Thanh Mai	1977-10-04	female	Kinh (Việt)	2657	primary	Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	202426801	Nhân viên trợ lý văn phòng	05030202
47386	Nguyễn Lê Khả Tú	2001-01-10	female	Hrê	2657		Không	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Sinh Long Huyện Na Hang Tỉnh Tuyên Quang	203945301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030202
47387	Lê Thị Ngọc Hân	1980-04-14	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	201467201	Lao động giản đơn	05030301
47388	Đỗ Đình Hà	2010-09-28	male	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05030301
47389	Nguyễn Ngọc Hưng	2016-06-27	male	Kinh (Việt)	2659	None	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05030301
47390	Nguyễn Yến Như	2013-12-26	female	Kinh (Việt)	2659	None	Hồi giáo	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030301
47391	Lê Huỳnh Như	1980-01-29	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	202285001	Nhân viên dịch vụ và bán hàng	05030301
47392	Phạm Thảo Vy	1989-05-10	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	207641501	Nhân viên dịch vụ và bán hàng	05030301
47393	Thân Ngọc Sơn Ly	1938-07-03	female	Kinh (Việt)	2659	none	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	202742901	Lao động giản đơn	05030301
47394	Đỗ Trần Kim Yến	2013-09-10	female	Kinh (Việt)	2659	None	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030301
47395	Trần Hữu Nhân	1978-01-28	male	Kinh (Việt)	2659	none	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	206127901	Lao động thủ công và các nghề nghiệp có liên quan khác	05030301
47396	Lê Hữu Anh	1986-03-18	male	Kinh (Việt)	2659	none	Baha'I	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203149901	Lao động giản đơn	05030301
47397	Trần Vương Duy	2016-02-25	male	Kinh (Việt)	2659	None	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030301
47398	Huỳnh Thanh Tuyền	2010-03-31	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05030301
47399	Thái Tuấn Minh	1975-06-25	male	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	201898901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	05030301
47400	Nguyễn Trường Thịnh	2006-01-27	male	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05030301
47401	Lê Nguyễn Trung Thùy Dung	1938-09-07	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203717301	Nhân viên trợ lý văn phòng	05030301
47402	Vi Hà Phương Anh	1977-12-16	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	208741901	Lao động giản đơn	05030301
47403	Lê Thanh Hằng	1967-12-24	female	Ngái	2659	high	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	208158401	Lao động giản đơn	05030301
47404	Đào Văn Quang	1958-05-27	male	Kinh (Việt)	2659	none	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203558001	Lao động giản đơn	05030301
47405	Trần Thị Hồng Nhung	1924-11-21	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203485801	Lao động thủ công và các nghề nghiệp có liên quan khác	05030301
47406	Lê Hồng Thơ	2011-05-04	female	Kinh (Việt)	2659	primary	Không	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 1 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động giản đơn	05030301
47407	Lê Thị Tú My	2016-10-21	female	Kinh (Việt)	2660	None	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Nhà chuyên môn bậc cao (đại học trở lên)	05030302
47408	Nguyễn Đỗ Như Ý	1973-07-31	female	Kinh (Việt)	2660	none	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203954501	Lao động giản đơn	05030302
47409	Lê Quang Duy	1965-09-11	male	Kinh (Việt)	2660	secondary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	201158701	Lao động giản đơn	05030302
47410	Bùi Lê Anh Thi	2002-09-18	female	Kinh (Việt)	2660		Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203301001	Lao động thủ công và các nghề nghiệp có liên quan khác	05030302
47411	Nguyễn Phan Quang Sơn	1975-09-12	male	Kinh (Việt)	2660	primary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203562101	Nhân viên dịch vụ và bán hàng	05030302
47412	Nguyễn Hiền Xuân Mai	2002-12-29	female	Khơ-me	2660		Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	207258301	Lao động giản đơn	05030302
47413	Nguyễn Thị Như Quỳnh	1963-08-24	female	Kinh (Việt)	2660	secondary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	208268301	Lao động giản đơn	05030302
47414	Lê Ngọc Phương Như	2003-08-14	female	Kinh (Việt)	2660	high	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	206782801	Lao động giản đơn	05030302
47415	Dương Hoàng Anh	2021-08-31	female	Kinh (Việt)	2660	None	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lao động thủ công và các nghề nghiệp có liên quan khác	05030302
47416	Phạm Minh Tuyết	2020-08-07	female	Kinh (Việt)	2660	None	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Lực lượng vũ trang	05030302
47417	Trần Xuân Thành	1968-10-29	male	Kinh (Việt)	2660	none	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	200046601	Lao động giản đơn	05030302
47418	Trần Hoài Phương An	1973-10-10	female	Kinh (Việt)	2660	none	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203258701	Nhân viên trợ lý văn phòng	05030302
47419	Lê Vũ Tiến	1972-11-26	male	Kinh (Việt)	2660	primary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	202290401	Tự do	05030302
47420	Phạm Vân Khanh	1987-01-16	female	Kinh (Việt)	2660	none	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	206955701	Lao động giản đơn	05030302
47421	Nguyễn Mai Kim Ngân	1980-09-12	female	Kinh (Việt)	2660	high	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203421801	Lao động giản đơn	05030302
47422	Nguyễn Thị Quỳnh Như	1968-01-14	female	Kinh (Việt)	2660	none	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	201379301	Lao động giản đơn	05030302
47423	Lê Thị Thanh Ngọc	1958-06-09	female	Kinh (Việt)	2660	primary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	202214601	Nhà chuyên môn bậc cao (đại học trở lên)	05030302
47424	Trần Thị Phương Anh	2010-01-19	female	Kinh (Việt)	2660	primary	Baha'I	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang		Thợ lắp ráp và vận hành máy móc, thiết bị	05030302
47425	Nguyễn Kim Anh	1999-06-22	female	Kinh (Việt)	2660		Tin lành	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	203584101	Thợ lắp ráp và vận hành máy móc, thiết bị	05030302
47426	Đỗ Xuân Trường	1922-09-29	male	Kinh (Việt)	2660	primary	Không	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	Thôn 2 Xã Thượng Giáp Huyện Na Hang Tỉnh Tuyên Quang	207055501	Lao động giản đơn	05030302
47427	Trần Gia Bảo	2017-11-15	male	Kinh (Việt)	2664	None	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010101
47428	Nguyễn Phương Uyên	1969-07-14	female	Kinh (Việt)	2664	secondary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	204350101	Tự do	06010101
47429	Ngô Ngọc Tường Vi	1998-11-21	female	Kinh (Việt)	2664		Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	202243001	Lao động giản đơn	06010101
47430	Nguyễn Thị Tường Vy	2001-06-14	female	Kinh (Việt)	2664		Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	205240701	Lao động giản đơn	06010101
47431	Lê Minh Như	2008-10-13	female	Kinh (Việt)	2664	primary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010101
47432	Vương Đại Phú	1977-09-25	male	Kinh (Việt)	2664	none	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	202043701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06010101
47433	Hồ Nguyễn Nhã Uyên	1973-11-06	female	Kinh (Việt)	2664	none	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200440901	Nhân viên trợ lý văn phòng	06010101
47434	Lê Thị Tuyết Mai	1984-10-17	female	Kinh (Việt)	2664	high	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	206927201	Nhà chuyên môn bậc cao (đại học trở lên)	06010101
47435	Sơn Ngọc Uyên Nhi	2013-11-07	female	Kinh (Việt)	2664	None	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06010101
47436	Hà Thúc Quân	2014-11-16	male	Kinh (Việt)	2664	None	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Tự do	06010101
47437	Nguyễn Hoàng Thanh Vân	2020-05-06	female	Kinh (Việt)	2664	None	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010101
47438	Bùi Thiên Kim	1961-07-01	female	Kinh (Việt)	2664	primary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	205442201	Lao động thủ công và các nghề nghiệp có liên quan khác	06010101
47439	Trần Nguyễn Anh Khôi	2015-06-10	male	Kinh (Việt)	2664	None	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06010101
47440	Lê Hoàng Thiên Hùng	1954-09-21	male	Kinh (Việt)	2664	primary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	204646301	Lao động giản đơn	06010101
47441	Đỗ Tiến Hoàng Khiêm	1979-01-25	male	Kinh (Việt)	2664	primary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200182701	Lao động giản đơn	06010101
47442	Đặng Ngọc Thu Ngân	2001-04-27	female	Kinh (Việt)	2664		Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	204974701	Lao động giản đơn	06010101
47443	Bùi Minh Triết	1954-10-13	male	Kinh (Việt)	2664	high	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	202401801	Lao động giản đơn	06010101
47444	Nguyễn Minh Quốc Khánh	1998-12-18	male	Kinh (Việt)	2664		Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200181901	Lao động giản đơn	06010101
47445	Trịnh Quang Hưng	2010-06-07	male	Kinh (Việt)	2664	primary	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010101
47446	Phạm Anh Tuấn	1981-11-04	male	Kinh (Việt)	2664	none	Không	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200718901	Lao động giản đơn	06010101
47447	Vũ Quế Phương	1970-03-24	female	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	205199801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06010102
47448	Nguyễn Thị Thiên Kim	2013-11-29	female	Kinh (Việt)	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47449	Nguyễn Ngọc Khánh Linh	2018-03-27	female	Kinh (Việt)	2665	None	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47450	Hà Lê Quỳnh Như	1967-08-15	female	Kinh (Việt)	2665	high	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	206782301	Lao động giản đơn	06010102
47451	Nguyễn Thục Nghi	2010-07-08	female	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47452	Lê Trọng Đức	2000-10-28	male	Kinh (Việt)	2665		Cơ đốc Phục lâm	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	207681201	Nhà chuyên môn bậc cao (đại học trở lên)	06010102
47453	Lê Thành Thuận	1928-06-15	male	Kinh (Việt)	2665	none	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	203129601	Lao động giản đơn	06010102
47454	Phạm Nguyễn Tú Uyên	2000-10-08	female	Kinh (Việt)	2665		Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	201869501	Nhân viên dịch vụ và bán hàng	06010102
47455	Nguyễn Kim Thảo Vi	2018-01-24	female	Kinh (Việt)	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47456	Lương Thanh Sơn	2011-10-10	male	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06010102
47457	Trương Nguyễn Thúy Vy	2008-06-28	female	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47458	Huỳnh Vũ Mãn Anh	1962-06-20	female	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200234201	Lao động giản đơn	06010102
47459	Lương Thị Kim Ngân	2019-12-16	female	Kinh (Việt)	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010102
47460	Đỗ Trung Kiên	1978-06-17	male	Kinh (Việt)	2665	high	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	204215801	Nhân viên dịch vụ và bán hàng	06010102
47461	Nguyễn Phan Hoàng Minh	2013-10-04	male	Bố Y	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06010102
47462	Võ Thị Thu Dung	1964-03-06	female	Kinh (Việt)	2665	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	204114201	Lao động giản đơn	06010102
47463	Nguyễn Thị Mộng Mơ	2020-12-30	female	Kinh (Việt)	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lực lượng vũ trang	06010102
47464	Vũ Anh Huy	1960-07-15	male	Kinh (Việt)	2665	secondary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	200292001	Lao động giản đơn	06010102
47465	Nguyễn Phương Nam	2004-08-29	male	Kinh (Việt)	2665	primary	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	202333501	Lao động giản đơn	06010102
47466	Đoàn Ngọc Hạnh	2015-10-01	female	Kinh (Việt)	2665	None	Không	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Duyên Hải Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010102
47467	Nguyễn Thụy Thanh Loan	1993-09-23	female	Hoa (Hán)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	201481001	Lao động giản đơn	06010201
47468	Huỳnh Thị Thảo Ly	2021-03-11	female	Kinh (Việt)	2667	None	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06010201
47469	Đặng Xuân Hoài	2000-03-22	female	Tày	2667		Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	207989801	Lao động giản đơn	06010201
47470	Nguyễn Trần Hữu Thắng	2018-06-19	male	Kinh (Việt)	2667	None	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010201
47471	Hồ Nguyên Phúc	1974-06-22	male	Kinh (Việt)	2667	university	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	205862301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06010201
47472	Nguyễn Cao Phương Trinh	2001-12-28	female	Kinh (Việt)	2667		Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	201998401	Lao động giản đơn	06010201
47473	Bùi Mai Phương	1926-10-14	female	Kinh (Việt)	2667	secondary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	200319201	Lao động giản đơn	06010201
47474	Lê Đức Anh	1964-04-17	male	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	200064801	Lao động giản đơn	06010201
47475	Văn Cẩm Ngọc	2013-12-01	female	Mảng	2667	None	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06010201
47476	Phan Thị Bảo Linh	1958-08-02	female	Thái	2667	none	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	204687001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010201
47477	Nguyễn Phương Vy	2001-03-10	female	Kinh (Việt)	2667		Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	201688801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010201
47478	Nguyễn Thị Ngọc Nhung	2007-04-11	female	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06010201
47479	Nguyễn Ngọc Nhật Lan	2017-10-14	female	Kinh (Việt)	2667	None	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010201
47480	Lê Huy Hoài	1978-07-07	male	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	204644401	Lao động giản đơn	06010201
47481	Đặng Mạnh Cường	2009-07-12	male	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010201
47482	Trần Thị Kim Anh	1980-09-13	female	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	202377601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06010201
47483	Nguyễn Ngọc Yến Nhi	2005-07-09	female	Kinh (Việt)	2667	secondary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	207909001	Lao động giản đơn	06010201
47484	Lê Bá Phúc Thịnh	2010-06-20	male	Kinh (Việt)	2667	primary	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010201
47485	Châu Minh Phú	2021-11-13	male	Kinh (Việt)	2667	None	Không	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010201
47486	Hoàng Xuân Khánh	2015-05-10	male	Tày	2667	None	Tin lành	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06010201
47487	Võ Thanh Hằng	1962-12-24	female	Kinh (Việt)	2668	none	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	206233801	Nhân viên trợ lý văn phòng	06010202
47488	Trần Gia Hân	1996-09-16	female	Kinh (Việt)	2668	secondary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	207699101	Lao động thủ công và các nghề nghiệp có liên quan khác	06010202
47489	Phạm Nguyễn Nhật Trường	1958-01-15	male	Kinh (Việt)	2668	secondary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	204948101	Lao động giản đơn	06010202
47490	Trần Trung Đức	2013-03-01	male	Gia-rai	2668	None	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010202
47491	Huỳnh Nguyễn Yến Nhi	2019-05-23	female	Kinh (Việt)	2668	None	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06010202
47492	Ngô Hồng Thái	1995-08-12	male	Kinh (Việt)	2668	secondary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	208128501	Lực lượng vũ trang	06010202
47493	Nguyễn Minh Tuệ	2012-05-11	female	Kinh (Việt)	2668	None	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010202
47494	Huỳnh Mai	1971-05-25	female	Kinh (Việt)	2668	high	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	203418601	Lao động giản đơn	06010202
47495	Trần Trung Nghị	2015-12-19	male	Kinh (Việt)	2668	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010202
47496	Nguyễn Thị Ngọc Hân	2006-08-30	female	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Tự do	06010202
47497	Huỳnh Đức Khải	1995-11-23	male	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	202314201	Lao động giản đơn	06010202
47498	Phan Thiên Ân	1986-06-16	male	Kinh (Việt)	2668	university	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	201816601	Lực lượng vũ trang	06010202
47499	Nguyễn Hồ Thanh Tuấn	1995-08-20	male	Kinh (Việt)	2668	secondary	Cơ đốc Phục lâm	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	203844101	Lao động giản đơn	06010202
47500	Nguyễn Đoàn Gia Khang	2010-03-31	male	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010202
47501	Trương Kim Anh	2020-11-04	female	Kinh (Việt)	2668	None	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010202
47502	Vạn Quế Như	1988-06-10	female	Kinh (Việt)	2668	secondary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	205889801	Thợ lắp ráp và vận hành máy móc, thiết bị	06010202
47503	Võ Hoàng Đan Thy	2008-03-14	female	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai		Tự do	06010202
47504	Nguyễn Ngọc Kỳ Duyên	1960-09-21	female	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	208686801	Lao động giản đơn	06010202
47505	Huỳnh Kim Thảo	2003-02-26	female	Kinh (Việt)	2668	primary	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	203890401	Lao động giản đơn	06010202
47506	Trần Kim Ngân	1967-03-06	female	Kinh (Việt)	2668	none	Không	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Lào Cai Thành phố Lào Cai Tỉnh Lào Cai	205832001	Lao động giản đơn	06010202
47507	Nguyễn Công Thành	1963-02-23	male	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	203830701	Tự do	06010301
47508	Nguyễn Sỹ Hoàng Anh	2005-06-12	male	Kinh (Việt)	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	207078201	Lao động giản đơn	06010301
47509	Trần Gia Luân	2013-06-11	male	Kinh (Việt)	2670	None	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47510	Đỗ Thị Ngọc Thúy	1996-01-09	female	Kinh (Việt)	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	201398401	Lao động giản đơn	06010301
47511	Tạ Cát Bích Tâm	2006-11-19	female	Kinh (Việt)	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47512	Hà Quốc Hùng	2003-01-01	male	Kinh (Việt)	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	200461501	Lao động giản đơn	06010301
47513	Trần Ngọc Như Quỳnh	1978-08-18	female	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	200217401	Nhân viên trợ lý văn phòng	06010301
47514	Trần Hồ Thanh Tâm	1938-09-29	male	Kinh (Việt)	2670	high	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	201242601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06010301
47515	Nguyễn Thị Ngọc Yến	2017-04-15	female	Hoa (Hán)	2670	None	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47516	Nguyễn Chung Tường Vi	1941-08-30	female	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	200664901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06010301
47517	Nguyễn Xuân Dũng	2015-11-23	male	La Hủ	2670	None	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47518	Lư Gia Lệ	1965-04-13	female	Kinh (Việt)	2670	secondary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	202122201	Lao động giản đơn	06010301
47519	Lê Duy Thịnh	1982-08-10	male	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208133601	Lao động thủ công và các nghề nghiệp có liên quan khác	06010301
47520	Lê Thị Bích Ngọc	1973-12-10	female	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	203353501	Lao động giản đơn	06010301
47521	Nguyễn Hoàng Thủy Tiên	2008-03-25	female	Hrê	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47522	Huỳnh Tấn Đạt	1989-11-22	male	Kinh (Việt)	2670	none	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	202589701	Lực lượng vũ trang	06010301
47523	Nguyễn Thị Yến Nhi	1992-11-29	female	Xinh-mun	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	201183801	Nhà chuyên môn bậc cao (đại học trở lên)	06010301
47524	Phạm Vỹ Khang	1989-01-07	male	Kinh (Việt)	2670	high	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	204128901	Lao động giản đơn	06010301
47525	Nguyễn Quách Uyên Nhi	2008-11-17	female	Kinh (Việt)	2670	primary	Mặc môn	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010301
47526	Lê Gia Bảo	1960-02-04	male	Giáy	2670	primary	Không	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 1 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	204288301	Lao động giản đơn	06010301
47527	Dương Hoàng Phúc	2012-11-10	male	Kinh (Việt)	2671	None	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010302
47528	Hồng Nhật Lan	1994-07-21	female	Kinh (Việt)	2671	secondary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208809901	Lao động giản đơn	06010302
47529	Nguyễn Bá Khánh Trưởng	2004-02-19	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	202239701	Lao động giản đơn	06010302
47530	Phùng Nguyễn Minh Trí	1963-04-15	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	205966601	Lao động giản đơn	06010302
47531	Nguyễn Thị Bích Trâm	1940-08-19	female	Rơ-măm	2671	none	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	203940601	Nhà chuyên môn bậc cao (đại học trở lên)	06010302
47532	Nguyễn Ngọc Anh Thư	2000-12-27	female	Kinh (Việt)	2671		Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	206938201	Nhà chuyên môn bậc cao (đại học trở lên)	06010302
47533	Đỗ Văn Khải	1982-08-25	male	Brâu	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208786501	Tự do	06010302
47534	Tô Ngọc Phát	1977-09-09	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	201127201	Lao động giản đơn	06010302
47535	Tăng Nguyễn Thanh Hằng	2002-02-03	female	Kinh (Việt)	2671		Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	201162801	Lao động giản đơn	06010302
47536	Phan Phúc Vinh	1975-10-29	male	Kinh (Việt)	2671	high	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208210501	Lao động giản đơn	06010302
47537	Nguyễn Hoàng Long	1952-02-22	male	Thái	2671	none	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	202634901	Lao động giản đơn	06010302
47538	Đoàn Thành Đạt	1985-07-04	male	Kinh (Việt)	2671	secondary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208232201	Nhà chuyên môn bậc cao (đại học trở lên)	06010302
47539	Mai Nguyễn Phi Nhung	2004-08-03	female	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	204146701	Lao động giản đơn	06010302
47540	Nguyễn Ngọc Trinh	2005-12-12	female	Bố Y	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	208204501	Thợ lắp ráp và vận hành máy móc, thiết bị	06010302
47541	Vũ Huy Hoàng	1993-07-05	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	207397601	Lao động giản đơn	06010302
47542	Huỳnh Thúy Vy	1960-05-19	female	Kinh (Việt)	2671	none	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	200725301	Nhân viên trợ lý văn phòng	06010302
47543	Trương Trần Tuấn Kiệt	2004-11-21	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	206082701	Nhân viên trợ lý văn phòng	06010302
47544	Lê Nho Phước Lộc	1990-04-30	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	204566401	Lao động giản đơn	06010302
47545	Thái Bằng Khải Phong	2008-12-24	male	Kinh (Việt)	2671	primary	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động giản đơn	06010302
47546	Trần Mỹ Trinh	2017-10-22	female	Kinh (Việt)	2671	None	Không	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai	Thôn 2 Phường Cốc Lếu Thành phố Lào Cai Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06010302
47547	Trịnh Văn Hiệp	1965-04-03	male	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	208338701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020101
47548	Trần Ngọc Lan Anh	1998-12-02	female	Kinh (Việt)	2674		Minh Sư đạo	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	208321101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020101
47549	Lữ Gia Thành	2016-01-02	male	Chăm (Chàm)	2674	None	Phật giáo	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020101
47550	Lê Nhật Khôi	1988-08-11	male	Kinh (Việt)	2674	none	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	204752201	Lao động thủ công và các nghề nghiệp có liên quan khác	06020101
47551	Lê Hà Quế Trân	1968-04-15	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	204536501	Lao động giản đơn	06020101
47552	Lê Nguyễn Hương Thùy	1991-04-18	female	Kinh (Việt)	2674		Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	201080901	Nhà chuyên môn bậc cao (đại học trở lên)	06020101
47553	Nguyễn Ngọc Minh Châu	1983-01-02	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	205408101	Lao động giản đơn	06020101
47554	Nguyễn Ngọc Minh Thư	2013-10-22	female	Kinh (Việt)	2674	None	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Nhà chuyên môn bậc cao (đại học trở lên)	06020101
47555	Trương Quỳnh Lam	2004-03-25	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	202737901	Lực lượng vũ trang	06020101
47556	Nguyễn Thị Lâm Oanh	1972-05-04	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	202285701	Lao động giản đơn	06020101
47557	Trần Ngọc Bích Vy	1976-10-27	female	Kinh (Việt)	2674		Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	204416101	Lao động giản đơn	06020101
47558	Nguyễn Ngọc Thảo Nhi	1980-02-27	female	Kinh (Việt)	2674	none	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	201915301	Lao động giản đơn	06020101
47559	Nguyễn Hoài Phong	1926-07-14	male	Kinh (Việt)	2674	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	204150301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06020101
47560	Trần Nghĩa Mỹ Đình	2003-11-19	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	200072201	Thợ lắp ráp và vận hành máy móc, thiết bị	06020101
47561	Phan Nguyễn Thanh Trọng	2004-03-02	male	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	205941901	Lao động giản đơn	06020101
47562	Trần Thị Kim Liên	2008-12-19	female	Kinh (Việt)	2674	primary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06020101
47563	Trần Đặng Duy Ngọc	1959-07-02	female	Kinh (Việt)	2674	secondary	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	200354501	Lao động giản đơn	06020101
47564	Võ Công Minh	2014-09-09	male	Kinh (Việt)	2674	None	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06020101
47565	Hà Hữu Thiên Kim	1988-12-09	female	Kinh (Việt)	2674	none	Không	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	200989101	Thợ lắp ráp và vận hành máy móc, thiết bị	06020101
47566	Nguyễn Trúc Ly	2014-07-17	female	Kinh (Việt)	2674	None	Phật giáo	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Thợ lắp ráp và vận hành máy móc, thiết bị	06020101
47567	Phùng Trần Minh Khang	1972-08-12	male	Kinh (Việt)	2675	none	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	200081301	Tự do	06020102
47568	Lê Hà Minh Anh	2019-07-10	female	Kinh (Việt)	2675	None	Cao đài	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020102
47569	Nguyễn Lương Kim Khánh	2008-05-26	female	Kinh (Việt)	2675	primary	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06020102
47570	Hồ Trọng Nhân	2001-06-28	male	Kinh (Việt)	2675		Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	207271801	Lao động giản đơn	06020102
47571	Lê Việt Cường	1997-03-14	male	Kinh (Việt)	2675	primary	Hồi giáo	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	201040101	Lao động giản đơn	06020102
47572	Nguyễn Thanh Thảo	2014-12-24	female	Kinh (Việt)	2675	None	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Thợ lắp ráp và vận hành máy móc, thiết bị	06020102
47573	Nguyễn Quốc Nhân	2006-10-27	male	Kinh (Việt)	2675	primary	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020102
47574	Trần Như Huỳnh	2021-04-02	female	Chứt	2675	None	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lực lượng vũ trang	06020102
47575	Nguyễn Ngọc Khánh Ngân	1960-03-13	female	Kinh (Việt)	2675	none	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	202336901	Lao động giản đơn	06020102
47576	Ngô Vũ Bảo Ngọc	1959-11-20	female	Kinh (Việt)	2675	none	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	202486301	Lao động giản đơn	06020102
47577	Lê Hữu Tường	2017-04-27	male	Kinh (Việt)	2675	None	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Tự do	06020102
47578	Trần Văn Nguyễn Tú	1987-10-21	male	Kinh (Việt)	2675	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	201512901	Nhân viên trợ lý văn phòng	06020102
47579	Huỳnh Nhật Quang	1942-03-25	male	Kinh (Việt)	2675	high	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	207184601	Lao động giản đơn	06020102
47580	Nguyễn Minh Phú	1995-06-12	male	Kinh (Việt)	2675	high	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	205469801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06020102
47581	Lê Thùy Phương Vi	1968-10-31	female	Kinh (Việt)	2675	primary	Phật giáo Hòa Hảo	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	205510001	Nhân viên trợ lý văn phòng	06020102
47582	Nguyễn Văn Đạt	1978-07-27	male	Kinh (Việt)	2675	primary	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	201265501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020102
47583	Nguyễn Hoàng Khang	2018-01-11	male	Kinh (Việt)	2675	None	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020102
47584	Trần Huỳnh Thái	2021-10-13	male	Kinh (Việt)	2675	None	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai		Tự do	06020102
47585	Đỗ Thái Đồng Dao	1962-08-01	female	Kinh (Việt)	2675	primary	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	202929401	Lao động giản đơn	06020102
47586	Nguyễn Phạm Hoàng Yến	1980-04-11	female	Kinh (Việt)	2675	high	Không	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Thị trấn Bát Xát Huyện Bát Xát Tỉnh Lào Cai	204108001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020102
47587	Đoàn Việt Mỹ	1981-11-07	male	Co	2677	secondary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	207546401	Lao động giản đơn	06020201
47588	Nguyễn Ngọc Khánh Trâm	1991-11-22	female	Kinh (Việt)	2677		Baha'I	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	205499101	Nhân viên trợ lý văn phòng	06020201
47589	Võ Nguyên Hồng Điệp	1969-04-23	female	Kinh (Việt)	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	204923501	Lao động giản đơn	06020201
47590	Lê Thị Lan Anh	2001-11-06	female	Kinh (Việt)	2677		Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	204279801	Nhân viên trợ lý văn phòng	06020201
47591	Phan Đặng Mai Phương	1936-09-23	female	Kinh (Việt)	2677	none	Công giáo	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	203556601	Lao động giản đơn	06020201
47592	Cún Chạt Hảo	1997-11-07	male	Kinh (Việt)	2677	secondary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	201221201	Lao động giản đơn	06020201
47593	Lê Quán Trung	1996-03-19	male	Kinh (Việt)	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	206204001	Nhân viên trợ lý văn phòng	06020201
47594	Nguyễn Thị Ngọc Ngân	2012-09-14	female	Kinh (Việt)	2677	None	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06020201
47595	Trần Hoài Anh Huy	2021-02-10	male	Kinh (Việt)	2677	None	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Tự do	06020201
47596	Huỳnh Thị Thanh Huyền	2018-06-17	female	Kinh (Việt)	2677	None	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06020201
47597	Tô Sở Hoan	1973-02-12	female	Thái	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	205110801	Lao động giản đơn	06020201
47598	Đỗ Tiến Dũng	1980-09-12	male	Tày	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	204063901	Lao động giản đơn	06020201
47599	Phan Trúc Linh	1958-03-02	female	Kinh (Việt)	2677	none	Bà-la-môn giáo	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	204755501	Nhà chuyên môn bậc cao (đại học trở lên)	06020201
47600	Nguyễn Tấn Sang	1997-09-15	male	Kinh (Việt)	2677	primary	Cơ đốc Phục lâm	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	201550701	Nhà chuyên môn bậc cao (đại học trở lên)	06020201
47601	Huỳnh Hải Hà	2013-12-28	male	Kinh (Việt)	2677	None	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06020201
47602	Nguyễn Quốc Huy	1970-12-22	male	Kinh (Việt)	2677	none	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	205430401	Lao động giản đơn	06020201
47603	Nguyễn Thành Trung	2001-04-16	male	Kinh (Việt)	2677		Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	205973301	Nhà chuyên môn bậc cao (đại học trở lên)	06020201
47604	Lê Uyên Nhi	1986-06-24	female	Kinh (Việt)	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	201001001	Lao động thủ công và các nghề nghiệp có liên quan khác	06020201
47605	Đỗ Trung Hiếu	1982-01-21	male	Kinh (Việt)	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	200916701	Tự do	06020201
47606	Hồ Xuân Tiến	1988-03-02	male	Kinh (Việt)	2677	primary	Không	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	207242401	Lao động giản đơn	06020201
47607	Phạm Anh Thư	2021-07-14	female	Kinh (Việt)	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47608	Nguyễn Huỳnh Quốc Đạt	2017-11-09	male	Kinh (Việt)	2678	None	Công giáo	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020202
47609	Đặng Nguyễn Khánh Duy	2015-10-01	male	Kinh (Việt)	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47610	Hồ Đoàn Việt Phi	2000-04-03	male	Kinh (Việt)	2678		Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	207281201	Lao động giản đơn	06020202
47611	Nguyễn Thị Ánh Dương	2021-07-07	female	Kinh (Việt)	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020202
47612	Trần Thị Cẩm Tiên	2009-09-26	female	Kinh (Việt)	2678	primary	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47613	Lê Nguyễn Thanh Triết	1995-08-10	male	Khơ-me	2678	primary	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	202952801	Lao động giản đơn	06020202
47614	Vũ Huỳnh Phương Linh	1962-10-28	female	Kinh (Việt)	2678	primary	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	206550601	Lao động giản đơn	06020202
47615	Tạ Bảo Ngọc	1961-08-17	female	Kinh (Việt)	2678	primary	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	203044601	Lao động giản đơn	06020202
47616	Đặng Văn Ngọc	1998-09-20	male	Kinh (Việt)	2678		Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	208458601	Lao động giản đơn	06020202
47617	Trần Thị Thu Thảo	1979-06-17	female	Kinh (Việt)	2678	none	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	207415801	Lao động giản đơn	06020202
47618	Lê Nguyễn Gia Hân	2000-01-04	female	Khơ-me	2678		Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	208065101	Lao động giản đơn	06020202
47619	Trần Huỳnh Bảo Khanh	2021-01-15	female	Kinh (Việt)	2678	None	Phật giáo Hòa Hảo	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47620	Cao Phạm Minh Thư	1985-11-07	female	Kinh (Việt)	2678	none	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	202784601	Lao động giản đơn	06020202
47621	Phạm Nguyễn Yến Nhi	1922-12-17	female	Tày	2678	primary	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	205328701	Nhân viên dịch vụ và bán hàng	06020202
47622	Nguyễn Trung Quân	2014-09-02	male	Cống	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lực lượng vũ trang	06020202
47623	Nguyễn Tấn Hào	1967-09-01	male	Cơ-ho	2678	none	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	200615201	Lao động giản đơn	06020202
47624	Lâm Xuân Bảo	1984-09-20	male	Kinh (Việt)	2678	none	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	202462301	Lao động giản đơn	06020202
47625	Nguyễn Tiến Hưng	2015-12-24	male	Kinh (Việt)	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47626	Phạm Xuân Tiên	2014-11-13	female	Lào	2678	None	Không	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã A Mú Sung Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020202
47627	Đào Anh Thư	1994-08-31	female	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	201614801	Nhân viên dịch vụ và bán hàng	06020301
47628	Nguyễn Nguyệt Sao Biển	2019-05-11	female	Kinh (Việt)	2680	None	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020301
47629	Diệp Gia Linh	1992-11-19	female	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202122801	Lao động giản đơn	06020301
47630	Huỳnh Huy Tuấn	1982-10-27	male	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	204229101	Lao động giản đơn	06020301
47631	Nguyễn Huỳnh Minh Tân	1987-03-19	male	Kinh (Việt)	2680	secondary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	207937801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020301
47632	Nhữ Đào Nhật Tiên	2005-01-24	female	Kinh (Việt)	2680	primary	Tin lành	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	201018701	Nhân viên trợ lý văn phòng	06020301
47633	Mach Na Po Ly	1980-01-16	male	Khơ-me	2680	secondary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200992801	Nhà chuyên môn bậc cao (đại học trở lên)	06020301
47634	Nguyễn Lê Tấn Quốc	1985-11-01	male	Kinh (Việt)	2680	high	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	207034501	Lao động giản đơn	06020301
47635	Trần Thiện Thành	1987-06-25	male	Kinh (Việt)	2680	none	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	207597701	Lao động giản đơn	06020301
47636	Nguyễn Lương Nhật Minh	2009-01-30	male	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lực lượng vũ trang	06020301
47637	Nguyễn Thị Kim Phụng	1978-02-03	female	Kinh (Việt)	2680	high	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	206174001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020301
47638	Phan Nhiệm Trinh	2013-03-27	female	Kinh (Việt)	2680	None	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020301
47639	Cao Vĩ Nhân	1972-06-12	male	Kinh (Việt)	2680	none	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202882801	Lao động giản đơn	06020301
47640	Lê Huỳnh Hoàng Phúc	2017-10-10	male	Kinh (Việt)	2680	None	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020301
47641	Nguyễn Minh Quân	1964-03-20	male	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200322501	Tự do	06020301
47642	Ngô Hoàng Tuấn Kiệt	1982-08-10	male	Kinh (Việt)	2680	high	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	207523801	Lao động giản đơn	06020301
47643	Võ Trương Mỹ Quỳnh	1996-11-21	female	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200594801	Lao động thủ công và các nghề nghiệp có liên quan khác	06020301
47644	Nguyễn Thị Tuyết Trinh	2011-09-30	female	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020301
47645	Đoàn Quang Khang	1965-09-10	male	Kinh (Việt)	2680	none	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	205131301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020301
47646	Lê Nguyễn Đình Trí	2004-06-03	male	Kinh (Việt)	2680	primary	Không	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 1 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202834701	Lao động giản đơn	06020301
47647	Nguyễn Lê Bảo Trân	2010-12-11	female	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020302
47648	Trần Nguyễn Ngọc Phương	2010-07-15	female	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020302
47649	Đoàn Đông Nhy	1958-06-18	female	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202147801	Lao động giản đơn	06020302
47650	Trần Văn Long	2003-05-31	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	207539101	Lao động giản đơn	06020302
47651	Dương Hoàng Hải Phong	1979-04-23	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200643001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06020302
47652	Trần Quốc Tuấn	1987-01-01	male	Xinh-mun	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	204544701	Lao động giản đơn	06020302
47653	Phan Thành Nam	1973-01-28	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	208003901	Lao động giản đơn	06020302
47654	Nguyễn Văn Khoa	2007-05-01	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06020302
47655	Huỳnh Minh Thiện	2013-10-25	male	Kinh (Việt)	2681	None	Baha'I	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động giản đơn	06020302
47656	Tạ Nguyễn Đăng Khoa	1977-08-06	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	206923901	Lao động giản đơn	06020302
47657	Huỳnh Thị Diễm Trinh	2016-01-31	female	Kinh (Việt)	2681	None	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06020302
47658	Phan Cẩm Biếu	1958-09-27	male	Kinh (Việt)	2681	secondary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	205683101	Tự do	06020302
47659	Phạm Gia Hùng	1992-06-14	male	Kinh (Việt)	2681	high	Minh Sư đạo	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202701501	Lao động giản đơn	06020302
47660	Nguyễn Thành Hưng	1968-09-16	male	Sán Chay	2681	none	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	206533901	Lao động giản đơn	06020302
47661	Hà Nguyễn Đoan Thanh	1985-07-02	female	Ê-đê	2681	secondary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	204267301	Nhân viên trợ lý văn phòng	06020302
47662	Trần Nguyễn Phương Anh	1974-02-24	female	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200507901	Lao động giản đơn	06020302
47663	Phạm Dư Ngọc	2019-12-20	male	Kinh (Việt)	2681	None	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06020302
47664	Trần Yến Nhi	1984-02-04	female	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	200812401	Lao động giản đơn	06020302
47665	Nguyễn Minh Trí	1994-09-18	male	Pu Péo	2681	secondary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	202568001	Lao động giản đơn	06020302
47666	Đặng Đức Minh	1969-04-19	male	Kinh (Việt)	2681	primary	Không	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	Thôn 2 Xã Nậm Chạc Huyện Bát Xát Tỉnh Lào Cai	201711401	Lao động thủ công và các nghề nghiệp có liên quan khác	06020302
47667	Trần Tuấn Đạt	2015-11-24	male	Kinh (Việt)	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06030101
47668	Dương Quang Khải	1968-04-29	male	Kinh (Việt)	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	206299001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06030101
47669	Kim Minh Trung	1997-10-24	male	Kinh (Việt)	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	208860601	Thợ lắp ráp và vận hành máy móc, thiết bị	06030101
47670	Hà Phương Nhi	2020-03-05	female	Kinh (Việt)	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06030101
47671	Huỳnh Anh Thư	1977-01-29	female	Kinh (Việt)	2684	none	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	200827201	Lao động giản đơn	06030101
47672	Lý Nguyễn Đăng Khoa	1986-05-22	male	Kinh (Việt)	2684	none	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	201111801	Lao động giản đơn	06030101
47673	Lê Trần Trâm Anh	1981-12-23	female	Tày	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	204734201	Lao động giản đơn	06030101
47674	Trần Đức Lợi	2014-05-21	male	Kinh (Việt)	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030101
47675	Nguyễn Trần Thị Tố Uyên	1965-07-07	female	Kinh (Việt)	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	203384601	Lao động giản đơn	06030101
47676	Trương Huỳnh Thảo Nghi	1976-12-21	female	Kinh (Việt)	2684		Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	202338901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030101
47677	Nguyễn Võ Phi Long	2015-03-04	male	Xtiêng	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030101
47678	Nguyễn Thị Thanh Ly	1959-12-19	female	Kinh (Việt)	2684	secondary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	201482801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030101
47679	Lê Sử Triều An	1962-12-15	male	Kinh (Việt)	2684	secondary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	200446001	Lao động giản đơn	06030101
47680	Hoàng Hy Khang	2004-10-03	male	Kinh (Việt)	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	200553701	Tự do	06030101
47681	Nguyễn Lê Anh Tuấn	2021-09-14	male	Kinh (Việt)	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030101
47682	Đinh Đạt Minh	1951-04-06	male	Kinh (Việt)	2684		Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	202870701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030101
47683	Phan Thị Minh Như	1982-08-31	female	Kinh (Việt)	2684	none	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	206784701	Lao động thủ công và các nghề nghiệp có liên quan khác	06030101
47684	Hồ Hải Đăng	2010-05-10	male	Kinh (Việt)	2684	primary	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Nhà chuyên môn bậc cao (đại học trở lên)	06030101
47685	Hồ Phương Như	1994-08-14	female	Kinh (Việt)	2684	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	203679701	Tự do	06030101
47686	Trương Nhật Phương	2015-09-13	female	Kinh (Việt)	2684	None	Không	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06030101
47687	Ngô Duy Hương Anh	2006-08-27	female	Thái	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030102
47688	Đỗ Trịnh Phương Uyên	1993-11-14	female	Thái	2685	primary	Phật giáo Hòa Hảo	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	203947301	Lao động giản đơn	06030102
47689	Mai Đặng Phan Huỳnh	1961-08-23	male	Kinh (Việt)	2685	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	205128801	Lao động giản đơn	06030102
47690	Nguyễn Vân Khanh	2011-08-03	female	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030102
47691	Thạch Minh Quy	1994-12-10	male	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	203778401	Tự do	06030102
47692	Trần Võ Thanh Tâm	1973-09-11	female	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	205180901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030102
47693	Trần Công Tú	1943-10-23	male	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	200057101	Lao động giản đơn	06030102
47694	Nguyễn Hoàng Long	1999-08-23	male	Kinh (Việt)	2685		Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	207538501	Nhân viên trợ lý văn phòng	06030102
47695	Trần Thái An	2007-01-08	female	Kinh (Việt)	2685	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030102
47696	Du Lâm Thùy Trang	1967-04-05	female	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	201671801	Nhân viên dịch vụ và bán hàng	06030102
47697	Lê Hoàng Kim Tú	1974-09-21	female	Kinh (Việt)	2685	secondary	Cơ đốc Phục lâm	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	200498501	Thợ lắp ráp và vận hành máy móc, thiết bị	06030102
47698	Dương Ngọc Như Quỳnh	2012-02-23	female	Kinh (Việt)	2685	None	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030102
47699	Nguyễn Thị Hương Giang	1932-01-08	female	Kinh (Việt)	2685	none	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	202592001	Lao động giản đơn	06030102
47700	Mai Hồng Ngọc	2008-04-07	female	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030102
47701	Võ Nguyễn Thảo Nguyên	1961-07-10	female	Kinh (Việt)	2685	primary	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	206126401	Lao động giản đơn	06030102
47702	Trần Văn Phong	1982-11-24	male	Kinh (Việt)	2685	primary	Công giáo	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	207024301	Lao động giản đơn	06030102
47703	Trương Thị Kim Ngân	2017-09-27	female	Kinh (Việt)	2685	None	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030102
47704	Nguyễn Kim Giai Như	1964-05-29	female	Chu-ru	2685	none	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	208842401	Lao động giản đơn	06030102
47705	Phạm Văn Đoàn	1965-12-24	male	Kinh (Việt)	2685	high	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	206686301	Nhân viên dịch vụ và bán hàng	06030102
47706	Nguyễn Thanh Toàn	1971-11-06	male	Kinh (Việt)	2685	none	Không	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Pha Long Huyện Mường Khương Tỉnh Lào Cai	207421001	Lực lượng vũ trang	06030102
47707	Trần Thị Lý Nhi	1967-09-22	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	203881401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030201
47708	Dương Thảo My	2010-12-21	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030201
47709	Nguyễn Nhật Linh	1994-06-11	male	Kinh (Việt)	2687	primary	Mặc môn	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	205026201	Lao động giản đơn	06030201
47710	Nguyễn Quốc Khởi Nguyên	2008-08-07	male	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Tự do	06030201
47711	Trần Bảo Khanh	2008-06-30	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Tự do	06030201
47712	Nguyễn Nhật Anh	2006-05-04	male	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Thợ lắp ráp và vận hành máy móc, thiết bị	06030201
47713	Dương Văn Tâm	1984-11-29	male	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202661201	Nhà chuyên môn bậc cao (đại học trở lên)	06030201
47714	Lâm Thụy Khanh	2013-01-30	female	Kinh (Việt)	2687	None	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Nhà chuyên môn bậc cao (đại học trở lên)	06030201
47715	Trần Tuyết Nhi	2009-08-14	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Thợ lắp ráp và vận hành máy móc, thiết bị	06030201
47716	Huỳnh Nguyễn Minh Khuê	1984-05-08	female	Kinh (Việt)	2687	primary	Phật giáo	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	200305901	Lao động giản đơn	06030201
47717	Nguyễn Ngọc Phương Ngân	2005-10-11	female	Kinh (Việt)	2687	secondary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	206756701	Lao động thủ công và các nghề nghiệp có liên quan khác	06030201
47718	Đỗ Tuyết Nhi	1960-09-30	female	Kinh (Việt)	2687	none	Hồi giáo	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202142401	Nhân viên trợ lý văn phòng	06030201
47719	Ngô Nguyễn Phương Thùy	1989-01-22	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	201439701	Lao động giản đơn	06030201
47720	Trương Thu Thủy	1967-10-09	female	Kinh (Việt)	2687	primary	Phật giáo	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	207043401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030201
47721	Phan Gia Du	1993-10-25	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	200516901	Lao động giản đơn	06030201
47722	Nguyễn Gia Bách	1979-08-11	male	Kinh (Việt)	2687	none	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	205078401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030201
47723	Nguyễn Vĩnh Trung	1979-09-06	male	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202099801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030201
47724	Trần Ngọc Quỳnh Như	1972-07-29	female	Kinh (Việt)	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202491701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06030201
47725	Võ Nguyễn Bảo Long	1988-01-17	male	Kinh (Việt)	2687	none	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	206969901	Thợ lắp ráp và vận hành máy móc, thiết bị	06030201
47726	Vũ Duy Anh	1982-08-14	male	Khơ-me	2687	primary	Không	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202580501	Nhà chuyên môn bậc cao (đại học trở lên)	06030201
47727	Đặng Thị Thanh Thảo	1962-07-11	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	201393101	Lao động giản đơn	06030202
47728	Đặng Thị Thảo Ngân	1981-12-26	female	Kinh (Việt)	2688	secondary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	203814901	Lao động giản đơn	06030202
47729	Lê Nguyễn Như Quỳnh	2002-09-27	female	Kinh (Việt)	2688		Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	208376001	Lao động thủ công và các nghề nghiệp có liên quan khác	06030202
47730	Đặng Tấn Phát	2015-12-25	male	Kinh (Việt)	2688	None	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47731	Đinh Huỳnh Bảo Châu	1992-04-08	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	207095801	Nhân viên dịch vụ và bán hàng	06030202
47732	Nguyễn Ngọc Minh Hiền	2020-05-05	female	Kinh (Việt)	2688	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47733	Phạm Thị Yến Nhi	1986-02-08	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	206115301	Lao động giản đơn	06030202
47734	Trịnh Mỹ Hà	1992-04-09	female	Tày	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	205720501	Thợ lắp ráp và vận hành máy móc, thiết bị	06030202
47735	Lê Hoài Bảo	2014-11-07	male	Kinh (Việt)	2688	None	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47736	Nguyễn Ngọc Phú	1959-04-20	male	Kinh (Việt)	2688	none	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202441101	Tự do	06030202
47737	Đinh Hà Phương Nhi	1973-06-09	female	Kinh (Việt)	2688	primary	Công giáo	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202649001	Lao động giản đơn	06030202
47738	Huỳnh Hồng Bảo Thy	1971-08-20	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	203500301	Lao động giản đơn	06030202
47739	Trần Thụy Yến Vi	1995-10-13	female	Kinh (Việt)	2688	high	Công giáo	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	202408401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030202
47740	Nguyễn Quốc Hùng	2013-10-15	male	Kinh (Việt)	2688	None	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Nhân viên trợ lý văn phòng	06030202
47741	Nguyễn Ngọc Thiên Tiên	1984-06-07	female	Thái	2688	secondary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	206818801	Nhà chuyên môn bậc cao (đại học trở lên)	06030202
47742	Ngô Thu Hằng	2008-09-09	female	Lào	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47743	Lưu Nhật Tường Vy	1962-06-04	female	Kinh (Việt)	2688	secondary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	203642401	Lực lượng vũ trang	06030202
47744	Nguyễn Thị Kim Ngân	2008-09-17	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030202
47745	Lê Nguyễn Quỳnh Như	2008-09-18	female	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47746	Lê Nguyễn Hoàng Huy	2010-11-28	male	Kinh (Việt)	2688	primary	Không	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tả Ngải Chồ Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030202
47747	Vũ Ngọc Lam	2020-03-11	female	Kinh (Việt)	2690	None	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030301
47748	Đồng Thị Thái Hậu	1993-11-05	female	Ngái	2690	primary	Baha'I	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	200617001	Lao động giản đơn	06030301
47749	Hồ Thái Uyên	1993-08-12	female	Kinh (Việt)	2690	high	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	202618901	Nhân viên dịch vụ và bán hàng	06030301
47750	Phan Thanh Sang	2007-01-28	male	Kinh (Việt)	2690	primary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030301
47751	Bùi Thị Mai Phương	2006-09-15	female	Giáy	2690	primary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030301
47752	Trần Gia Thuận	1963-12-13	male	Kinh (Việt)	2690	primary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	200890401	Lao động thủ công và các nghề nghiệp có liên quan khác	06030301
47753	Đỗ Trường Phi	1965-10-16	male	Kinh (Việt)	2690	none	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	205859201	Lực lượng vũ trang	06030301
47754	Trương Thái Tuấn	1989-06-07	male	Kinh (Việt)	2690	secondary	Hồi giáo	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	200057301	Nhân viên trợ lý văn phòng	06030301
47755	Lê Thị Trúc Vy	1964-03-31	female	Tày	2690	secondary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	208314401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	06030301
47756	Trần Cẩm Tú	1968-11-05	female	Kinh (Việt)	2690	secondary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	203743001	Lao động giản đơn	06030301
47757	Vương Ngọc Thùy Trang	1986-06-23	female	Lô lô	2690	secondary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	202832401	Lao động giản đơn	06030301
47758	Trần Gia Hân	2016-12-20	female	Kinh (Việt)	2690	None	Bà-la-môn giáo	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030301
47759	Trịnh Y Đình	1977-10-26	female	Kinh (Việt)	2690	none	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	200912501	Lao động giản đơn	06030301
47760	Lê Ngọc Bảo Khánh	2015-10-28	male	Kinh (Việt)	2690	None	Minh Sư đạo	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030301
47761	Trần Thùy Trang	2015-07-07	female	Lô lô	2690	None	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động thủ công và các nghề nghiệp có liên quan khác	06030301
47762	Trương Thị Hoàng Trang	1935-05-27	female	Kinh (Việt)	2690	none	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	207298401	Lao động giản đơn	06030301
47763	Nguyễn Thanh Giang	1963-09-02	female	Kinh (Việt)	2690	none	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	205271801	Lao động giản đơn	06030301
47764	Yoon Tú Trân	1996-11-10	female	Kinh (Việt)	2690	high	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	201204401	Lao động giản đơn	06030301
47765	Trần Thị Kiều Linh	2004-09-13	female	Ngái	2690	primary	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	204564401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	06030301
47766	Võ Hà My	1969-06-16	female	Kinh (Việt)	2690	none	Không	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 1 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	206977501	Lao động thủ công và các nghề nghiệp có liên quan khác	06030301
47767	Huỳnh Thanh Khương	1986-11-06	male	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	204558901	Nhà chuyên môn bậc cao (đại học trở lên)	06030302
47768	Trần Viết Quang	1991-05-31	male	Kinh (Việt)	2691		Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	204261001	Lực lượng vũ trang	06030302
47769	Ngô Trần Thu Thảo	2013-04-06	female	Kinh (Việt)	2691	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030302
47770	Nguyễn Hoàng Anh Thư	1980-11-08	female	Kinh (Việt)	2691	secondary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	206169501	Lao động giản đơn	06030302
47771	Nguyễn Thanh Thảo	2009-09-15	female	Kinh (Việt)	2691	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Nhân viên dịch vụ và bán hàng	06030302
47772	Lê Thị Thanh Nhi	2006-12-28	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	06030302
47773	Vũ Thị Tuyết Dung	2011-08-29	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Nhà chuyên môn bậc cao (đại học trở lên)	06030302
47774	Nguyễn Thị Yến Nhi	1988-02-16	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	203973301	Lao động giản đơn	06030302
47775	Đặng Quốc Khánh	2004-02-09	male	Lô lô	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	206388201	Lao động giản đơn	06030302
47776	Huỳnh Lê Hùng	2010-01-15	male	Kinh (Việt)	2691	primary	Mặc môn	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lực lượng vũ trang	06030302
47777	Nguyễn Hiền Thảo Nguyên	2007-08-24	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030302
47778	Phạm Nguyễn Hồng Ngọc	2004-05-19	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	200033301	Nhà chuyên môn bậc cao (đại học trở lên)	06030302
47779	Phan Tuấn Anh	1974-09-21	male	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	207470401	Lao động thủ công và các nghề nghiệp có liên quan khác	06030302
47780	Nguyễn Hồng Trúc	2007-06-15	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Lao động giản đơn	06030302
47781	Phạm Quang Khiêm	2011-03-30	male	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai		Nhà chuyên môn bậc cao (đại học trở lên)	06030302
47782	Nguyễn Ngọc Kim Khuê	1987-09-03	female	Kinh (Việt)	2691	secondary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	208166801	Lực lượng vũ trang	06030302
47783	Lê Phạm Bích Du	1969-08-29	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	205530701	Lao động giản đơn	06030302
47784	Nguyễn Tấn Tường	1979-11-02	male	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	203702201	Lao động giản đơn	06030302
47785	Nguyễn Thanh Nhi	1972-08-09	female	Kinh (Việt)	2691	primary	Không	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	202603301	Lao động giản đơn	06030302
47786	Lê Trương Đăng Khoa	1982-02-08	male	Kinh (Việt)	2691	secondary	Minh Sư đạo	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	Thôn 2 Xã Tung Chung Phố Huyện Mường Khương Tỉnh Lào Cai	207717201	Lao động giản đơn	06030302
47787	Lương Quỳnh Như	1981-11-14	female	Kinh (Việt)	2695	none	Minh Sư đạo	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	204984601	Lực lượng vũ trang	07010101
47788	Trần Nhật Nam	2018-12-11	male	Kinh (Việt)	2695	None	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Tự do	07010101
47789	Nguyễn Anh Thy	1990-03-05	female	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	206990801	Lao động giản đơn	07010101
47790	Đàm Quang Tuấn	1958-02-23	male	Khơ-me	2695	none	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	204904101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07010101
47791	Dương Thị Thu Uyên	1959-10-03	female	Kinh (Việt)	2695	none	Mặc môn	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	206349001	Lao động giản đơn	07010101
47792	Trần Thị Trúc Thy	1979-08-23	female	Lô lô	2695	secondary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	206266701	Lao động giản đơn	07010101
47793	Trần Mai Tuyết Anh	1991-03-08	female	Kinh (Việt)	2695		Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	208740601	Lao động giản đơn	07010101
47794	Trần Gia Lạc	1993-08-18	male	Kinh (Việt)	2695	high	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	205302501	Nhà chuyên môn bậc cao (đại học trở lên)	07010101
47795	Nguyễn Đăng Khôi	1996-02-22	male	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202201901	Nhân viên trợ lý văn phòng	07010101
47796	Lê Nguyễn Gia Huy	1976-02-18	male	Kinh (Việt)	2695		Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	204647601	Lao động giản đơn	07010101
47797	Liên Gia Kiệt	1972-07-07	male	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	201888701	Lao động giản đơn	07010101
47798	Tô Quỳnh Như	1996-08-19	female	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	208279201	Nhân viên dịch vụ và bán hàng	07010101
47799	Nguyễn Nhật Quang	1974-10-24	male	Kinh (Việt)	2695	high	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	201735201	Lao động giản đơn	07010101
47800	Trần Minh Khang	1965-01-10	male	Kinh (Việt)	2695	secondary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	207887901	Nhân viên trợ lý văn phòng	07010101
47801	Nguyễn Hoàng Đăng Khoa	2012-09-07	male	Kinh (Việt)	2695	None	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07010101
47802	Nguyễn Trần Hoài Thi	1984-05-29	male	Kinh (Việt)	2695	secondary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	203989801	Lao động giản đơn	07010101
47803	Từ Gia Hân	1941-10-21	female	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202085401	Lao động giản đơn	07010101
47804	Võ Hà Phương Uyên	1931-01-17	female	Kinh (Việt)	2695	primary	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	200962301	Nhân viên trợ lý văn phòng	07010101
47805	Đoàn Phạm Tiến Phát	1977-09-23	male	Kinh (Việt)	2695	none	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	204256301	Lực lượng vũ trang	07010101
47806	Nguyễn Thị Kim Hiền	2018-03-07	female	Kinh (Việt)	2695	None	Không	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010101
47807	Hồ Phan Quang An	1975-04-11	male	Kinh (Việt)	2696	secondary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202247401	Lao động giản đơn	07010102
47808	Lê Huỳnh Hạnh Tiên	2008-12-11	female	Kinh (Việt)	2696	primary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010102
47809	Nguyễn Thị Ngọc Trâm	2020-04-30	female	Phù Lá	2696	None	Phật giáo Hòa Hảo	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010102
47810	Nguyễn Hoàng Anh Thư	2012-05-06	female	Kinh (Việt)	2696	None	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010102
47811	Phạm Ngọc Thùy Dương	2004-11-21	female	Kinh (Việt)	2696	primary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	204507401	Thợ lắp ráp và vận hành máy móc, thiết bị	07010102
47812	Mai Minh Hùng	2017-02-27	male	Kinh (Việt)	2696	None	Mặc môn	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010102
47813	Trần Phương Tân Hào	1977-11-28	male	Kinh (Việt)	2696	primary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	200854701	Lao động giản đơn	07010102
47814	Phạm Lê Bảo Ân	1967-02-21	female	Tày	2696	none	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	203853001	Lao động giản đơn	07010102
47815	Ngô Thụy Quỳnh Như	2002-02-09	female	Co	2696		Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	205854301	Lao động giản đơn	07010102
47816	Nguyễn Thị Thùy Linh	2004-10-18	female	Kinh (Việt)	2696	secondary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	205788501	Lao động giản đơn	07010102
47817	Hàng Ngọc Tâm Như	2003-11-17	female	Kinh (Việt)	2696	primary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202439001	Lao động giản đơn	07010102
47818	Võ Thùy Dương	1974-05-06	female	Kinh (Việt)	2696	secondary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202686201	Nhà chuyên môn bậc cao (đại học trở lên)	07010102
47819	Nguyễn Huy Long	1990-04-19	male	Kinh (Việt)	2696	none	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	200025601	Thợ lắp ráp và vận hành máy móc, thiết bị	07010102
47820	Trần Đức Khang	2009-12-10	male	Kinh (Việt)	2696	primary	Công giáo	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhân viên trợ lý văn phòng	07010102
47821	Phạm Đăng Khoa	1974-09-02	male	Kinh (Việt)	2696	none	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	207169801	Lao động thủ công và các nghề nghiệp có liên quan khác	07010102
47822	Phạm Hoàng Ân	2018-09-06	male	Kinh (Việt)	2696	None	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhân viên dịch vụ và bán hàng	07010102
47823	Nguyễn Gia Linh	1998-05-09	female	Kinh (Việt)	2696		Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	206549301	Lao động giản đơn	07010102
47824	Lê Thị Ngọc Anh	1991-05-15	female	Kinh (Việt)	2696		Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	203150201	Lao động giản đơn	07010102
47825	Đinh Ngọc Ân	1974-04-14	male	Tày	2696	secondary	Phật giáo Hòa Hảo	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	202180201	Lao động giản đơn	07010102
47826	Nguyễn Thiên Lộc	2007-08-22	male	Kinh (Việt)	2696	primary	Không	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Noong Bua Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010102
47827	Nguyễn Thành Lộc	1935-07-27	male	Kinh (Việt)	2698	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	203757601	Lực lượng vũ trang	07010201
47828	Lê Hoàng Mai Thy	2019-12-18	female	Kinh (Việt)	2698	None	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010201
47829	Trần Hoài An	2017-02-16	male	Kinh (Việt)	2698	None	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010201
47830	Nguyễn Thành Công	2002-02-15	male	Kinh (Việt)	2698		Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201823601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07010201
47831	Nguyễn Vũ Tứ	2015-01-08	male	Cống	2698	None	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010201
47832	Nguyễn Ngọc Tú Trinh	1992-04-11	female	Kinh (Việt)	2698	high	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	204851501	Lao động giản đơn	07010201
47833	Võ Văn Diễn	1959-05-09	male	Kinh (Việt)	2698	primary	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	203797301	Lao động thủ công và các nghề nghiệp có liên quan khác	07010201
47834	Nguyễn Thụy Trúc Lam	1998-11-09	female	Kinh (Việt)	2698		Mặc môn	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	202479101	Lao động giản đơn	07010201
47835	Thi Nguyễn Kiều Trân	2021-10-30	female	Kinh (Việt)	2698	None	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07010201
47836	Lê Hoàng Hạc	2003-05-16	male	Kinh (Việt)	2698	secondary	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	206040901	Lao động giản đơn	07010201
47837	Phạm Nguyễn Gia Bảo	2007-09-28	male	Kinh (Việt)	2698	primary	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhà chuyên môn bậc cao (đại học trở lên)	07010201
47838	Trần Thiên Tân	1935-01-17	male	Kinh (Việt)	2698	none	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	206261901	Lao động giản đơn	07010201
47839	Lâm Gia Huy	1962-03-03	male	Thái	2698	secondary	Hồi giáo	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	206053001	Lao động giản đơn	07010201
47840	Nguyễn Tạ Minh Đức	1975-12-24	male	Kinh (Việt)	2698	high	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	204869901	Lao động giản đơn	07010201
47841	Vĩnh Lê Bảo Trúc	1976-02-12	female	Kinh (Việt)	2698		Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201999601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010201
47842	Đỗ Ngọc Sơn	2021-02-16	male	Kinh (Việt)	2698	None	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010201
47843	Võ Minh Phúc	1963-06-02	male	Kinh (Việt)	2698	primary	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	205472201	Lao động giản đơn	07010201
47844	Nguyễn Hồng Thy	2015-06-26	female	Kinh (Việt)	2698	None	Phật giáo Hòa Hảo	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010201
47845	Huỳnh Thị Lập Xuân	1999-04-02	female	Si La	2698		Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	204058401	Nhà chuyên môn bậc cao (đại học trở lên)	07010201
47846	Lê Hoàng Phúc	1997-11-30	male	Kinh (Việt)	2698	high	Không	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	200423701	Lao động giản đơn	07010201
47847	Trần Việt Anh	1991-02-03	male	Kinh (Việt)	2699		Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	205523501	Nhân viên trợ lý văn phòng	07010202
47848	Trần Thanh Tú	1962-01-11	male	Kinh (Việt)	2699	primary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	202510501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07010202
47849	Mai Tiến Nhân	1975-12-08	male	Kinh (Việt)	2699	none	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201124501	Lao động giản đơn	07010202
47850	Phạm Quang Minh	2021-06-04	male	Kinh (Việt)	2699	None	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010202
47851	Lục Anh Trí	1968-09-17	female	Kinh (Việt)	2699	primary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201249901	Lao động thủ công và các nghề nghiệp có liên quan khác	07010202
47852	Nguyễn Minh Tiến	1944-12-30	male	Kinh (Việt)	2699	primary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	204328201	Nhà chuyên môn bậc cao (đại học trở lên)	07010202
47853	Vũ Minh Thư	1988-07-03	female	Kinh (Việt)	2699	primary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	200536001	Lao động giản đơn	07010202
47854	Cao Thị Thảo My	2002-04-25	female	Kinh (Việt)	2699		Baha'I	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201118601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07010202
47855	Phan Như Uyên	1997-06-12	female	Kinh (Việt)	2699	secondary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	200328301	Lao động giản đơn	07010202
47856	Nguyễn Ngọc Nghĩa	1999-09-27	male	Kinh (Việt)	2699		Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	203112001	Nhà chuyên môn bậc cao (đại học trở lên)	07010202
47857	Dương Mỹ Kim	1984-05-26	female	Kinh (Việt)	2699	none	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	201535301	Lực lượng vũ trang	07010202
47858	Ngô Thị Thùy Trang	2014-12-26	female	Kinh (Việt)	2699	None	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Tự do	07010202
47859	Nguyễn Thị Thúy Hằng	1965-05-06	female	Kinh (Việt)	2699	university	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	206497801	Lao động giản đơn	07010202
47860	Trần Thanh Tuấn	1992-02-19	male	Kinh (Việt)	2699	high	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	208087401	Lao động giản đơn	07010202
47861	Phạm Trần Duy Minh	1983-03-04	male	Kinh (Việt)	2699	none	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	207543801	Lao động giản đơn	07010202
47862	Dương Quốc Anh	2019-08-09	male	Kinh (Việt)	2699	None	Tin lành	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010202
47863	Nguyễn Ánh Xuân	2004-03-05	female	Kinh (Việt)	2699	primary	Cơ đốc Phục lâm	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	207461601	Thợ lắp ráp và vận hành máy móc, thiết bị	07010202
47864	Lê Hoàng Anh Tú	1997-11-13	male	Kinh (Việt)	2699	primary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	204174401	Thợ lắp ráp và vận hành máy móc, thiết bị	07010202
47865	Đỗ Anh Khoa	2015-11-24	male	Kinh (Việt)	2699	None	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010202
47866	Nguyễn Thị Tường Vi	1979-10-12	female	Kinh (Việt)	2699	secondary	Không	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Him Lam Thành phố Điện Biên Phủ Tỉnh Điện Biên	205455701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010202
47867	Lê Anh Tài	2014-05-11	male	Kinh (Việt)	2701	None	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010301
47868	Trang Thanh Thảo	1992-03-21	female	Kinh (Việt)	2701	primary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	207941901	Lao động thủ công và các nghề nghiệp có liên quan khác	07010301
47869	Nguyễn Thị Uyên Thy	1940-11-05	female	Kinh (Việt)	2701	none	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	208649101	Lao động giản đơn	07010301
47870	Lê Hoàng Khôi	1987-05-30	male	Kinh (Việt)	2701	primary	Bà-la-môn giáo	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	206960601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07010301
47871	Đỗ Thị Yến Nhi	2021-11-27	female	Kinh (Việt)	2701	None	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010301
47872	Cao Thị Tuyết Nhung	2019-06-29	female	Kinh (Việt)	2701	None	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhân viên trợ lý văn phòng	07010301
47873	Nguyễn Tấn Trung Nguyên	1987-12-28	male	Kinh (Việt)	2701	primary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	204451101	Lao động giản đơn	07010301
47874	Trần Huy Hoàng	1993-06-20	male	Kinh (Việt)	2701	high	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	205550901	Tự do	07010301
47875	Nguyễn Thủy Tiên	1971-09-18	female	Ngái	2701	primary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	207358801	Lao động giản đơn	07010301
47876	Hà Thanh Hiếu Nghĩa	2016-06-22	male	Thái	2701	None	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07010301
47877	Huỳnh Thanh Hiền	2007-06-05	female	Kinh (Việt)	2701	primary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010301
47878	Nguyễn Đăng Khánh Trân	1977-01-18	female	Kinh (Việt)	2701	secondary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	200113201	Lực lượng vũ trang	07010301
47879	Trương Quốc Cường	1968-08-20	male	Kinh (Việt)	2701	secondary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	208433301	Lao động giản đơn	07010301
47880	Lê Thị Thúy Vy	1989-06-19	female	Kinh (Việt)	2701	secondary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	204235001	Lao động giản đơn	07010301
47881	Lê Văn Hùng	1960-05-19	male	Ngái	2701	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	203863801	Lao động giản đơn	07010301
47882	Trần Thị Trúc Linh	1988-10-19	female	Kinh (Việt)	2701	primary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	208456301	Lao động giản đơn	07010301
47883	Phạm Minh Hoàng	1997-10-26	male	Kinh (Việt)	2701	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	206702601	Tự do	07010301
47884	Thạch Thị Ngọc Hân	1967-12-18	female	Kinh (Việt)	2701	secondary	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	201269801	Lao động giản đơn	07010301
47885	Huỳnh Ngọc Mỹ	1962-08-11	female	Kinh (Việt)	2701	none	Không	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	201230001	Tự do	07010301
47886	Trần Minh Tú	2021-01-27	female	Kinh (Việt)	2701	None	Baha'I	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 1 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010301
47887	Bùi Xuân Huy	2020-12-26	male	Kinh (Việt)	2702	None	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Thợ lắp ráp và vận hành máy móc, thiết bị	07010302
47888	Phạm Sơn Văn	2017-12-26	male	Kinh (Việt)	2702	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07010302
47889	Lê Minh Tuấn	2005-11-08	male	Kinh (Việt)	2702	primary	Cơ đốc Phục lâm	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	204665401	Nhà chuyên môn bậc cao (đại học trở lên)	07010302
47890	Đỗ Ngọc Huy	2018-11-12	male	Kinh (Việt)	2702	None	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Nhà chuyên môn bậc cao (đại học trở lên)	07010302
47891	Nguyễn Đình Tường Bách	1962-07-29	male	Kinh (Việt)	2702	none	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	201037201	Lao động giản đơn	07010302
47892	Đặng Phương Nam	2007-10-02	male	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010302
47893	Phạm Mai Anh	1974-09-27	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	207379001	Lực lượng vũ trang	07010302
47894	Bùi Nguyễn Minh Anh	1973-03-27	female	Kinh (Việt)	2702	secondary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	200446601	Lao động giản đơn	07010302
47895	Nguyễn Thế Vinh	2008-09-14	male	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010302
47896	Lê Đoàn Phương Linh	1964-09-28	female	Kinh (Việt)	2702	none	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	206394901	Lao động giản đơn	07010302
47897	Vang Phú Cường	2012-09-11	male	Tày	2702	None	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010302
47898	Nguyễn Ngọc Khang	1958-11-08	male	Kinh (Việt)	2702	secondary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	206725501	Nhà chuyên môn bậc cao (đại học trở lên)	07010302
47899	Nguyễn Nhi Thảo Quyên	1982-11-26	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	204404801	Lao động giản đơn	07010302
47900	Võ Thành Tài	1992-10-10	male	Ra-glai	2702	high	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	205208701	Lao động giản đơn	07010302
47901	Liêu Thanh Ngọc Trinh	1987-05-16	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	202568201	Lao động giản đơn	07010302
47902	Phạm Vũ Sơn Bách	1985-03-29	male	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	203267501	Lao động giản đơn	07010302
47903	Nguyễn Thị Minh Anh	2009-11-23	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07010302
47904	Phạm Ngọc Minh	2008-12-03	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010302
47905	Nguyễn Tuấn Anh	2012-09-17	male	Kinh (Việt)	2702	None	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên		Lao động giản đơn	07010302
47906	Nguyễn Thị Lan Anh	1979-08-19	female	Kinh (Việt)	2702	primary	Không	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	Thôn 2 Phường Thanh Bình Thành phố Điện Biên Phủ Tỉnh Điện Biên	202064401	Lực lượng vũ trang	07010302
47907	Nguyễn Hoàng Phương Ân	2001-03-27	female	Kinh (Việt)	2705		Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	203077601	Nhân viên dịch vụ và bán hàng	07020101
47908	Trịnh Thảo Vân	2012-05-21	female	Kinh (Việt)	2705	None	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Tự do	07020101
47909	Nguyễn Lê Trinh Như	2002-05-12	female	Kinh (Việt)	2705		Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200422001	Lao động giản đơn	07020101
47910	Phùng Đoàn Diễm Liên	2021-11-27	female	Hà nhì	2705	None	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020101
47911	Trần Quốc Bảo	1954-02-04	male	Kinh (Việt)	2705	primary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	205681201	Thợ lắp ráp và vận hành máy móc, thiết bị	07020101
47912	Nguyễn Phước Sang	1959-01-17	male	Kinh (Việt)	2705	primary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	201009501	Lao động giản đơn	07020101
47913	Võ Lê Kim Tiễn	2001-05-02	male	Kinh (Việt)	2705		Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	202829201	Nhà chuyên môn bậc cao (đại học trở lên)	07020101
47914	Quan Ánh Tú	1994-03-15	female	Kinh (Việt)	2705	primary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200959101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07020101
47915	Lê Minh Nhân	1970-07-21	male	Kinh (Việt)	2705	none	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	208179101	Lao động giản đơn	07020101
47916	Lê Thừa Minh	2007-10-30	male	Kinh (Việt)	2705	primary	Hồi giáo	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020101
47917	Phan Thị Thanh Thư	1997-07-29	female	Kinh (Việt)	2705	high	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	207292401	Tự do	07020101
47918	Nguyễn Nam Anh	2018-06-22	male	Kinh (Việt)	2705	None	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Nhân viên trợ lý văn phòng	07020101
47919	Nguyễn Tấn Thuận	1962-01-24	male	Kinh (Việt)	2705	high	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	204272201	Lao động giản đơn	07020101
47920	Huỳnh Tấn Vũ	1995-05-14	male	Kinh (Việt)	2705	university	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	205390801	Lao động giản đơn	07020101
47921	Nhâm Ái Mi	2013-12-12	female	Thái	2705	None	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020101
47922	Nguyễn Ngọc Thanh	2006-06-10	female	Kinh (Việt)	2705	primary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020101
47923	Phan Hoàng Phúc	2019-01-11	male	Kinh (Việt)	2705	None	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020101
47924	Nguyễn Thị Minh Anh	1968-06-02	female	Thái	2705	none	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	206464101	Lao động giản đơn	07020101
47925	Nguyễn Thanh Trúc	1954-08-24	female	Kinh (Việt)	2705	secondary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	208662501	Lao động giản đơn	07020101
47926	Nguyễn Hải Minh	1960-03-28	male	Kinh (Việt)	2705	primary	Không	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200567501	Nhân viên trợ lý văn phòng	07020101
47927	Võ Minh Bảo Quỳnh	1999-07-01	female	Kinh (Việt)	2706		Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200043801	Lao động giản đơn	07020102
47928	Thái Ân Đình	1985-11-18	female	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	202079101	Thợ lắp ráp và vận hành máy móc, thiết bị	07020102
47929	Phạm Ngọc Huyền Trân	1960-10-22	female	Kinh (Việt)	2706	none	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	205964901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020102
47930	Trần Mạnh Hòa	2008-10-23	male	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07020102
47931	Nguyễn Đại Phát	1961-09-11	male	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	204034101	Lao động giản đơn	07020102
47932	Huỳnh Thanh Trúc	1979-08-08	female	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	202508701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07020102
47933	Nguyễn Thái Anh Hào	1985-07-08	male	Kinh (Việt)	2706	none	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	208772501	Lao động giản đơn	07020102
47934	Huỳnh Tuấn Kiệt	2006-07-30	male	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020102
47935	Nguyễn Thị Thùy Trang	1981-10-06	female	Khơ-me	2706	secondary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	205498201	Lao động giản đơn	07020102
47936	Nguyễn Thị Quỳnh Giao	2007-02-02	female	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020102
47937	Nguyễn Hoàng Tiểu Băng	1989-07-10	female	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	201317001	Nhân viên trợ lý văn phòng	07020102
47938	Huỳnh Ngọc Lan Phương	1973-10-21	female	Kinh (Việt)	2706	high	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200156201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07020102
47939	Trần Tiến Phương	2003-06-03	male	Kinh (Việt)	2706	secondary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	203240801	Lao động giản đơn	07020102
47940	Nguyễn Ngọc Anh Thư	2021-01-26	female	Kinh (Việt)	2706	None	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020102
47941	Đặng Nguyên Ngọc	1994-04-12	female	Kinh (Việt)	2706	high	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	200417701	Nhân viên trợ lý văn phòng	07020102
47942	Trần Bá Tuấn	1995-07-29	male	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	206821501	Lao động giản đơn	07020102
47943	Lê Tấn Bình	1994-11-30	male	Kinh (Việt)	2706	secondary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	203713501	Lao động giản đơn	07020102
47944	Hoàng Trung Hùng	2006-10-25	male	Kinh (Việt)	2706	primary	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020102
47945	Trần Trung Kiên	2020-01-11	male	Sán Dìu	2706	None	Mặc môn	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07020102
47946	Đặng Thị Minh Châu	1965-12-16	female	Kinh (Việt)	2706	none	Không	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Sông Đà Thị Xã Mường Lay Tỉnh Điện Biên	204293801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07020102
47947	Trần Thế Tuấn	2017-05-21	male	Chơ-ro	2708	None	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Tự do	07020201
47948	Trần Gia Huy	1995-05-10	male	Kinh (Việt)	2708	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	204072101	Lao động giản đơn	07020201
47949	Trần Khải Minh	1975-04-01	male	Kinh (Việt)	2708	primary	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	200344501	Lao động giản đơn	07020201
47950	Nguyễn Bích Quyên	1974-01-11	female	Xtiêng	2708	none	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	205902701	Lao động giản đơn	07020201
47951	Nguyễn Anh Quân	2003-09-30	male	Kinh (Việt)	2708	secondary	Hồi giáo	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	202657601	Lao động giản đơn	07020201
47952	Nguyễn Đăng Quang	1979-02-01	male	Kinh (Việt)	2708	none	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	205632201	Thợ lắp ráp và vận hành máy móc, thiết bị	07020201
47953	Đinh Viết Vĩnh Kỳ	2013-04-20	male	La Chí	2708	None	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020201
47954	Nguyễn Ngọc Vũ	2021-03-08	male	Kinh (Việt)	2708	None	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020201
47955	Nguyễn Bá Khôi	2004-08-28	male	Kinh (Việt)	2708	secondary	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	204018301	Lao động giản đơn	07020201
47956	Nguyễn Thị Quỳnh Hương	1991-02-06	female	Kinh (Việt)	2708		Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	204016001	Thợ lắp ráp và vận hành máy móc, thiết bị	07020201
47957	Trần Văn Phong	2016-01-06	male	Kinh (Việt)	2708	None	Hồi giáo	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Thợ lắp ráp và vận hành máy móc, thiết bị	07020201
47958	Phạm Quang Huy	2015-11-28	male	Kinh (Việt)	2708	None	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Nhân viên dịch vụ và bán hàng	07020201
47959	Đặng Thị Kim Nguyên	1964-12-30	female	Kinh (Việt)	2708	primary	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	208475201	Nhân viên dịch vụ và bán hàng	07020201
47960	Từ Ngọc Lan Anh	1969-03-07	female	Kinh (Việt)	2708	primary	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201960701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020201
47961	Lê Thị Hồng Tuyền	1987-01-18	female	Kinh (Việt)	2708	secondary	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	204407101	Lao động giản đơn	07020201
47962	Phạm Vân Phong	2007-02-26	male	Kinh (Việt)	2708	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020201
47963	Nguyễn Long Hoàng An	2019-08-10	male	Kinh (Việt)	2708	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020201
47964	Nguyễn Phước Thu Trang	1973-08-13	female	Kinh (Việt)	2708	high	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201344301	Lao động giản đơn	07020201
47965	Nguyễn Thị Khánh Vi	1990-10-30	female	Kinh (Việt)	2708	none	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	204105501	Lao động giản đơn	07020201
47966	Võ Lê Xuân Hương	2016-07-05	female	Kinh (Việt)	2708	None	Không	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07020201
47967	Trần Hoàng Giang	1936-03-25	male	Kinh (Việt)	2709	none	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	206689801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07020202
47968	Vũ Lê Thùy Linh	1962-12-18	female	Kinh (Việt)	2709	primary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	208815101	Lao động giản đơn	07020202
47969	Lê Ngọc Trâm	2002-06-11	female	Kinh (Việt)	2709		Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	203634901	Lao động giản đơn	07020202
47970	Nguyễn Trường Đức	1967-02-26	male	Kinh (Việt)	2709	none	Baha'I	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	200072901	Lao động giản đơn	07020202
47971	Mai Thanh Tâm	2007-05-07	male	Kinh (Việt)	2709	primary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020202
47972	Hoàng Thị Ái Mỹ	1963-05-22	female	Kinh (Việt)	2709	none	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201780101	Lao động giản đơn	07020202
47973	Nguyễn Phạm Thanh Vân	1996-02-10	female	Kinh (Việt)	2709	secondary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201514701	Lao động giản đơn	07020202
47974	Nguyễn Thiên Thanh	1978-10-12	female	Kinh (Việt)	2709	none	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	200372801	Nhân viên trợ lý văn phòng	07020202
47975	Nguyễn Ngọc Thụy Du	1982-10-25	female	Kinh (Việt)	2709	secondary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201460601	Lao động giản đơn	07020202
47976	Nguyễn Mai Khanh	1983-10-18	female	Lự	2709	primary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	202855401	Nhà chuyên môn bậc cao (đại học trở lên)	07020202
47977	Lê Nguyễn Thanh Nghi	2021-07-31	female	Kinh (Việt)	2709	None	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Nhà chuyên môn bậc cao (đại học trở lên)	07020202
47978	Lê Thành Danh	2004-10-12	male	Kinh (Việt)	2709	primary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201157401	Lao động giản đơn	07020202
47979	Nguyễn Đình Bảo	2003-09-13	male	Kinh (Việt)	2709	primary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	201457501	Lao động giản đơn	07020202
47980	Đỗ Hồng Phúc	2001-11-21	female	Kinh (Việt)	2709		Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	207283501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020202
47981	Huỳnh Anh Thư	2016-03-09	female	Kinh (Việt)	2709	None	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Thợ lắp ráp và vận hành máy móc, thiết bị	07020202
47982	Phương Nhu Phát	2014-03-22	male	Thái	2709	None	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020202
47983	Nguyễn Ngọc Thúy Vy	1993-10-16	female	Kinh (Việt)	2709	high	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	208141801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020202
47984	Đặng Trí Dũng	1982-01-14	male	Kinh (Việt)	2709	none	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	202525601	Nhà chuyên môn bậc cao (đại học trở lên)	07020202
47985	Bao Ngọc Trinh	2020-11-02	female	Kinh (Việt)	2709	None	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07020202
47986	Nguyễn Trung Nhân	1994-01-27	male	Kinh (Việt)	2709	secondary	Không	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Phường Na Lay Thị Xã Mường Lay Tỉnh Điện Biên	205463201	Thợ lắp ráp và vận hành máy móc, thiết bị	07020202
47987	Lê Thanh Mẫn	1933-11-08	female	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	206099801	Nhân viên trợ lý văn phòng	07020301
47988	Nguyễn Quốc Chương	1981-09-13	male	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	203915501	Lực lượng vũ trang	07020301
47989	Trần Văn Bền	1983-03-09	male	Kinh (Việt)	2711	none	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	205081201	Lao động giản đơn	07020301
47990	Lê Thị Minh Hoàn	1962-10-18	female	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	201660301	Tự do	07020301
47991	Đỗ Thị Phương Ân	2018-11-20	female	Kinh (Việt)	2711	None	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020301
47992	Cao Minh Khôi	1969-06-06	male	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	205810301	Lao động giản đơn	07020301
47993	Ngô Hoàng Khả Tú	2004-07-23	female	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	203445101	Lao động giản đơn	07020301
47994	Nguyễn Phước Khang	1959-02-15	male	Kinh (Việt)	2711	none	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	200700001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07020301
47995	Nguyễn Khương Tuấn	1967-02-26	male	Kinh (Việt)	2711	none	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	202721701	Lao động giản đơn	07020301
47996	Mai Thị Thu Thảo	2006-01-14	female	Kinh (Việt)	2711	primary	Bửu Sơn Kỳ Hương	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Nhân viên trợ lý văn phòng	07020301
47997	Trang Thị Quỳnh Như	1978-06-14	female	Kinh (Việt)	2711	secondary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	202549901	Lao động giản đơn	07020301
47998	Nguyễn Tấn Hưng	1984-08-15	male	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	200985001	Nhà chuyên môn bậc cao (đại học trở lên)	07020301
47999	Lâm Gia Hân	2007-07-19	female	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Nhân viên dịch vụ và bán hàng	07020301
48000	Lý Như	2018-04-06	female	Kinh (Việt)	2711	None	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Tự do	07020301
48001	Huỳnh Phạm Khánh Đoan	2011-11-25	female	Kinh (Việt)	2711	primary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020301
48002	Mang Ngân Kim Ng?c	1994-04-12	female	Kinh (Việt)	2711	high	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	207554001	Tự do	07020301
48003	Đặng Nguyễn Anh Thư	1974-04-19	female	La Ha	2711	none	Bửu Sơn Kỳ Hương	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	206632101	Lao động giản đơn	07020301
48004	Lưu Nguyễn Đức Minh	1986-12-03	male	Kinh (Việt)	2711	secondary	Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	205154401	Lao động giản đơn	07020301
48005	Nguyễn Vũ Phương Thư	2019-10-11	female	Chơ-ro	2711	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020301
48006	Phạm Ngọc Thanh Thủy	1976-09-24	female	Kinh (Việt)	2711		Không	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 1 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	204488101	Lao động giản đơn	07020301
48007	Ngô Huỳnh Thanh Thúy	2020-05-19	female	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48008	Hoàng Ngô Thúy Vy	1970-05-23	female	Kinh (Việt)	2712	primary	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	205240001	Lao động giản đơn	07020302
48009	Trương Quang Nguyệt Bảo	2014-02-23	female	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Tự do	07020302
48010	Đặng Trí Thành	2014-09-18	male	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lực lượng vũ trang	07020302
48011	Nguyễn Minh Hoàng	2020-12-05	male	Thái	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48012	Phạm Anh Thư	1977-04-18	female	Tày	2712	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	200777001	Lao động giản đơn	07020302
48013	Mai Phạm Thế Hiệp	2007-01-14	male	Kinh (Việt)	2712	primary	Công giáo	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48014	Nguyễn Lê Lộc	1961-01-01	male	Kinh (Việt)	2712	none	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	207172301	Lao động thủ công và các nghề nghiệp có liên quan khác	07020302
48015	Nguyễn Huỳnh Anh Duy	2010-06-18	male	Kinh (Việt)	2712	primary	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48016	Bùi Lê Anh Kiệt	1977-04-11	male	Kinh (Việt)	2712	none	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	201360901	Tự do	07020302
48017	Đinh Nguyễn Mai Uyên	2020-11-20	female	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Nhà chuyên môn bậc cao (đại học trở lên)	07020302
48018	Võ Vân Anh	2003-04-06	female	Kinh (Việt)	2712	primary	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	203646001	Thợ lắp ráp và vận hành máy móc, thiết bị	07020302
48019	Lê Phước Hiệp	2014-11-22	male	Kinh (Việt)	2712	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48020	Võ Huỳnh Việt Anh	2000-09-21	male	Kinh (Việt)	2712		Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	208519101	Lao động giản đơn	07020302
48021	Trần Trọng Mẫn	2020-04-12	male	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lực lượng vũ trang	07020302
48022	Phạm Thị Linh	2000-12-15	female	Kinh (Việt)	2712		Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	207729001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07020302
48023	Hồ Đăng Tiến	2019-04-12	male	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lao động giản đơn	07020302
48024	Đỗ Thị Thùy Trang	1967-05-11	female	Kinh (Việt)	2712	primary	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	200709501	Nhà chuyên môn bậc cao (đại học trở lên)	07020302
48025	Trần Tiến Sang	1993-01-28	male	Kinh (Việt)	2712	secondary	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	202772301	Lao động giản đơn	07020302
48026	Phạm Thị Yến Nhi	2017-05-08	female	Kinh (Việt)	2712	None	Không	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên	Thôn 2 Xã Lay Nưa Thị Xã Mường Lay Tỉnh Điện Biên		Lực lượng vũ trang	07020302
48027	Lê Ngạn Anh	1990-02-03	female	Kinh (Việt)	2715	university	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	207376301	Lao động giản đơn	07030101
48028	Hồ Ân Đông	2009-04-15	male	Kinh (Việt)	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030101
48029	Khưu Chấn Huy	1968-08-09	male	Tày	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	206052901	Lao động giản đơn	07030101
48030	Trần Thị Thanh Hương	1963-08-03	female	Kinh (Việt)	2715	none	Phật giáo Hòa Hảo	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205021201	Thợ lắp ráp và vận hành máy móc, thiết bị	07030101
48031	Nguyễn Hồng Điệp	1987-09-20	female	Xtiêng	2715	primary	Phật giáo Hòa Hảo	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	203462401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030101
48032	Đỗ Khắc Luật	1977-02-10	male	Kinh (Việt)	2715	none	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	202635901	Lao động giản đơn	07030101
48033	Phạm Hoàng Châu Anh	1997-10-28	female	Kinh (Việt)	2715	high	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205522301	Thợ lắp ráp và vận hành máy móc, thiết bị	07030101
48034	Lê Quỳnh Như	1995-03-11	female	Kinh (Việt)	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205853801	Tự do	07030101
48035	Hà Yến Vy	1995-08-29	female	Kinh (Việt)	2715	high	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	204955801	Nhân viên trợ lý văn phòng	07030101
48036	Nguyễn Hoàng Huy	1971-09-22	male	Kinh (Việt)	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	200289901	Lao động giản đơn	07030101
48037	Phạm Phú Kiệt	1981-03-24	male	Kinh (Việt)	2715	secondary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	201226201	Tự do	07030101
48038	Huỳnh Tấn Phước	1968-04-19	male	Gia-rai	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	208461201	Lao động thủ công và các nghề nghiệp có liên quan khác	07030101
48039	Đỗ Văn Hoàng Khanh	2015-08-12	male	Kinh (Việt)	2715	None	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030101
48040	Nguyễn Đình Kiến Trúc	1970-09-23	male	Kinh (Việt)	2715	none	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	208793501	Lao động giản đơn	07030101
48041	Nguyễn Minh Hiền	1984-12-01	female	Kinh (Việt)	2715	none	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205107201	Nhân viên trợ lý văn phòng	07030101
48042	Nguyễn Minh Quí	1990-08-13	male	Kinh (Việt)	2715	university	Bửu Sơn Kỳ Hương	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	208125101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030101
48043	Lê Minh Châu An	1970-09-04	female	Kinh (Việt)	2715	none	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	200000301	Tự do	07030101
48044	Trần Cẩm Ngọc Bích	1994-03-25	female	Kinh (Việt)	2715	primary	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	207093501	Lao động thủ công và các nghề nghiệp có liên quan khác	07030101
48045	Vũ Thành Trung	1984-07-12	male	Kinh (Việt)	2715	none	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205973801	Lực lượng vũ trang	07030101
48046	Lê Nguyễn Khánh Linh	2017-02-09	female	Kinh (Việt)	2715	None	Không	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07030101
48047	Trịnh Ngọc Nguyên	1971-02-13	female	Kinh (Việt)	2716	secondary	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	202647401	Tự do	07030102
48048	Nguyễn Hoàng Nhã Thi	1980-11-19	female	Kinh (Việt)	2716	primary	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	204481701	Nhà chuyên môn bậc cao (đại học trở lên)	07030102
48049	Vũ Quốc Việt	2021-02-22	male	Kinh (Việt)	2716	None	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07030102
48050	Nguyễn Hùng Anh	2006-09-25	male	Kinh (Việt)	2716	primary	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030102
48051	Nguyễn Thuý Linh	2017-12-09	female	Kinh (Việt)	2716	None	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030102
48052	Nguyễn Huỳnh Thanh Vy	1986-12-26	female	Kinh (Việt)	2716	primary	Phật giáo	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	206999701	Lao động giản đơn	07030102
48053	Phan Tuấn Anh	2002-03-20	male	Kinh (Việt)	2716		Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	203585001	Lao động giản đơn	07030102
48054	Nguyễn Thanh Bình	2016-06-05	male	Kinh (Việt)	2716	None	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07030102
48055	Nguyễn Ngọc Thuận	2001-01-04	male	Kinh (Việt)	2716		Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	204730501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030102
48056	Đặng Hoàng Nhân	1966-03-25	male	Kinh (Việt)	2716	secondary	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	205595701	Lao động giản đơn	07030102
48057	Phạm Phú Thắng	1974-03-12	male	Kinh (Việt)	2716	none	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	208613801	Nhân viên trợ lý văn phòng	07030102
48058	Tô Phương Thảo	1969-07-11	female	Kinh (Việt)	2716	primary	Cao đài	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	202229001	Nhà chuyên môn bậc cao (đại học trở lên)	07030102
48059	Phạm Khánh Vy	2013-12-20	female	Kinh (Việt)	2716	None	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Nhân viên dịch vụ và bán hàng	07030102
48060	Võ Minh Nhật	1994-11-29	male	Kinh (Việt)	2716	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	200580101	Lao động giản đơn	07030102
48061	Lê Quỳnh Trang	2021-04-06	female	Kinh (Việt)	2716	None	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên		Lao động thủ công và các nghề nghiệp có liên quan khác	07030102
48062	Nguyễn Hữu Thành	1958-05-14	male	Kinh (Việt)	2716	none	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	207940301	Nhân viên dịch vụ và bán hàng	07030102
48063	Nguyễn Thị Thùy Trang	1994-02-23	female	Kinh (Việt)	2716	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	207421301	Lao động giản đơn	07030102
48064	Nguyễn Đức Huy	1970-11-30	male	Kinh (Việt)	2716	none	Phật giáo	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	200695001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030102
48065	Trần Thị Thanh Phướng	1971-05-09	female	Kinh (Việt)	2716	primary	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	201928401	Lao động giản đơn	07030102
48066	Nguyễn Bảo Trân	1995-11-28	female	Kinh (Việt)	2716	high	Không	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sín Thầu Huyện Mường Nhé Tỉnh Điện Biên	204335201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030102
48067	Đặng Quang Duy	1994-01-25	male	Cống	2718	secondary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208056901	Nhân viên trợ lý văn phòng	07030201
48068	Nguyễn Thanh Thùy	1958-11-13	female	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	207240401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030201
48069	Phùng Võ Như Ý	1988-11-14	female	Mảng	2718	secondary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208317101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030201
48070	Nguyễn Minh Đức	2020-02-28	male	Kinh (Việt)	2718	None	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Tự do	07030201
48071	Phạm Thị Hồng Hạnh	1990-11-03	female	Kinh (Việt)	2718	high	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201528701	Lao động giản đơn	07030201
48072	Lê Thị Đoan Trang	2004-03-21	female	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208401001	Lao động giản đơn	07030201
48073	Nguyễn Đình Phước Cơ	1973-08-09	male	Kinh (Việt)	2718	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	204297101	Lao động giản đơn	07030201
48074	Nguyễn Hồ Ngọc Thy	1993-02-10	female	Kinh (Việt)	2718	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	200260701	Nhân viên trợ lý văn phòng	07030201
48075	Nguyễn Lâm Hưng Thịnh	1973-12-12	male	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	205929501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030201
48076	Nguyễn Lê Hồng Ánh	1966-02-20	female	Kinh (Việt)	2718	none	Phật giáo	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	203455301	Lao động giản đơn	07030201
48077	Lê Phương Duy Ân	1994-08-16	female	Kinh (Việt)	2718	secondary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	207086601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030201
48078	Huỳnh Gia Bảo	1981-07-09	male	Kinh (Việt)	2718	high	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	204188601	Nhân viên trợ lý văn phòng	07030201
48079	Trần Văn Hiền	2007-10-07	male	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07030201
48080	Đinh Nhật Tân	1976-07-08	male	Kinh (Việt)	2718		Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	202054501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030201
48081	Lê Trương Minh Thư	2015-11-19	female	Mạ	2718	None	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030201
48082	Phạm Thiên Dấn	2009-01-17	male	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lực lượng vũ trang	07030201
48083	Nguyễn Thái Quang	1978-04-20	male	Kinh (Việt)	2718	secondary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	203936601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030201
48084	Vương Kiến Quân	2010-11-21	male	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Nhân viên dịch vụ và bán hàng	07030201
48085	Nguyễn Ngọc Phương Uyên	2003-05-11	female	Giáy	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201869301	Lao động giản đơn	07030201
48086	Trần Công Quốc	2005-08-04	male	Kinh (Việt)	2718	primary	Không	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	206175801	Lao động giản đơn	07030201
48087	Phạm Đình Ngân	2000-01-15	male	Kinh (Việt)	2719		Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208273801	Lao động giản đơn	07030202
48088	Đặng Vân Hiền	2004-08-09	female	Kinh (Việt)	2719	secondary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	202964901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030202
48089	Nguyễn Nhật Ánh	1979-01-06	female	Kinh (Việt)	2719	primary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201456201	Lao động giản đơn	07030202
48090	Phạm Thanh Danh	1969-08-11	male	Kinh (Việt)	2719	primary	Hồi giáo	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	200515301	Lao động giản đơn	07030202
48091	Nguyễn Tấn Kiệt	1989-01-01	male	Kinh (Việt)	2719	none	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	203664401	Nhân viên trợ lý văn phòng	07030202
48092	Lưu Văn Nhật	1961-01-13	male	Kinh (Việt)	2719	primary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208477201	Thợ lắp ráp và vận hành máy móc, thiết bị	07030202
48093	Hồ Lê Lin Na	2015-01-24	female	Kinh (Việt)	2719	None	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030202
48094	Nguyễn Thị Thảo Uyên	1992-03-05	female	Kinh (Việt)	2719	primary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	208312901	Nhà chuyên môn bậc cao (đại học trở lên)	07030202
48095	Châu Ngọc Khánh Đoan	1980-01-31	female	Kinh (Việt)	2719	secondary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	206490601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030202
48096	Đào Huyền Trang	1966-12-29	female	Kinh (Việt)	2719	none	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	203502901	Nhân viên trợ lý văn phòng	07030202
48097	Nguyễn Hoàng Thúy Nhi	2013-08-08	female	Kinh (Việt)	2719	None	Bửu Sơn Kỳ Hương	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030202
48098	Nguyễn Ngọc Gia Nhiên	2020-04-25	female	Kinh (Việt)	2719	None	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030202
48099	Phạm Thị Quỳnh Trang	1978-06-01	female	Kinh (Việt)	2719	primary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	207825001	Lao động giản đơn	07030202
48100	Đinh Thanh Mai	1941-09-23	female	Kinh (Việt)	2719	primary	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201366801	Lao động giản đơn	07030202
48101	Trần Nguyễn Phương Trinh	1997-01-03	female	Kinh (Việt)	2719	university	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	206647001	Nhân viên dịch vụ và bán hàng	07030202
48102	Nguyễn Thị Huỳnh Như	1974-11-20	female	Kinh (Việt)	2719	none	Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201378901	Lao động giản đơn	07030202
48103	Võ Nguyễn Minh Khôi	1972-05-19	male	Kinh (Việt)	2719	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	202736601	Lao động giản đơn	07030202
48104	Trần Anh Thư	2003-08-18	female	Kinh (Việt)	2719	primary	Baha'I	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	200051101	Lao động giản đơn	07030202
48105	Thái Thị Kim Ngân	1998-09-18	female	Kinh (Việt)	2719		Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	201282901	Lao động giản đơn	07030202
48106	Trần Tuấn Kiệt	1976-01-20	male	Kinh (Việt)	2719		Không	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Sen Thượng Huyện Mường Nhé Tỉnh Điện Biên	203810401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030202
48107	Nguyễn Trần Như Thùy	2008-02-23	female	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030301
48108	Nguyễn Thành Nhân	1990-12-21	male	Kinh (Việt)	2721	none	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	208599401	Lao động giản đơn	07030301
48109	Hồ Thị Minh An	2001-09-28	female	Kinh (Việt)	2721		Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	206875001	Lao động thủ công và các nghề nghiệp có liên quan khác	07030301
48110	Võ Nguyên Bảo	1995-05-05	male	Kinh (Việt)	2721	high	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200246501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030301
48111	Nguyễn Thị Ngọc Thùy	1955-05-25	female	Kinh (Việt)	2721	none	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200108001	Nhân viên dịch vụ và bán hàng	07030301
48112	Huỳnh Tuấn Kiệt	1989-12-12	male	Mường	2721	secondary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	203535501	Nhân viên dịch vụ và bán hàng	07030301
48113	Nguyễn Thế Quyền	2005-03-21	male	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	207931801	Nhà chuyên môn bậc cao (đại học trở lên)	07030301
48114	Nguyễn Đoàn Hoàng Phúc	1975-11-26	male	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200039401	Nhà chuyên môn bậc cao (đại học trở lên)	07030301
48115	Lê Thị Huỳnh Mai	1967-09-09	female	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	205449501	Lao động giản đơn	07030301
48116	Nguyễn Ngọc Kim Ngân	1998-01-11	female	Kinh (Việt)	2721		Bửu Sơn Kỳ Hương	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	205161301	Lao động giản đơn	07030301
48117	Hà Minh Luân	2011-01-08	male	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Tự do	07030301
48118	Phạm Khắc	1961-09-09	male	Kinh (Việt)	2721	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	204679801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030301
48119	Huỳnh Nguyễn Tố Thanh	2016-10-04	female	Kinh (Việt)	2721	None	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	07030301
48120	Lê Việt Anh	1958-03-07	male	Kinh (Việt)	2721	secondary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	204280201	Lao động giản đơn	07030301
48121	Lê Nguyễn Thái Sơn	2014-10-13	male	Kinh (Việt)	2721	None	Bà-la-môn giáo	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030301
48122	Lê Trần Thảo Vy	1993-06-19	female	Kinh (Việt)	2721	secondary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200549701	Lực lượng vũ trang	07030301
48123	Châu Chí Cường	1984-04-30	male	Kinh (Việt)	2721	primary	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	208054301	Lao động giản đơn	07030301
48124	Đỗ Lâm Trúc Quỳnh	1966-04-08	female	Kinh (Việt)	2721	none	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	206427901	Nhà chuyên môn bậc cao (đại học trở lên)	07030301
48125	Huỳnh Công Quyền	1990-01-08	male	Chăm (Chàm)	2721	high	Không	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	207327101	Lao động giản đơn	07030301
48126	Trần Vũ Mai Phương	1969-09-26	female	Kinh (Việt)	2721	none	Bà-la-môn giáo	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 1 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	203623501	Lao động giản đơn	07030301
48127	Doãn Bình Huy	2004-03-12	male	Kinh (Việt)	2722	secondary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	204747001	Lao động thủ công và các nghề nghiệp có liên quan khác	07030302
48128	Nguyễn Hoàng Vinh	1932-03-12	male	Tày	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200059701	Lực lượng vũ trang	07030302
48129	Nguyễn Minh Tuấn	2008-08-19	male	Kinh (Việt)	2722	primary	Cơ đốc Phục lâm	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030302
48130	Hoàng Lê Đức Anh	2016-05-10	male	Kinh (Việt)	2722	None	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	07030302
48131	Vương Thanh Mỹ	2012-08-29	female	Kinh (Việt)	2722	None	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030302
48132	Yên Gia Toàn	1975-11-04	male	Dao	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	206641201	Lao động giản đơn	07030302
48133	Phan Văn Phước	1994-01-11	male	Kinh (Việt)	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	206794701	Lao động giản đơn	07030302
48134	Lê Ánh Linh	1985-09-08	female	Kinh (Việt)	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	207894801	Lao động giản đơn	07030302
48135	Võ Thị Thanh Tâm	1975-03-02	female	Kinh (Việt)	2722	none	Hồi giáo	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	203126201	Lao động giản đơn	07030302
48136	Huỳnh Công Dũng	1991-11-25	male	Kinh (Việt)	2722		Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200251201	Nhân viên trợ lý văn phòng	07030302
48137	Trần Ngọc Bảo Hân	2010-02-08	female	Kinh (Việt)	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030302
48138	Nguyễn Lê Tấn Duy	1989-07-07	male	Kinh (Việt)	2722	high	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	208228301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	07030302
48139	Nguyễn Thị Thảo Anh	2016-04-04	female	Kinh (Việt)	2722	None	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lực lượng vũ trang	07030302
48140	Đặng Đan Duy	1952-07-11	male	Kinh (Việt)	2722	high	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	204195201	Lao động giản đơn	07030302
48141	Nguyễn Trần Tường Vy	1981-06-21	female	Kinh (Việt)	2722	university	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	201517901	Lao động giản đơn	07030302
48142	Huỳnh Thanh Tùng	1991-01-12	male	Kinh (Việt)	2722		Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	208726501	Lao động giản đơn	07030302
48143	Trương Minh Triết	2012-02-14	male	Kinh (Việt)	2722	None	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030302
48144	Nguyễn Như Minh	2001-12-29	female	Kinh (Việt)	2722		Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	200342801	Lao động giản đơn	07030302
48145	Nguyễn Khánh Linh	2005-01-19	female	Co	2722	primary	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	207426201	Nhân viên dịch vụ và bán hàng	07030302
48146	Nguyễn Trần Ngọc Lan	2013-04-21	female	Kinh (Việt)	2722	None	Không	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên	Thôn 2 Xã Chung Chải Huyện Mường Nhé Tỉnh Điện Biên		Lao động giản đơn	07030302
48147	Nguyễn Ngọc Phương Trang	1954-02-09	female	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	200265501	Tự do	08010101
48148	Lu Khải Ly	1965-03-31	female	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	200472301	Nhân viên trợ lý văn phòng	08010101
48149	Lê Hồng Phúc	1982-10-03	male	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	201731401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010101
48150	Trần Hiệp Ngôn	1985-03-06	male	Kinh (Việt)	2726	none	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	205167101	Nhà chuyên môn bậc cao (đại học trở lên)	08010101
48151	Trương Gia Kiệt	1986-05-21	male	Kinh (Việt)	2726	high	Bà-la-môn giáo	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	202478701	Lao động giản đơn	08010101
48152	Nguyễn Hoàng Thiên Phúc	2018-10-17	male	Xơ-đăng	2726	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010101
48153	Đỗ Lương Kiều Duyên	1985-11-29	female	Kinh (Việt)	2726	none	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	208686501	Lao động giản đơn	08010101
48154	Huỳnh Trung Nam	1970-07-10	male	Kinh (Việt)	2726	none	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	208590001	Lao động giản đơn	08010101
48155	Nguyễn Văn Hoàng	1989-12-20	male	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	204874201	Lao động giản đơn	08010101
48156	Ngô Quốc Kỳ	1987-05-19	male	Kinh (Việt)	2726	high	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	206544901	Lao động giản đơn	08010101
48157	Hồ Huyền Nhiên	2008-01-01	female	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Nhà chuyên môn bậc cao (đại học trở lên)	08010101
48158	Nguyễn Ngô Thùy Châu Loan	2018-11-28	female	Kinh (Việt)	2726	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010101
48159	Phạm Huỳnh Phương Nghi	2020-11-08	female	Kinh (Việt)	2726	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Tự do	08010101
48160	Nguyễn Thị Hoàng Yến	2017-11-13	female	Kinh (Việt)	2726	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lực lượng vũ trang	08010101
48161	Từ Vĩnh Thiện	1969-02-03	male	Kinh (Việt)	2726	none	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	201135601	Lao động giản đơn	08010101
48162	Ông Huỳnh Đức Anh	1976-01-28	male	Kinh (Việt)	2726		Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	206464401	Nhân viên trợ lý văn phòng	08010101
48163	Lại Nguyễn Thành Đạt	1976-11-05	male	Mnông	2726		Phật giáo Hòa Hảo	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	202806001	Lao động giản đơn	08010101
48164	Lê Nguyễn Quang Huy	2021-05-15	male	Kinh (Việt)	2726	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010101
48165	Vũ Tuấn Anh	1994-05-11	male	Kinh (Việt)	2726	university	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	205076601	Lực lượng vũ trang	08010101
48166	Võ Thị Mỹ Hồng	1973-01-27	female	Kinh (Việt)	2726	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	205017801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010101
48167	Cao Lê Phước Đạt	2018-04-30	male	Kinh (Việt)	2727	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010102
48168	Nguyễn Tiến Đạt	1984-04-04	male	Kinh (Việt)	2727	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	202806501	Lao động giản đơn	08010102
48169	Nguyễn Mai Thanh Vân	2002-09-19	female	Kinh (Việt)	2727		Tin lành	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	206523101	Lao động giản đơn	08010102
48170	Trần Thị Ngọc	2011-08-09	female	Kinh (Việt)	2727	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010102
48171	Lại Phú Quý	2012-03-21	male	Kinh (Việt)	2727	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010102
48172	Lư Gia Khang	2017-08-14	male	Kinh (Việt)	2727	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010102
48173	Trần Thị Yến Vy	2010-01-08	female	Kinh (Việt)	2727	primary	Minh Sư đạo	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08010102
48174	Phan Đức Huy	1929-10-13	male	Kinh (Việt)	2727	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	207192801	Nhân viên trợ lý văn phòng	08010102
48175	Phạm Thị Thanh Trúc	2016-07-26	female	Kinh (Việt)	2727	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Nhà chuyên môn bậc cao (đại học trở lên)	08010102
48176	Phan Thị Thúy Oanh	1971-12-21	female	Lào	2727	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	207567901	Lao động giản đơn	08010102
48177	Trần Huỳnh Thanh Thảo	1973-06-18	female	Kinh (Việt)	2727	primary	Phật giáo	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	205182601	Nhà chuyên môn bậc cao (đại học trở lên)	08010102
48178	Nguyễn Trùng Khánh	2019-11-25	male	Kinh (Việt)	2727	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Thợ lắp ráp và vận hành máy móc, thiết bị	08010102
48179	Phạm Bảo Hân	1977-03-12	female	Thái	2727	secondary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	206499401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010102
48180	Hoàng Chí Cường	1999-01-25	male	Kinh (Việt)	2727		Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	207100401	Lao động giản đơn	08010102
48181	Huỳnh Ngọc Diễm Thy	2003-04-08	female	Kinh (Việt)	2727	high	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	202608101	Lao động giản đơn	08010102
48182	Nguyễn Thủy Thùy Duyên	1963-01-07	female	Kinh (Việt)	2727	secondary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	208153501	Lao động giản đơn	08010102
48183	Trần Bá Khánh Duy	2009-12-26	male	Kinh (Việt)	2727	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010102
48184	Trần Hoàng Phú	1997-05-06	male	Kinh (Việt)	2727	high	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	205469901	Lao động giản đơn	08010102
48185	Nguyễn Hiển Dung	1977-09-10	female	Kinh (Việt)	2727	secondary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	201825701	Tự do	08010102
48186	Nguyễn Hoàng Phong	1984-05-26	male	Kinh (Việt)	2727	secondary	Không	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Thắng Thành phố Lai Châu Tỉnh Lai Châu	202997401	Lao động giản đơn	08010102
48187	Lê Quốc Huy	1951-11-26	male	Kinh (Việt)	2729		Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	204747201	Lao động giản đơn	08010201
48188	Nguyễn Mai Khánh Đoan	1963-12-17	female	Kinh (Việt)	2729	secondary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	207496201	Tự do	08010201
48189	Nguyễn Lê Mỹ Linh	1983-06-05	female	Gié-Triêng	2729	none	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	206966901	Tự do	08010201
48190	Ngô Trí Hoàng	1997-04-13	male	Pu Péo	2729	primary	Phật giáo	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	207397101	Lao động giản đơn	08010201
48191	Bùi Sỹ Quang	1953-01-01	male	Kinh (Việt)	2729	high	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	205200201	Nhân viên trợ lý văn phòng	08010201
48192	Ngô Minh Sang	1981-11-23	male	Kinh (Việt)	2729	none	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	202052301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08010201
48193	Triệu Hoàng Minh Trí	1988-09-16	male	Kinh (Việt)	2729	secondary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	202296301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010201
48194	Lê Đại Hải	1992-12-21	male	Kinh (Việt)	2729	high	Cơ đốc Phục lâm	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	206710201	Lao động giản đơn	08010201
48195	Nguyễn Thị Kim Hoa	2010-12-12	female	Kinh (Việt)	2729	primary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010201
48196	Lê Đoàn Kim My	1962-03-23	female	Kinh (Việt)	2729	none	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	201538701	Nhân viên trợ lý văn phòng	08010201
48197	Phan Minh Khoa	1969-11-09	male	Khơ-me	2729	primary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	207890201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010201
48198	Nhâm Quốc Hưng	2011-11-24	male	Kinh (Việt)	2729	primary	Tin lành	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010201
48199	Đặng Thị Bân Bân	1995-10-27	female	Kinh (Việt)	2729	secondary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	204291201	Lao động giản đơn	08010201
48200	Lê Thị Quỳnh Trang	1986-11-25	female	Kinh (Việt)	2729	high	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	202831301	Lao động giản đơn	08010201
48201	Đoàn Trần Khánh Đoan	1960-01-01	female	Kinh (Việt)	2729	primary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	201974401	Thợ lắp ráp và vận hành máy móc, thiết bị	08010201
48202	Ngô Hoàng Khải	1997-04-21	male	Kinh (Việt)	2729	primary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	206072401	Lao động giản đơn	08010201
48203	Thái Doãn Chiến	1937-10-21	male	Kinh (Việt)	2729	primary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	203796301	Lao động giản đơn	08010201
48204	Nguyễn Kim Ngân	2017-11-30	female	Thổ	2729	None	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010201
48205	Đoàn Thị Thúy Nga	1980-08-03	female	Kinh (Việt)	2729	secondary	Không	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	203762601	Lao động giản đơn	08010201
48206	Trần Tấn Hải	2012-03-28	male	Kinh (Việt)	2729	None	Bà-la-môn giáo	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010201
48207	Bùi Thanh Tùng	1989-12-05	male	Kinh (Việt)	2730	high	Phật giáo Hòa Hảo	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	206348201	Nhân viên trợ lý văn phòng	08010202
48208	Nguyễn Thị Hồng Yến	2016-12-09	female	Kinh (Việt)	2730	None	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010202
48209	Nguyễn Thế Hùng	2010-07-24	male	Kinh (Việt)	2730	primary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08010202
48210	Nguyễn Trần Khánh Uyên	1975-11-10	female	Kinh (Việt)	2730	high	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	203384501	Lao động giản đơn	08010202
48211	Nguyễn Đức Tuấn	2001-04-13	male	Kinh (Việt)	2730		Baha'I	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	204543701	Nhân viên dịch vụ và bán hàng	08010202
48212	Lê Quang Hưng	1972-04-03	male	Kinh (Việt)	2730	none	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	201694201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08010202
48213	Tăng Mai Bảo Nhi	1975-07-05	female	Kinh (Việt)	2730	secondary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	205465301	Lao động giản đơn	08010202
48214	Ngô Kim Ngân	1989-06-27	female	Kinh (Việt)	2730	none	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	208591901	Lao động giản đơn	08010202
48215	Nguyễn Thành Đạt	1979-02-27	male	Kinh (Việt)	2730	primary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	208536601	Lao động giản đơn	08010202
48216	Trần Huỳnh Ngọc Thư	2011-07-04	female	Kinh (Việt)	2730	primary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Nhân viên trợ lý văn phòng	08010202
48217	Phạm Như Luận	1992-11-13	male	Gia-rai	2730	high	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	201778701	Lao động giản đơn	08010202
48218	Trần Nguyễn Phương Thành	2019-02-05	male	Kinh (Việt)	2730	None	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010202
48219	Trần Kiều Anh	2000-10-16	female	Kinh (Việt)	2730		Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	205523001	Lao động giản đơn	08010202
48220	Nguyễn Thị Thiên Hương	1975-01-21	female	Kinh (Việt)	2730	primary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	204373901	Lao động giản đơn	08010202
48221	Nguyễn Ngọc Nguyễn	1997-06-11	male	Kinh (Việt)	2730	university	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	202487701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08010202
48222	Nguyễn Lê Tường Vy	2016-09-13	female	Kinh (Việt)	2730	None	Cao đài	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010202
48223	Vũ Thị Tường Vi	1952-07-15	female	Kinh (Việt)	2730	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	203903301	Lao động giản đơn	08010202
48224	Bùi Thảo Vân	1958-08-29	female	Kinh (Việt)	2730	primary	Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	205509301	Thợ lắp ráp và vận hành máy móc, thiết bị	08010202
48225	Võ Trương Cao Nhân	1998-09-25	male	Kinh (Việt)	2730		Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	208179401	Nhân viên dịch vụ và bán hàng	08010202
48226	Nguyễn Hoài Bảo	2002-05-29	male	Kinh (Việt)	2730		Không	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Tân Phong Thành phố Lai Châu Tỉnh Lai Châu	205079901	Lực lượng vũ trang	08010202
48227	Nguyễn Bích Kiều Oanh	1958-02-12	female	Kinh (Việt)	2732	secondary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	203364301	Nhân viên trợ lý văn phòng	08010301
48228	Nguyễn Hữu Ngọc Khang	1983-10-22	male	Kinh (Việt)	2732	secondary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	203096401	Lao động giản đơn	08010301
48229	Ngô Minh Nguyên	1967-10-02	male	Kinh (Việt)	2732	secondary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	200355801	Nhân viên trợ lý văn phòng	08010301
48230	Trần Vương Kim Ngân	1962-06-08	female	Kinh (Việt)	2732	none	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	204826801	Tự do	08010301
48231	Trần Nguyễn Mỹ Dung	1967-02-01	female	Kinh (Việt)	2732	primary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	205531401	Nhân viên dịch vụ và bán hàng	08010301
48232	Nguyễn Huỳnh Khánh Như	2018-08-01	female	Kinh (Việt)	2732	None	Phật giáo Hòa Hảo	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010301
48233	Lê Đăng Khoa	1986-06-06	male	Kinh (Việt)	2732	primary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	205574801	Lao động giản đơn	08010301
48234	Lê Hoài Thảo Vy	2011-11-25	female	Kinh (Việt)	2732	primary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Nhà chuyên môn bậc cao (đại học trở lên)	08010301
48235	Lê Thái Trung Tín	2005-06-12	male	Kinh (Việt)	2732	primary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	205225001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08010301
48236	Trần Thị Anh Trâm	1979-10-18	female	Kinh (Việt)	2732	none	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	208657301	Lao động giản đơn	08010301
48237	Nguyễn Trần Minh Thư	1989-12-05	female	La Ha	2732	primary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	208397201	Lực lượng vũ trang	08010301
48238	Trần Võ Bảo Trân	1957-03-09	female	Kinh (Việt)	2732	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	208658801	Lao động giản đơn	08010301
48239	Nguyễn Ngọc Thanh Nhi	1961-09-01	female	Kinh (Việt)	2732	none	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	200420501	Lao động giản đơn	08010301
48240	Trần Thị Thùy Duyên	2019-01-12	female	Kinh (Việt)	2732	None	Phật giáo Hòa Hảo	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010301
48241	Lê Minh Hoàng	2013-02-17	male	Kinh (Việt)	2732	None	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010301
48242	Lê Huyền Thục	1965-07-21	female	Kinh (Việt)	2732	secondary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	205489101	Lao động giản đơn	08010301
48243	Huỳnh Ngọc Mai Linh	1973-12-23	female	Kinh (Việt)	2732	none	Bửu Sơn Kỳ Hương	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	206739201	Lao động giản đơn	08010301
48244	Nguyễn Quốc Hải	1973-09-18	male	Kinh (Việt)	2732	none	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	201580101	Nhà chuyên môn bậc cao (đại học trở lên)	08010301
48245	Nguyễn Hoàng Trúc Linh	1935-07-24	female	Kinh (Việt)	2732	primary	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	208098901	Lao động giản đơn	08010301
48246	Nguyễn Huỳnh Ngọc Hân	1992-04-15	female	Kinh (Việt)	2732	university	Không	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 1 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	200855401	Lao động giản đơn	08010301
48247	Võ Hoàng Phúc	1991-06-23	male	Kinh (Việt)	2733		Tin lành	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	201495901	Lao động giản đơn	08010302
48248	Ong Dương Gia Bảo	1958-04-30	male	Kinh (Việt)	2733	high	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	203646901	Lao động giản đơn	08010302
48249	Hồ Chí Cường	2016-10-25	male	Cống	2733	None	Cơ đốc Phục lâm	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lực lượng vũ trang	08010302
48250	Vũ Phương Thảo	2017-09-07	female	Kinh (Việt)	2733	None	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Thợ lắp ráp và vận hành máy móc, thiết bị	08010302
48251	Nguyễn Ngọc Quỳnh Anh	1959-03-14	female	Kinh (Việt)	2733	primary	Minh Sư đạo	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	200448101	Lao động giản đơn	08010302
48252	Trương Quốc Bảo	1963-11-14	male	Kinh (Việt)	2733	primary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	205681801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010302
48253	Nguyễn Vũ Hoàng Gia	2003-08-12	male	Kinh (Việt)	2733	primary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	202690301	Lao động giản đơn	08010302
48254	Bùi Thế Vinh	2009-08-20	male	Kinh (Việt)	2733	primary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08010302
48255	Võ Thanh Vy	2016-10-20	female	Kinh (Việt)	2733	None	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lực lượng vũ trang	08010302
48256	Cao Thiện Nhân	2015-11-09	male	Kinh (Việt)	2733	None	Cơ đốc Phục lâm	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010302
48257	Văn Phước Sang	2017-08-11	male	Kinh (Việt)	2733	None	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08010302
48258	Phạm Huỳnh Gia Thịnh	2015-04-28	male	Kinh (Việt)	2733	None	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Thợ lắp ráp và vận hành máy móc, thiết bị	08010302
48259	Nguyễn Vân Khanh	1980-01-08	female	Kháng	2733	primary	Cơ đốc Phục lâm	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	200299501	Lao động giản đơn	08010302
48260	Đàm Thị Minh Tâm	1992-10-29	female	Tày	2733	secondary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	201077601	Nhân viên trợ lý văn phòng	08010302
48261	Trần Thanh Trúc Ly	2011-11-14	female	Kinh (Việt)	2733	primary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010302
48262	Đỗ Thị Kim Chi	1959-12-06	female	Kinh (Việt)	2733	none	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	208324401	Nhân viên trợ lý văn phòng	08010302
48263	Võ Mỹ Mẫn Nghi	2014-05-27	female	Kinh (Việt)	2733	None	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Nhân viên dịch vụ và bán hàng	08010302
48264	Cao Thùy Dương	2006-08-10	female	Tày	2733	primary	Phật giáo	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu		Lao động giản đơn	08010302
48265	Hồ Chí Cường	1993-12-27	male	Dao	2733	primary	Không	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	201639401	Lao động giản đơn	08010302
48266	Nguyễn Hữu Thắng	1983-09-12	male	Gia-rai	2733	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	Thôn 2 Phường Quyết Tiến Thành phố Lai Châu Tỉnh Lai Châu	204160401	Lao động giản đơn	08010302
48267	Nguyễn Thanh Phương	2007-09-19	female	Kinh (Việt)	2736	primary	Bửu Sơn Kỳ Hương	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Nhân viên trợ lý văn phòng	08020101
48268	Văn Thị Thanh Huyên	1969-08-09	female	Kinh (Việt)	2736	primary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	203294501	Lao động giản đơn	08020101
48269	Trần Tiến Đạt	1958-08-07	male	Kinh (Việt)	2736	none	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	203166701	Lao động giản đơn	08020101
48270	Dương Thị Phương Anh	1963-10-27	female	Kinh (Việt)	2736	none	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	201627501	Nhân viên dịch vụ và bán hàng	08020101
48271	Trương Văn Hiếu Trỉnh	1960-07-25	male	Kinh (Việt)	2736	none	Tịnh độ Cư sỹ Phật hội	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205564501	Lao động giản đơn	08020101
48272	Nguyễn Thị Kiều Trinh	1977-07-15	female	Kinh (Việt)	2736	secondary	Cơ đốc Phục lâm	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	206852801	Lao động giản đơn	08020101
48273	Nguyễn Ngọc Sang	1959-12-08	male	Kinh (Việt)	2736	none	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205179601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08020101
48274	Trần Nhật Nam	2021-05-20	male	Kinh (Việt)	2736	None	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020101
48275	Lê Gia Huy	2013-04-11	male	Kinh (Việt)	2736	None	Phật giáo	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08020101
48276	Trương Ngân Châu	1963-12-10	female	Kinh (Việt)	2736	primary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205084201	Lao động giản đơn	08020101
48277	Bùi Minh Luân	1969-05-05	male	Kinh (Việt)	2736	none	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	204077901	Lao động giản đơn	08020101
48278	Nguyễn Hoàng Ngân	1992-09-18	female	Brâu	2736	high	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205161001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08020101
48279	Lâm Nhã Linh	1998-09-20	female	Chơ-ro	2736		Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205303901	Lao động giản đơn	08020101
48280	Nguyễn Anh Minh	2003-03-11	male	Kinh (Việt)	2736	primary	Bửu Sơn Kỳ Hương	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	207429101	Lao động giản đơn	08020101
48281	Phạm Hoàng Khôi	1980-03-22	male	Kinh (Việt)	2736	primary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	202736301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08020101
48282	Phan Quốc Khánh	1962-11-20	male	Kinh (Việt)	2736	high	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	204380301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08020101
48283	Trần Hồ Như Quỳnh	2009-05-07	female	Kinh (Việt)	2736	primary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020101
48284	Nguyễn Hữu Thoại	1980-12-04	male	Thái	2736	primary	Mặc môn	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	203786601	Lao động giản đơn	08020101
48285	Trần Thị Ngọc Trinh	1975-02-25	female	Kinh (Việt)	2736	secondary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	204661801	Lao động giản đơn	08020101
48286	Lương Gia Phương	1923-04-12	female	Kinh (Việt)	2736	primary	Không	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	208870201	Lao động giản đơn	08020101
48287	Hoàng Tâm Như	2008-03-30	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020102
48288	Nguyễn Thị Thu Thảo	2004-06-04	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	204727001	Lao động giản đơn	08020102
48289	Nguyễn Xuân Khôi	2000-09-13	male	Kinh (Việt)	2737		Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205777101	Lao động giản đơn	08020102
48290	Lê Đông Hân	1960-07-21	female	Kinh (Việt)	2737	none	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	202964301	Lao động giản đơn	08020102
48291	Thân Thị Thùy Duyên	1989-03-12	female	Thái	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	208230301	Lao động giản đơn	08020102
48292	Hoàng Thị Huyền My	2005-10-28	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	200740701	Lao động giản đơn	08020102
48293	Trần Thị Mẫn	2002-12-09	female	Kinh (Việt)	2737		Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	208103401	Lao động giản đơn	08020102
48294	Nguyễn Tấn Phát	1975-12-02	male	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	206611301	Lao động giản đơn	08020102
48295	Phạm Vĩnh Hưng	1973-10-31	male	Kinh (Việt)	2737	none	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	203295801	Lao động giản đơn	08020102
48296	Phạm Xuân Diệm	1964-10-18	male	Kinh (Việt)	2737	none	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	208754201	Lao động giản đơn	08020102
48297	Phạm Lê Quỳnh Như	1966-03-22	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	208265301	Lao động giản đơn	08020102
48298	Phùng Xuân Phong	1939-02-10	male	Kinh (Việt)	2737	high	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	200155301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08020102
48299	Bùi Khánh Phong	2008-11-01	male	Kinh (Việt)	2737	primary	Bà-la-môn giáo	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020102
48300	Nguyễn Thị Phước Linh	2003-09-02	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	206088801	Nhà chuyên môn bậc cao (đại học trở lên)	08020102
48301	Dương Minh Khang	2018-06-23	male	Kinh (Việt)	2737	None	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020102
48302	Nguyễn Khánh Uyên	2000-11-09	female	Kinh (Việt)	2737		Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	200546601	Lao động giản đơn	08020102
48303	Phạm Ngọc Thanh Mai	2008-11-16	female	Kinh (Việt)	2737	primary	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu		Lao động thủ công và các nghề nghiệp có liên quan khác	08020102
48304	Võ Anh Thư	1987-09-29	female	Kinh (Việt)	2737	none	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	205602601	Tự do	08020102
48305	Nguyễn Phúc Thịnh	1969-05-13	male	Kinh (Việt)	2737	none	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	204484701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08020102
48306	Lê Nguyễn Phong Vinh	1969-01-03	male	Thổ	2737	none	Không	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Thị trấn Tam Đường Huyện Tam Đường Tỉnh Lai Châu	207966201	Lao động giản đơn	08020102
48307	Hồ Đào Yến Linh	1974-08-22	female	Kinh (Việt)	2739	secondary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	202205701	Lao động giản đơn	08020201
48308	Phạm Văn Vũ Duy	1971-08-26	male	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206029101	Nhân viên trợ lý văn phòng	08020201
48309	Trần Nguyễn Tú Linh	1977-03-15	female	Kinh (Việt)	2739	high	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206741601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08020201
48310	Lưu Quỳnh Tuyết Như	1982-05-07	female	Kinh (Việt)	2739	none	Bà-la-môn giáo	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	201235501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08020201
48311	Phạm Bảo Huyền Trân	1973-12-02	female	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	205500301	Lao động giản đơn	08020201
48312	Lương Tố Trinh	2015-06-30	female	Mường	2739	None	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020201
48313	Nguyễn Anh Khoa	2020-06-26	male	Kinh (Việt)	2739	None	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020201
48314	Phan Đình Huy	1958-03-17	male	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	207162501	Lao động giản đơn	08020201
48315	Phạm Trường An	1982-09-22	male	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	205662801	Lao động giản đơn	08020201
48316	Hoàng Lê Quyền	1986-03-05	male	Ơ Đu	2739	none	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	205042501	Lao động giản đơn	08020201
48317	Lê Thanh Điền	2019-04-19	male	Kinh (Việt)	2739	None	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020201
48318	Phạm Anh Vy	1983-12-09	female	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204552001	Nhân viên trợ lý văn phòng	08020201
48319	Nguyễn Quốc Duy	1983-12-04	male	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204114701	Lao động giản đơn	08020201
48320	Huỳnh Ngô Thiên An	1930-06-22	female	Kinh (Việt)	2739	secondary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206875101	Lao động giản đơn	08020201
48321	Đoàn Anh Tú	2009-05-04	male	Giáy	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020201
48322	Đào Thị Thanh Ngân	2004-12-09	female	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204140501	Lực lượng vũ trang	08020201
48323	Lê Phan Hoàng Phúc	2013-09-21	male	Nùng	2739	None	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020201
48324	Hoàng Minh Hiếu	1967-11-20	male	Kinh (Việt)	2739	none	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206501701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08020201
48325	Trần Trí	2009-11-08	male	Kinh (Việt)	2739	primary	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động thủ công và các nghề nghiệp có liên quan khác	08020201
48326	Đỗ Hoàng Ánh Linh	1992-10-28	female	Kinh (Việt)	2739	high	Không	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	203870101	Thợ lắp ráp và vận hành máy móc, thiết bị	08020201
48327	Trần Văn Tài	1971-07-30	male	Kinh (Việt)	2740	high	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	208634301	Lao động giản đơn	08020202
48328	Đặng Trần Anh Thư	1976-08-27	female	Khơ-mú	2740		Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	202708201	Lao động thủ công và các nghề nghiệp có liên quan khác	08020202
48329	Lê Thị Lan Anh	1968-08-28	female	Kinh (Việt)	2740	primary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206007901	Lao động giản đơn	08020202
48330	Trần Thị Ngọc Thu	1982-03-08	female	Khơ-me	2740	high	Hồi giáo	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	200653901	Thợ lắp ráp và vận hành máy móc, thiết bị	08020202
48331	Nguyễn Tiến Dũng	1960-03-23	male	Kinh (Việt)	2740	primary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204503701	Lao động giản đơn	08020202
48332	Ngô Triều Đồng	2008-10-10	male	Kinh (Việt)	2740	primary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08020202
48333	Nguyễn Lê Minh Phúc	1992-05-01	female	Kinh (Việt)	2740	primary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	201546701	Lao động giản đơn	08020202
48334	Đặng Ngọc Anh Chi	2016-07-04	female	Kinh (Việt)	2740	None	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020202
48335	Nguyễn Phạm Thu Hiền	2018-05-24	female	Kinh (Việt)	2740	None	Phật giáo Hòa Hảo	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020202
48336	La Mẫn Thúy	2021-01-23	female	Kinh (Việt)	2740	None	Cao đài	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020202
48337	Huỳnh Hồng Phúc	2013-12-03	male	Kinh (Việt)	2740	None	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020202
48338	Vũ Nguyễn Thùy Dương	1960-09-29	female	Kinh (Việt)	2740	none	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	203858201	Tự do	08020202
48339	Nguyễn Vũ Hải Linh	2001-02-28	female	Kinh (Việt)	2740		Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	201892201	Thợ lắp ráp và vận hành máy móc, thiết bị	08020202
48340	Lê Vạn Duy Hoàng	1995-12-21	male	Kinh (Việt)	2740	high	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204070701	Nhân viên trợ lý văn phòng	08020202
48341	Hồ Nguyễn Thúy Quỳnh	1995-05-05	female	Kinh (Việt)	2740	high	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	204405501	Lực lượng vũ trang	08020202
48342	Nguyễn Hoàng Anh Tú	1975-12-04	male	Kinh (Việt)	2740	none	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	203701001	Lao động giản đơn	08020202
48343	Nguyễn Hoàng Thiện	1980-05-11	male	Kinh (Việt)	2740	primary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	203891701	Nhân viên dịch vụ và bán hàng	08020202
48344	Phan Thị Minh Trang	1935-12-26	female	Kinh (Việt)	2740	none	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	200436701	Nhân viên trợ lý văn phòng	08020202
48345	Cao Ngọc Tường Vy	2005-09-28	female	Kinh (Việt)	2740	secondary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	208675301	Lao động giản đơn	08020202
48346	Đỗ Thành Đạt	1944-03-07	male	Lự	2740	secondary	Không	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Thèn Sin Huyện Tam Đường Tỉnh Lai Châu	206904701	Lao động giản đơn	08020202
48347	Đỗ Minh Hiếu	2014-09-21	male	Kinh (Việt)	2742	None	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020301
48348	Lê Nhựt Minh	2007-05-11	female	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08020301
48349	Phạm Bình Minh	2013-01-27	male	Kinh (Việt)	2742	None	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020301
48350	Đặng Đình Hoàng Phúc	1925-12-02	male	Kinh (Việt)	2742	secondary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	201787701	Lao động giản đơn	08020301
48351	Nguyễn Minh Quang	1971-09-01	male	Kinh (Việt)	2742	high	Bà-la-môn giáo	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	206258401	Lao động giản đơn	08020301
48352	Nguyễn Hoàng Minh Thy	1965-05-12	female	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	200260601	Lao động giản đơn	08020301
48353	Trương Quang Cư	2002-05-01	male	Khơ-me	2742		Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207384601	Lao động giản đơn	08020301
48354	Tăng Võ Thu Bình	1961-09-18	female	Kinh (Việt)	2742	high	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	201573501	Lao động giản đơn	08020301
48355	Hà Thị Quỳnh Trang	1981-11-10	female	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	202505601	Nhân viên trợ lý văn phòng	08020301
48356	Nguyễn Xuân Tùng	1975-05-30	male	Xtiêng	2742	secondary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207367301	Lao động giản đơn	08020301
48357	Võ Văn Nam	2000-01-08	male	Kinh (Việt)	2742		Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	205159501	Lao động giản đơn	08020301
48358	Trần Lâm Anh Thư	1986-04-11	female	Thái	2742	none	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207817501	Nhân viên trợ lý văn phòng	08020301
48359	Nguyễn Tôn Thị Thùy Linh	1982-05-11	female	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	204134501	Thợ lắp ráp và vận hành máy móc, thiết bị	08020301
48360	Nguyễn Lê Gia Huy	2003-12-25	male	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	206296801	Lao động giản đơn	08020301
48361	Nguyễn Đình Quân	1982-05-18	male	Kinh (Việt)	2742	secondary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	202898301	Nhân viên trợ lý văn phòng	08020301
48362	Đỗ Thị Thanh Ngọc	1958-03-23	female	Kinh (Việt)	2742	none	Bà-la-môn giáo	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	203766201	Lao động giản đơn	08020301
48363	Nguyễn Lâm Tuyết Mai	2011-08-20	female	Kinh (Việt)	2742	primary	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020301
48364	Phạm Ngọc Quỳnh Như	2000-03-02	female	Kinh (Việt)	2742		Mặc môn	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	200096601	Lao động giản đơn	08020301
48365	Trương Thu Hương	1958-06-15	female	Kinh (Việt)	2742	high	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207167301	Lao động giản đơn	08020301
48366	Nguyễn Văn Tín	2015-02-06	male	Kinh (Việt)	2742	None	Không	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 1 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020301
48367	Võ Lê Tiến Đạt	1978-09-21	male	Tày	2743	high	Cao đài	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	201648001	Lao động giản đơn	08020302
48368	Phạm Minh Mẫn	1960-03-11	male	Kinh (Việt)	2743	primary	Công giáo	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207218801	Lao động thủ công và các nghề nghiệp có liên quan khác	08020302
48369	Nguyễn Lê Nhật Trường	1961-08-12	male	Kinh (Việt)	2743	primary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	201207201	Lao động giản đơn	08020302
48370	Chế Ngọc Lan Nhi	1987-01-21	female	Kinh (Việt)	2743	primary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	200419901	Lao động giản đơn	08020302
48371	Diệp Minh Khang	2012-03-21	male	Kinh (Việt)	2743	None	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Nhân viên trợ lý văn phòng	08020302
48372	Nguyễn Trọng Nghĩa	1959-08-18	male	Tày	2743	none	Bà-la-môn giáo	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207230001	Nhân viên trợ lý văn phòng	08020302
48373	Trần Tuấn Kiệt	1960-03-02	male	Kinh (Việt)	2743	primary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	204386301	Nhân viên trợ lý văn phòng	08020302
48374	Lại Tuấn Anh	2003-11-30	male	Kinh (Việt)	2743	high	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	205069601	Lao động giản đơn	08020302
48375	Trần Mai Đại Phúc	1995-10-10	male	Kinh (Việt)	2743	secondary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	200941101	Lao động giản đơn	08020302
48376	Nguyễn Thị Kiều Diễm	1977-11-30	female	Kinh (Việt)	2743	high	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	208754101	Lao động giản đơn	08020302
48377	Nguyễn Toàn Anh	1999-07-29	male	Kinh (Việt)	2743		Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	201631101	Lao động giản đơn	08020302
48378	Võ Tường Như	1973-05-15	female	Kinh (Việt)	2743	none	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	206420801	Lao động giản đơn	08020302
48379	Lê Minh Sang	1984-09-17	male	Khơ-me	2743	primary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207446201	Lao động giản đơn	08020302
48380	Bùi Minh Gia Linh	2019-10-15	female	Kinh (Việt)	2743	None	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lực lượng vũ trang	08020302
48381	Tô Hoàng Thạch Lam	1986-07-18	female	Kinh (Việt)	2743	high	Hồi giáo	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	208453801	Lao động giản đơn	08020302
48382	Nguyễn Lê Anh Chi	2015-07-10	female	Kinh (Việt)	2743	None	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu		Lao động giản đơn	08020302
48383	Trần Hữu Chí	1991-08-04	male	Kinh (Việt)	2743		Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	202070901	Lao động giản đơn	08020302
48384	Võ Thùy Trang	1958-11-17	female	Kinh (Việt)	2743	primary	Mặc môn	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	208302801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08020302
48385	Nguyễn Trâm Anh	1984-07-30	female	Si La	2743	secondary	Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	207079301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08020302
48386	Bùi Thị Hải Hà	1998-11-08	female	Kinh (Việt)	2743		Không	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	Thôn 2 Xã Tả Lèng Huyện Tam Đường Tỉnh Lai Châu	203860101	Lao động giản đơn	08020302
48387	Trần Hữu Trai	2003-06-08	male	Kinh (Việt)	2746	primary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	204941601	Nhân viên dịch vụ và bán hàng	08030101
48388	Đặng Hồng Phương	1959-02-22	female	Kinh (Việt)	2746	primary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	207801801	Nhà chuyên môn bậc cao (đại học trở lên)	08030101
48389	Nguyễn Hoàng Bảo	1992-03-31	male	Kinh (Việt)	2746	secondary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	201963501	Lao động giản đơn	08030101
48390	Trần Thị Thanh Nhàn	2016-03-08	female	Kinh (Việt)	2746	None	Bửu Sơn Kỳ Hương	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động thủ công và các nghề nghiệp có liên quan khác	08030101
48391	Võ Ngọc Hân	1960-06-03	female	Kinh (Việt)	2746	none	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	201104901	Lao động thủ công và các nghề nghiệp có liên quan khác	08030101
48392	Nguyễn Lý Thuận	1995-05-12	male	Kinh (Việt)	2746	high	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	203497101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030101
48393	Phạm Hùng Phong	2015-03-20	male	Tày	2746	None	Bà-la-môn giáo	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030101
48394	Phạm Phú Lộc	1970-08-23	male	Kinh (Việt)	2746	secondary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	202208601	Lao động thủ công và các nghề nghiệp có liên quan khác	08030101
48395	Hoàng Bình Minh	2000-08-13	male	Kinh (Việt)	2746		Phật giáo Hòa Hảo	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	208820701	Lực lượng vũ trang	08030101
48396	Hoàng Thụy Minh Trang	1997-09-30	female	Kinh (Việt)	2746	primary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	201857001	Lao động giản đơn	08030101
48397	Nguyễn Thị Kim Thùy	1962-04-22	female	Kinh (Việt)	2746	secondary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	208892001	Lao động giản đơn	08030101
48398	Vương Hoàng Thịnh	1966-07-14	male	Kinh (Việt)	2746	none	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	201945701	Lao động giản đơn	08030101
48399	Trương Ngọc Đan	1966-02-21	male	Kinh (Việt)	2746	secondary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	203920501	Lao động giản đơn	08030101
48400	Nguyễn Thị Thanh Hương	1981-04-24	female	Kinh (Việt)	2746	none	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	203730701	Lao động giản đơn	08030101
48401	Nguyễn Lương Hoài Tâm	1927-11-12	male	Kinh (Việt)	2746	primary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	203493401	Tự do	08030101
48402	Nguyễn Như Thùy	2012-09-07	female	Kinh (Việt)	2746	None	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08030101
48403	Nguyễn Ngọc Anh Thư	1960-01-22	female	Lào	2746	primary	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	203307001	Lực lượng vũ trang	08030101
48404	Nguyễn Quốc Huy	1990-09-30	male	Kinh (Việt)	2746	high	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	205552701	Lao động giản đơn	08030101
48405	Nguyễn Ái Minh Ngọc	2021-11-20	female	Kinh (Việt)	2746	None	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030101
48406	Lê Thu Ngân	1963-05-09	female	Kinh (Việt)	2746	high	Không	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	202134401	Lao động giản đơn	08030101
48407	Lê Minh Thư	2014-04-15	female	Kinh (Việt)	2747	None	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lực lượng vũ trang	08030102
48408	Du Quốc Hưng	2010-05-16	male	Mạ	2747	primary	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Nhân viên trợ lý văn phòng	08030102
48409	Lê Kim Ngân	2011-11-23	female	Giáy	2747	primary	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030102
48410	Nguyễn Đinh Thái Thuận	1985-08-12	male	Thái	2747	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	202370601	Lao động giản đơn	08030102
48411	Trần Phương Mai	2012-03-10	female	Kinh (Việt)	2747	None	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030102
48412	Cao Ngô Hằng My	2002-11-09	female	Kinh (Việt)	2747		Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	200345601	Lao động giản đơn	08030102
48413	Trương Hồ Thanh Trúc	1999-10-23	female	Kinh (Việt)	2747		Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	204662601	Lao động giản đơn	08030102
48414	Tô Huỳnh Duy	2014-03-01	male	Kinh (Việt)	2747	None	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030102
48415	Phan Tiến Dũng	1985-06-18	male	Cơ-tu	2747	none	Tin lành	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	207106001	Lao động giản đơn	08030102
48416	Trần Ngọc Như Ý	1971-04-11	female	Kinh (Việt)	2747	primary	Phật giáo	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	200121701	Tự do	08030102
48417	Đặng Hoàng Phúc	1991-08-10	male	Kinh (Việt)	2747		Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	204712101	Lao động giản đơn	08030102
48418	Hồ Quang Chiến	2021-07-18	male	Kinh (Việt)	2747	None	Minh Sư đạo	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030102
48419	Nguyễn Phúc Lợi	1962-03-23	male	Kinh (Việt)	2747	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	202742201	Lao động giản đơn	08030102
48420	Phan Huỳnh Thái Bình	1988-06-28	female	Kinh (Việt)	2747	primary	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	206892201	Lao động giản đơn	08030102
48421	Vũ Thị Thùy Lam	1966-11-22	female	Kinh (Việt)	2747	none	Minh lý đạo - Tam Tông Miếu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	201535601	Lao động giản đơn	08030102
48422	Trương Thị Minh Anh	2020-06-02	female	Kinh (Việt)	2747	None	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030102
48423	Nguyễn Thị Hồng Thắm	1995-06-10	female	Kinh (Việt)	2747	university	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	205485901	Lao động giản đơn	08030102
48424	Nguyễn Đoàn Bích Ngọc	2009-09-06	female	Kinh (Việt)	2747	primary	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030102
48425	Nguyễn Trung Hiếu	1981-01-14	male	Kinh (Việt)	2747	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	204643401	Lao động giản đơn	08030102
48426	Tăng Nguyễn Phong	1988-02-06	male	Kinh (Việt)	2747	secondary	Không	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Thị trấn Mường Tè Huyện Mường Tè Tỉnh Lai Châu	205627501	Lao động giản đơn	08030102
48427	Nguyễn Anh Tân	1964-03-09	male	Kinh (Việt)	2749	none	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	203782701	Thợ lắp ráp và vận hành máy móc, thiết bị	08030201
48428	Lâm Hoàng An	1962-10-16	male	Kinh (Việt)	2749	high	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	207851401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030201
48429	Đinh Thanh Hải	2012-11-12	male	Nùng	2749	None	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Tự do	08030201
48430	Phạm Đức Hòa	2004-12-18	male	Kinh (Việt)	2749	primary	Hồi giáo	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206067201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030201
48431	Dương Thị Minh Hằng	1987-03-06	female	Kinh (Việt)	2749	secondary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206064801	Lao động thủ công và các nghề nghiệp có liên quan khác	08030201
48432	Lê Trọng Đại	1977-02-05	male	Kinh (Việt)	2749	secondary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206682701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08030201
48433	Lê Trung Kiên	2000-03-21	male	Kinh (Việt)	2749		Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	203332801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030201
48434	Nguyễn Thùy Dương	2004-12-26	female	Kinh (Việt)	2749	primary	Baha'I	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	204306901	Lao động giản đơn	08030201
48435	Mai Quốc Lộc	1955-09-07	male	Kinh (Việt)	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	202126101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030201
48436	Dương Thanh Thuận	1990-04-24	male	Kinh (Việt)	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206264701	Tự do	08030201
48437	Nguyễn Khắc Chánh	1959-07-01	male	Thái	2749	secondary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	202926701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08030201
48438	Nguyễn Tiến Khoa	1957-03-23	male	Kinh (Việt)	2749	high	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206389601	Lao động giản đơn	08030201
48439	Võ Hoàng Thắng	1959-10-21	male	Kinh (Việt)	2749	primary	Bửu Sơn Kỳ Hương	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	200490801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	08030201
48440	Huỳnh Ngọc Quỳnh Trâm	1969-02-16	female	Kinh (Việt)	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	208902401	Lao động giản đơn	08030201
48441	Trương Ngọc Thanh Nhã	2019-04-12	female	Kinh (Việt)	2749	None	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030201
48442	Trần Lê Anh Thư	1994-11-06	female	Hà nhì	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206837701	Lao động giản đơn	08030201
48443	Phạm Thùy Ngân	1967-07-20	female	Kinh (Việt)	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	208260201	Lao động giản đơn	08030201
48444	Nguyễn Hoàng Quân	2021-05-10	male	Kinh (Việt)	2749	None	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030201
48445	Ngô Hoàng Thanh Trúc	2016-05-11	female	Kinh (Việt)	2749	None	Mặc môn	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030201
48446	Trần Ngô Bảo Khanh	2009-05-04	female	Kinh (Việt)	2749	primary	Không	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030201
48447	Huỳnh Văn Hơn	1960-05-19	male	Khơ-me	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	205551701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030202
48448	Bành Hùng Quốc	2003-04-12	male	Kinh (Việt)	2750	secondary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	200705801	Lao động giản đơn	08030202
48449	Hồ Uyển Nhi	2006-11-23	female	Kinh (Việt)	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Nhà chuyên môn bậc cao (đại học trở lên)	08030202
48450	Nguyễn Vân Anh	1986-01-24	female	Kinh (Việt)	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	202376301	Nhà chuyên môn bậc cao (đại học trở lên)	08030202
48451	Ngô Nguyễn Trung Nguyên	2013-08-20	male	Kinh (Việt)	2750	None	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030202
48452	Lê Đức Huy	1960-07-04	male	Kinh (Việt)	2750	secondary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	207692201	Tự do	08030202
48453	Lê Trần Minh Anh	2009-01-31	female	Kinh (Việt)	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lực lượng vũ trang	08030202
48454	Đinh Xuân Tùng	2013-09-27	male	Khơ-me	2750	None	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030202
48455	Võ Lê Quý	2016-10-25	male	Kinh (Việt)	2750	None	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030202
48456	Châu Vũ Lộc	1977-03-08	male	Cơ-ho	2750	primary	Phật giáo	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	201708801	Lao động giản đơn	08030202
48457	Nguyễn Hoàng Anh	1931-09-14	female	Kinh (Việt)	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	206881101	Lao động giản đơn	08030202
48458	Phạm Thanh Thiên	1986-05-19	male	Rơ-măm	2750	none	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	204728301	Lao động giản đơn	08030202
48459	Nguyễn Hoàng Minh Nhật	1968-07-11	male	Kinh (Việt)	2750	none	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	205326401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030202
48460	Nguyễn Lê Minh Khoa	2004-11-03	male	Kinh (Việt)	2750	primary	Cơ đốc Phục lâm	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	207520201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030202
48461	Tiêu Khánh Linh	1970-05-12	female	Kinh (Việt)	2750	high	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	203961101	Thợ lắp ráp và vận hành máy móc, thiết bị	08030202
48462	Từ Tường Vy	1975-02-10	female	Kinh (Việt)	2750	secondary	Baha'I	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	204793901	Nhà chuyên môn bậc cao (đại học trở lên)	08030202
48463	Nguyễn Đức Trung	1993-11-06	male	La Ha	2750	university	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	208860801	Thợ lắp ráp và vận hành máy móc, thiết bị	08030202
48464	Lương Ngân Giang	1987-09-07	female	Ơ Đu	2750	none	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	202468501	Lao động giản đơn	08030202
48465	Nguyễn Hoàng Gia Khang	2009-10-04	male	Cơ Lao	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu		Thợ lắp ráp và vận hành máy móc, thiết bị	08030202
48466	Nguyễn Ngọc Bảo Như	1983-03-25	female	Kinh (Việt)	2750	primary	Không	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Thu Lũm Huyện Mường Tè Tỉnh Lai Châu	204460701	Lao động giản đơn	08030202
48467	Tô Tố Nghi	2013-04-19	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Nhà chuyên môn bậc cao (đại học trở lên)	08030301
48468	Đào Ngọc Hà	1980-01-27	male	Kinh (Việt)	2752	none	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208334501	Lao động giản đơn	08030301
48469	Hoàng Thị Quỳnh	2005-02-04	female	Kinh (Việt)	2752	primary	Công giáo	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	204892801	Lao động giản đơn	08030301
48470	Trịnh Quốc Tín	1995-11-19	male	Kinh (Việt)	2752	university	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208899301	Thợ lắp ráp và vận hành máy móc, thiết bị	08030301
48471	Lê Thị Trà My	1971-03-11	female	Kinh (Việt)	2752	secondary	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	206766301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030301
48472	Giang Mỹ Phụng	2020-09-08	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Nhân viên dịch vụ và bán hàng	08030301
48473	Trịnh Nguyễn Ngọc Linh	2017-10-27	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48474	Phạm Hoàng Dũng	1986-10-22	male	Hà nhì	2752	primary	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	207105701	Lao động giản đơn	08030301
48475	Lê Đăng Công	1971-11-14	male	Kinh (Việt)	2752	primary	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	204113301	Nhân viên dịch vụ và bán hàng	08030301
48476	Đồng Thanh Ngọc	2013-11-07	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48477	Quách Thảo Vy	1984-09-05	female	Kinh (Việt)	2752	secondary	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	200061901	Lao động giản đơn	08030301
48478	La Thuận Lợi	1963-02-25	male	Kinh (Việt)	2752	primary	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	201174301	Lao động giản đơn	08030301
48479	Văn Ngọc Ngân	2020-10-07	female	Hrê	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Tự do	08030301
48480	Nguyễn Hồ Thủy Tú	2019-01-11	female	Chứt	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48481	Nguyễn Huy Anh	2021-04-29	male	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48482	Phan Nguyễn Nhi Anh	2021-02-11	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030301
48483	Nguyễn Huỳnh Hân	1998-01-09	female	Kinh (Việt)	2752		Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208065601	Lao động giản đơn	08030301
48484	Trần Lê Phương Đoan	2015-11-17	female	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48485	Nguyễn Tấn Tài	2012-02-12	male	Kinh (Việt)	2752	None	Minh Sư đạo	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030301
48486	Trần Việt Nam	2012-08-12	male	Kinh (Việt)	2752	None	Không	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 1 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	08030301
48487	Nguyễn Đức Hùng	1994-04-28	male	Kinh (Việt)	2753	primary	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	203930201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030302
48488	Hàng Tấn Tài	1989-04-01	male	Kinh (Việt)	2753	secondary	Minh Sư đạo	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	205043801	Lao động giản đơn	08030302
48489	Phạm Mỹ Xuân	2000-06-29	female	Tày	2753		Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	203848701	Lao động giản đơn	08030302
48490	Phạm Đặng Thái Sơn	1973-08-16	male	Sán Chay	2753	none	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	206330601	Lao động giản đơn	08030302
48491	Lê Phúc Gia Huy	2013-12-04	male	Kinh (Việt)	2753	None	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Nhân viên trợ lý văn phòng	08030302
48492	Nguyễn Hữu Minh An	1981-05-23	male	Kinh (Việt)	2753	none	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	204489601	Lao động giản đơn	08030302
48493	Nguyễn Minh Đăng	1959-07-02	male	Kinh (Việt)	2753	none	Bửu Sơn Kỳ Hương	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	203921401	Lao động giản đơn	08030302
48494	Nguyễn Đình Khanh	1979-07-11	male	Kinh (Việt)	2753	primary	Minh Sư đạo	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208698201	Nhân viên dịch vụ và bán hàng	08030302
48495	Võ Trần Ngọc Mẫn	1991-08-11	female	Kinh (Việt)	2753		Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	200803501	Lao động giản đơn	08030302
48496	Huỳnh Thị Thùy Trang	1963-05-18	female	Kinh (Việt)	2753	primary	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208079901	Thợ lắp ráp và vận hành máy móc, thiết bị	08030302
48497	Huỳnh Dương Ngọc Diệp	2000-08-09	female	Kinh (Việt)	2753		Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	200392101	Nhân viên trợ lý văn phòng	08030302
48498	Tạ Bảo Toàn	1984-06-23	male	Kinh (Việt)	2753	primary	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	207296501	Nhân viên dịch vụ và bán hàng	08030302
48499	Nguyễn Hồ Tâm Như	1984-10-24	female	Kinh (Việt)	2753	none	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	208115701	Thợ lắp ráp và vận hành máy móc, thiết bị	08030302
48500	Trần Thuần Khanh	2018-03-25	female	Kinh (Việt)	2753	None	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030302
48501	Huỳnh Sử Nam	1966-06-07	male	La Ha	2753	none	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	205825201	Lao động giản đơn	08030302
48502	Lữ Quang Vinh	1976-08-22	male	Kinh (Việt)	2753		Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	203448901	Thợ lắp ráp và vận hành máy móc, thiết bị	08030302
48503	Trịnh Lâm Hoàng Thịnh	2018-06-03	male	Cơ-ho	2753	None	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	08030302
48504	Vũ Lê Bảo Nghi	1958-03-10	female	Kinh (Việt)	2753	primary	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	200352601	Lao động giản đơn	08030302
48505	Nguyễn Văn Trọng	2012-10-29	male	Kinh (Việt)	2753	None	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu		Lao động giản đơn	08030302
48506	Trần Phạm Xuân Quỳnh	1992-01-24	female	Kinh (Việt)	2753	high	Không	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	Thôn 2 Xã Ka Lăng Huyện Mường Tè Tỉnh Lai Châu	206625001	Lao động giản đơn	08030302
48507	Phạm Trần Bảo Châu	1980-01-22	female	Kinh (Việt)	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	201097201	Lao động giản đơn	09010101
48508	Nguyễn Đức Tuấn Nguyên	1982-06-23	male	Kinh (Việt)	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	203231101	Thợ lắp ráp và vận hành máy móc, thiết bị	09010101
48509	Phạm Minh Hiếu	2015-05-28	male	Kinh (Việt)	2757	None	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Thợ lắp ráp và vận hành máy móc, thiết bị	09010101
48510	Nguyễn Hồng Sơn	1969-09-13	male	Kinh (Việt)	2757	university	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	206804001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010101
48511	Nguyễn Thị Cẩm Tú	1986-09-29	female	Kinh (Việt)	2757	none	Phật giáo Hòa Hảo	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202720601	Nhà chuyên môn bậc cao (đại học trở lên)	09010101
48512	Võ Ngọc Ngân	1967-11-11	female	Kinh (Việt)	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	200351101	Lực lượng vũ trang	09010101
48513	Lương Khả Lệ	2021-07-05	female	Kinh (Việt)	2757	None	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010101
48514	Nguyễn Thị Nhung	2016-10-07	female	Kinh (Việt)	2757	None	Phật giáo	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Lực lượng vũ trang	09010101
48515	Hứa Kim Luân	1999-08-28	male	Kinh (Việt)	2757		Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207256901	Lao động giản đơn	09010101
48516	Nguyễn Ngọc Bảo Hân	2003-01-12	female	Kinh (Việt)	2757	secondary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202594201	Lao động giản đơn	09010101
48517	Trần Thanh Sơn	1974-12-24	male	Kinh (Việt)	2757	none	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	206567901	Nhân viên trợ lý văn phòng	09010101
48518	Bùi Nguyễn Thiên Thuận	1976-10-12	female	Hà nhì	2757		Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	208492301	Lao động giản đơn	09010101
48519	Phan Nguyễn Quỳnh Như	1996-09-03	female	Kinh (Việt)	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	201851101	Lao động thủ công và các nghề nghiệp có liên quan khác	09010101
48520	Phạm Gia Huy	1944-06-18	male	La Ha	2757	high	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	203410901	Lao động giản đơn	09010101
48521	Đỗ Minh Hiệp	1998-10-19	male	Kinh (Việt)	2757		Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202086101	Lao động giản đơn	09010101
48522	Lê Nguyễn Hương Giang	1943-04-02	female	Kinh (Việt)	2757	none	Bà-la-môn giáo	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202591601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010101
48523	Nguyễn Thị Thanh Nhàn	2011-12-04	female	Kinh (Việt)	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09010101
48524	Nguyễn Trọng Hiếu	1981-03-14	male	Kinh (Việt)	2757	secondary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	204745701	Lao động giản đơn	09010101
48525	Trần Ngọc Bảo Trân	1986-04-11	female	Brâu	2757	primary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207050401	Lao động giản đơn	09010101
48526	Trần Minh Như	1962-04-14	female	Kinh (Việt)	2757	secondary	Không	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202491601	Lao động giản đơn	09010101
48527	Trương Thái Thiên Thanh	1961-03-02	female	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207448001	Lao động giản đơn	09010102
48528	Đào Phan Túc Minh Thư	1979-09-30	female	Kinh (Việt)	2758	secondary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	204273101	Lao động thủ công và các nghề nghiệp có liên quan khác	09010102
48529	Nguyễn Trí Thắng Vinh	1972-03-18	male	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	201210901	Lao động giản đơn	09010102
48530	Nguyễn Hoàng Mẫn	2017-10-22	male	Kinh (Việt)	2758	None	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09010102
48531	Lê Ngọc Thảo	2004-04-01	female	Kinh (Việt)	2758	primary	Cơ đốc Phục lâm	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	204896701	Thợ lắp ráp và vận hành máy móc, thiết bị	09010102
48532	Nguyễn Thảo Quyên	1983-06-29	female	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	203491201	Lao động giản đơn	09010102
48533	Đinh Châu Ngọc Minh	2009-03-26	female	Kinh (Việt)	2758	primary	Phật giáo Hòa Hảo	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010102
48534	Nguyễn Phúc Thuận	1984-04-23	male	Kinh (Việt)	2758	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202501601	Lao động thủ công và các nghề nghiệp có liên quan khác	09010102
48535	Võ Minh Mẫn	1997-11-16	male	Lào	2758	primary	Phật giáo	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	208703601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010102
48536	Trần Ngọc Minh Sang	1960-02-17	male	Kinh (Việt)	2758	none	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	206330101	Lao động giản đơn	09010102
48537	Mật Thanh Quý	1960-03-23	male	Kinh (Việt)	2758	high	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	201790501	Nhà chuyên môn bậc cao (đại học trở lên)	09010102
48538	Huỳnh Nguyễn Kim Hà	1953-04-14	female	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	201652501	Lao động giản đơn	09010102
48539	Lê Trần Anh Thư	1922-05-26	female	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202502401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010102
48540	Nguyễn Huỳnh Thanh Vũ	1945-09-02	male	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207845901	Lao động giản đơn	09010102
48541	Nguyễn Trần Thanh Trúc	1983-11-13	female	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	206855501	Lao động giản đơn	09010102
48542	Trương Đức Thảo	1973-02-05	male	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207344401	Lao động giản đơn	09010102
48543	Nguyễn Phong Thịnh	2010-07-13	male	Kinh (Việt)	2758	primary	Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010102
48544	Nguyễn Khánh Trân	1991-06-22	female	Cơ-ho	2758		Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	207620001	Lao động giản đơn	09010102
48545	Nguyễn Thế Minh Hùng	1987-04-11	male	Kinh (Việt)	2758	primary	Cao đài	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	202942801	Lực lượng vũ trang	09010102
48546	Phạm Ngọc Yến	1976-09-21	female	Kinh (Việt)	2758		Không	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Chiềng Lề Thành phố Sơn La Tỉnh Sơn La	205394701	Lao động giản đơn	09010102
48547	Nguyễn Hoàng Gia Hân	2012-10-21	female	Pà Thẻn	2760	None	Mặc môn	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010201
48548	Đoàn Nguyễn Minh Khôi	2016-06-27	male	Chứt	2760	None	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010201
48549	Nguyễn Ngọc Thanh Thảo	1979-10-18	female	Chu-ru	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	200047201	Lao động giản đơn	09010201
48550	Nguyễn Minh Vũ	1958-08-29	male	Kinh (Việt)	2760	none	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	202244501	Lao động giản đơn	09010201
48551	Hàng Bội Linh	1987-05-11	female	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201363401	Lao động giản đơn	09010201
48552	Nguyễn Thị Hồng Hà	2009-10-21	female	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09010201
48553	Lê Ái Doanh	1997-06-25	female	Brâu	2760	secondary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	204194201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010201
48554	Trần Như Xuân	1976-05-06	female	Kinh (Việt)	2760		Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	206355301	Lực lượng vũ trang	09010201
48555	Nguyễn Ngọc Trâm Anh	2007-03-06	female	Kinh (Việt)	2760	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010201
48556	Nguyễn Thành Tâm	1997-08-31	male	Kinh (Việt)	2760	primary	Công giáo	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	206979701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010201
48557	Nguyễn Đức Phúc	2010-07-04	male	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010201
48558	Lê Lan Anh	1976-05-08	female	Kinh (Việt)	2760		Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201521501	Lao động giản đơn	09010201
48559	Nguyễn Hoàng Minh Luân	1993-11-27	male	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201174601	Lao động giản đơn	09010201
48560	Trần Thị Vân Anh	2020-06-11	female	Kinh (Việt)	2760	None	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09010201
48561	Nguyễn Ngọc Trang	2012-10-30	female	Kinh (Việt)	2760	None	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Tự do	09010201
48562	Nguyễn Thị Hồng Phượng	2013-11-26	female	Kinh (Việt)	2760	None	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09010201
48563	Nguyễn Tuấn Hưng	2002-04-14	male	Kinh (Việt)	2760		Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	203182401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010201
48564	Lưu Kim Nguyên	1970-09-11	female	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	202215301	Lao động giản đơn	09010201
48565	Phùng Hoàng Minh Hiếu	2013-07-30	male	Kinh (Việt)	2760	None	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010201
48566	Dương Ngọc Hà Anh	1926-10-01	female	Kinh (Việt)	2760	primary	Không	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	200903601	Lao động giản đơn	09010201
48567	Nguyễn Tiến Cường	1964-01-08	male	Kinh (Việt)	2761	none	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	208527401	Nhà chuyên môn bậc cao (đại học trở lên)	09010202
48568	Hoàng Tuấn Khanh	2010-05-14	male	Kinh (Việt)	2761	primary	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010202
48569	Nguyễn Hưũ Đạt	1961-12-09	male	Kinh (Việt)	2761	high	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	206684401	Lao động giản đơn	09010202
48570	Ngô Nguyễn Kim Khánh	2000-11-09	female	Kinh (Việt)	2761		Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	202627001	Lao động giản đơn	09010202
48571	Lê Nguyên Khôi	2016-12-20	male	Kinh (Việt)	2761	None	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Tự do	09010202
48572	Đỗ Việt Hoàng	1960-07-10	male	Kinh (Việt)	2761	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	202195401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010202
48573	Nguyễn Hải Nam	1981-05-26	male	Hrê	2761	none	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	203110101	Nhân viên trợ lý văn phòng	09010202
48574	Phạm Quốc Thái	1960-06-09	male	Kinh (Việt)	2761	primary	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	208636201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010202
48575	Đặng Huỳnh Kiến Văn	1974-03-11	male	Kinh (Việt)	2761	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201514601	Nhân viên trợ lý văn phòng	09010202
48576	Phan Đặng Quỳnh Như	1961-07-02	female	Kinh (Việt)	2761	none	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201186301	Lao động giản đơn	09010202
48577	Phan Thị Ngọc Quyên	2008-11-06	female	Kinh (Việt)	2761	primary	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010202
48578	Đại Tuấn Kiệt	2000-06-09	male	Kinh (Việt)	2761		Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	200084401	Lao động giản đơn	09010202
48579	Nguyễn Thị Hoan	1991-09-26	female	Kinh (Việt)	2761		Baha'I	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	204931801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010202
48580	Nguyễn Ngọc Anh Thư	1936-06-29	female	Kinh (Việt)	2761	none	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	201300101	Nhân viên dịch vụ và bán hàng	09010202
48581	Dương Ngọc Yến Nhi	1930-03-17	female	Brâu	2761	primary	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	207908801	Lao động giản đơn	09010202
48582	Huỳnh Phương Minh	1926-12-13	female	Kinh (Việt)	2761	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	205153901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010202
48583	Mạch Tuấn Đạt	2021-03-13	male	Kinh (Việt)	2761	None	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Nhân viên trợ lý văn phòng	09010202
48584	Nguyễn Thanh Xuân	1964-12-25	female	Kinh (Việt)	2761	university	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	202175601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010202
48585	Hồ Thị Cẩm Nhung	2013-10-01	female	Kinh (Việt)	2761	None	Phật giáo Hòa Hảo	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010202
48586	Lại Nhật Tuấn Cường	1979-09-20	male	Kinh (Việt)	2761	secondary	Không	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Tô Hiệu Thành phố Sơn La Tỉnh Sơn La	200006801	Tự do	09010202
48587	Phạm Lê Thanh Hiền	1995-02-28	male	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204641801	Nhân viên dịch vụ và bán hàng	09010301
48588	Dương Chí Cường	1952-07-04	male	Kinh (Việt)	2763	high	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	207666301	Lao động giản đơn	09010301
48589	Trương Thị Ánh Phượng	1996-04-26	female	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	201433701	Nhân viên trợ lý văn phòng	09010301
48590	Phạm Minh Hiếu	1998-03-17	male	Kinh (Việt)	2763		Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	202278101	Tự do	09010301
48591	Hoàng Nhất Minh	1996-03-01	male	Thái	2763	secondary	Tin lành	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	205821701	Lao động giản đơn	09010301
48592	Nguyễn Bảo Khanh	1974-05-22	male	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	202418001	Lao động giản đơn	09010301
48593	Nguyễn Bạch Ngọc Long	2019-09-19	male	Kinh (Việt)	2763	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010301
48594	Chế Trần Loan Thảo	2016-10-12	female	Kinh (Việt)	2763	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lực lượng vũ trang	09010301
48595	Nguyễn Thị Hoạ My	1999-07-24	female	Kinh (Việt)	2763		Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204024801	Lao động giản đơn	09010301
48596	Phan Lê Nguyễn	2010-09-16	male	Tày	2763	primary	Cao đài	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010301
48597	Phạm Huỳnh Ngọc Giàu	2016-04-09	female	Kinh (Việt)	2763	None	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010301
48598	Trần Quốc Huy	1965-04-19	male	Kinh (Việt)	2763	primary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	208799201	Lao động giản đơn	09010301
48599	Trần Thiên Phong	1991-02-28	male	Kinh (Việt)	2763		Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	203621801	Nhà chuyên môn bậc cao (đại học trở lên)	09010301
48600	Phạm Thị Như Hoa	1963-08-07	female	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	206700501	Lao động giản đơn	09010301
48601	Nguyễn Lê An Khang	1968-06-19	male	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204376901	Lao động giản đơn	09010301
48602	Vòng Hồ Thiên Nhạn	1960-12-21	female	Kinh (Việt)	2763	primary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	203232401	Lao động giản đơn	09010301
48603	Trần Hoàng My	1973-06-06	female	Hmông (Mèo)	2763	secondary	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	206411201	Lao động giản đơn	09010301
48604	Nông Diệu Phú	1983-12-05	male	Thái	2763	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	201923001	Nhà chuyên môn bậc cao (đại học trở lên)	09010301
48605	Nguyễn Thiện Bảo	1928-03-02	male	Kinh (Việt)	2763	none	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	207476301	Lao động giản đơn	09010301
48606	Nguyễn Văn Minh	1986-10-29	male	Kinh (Việt)	2763	high	Không	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 1 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204079401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010301
48607	Nhan Bội Trân	2021-10-09	female	Kinh (Việt)	2764	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09010302
48608	Tô Thị Ngọc Trân	1973-09-20	female	Chơ-ro	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	202097601	Lao động thủ công và các nghề nghiệp có liên quan khác	09010302
48609	Trần Đình Kiến Quốc	2017-12-12	male	Kinh (Việt)	2764	None	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010302
48610	Nguyễn Văn Mẩn	1991-03-09	male	Ơ Đu	2764		Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	205820901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09010302
48611	Trần Quốc Tuấn	1991-12-08	male	Tày	2764		Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	205126501	Lao động giản đơn	09010302
48612	Phạm Lê Thanh Vy	1986-03-26	female	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	200061601	Thợ lắp ráp và vận hành máy móc, thiết bị	09010302
48613	Tô Vĩnh Trung	1975-11-03	male	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	202099901	Tự do	09010302
48614	Lý Bảo Châu	1982-07-27	female	Ra-glai	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204625501	Nhân viên trợ lý văn phòng	09010302
48615	Ngô Xuân Hoàng	1991-03-03	male	Kinh (Việt)	2764		Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	204361901	Lao động giản đơn	09010302
48616	Trần Minh Khoa	1970-05-29	male	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	207718401	Thợ lắp ráp và vận hành máy móc, thiết bị	09010302
48617	Đào Thanh Tú	1972-12-30	female	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	202616501	Lao động thủ công và các nghề nghiệp có liên quan khác	09010302
48618	Trần Nguyễn Phi Hùng	1988-10-31	male	Hoa (Hán)	2764	none	Hồi giáo	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	201166201	Lao động giản đơn	09010302
48619	Nguyễn Tuấn Kiệt	2006-12-03	male	Kinh (Việt)	2764	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Lao động giản đơn	09010302
48620	Lưu Thị Tuyết Khang	1982-02-16	female	Tày	2764	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	201169101	Lực lượng vũ trang	09010302
48621	Trần Giang Thanh Lan	1971-01-28	female	Kinh (Việt)	2764	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	206736001	Lao động giản đơn	09010302
48622	Nguyễn Trần Tường Vi	1966-07-19	female	Kinh (Việt)	2764	secondary	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	207693701	Lao động giản đơn	09010302
48623	Nguyễn Hồng Dương	1962-08-07	male	Kinh (Việt)	2764	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	208231001	Lao động giản đơn	09010302
48624	Trần Kim Thắng	2009-02-09	male	Ê-đê	2764	primary	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09010302
48625	Phạm Minh Châu	1959-11-11	female	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	207664101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09010302
48626	Nguyễn Lương Quốc Huy	1959-11-23	male	Kinh (Việt)	2764	none	Không	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	Thôn 2 Phường Quyết Thắng Thành phố Sơn La Tỉnh Sơn La	203599201	Thợ lắp ráp và vận hành máy móc, thiết bị	09010302
48627	Mai Trung Khải	1972-09-13	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	206535601	Lao động giản đơn	09020101
48628	Phan Nguyễn Bảo Hân	2013-10-15	female	Kinh (Việt)	2767	None	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020101
48629	Phạm Diệu Linh	1975-10-17	female	Kinh (Việt)	2767	none	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	205788801	Lao động giản đơn	09020101
48630	Lâm Quang Vinh	1960-06-25	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	203143601	Lao động thủ công và các nghề nghiệp có liên quan khác	09020101
48631	Phạm Thị Khánh Ly	2013-12-19	female	Cơ-tu	2767	None	Cơ đốc Phục lâm	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09020101
48632	Đặng Minh Nhật	1994-08-01	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	207435801	Lao động thủ công và các nghề nghiệp có liên quan khác	09020101
48633	Tống Xuân Việt Hùng	2015-10-20	male	Kinh (Việt)	2767	None	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020101
48634	Võ Quốc Thắng	1968-05-19	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	206936901	Lao động giản đơn	09020101
48635	Đỗ Bảo Long	1961-12-16	male	Kinh (Việt)	2767	secondary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	202866301	Nhân viên dịch vụ và bán hàng	09020101
48636	Phạm Thị Hà Trang	2005-10-29	female	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	207297701	Nhân viên dịch vụ và bán hàng	09020101
48637	Nguyễn Trường An	1987-04-27	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	208732001	Nhân viên trợ lý văn phòng	09020101
48638	Đào Thanh Hải	1971-01-26	male	Kinh (Việt)	2767	high	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	203283301	Lao động giản đơn	09020101
48639	Đỗ Nguyễn Minh Ngọc	1983-08-30	female	Kinh (Việt)	2767	high	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	203482001	Lao động giản đơn	09020101
48640	Trần Hữu Phúc	2019-07-05	male	Kinh (Việt)	2767	None	Phật giáo Hòa Hảo	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09020101
48641	Trần Quang Minh	1989-09-13	male	Thái	2767	secondary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	205822301	Lao động giản đơn	09020101
48642	Lê Nguyễn Hoàng Nghĩa	1984-10-09	male	Kinh (Việt)	2767	secondary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	207177001	Nhân viên trợ lý văn phòng	09020101
48643	Lê Hoàng Nam	2015-08-10	male	Kinh (Việt)	2767	None	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Tự do	09020101
48644	Huỳnh Nguyễn Nhật Huy	2004-06-07	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	201271401	Nhân viên dịch vụ và bán hàng	09020101
48645	Lương Tất Tuyết Hằng	2018-09-13	female	Kinh (Việt)	2767	None	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020101
48646	Nguyễn Kim Huế Nam	1969-10-08	male	Kinh (Việt)	2767	primary	Không	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	200571101	Lao động giản đơn	09020101
48647	Nguyễn Thụy Phương Như	1989-12-25	female	Kinh (Việt)	2768	secondary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	205557901	Lao động giản đơn	09020102
48648	Nguyễn Minh Toàn	2008-11-15	male	Kinh (Việt)	2768	primary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09020102
48649	Cao Xuân Sơn	1998-05-14	male	Kinh (Việt)	2768		Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	202902601	Nhân viên trợ lý văn phòng	09020102
48650	Nguyễn Võ Nam Khánh	2007-12-05	male	Kinh (Việt)	2768	primary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020102
48651	Phan Tuấn Kiệt	2004-01-03	male	Kinh (Việt)	2768	primary	Minh Sư đạo	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	206392701	Nhà chuyên môn bậc cao (đại học trở lên)	09020102
48652	Lương Việt Anh Thư	1976-11-04	female	Lào	2768		Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	200433701	Lao động giản đơn	09020102
48653	Đặng Hoàng Anh Khôi	2006-05-12	male	Kinh (Việt)	2768	primary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020102
48654	Ngô Quốc Điền	1974-06-23	male	Kinh (Việt)	2768	secondary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	200684401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09020102
48655	Trương Hoàng Ngọc Minh Như	1958-12-23	female	Kinh (Việt)	2768	none	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	204709301	Tự do	09020102
48656	Huỳnh Nguyễn Minh Thư	1994-11-12	female	Kinh (Việt)	2768	primary	Baha'I	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	205368801	Lao động giản đơn	09020102
48657	Trương Gia Bình	1988-10-09	female	Kinh (Việt)	2768	none	Bà-la-môn giáo	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	206283501	Lao động giản đơn	09020102
48658	Trương Phương Trâm	2011-11-12	female	Kinh (Việt)	2768	primary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09020102
48659	Nguyễn Võ Yến Linh	2009-05-29	female	Kinh (Việt)	2768	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020102
48660	Hoàng Thị Quỳnh Dung	2013-01-27	female	Kinh (Việt)	2768	None	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020102
48661	Trần Thảo Hiền	1976-12-24	female	Kinh (Việt)	2768		Tin lành	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	202815801	Nhân viên trợ lý văn phòng	09020102
48662	Võ Nguyễn Bình An	1990-09-16	male	La Chí	2768	high	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	200503901	Lao động thủ công và các nghề nghiệp có liên quan khác	09020102
48663	Hà Mỹ Tâm	1980-04-16	female	Kinh (Việt)	2768	secondary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	208377001	Thợ lắp ráp và vận hành máy móc, thiết bị	09020102
48664	Lê Thị Đoan Trang	1960-01-16	female	Kinh (Việt)	2768	high	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	203839501	Lao động giản đơn	09020102
48665	Võ Anh Kiệt	1961-01-12	male	Thái	2768	primary	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	202319801	Lao động giản đơn	09020102
48666	Lê Thanh Vân	1977-06-23	female	Kinh (Việt)	2768	university	Không	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Mường Chiên Huyện Quỳnh Nhai Tỉnh Sơn La	202958001	Nhà chuyên môn bậc cao (đại học trở lên)	09020102
48667	Hoàng Quốc Việt	1996-04-24	male	Kinh (Việt)	2770	secondary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	202408501	Lao động giản đơn	09020201
48668	Lê Nguyễn Kim Ngân	1973-03-07	female	Kinh (Việt)	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	203479801	Nhân viên trợ lý văn phòng	09020201
48669	Lê Thanh Sang	1971-02-11	male	Kinh (Việt)	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	206155301	Lao động thủ công và các nghề nghiệp có liên quan khác	09020201
48670	Huỳnh Tấn Đạt	2007-01-11	male	Kinh (Việt)	2770	primary	Cao đài	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Nhân viên trợ lý văn phòng	09020201
48671	Bành Tuyên Phước	1974-06-17	female	Kinh (Việt)	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	203051101	Lao động thủ công và các nghề nghiệp có liên quan khác	09020201
48672	Nguyễn Nhật Hào	2015-10-04	male	Kinh (Việt)	2770	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09020201
48673	Lê Ngọc Quỳnh Anh	1966-02-12	female	Kinh (Việt)	2770	secondary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	204184601	Nhân viên dịch vụ và bán hàng	09020201
48674	Nguyễn Trường Sơn	1968-10-30	male	Kinh (Việt)	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	205873501	Lao động giản đơn	09020201
48675	Đoàn Khương Duy	1988-01-30	male	Kinh (Việt)	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	200069701	Lao động giản đơn	09020201
48676	Trần Thiện Minh Khoa	2013-04-01	male	Kinh (Việt)	2770	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020201
48677	Võ Thị Cẩm Di	2014-09-22	female	Kinh (Việt)	2770	None	Cao đài	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020201
48678	Nguyễn Lan Vy	2021-11-24	female	Kinh (Việt)	2770	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020201
48679	Nguyễn Văn Diệp	2002-08-03	male	Kinh (Việt)	2770		Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	206673801	Lao động giản đơn	09020201
48680	Phan Chí Tường	2005-07-11	male	Kinh (Việt)	2770	primary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	208668701	Thợ lắp ráp và vận hành máy móc, thiết bị	09020201
48681	Nguyễn Lâm Lam Nguyên	1933-08-29	female	Kinh (Việt)	2770	none	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	200094101	Nhân viên dịch vụ và bán hàng	09020201
48682	Nguyễn Trần Việt Quốc	1988-11-05	male	Thái	2770	primary	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	202050001	Nhân viên trợ lý văn phòng	09020201
48683	Hy Phương Thi	1980-12-23	female	Kinh (Việt)	2770	high	Baha'I	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	208463501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09020201
48684	Trần Ngọc Như	2018-11-21	female	Thái	2770	None	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lực lượng vũ trang	09020201
48685	Võ Thanh Ngân	2016-01-21	female	Kinh (Việt)	2770	None	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Tự do	09020201
48686	Trần Vân Anh	1965-05-24	female	Kinh (Việt)	2770	none	Không	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	201522401	Lao động thủ công và các nghề nghiệp có liên quan khác	09020201
48687	Nguyễn Hồ Thảo Vy	2008-09-18	female	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020202
48688	Nguyễn Tấn Mạnh	2018-10-02	male	Kinh (Việt)	2771	None	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Nhân viên trợ lý văn phòng	09020202
48689	Nguyễn Quốc Thắng	1961-03-06	male	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	203989301	Lực lượng vũ trang	09020202
48690	Đỗ Phương Uyên	1966-03-22	female	Phù Lá	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	207368901	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09020202
48691	Đậu Thanh Anh Khoa	1994-02-01	male	Kinh (Việt)	2771	university	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	204380701	Lao động giản đơn	09020202
48692	Văn Quốc Thái	2011-09-21	male	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020202
48693	Nguyễn Thúy Ngân	1992-07-28	female	Tày	2771	secondary	Cao đài	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	200997501	Tự do	09020202
48694	Đỗ Huy Vinh	1982-08-24	male	Kinh (Việt)	2771	high	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	207310501	Lao động giản đơn	09020202
48695	Trần Thị Tuyết Ngân	2021-11-06	female	Kinh (Việt)	2771	None	Tin lành	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020202
48696	Lê Thị Minh Thư	1979-09-24	female	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	203306401	Nhân viên dịch vụ và bán hàng	09020202
48697	Trần Khánh Hưng	1943-11-13	male	Ra-glai	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	206505601	Nhà chuyên môn bậc cao (đại học trở lên)	09020202
48698	Trần Kiến Khôn	1997-04-10	male	Kinh (Việt)	2771	primary	Bửu Sơn Kỳ Hương	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	200626501	Lao động giản đơn	09020202
48699	Nguyễn Thị Đoan Trang	1993-11-13	female	Kinh (Việt)	2771	university	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	205055201	Lao động giản đơn	09020202
48700	Võ Trường An	1959-01-27	male	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	203707801	Nhân viên trợ lý văn phòng	09020202
48701	Tạ Mỹ Phụng	1963-11-09	female	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	201925301	Tự do	09020202
48702	Nguyễn Đăng Thanh Danh	1979-12-13	male	Kinh (Việt)	2771	none	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	201640101	Lực lượng vũ trang	09020202
48703	Võ Nam Đăng	1982-09-22	male	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	200456801	Lao động giản đơn	09020202
48704	Dương Thảo Nguyên	2004-04-04	female	Kinh (Việt)	2771	secondary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	205167201	Nhân viên trợ lý văn phòng	09020202
48705	Lê Hoàng Nam	1989-04-17	male	Kinh (Việt)	2771	primary	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	201902201	Lao động thủ công và các nghề nghiệp có liên quan khác	09020202
48706	Nguyễn Đức Đạt	2013-01-31	male	Kinh (Việt)	2771	None	Không	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Cà Nàng Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020202
48707	Huang Hùng Thái	1994-08-23	male	Kinh (Việt)	2773	secondary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	205211701	Lao động giản đơn	09020301
48708	Đỗ Lê Hồng Ngọc	2020-01-14	female	Kinh (Việt)	2773	None	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020301
48709	Trịnh Thiên Khải	1976-02-16	male	Kinh (Việt)	2773		Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	200699401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020301
48710	Huỳnh Thiên Hương	2020-02-08	female	Kinh (Việt)	2773	None	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020301
48711	Trần Trung Hiếu	1969-07-04	male	Kinh (Việt)	2773	none	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	207117501	Nhà chuyên môn bậc cao (đại học trở lên)	09020301
48712	Trương Thị Hồng Vân	1992-05-06	female	Kinh (Việt)	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	208505101	Nhà chuyên môn bậc cao (đại học trở lên)	09020301
48713	Võ Quang Linh	2005-04-02	male	Kinh (Việt)	2773	primary	Cao đài	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	208099901	Lực lượng vũ trang	09020301
48714	Dương Thị Thanh Ngân	1994-09-15	female	Mường	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	208004401	Lao động giản đơn	09020301
48715	Trần Trường Thịnh	1969-09-03	male	Kinh (Việt)	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	206183001	Lao động giản đơn	09020301
48716	Đặng Yến Như	1999-04-05	female	Kinh (Việt)	2773		Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203362301	Nhân viên trợ lý văn phòng	09020301
48717	Ngô Nguyễn Hoàng Vy	1964-07-09	female	Kinh (Việt)	2773	none	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	201688501	Lao động giản đơn	09020301
48718	Lê Tấn Công Minh	1985-10-28	male	Kinh (Việt)	2773	none	Baha'I	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	206558401	Thợ lắp ráp và vận hành máy móc, thiết bị	09020301
48719	Nguyễn Thị Tú Chi	2006-06-13	female	Kinh (Việt)	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020301
48720	Nguyễn Trần Gia Huy	1960-09-13	male	Chứt	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	201984601	Lao động giản đơn	09020301
48721	Đoàn Ngọc Khánh Vy	1987-06-10	female	Kinh (Việt)	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	200060501	Lao động giản đơn	09020301
48722	Trương Công Trực	1985-10-17	male	Kinh (Việt)	2773	none	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	207833601	Lao động giản đơn	09020301
48723	Phạm Thị Quỳnh Châu	1980-04-20	female	Kinh (Việt)	2773	secondary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	204294901	Lao động giản đơn	09020301
48724	Nguyễn Sỹ Hoàng Anh	2015-07-13	male	Kinh (Việt)	2773	None	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020301
48725	Lê Hoàng Dung	1965-10-14	female	Kinh (Việt)	2773	primary	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	205732201	Nhân viên trợ lý văn phòng	09020301
48726	Lưu Hoàng Long	1981-07-07	male	Kinh (Việt)	2773	university	Không	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 1 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203104801	Lao động giản đơn	09020301
48727	Lê Anh Mỹ	1969-08-16	male	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203223001	Lao động giản đơn	09020302
48728	Nguyễn Đức Minh Thành	2019-02-07	male	Thái	2774	None	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48729	Nguyễn Khắc Minh Tân	2004-10-05	male	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203493901	Lao động giản đơn	09020302
48730	Võ Minh Đức	2002-01-14	male	Kinh (Việt)	2774		Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	204314701	Lao động giản đơn	09020302
48731	Võ Thị Bảo Ngọc	1993-02-07	female	Hoa (Hán)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203969901	Lực lượng vũ trang	09020302
48732	Đỗ Ngọc Phương Khoa	2011-01-29	female	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09020302
48733	Phan Thị Minh Quyên	1965-11-30	female	Kinh (Việt)	2774	none	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	206259301	Lao động giản đơn	09020302
48734	Nguyễn Đăng Khoa	2000-09-10	male	Kinh (Việt)	2774		Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	200302601	Lao động giản đơn	09020302
48735	Võ Yến Nhi	2020-04-24	female	Kinh (Việt)	2774	None	Hồi giáo	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48736	Nguyễn Xuân Nhi	2003-10-31	female	Kinh (Việt)	2774	primary	Minh Sư đạo	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	205172301	Lao động giản đơn	09020302
48737	Trần Hiếu Đoan	2010-03-18	female	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09020302
48738	Đồng Lê Hồng Ngọc	2021-09-06	female	Kinh (Việt)	2774	None	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48739	Trần Gia Hưng	2007-11-20	male	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48740	Dương Công Thiên	2012-01-26	male	Kinh (Việt)	2774	None	Minh Sư đạo	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Tự do	09020302
48741	Trần Đỗ Quỳnh Như	2008-04-25	female	Kinh (Việt)	2774	primary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48742	Nguyễn Đông Thức	1967-05-16	male	Kinh (Việt)	2774	secondary	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	206838501	Nhân viên trợ lý văn phòng	09020302
48743	Trần Gia Huệ	2005-09-14	female	Kinh (Việt)	2774	primary	Công giáo	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	205751901	Lao động giản đơn	09020302
48744	Võ Thị Hoài Thương	2000-10-21	female	Lô lô	2774		Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	203188701	Lao động giản đơn	09020302
48745	Trịnh Huy Phúc	1999-11-11	male	Kinh (Việt)	2774		Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	205896101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09020302
48746	Thành Thu Lan	2012-03-09	female	Kinh (Việt)	2774	None	Không	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La	Thôn 2 Xã Chiềng Khay Huyện Quỳnh Nhai Tỉnh Sơn La		Lao động giản đơn	09020302
48747	Hồ Thị Mỹ Linh	1996-09-30	female	Kinh (Việt)	2777	high	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	205786701	Tự do	09030101
48748	Khổng Thúy Vy	1968-10-31	female	Thái	2777	none	Bà-la-môn giáo	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206822701	Lao động giản đơn	09030101
48749	Trần Trọng Gia Vinh	2018-05-26	male	Kinh (Việt)	2777	None	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09030101
48750	Đoàn Quốc Bảo	1966-05-13	male	Kinh (Việt)	2777	high	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	201962501	Lao động giản đơn	09030101
48751	Vũ Lê Anh Thư	1980-09-16	female	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206838201	Thợ lắp ráp và vận hành máy móc, thiết bị	09030101
48752	Võ Thanh Phong	2010-09-14	male	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Nhân viên dịch vụ và bán hàng	09030101
48753	Nguyễn Thị Thanh Ngân	2009-04-18	female	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09030101
48754	Đổ Gia Hân	1965-05-04	female	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	200855001	Nhà chuyên môn bậc cao (đại học trở lên)	09030101
48755	Võ Nguyễn Quốc Phú	1982-06-08	male	Kinh (Việt)	2777	none	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	208711901	Lao động giản đơn	09030101
48756	Trương Đan Huy	2002-09-05	male	Kinh (Việt)	2777		Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206950501	Lao động giản đơn	09030101
48757	Nguyễn Nhật Tân	1932-01-01	male	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	207040101	Nhân viên dịch vụ và bán hàng	09030101
48758	Lê Phúc Ánh	1992-11-05	male	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	204286401	Lao động giản đơn	09030101
48759	Nguyễn Huỳnh Mai An	1971-05-14	female	Kinh (Việt)	2777	secondary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	208510701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09030101
48760	Nguyễn Ngọc Gia Hân	1989-11-07	female	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	207115901	Nhân viên trợ lý văn phòng	09030101
48761	Nguyễn Huỳnh Minh Anh	1989-02-24	female	Kinh (Việt)	2777	high	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	208146101	Tự do	09030101
48762	Huỳnh Ngọc Phương Nhi	1974-12-12	female	Kinh (Việt)	2777	none	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	200205601	Nhân viên trợ lý văn phòng	09030101
48763	Lê Võ Hoàng Kha	1959-11-12	male	Kinh (Việt)	2777	none	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	203601401	Thợ lắp ráp và vận hành máy móc, thiết bị	09030101
48764	Nguyễn Thành Phương	2018-08-11	male	Kinh (Việt)	2777	None	Phật giáo Hòa Hảo	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09030101
48765	Phan Thị Ngọc Trâm	1991-08-23	female	Pà Thẻn	2777		Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	204901901	Lao động giản đơn	09030101
48766	Nguyễn Thị Mỹ Tiên	1969-08-03	female	Kinh (Việt)	2777	primary	Không	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206818901	Lao động giản đơn	09030101
48767	Lưu Quán Hanh	1992-07-19	male	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	202081801	Nhân viên trợ lý văn phòng	09030102
48768	Nguyễn Vũ Anh Thư	2021-10-09	female	Kinh (Việt)	2778	None	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Tự do	09030102
48769	Võ Hoàng Đăng Khoa	2006-12-04	male	Tày	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030102
48770	Tô Quốc Tuấn Anh	2008-10-06	male	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09030102
48771	Lê Thị Yến Nhi	1983-07-24	female	Kinh (Việt)	2778	high	Bà-la-môn giáo	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	203770701	Lao động giản đơn	09030102
48772	Lê Công Thuận	1999-11-18	male	Kinh (Việt)	2778		Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	202501501	Lao động giản đơn	09030102
48773	Lê Minh Vệ	2015-05-11	male	Kinh (Việt)	2778	None	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030102
48774	Ngô Thị Thanh Ngân	2000-08-13	female	Kinh (Việt)	2778		Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	201597101	Tự do	09030102
48775	Bạch Phan Hữu Thành	1969-06-15	male	Kinh (Việt)	2778	high	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	202776601	Lao động giản đơn	09030102
48776	Vũ Khánh Huyền	1944-02-05	female	Kinh (Việt)	2778	none	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	202198401	Tự do	09030102
48777	Nguyễn Tấn Thành	1981-12-24	male	Kinh (Việt)	2778	high	Bửu Sơn Kỳ Hương	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206163901	Lao động giản đơn	09030102
48778	Nguyễn Thanh Xuân	1965-09-04	female	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	203016601	Lao động giản đơn	09030102
48779	Nguyễn Hoàng Trang	1990-10-03	female	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	203634001	Lao động giản đơn	09030102
48780	Nguyễn Tấn Tài	2005-02-26	male	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	208852001	Lao động thủ công và các nghề nghiệp có liên quan khác	09030102
48781	Nguyễn Phạm Ái Liên	1973-08-07	female	Kinh (Việt)	2778	primary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	207535701	Lao động giản đơn	09030102
48782	Cao Hoàng Dung	1989-06-25	female	Kinh (Việt)	2778	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	200517101	Thợ lắp ráp và vận hành máy móc, thiết bị	09030102
48783	Nguyễn Hồ Thảo My	1969-11-20	female	Kinh (Việt)	2778	secondary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	201062801	Lao động giản đơn	09030102
48784	Phạm Minh Khoa	2012-02-23	male	Kinh (Việt)	2778	None	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La		Nhân viên trợ lý văn phòng	09030102
48785	Hoàng Đặng Thiên Ý	1989-11-28	female	Kinh (Việt)	2778	primary	Phật giáo Hòa Hảo	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	208730201	Lao động giản đơn	09030102
48786	Lê Quỳnh Như	1995-10-02	female	Kinh (Việt)	2778	secondary	Không	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Thị trấn Thuận Châu Huyện Thuận Châu Tỉnh Sơn La	206607301	Nhân viên dịch vụ và bán hàng	09030102
48787	Trần Thị Ngọc Mai	1968-11-12	female	Kinh (Việt)	2780	none	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	202743501	Lao động giản đơn	09030201
48788	Nguyễn Võ Hồng Ngọc	2002-11-14	female	Thái	2780		Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	204700401	Lao động giản đơn	09030201
48789	Hà Chung Bích Ngọc	1970-01-18	female	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	207553301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09030201
48790	Lê Thành Phát	1966-12-11	male	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208604901	Lao động giản đơn	09030201
48791	Trần Hoàng Long	2018-03-07	male	Kinh (Việt)	2780	None	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030201
48792	Trần Thủy Tú Anh	1976-04-03	female	Kinh (Việt)	2780		Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	206466901	Lao động giản đơn	09030201
48793	Phan Hoàng Đông	1968-02-09	male	Kinh (Việt)	2780	none	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	202268101	Nhà chuyên môn bậc cao (đại học trở lên)	09030201
48794	Dương Minh Trọng	2001-01-11	male	Chăm (Chàm)	2780		Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	200713601	Lao động giản đơn	09030201
48795	Phan Ngọc Đoan Thư	2017-02-20	female	Mạ	2780	None	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030201
48796	Nguyễn Minh Phương Uyên	1999-06-15	female	Kinh (Việt)	2780		Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	206172001	Lực lượng vũ trang	09030201
48797	Lê Nguyễn Thúy Vi	2010-07-20	female	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030201
48798	Mai Trúc Phương	2008-10-13	female	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030201
48799	Giang Tiểu Thanh	2017-09-02	female	Gié-Triêng	2780	None	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030201
48800	Nguyễn Đức Quang	1994-12-09	male	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208483701	Nhân viên dịch vụ và bán hàng	09030201
48801	Bành Kim Nhân	2020-01-04	male	Kinh (Việt)	2780	None	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Nhân viên trợ lý văn phòng	09030201
48802	Phù Thị Phương Trang	2014-03-05	female	Kinh (Việt)	2780	None	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030201
48803	Nguyễn Mạnh Hùng Cường	1986-05-30	male	Kinh (Việt)	2780	none	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	205086501	Lực lượng vũ trang	09030201
48804	Trương Huy Hoàng	2009-02-24	male	Kinh (Việt)	2780	primary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Tự do	09030201
48805	Nguyễn Đức Quang	2005-07-05	male	Kinh (Việt)	2780	secondary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	201006601	Lao động giản đơn	09030201
48806	Phạm Lê Thanh Trúc	1994-07-06	female	Kinh (Việt)	2780	secondary	Không	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	205382501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030201
48807	Lương Hải Ngọc	2013-10-28	female	Kinh (Việt)	2781	None	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09030202
48808	Nguyễn Quỳnh Yên	1999-04-12	female	Kinh (Việt)	2781		Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	206457401	Lao động giản đơn	09030202
48809	Trương Ngọc Phương Nguyên	2016-09-28	female	Kinh (Việt)	2781	None	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030202
48810	Trần Hạnh Nguyên	1946-12-28	female	Kinh (Việt)	2781	none	Phật giáo Hòa Hảo	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208262801	Lao động thủ công và các nghề nghiệp có liên quan khác	09030202
48811	Trần Vũ Đăng Khoa	1971-06-26	male	Khơ-me	2781	secondary	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	205136501	Lao động giản đơn	09030202
48812	Võ Ngọc Xuân Mai	1975-05-01	female	Kinh (Việt)	2781	primary	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	206556401	Nhân viên trợ lý văn phòng	09030202
48813	Phạm Minh Quang	2019-06-29	male	Kinh (Việt)	2781	None	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Thợ lắp ráp và vận hành máy móc, thiết bị	09030202
48814	Trần Thị Thiên An	1958-08-23	female	Kinh (Việt)	2781	none	Công giáo	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208318501	Thợ lắp ráp và vận hành máy móc, thiết bị	09030202
48815	Đặng Kim Trang	2016-06-24	female	Kinh (Việt)	2781	None	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09030202
48816	Tô Gia Hy	1999-07-10	male	Kinh (Việt)	2781		Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	202010401	Lao động giản đơn	09030202
48817	Nguyễn Nhị Anh Thy	2011-03-11	female	Kinh (Việt)	2781	primary	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030202
48818	Trần Lê Quốc Anh	1964-01-15	male	Kinh (Việt)	2781	secondary	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	205672201	Lao động giản đơn	09030202
48819	Lâm Bảo San	2000-02-11	female	Kinh (Việt)	2781		Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	200648101	Thợ lắp ráp và vận hành máy móc, thiết bị	09030202
48820	Nguyễn Thị Hoài Thương	1971-01-03	female	Kinh (Việt)	2781	secondary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208857101	Lao động giản đơn	09030202
48821	Nguyễn Huỳnh Phúc Lâm	1999-10-05	male	Kinh (Việt)	2781		Công giáo	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	202631901	Lao động giản đơn	09030202
48822	Huỳnh Nhật Trường	1980-09-24	male	Mường	2781	high	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	208085601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030202
48823	Huỳnh Thanh Thủy	2000-08-04	female	Kinh (Việt)	2781		Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	205949901	Lao động giản đơn	09030202
48824	Võ Trần Bích Ngọc	1964-09-02	female	Kinh (Việt)	2781	primary	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	204082601	Lao động thủ công và các nghề nghiệp có liên quan khác	09030202
48825	Lý Thảo Vy	2002-08-29	female	Kinh (Việt)	2781		Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	203390301	Lao động giản đơn	09030202
48826	Lâm Nhật Minh	2015-10-22	male	Kinh (Việt)	2781	None	Không	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Phổng Lái Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030202
48827	Nguyễn Lâm	2020-12-06	male	Kinh (Việt)	2783	None	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09030301
48828	Nguyễn Kim Ngân	1961-02-09	female	Pu Péo	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202336801	Lao động giản đơn	09030301
48829	Nguyễn Ngọc Phương Trang	1982-09-30	female	Kinh (Việt)	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	205497801	Lao động giản đơn	09030301
48830	Ngô Tấn Đạt	1931-09-15	male	Kinh (Việt)	2783	secondary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202266401	Lao động giản đơn	09030301
48831	Mai Nguyễn Thanh Thảo	2009-07-10	female	Kinh (Việt)	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030301
48832	Lê Thị Bích Loan	2010-01-30	female	Kinh (Việt)	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09030301
48833	Trần Văn Long	1981-06-05	male	La Hủ	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	208582301	Nhân viên dịch vụ và bán hàng	09030301
48834	Nguyễn Hồng Trí	1980-07-25	male	Gié-Triêng	2783	primary	Minh Sư đạo	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202507701	Nhà chuyên môn bậc cao (đại học trở lên)	09030301
48835	Hoàng Thị Tuyết Mai	1995-10-12	female	Ra-glai	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	207428401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09030301
48836	Lã Gia Hân	1984-12-19	female	Kinh (Việt)	2783	high	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	207698001	Lao động giản đơn	09030301
48837	Trần Xuân Nhi	1941-05-26	female	Kinh (Việt)	2783	none	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202438101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030301
48838	Nguyễn Hoàng Sơn	1985-08-11	male	Kinh (Việt)	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202053101	Lao động giản đơn	09030301
48839	Phan Ngọc Thư	1960-09-29	female	Thổ	2783	primary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	201990201	Lao động giản đơn	09030301
48840	Lê Đức Huy	1968-07-04	male	Kinh (Việt)	2783	high	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202943601	Lao động giản đơn	09030301
48841	Chế Anh Kiệt	1998-06-16	male	Kinh (Việt)	2783		Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	203957201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09030301
48842	Trịnh Đỗ Bảo Châu	1999-12-25	female	Kinh (Việt)	2783		Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202380601	Lao động giản đơn	09030301
48843	Hoàng Minh Anh	2008-10-28	male	Kinh (Việt)	2783	primary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030301
48844	Nguyễn Trần Bảo Duy	1964-03-03	male	Kinh (Việt)	2783	secondary	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202803801	Lao động giản đơn	09030301
48845	Nguyễn Thu Phương	1987-07-08	female	Kinh (Việt)	2783	high	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	206796501	Lao động giản đơn	09030301
48846	Dương Thanh Bình	2015-06-26	male	Kinh (Việt)	2783	None	Không	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 1 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc cao (đại học trở lên)	09030301
48847	Nguyễn Vy Ngọc Ánh	2020-06-02	female	Tày	2784	None	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	09030302
48848	Nguyễn Anh Đức	2007-10-01	male	Kinh (Việt)	2784	primary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động thủ công và các nghề nghiệp có liên quan khác	09030302
48849	Hà Quỳnh Anh	1978-02-03	female	Kinh (Việt)	2784	primary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	206007401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	09030302
48850	Trần Duy Trường	2001-01-10	male	Kinh (Việt)	2784		Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202509901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030302
48851	Nguyễn Văn Huy	2006-04-03	male	Bố Y	2784	primary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48852	Trần Thành Nam	1972-05-08	male	Kinh (Việt)	2784	secondary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	206754701	Lao động giản đơn	09030302
48853	Lê Minh Nhật	2016-12-22	male	Tày	2784	None	Hồi giáo	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48854	Trần Gia Khang	2009-02-08	male	Kinh (Việt)	2784	primary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48855	Ngô Gia Bảo	2002-10-05	male	Kinh (Việt)	2784		Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	204914701	Lao động thủ công và các nghề nghiệp có liên quan khác	09030302
48856	Nguyễn Đắc Tấn Đạt	1978-05-10	male	Gié-Triêng	2784	none	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202806301	Lao động giản đơn	09030302
48857	Tạ Huỳnh Anh Kiệt	2013-08-01	male	Kinh (Việt)	2784	None	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Tự do	09030302
48858	Nguyễn Thanh Tâm	1975-04-27	male	Kinh (Việt)	2784	none	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	201388901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	09030302
48859	Nguyễn Trần Quế Hương	2017-06-04	female	Kinh (Việt)	2784	None	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48860	Nguyễn Hoàng Tuấn	1993-08-17	male	Kinh (Việt)	2784	secondary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	205565601	Lao động giản đơn	09030302
48861	Võ Minh Như	2018-08-23	female	Kinh (Việt)	2784	None	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48862	Chu Thị Chinh	2000-04-04	female	Kinh (Việt)	2784		Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	203915401	Lao động giản đơn	09030302
48863	Nguyễn Cao Thái	2002-04-01	male	Kinh (Việt)	2784		Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	200372301	Tự do	09030302
48864	Quách Minh Trí	2019-12-18	male	Kinh (Việt)	2784	None	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Lao động giản đơn	09030302
48865	Huỳnh Thị Thanh Hoà	2006-03-19	female	Kinh (Việt)	2784	primary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La		Thợ lắp ráp và vận hành máy móc, thiết bị	09030302
48866	Nguyễn Viết Thắng	1965-01-30	male	Co	2784	secondary	Không	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	Thôn 2 Xã Mường é Huyện Thuận Châu Tỉnh Sơn La	202367801	Lực lượng vũ trang	09030302
48867	Qúach Tuấn Kiệt	2000-11-24	male	Kinh (Việt)	2788		Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201171901	Lao động giản đơn	10010101
48868	Vũ Quốc Huy	1975-02-16	male	Kinh (Việt)	2788	none	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201985401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10010101
48869	Lưu Tuyền Hiếu	1970-05-17	male	Chăm (Chàm)	2788	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201840201	Lao động giản đơn	10010101
48870	Trần Thái Duy Khang	1993-08-16	male	Kinh (Việt)	2788	primary	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	203209601	Nhà chuyên môn bậc cao (đại học trở lên)	10010101
48871	Ngô Hồ Minh Thư	2017-04-14	female	Kinh (Việt)	2788	None	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10010101
48872	Nguyễn Lê Ngọc Trang	2018-04-02	female	Kinh (Việt)	2788	None	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010101
48873	Nguyễn Thành Lộc	1994-06-09	male	Kinh (Việt)	2788	secondary	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	207999501	Nhà chuyên môn bậc cao (đại học trở lên)	10010101
48874	Lê Thị Thùy Trang	1946-06-09	female	Kinh (Việt)	2788	high	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	203938901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10010101
48875	Nguyễn Bích Nhi	1968-01-27	female	Kinh (Việt)	2788	none	Phật giáo Hòa Hảo	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	200205901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010101
48876	Trần Bùi Anh Thy	1973-12-22	female	Kinh (Việt)	2788	none	Hồi giáo	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	202828401	Lao động giản đơn	10010101
48877	Phạm Trần Kim Thư	1961-01-26	female	Kinh (Việt)	2788	none	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	202607001	Nhân viên dịch vụ và bán hàng	10010101
48878	Trần Huỳnh Đức Tài	1985-03-07	male	Kinh (Việt)	2788	none	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201551601	Lực lượng vũ trang	10010101
48879	Nguyễn Chí Hiếu	2002-07-09	male	Ra-glai	2788		Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	205725701	Tự do	10010101
48880	Trần Đức Long	2012-05-25	male	Kinh (Việt)	2788	None	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010101
48881	Ngô Quang Nghĩa	2017-11-10	male	Kinh (Việt)	2788	None	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010101
48882	Lê Đăng Khoa	1979-11-24	male	Kinh (Việt)	2788	primary	Phật giáo	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	208247601	Lực lượng vũ trang	10010101
48883	Lâm Thịnh	2017-07-28	male	Kinh (Việt)	2788	None	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010101
48884	Hoàng Nhật Linh	1983-08-04	female	Kinh (Việt)	2788	none	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	203474201	Lao động giản đơn	10010101
48885	Lê Thị Ngọc Duyên	1972-09-11	female	Kinh (Việt)	2788	primary	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	205704901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10010101
48886	Ngô Huỳnh Khả Ái	1966-06-10	female	Kinh (Việt)	2788	primary	Không	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	208046301	Lao động giản đơn	10010101
48887	Sơn Minh Phúc	2018-08-31	male	Kinh (Việt)	2789	None	Hồi giáo	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010102
48888	Nguyễn Hữu Nhật Minh	2012-02-10	female	Kinh (Việt)	2789	None	Bà-la-môn giáo	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10010102
48889	Lê Anh Nhi	1975-06-30	female	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	202649201	Lao động giản đơn	10010102
48890	Lý Huỳnh Thành Đạt	2002-08-23	male	Cống	2789		Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201218701	Lao động giản đơn	10010102
48891	Lê Hoàng Quân	2012-09-04	male	Kinh (Việt)	2789	None	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010102
48892	Quan Ngô Khương Duy	2018-09-14	male	Kinh (Việt)	2789	None	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10010102
48893	Triệu Vy	1986-02-14	female	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	202007301	Lao động giản đơn	10010102
48894	Ninh Thị Thanh Hằng	1988-12-08	female	Kinh (Việt)	2789	high	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	207687601	Thợ lắp ráp và vận hành máy móc, thiết bị	10010102
48895	Nguyễn Hoàng Ngọc Yến	1966-08-17	female	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	201519901	Nhân viên trợ lý văn phòng	10010102
48896	Nguyễn Trọng Đăng Khoa	1989-04-14	male	Kinh (Việt)	2789	none	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	208805401	Lao động giản đơn	10010102
48897	Đỗ Nguyễn Gia Bảo	2007-10-28	male	Kinh (Việt)	2789	primary	Tin lành	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010102
48898	Nguyễn Đức Công Huy	1992-12-01	male	Kinh (Việt)	2789	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	205115101	Nhà chuyên môn bậc cao (đại học trở lên)	10010102
48899	Phan Huỳnh Quốc Kiệt	1959-11-07	male	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	206392601	Nhân viên dịch vụ và bán hàng	10010102
48900	Vũ Lê Huy	1925-10-01	male	La Chí	2789	none	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	208071801	Nhân viên dịch vụ và bán hàng	10010102
48901	Lương Hữu Lộc	1997-05-19	male	La Hủ	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	202481601	Lao động giản đơn	10010102
48902	Nguyễn Hoài Nam	2018-02-04	male	Tày	2789	None	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010102
48903	Nguyễn Đức Lộc	1935-02-10	male	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	207731901	Nhân viên trợ lý văn phòng	10010102
48904	Dương Tấn Thịnh	1996-03-08	male	Kinh (Việt)	2789	primary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	203058501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010102
48905	Nguyễn Đức Vượng	2004-07-21	male	Kinh (Việt)	2789	secondary	Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	208674901	Lao động giản đơn	10010102
48906	Nguyễn Hoàng Như Xuân	2000-10-15	female	Kinh (Việt)	2789		Không	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Thịnh Thành phố Yên Bái Tỉnh Yên Bái	207374301	Nhân viên trợ lý văn phòng	10010102
48907	Nguyễn Thành Nhân	1977-04-10	male	Kinh (Việt)	2791	none	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	201068101	Lao động giản đơn	10010201
48908	Quách Minh Hy	1963-07-23	male	Kinh (Việt)	2791	primary	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	205295101	Lao động giản đơn	10010201
48909	Nguyễn Thị Tuyết Trinh	1987-10-10	female	Kinh (Việt)	2791	primary	Mặc môn	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204946001	Lao động giản đơn	10010201
48910	Võ Thị Kim Xuyến	1993-08-11	female	Kinh (Việt)	2791	primary	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204181601	Nhân viên dịch vụ và bán hàng	10010201
48911	Lý Trung Đạt	2014-10-19	male	Kinh (Việt)	2791	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10010201
48912	Nguyễn Thị Thanh Trúc	1955-05-02	female	Kinh (Việt)	2791	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	203137201	Lao động giản đơn	10010201
48913	Nguyễn Hoàng Phương Linh	1998-10-11	female	Kinh (Việt)	2791		Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	205815801	Lao động giản đơn	10010201
48914	Lương Ngọc Phan	1949-05-17	female	Xtiêng	2791	primary	Cơ đốc Phục lâm	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	205856301	Lao động giản đơn	10010201
48915	Nguyễn Huy Thông	1995-03-08	male	Kinh (Việt)	2791	primary	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	201014401	Lao động giản đơn	10010201
48916	Võ Tấn Kiệt	1926-08-10	male	Kinh (Việt)	2791	none	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	201361701	Lao động giản đơn	10010201
48917	Đỗ Khánh Tường	2000-01-10	female	Kinh (Việt)	2791		Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	202002201	Lao động giản đơn	10010201
48918	Lầm Phi Hùng	1947-08-29	male	Kinh (Việt)	2791	none	Phật giáo	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	201332601	Lao động giản đơn	10010201
48919	Trần Văn Chương	2012-07-11	male	Pà Thẻn	2791	None	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010201
48920	Lương Ngọc Thắng	2019-10-23	male	Kinh (Việt)	2791	None	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010201
48921	Nguyễn Thị Vân Anh	2016-11-24	female	Kinh (Việt)	2791	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010201
48922	Diệp Tài	1980-07-16	male	Kinh (Việt)	2791	university	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204994201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10010201
48923	Đỗ Thị Minh Tú	1973-01-17	female	Kinh (Việt)	2791	high	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204948301	Lao động thủ công và các nghề nghiệp có liên quan khác	10010201
48924	Nguyễn Phương Dung	2013-02-18	female	Kinh (Việt)	2791	None	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10010201
48925	Nguyễn Tiến Dũng	1967-01-17	male	Kinh (Việt)	2791	primary	Không	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	202683001	Thợ lắp ráp và vận hành máy móc, thiết bị	10010201
48926	Lê Khánh Quỳnh	2017-01-07	female	Kinh (Việt)	2791	None	Hồi giáo	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010201
48927	Bùi Thị Hoàng Anh	1983-09-23	female	Co	2792	secondary	Tin lành	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	206358101	Lao động thủ công và các nghề nghiệp có liên quan khác	10010202
48928	Đào Thanh Phương	1993-02-01	female	Kinh (Việt)	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	207286501	Nhân viên trợ lý văn phòng	10010202
48929	Hồ Tuấn Kiệt	2018-10-03	male	Kinh (Việt)	2792	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010202
48930	Bùi Lê Phương Thảo	1937-03-24	female	Kinh (Việt)	2792	none	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204603401	Nhân viên dịch vụ và bán hàng	10010202
48931	Phan Minh Nhi	2013-06-28	female	Brâu	2792	None	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lực lượng vũ trang	10010202
48932	Hồ Gia Bảo	2006-08-26	male	Kinh (Việt)	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010202
48933	Võ Hoàng Diễm Tú	1999-09-30	female	Hà nhì	2792		Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	203198901	Lực lượng vũ trang	10010202
48934	Nguyễn Minh Trí	2019-02-26	male	Kinh (Việt)	2792	None	Cao đài	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10010202
48935	Nguyễn Vũ Hoàng Đông	1962-01-10	male	Chu-ru	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	205540001	Lực lượng vũ trang	10010202
48936	Đoàn Thị Thảo Nguyên	1988-07-24	female	Kinh (Việt)	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	206772201	Lao động giản đơn	10010202
48937	Lê Khánh Long	2019-09-15	male	Kinh (Việt)	2792	None	Hồi giáo	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010202
48938	Giang Bảo Nhi	2004-02-01	female	Kinh (Việt)	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	206128901	Lực lượng vũ trang	10010202
48939	Trần Khánh Nam	2010-10-26	male	Kinh (Việt)	2792	primary	Tin lành	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010202
48940	Nguyễn Linh Chi	2000-02-14	female	Kinh (Việt)	2792		Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	204500701	Lao động giản đơn	10010202
48941	Viên Tuấn Thành	2008-06-15	male	Thái	2792	primary	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10010202
48942	Lê Đức Tú	2018-03-27	male	Tày	2792	None	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Nhân viên trợ lý văn phòng	10010202
48943	Lý Kim Thanh	2000-02-04	female	La Ha	2792		Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	206179001	Lao động giản đơn	10010202
48944	Dương Thúy Ngân	1990-10-29	female	La Chí	2792	none	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	203348201	Nhà chuyên môn bậc cao (đại học trở lên)	10010202
48945	Trần Phạm Thảo Vy	1970-05-09	female	Kinh (Việt)	2792	none	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	208420801	Nhà chuyên môn bậc cao (đại học trở lên)	10010202
48946	Đinh Thị Cẩm Tiên	2012-12-18	female	Kinh (Việt)	2792	None	Không	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Yên Ninh Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010202
48947	Lâm Phương Quyên	2011-12-29	female	Kinh (Việt)	2794	primary	Hồi giáo	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010301
48948	Nguyễn Phan Thanh Phước	1983-10-17	male	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	207574701	Lực lượng vũ trang	10010301
48949	Huỳnh Mai Anh Kiệt	2005-04-01	male	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	204018601	Lao động giản đơn	10010301
48950	Trương Lê Hoàng Vũ	1935-01-10	male	Kinh (Việt)	2794	high	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	202409901	Thợ lắp ráp và vận hành máy móc, thiết bị	10010301
48951	Lê Huỳnh Trúc Mai	1976-10-24	female	Kinh (Việt)	2794		Baha'I	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	206308701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10010301
48952	Nguyễn Trí Vỹ	1994-07-06	male	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	202007501	Nhân viên trợ lý văn phòng	10010301
48953	Nguyễn Thành Tài	1968-11-14	male	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	203377701	Lao động thủ công và các nghề nghiệp có liên quan khác	10010301
48954	Bùi Huy Thắng	1987-06-13	male	Kinh (Việt)	2794	high	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	203566001	Lao động giản đơn	10010301
48955	Huỳnh Bảo Thiên	1980-02-11	male	Kinh (Việt)	2794	none	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	205342001	Lao động giản đơn	10010301
48956	Trần Chí Hồng	2012-10-23	male	Kinh (Việt)	2794	None	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10010301
48957	Vũ Ngọc Châu Nhi	2012-01-09	female	Tày	2794	None	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010301
48958	Trần Thị Linh	1982-01-24	female	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	205554701	Lực lượng vũ trang	10010301
48959	Nguyễn Thị Thanh Thúy	1981-10-01	female	Tà-ôi	2794	secondary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	201948501	Lao động giản đơn	10010301
48960	Nguyễn Tiến Đức	1963-10-11	male	Kinh (Việt)	2794	high	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	208539301	Tự do	10010301
48961	Trần Võ Quốc Hoàng	2001-07-10	male	Kinh (Việt)	2794		Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	200693101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10010301
48962	Đỗ Xuân Tiến	1965-04-29	male	Kinh (Việt)	2794	secondary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	207614101	Lao động giản đơn	10010301
48963	Nguyễn Gia Linh	2009-10-26	female	Kinh (Việt)	2794	primary	Không	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010301
48964	Huỳnh Ngọc Phương Khanh	1959-01-10	female	Kinh (Việt)	2794	none	Hồi giáo	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	202012401	Lao động thủ công và các nghề nghiệp có liên quan khác	10010301
48965	Từ Ngọc Hương	1988-04-28	female	Kinh (Việt)	2794	high	Baha'I	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	200295001	Thợ lắp ráp và vận hành máy móc, thiết bị	10010301
48966	Lê Mỹ Linh Nhi	1985-09-11	female	Kinh (Việt)	2794	secondary	Phật giáo Hòa Hảo	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 1 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	208838301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010301
48967	Lê Minh Thuy	2012-05-14	male	Kinh (Việt)	2795	None	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Nhân viên trợ lý văn phòng	10010302
48968	Tôn Nữ Bảo Nghi	2007-11-23	female	Tày	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010302
48969	Phan Ngọc Minh Thư	2008-11-07	female	Kinh (Việt)	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10010302
48970	Đinh Hồng Kiên	1976-11-22	male	Kinh (Việt)	2795		Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	205300501	Lao động giản đơn	10010302
48971	Lữ Trung Tín	2012-09-29	male	Kinh (Việt)	2795	None	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10010302
48972	Lê Trần Kim Ngân	1987-03-26	female	Kinh (Việt)	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	205160601	Nhà chuyên môn bậc cao (đại học trở lên)	10010302
48973	Trần Hoàng Khanh	2015-07-09	female	Kinh (Việt)	2795	None	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010302
48974	Lưu Hoàng Mỹ Uyên	2004-07-29	female	Kinh (Việt)	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	200057701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010302
48975	Phạm Trung Tín	2002-11-26	male	Kinh (Việt)	2795		Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	208400201	Lực lượng vũ trang	10010302
48976	Nguyễn Thị Anh Thư	2000-02-04	female	Xơ-đăng	2795		Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	203307201	Nhân viên trợ lý văn phòng	10010302
48977	Lâm Nguyễn Thụy Vy	2009-07-25	female	Kinh (Việt)	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Tự do	10010302
48978	Nguyễn Đặng Nhật Vy	1970-09-28	female	Kinh (Việt)	2795	none	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	204674301	Lao động giản đơn	10010302
48979	Nguyễn Viết Ký	1968-07-14	male	Nùng	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	205783101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10010302
48980	Huỳnh Lệ Mi	2011-07-08	female	Kinh (Việt)	2795	primary	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Tự do	10010302
48981	Nguyễn Hoàng Thông	1995-07-28	male	Kinh (Việt)	2795	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	203691801	Lao động giản đơn	10010302
48982	Hoàng Minh Huy	1999-08-18	male	Kinh (Việt)	2795		Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	206528901	Lao động giản đơn	10010302
48983	Phan Nhựt Nam	1961-08-07	male	Tày	2795	none	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	201486301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10010302
48984	Đinh Thế Bảo	2002-06-02	male	Khơ-me	2795		Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	201572201	Lao động giản đơn	10010302
48985	Nguyễn Hoàn Như Ý	1993-11-11	female	Kinh (Việt)	2795	high	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	200338201	Lao động giản đơn	10010302
48986	Lê Hồ Trung	2021-03-12	male	Kinh (Việt)	2795	None	Không	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái	Thôn 2 Phường Minh Tân Thành phố Yên Bái Tỉnh Yên Bái		Lao động giản đơn	10010302
48987	Trần Minh Phúc	1986-03-31	male	Kinh (Việt)	2798	secondary	Hồi giáo	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202894001	Lực lượng vũ trang	10020101
48988	Hồ Bảo Tâm	2000-10-24	female	Thổ	2798		Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	206429901	Lao động giản đơn	10020101
48989	Phạm Anh Tuấn	1997-11-04	male	Kinh (Việt)	2798	high	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	204544201	Lao động giản đơn	10020101
48990	Nguyễn Hoàng Triều	2003-05-29	male	Kinh (Việt)	2798	primary	Minh Sư đạo	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	201562501	Lao động giản đơn	10020101
48991	Trần Trương Thanh Nhàn	2004-05-16	female	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202647801	Lao động giản đơn	10020101
48992	Huỳnh Hoàng Mỹ	2006-01-27	male	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020101
48993	Nguyễn Bùi Hoàng Quân	1969-10-20	male	Kinh (Việt)	2798	none	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	206823601	Nhân viên trợ lý văn phòng	10020101
48994	Nguyễn Ngọc Quang	1979-09-21	male	Kinh (Việt)	2798	secondary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	208714401	Nhân viên trợ lý văn phòng	10020101
48995	Nguyễn Lâm Tiểu Yến	2004-10-14	female	Kinh (Việt)	2798	primary	Tin lành	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	204237501	Nhân viên dịch vụ và bán hàng	10020101
48996	Lê Minh Thư	1988-11-23	female	Kinh (Việt)	2798	primary	Cao đài	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202605801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020101
48997	Dương Khã Ái	2014-04-11	female	Kinh (Việt)	2798	None	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020101
48998	Nguyễn Bích Ngọc	2006-10-14	female	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020101
48999	Trần Đỗ Thanh Vy	1968-10-02	female	Kinh (Việt)	2798	secondary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	208507901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10020101
49000	Lê Trung Kiên	2003-01-08	male	Kinh (Việt)	2798	primary	Mặc môn	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	207522801	Lao động giản đơn	10020101
49001	Dương Đình Hoàng Khôi	2007-06-17	male	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020101
49002	Phạm Tú Quỳnh	1970-02-07	female	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	204893201	Tự do	10020101
49003	Trương Phạm Kim Ánh	1995-07-20	female	Kinh (Việt)	2798	primary	Bà-la-môn giáo	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	206013801	Lao động giản đơn	10020101
49004	Trần Anh Điền	2001-12-11	male	Kinh (Việt)	2798		Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	201578401	Tự do	10020101
49005	Đỗ Trần Khánh Quyên	2016-12-07	female	Kinh (Việt)	2798	None	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020101
49006	Lê Thiên Cao	1983-08-19	male	Kinh (Việt)	2798	primary	Không	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	205256301	Tự do	10020101
49007	Phùng Thụy Minh Đăng	2012-07-31	female	Kinh (Việt)	2799	None	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020102
49008	Phạm Phú Hy	2007-05-01	male	Kinh (Việt)	2799	primary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020102
49009	Võ Minh Dũng	1967-01-05	male	Kinh (Việt)	2799	high	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	200136701	Nhân viên dịch vụ và bán hàng	10020102
49010	Chu Thanh Đồng	1974-02-27	male	Kinh (Việt)	2799	primary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	207388801	Lao động giản đơn	10020102
49011	Võ Hoàng Khánh	1973-02-16	male	Kinh (Việt)	2799	none	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	201111401	Lao động giản đơn	10020102
49012	Nguyễn Thành Chung	1977-07-27	male	Kinh (Việt)	2799	none	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202259801	Lao động giản đơn	10020102
49013	Lê Ái Nguyên Ngân	1986-03-04	female	Kinh (Việt)	2799	secondary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	206756201	Lao động giản đơn	10020102
49014	Đỗ Thị Thanh Loan	2005-08-15	female	Kinh (Việt)	2799	primary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	200735301	Nhân viên trợ lý văn phòng	10020102
49015	Hồ Thái Phương Vy	2016-11-03	female	Kinh (Việt)	2799	None	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020102
49016	Nguyễn Mạnh Thường Quân	1993-07-22	male	Kinh (Việt)	2799	high	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	200591801	Lực lượng vũ trang	10020102
49017	Nguyễn Thị Yến My	2005-10-30	female	Kinh (Việt)	2799	primary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	205555701	Lao động giản đơn	10020102
49018	Đoàn Thị Ánh My	1998-01-12	female	Kinh (Việt)	2799		Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	201713301	Lao động giản đơn	10020102
49019	Trần Thị Ngọc Linh	1968-11-11	female	Kinh (Việt)	2799	none	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	203416901	Lao động giản đơn	10020102
49020	Lê Bảo Tiến	1994-02-04	male	Kinh (Việt)	2799	university	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202093601	Lao động giản đơn	10020102
49021	Bùi Thị Yến Như	1994-04-12	female	Kinh (Việt)	2799	university	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	203679601	Lao động giản đơn	10020102
49022	Nguyễn Gia Long	1959-09-06	male	Kinh (Việt)	2799	high	Công giáo	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	205791301	Lao động giản đơn	10020102
49023	Trần Lê Chính Thy	2021-12-01	male	Kinh (Việt)	2799	None	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020102
49024	Phạm Minh Quang	1972-11-21	male	Kinh (Việt)	2799	none	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	202495501	Thợ lắp ráp và vận hành máy móc, thiết bị	10020102
49025	Đặng Thanh Lâm	1985-01-26	male	Kinh (Việt)	2799	primary	Không	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	203605701	Lực lượng vũ trang	10020102
49026	Nguyễn Như Quỳnh	1960-03-19	female	Kinh (Việt)	2799	primary	Công giáo	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Pú Trạng Thị xã Nghĩa Lộ Tỉnh Yên Bái	207932701	Thợ lắp ráp và vận hành máy móc, thiết bị	10020102
49027	Cao Ngọc Phương Uyên	1999-11-24	female	Kinh (Việt)	2801		Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202724101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020201
49028	Phạm Thị Mỹ Uyên	1992-04-13	female	Kinh (Việt)	2801	secondary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	203948001	Lao động giản đơn	10020201
49029	Nguyễn Đông Đan	2010-07-01	male	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Nhà chuyên môn bậc cao (đại học trở lên)	10020201
49030	Nguyễn Hằng Nga	1985-03-02	female	Kinh (Việt)	2801	none	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202642401	Nhân viên dịch vụ và bán hàng	10020201
49031	Phạm Thị Huỳnh Giao	1960-03-16	female	Kinh (Việt)	2801	none	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208541301	Lao động giản đơn	10020201
49032	Trần Cẩm Ly	1993-07-31	female	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	203758701	Lao động giản đơn	10020201
49033	Võ Phương Duy	1996-06-14	male	Kinh (Việt)	2801	university	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208229101	Lao động giản đơn	10020201
49034	Nguyễn Chí Thanh	1923-03-12	male	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208129001	Lao động thủ công và các nghề nghiệp có liên quan khác	10020201
49035	Nguyễn Huỳnh Hoàng Tính	2021-06-19	male	Kinh (Việt)	2801	None	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020201
49036	Hồ Tấn Minh Hoàng	1988-10-26	male	Kinh (Việt)	2801	none	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	201048201	Lao động giản đơn	10020201
49037	Nguyễn Viết Kha	1981-06-12	male	La Hủ	2801	high	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	201850001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10020201
49038	Trần Gia Hân	2006-07-01	female	Kinh (Việt)	2801	primary	Bà-la-môn giáo	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020201
49039	Trần Thị Kim Trang	1996-09-07	female	Kinh (Việt)	2801	high	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208036901	Lao động giản đơn	10020201
49040	Nguyễn Việt Anh	2009-04-20	male	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020201
49041	Shakirin Hakim	1989-06-24	female	Kinh (Việt)	2801	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202469601	Lao động giản đơn	10020201
49042	Nguyễn Phúc Huy Bảo	2015-07-30	male	Kinh (Việt)	2801	None	Bửu Sơn Kỳ Hương	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10020201
49043	Ngô Trần Quỳnh Như	1973-08-27	female	Tày	2801	high	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	204708001	Lực lượng vũ trang	10020201
49044	Phạm Lê Tâm Anh	2009-12-22	female	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10020201
49045	Nguyễn Nhật Thanh	1990-03-10	male	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	200430101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020201
49046	Trần Kim Ngọc	1997-07-21	female	Kinh (Việt)	2801	primary	Không	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	205323001	Lao động giản đơn	10020201
49047	Phan Hoàng Thiên Phú	1984-07-08	male	Tày	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	207182601	Lao động giản đơn	10020202
49048	Dương Thị Ngọc Quỳnh	1973-11-08	female	Kinh (Việt)	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	205903801	Thợ lắp ráp và vận hành máy móc, thiết bị	10020202
49049	Đào Nguyễn Song Thư	1998-08-12	female	Kinh (Việt)	2802		Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	201081101	Lao động giản đơn	10020202
49050	Nguyễn Hoài An	1972-11-04	male	Kinh (Việt)	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	201312701	Lao động giản đơn	10020202
49051	Nguyễn Hoàn Minh Thư	1984-06-25	female	Kinh (Việt)	2802	secondary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202502801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10020202
49052	Nguyễn Thị Thùy Linh	1976-02-05	female	Kinh (Việt)	2802		Phật giáo	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202323801	Nhân viên trợ lý văn phòng	10020202
49053	Nguyễn Gia Bảo	1995-01-18	male	Kinh (Việt)	2802	secondary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	205525801	Nhà chuyên môn bậc cao (đại học trở lên)	10020202
49054	Nguyễn Thị Mai	2011-04-18	female	Kinh (Việt)	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Nhà chuyên môn bậc cao (đại học trở lên)	10020202
49055	Đỗ Phúc Kiên	2016-09-28	male	Kinh (Việt)	2802	None	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020202
49056	Trương Quốc Thắng	1966-06-05	male	Kinh (Việt)	2802	none	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	206335701	Lao động giản đơn	10020202
49057	Nguyễn Tấn Tài	1997-11-30	male	Thái	2802	primary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	201388101	Lao động thủ công và các nghề nghiệp có liên quan khác	10020202
49058	Hoa Hoàng Trí Phúc	2020-10-09	male	Kinh (Việt)	2802	None	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Tự do	10020202
49059	Dương Đình Kiệt	1942-09-10	male	Cơ-tu	2802	primary	Tin lành	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	207996001	Tự do	10020202
49060	Đoàn Trần Nhật Trung	2000-04-12	male	Kinh (Việt)	2802		Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	203444301	Thợ lắp ráp và vận hành máy móc, thiết bị	10020202
49061	Ngô Trần Ngọc Trân	1960-02-07	female	Kinh (Việt)	2802	secondary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202715801	Lao động giản đơn	10020202
49062	Dương Mãn Quý	2005-06-15	male	Kinh (Việt)	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	202159001	Nhân viên dịch vụ và bán hàng	10020202
49063	Trần Thanh Tâm	1962-08-17	female	Khơ-mú	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208462301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10020202
49064	Huỳnh Hoàng Thanh Như	2006-05-26	female	Chứt	2802	primary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020202
49065	Hoàng Triệu Vỹ	1960-10-09	male	Kinh (Việt)	2802	secondary	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	208421001	Lao động giản đơn	10020202
49066	Nguyễn Minh Trí	1964-08-30	male	Phù Lá	2802	none	Không	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Trung Tâm Thị xã Nghĩa Lộ Tỉnh Yên Bái	206199801	Lao động giản đơn	10020202
49067	Nguyễn Thị Bích Phương	2000-06-06	female	Kinh (Việt)	2804		Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	202706801	Lao động giản đơn	10020301
49068	Nguyễn Tuấn Kiệt	1993-02-23	male	Ngái	2804	high	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	200924201	Lao động giản đơn	10020301
49069	Huỳnh Anh Thư	1982-03-24	female	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	201016201	Lao động giản đơn	10020301
49070	Nguyễn Hoàng Anh Thư	1976-12-19	female	Kinh (Việt)	2804		Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	205951701	Lao động giản đơn	10020301
49071	Nguyễn Thị Thu Trinh	1999-07-29	female	Kinh (Việt)	2804		Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	208306801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020301
49072	Nguyễn Ngọc Quý	1974-10-28	female	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206328501	Lao động giản đơn	10020301
49073	Trần Uyên Bảo Ngọc	2020-10-11	female	Kinh (Việt)	2804	None	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020301
49074	Trần Anh Khôi	1962-10-18	male	Kinh (Việt)	2804	none	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	201225701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020301
49075	Nhan Mỹ Hằng	1974-07-01	female	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206043601	Lao động giản đơn	10020301
49076	Vũ Tiêu Thiên Hưng	2015-07-29	male	Kinh (Việt)	2804	None	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động giản đơn	10020301
49077	Nguyễn Thị Tuyết Nhi	1973-05-20	female	Kinh (Việt)	2804	none	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207180801	Nhân viên dịch vụ và bán hàng	10020301
49078	Nguyễn Hoàng Kiều My	2003-10-22	female	Kinh (Việt)	2804	secondary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	202331901	Nhân viên trợ lý văn phòng	10020301
49079	Trần Xuân Đạt	1987-10-13	male	La Ha	2804	none	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207679301	Lao động giản đơn	10020301
49080	Nguyễn Trương Mai Khanh	1983-12-02	female	Kinh (Việt)	2804	none	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	205770601	Lao động giản đơn	10020301
49081	Tạ Hoàng Bảo Khang	1923-10-23	male	Kinh (Việt)	2804	secondary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	201882301	Nhân viên trợ lý văn phòng	10020301
49082	Hà Đức Hoàng Nam	2008-10-23	male	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10020301
49083	Đào Nguyên Tường Vy	1925-08-18	female	Mnông	2804	none	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207694701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10020301
49084	Mã Gia Phúc	1985-10-16	male	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	200211401	Lao động thủ công và các nghề nghiệp có liên quan khác	10020301
49085	Nguyễn Thụy Minh Anh	2007-12-27	female	Thái	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Tự do	10020301
49086	Vũ Gia Bình	1975-03-01	male	Kinh (Việt)	2804	primary	Không	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 1 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206474201	Lao động giản đơn	10020301
49087	Hoàng Anh Khoa	1993-12-25	male	Kinh (Việt)	2805	primary	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	203035401	Nhân viên trợ lý văn phòng	10020302
49088	Võ Quang Trường	1989-10-10	male	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	205974701	Lực lượng vũ trang	10020302
49089	Nguyễn Hoàng Anh Thư	1990-02-02	female	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	204847001	Thợ lắp ráp và vận hành máy móc, thiết bị	10020302
49090	Nguyễn Thị Diệu Phương	2011-03-24	female	Kinh (Việt)	2805	primary	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lực lượng vũ trang	10020302
49091	Huỳnh Lê Văn	1996-07-08	male	Kinh (Việt)	2805	primary	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206995401	Lao động giản đơn	10020302
49092	Lại Xuân Lộc	1990-03-20	female	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	204566301	Lao động giản đơn	10020302
49093	Võ Thanh Trọng	1969-07-21	male	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	203136901	Lao động giản đơn	10020302
49094	Lương Nguyễn Anh Thư	2019-10-11	female	Kinh (Việt)	2805	None	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020302
49095	Nguyễn Quốc Tuấn	2021-02-25	male	Kinh (Việt)	2805	None	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020302
49096	Đoàn Đỗ Thiên Thanh	2001-10-04	female	Kinh (Việt)	2805		Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206430901	Lao động thủ công và các nghề nghiệp có liên quan khác	10020302
49097	Đặng Minh Tâm	1972-01-12	male	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207936701	Lao động giản đơn	10020302
49098	Nguyễn Bảo Quốc	1966-09-27	male	Kinh (Việt)	2805	primary	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	204403301	Lao động giản đơn	10020302
49099	Huỳnh Võ Ngọc Trân	1948-11-07	female	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	206197601	Nhân viên trợ lý văn phòng	10020302
49100	Phạm Quốc Thịnh	1990-03-31	male	Khơ-me	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	204161601	Lao động giản đơn	10020302
49101	Đỗ Đại Hiệp	2013-06-27	male	Chu-ru	2805	None	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10020302
49102	Trần Thành Đạt	1988-10-23	male	Kinh (Việt)	2805	none	Baha'I	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	202267001	Lao động thủ công và các nghề nghiệp có liên quan khác	10020302
49103	Lê Văn Trung Tín	1986-04-25	male	Kinh (Việt)	2805	none	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207822301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10020302
49104	Lương Minh Khánh	2002-11-10	male	Kinh (Việt)	2805		Minh Sư đạo	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	204679401	Tự do	10020302
49105	Nguyễn Vũ Quang Minh	1985-10-10	male	Khơ-me	2805	primary	Không	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	200343501	Lao động giản đơn	10020302
49106	Trần Thảo Vy	1974-12-01	female	Kinh (Việt)	2805	primary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	Thôn 2 Phường Tân An Thị xã Nghĩa Lộ Tỉnh Yên Bái	207001501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10020302
49107	Lê Thị Thảo My	2015-03-17	female	Kinh (Việt)	2808	None	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030101
49108	Lê Hoàng Mai Thảo	1937-10-08	female	Gia-rai	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	200430801	Lao động giản đơn	10030101
49109	Hồ Nguyễn Tấn Phúc	2004-02-02	male	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	207321801	Tự do	10030101
49110	Lê Hoàng Oanh	2005-01-27	female	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	205558301	Lao động giản đơn	10030101
49111	Trần Ngọc Mai	1966-12-26	female	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	205797301	Lao động giản đơn	10030101
49112	Phạm Công Thể Trân	1977-02-28	female	Kinh (Việt)	2808	none	Phật giáo Hòa Hảo	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	204660201	Lực lượng vũ trang	10030101
49113	Ngô Viết Khương Duy	1940-06-05	male	Kinh (Việt)	2808	university	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203083101	Lao động giản đơn	10030101
49114	Trần Vũ Quốc Anh	1965-12-02	male	Kinh (Việt)	2808	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	201632501	Tự do	10030101
49115	Võ Thụy Trúc Vy	1940-08-06	female	Hoa (Hán)	2808	none	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	207001801	Lao động giản đơn	10030101
49116	Nguyễn Thị Hồng Vân	1988-07-16	female	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203509601	Lực lượng vũ trang	10030101
49117	Hồ Đại Phát	1989-03-18	male	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	204463001	Lao động giản đơn	10030101
49118	Nguyễn Huy Cảnh	2019-05-25	male	Kinh (Việt)	2808	None	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030101
49119	Nguyễn Lê Phương Vân	1954-10-13	female	Brâu	2808	high	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208915201	Tự do	10030101
49120	Nguyễn Hải Đăng	1988-02-26	male	Kinh (Việt)	2808	none	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	206686001	Nhân viên dịch vụ và bán hàng	10030101
49121	Nguyễn Thị Kiều Chinh	1992-06-22	female	Kinh (Việt)	2808	secondary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203587901	Tự do	10030101
49122	Bùi Duy Linh	1996-08-24	male	Kinh (Việt)	2808	secondary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	205143201	Lực lượng vũ trang	10030101
49123	Tăng Quốc Kiệt	2013-02-28	male	Kinh (Việt)	2808	None	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030101
49124	Nguyễn Gia Minh	2018-01-18	male	Khơ-me	2808	None	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030101
49125	Bạch Kiều Hoàng Thái	2011-07-15	male	Thái	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030101
49126	Trần Thanh Thảo	1963-02-11	female	Kinh (Việt)	2808	primary	Không	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208490701	Tự do	10030101
49127	Trương Nhật Mai	1971-11-21	female	Kinh (Việt)	2809	secondary	Cơ đốc Phục lâm	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203107001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030102
49128	Nguyễn Văn Thạnh Tiến	2004-03-03	male	Kinh (Việt)	2809	secondary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208651501	Thợ lắp ráp và vận hành máy móc, thiết bị	10030102
49129	Đỗ Nguyễn Thư Kỳ	2001-09-30	female	Kinh (Việt)	2809		Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203037201	Lao động giản đơn	10030102
49130	Trương Duy Phong	1997-12-18	male	Kinh (Việt)	2809	high	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	206789701	Lao động giản đơn	10030102
49131	Lê Trần Thuý Vy	1983-11-06	female	Co	2809	none	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	201256101	Nhân viên dịch vụ và bán hàng	10030102
49132	Quách Hoàng Luân	1965-06-07	male	Kinh (Việt)	2809	primary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	200192701	Thợ lắp ráp và vận hành máy móc, thiết bị	10030102
49133	Trần Ngân Hà	2015-10-10	female	Kinh (Việt)	2809	None	Cơ đốc Phục lâm	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Nhân viên trợ lý văn phòng	10030102
49134	Triệu Vân Anh	1986-11-15	female	Phù Lá	2809	primary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203455001	Lao động giản đơn	10030102
49135	Trương Quang Tùng	2014-06-20	male	Kinh (Việt)	2809	None	Cao đài	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10030102
49136	Nguyễn Hoàng Sỹ Điền	1947-07-17	male	Pà Thẻn	2809	none	Minh Sư đạo	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208332001	Lao động giản đơn	10030102
49137	Lê Nguyễn Minh Anh	1991-09-10	female	Cơ-ho	2809		Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	206007701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030102
49138	Triệu Gia Bội	1975-12-25	female	Kinh (Việt)	2809	none	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	205731001	Nhân viên trợ lý văn phòng	10030102
49139	Nguyễn Phúc Lộc	2019-05-30	male	Kinh (Việt)	2809	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10030102
49140	Nguyễn Hồ Phi Minh	1959-07-26	male	Kinh (Việt)	2809	primary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	203108101	Lực lượng vũ trang	10030102
49141	Bùi Anh Tú	1997-10-12	male	La Hủ	2809	secondary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	201144901	Lao động giản đơn	10030102
49142	Trần Anh Huy	1965-10-19	male	Kinh (Việt)	2809	none	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	206069501	Lao động giản đơn	10030102
49143	Châu Tuấn Anh	1967-10-15	male	Kinh (Việt)	2809	high	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208216601	Lao động giản đơn	10030102
49144	Nguyễn Lê Mỹ Dung	1982-01-31	female	Kinh (Việt)	2809	none	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	208151701	Nhân viên trợ lý văn phòng	10030102
49145	Quan Trường	1971-12-09	male	Kinh (Việt)	2809	primary	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	201305401	Lao động giản đơn	10030102
49146	Diệp Minh Chí	2021-09-17	male	Kinh (Việt)	2809	None	Không	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Thị trấn Yên Thế Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030102
49147	Trần Thị Minh Trâm	2020-03-06	female	Kinh (Việt)	2811	None	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030201
49148	Võ Huỳnh Thảo Vy	2006-12-21	female	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10030201
49149	Huỳnh Thanh Lên	2011-07-31	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10030201
49150	Nguyễn Bảo Trân	1960-08-09	female	Mạ	2811	secondary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	200268801	Lao động giản đơn	10030201
49151	Cao Thị Phương Minh	1949-02-28	female	Kinh (Việt)	2811	secondary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	206749501	Lao động giản đơn	10030201
49152	Bùi Vũ Tường Quân	2015-01-23	female	Kinh (Việt)	2811	None	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030201
49153	Võ Cường Xuân	1964-02-27	male	Kinh (Việt)	2811	secondary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	203392801	Lao động giản đơn	10030201
49154	Châu Mỹ Duyên	1923-10-09	female	Kinh (Việt)	2811	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	207489001	Tự do	10030201
49155	Lê Nguyễn Thùy Linh	1970-09-15	female	Kinh (Việt)	2811	secondary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	201479401	Nhà chuyên môn bậc cao (đại học trở lên)	10030201
49156	Nguyễn Thanh Phong	1964-12-03	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	208266101	Lao động giản đơn	10030201
49157	Kiều Hà Khương	1949-09-05	female	Kinh (Việt)	2811	none	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	200702701	Lao động giản đơn	10030201
49158	Nguyễn Lý Hoàng Huy	2009-01-24	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030201
49159	Vũ Thị Đan Thùy	2018-01-18	female	Kinh (Việt)	2811	None	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030201
49160	Nguyễn Ngọc Anh Duy	1961-09-30	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	202465801	Lao động thủ công và các nghề nghiệp có liên quan khác	10030201
49161	Đỗ Thị Ngọc Diệp	1982-12-23	female	Kinh (Việt)	2811	primary	Công giáo	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	206673601	Lao động giản đơn	10030201
49162	Lê Phạm Minh Thy	1974-07-15	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	208896601	Lao động giản đơn	10030201
49163	Nguyễn Việt Khoa	1990-12-04	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	205135801	Nhà chuyên môn bậc cao (đại học trở lên)	10030201
49164	Trần Nguyễn Phúc Nguyên	1926-10-07	male	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	205842401	Lao động giản đơn	10030201
49165	Diệp Như Anh	2011-07-31	female	Kinh (Việt)	2811	primary	Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10030201
49166	Huỳnh Thị Thanh Tuyền	1976-11-21	female	Kinh (Việt)	2811		Không	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	200897801	Lao động giản đơn	10030201
49167	Trần Thị Mỹ Nương	1998-07-01	female	Kinh (Việt)	2812		Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	203621101	Lao động giản đơn	10030202
49168	Nguyễn Hữu Tuấn Đạt	1980-04-03	male	Kinh (Việt)	2812	university	Cao đài	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	207981401	Lao động giản đơn	10030202
49169	Trần Hoàng Việt	1949-12-06	male	Khơ-mú	2812	primary	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	203143201	Lao động giản đơn	10030202
49170	Trương Anh Phương	2010-03-08	female	Kinh (Việt)	2812	primary	Cơ đốc Phục lâm	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Nhân viên trợ lý văn phòng	10030202
49171	Lê Bình Linh	2015-09-21	male	Thái	2812	None	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10030202
49172	Võ Thị Ngọc Huyền	2012-02-15	female	Kinh (Việt)	2812	None	Cao đài	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10030202
49173	Từ Minh Khang	1962-09-16	male	Kinh (Việt)	2812	none	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	200624101	Lao động giản đơn	10030202
49174	Nguyễn Huỳnh Anh Thư	1975-03-30	female	Kinh (Việt)	2812	primary	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	206989101	Lao động giản đơn	10030202
49175	Nguyễn Thị Mai Phương	1976-06-03	female	Tà-ôi	2812		Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	203684301	Thợ lắp ráp và vận hành máy móc, thiết bị	10030202
49176	Võ Thành Tín	2021-06-09	male	Kinh (Việt)	2812	None	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030202
49177	Phạm Tuấn Tài	1975-01-27	male	Kinh (Việt)	2812	secondary	Minh Sư đạo	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	207334701	Lao động thủ công và các nghề nghiệp có liên quan khác	10030202
49178	Nguyễn Ngọc Uyên Nhi	1978-08-09	female	Kinh (Việt)	2812	primary	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	202650001	Nhân viên dịch vụ và bán hàng	10030202
49179	Trần Gia Hân	1997-12-17	female	Kinh (Việt)	2812	high	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	201046701	Lao động giản đơn	10030202
49180	Nguyễn Hoàng Trường	1969-07-18	male	Kinh (Việt)	2812	none	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	208908501	Tự do	10030202
49181	Lê Văn Thể	2019-09-29	male	Kinh (Việt)	2812	None	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động thủ công và các nghề nghiệp có liên quan khác	10030202
49182	Nguyễn Thanh Huy	2020-08-29	male	Kinh (Việt)	2812	None	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030202
49183	Bùi Trình Các Tường	1979-07-23	female	Kinh (Việt)	2812	none	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	201209501	Lao động giản đơn	10030202
49184	Ngô Minh Nghĩa	1960-01-12	male	Khơ-me	2812	high	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	204081801	Nhà chuyên môn bậc cao (đại học trở lên)	10030202
49185	Nguyễn Ngọc Hiếu	1972-05-07	male	Gié-Triêng	2812	primary	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	203928401	Nhân viên dịch vụ và bán hàng	10030202
49186	Nguyễn Khánh Vân	1964-02-05	female	Kinh (Việt)	2812	secondary	Không	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Tân Phượng Huyện Lục Yên Tỉnh Yên Bái	204408901	Nhà chuyên môn bậc cao (đại học trở lên)	10030202
49187	Huỳnh Vân Dung	1999-11-18	female	Kinh (Việt)	2814		Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	206228401	Lao động giản đơn	10030301
49188	Con Kiến Huy	1967-08-03	male	Kinh (Việt)	2814	primary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	202088201	Thợ lắp ráp và vận hành máy móc, thiết bị	10030301
49189	Vũ Ngọc Minh Xuân	1962-03-03	female	Kinh (Việt)	2814	primary	Tin lành	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	202515401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10030301
49190	Phạm Nhật Tuấn Việt	1963-12-11	male	Kinh (Việt)	2814	none	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	203203801	Lao động giản đơn	10030301
49191	Nguyễn Thị Mỹ Ngân	1998-07-12	female	Kinh (Việt)	2814		Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	205830701	Tự do	10030301
49192	Trần Quốc Hùng	2002-01-31	male	Kinh (Việt)	2814		Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	206237201	Lao động giản đơn	10030301
49193	Trịnh Thị Thu Ngân	2014-04-28	female	Kinh (Việt)	2814	None	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Nhân viên dịch vụ và bán hàng	10030301
49194	Nguyễn Lê Thanh Như	1981-09-26	female	Kinh (Việt)	2814	high	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	207770401	Nhân viên dịch vụ và bán hàng	10030301
49195	Nguyễn Huỳnh Gia Minh	2019-12-11	male	Kinh (Việt)	2814	None	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030301
49196	Nguyễn Quỳnh Trâm	2011-11-19	female	Kinh (Việt)	2814	primary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10030301
49197	Đinh Ngọc Anh	1979-10-14	female	Kinh (Việt)	2814	none	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	207070301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030301
49198	Lê Hoàng Thiện	2009-07-18	male	Kinh (Việt)	2814	primary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030301
49199	Trần Thị Ngọc Phượng	1980-07-19	female	Kinh (Việt)	2814	secondary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	208608201	Lao động giản đơn	10030301
49200	Hồ Hoàng Thanh Liên	1988-02-03	female	Kinh (Việt)	2814	none	Tin lành	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	207425601	Lao động thủ công và các nghề nghiệp có liên quan khác	10030301
49201	La Thị Ngọc Nhung	1984-06-11	female	Kinh (Việt)	2814	none	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	204766401	Lao động giản đơn	10030301
49202	Nguyễn Phan Thanh Trà	1974-01-22	female	Kinh (Việt)	2814	none	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	203571401	Lao động giản đơn	10030301
49203	Nguyễn Thị Cẩm Hằng	1973-06-13	female	Kinh (Việt)	2814	university	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	206694401	Lao động giản đơn	10030301
49204	Phan Gia Huy	2017-08-12	male	Kinh (Việt)	2814	None	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lực lượng vũ trang	10030301
49205	Nguyễn Việt Anh	1992-02-17	male	Kinh (Việt)	2814	primary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	206657601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10030301
49206	Lê Tất Khang	1936-07-18	male	Kinh (Việt)	2814	secondary	Không	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 1 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	202416401	Tự do	10030301
49207	Trần Thị Anh Thư	1984-02-18	female	Kinh (Việt)	2815	none	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	205222801	Lao động giản đơn	10030302
49208	Nguyễn Thị Bích Ngọc	2009-08-03	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030302
49209	Trần Chính Nghĩa	1989-12-01	male	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	201598501	Tự do	10030302
49210	Phan Ngọc Minh Thư	2015-04-21	female	Kinh (Việt)	2815	None	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Thợ lắp ráp và vận hành máy móc, thiết bị	10030302
49211	Nguyễn Thị Trà My	1967-09-27	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	207223401	Nhân viên trợ lý văn phòng	10030302
49212	Trần Bùi Đoan Hậu	2009-09-05	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030302
49213	Hồ Ngọc Kim Oanh	2006-10-30	female	Hoa (Hán)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	10030302
49214	Cao Trung Kiên	2019-07-16	male	Kinh (Việt)	2815	None	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10030302
49215	Vũ Nguyễn Thanh Uyên	1962-10-03	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	206451901	Lao động giản đơn	10030302
49216	Võ Thị Như Thúy	1979-02-17	female	Kinh (Việt)	2815	none	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	200534401	Lao động giản đơn	10030302
49217	Phù Nguyệt Ái Châu	1989-09-30	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	207097301	Nhà chuyên môn bậc cao (đại học trở lên)	10030302
49218	Nguyễn Quỳnh Nga	1943-04-26	female	Kinh (Việt)	2815	none	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	205555801	Lao động giản đơn	10030302
49219	Hà Trúc Linh	2008-03-03	female	Kinh (Việt)	2815	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030302
49220	Nguyễn Lê Minh Thông	2010-11-12	male	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	10030302
49221	Lê Anh Phương	2014-08-29	female	Khơ-mú	2815	None	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030302
49222	Trần Như Ngọc	2005-01-14	female	Kinh (Việt)	2815	primary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	200418501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	10030302
49223	Nguyễn Lê Hồng Hải	2016-08-20	male	Kinh (Việt)	2815	None	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái		Lao động giản đơn	10030302
49224	Đặng Minh Khải	1986-05-10	male	Kinh (Việt)	2815	none	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	202731801	Nhà chuyên môn bậc cao (đại học trở lên)	10030302
49225	Hà Vĩnh Quyền	2003-09-09	male	Kinh (Việt)	2815	secondary	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	205042401	Nhà chuyên môn bậc cao (đại học trở lên)	10030302
49226	Lương Nguyễn Thu Uyên	1986-08-20	female	Kinh (Việt)	2815	none	Không	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	Thôn 2 Xã Lâm Thượng Huyện Lục Yên Tỉnh Yên Bái	204349701	Lao động giản đơn	10030302
45627	Phạm Đăng Khoa	2017-12-17	male	Kinh (Việt)	2509	None	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Tự do	01010101
45628	Nguyễn Trần Kim Ngân	1989-11-14	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	206121201	Nhân viên trợ lý văn phòng	01010101
45629	Trần Hải Luân	1959-06-04	male	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	206096101	Lao động giản đơn	01010101
45630	Nguyễn Mai Anh	2006-10-18	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Tự do	01010101
45631	Nguyễn Hoàng Minh Nhi	2012-11-23	female	Kinh (Việt)	2509	None	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Lao động thủ công và các nghề nghiệp có liên quan khác	01010101
45632	Lý Hồ Bảo Ngân	1922-01-13	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	202134601	Lực lượng vũ trang	01010101
45633	Đặng Thị Pha Lê	1967-03-01	female	Kinh (Việt)	2509	secondary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	208578701	Lao động giản đơn	01010101
45634	Lê Minh Đức	1981-05-14	male	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	200257201	Lao động giản đơn	01010101
45635	Lê Phạm Phương Quỳnh	2007-03-21	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010101
45636	Huỳnh Từ Mẫn Nghi	1969-01-11	female	Kinh (Việt)	2509	secondary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	204027201	Lao động giản đơn	01010101
45637	Trần Thiên Quang	1966-01-16	male	Kinh (Việt)	2509	none	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	202495801	Nhân viên trợ lý văn phòng	01010101
45638	Trần Trọng Phương Vy	2015-04-07	female	Thái	2509	None	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010101
45639	Trương Đức Duy	1972-03-28	male	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	200070301	Tự do	01010101
45640	Lê Thị Thảo	1997-07-28	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	208490201	Lao động giản đơn	01010101
45641	Trần Lê Tấn Lộc	1973-12-11	male	Kinh (Việt)	2509	none	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205819101	Lao động giản đơn	01010101
45642	Nguyễn Lý Phương Như	1986-10-31	female	Kinh (Việt)	2509	secondary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	202146501	Lao động thủ công và các nghề nghiệp có liên quan khác	01010101
45643	Lê Hồng Thắm	1975-03-20	female	Kinh (Việt)	2509	primary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205182901	Lao động giản đơn	01010101
45644	Lê Hoàng Duy	2000-02-10	male	Kinh (Việt)	2509		Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	206900801	Lao động giản đơn	01010101
45645	Lê Trịnh Diễm Thy	1937-12-03	female	Mnông	2509	primary	Baha'I	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	200536601	Tự do	01010101
45646	Phạm Ngọc Anh Thy	1967-12-17	female	Kinh (Việt)	2509	secondary	Không	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	207949901	Thợ lắp ráp và vận hành máy móc, thiết bị	01010101
45647	Phạm Tô Thanh Trúc	1988-11-06	female	Kinh (Việt)	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	203321401	Lao động giản đơn	01010102
45648	Lê Anh Dũng	1982-10-12	male	Kinh (Việt)	2510	high	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	203459001	Tự do	01010102
45649	Nguyễn Phước Bình	1998-12-03	male	Kinh (Việt)	2510		Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	202258001	Tự do	01010102
45650	Vũ Thành Trung	1973-11-11	male	Kinh (Việt)	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	204663501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010102
45651	Ung Thị Diễm	2003-08-24	female	Kinh (Việt)	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	204866101	Thợ lắp ráp và vận hành máy móc, thiết bị	01010102
45652	Phạm Trần Anh Tuấn	1979-04-04	male	Kinh (Việt)	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	206208601	Nhân viên dịch vụ và bán hàng	01010102
45653	Huỳnh Yến Nhi	1959-04-05	female	Kinh (Việt)	2510	secondary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205618101	Lao động giản đơn	01010102
45654	Nguyễn Hữu Quang	2002-05-18	male	Kinh (Việt)	2510		Minh Sư đạo	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	207184701	Lao động giản đơn	01010102
45655	Lê Bảo Lộc	2007-10-31	male	Gié-Triêng	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010102
45656	Võ Thúy Hằng	1998-03-21	female	Kinh (Việt)	2510		Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	201327601	Lao động giản đơn	01010102
45657	Đào Kha Anh Thuyên	2020-08-12	female	Kinh (Việt)	2510	None	Mặc môn	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01010102
45658	Nguyễn Ngọc Huỳnh Nhung	1990-10-19	female	Kinh (Việt)	2510	high	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	203117501	Tự do	01010102
45659	Lê Nguyễn Long	1954-05-21	male	Kinh (Việt)	2510	none	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	201708101	Lao động giản đơn	01010102
45660	Bùi Nguyễn Gia Huy	2003-06-21	male	Kinh (Việt)	2510	primary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205283801	Lao động giản đơn	01010102
45661	Nguyễn Ngọc Tú Anh	1975-06-30	female	Chơ-ro	2510	secondary	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	202518801	Nhân viên trợ lý văn phòng	01010102
45662	Nguyễn Thị Thùy Vân	1981-03-02	female	Kinh (Việt)	2510	high	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205989501	Lao động giản đơn	01010102
45663	Lê Minh Long	1963-11-22	male	Kinh (Việt)	2510	none	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	200629801	Tự do	01010102
45664	Lâm Gia Linh	1990-03-11	female	Kinh (Việt)	2510	none	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	205787001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010102
45665	Lù Gia Như	1998-09-26	female	Kinh (Việt)	2510		Cao đài	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	206133701	Lao động giản đơn	01010102
45666	Nguyễn Hồng Phúc	2019-12-23	male	Kinh (Việt)	2510	None	Không	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Phúc Xá Quận Ba Đình Thành phố Hà Nội		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01010102
45667	Phạm Thùy Linh	2013-07-28	female	Kinh (Việt)	2512	None	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01010201
45668	Nguyễn Quốc Việt	1975-11-14	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	208091501	Thợ lắp ráp và vận hành máy móc, thiết bị	01010201
45669	Nguyễn Hiền Triết	2000-01-30	male	Kinh (Việt)	2512		Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	205380501	Tự do	01010201
45670	Nguyễn Thị Huệ	2014-10-02	female	Kinh (Việt)	2512	None	Minh Sư đạo	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lực lượng vũ trang	01010201
45671	Đỗ Bội Trân	2011-03-21	female	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Nhân viên dịch vụ và bán hàng	01010201
45672	Dương Tuấn Nam	1969-10-28	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	207004501	Lao động giản đơn	01010201
45673	Nguyễn Phú Hào	2008-01-12	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010201
45674	Dương Phạm Khánh Duy	1980-10-28	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	205412401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010201
45675	Nguyễn Đỗ Hiền Thảo	1953-10-03	female	Kinh (Việt)	2512	none	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200375101	Nhà chuyên môn bậc cao (đại học trở lên)	01010201
45676	Phạm Huyền Bảo Ngọc	1964-05-04	female	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	208474801	Lao động giản đơn	01010201
45677	Hà Uyên Như	2010-06-27	female	La Hủ	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010201
45678	Hoàng Xuân Mai	1992-11-11	female	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	201895701	Lao động thủ công và các nghề nghiệp có liên quan khác	01010201
45679	Đỗ Minh Khoa	2020-01-11	male	Kinh (Việt)	2512	None	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010201
45680	Nguyễn Đăng Khoa	2006-07-23	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010201
45681	Phan Khánh My	2005-10-13	female	Kinh (Việt)	2512	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200632901	Lao động giản đơn	01010201
45682	Đàm Thanh Trúc	1994-01-17	female	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	207800101	Lao động thủ công và các nghề nghiệp có liên quan khác	01010201
45683	Nguyễn Ngọc Chu Uyên	1978-02-21	female	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	207370101	Lao động thủ công và các nghề nghiệp có liên quan khác	01010201
45684	Phạm Trần Phương Quyên	1998-11-10	female	Kinh (Việt)	2512		Baha'I	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	205903001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010201
45685	Nguyễn Huỳnh Minh Quân	1964-03-01	male	Kinh (Việt)	2512	primary	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200322401	Lao động giản đơn	01010201
45686	Nguyễn Minh Hoàng	1979-05-31	male	Kinh (Việt)	2512	none	Không	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	201331801	Lao động giản đơn	01010201
45687	Trần Quang Khải	2018-10-25	male	Gié-Triêng	2513	None	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lực lượng vũ trang	01010202
45688	Vũ Lã Quốc Lâm	1995-05-08	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200561801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01010202
45689	Cao Nguyễn Minh Anh	2018-11-25	female	Kinh (Việt)	2513	None	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010202
45690	Từ Vũ Khánh Vân	2004-03-19	female	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	205990601	Lao động thủ công và các nghề nghiệp có liên quan khác	01010202
45691	Nguyễn Thái Bảo	2007-10-11	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010202
46166	Trần Song Tố Uyên	2004-09-14	female	Cơ Lao	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	208914701	Tự do	02020201
45692	Phan Gia Huy	2009-03-10	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01010202
45693	Nguyễn Như Hà Thiên Anh	1994-09-15	female	Kinh (Việt)	2513	secondary	Phật giáo Hòa Hảo	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	206010001	Lao động thủ công và các nghề nghiệp có liên quan khác	01010202
45694	Dương Lê Hiếu Thắng	1929-11-17	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200771101	Lao động giản đơn	01010202
45695	Nguyễn Tấn Phước	1968-01-06	male	Kinh (Việt)	2513	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	206794501	Lao động giản đơn	01010202
45696	Trương Mỹ Trinh	1999-08-24	female	Thái	2513		Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200713401	Lao động giản đơn	01010202
45697	Hoàng Thị Thùy Nhung	2012-02-26	female	Kinh (Việt)	2513	None	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Lực lượng vũ trang	01010202
45698	Lê Nguyễn Như Duyên	1974-11-29	female	Kinh (Việt)	2513	none	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	203718901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01010202
45699	Nguyễn Trần Ngọc Hạnh	1970-05-21	female	Thái	2513	none	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	202693201	Nhà chuyên môn bậc cao (đại học trở lên)	01010202
45700	Dương Mỹ Tâm	2009-11-21	female	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Nhà chuyên môn bậc cao (đại học trở lên)	01010202
45701	Nguyễn Trần Thuý Vi	1969-03-09	female	Kinh (Việt)	2513	secondary	Phật giáo	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	202571501	Lao động giản đơn	01010202
45702	Nguyễn Anh Huy	1954-11-22	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	201050301	Thợ lắp ráp và vận hành máy móc, thiết bị	01010202
45703	Huỳnh Tấn Lộc	1969-11-28	male	Kinh (Việt)	2513	secondary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	200736201	Thợ lắp ráp và vận hành máy móc, thiết bị	01010202
45704	Nguyễn Tấn Đạt	1960-01-11	male	Kinh (Việt)	2513	primary	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	208536401	Lao động giản đơn	01010202
45705	Lương Minh Lê Nhi	2021-12-17	female	Kinh (Việt)	2513	None	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01010202
45706	Nguyễn Viết Lượng	1987-12-26	male	Kinh (Việt)	2513	none	Không	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Trúc Bạch Quận Ba Đình Thành phố Hà Nội	207733501	Tự do	01010202
45707	Nguyễn Đức Anh	1973-06-05	male	Phù Lá	2515	none	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	202374901	Nhân viên trợ lý văn phòng	01010301
45708	Hồ Quốc Đạt	2004-03-19	male	Xơ-đăng	2515	primary	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	207387501	Lao động giản đơn	01010301
45709	Văn Mỹ Nhiên	1923-03-16	female	Kinh (Việt)	2515	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	205347201	Lao động giản đơn	01010301
45710	Nguyễn Khôi Nguyên	1932-10-29	female	Kinh (Việt)	2515	none	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	207231001	Lao động giản đơn	01010301
45711	Bành Thị Mỹ Ngọc	2013-04-15	female	Kinh (Việt)	2515	None	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010301
45712	Bùi Ngọc Minh	2001-03-01	male	Hmông (Mèo)	2515		Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	207542201	Lao động giản đơn	01010301
45713	Châu Thị Diễm Quỳnh	1973-08-09	female	Kinh (Việt)	2515	primary	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201791201	Nhân viên trợ lý văn phòng	01010301
45714	Chu Trần Minh Trọng	2005-11-16	male	Kinh (Việt)	2515	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	206202301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010301
45715	Phan Trung Sơn	2021-11-18	male	Kinh (Việt)	2515	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01010301
45716	Chu Hoàng Nguyên	1996-05-28	male	Kinh (Việt)	2515	high	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	204579101	Lao động giản đơn	01010301
45717	Huỳnh Tấn Đạt	1976-11-20	male	Hmông (Mèo)	2515		Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	203800001	Nhân viên dịch vụ và bán hàng	01010301
45718	Tạ Nhật Quỳnh	2011-03-18	female	Kinh (Việt)	2515	primary	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01010301
45719	Huỳnh Thị Ngọc Trinh	1974-04-10	female	Kinh (Việt)	2515	none	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201998101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01010301
45720	Trần Hải Yến	1934-03-02	female	Kinh (Việt)	2515	none	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	208317501	Lao động giản đơn	01010301
45721	Lê Hoàng Hảo	2016-10-24	male	Kinh (Việt)	2515	None	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lực lượng vũ trang	01010301
45722	Nhữ Nhật Hào	1963-07-31	male	Kinh (Việt)	2515	high	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201046101	Nhân viên trợ lý văn phòng	01010301
45723	Huỳnh Hồng Yến Vy	1958-07-27	female	Kinh (Việt)	2515	none	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	207371301	Tự do	01010301
45724	Nguyễn Ngọc Huỳnh Hương	2008-02-26	female	Kinh (Việt)	2515	primary	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010301
45725	Hoàng Kim Long	2018-12-03	male	La Hủ	2515	None	Không	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01010301
45726	Nguyễn Trần Mỹ Uyên	1993-03-30	female	Kinh (Việt)	2515	high	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 1 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201514301	Lao động giản đơn	01010301
45727	Phan Trung Hiếu	1936-09-12	male	Kinh (Việt)	2516	none	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201840601	Nhân viên trợ lý văn phòng	01010302
45728	Nguyễn Tuấn Hùng	1933-02-20	male	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	203092301	Lao động giản đơn	01010302
45729	Lê Diêu Hoàng Phúc	1970-04-26	male	Kinh (Việt)	2516	secondary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	203239901	Tự do	01010302
45730	Nguyễn Thanh Phong	1988-04-10	male	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	205627401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01010302
45731	Huỳnh Thị Thanh Trúc	2016-06-19	female	Khơ-me	2516	None	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Nhà chuyên môn bậc cao (đại học trở lên)	01010302
45732	Trần Gia Bảo	2008-02-18	male	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010302
45733	Nguyễn Thị Huỳnh Như	1978-12-22	female	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	202146901	Lao động giản đơn	01010302
45734	Lê Minh Trí	1992-03-18	male	Kinh (Việt)	2516	high	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	204660701	Lao động giản đơn	01010302
45735	Hồ Nguyễn Bảo Lân	1988-11-10	male	Kinh (Việt)	2516	secondary	Phật giáo Hòa Hảo	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	207725901	Lao động giản đơn	01010302
45736	Lê Minh Hiếu	1955-05-15	male	Tày	2516	none	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	204518401	Lao động giản đơn	01010302
45737	Lâm Thị Kiều Oanh	1968-12-02	female	Kinh (Việt)	2516	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	205890701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01010302
45738	Huỳnh Ngọc Ngân	1998-10-30	female	Kinh (Việt)	2516		Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	200806501	Lao động giản đơn	01010302
45739	Nguyễn Hải Huy	2020-03-21	male	Kinh (Việt)	2516	None	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01010302
45740	Nguyễn Hạo Nam	2016-05-08	male	Kinh (Việt)	2516	None	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010302
45741	Lê Hồng Đào	1964-03-31	female	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	201264701	Lao động thủ công và các nghề nghiệp có liên quan khác	01010302
45742	Nguyễn Thị Quỳnh Như	2018-09-27	female	Kinh (Việt)	2516	None	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động giản đơn	01010302
45743	Trịnh Gia Linh	1994-12-18	female	Kinh (Việt)	2516	high	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	203216801	Thợ lắp ráp và vận hành máy móc, thiết bị	01010302
45744	Huỳnh Nguyễn Bảo Ngọc	1974-11-05	female	Kinh (Việt)	2516	high	Phật giáo	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	202340001	Tự do	01010302
45745	Lê Trần Uyên Thy	2010-03-21	female	Kinh (Việt)	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01010302
45746	Nguyễn Thanh Việt	2009-10-23	male	Dao	2516	primary	Không	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội	Thôn 2 Phường Vĩnh Phúc Quận Ba Đình Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01010302
45747	Nguyễn Đức Phúc	1951-10-27	male	Kinh (Việt)	2519		Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202351601	Lao động giản đơn	01020101
45748	Nguyễn Hoàng Gia Bảo	1991-08-30	male	Ê-đê	2519		Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	208683601	Thợ lắp ráp và vận hành máy móc, thiết bị	01020101
45749	Nguyễn Thị Linh Phương	1990-09-06	female	Chu-ru	2519	none	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	208627301	Nhân viên trợ lý văn phòng	01020101
45750	Nguyễn Anh Kiệt	1977-12-05	male	Kinh (Việt)	2519	primary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	204385401	Nhân viên trợ lý văn phòng	01020101
45751	Nguyễn Quốc Bảo	1983-06-15	male	Kinh (Việt)	2519	secondary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	205405701	Lao động giản đơn	01020101
45752	Hồ Thiên Bảo Ngọc	2020-02-14	female	Kinh (Việt)	2519	None	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động thủ công và các nghề nghiệp có liên quan khác	01020101
45753	Khấu Ngọc Anh Thư	1999-06-11	female	Kinh (Việt)	2519		Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	206265501	Lao động giản đơn	01020101
45754	Nguyễn Ngọc Thủy Trang	2021-03-18	female	Kinh (Việt)	2519	None	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020101
45755	Nguyễn Thị Hoàng Oanh	1982-10-15	female	Gié-Triêng	2519	primary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	205625201	Nhân viên dịch vụ và bán hàng	01020101
45756	Nguyễn Thanh Trí	1969-06-16	male	Kinh (Việt)	2519	primary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	205941501	Lao động giản đơn	01020101
45757	Trần Châu Gia Bảo	1995-03-02	male	Kinh (Việt)	2519	primary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	206017301	Lao động thủ công và các nghề nghiệp có liên quan khác	01020101
45758	Nguyễn Hoàng Anh	2017-10-03	female	Kinh (Việt)	2519	None	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020101
45759	Nguyễn Thị Bích Ngọc	2012-10-07	female	Kinh (Việt)	2519	None	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020101
45760	Huỳnh Quỳnh Anh	1976-08-30	female	Kinh (Việt)	2519		Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	200504801	Nhân viên trợ lý văn phòng	01020101
45761	Nguyễn Hoàng Đăng Khoa	2011-10-10	male	Kinh (Việt)	2519	primary	Tin lành	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Tự do	01020101
45762	Nguyễn Hồng Kỳ Duyên	1987-12-31	female	Kinh (Việt)	2519	none	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202684601	Lao động giản đơn	01020101
45763	Tôn Nguyễn Mai Khanh	2014-08-21	female	Ba-na	2519	None	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020101
45764	Huỳnh Thị Phương Trâm	1975-08-29	female	Kinh (Việt)	2519	university	Hồi giáo	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	207360801	Lao động giản đơn	01020101
45765	Nguyễn Đăng Khoa	1995-07-04	male	Kinh (Việt)	2519	primary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	203211001	Nhân viên trợ lý văn phòng	01020101
45766	Đặng Vĩnh Phát	1956-12-25	male	Kinh (Việt)	2519	secondary	Không	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	204710001	Lao động giản đơn	01020101
45767	Trần Diễm Thy	1997-06-15	female	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	203310301	Lao động giản đơn	01020102
45768	Lê Hồ Minh Duy	2013-08-29	male	Kinh (Việt)	2520	None	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020102
45769	Lê Gia Huynh	1996-10-09	male	Kinh (Việt)	2520	high	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	207120701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020102
45770	Lê Bảo Trân	1966-11-25	female	Kinh (Việt)	2520	secondary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	200659501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01020102
45771	Từ Trung Tín	1971-09-19	male	Khơ-me	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	201019801	Lao động giản đơn	01020102
45772	Phạm Nguyễn Thảo Quỳnh	1991-09-08	female	Kinh (Việt)	2520		Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202225401	Lao động giản đơn	01020102
45773	Dương Đức Huy	1998-02-28	male	Kinh (Việt)	2520		Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	208554501	Lao động giản đơn	01020102
45774	Phún Phượng Thủy Tiên	1943-06-02	female	Kinh (Việt)	2520	none	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	206440101	Lao động giản đơn	01020102
45775	Đường Uyển Nhi	2005-12-11	female	Kinh (Việt)	2520	primary	Tin lành	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202548101	Lao động giản đơn	01020102
45776	Lương Hồng Vân	1979-04-15	female	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202620501	Nhà chuyên môn bậc cao (đại học trở lên)	01020102
45777	Đỗ Khánh Ngân	1983-10-02	female	Thái	2520	none	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	200415401	Lao động giản đơn	01020102
45778	Lý Đức Phúc	1977-08-02	male	Kinh (Việt)	2520	none	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	207777601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020102
45779	Lê Thanh Hiền	2007-08-23	male	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động thủ công và các nghề nghiệp có liên quan khác	01020102
45780	Nguyễn Minh Quân	1998-06-04	male	Kinh (Việt)	2520		Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	204402501	Lao động giản đơn	01020102
45781	Ong Phước Thiện	2012-09-03	male	Kinh (Việt)	2520	None	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01020102
45782	Tô Thanh Toàn	1973-04-22	male	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	202291901	Lao động giản đơn	01020102
45783	Lê Nguyễn Kim Ngân	2013-03-26	female	Kinh (Việt)	2520	None	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020102
45784	Lê Thế Cường	1961-02-09	male	Kinh (Việt)	2520	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	207860001	Lao động giản đơn	01020102
45785	Đoàn Nguyệt Hà	2005-01-09	female	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	203087201	Lao động giản đơn	01020102
45786	Nguyễn Thị Ngọc Linh	1995-10-13	female	Kinh (Việt)	2520	primary	Không	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Phúc Tân Quận Hoàn Kiếm Thành phố Hà Nội	206740501	Lao động giản đơn	01020102
45787	Tô Quốc Khang	1946-03-10	male	Kinh (Việt)	2522	none	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	200298501	Lao động giản đơn	01020201
45788	Lê Linh Đan	2019-10-10	female	Kinh (Việt)	2522	None	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01020201
45789	Đặng Trọng Đông	2007-09-18	male	Kinh (Việt)	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020201
45790	Trần Ngọc Anh Thư	1969-09-10	female	Kinh (Việt)	2522	none	Minh Sư đạo	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	200828401	Lao động giản đơn	01020201
45791	Tào Quỳnh Anh	1995-02-23	female	Khơ-me	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	203264301	Lao động giản đơn	01020201
45792	Trương Thị Mỹ Duyên	1973-04-26	female	Kinh (Việt)	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208532801	Nhân viên trợ lý văn phòng	01020201
45793	Ngô Hoàng Khang	1988-09-19	male	Kinh (Việt)	2522	secondary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208802501	Lao động giản đơn	01020201
45794	Giang Thị Thanh Thúy	1969-07-28	female	Thái	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	204163801	Lao động giản đơn	01020201
45795	Huỳnh Lộc Nhân	1970-04-05	male	Kinh (Việt)	2522	none	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205170001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020201
45796	Hà Nguyên Khang	2020-11-19	male	Kinh (Việt)	2522	None	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01020201
45797	Bạch Lê Duy Bằng	2016-11-24	male	Kinh (Việt)	2522	None	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01020201
45798	Nguyễn Thanh Mai	2007-01-17	female	Kinh (Việt)	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020201
45799	Lê Trần Khánh Linh	2004-11-01	female	Brâu	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	207254401	Lao động giản đơn	01020201
45800	Lý Đăng Khoa	1978-02-20	male	Kinh (Việt)	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	202535901	Lao động giản đơn	01020201
45801	Tạ Thị Thanh Nhi	1987-03-14	female	Kinh (Việt)	2522	primary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208709001	Lao động giản đơn	01020201
45802	Lê Thị Hoài Linh	2001-01-23	female	Kinh (Việt)	2522		Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	202322601	Lao động giản đơn	01020201
45803	Lê Phát Đạt	1996-03-31	male	Kinh (Việt)	2522	high	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	207132901	Thợ lắp ráp và vận hành máy móc, thiết bị	01020201
45804	Phan Trọng Thịnh	1979-12-12	male	Kinh (Việt)	2522	none	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205562001	Lao động giản đơn	01020201
45805	Đặng Dương Khang	2015-06-14	male	Kinh (Việt)	2522	None	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01020201
45806	Nguyễn Triều Sủng	1975-09-28	male	Kinh (Việt)	2522	secondary	Không	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205480301	Lao động thủ công và các nghề nghiệp có liên quan khác	01020201
45807	Đặng Thanh Thảo	1990-12-22	female	Kinh (Việt)	2523	primary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205920501	Lao động giản đơn	01020202
45808	Đinh Thị Kim Ngọc	1958-10-08	female	Kinh (Việt)	2523	primary	Cao đài	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	207266701	Thợ lắp ráp và vận hành máy móc, thiết bị	01020202
45809	Hồ Thanh Thảo	1961-12-25	female	Kinh (Việt)	2523	none	Minh Sư đạo	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	202166601	Lao động giản đơn	01020202
45810	Trần Thị Kim Xuân	2005-02-04	female	Kinh (Việt)	2523	primary	Bà-la-môn giáo	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208508501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020202
45811	Nguyễn Đức Phong	2021-02-07	male	Kinh (Việt)	2523	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020202
45812	Nguyễn Thị Ai	2002-09-18	female	Kinh (Việt)	2523		Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205065301	Lao động giản đơn	01020202
45813	Hồ Trần Duy	1930-06-24	male	Kinh (Việt)	2523	primary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	201826601	Nhân viên dịch vụ và bán hàng	01020202
45814	Lý Ngọc Gia Huy	2001-12-12	male	Kinh (Việt)	2523		Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205568801	Nhà chuyên môn bậc cao (đại học trở lên)	01020202
45815	Lê Đình Bảo Trân	1970-08-23	female	Kinh (Việt)	2523	none	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208903901	Lao động giản đơn	01020202
45816	Phạm Thị Thu Trang	1985-07-04	female	Kinh (Việt)	2523	none	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	206194101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020202
45817	Phan Gia Nghi	1974-02-08	female	Kinh (Việt)	2523	primary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	205319901	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020202
45818	Vũ Hoàng Sang	1981-12-08	male	Kinh (Việt)	2523	secondary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	203984801	Thợ lắp ráp và vận hành máy móc, thiết bị	01020202
45819	Nguyễn Ngọc Minh Châu	1982-10-25	female	Tày	2523	none	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	208684901	Nhân viên dịch vụ và bán hàng	01020202
45820	Lương Ngọc Hà	2019-06-16	female	Kinh (Việt)	2523	None	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020202
45821	Nguyễn Ngọc Thanh Trúc	2002-06-05	female	Kinh (Việt)	2523		Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	204786401	Lao động giản đơn	01020202
45822	Lương Đặng Minh Như	1948-05-17	female	Kinh (Việt)	2523	secondary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	204766901	Nhân viên dịch vụ và bán hàng	01020202
45823	Võ Hữu Trọng	1975-09-12	male	Kháng	2523	high	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	201205401	Lao động thủ công và các nghề nghiệp có liên quan khác	01020202
45824	Đào Thị Phương	1966-06-24	female	Kinh (Việt)	2523	university	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	207322901	Nhân viên trợ lý văn phòng	01020202
45825	Trần Tuấn Anh	2007-02-08	male	Kinh (Việt)	2523	primary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020202
45826	Bùi Mạnh Lâm	1996-10-30	male	Kinh (Việt)	2523	primary	Không	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Đồng Xuân Quận Hoàn Kiếm Thành phố Hà Nội	203334601	Lao động giản đơn	01020202
45827	Nguyễn Minh Huy	1940-02-11	male	Kinh (Việt)	2525	none	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204368101	Lao động giản đơn	01020301
45828	Văng Xuân Trang	2005-07-28	female	Gié-Triêng	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206194701	Nhân viên trợ lý văn phòng	01020301
45829	Nguyễn Ngọc Ánh Tuyết	1934-11-15	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206450201	Lao động giản đơn	01020301
45830	Phạm Thục Mẫn	1996-10-17	female	Kinh (Việt)	2525	high	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201897301	Lao động giản đơn	01020301
45831	Nguyễn Văn Hưng	1960-02-10	male	Kinh (Việt)	2525	none	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201586001	Lao động thủ công và các nghề nghiệp có liên quan khác	01020301
45832	Trần Thùy Cát Tiên	2013-10-14	female	Kinh (Việt)	2525	None	Công giáo	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01020301
45833	Lê Thị Hồng Nhung	2014-07-20	female	Kinh (Việt)	2525	None	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Lực lượng vũ trang	01020301
45834	Trần Thị Như Ý	1995-10-04	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	208214601	Tự do	01020301
45835	Nguyễn Minh Thắng	1986-11-16	male	Kinh (Việt)	2525	none	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	203436901	Nhân viên trợ lý văn phòng	01020301
45836	Nguyễn Trần Minh Khuê	1959-07-25	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201701001	Lao động giản đơn	01020301
45837	Trương Nhật Nam	1977-09-05	male	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201486501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020301
45838	Lê Nguyễn Hồng Anh	1923-03-14	female	Kinh (Việt)	2525	high	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	200842501	Lao động giản đơn	01020301
45839	Lý Gia Phát	1959-06-12	male	Tày	2525	secondary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206610701	Lao động giản đơn	01020301
45840	Lưu Hoàng Lân	1984-12-16	male	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204389901	Thợ lắp ráp và vận hành máy móc, thiết bị	01020301
45841	Nguyễn Ngọc Thúy Vy	1965-09-04	female	Kinh (Việt)	2525	primary	Công giáo	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	205611601	Tự do	01020301
45842	Lê Duy Minh	2013-12-28	male	Kinh (Việt)	2525	None	Bà-la-môn giáo	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Lực lượng vũ trang	01020301
45843	Phạm Bảo Trân	1994-05-31	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204335501	Lực lượng vũ trang	01020301
45844	Bùi Minh Thư	2011-10-23	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01020301
45845	Nguyễn Thị Thùy Dương	1984-09-30	female	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	208231201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020301
45846	Nguyễn Quang Huy	1923-10-25	male	Kinh (Việt)	2525	primary	Không	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 1 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206297101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020301
45847	Huỳnh Phương Nam	2005-10-20	male	Kinh (Việt)	2526	primary	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201177001	Nhân viên dịch vụ và bán hàng	01020302
45848	Nguyễn Thị Thanh Thảo	1971-11-12	female	Kinh (Việt)	2526	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206812301	Lao động giản đơn	01020302
45849	Nguyễn Quang Thanh Thúy	2000-06-24	female	Kinh (Việt)	2526		Bửu Sơn Kỳ Hương	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	202502301	Lao động giản đơn	01020302
45850	Bùi Vũ Phú Khang	1990-06-24	male	Kinh (Việt)	2526	none	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204554801	Lao động giản đơn	01020302
45851	Vương Ngọc Quỳnh Anh	2014-07-04	female	Khơ-me	2526	None	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020302
45852	Trần Phạm Tiến Hậu	1993-09-03	male	Kinh (Việt)	2526	primary	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204204101	Lao động giản đơn	01020302
45853	Trần Hoài Phúc	1967-03-31	male	Kinh (Việt)	2526	none	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	202153001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020302
45854	Chang Hồ Gia Huy	2009-01-31	male	Kinh (Việt)	2526	primary	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01020302
45855	Phan Trần Dạ Thảo	1981-02-26	female	Kinh (Việt)	2526	none	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	205182501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01020302
45856	Trần Hoàng Phương Linh	1943-06-26	female	Kinh (Việt)	2526	none	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	203103901	Lao động giản đơn	01020302
45857	Đoàn Thanh Ngân	1980-02-04	female	Kinh (Việt)	2526	none	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	204439201	Lao động giản đơn	01020302
45858	Trần Thị Thanh Thủy	1964-03-25	female	Kinh (Việt)	2526	none	Baha'I	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	202784201	Lao động giản đơn	01020302
45859	Nguyễn Minh Huân	1991-06-10	male	Kinh (Việt)	2526		Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	202598201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01020302
45860	Đặng Thủ Khoa	1994-11-20	male	Kinh (Việt)	2526	primary	Cao đài	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	208698601	Nhân viên dịch vụ và bán hàng	01020302
45861	Nguyễn Minh Phúc	2015-10-29	male	Kinh (Việt)	2526	None	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01020302
45862	Mạch Bội Nhi	1987-06-07	female	Tà-ôi	2526	primary	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	206602201	Tự do	01020302
45863	Nguyễn Quang Huy	1963-06-21	male	Kinh (Việt)	2526	none	Bà-la-môn giáo	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	200919101	Tự do	01020302
45864	Nguyễn Quốc Toàn	1987-04-01	male	Kinh (Việt)	2526	high	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	201799201	Tự do	01020302
45865	Nguyễn Thị Kỳ Anh	2013-06-25	female	Kinh (Việt)	2526	None	Minh Sư đạo	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội		Lao động giản đơn	01020302
45866	Nguyễn Thảo Hà	2005-12-12	female	Kinh (Việt)	2526	primary	Không	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	Thôn 2 Phường Hàng Mã Quận Hoàn Kiếm Thành phố Hà Nội	202528901	Tự do	01020302
45867	Phan Ngọc Trương Ái My	1994-01-01	female	Kinh (Việt)	2529	secondary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	204823001	Lực lượng vũ trang	01030101
45868	Trần Gia Hân	1994-02-26	female	Khơ-me	2529	secondary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	202695401	Lao động giản đơn	01030101
45869	Nguyễn Minh Ngọc	2018-05-05	female	Kinh (Việt)	2529	None	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030101
45870	Trần Nguyễn Bảo Hưng	1972-01-25	male	Kinh (Việt)	2529	primary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200017301	Thợ lắp ráp và vận hành máy móc, thiết bị	01030101
45871	Hồ Minh Đăng	1960-11-09	male	Kinh (Việt)	2529	high	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200683701	Lao động giản đơn	01030101
45872	Nguyễn Hoàng Tấn Đạt	1985-12-02	male	Kinh (Việt)	2529	primary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	207678001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01030101
45873	Nguyễn Thanh Tùng	1976-07-10	male	Kinh (Việt)	2529		Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	205981501	Lao động giản đơn	01030101
45874	Lê Đức Thịnh	1990-01-14	male	Kinh (Việt)	2529	secondary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	202911701	Lao động giản đơn	01030101
45875	Phạm Nguyễn Anh Thư	2017-12-11	female	Kinh (Việt)	2529	None	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030101
45876	Trần Thiên Phúc	1973-02-17	male	Kinh (Việt)	2529	none	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	205197301	Thợ lắp ráp và vận hành máy móc, thiết bị	01030101
45877	Lê Minh Quân	1994-05-09	male	Kinh (Việt)	2529	secondary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	207928301	Lao động thủ công và các nghề nghiệp có liên quan khác	01030101
45878	Mai Thị Vân Khánh	1976-12-08	female	Kinh (Việt)	2529		Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200181801	Lao động giản đơn	01030101
45879	Trần Thị Cẩm Tiên	2006-11-23	female	Kinh (Việt)	2529	primary	Cơ đốc Phục lâm	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030101
45880	Nguyễn Ngọc Đổ Quyên	1969-02-02	female	Chăm (Chàm)	2529	none	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	201339901	Nhân viên dịch vụ và bán hàng	01030101
45881	Nguyễn Uy Bình	1959-06-29	male	Kinh (Việt)	2529	none	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	208748401	Lao động giản đơn	01030101
45882	Trương Vi Long	1973-03-12	male	Kinh (Việt)	2529	none	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	206093501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030101
45883	Lê Trần Tú Uyên	1985-09-22	female	Kinh (Việt)	2529	none	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	203902501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01030101
45884	Ninh Song Hiệp	1956-11-07	male	Kinh (Việt)	2529	primary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	207700501	Lao động thủ công và các nghề nghiệp có liên quan khác	01030101
45885	Nguyễn Trần Thu Hương	1978-10-22	female	Kinh (Việt)	2529	primary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	205571501	Thợ lắp ráp và vận hành máy móc, thiết bị	01030101
45886	Mã Khánh Linh	2010-09-15	female	Kinh (Việt)	2529	primary	Không	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội		Thợ lắp ráp và vận hành máy móc, thiết bị	01030101
45887	Lê Vũ Mai Thy	2002-07-05	female	Kinh (Việt)	2530		Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200260501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01030102
45888	Phạm Ngọc Đoan Trang	1983-03-31	female	Xtiêng	2530	high	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	204332801	Lao động giản đơn	01030102
45889	Trương Trần Anh Khuê	1979-03-20	male	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	201588801	Thợ lắp ráp và vận hành máy móc, thiết bị	01030102
45890	Lê Thành Đạt	1999-11-13	male	Tày	2530		Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	208536001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030102
45891	Nguyễn Thị Hồng Ngọc	1963-11-18	female	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	205166101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01030102
45892	Nguyễn Huỳnh Hải Long	2015-04-04	male	Lự	2530	None	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội		Nhà chuyên môn bậc cao (đại học trở lên)	01030102
45893	Vũ Trần Hoài An	1972-02-09	female	Kinh (Việt)	2530	none	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	201521001	Lao động giản đơn	01030102
45894	Lê Ngọc Bích Trâm	1993-11-26	female	Kinh (Việt)	2530	high	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200266801	Lao động giản đơn	01030102
45895	Khưu Hoàng Thi	1964-08-08	female	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	201613101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01030102
45896	Đoàn Nhật Linh	1992-03-03	female	Kinh (Việt)	2530	primary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	203870001	Lao động giản đơn	01030102
45897	Lê Thúy Vy	1967-09-13	female	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	201450401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030102
45898	Nguyễn Thị Hiếu	1963-10-15	female	Kinh (Việt)	2530	secondary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	207689401	Lao động giản đơn	01030102
45899	Lê Tuyết Anh	1967-09-04	female	Kinh (Việt)	2530	none	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	203074101	Lao động giản đơn	01030102
45900	Ưng Thiện Khoa	1973-06-11	male	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	207521001	Lao động thủ công và các nghề nghiệp có liên quan khác	01030102
45901	Bùi Ngọc Phú	1980-10-25	male	Chu-ru	2530	none	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	206404101	Lao động giản đơn	01030102
45902	Trương Thanh Phong	1984-09-19	male	Kinh (Việt)	2530	none	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	204769801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030102
45903	Mai Tiến Phát	1989-03-03	male	Kinh (Việt)	2530	none	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200815501	Lao động thủ công và các nghề nghiệp có liên quan khác	01030102
45904	Phan Mỹ Trân	1993-01-07	female	Kinh (Việt)	2530	secondary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	200540901	Lao động giản đơn	01030102
45905	Phạm Nguyễn Tuấn Kiệt	1990-07-23	male	Kinh (Việt)	2530	primary	Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	203101601	Lực lượng vũ trang	01030102
45906	Âu Ngọc Hoàng	1999-09-26	male	Kinh (Việt)	2530		Không	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Phú Thượng Quận Tây Hồ Thành phố Hà Nội	205111001	Lao động giản đơn	01030102
45907	Nguyễn Thị Mỹ Kim	2018-10-21	female	Kinh (Việt)	2532	None	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030201
45908	Thiều Quang Khang	1991-02-08	male	Cống	2532		Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	206059501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	01030201
45909	Thái Hiếu Minh	1999-08-21	male	Kinh (Việt)	2532		Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	200804801	Nhà chuyên môn bậc cao (đại học trở lên)	01030201
45910	Khưu Thị Hoài Nhung	1989-03-11	female	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	208181101	Thợ lắp ráp và vận hành máy móc, thiết bị	01030201
45911	Trần Nguyễn Bảo Ngọc	1968-07-09	female	Kinh (Việt)	2532	none	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	201373501	Nhân viên trợ lý văn phòng	01030201
45912	Nguyễn Đăng Huy	1982-10-11	male	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	201413601	Lao động giản đơn	01030201
45913	Võ Ngọc Tuyết Trinh	1967-09-25	female	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	203575201	Lao động giản đơn	01030201
45914	Trần Chí Tường	2021-05-06	male	Kinh (Việt)	2532	None	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030201
45915	Hoàng Phương Nam	1975-02-27	male	Kinh (Việt)	2532	none	Bà-la-môn giáo	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	203223301	Lực lượng vũ trang	01030201
45916	Tôn Ngọc Thảo Nguyên	1995-03-05	female	Kinh (Việt)	2532	secondary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	207764001	Lực lượng vũ trang	01030201
45917	Hoàng Thị Huyền Trang	1965-10-31	female	Kinh (Việt)	2532	secondary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	203571501	Lao động giản đơn	01030201
45918	Lê Phương Thùy	2001-01-12	female	Kinh (Việt)	2532		Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	200775001	Lao động thủ công và các nghề nghiệp có liên quan khác	01030201
45919	Nguyễn Thị Ngọc Phượng	2011-09-22	female	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030201
45920	Vũ Trung Nguyên	2004-11-01	male	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	201000301	Lao động giản đơn	01030201
45921	Nguyễn Tấn Sang	1967-01-10	male	Kinh (Việt)	2532	none	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	208610101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030201
45922	Bùi Tường Thịnh Nguyên	1978-04-16	male	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	202646001	Lao động giản đơn	01030201
45923	Hồ Hùng Phúc	2018-02-28	male	Kinh (Việt)	2532	None	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội		Nhân viên dịch vụ và bán hàng	01030201
45924	Võ Ngọc Thủy Tiên	2004-10-06	female	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	205646501	Lao động giản đơn	01030201
45925	Hồng Trung Tín	1998-02-28	male	Bố Y	2532		Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	202504701	Lao động giản đơn	01030201
45926	Nguyễn Đức Hải	1988-06-30	male	Kinh (Việt)	2532	primary	Không	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	204743401	Lao động giản đơn	01030201
45927	Lê Lâm Tùng	1994-11-13	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	208667301	Lao động giản đơn	01030202
45928	Trần Bích Hà	2004-12-17	female	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	200613901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030202
45929	Trần Triệu Như	1934-04-11	female	Kinh (Việt)	2533	none	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	203237001	Lao động thủ công và các nghề nghiệp có liên quan khác	01030202
45930	Nguyễn Thành Luân	1958-09-18	male	Cơ-ho	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	207216201	Lao động giản đơn	01030202
45931	Lê Nguyễn Ngọc Duyên	1962-02-17	female	Kinh (Việt)	2533	none	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	204630801	Lao động giản đơn	01030202
45932	Lâm Minh Thắng	1938-08-21	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	203495701	Lao động giản đơn	01030202
45933	Đặng Kim Quang Minh	1972-03-10	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	205153601	Lao động giản đơn	01030202
45934	Phạm Hồng Phú Hưng	1988-03-05	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	205762701	Lao động giản đơn	01030202
45935	Lữ Trần Việt Đức	1944-11-09	male	Kinh (Việt)	2533	secondary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	208538801	Nhân viên trợ lý văn phòng	01030202
45936	Dương Thúy Vy	1991-11-17	female	Kinh (Việt)	2533		Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	206997501	Lực lượng vũ trang	01030202
45937	Trần Đỗ Gia Huy	1996-08-20	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	202601101	Nhân viên dịch vụ và bán hàng	01030202
45938	Nguyễn Hữu Duy	1941-04-12	male	Kinh (Việt)	2533	none	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	206901501	Lao động giản đơn	01030202
45939	Lê Thành Hoàng An	2000-08-25	male	Kinh (Việt)	2533		Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	200446101	Lao động giản đơn	01030202
45940	Huỳnh Như	2010-02-20	female	Kinh (Việt)	2533	primary	Minh Sư đạo	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01030202
45941	Huỳnh Thanh Phương	1975-05-28	female	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	204592301	Tự do	01030202
45942	Hồ Lý Anh Thư	1979-10-18	female	Kinh (Việt)	2533	secondary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	208396101	Nhà chuyên môn bậc cao (đại học trở lên)	01030202
45943	Huỳnh Lê Mạnh Tiến	1960-12-08	male	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	207242501	Lao động giản đơn	01030202
45944	Trần Phương Khang	2005-09-26	male	Kinh (Việt)	2533	secondary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	201697401	Tự do	01030202
45945	Trần Hồng Ngọc	1961-10-28	female	Kinh (Việt)	2533	primary	Không	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	202988301	Lao động thủ công và các nghề nghiệp có liên quan khác	01030202
45946	Lê Nguyễn Trường Giang	1961-11-16	male	Kinh (Việt)	2533	university	Mặc môn	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Nhật Tân Quận Tây Hồ Thành phố Hà Nội	204636301	Lao động giản đơn	01030202
45947	Đinh Quốc Cường	2005-09-27	male	Kinh (Việt)	2535	primary	Cơ đốc Phục lâm	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	204193201	Lao động giản đơn	01030301
45948	Nguyễn Lê Trí	2019-10-27	male	Kinh (Việt)	2535	None	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030301
45949	Nguyễn Thảo Nhi	1973-10-19	female	Nùng	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	203484901	Thợ lắp ráp và vận hành máy móc, thiết bị	01030301
45950	Nguyễn Hoàng Yến	2006-04-05	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01030301
45951	Nguyễn Thùy My	2019-09-17	female	Kinh (Việt)	2535	None	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động thủ công và các nghề nghiệp có liên quan khác	01030301
45952	Nguyễn Ngọc Nguyên	1967-03-24	male	Tày	2535	secondary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	201783301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030301
45953	Lưu Thị Quý Ly	1961-02-24	female	Kinh (Việt)	2535	secondary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	204568101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030301
45954	Phạm Chu Thông	2018-08-04	male	Kinh (Việt)	2535	None	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	01030301
45955	Phạm Văn Anh	2005-10-27	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	207081101	Nhà chuyên môn bậc cao (đại học trở lên)	01030301
45956	Trần Huỳnh Minh Tâm	2017-11-20	female	Co	2535	None	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Nhân viên trợ lý văn phòng	01030301
45957	Phạm Tiến Hưng	1969-12-19	male	Kinh (Việt)	2535	none	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	204650801	Lao động giản đơn	01030301
45958	Nguyễn Hoàng Khánh	1960-05-10	male	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	207122901	Lực lượng vũ trang	01030301
45959	Lê Nguyễn Khánh Ly	1996-05-16	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	208172501	Nhân viên trợ lý văn phòng	01030301
45960	Lê Thị Quyên	2003-09-05	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	204089201	Lao động giản đơn	01030301
45961	Trần Thị Gia Hân	1982-11-26	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	200284201	Lao động giản đơn	01030301
45962	Nguyễn Trần Thanh Ngân	2020-04-16	female	Kinh (Việt)	2535	None	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030301
45963	Phan Nguyễn Hoàng Hồng Ân	1963-06-26	female	Kinh (Việt)	2535	none	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	206363101	Lao động giản đơn	01030301
45964	Trần Khánh Nhi	1995-10-01	female	Kinh (Việt)	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	200581201	Lao động thủ công và các nghề nghiệp có liên quan khác	01030301
45965	Nguyễn Huy Hùng	1964-10-23	male	Kinh (Việt)	2535	none	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	207397901	Nhân viên trợ lý văn phòng	01030301
45966	Lê Ngọc Kim Ngân	2008-02-11	female	Khơ-me	2535	primary	Không	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 1 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030301
45967	Phạm Trần Khánh Uyên	1996-10-26	female	Kinh (Việt)	2536	primary	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202725501	Lao động giản đơn	01030302
45968	Phan Tấn Phương	1997-12-09	male	Kinh (Việt)	2536	secondary	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202444501	Lao động giản đơn	01030302
45969	Nguyễn Đình Tâm	1966-08-02	male	Kinh (Việt)	2536	none	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202661601	Lao động thủ công và các nghề nghiệp có liên quan khác	01030302
45970	Nguyễn Hữu Đạt	1985-06-04	male	Kinh (Việt)	2536	primary	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	200072001	Lao động giản đơn	01030302
45971	Lê Hoàng Thịnh	1965-02-08	male	Kinh (Việt)	2536	primary	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202781801	Lao động giản đơn	01030302
45972	Trần Phương Quỳnh	1983-11-21	female	Kinh (Việt)	2536	none	Phật giáo	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	208485701	Lao động giản đơn	01030302
45973	Trần Dương Phúc An	2007-12-19	male	Kinh (Việt)	2536	primary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030302
45974	Nguyễn Bùi Tú Uyên	1965-03-21	female	Kinh (Việt)	2536	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	207842101	Lao động giản đơn	01030302
45975	Võ Bình An	1991-11-27	male	Kinh (Việt)	2536		Công giáo	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	201954501	Lao động giản đơn	01030302
45976	Nguyễn Quốc Huy	2014-09-15	male	Kinh (Việt)	2536	None	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030302
45977	Đỗ Nhật Quang	1977-08-16	male	Kinh (Việt)	2536	none	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	208483601	Lao động thủ công và các nghề nghiệp có liên quan khác	01030302
45978	Trương Mỹ Tâm	2013-09-26	female	Kháng	2536	None	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030302
45979	Hoàng Đức Quốc	1975-12-11	male	Kinh (Việt)	2536	none	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	204718601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01030302
45980	Nguyễn Quỳnh Ngọc Trân	2019-06-26	female	Kinh (Việt)	2536	None	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Lao động giản đơn	01030302
45981	Nguyễn Minh Thuận	2009-12-05	male	Kinh (Việt)	2536	primary	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Tự do	01030302
45982	Trần Hồ Thanh Thảo	1973-02-09	female	Chơ-ro	2536	high	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	207041501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	01030302
45983	Đỗ Khánh Chi	1965-10-11	female	Khơ-me	2536	secondary	Phật giáo	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202928101	Lao động giản đơn	01030302
45984	Phan Nguyễn Thanh Minh	1960-07-05	male	Kinh (Việt)	2536	high	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	202746101	Lao động giản đơn	01030302
45985	Ngô Bảo Châu	1966-05-09	female	Kinh (Việt)	2536	secondary	Bửu Sơn Kỳ Hương	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	208224201	Tự do	01030302
45986	Nguyễn Thị Quỳnh Nhi	2014-10-08	female	Kinh (Việt)	2536	None	Không	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội	Thôn 2 Phường Tứ Liên Quận Tây Hồ Thành phố Hà Nội		Nhân viên dịch vụ và bán hàng	01030302
45987	Nguyễn Hoàng Duy	1966-12-18	male	Kinh (Việt)	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	206901301	Lao động giản đơn	02010101
45988	Nguyễn Hoàng Khánh Hà	1972-01-10	female	Kinh (Việt)	2540	none	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	200144101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010101
45989	Trần Thiện Thảo Vy	1981-09-12	female	Kinh (Việt)	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	201091701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010101
45990	Nguyễn Thị Tường Vy	1992-11-29	female	Kinh (Việt)	2540	secondary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	208420001	Lao động thủ công và các nghề nghiệp có liên quan khác	02010101
45991	Giáp Văn Hải	1958-07-24	male	Kinh (Việt)	2540	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203923901	Thợ lắp ráp và vận hành máy móc, thiết bị	02010101
45992	Trần Quang Khải	1959-10-20	male	Kinh (Việt)	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	201415501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02010101
45993	Phạm Diệu Thiên Hân	2016-09-24	female	Kinh (Việt)	2540	None	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010101
45994	Võ Ngọc Trâm	1974-04-27	female	Kinh (Việt)	2540	primary	Bửu Sơn Kỳ Hương	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	201444301	Lao động giản đơn	02010101
45995	Ngô Chí Bảo	2020-11-28	male	Gia-rai	2540	None	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010101
45996	Trương Thị Phương Huyền	1975-11-19	female	Kinh (Việt)	2540	none	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	206070701	Lao động giản đơn	02010101
45997	Đoàn Thị Ngọc Ánh	1992-11-20	female	Kinh (Việt)	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	208050001	Lao động giản đơn	02010101
45998	Nguyễn Hải Đăng	1964-08-19	male	Kinh (Việt)	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203278701	Lao động giản đơn	02010101
45999	Văn Hoàng Bội Quân	1993-09-24	female	Cống	2540	secondary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	205900101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010101
46000	Võ Huỳnh Phúc Hy	2012-01-12	male	Thái	2540	None	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Nhân viên trợ lý văn phòng	02010101
46001	Nguyễn Minh Nghiệm	2014-07-07	male	Kinh (Việt)	2540	None	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010101
46002	Lê Thị Bích Huyền	2002-11-07	female	Kinh (Việt)	2540		Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	207514201	Lực lượng vũ trang	02010101
46003	Nguyễn Xuân Bách	1993-07-06	male	Kinh (Việt)	2540	university	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	205078501	Thợ lắp ráp và vận hành máy móc, thiết bị	02010101
46004	Nguyễn Thị Ánh Vi	1981-04-21	female	Kinh (Việt)	2540	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203386201	Tự do	02010101
46005	Bùi Lý Thiên Kim	2003-04-12	female	Bố Y	2540	primary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	206544501	Nhà chuyên môn bậc cao (đại học trở lên)	02010101
46006	Phạm Doãn Hậu	1974-06-15	male	Kinh (Việt)	2540	secondary	Không	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203174201	Lực lượng vũ trang	02010101
46007	Nguyễn Trần Khôi Nguyên	1989-03-03	male	Kinh (Việt)	2541	primary	Bà-la-môn giáo	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	208367601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010102
46008	Nguyễn Thị Ngọc Trâm	1981-11-24	female	Kinh (Việt)	2541	high	Mặc môn	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	200161401	Lao động giản đơn	02010102
46009	Đặng Trần Vinh	1990-12-30	male	Kinh (Việt)	2541	none	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	200500701	Thợ lắp ráp và vận hành máy móc, thiết bị	02010102
46010	Nguyễn Ngọc Diệu Anh	1984-12-06	female	Kinh (Việt)	2541	primary	Bà-la-môn giáo	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	202375301	Lao động giản đơn	02010102
46011	Nguyễn Huỳnh Thu Trang	1972-04-20	female	Kinh (Việt)	2541	secondary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	205497701	Nhân viên trợ lý văn phòng	02010102
46012	Trương Minh Phát	1932-10-27	male	Kinh (Việt)	2541	none	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	200585301	Lao động giản đơn	02010102
46013	Nguyễn Xuân Mai	2017-05-31	female	Kinh (Việt)	2541	None	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010102
46014	Phan Đoàn Tâm Như	2010-10-15	female	Kinh (Việt)	2541	primary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02010102
46015	Trần Lý Quốc Trung	2014-05-26	male	Kinh (Việt)	2541	None	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010102
46016	Trần Thị Ngọc Hà	1987-05-12	female	Khơ-mú	2541	primary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	202937701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010102
46017	Nguyễn Ngọc Thanh Hằng	2007-02-04	female	Kinh (Việt)	2541	primary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010102
46018	Nguyễn Thị Hồng Thủy	1975-10-15	female	Kinh (Việt)	2541	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	206338401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010102
46019	Huỳnh Quí Hồng	1960-10-11	female	Kinh (Việt)	2541	secondary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	206050201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010102
46020	Lâm Gia Thuận	1971-12-24	male	Kinh (Việt)	2541	university	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	200773901	Lực lượng vũ trang	02010102
46021	Trần Quang Dũng	1999-09-05	male	Tày	2541		Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203650501	Lao động giản đơn	02010102
46022	Nguyễn Hoàng Phúc	1987-02-19	male	Kinh (Việt)	2541	none	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203978601	Lao động giản đơn	02010102
46023	Nguyễn Thị Kim Ngọc	1970-02-07	female	Kinh (Việt)	2541	none	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	203674901	Lao động giản đơn	02010102
46024	Trần Doãn Hải Phong	1974-03-18	male	Mnông	2541	primary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	202151801	Lao động giản đơn	02010102
46025	Trần Tấn Lộc	2007-11-29	male	Kinh (Việt)	2541	primary	Mặc môn	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Nhân viên dịch vụ và bán hàng	02010102
46026	Lý Kim Thanh	2007-04-13	female	La Hủ	2541	primary	Không	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Quang Trung Thành phố Hà Giang Tỉnh Hà Giang		Tự do	02010102
46027	Phan Phương Nga	1989-05-18	female	Kinh (Việt)	2543	none	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207738701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02010201
46028	Đặng Thị Minh Thư	2019-12-03	female	Mạ	2543	None	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010201
46029	Nguyễn Minh Anh	1995-07-12	female	Kinh (Việt)	2543	secondary	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	202920101	Lao động giản đơn	02010201
46030	Phạm Bích Hồng	1996-07-18	female	Ra-glai	2543	primary	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	201332101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010201
46031	Phạm Nguyễn Phương Đông	1976-06-15	male	Kinh (Việt)	2543		Tin lành	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	208538201	Thợ lắp ráp và vận hành máy móc, thiết bị	02010201
46032	Nguyễn Thị Ngọc Hân	2002-12-07	female	Kháng	2543		Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	201838301	Lao động giản đơn	02010201
46033	Trương Hiền Vy	2020-12-01	female	Kinh (Việt)	2543	None	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02010201
46034	Nguyễn Duy Hào	1985-11-13	male	Kinh (Việt)	2543	university	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	200145801	Lao động giản đơn	02010201
46035	Nguyễn Phúc Thảo Nguyên	1984-03-17	female	Kinh (Việt)	2543	primary	Cao đài	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207556901	Lao động giản đơn	02010201
46036	Đặng Thị Hoàng Linh	1976-11-28	female	Kinh (Việt)	2543		Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	202020201	Lao động giản đơn	02010201
46037	Cao Ngọc Anh Tuấn	2002-04-26	male	Kinh (Việt)	2543		Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207247401	Lao động thủ công và các nghề nghiệp có liên quan khác	02010201
46038	Giang Bảo Nhi	1971-01-17	female	Kinh (Việt)	2543	high	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	202345001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010201
46039	Nguyễn Văn Đức	1966-07-01	male	Kinh (Việt)	2543	primary	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	208061601	Lao động giản đơn	02010201
46040	Nguyễn Hữu Thành	1968-07-12	male	Kinh (Việt)	2543	none	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	200823701	Lao động giản đơn	02010201
46041	Lê Trần Hồng Ngọc	2013-03-07	female	Kinh (Việt)	2543	None	Công giáo	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010201
46042	Trịnh Gia Anh	2007-08-09	male	Kinh (Việt)	2543	primary	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02010201
46043	Phạm Nguyễn Trọng Nghĩa	1966-07-10	male	Kinh (Việt)	2543	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207740101	Lao động thủ công và các nghề nghiệp có liên quan khác	02010201
46044	Nguyễn Thị Hồng Nhung	2013-06-06	female	Kinh (Việt)	2543	None	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010201
46045	Trần Nguyễn Thanh Bình	1965-09-10	male	Kinh (Việt)	2543	none	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	204499001	Lao động giản đơn	02010201
46046	Huỳnh Tấn Đạt	2004-12-07	male	Kinh (Việt)	2543	primary	Không	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	200911301	Tự do	02010201
46047	Lê Thị Huỳnh Như	1974-04-17	female	Tày	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	201429401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02010202
46048	Nguyễn Tuấn Đạt	2001-09-19	male	Kinh (Việt)	2544		Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	204310401	Thợ lắp ráp và vận hành máy móc, thiết bị	02010202
46049	Nguyễn Minh Tuyết	1960-08-19	female	Hà nhì	2544	secondary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207059301	Nhà chuyên môn bậc cao (đại học trở lên)	02010202
46050	Bùi Quốc Trung	1993-09-27	male	Kinh (Việt)	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	201348001	Lao động giản đơn	02010202
46051	Bạch Thiện Nhân	2015-01-31	male	Kinh (Việt)	2544	None	Phật giáo	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lực lượng vũ trang	02010202
46052	Đỗ Phạm Thanh Vy	2009-09-11	female	Tày	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010202
46053	Nguyễn Duy Minh Phương	1990-03-08	female	Kinh (Việt)	2544	none	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	205473701	Lao động giản đơn	02010202
46054	Sar La Vi	1980-10-14	male	Kinh (Việt)	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	203903101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02010202
46055	Nguyễn Minh Nhựt	1986-09-30	male	Kinh (Việt)	2544	high	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	200422701	Lực lượng vũ trang	02010202
46056	Vũ Ngọc Hương Xuân	2004-08-11	female	Kinh (Việt)	2544	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207315601	Nhân viên trợ lý văn phòng	02010202
46057	Đinh Quốc An	1979-04-11	male	Kinh (Việt)	2544	secondary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	205661201	Nhân viên trợ lý văn phòng	02010202
46058	Lê Thị Hồng Phương	1984-09-24	female	Kinh (Việt)	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	203825201	Lao động giản đơn	02010202
46059	Nguyễn Thụy Khánh An	2021-11-30	female	Kinh (Việt)	2544	None	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010202
46060	Hứa Trung Hiếu	1972-06-28	male	Kinh (Việt)	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	206698701	Lao động giản đơn	02010202
46061	Nguyễn Lâm Nhật Hào	2004-11-21	male	La Hủ	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	204067901	Nhân viên dịch vụ và bán hàng	02010202
46062	Phạm Phan Trâm Anh	1985-01-04	female	Kinh (Việt)	2544	secondary	Cơ đốc Phục lâm	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	200448901	Lao động giản đơn	02010202
46063	Phạm Nhật Minh	2018-05-29	male	Kinh (Việt)	2544	None	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010202
46064	Lê Cam Tuấn Khang	1964-01-06	male	Kinh (Việt)	2544	none	Hồi giáo	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	205288901	Lao động giản đơn	02010202
46065	Trần Tô Đức Phúc	1984-08-16	male	Kinh (Việt)	2544	primary	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	207286001	Lao động giản đơn	02010202
46066	Phạm Văn Nguyễn	2019-08-01	male	Kinh (Việt)	2544	None	Không	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Trần Phú Thành phố Hà Giang Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02010202
46067	Nguyễn Tiên Phong	1985-02-04	male	Kinh (Việt)	2546	primary	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	206255901	Nhân viên dịch vụ và bán hàng	02010301
46068	Lưu Minh Phát	2012-10-30	male	Kinh (Việt)	2546	None	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lực lượng vũ trang	02010301
46069	Hà Thị Huyền Sương	2008-03-02	female	Kinh (Việt)	2546	primary	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02010301
46070	Phạm Nguyễn Kim Thanh	1962-05-22	female	Kinh (Việt)	2546	primary	Công giáo	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	202776401	Lao động giản đơn	02010301
46071	Đinh Hoàng Vũ Nhiên	1945-09-19	female	Kinh (Việt)	2546	none	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	202144801	Lao động giản đơn	02010301
46072	Hậu Tuyết Dinh	2019-06-22	female	Hrê	2546	None	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010301
46073	Nguyễn Thị Tiên Tiên	2020-12-15	female	Kinh (Việt)	2546	None	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Nhân viên trợ lý văn phòng	02010301
46074	Nguyễn Cẩm Vy	1962-08-07	female	Kinh (Việt)	2546	secondary	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	206870001	Lực lượng vũ trang	02010301
46075	Âu Dương Phú	1973-06-10	male	Kinh (Việt)	2546	secondary	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	206141301	Lao động giản đơn	02010301
46076	Cao Hoàng Minh Thư	1986-07-28	female	Kinh (Việt)	2546	primary	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	203994201	Lao động giản đơn	02010301
46077	Nguyễn Hải Nam	1961-08-18	male	Cơ-tu	2546	primary	Công giáo	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	203421201	Lao động giản đơn	02010301
46078	Cao Võ Bảo Ngọc	2004-09-12	female	Rơ-măm	2546	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	204827501	Lao động giản đơn	02010301
46079	Trần Thanh Thế Hào	1959-07-14	male	Kinh (Việt)	2546	none	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	203924901	Lao động giản đơn	02010301
46080	Võ Ngọc Ánh Nguyên	1972-03-30	female	Kinh (Việt)	2546	none	Phật giáo Hòa Hảo	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	202754101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010301
46081	Trần Cao Minh Triết	1983-08-07	male	Kinh (Việt)	2546	high	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	205501301	Lao động giản đơn	02010301
46082	Văn Thị Minh Thư	1989-04-14	female	Kinh (Việt)	2546	high	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	208032601	Lao động giản đơn	02010301
46083	Lê Công Sanh	1999-06-30	male	Kinh (Việt)	2546		Cao đài	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	205560401	Lao động giản đơn	02010301
46084	Đào Phương Ngọc Ngân	1999-08-28	female	Kinh (Việt)	2546		Mặc môn	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	200572301	Lao động giản đơn	02010301
46085	Nguyễn Đức Nam	2014-08-28	male	Kinh (Việt)	2546	None	Không	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010301
46086	Hà Thu Phương Thảo	1986-09-23	female	Chăm (Chàm)	2546	primary	Hồi giáo	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 1 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	205921001	Lao động giản đơn	02010301
46087	Nguyễn Hùng Thắng	1982-09-07	male	Kinh (Việt)	2547	none	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	202167301	Lao động giản đơn	02010302
46088	Đoàn Thị Mỹ Duyên	2010-03-19	female	Kinh (Việt)	2547	primary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010302
46089	Đinh Phạm Phương Nhi	2015-09-05	female	Kinh (Việt)	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46090	Nguyễn Quốc Huy	2018-04-02	male	Kinh (Việt)	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46091	Nguyễn Lê Khánh Duy	2019-03-23	male	Kinh (Việt)	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46092	Lê Minh Huy	1997-08-03	male	Kinh (Việt)	2547	secondary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	206529501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010302
46093	Nguyễn Văn Thiện	2012-03-11	male	Xinh-mun	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46094	Đoàn Nhật Phúc	1931-03-24	male	Kinh (Việt)	2547	primary	Bà-la-môn giáo	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	200586701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02010302
46095	Nguyễn Hoàng An	1996-11-28	male	Kinh (Việt)	2547	secondary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	208144001	Lao động giản đơn	02010302
46096	Đặng Công Minh	1998-05-03	male	Kinh (Việt)	2547		Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	202744501	Lao động giản đơn	02010302
46097	Trịnh Thị Hồng	2011-09-06	female	Kinh (Việt)	2547	primary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46098	Nguyễn Ngọc Lan Hương	2020-10-19	female	Mảng	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46099	Nguyễn Nhất Duy	2006-02-27	male	Kinh (Việt)	2547	primary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động giản đơn	02010302
46100	Chu Cao Quốc Bảo	2015-09-10	male	Kinh (Việt)	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02010302
46101	Võ Hoàng Anh	1959-02-27	male	Xtiêng	2547	none	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	208219801	Nhân viên dịch vụ và bán hàng	02010302
46102	Quách Viễn Thông	1994-02-07	male	Kinh (Việt)	2547	secondary	Cơ đốc Phục lâm	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	200653801	Lao động thủ công và các nghề nghiệp có liên quan khác	02010302
46103	Ngô Tấn Khánh	2014-10-16	male	Kinh (Việt)	2547	None	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02010302
46104	Mai Nguyễn Anh Thư	1963-11-25	female	Kinh (Việt)	2547	secondary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	203498201	Lao động giản đơn	02010302
46105	Võ Yên Thảo Nhi	1997-10-31	female	Tày	2547	primary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	208602701	Lao động giản đơn	02010302
46106	Nguyễn Thị Anh Thư	1959-05-26	female	Kinh (Việt)	2547	primary	Không	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	Thôn 2 Phường Ngọc Hà Thành phố Hà Giang Tỉnh Hà Giang	206836501	Lao động giản đơn	02010302
46107	Nguyễn Thanh Mai Ngân	1988-10-15	female	Kinh (Việt)	2550	primary	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207006901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020101
46108	Đặng Ngọc Xuân Như	1967-07-29	female	Kinh (Việt)	2550	none	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	200363801	Lao động giản đơn	02020101
46109	Phạm Thị Mai Trinh	1999-05-15	female	Kinh (Việt)	2550		Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	203575101	Lực lượng vũ trang	02020101
46110	Lê Hoài Nam	1989-10-27	male	Kinh (Việt)	2550	primary	Minh Sư đạo	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	203965901	Lao động giản đơn	02020101
46111	Trương Kim Thơ	1952-11-13	female	Kinh (Việt)	2550	none	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	204162401	Lao động giản đơn	02020101
46112	Dương Nhật Bằng	2003-03-24	male	Xinh-mun	2550	primary	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	205255701	Thợ lắp ráp và vận hành máy móc, thiết bị	02020101
46113	Nguyễn Thị Hồng Nhung	1986-04-09	female	Kinh (Việt)	2550	none	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	204707101	Tự do	02020101
46114	Nguyễn Đức Thắng	2012-01-16	male	Tày	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lực lượng vũ trang	02020101
46115	Tô Hồng Ngọc	2012-12-31	female	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020101
46116	Nguyễn Trần Thảo Vy	2012-09-10	female	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020101
46117	Hồng Tô Huệ Mẫn	2009-03-18	female	Kinh (Việt)	2550	primary	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020101
46118	Nguyễn Đào Bình Dương	1997-11-08	male	Kinh (Việt)	2550	primary	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	202186801	Lao động giản đơn	02020101
46119	Nguyễn Thu Uyên	1981-06-19	female	Kinh (Việt)	2550	high	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	203202401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020101
46120	Phạm Phú Sang	1984-07-14	male	Kinh (Việt)	2550	high	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	205637001	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020101
46121	Từ Thị Mỹ Hân	1988-08-14	female	Kinh (Việt)	2550	none	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207986801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020101
46122	Nguyễn Hoàng Trung	2012-11-27	male	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020101
46123	Đoàn Tiến Đạt	1981-04-11	male	Kinh (Việt)	2550	primary	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207387301	Tự do	02020101
46124	Dương Thanh Nhân	2019-11-25	male	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020101
46125	Phạm Văn Sỹ Thành	2021-11-05	male	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02020101
46126	Nguyễn Công Thành	2021-08-13	male	Kinh (Việt)	2550	None	Không	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020101
46127	Nguyễn Hoàng Phương Quyên	1971-02-07	female	Kinh (Việt)	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207786101	Lực lượng vũ trang	02020102
46128	Lê Bảo Trân	1981-08-12	female	Xơ-đăng	2551	high	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207454001	Lực lượng vũ trang	02020102
46129	Vũ Quang Vinh	1998-10-27	male	Kinh (Việt)	2551		Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	203387501	Lao động giản đơn	02020102
46130	Nguyễn Bá Mỹ Nhi	2021-05-28	female	Kinh (Việt)	2551	None	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020102
46131	Lê Trần Bảo Vy	2010-07-02	female	Ra-glai	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02020102
46132	Phạm Phước Nghĩa	1989-08-29	male	Kinh (Việt)	2551	secondary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	201782401	Thợ lắp ráp và vận hành máy móc, thiết bị	02020102
46133	Trần Thị Hồng Ngân	1971-09-10	female	Kinh (Việt)	2551	none	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	204761601	Thợ lắp ráp và vận hành máy móc, thiết bị	02020102
46134	Nguyễn Hoàng Bảo Nhi	1989-09-04	female	Kinh (Việt)	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	201183101	Lao động giản đơn	02020102
46135	Nguyễn Hoàn Thịnh	2008-07-20	male	Kinh (Việt)	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020102
46136	Đặng Văn Sang	2019-06-11	male	Kinh (Việt)	2551	None	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020102
46137	Lê Phạm Anh Quân	1966-05-25	male	Kinh (Việt)	2551	none	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	203052501	Tự do	02020102
46138	Nguyễn Duy Anh Khôi	1982-09-19	male	Kinh (Việt)	2551	secondary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	201886701	Lao động giản đơn	02020102
46139	Trần Phương Hòa	2006-09-09	male	Kinh (Việt)	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lực lượng vũ trang	02020102
46140	Nguyễn Thị Hồng Hạnh	2015-09-05	female	Kinh (Việt)	2551	None	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020102
46141	Phạm Thu Nhiên	1932-12-16	female	Kinh (Việt)	2551	primary	Công giáo	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	206419301	Lao động giản đơn	02020102
46142	Vương Đoan Thy	2021-03-09	female	Kinh (Việt)	2551	None	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020102
46143	Nguyễn Ngọc Mai Trang	2002-11-09	female	Kinh (Việt)	2551		Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	207617101	Lao động giản đơn	02020102
46144	La Đức Thắng	1994-07-19	male	Kinh (Việt)	2551	high	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	204999101	Thợ lắp ráp và vận hành máy móc, thiết bị	02020102
46145	Nguyễn Tuấn Anh	2019-02-18	male	Kinh (Việt)	2551	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020102
46146	Nguyễn Ngọc Anh Thơ	2008-07-13	female	Kinh (Việt)	2551	primary	Không	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Thị trấn Phó Bảng Huyện Đồng Văn Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020102
46147	Lý Kim Phụng	1978-11-22	female	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205896501	Nhân viên trợ lý văn phòng	02020201
46148	Mã Thành Nghĩa	1957-10-13	male	Chăm (Chàm)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200575001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020201
46149	Trần Tấn Tài	2006-10-24	male	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020201
46150	Võ Thị Anh Chi	2003-07-21	female	Thái	2553	high	Baha'I	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	203587801	Nhân viên dịch vụ và bán hàng	02020201
46151	Nguyễn Ngọc Kim Tuyền	1959-07-07	female	Thái	2553	none	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207839301	Lao động giản đơn	02020201
46152	Cao Văn Hiếu	1985-02-06	male	Kinh (Việt)	2553	primary	Cơ đốc Phục lâm	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200527701	Thợ lắp ráp và vận hành máy móc, thiết bị	02020201
46153	Đàm Thế Duy	2002-11-23	male	Tày	2553		Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	202587101	Thợ lắp ráp và vận hành máy móc, thiết bị	02020201
46154	Nguyễn Huy Hoàng	2009-09-18	male	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020201
46155	Bùi Ngọc Thùy Dương	2001-07-31	female	Kinh (Việt)	2553		Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207489901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020201
46156	Đỗ Nguyễn Trúc Anh	1973-09-30	female	Kinh (Việt)	2553	high	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	202576001	Lực lượng vũ trang	02020201
46157	Trần Hoàng Thiên Nghi	1948-06-15	female	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205834401	Thợ lắp ráp và vận hành máy móc, thiết bị	02020201
46158	Nguyễn Hải Đăng	2020-10-11	male	Kinh (Việt)	2553	None	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020201
46159	Võ Nguyễn Tuyết Nhi	1974-10-04	female	Kinh (Việt)	2553	none	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	206419101	Lao động giản đơn	02020201
46160	Tô Thị Thanh Tâm	1986-12-27	female	Kinh (Việt)	2553	high	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	201389001	Nhân viên dịch vụ và bán hàng	02020201
46161	Trần Châu Gia Thanh	1979-12-04	male	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	208854301	Lao động giản đơn	02020201
46162	Lê Hữu Toàn	1961-08-08	male	Co	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	201616701	Lao động giản đơn	02020201
46163	Trần Triệu Thiên	2007-11-28	male	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Tự do	02020201
46164	Nguyễn Bảo Trân	1997-09-08	female	Kinh (Việt)	2553	primary	Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	206644201	Lao động giản đơn	02020201
46165	Nguyễn Chánh Hưng	1991-03-23	male	Kinh (Việt)	2553		Không	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205286701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020201
46167	Nguyễn Văn Trọng	1987-06-04	male	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205381901	Lao động giản đơn	02020202
46168	Châu Gia Bảo	1991-04-12	male	Kinh (Việt)	2554		Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200845001	Thợ lắp ráp và vận hành máy móc, thiết bị	02020202
46169	Lê Quốc Thạnh	1994-11-10	male	Kinh (Việt)	2554	university	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	203435701	Lao động giản đơn	02020202
46170	Nguyễn Lê Bạch Dương	2021-04-15	female	Kinh (Việt)	2554	None	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020202
46171	Trần Lê Minh Trương	1978-10-26	male	Kinh (Việt)	2554	none	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	203506901	Nhà chuyên môn bậc cao (đại học trở lên)	02020202
46172	Lương Hải Long	1958-10-28	male	Thái	2554	secondary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205147501	Thợ lắp ráp và vận hành máy móc, thiết bị	02020202
46173	Nguyễn Quốc Cường	2002-10-22	male	Chăm (Chàm)	2554		Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200249501	Nhà chuyên môn bậc cao (đại học trở lên)	02020202
46174	Đinh Võ Bảo Ngọc	1983-11-20	female	Kinh (Việt)	2554	none	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200200901	Nhân viên dịch vụ và bán hàng	02020202
46175	Lý Nguyễn Hồng Ngọc	1969-08-18	female	Kinh (Việt)	2554	university	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200201401	Nhân viên trợ lý văn phòng	02020202
46176	Trịnh Hoàng Quân	2003-10-18	male	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	200042001	Nhà chuyên môn bậc cao (đại học trở lên)	02020202
46177	Nguyễn Minh Tấn	2010-12-14	male	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02020202
46178	Lê Ngọc Ân	1999-04-14	male	Kinh (Việt)	2554		Baha'I	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	203266801	Lực lượng vũ trang	02020202
46179	Nguyễn Minh Chiến	1936-08-13	male	Kinh (Việt)	2554	none	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	205689201	Nhà chuyên môn bậc cao (đại học trở lên)	02020202
46180	Trần Cẩm Huy	1988-10-06	male	Kinh (Việt)	2554	none	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	206055001	Lao động giản đơn	02020202
46181	Đặng Hà Đông Quân	1986-03-09	female	Kinh (Việt)	2554	none	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	201129801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020202
46182	Nguyễn Thị Hồng Phấn	1992-08-11	female	Tày	2554	high	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207922201	Lao động giản đơn	02020202
46183	Phạm Nguyễn Tuấn Kiệt	1974-11-20	male	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207206801	Lực lượng vũ trang	02020202
46184	Hồ Huệ Quân	1967-04-11	female	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207803101	Lao động giản đơn	02020202
46185	Đinh Trần Diễm My	1990-06-16	female	Kinh (Việt)	2554	primary	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	204758801	Nhà chuyên môn bậc cao (đại học trở lên)	02020202
46186	Nguyễn Minh Phước	1964-12-09	male	Kinh (Việt)	2554	none	Không	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Lũng Cú Huyện Đồng Văn Tỉnh Hà Giang	207029401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020202
46187	Hoàng Thị Ngọc Huyền	1973-01-25	female	Tày	2556	none	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	208447601	Lao động giản đơn	02020301
46188	Vũ Đức Huy	1964-04-06	male	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207707801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020301
46189	Võ Hoàng Thanh An	1974-11-21	female	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	202062501	Lao động giản đơn	02020301
46190	Vũ Như Quỳnh	1972-06-11	female	Kinh (Việt)	2556	none	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207589701	Nhân viên trợ lý văn phòng	02020301
46191	Nguyễn La Bảo Nhi	1964-11-18	female	Kinh (Việt)	2556	primary	Mặc môn	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	205619001	Lao động giản đơn	02020301
46192	Diệp Ngọc Lành	1993-02-26	female	Tày	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206736101	Lao động giản đơn	02020301
46193	Nguyễn Thụy Thanh Vy	1941-11-26	female	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	201355901	Lao động giản đơn	02020301
46194	Nguyễn Hào	1987-11-04	male	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	201836101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020301
46195	Nguyễn Khánh Đoan	1998-06-28	female	Kinh (Việt)	2556		Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	202935001	Lao động giản đơn	02020301
46196	Lê Trần Mỹ Duyên	1973-08-25	female	Kinh (Việt)	2556	secondary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207386401	Lao động giản đơn	02020301
46197	Trần Gia Hân	1999-08-27	female	Kinh (Việt)	2556		Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	203596701	Nhân viên dịch vụ và bán hàng	02020301
46198	Trần Anh Khoa	1924-07-24	male	Kinh (Việt)	2556	none	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	200303801	Lao động thủ công và các nghề nghiệp có liên quan khác	02020301
46199	Phan Bách Kiên	1996-09-27	male	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	205139601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020301
46200	Nguyễn Trọng Đoàn	1938-12-13	male	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	204634801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020301
46201	Đoàn Viết Anh Khoa	1984-02-19	male	Kinh (Việt)	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	205120101	Lao động giản đơn	02020301
46202	Vũ Thị Mai	2018-09-24	female	Kinh (Việt)	2556	None	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020301
46203	Trần Phối Phối	2008-10-15	female	Khơ-me	2556	primary	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020301
46204	Lai Quỳnh Anh	2018-09-11	female	Kinh (Việt)	2556	None	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020301
46205	Lưu Ánh Ngọc	1999-02-08	female	Kinh (Việt)	2556		Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207009801	Lao động giản đơn	02020301
46206	Phạm Đại Thành	1967-08-12	male	Kinh (Việt)	2556	none	Không	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 1 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	205214101	Lao động giản đơn	02020301
46207	Nguyễn Anh Thy	2016-02-26	female	Kinh (Việt)	2557	None	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020302
46208	Nguyễn Phạm Thùy Dương	1993-09-26	female	Khơ-mú	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	204507101	Lao động giản đơn	02020302
46209	Nguyễn Đình Thiên Long	1964-05-16	male	Kinh (Việt)	2557	none	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	200313101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020302
46210	Vòng Nhật Quang	1975-11-04	male	Kinh (Việt)	2557	none	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	203624101	Lao động giản đơn	02020302
46211	Huỳnh Gia Huy	2016-05-26	male	Kinh (Việt)	2557	None	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Nhà chuyên môn bậc cao (đại học trở lên)	02020302
46212	Nguyễn Thanh Tuyền	1977-08-30	female	Kinh (Việt)	2557	none	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206210101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02020302
46213	Huỳnh Tấn Phát	1965-09-10	male	Kinh (Việt)	2557	primary	Baha'I	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206610401	Lao động giản đơn	02020302
46214	Nghiêm Khánh Linh	1961-04-12	female	Mạ	2557	university	Phật giáo	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206966301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020302
46215	Đỗ Trọng Tấn	1980-10-14	male	Kinh (Việt)	2557	secondary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	202362401	Nhân viên dịch vụ và bán hàng	02020302
46216	Võ Thị Huyền Nga	1993-05-13	female	Kinh (Việt)	2557	high	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	203762901	Lao động giản đơn	02020302
46217	Vũ Nguyễn Kim Như	2000-01-12	female	Tà-ôi	2557		Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	201071601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02020302
46218	Lê Trọng Minh	2016-08-25	male	Kinh (Việt)	2557	None	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02020302
46219	Nguyễn Chan Như Ý	1990-04-09	female	Kinh (Việt)	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207002101	Lực lượng vũ trang	02020302
46220	Ngô Kim Dung	2019-11-10	female	Kinh (Việt)	2557	None	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lực lượng vũ trang	02020302
46221	Đỗ Kim Hoàng Anh	1931-12-11	female	Kinh (Việt)	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	202517201	Lao động giản đơn	02020302
46222	Trịnh Vũ Phát	2018-12-24	male	Tày	2557	None	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020302
46223	Nguyễn Thanh Thúy Hằng	2006-07-13	female	Giáy	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang		Lao động giản đơn	02020302
46224	Trương Kỳ Anh	1992-05-25	female	Kinh (Việt)	2557	secondary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206659401	Lao động giản đơn	02020302
46225	Ôn Uyển Nhàn	2004-04-24	female	Kinh (Việt)	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	206598701	Lực lượng vũ trang	02020302
46226	Hồ Võ Minh Thư	1977-09-12	female	Kinh (Việt)	2557	primary	Không	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	Thôn 2 Xã Má Lé Huyện Đồng Văn Tỉnh Hà Giang	207043701	Nhân viên dịch vụ và bán hàng	02020302
46227	Phạm Hưng Thịnh	2015-04-09	male	Kinh (Việt)	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030101
46228	Huỳnh Đoàn Tài	1992-07-26	male	Kinh (Việt)	2560	primary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	208633701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030101
46229	Hoàng Trần Thiên Hương	2021-06-28	female	Kinh (Việt)	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030101
46230	Huỳnh Minh Trí	1997-12-20	male	Kinh (Việt)	2560	secondary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	203063901	Tự do	02030101
46231	Mã Tuyết Kim Ngọc	1962-05-28	female	Kinh (Việt)	2560	university	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	202879401	Lao động giản đơn	02030101
46232	Trần Bảo Long	1959-01-16	male	Kinh (Việt)	2560	none	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	200411401	Lao động giản đơn	02030101
46233	Đoàn Lê Xuân Vy	2021-07-17	female	Kinh (Việt)	2560	None	Cao đài	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên dịch vụ và bán hàng	02030101
46234	Nguyễn Thị Xuân Hiền	2021-07-28	female	Tày	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030101
46235	Đặng Trần Hoàng Kiệt	1967-06-14	male	Kinh (Việt)	2560	secondary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	203535301	Lao động giản đơn	02030101
46236	Nguyễn Anh Quân	1996-12-05	male	Kinh (Việt)	2560	secondary	Minh Sư đạo	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	200943201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030101
46237	Nguyễn Trần Anh Thư	1970-07-17	female	Kinh (Việt)	2560	high	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	204613701	Lao động giản đơn	02030101
46238	Nguyễn Thị Hoài Trân	2014-10-25	female	Kinh (Việt)	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên trợ lý văn phòng	02030101
46239	Lý Đại Dũng	1989-09-04	male	Kinh (Việt)	2560	secondary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	200007601	Lao động giản đơn	02030101
46240	Nguyễn Đình Danh Bắc	2021-01-21	male	Kinh (Việt)	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030101
46241	Nguyễn Đình Khải	2008-09-07	male	Lào	2560	primary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02030101
46242	Nguyễn Hoàng Thanh Lâm	1961-07-05	male	Kinh (Việt)	2560	none	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	206546601	Nhà chuyên môn bậc cao (đại học trở lên)	02030101
46243	Trần Thị Thùy Ngân	1996-10-20	female	Kinh (Việt)	2560	secondary	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	208108501	Nhân viên dịch vụ và bán hàng	02030101
46244	Nguyễn Quốc Bình	1958-10-29	male	Kinh (Việt)	2560	none	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	201964801	Lao động giản đơn	02030101
46245	Nguyễn Đỗ Thùy Duyên	2015-07-25	female	Kinh (Việt)	2560	None	Không	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02030101
46246	Trương Thị Như Trâm	1998-01-10	female	Kinh (Việt)	2560		Cơ đốc Phục lâm	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	206847801	Tự do	02030101
46247	Lê Ngọc Hoài	2016-10-20	female	Kinh (Việt)	2561	None	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030102
46248	Huỳnh Võ Trường Hải	2001-11-20	male	Kinh (Việt)	2561		Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	202271901	Lực lượng vũ trang	02030102
46249	Nguyễn Thanh Nhàn	1989-05-29	male	Kinh (Việt)	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	208179001	Nhà chuyên môn bậc cao (đại học trở lên)	02030102
46250	Sầm Thư Bích Nga	2002-07-28	female	Kinh (Việt)	2561		Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	201230701	Lao động giản đơn	02030102
46251	Nguyễn Trọng Sang	1990-07-09	male	Kinh (Việt)	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	201608701	Lao động giản đơn	02030102
46252	Phan Quốc Huy	1990-06-30	male	Sán Chay	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	204649201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030102
46253	Nguyễn Thanh Khôi	1970-03-22	male	Kinh (Việt)	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	200558301	Lao động giản đơn	02030102
46254	Mông Mỹ Yến	1963-09-27	female	Kinh (Việt)	2561	none	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	204237401	Nhà chuyên môn bậc cao (đại học trở lên)	02030102
46255	Nguyễn Thanh	2012-12-19	male	Kinh (Việt)	2561	None	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02030102
46256	Nguyễn Đức Trọng	1972-08-23	male	Kinh (Việt)	2561	university	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	202953301	Tự do	02030102
46257	Nguyễn Thành Nhân	1975-10-12	male	Kinh (Việt)	2561	high	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	207179301	Lao động giản đơn	02030102
46258	Nguyễn Thiện Nhân	1962-09-13	male	Thái	2561	secondary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	207742501	Lao động giản đơn	02030102
46259	Nguyễn Ngọc Diễm Quỳnh	2013-09-17	female	Kinh (Việt)	2561	None	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030102
46260	Nguyễn Thy Quyên	2009-11-25	female	Kinh (Việt)	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030102
46261	Trần Phúc	1971-08-23	male	Kinh (Việt)	2561	high	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	201384001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030102
46262	Nguyễn Ngọc Thảo Nguyên	2015-12-14	female	Kinh (Việt)	2561	None	Công giáo	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030102
46263	Võ Nguyễn Ngọc Hân	1966-12-06	female	Xtiêng	2561	none	Minh lý đạo - Tam Tông Miếu	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	200460101	Lao động giản đơn	02030102
46264	Võ Ngô Đăng Khoa	2004-11-12	male	Kinh (Việt)	2561	primary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	206078501	Lao động giản đơn	02030102
46265	Trần Minh Phúc	1976-03-31	male	Kinh (Việt)	2561		Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	201732301	Lao động giản đơn	02030102
46266	Tô Đại Lộc	1994-04-12	male	Mảng	2561	secondary	Không	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Thị trấn Mèo Vạc Huyện Mèo Vạc Tỉnh Hà Giang	202539801	Lao động giản đơn	02030102
46267	Nguyễn Hồng Phương	1973-02-01	female	Kinh (Việt)	2563	primary	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	205897801	Lao động giản đơn	02030201
46268	Lê Đình Quốc Anh	1983-11-24	male	Kinh (Việt)	2563	primary	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	208735201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02030201
46269	Huỳnh Phùng Bảo Long	2002-12-06	male	Kinh (Việt)	2563		Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	207171301	Lao động giản đơn	02030201
46270	Huỳnh Hoàng Phú	2013-11-09	male	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030201
46271	Huỳnh Mai Thủy	1968-12-16	female	Kinh (Việt)	2563	primary	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	206631101	Nhân viên trợ lý văn phòng	02030201
46272	Nguyễn Nguyên Long	1962-09-17	male	Kinh (Việt)	2563	secondary	Cơ đốc Phục lâm	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	203476301	Lao động giản đơn	02030201
46273	Nguyễn Ngọc Uyên Thư	1965-05-02	female	Mnông	2563	secondary	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	201200201	Thợ lắp ráp và vận hành máy móc, thiết bị	02030201
46274	Hồ Bảo Trân	1958-07-08	female	Kinh (Việt)	2563	none	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	201673901	Lao động thủ công và các nghề nghiệp có liên quan khác	02030201
46275	Nguyễn Hoàng Minh Hà	1991-10-01	female	Kinh (Việt)	2563		Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	204317201	Lao động giản đơn	02030201
46276	Nguyễn Quốc Khởi	2020-07-11	male	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030201
46277	Nguyễn Đoàn Thảo Nhi	2017-06-23	female	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên dịch vụ và bán hàng	02030201
46278	Nguyễn Ngọc Kim Ngân	2012-08-02	female	Kinh (Việt)	2563	None	Mặc môn	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030201
46279	Nguyễn Thị Ngọc Thy	2013-01-09	female	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030201
46280	Hoàng Thị Bích Ngọc	1990-07-09	female	Kinh (Việt)	2563	none	Phật giáo Hòa Hảo	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	202339901	Lao động giản đơn	02030201
46281	Nguyễn Lê Anh Thư	1967-10-07	female	Kinh (Việt)	2563	none	Phật giáo	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	207355701	Lao động giản đơn	02030201
46282	La Huệ Thi	1998-02-23	female	Kinh (Việt)	2563		Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	206515101	Nhân viên dịch vụ và bán hàng	02030201
46283	Phạm Lê Thanh Bình	2021-01-20	female	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02030201
46284	Nguyễn Ngọc Vân Anh	2010-03-14	female	Kinh (Việt)	2563	primary	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lực lượng vũ trang	02030201
46285	Nguyễn Âu Diệp Băng Susi	2000-11-14	female	Kinh (Việt)	2563		Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	201935601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030201
46286	Nguyễn Thị Chúc	2020-10-18	female	Kinh (Việt)	2563	None	Không	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030201
46287	Nguyễn Thị Ngọc Giàu	2017-12-27	female	Kinh (Việt)	2564	None	Bửu Sơn Kỳ Hương	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030202
46288	Từ Nguyễn Thanh Vi	2008-11-25	female	Kinh (Việt)	2564	primary	Cao đài	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên dịch vụ và bán hàng	02030202
46289	Nguyễn Hồ Yến Vy	1964-04-11	female	Kinh (Việt)	2564	none	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	203847301	Lao động giản đơn	02030202
46290	Phạm Thị Yến Nhi	1995-07-05	female	Kinh (Việt)	2564	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	208864101	Lao động giản đơn	02030202
46291	Bùi Thị Bình	1996-08-24	female	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	204062001	Lao động giản đơn	02030202
46292	Trương Đình Huy	1980-12-11	male	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	206532101	Lao động giản đơn	02030202
46293	Nguyễn Thị Trang Đài	2003-02-12	female	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	203799601	Lao động giản đơn	02030202
46294	Nguyễn Trần Đại	1995-06-20	male	Kinh (Việt)	2564	high	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	206032401	Lao động giản đơn	02030202
46295	Lê Xuân Giang	1961-08-08	female	Kinh (Việt)	2564	secondary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	204924601	Lực lượng vũ trang	02030202
46296	Trương Ngọc Anh Thy	1999-02-11	female	Kinh (Việt)	2564		Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	203631801	Thợ lắp ráp và vận hành máy móc, thiết bị	02030202
46297	Nguyễn Hoàn Nhã Linh	2008-08-20	female	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030202
46320	Nguyễn Thành Nhân	1990-09-23	male	Kinh (Việt)	2566	none	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	203971101	Lao động giản đơn	02030301
46298	Nguyễn Mai Trâm Anh	2017-10-21	female	Kinh (Việt)	2564	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030202
46299	Phan Quốc Bảo	2009-07-18	male	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030202
46300	Phạm Nhật Lam Quỳnh	1961-11-14	female	Kinh (Việt)	2564	high	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	202555401	Lực lượng vũ trang	02030202
46301	Phạm Thị Kim Chi	1964-09-26	female	Kinh (Việt)	2564	none	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	203270601	Lao động giản đơn	02030202
46302	Tô Ngọc Trà My	2014-01-14	female	Kinh (Việt)	2564	None	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02030202
46303	Nguyễn Quốc Việt	1980-09-05	male	Kinh (Việt)	2564	primary	Tin lành	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	206060901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02030202
46304	Nguyễn Thành Châu	1977-08-30	male	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	207663801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	02030202
46305	Lê Hoàng Hải	1973-03-10	male	Kinh (Việt)	2564	secondary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	200144901	Lao động giản đơn	02030202
46306	Lại Đình Đạt	2009-04-04	male	Kinh (Việt)	2564	primary	Không	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Thượng Phùng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030202
46307	Tiêu Minh Đức	1964-01-04	male	Kinh (Việt)	2566	primary	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	204314201	Lao động giản đơn	02030301
46308	Nguyễn Tấn Đức	1962-09-21	male	Kinh (Việt)	2566	none	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	203722401	Thợ lắp ráp và vận hành máy móc, thiết bị	02030301
46309	Nguyễn Thị Phương Thùy	1993-11-27	female	Kinh (Việt)	2566	primary	Hồi giáo	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205001901	Lao động giản đơn	02030301
46310	Đinh Thị Yến Nhi	2012-04-25	female	Bru-Vân Kiều	2566	None	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030301
46311	Nguyễn Khắc Anh Đức	1989-03-31	male	Kinh (Việt)	2566	none	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	202189401	Lao động giản đơn	02030301
46312	Nguyễn Trần Minh Anh	2012-10-20	female	Kinh (Việt)	2566	None	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030301
46313	Nguyễn Hà Quốc Thịnh	1984-12-06	male	Kinh (Việt)	2566	primary	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	201751901	Lao động giản đơn	02030301
46314	Huỳnh Trọng Nhân	1964-02-06	male	Kinh (Việt)	2566	high	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	200579501	Nhân viên trợ lý văn phòng	02030301
46315	Trần Đặng Mỹ Linh	2008-01-10	female	Kinh (Việt)	2566	primary	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030301
46316	Lê Hữu Thông	1978-10-25	male	Bố Y	2566	primary	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	200773201	Lao động giản đơn	02030301
46317	Đặng Quang Tú	1999-01-07	male	Kinh (Việt)	2566		Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	202838601	Lao động giản đơn	02030301
46318	Nguyễn Thái Anh	1984-07-22	male	Kinh (Việt)	2566	high	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	201812701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030301
46319	Nguyễn Vinh Sơn	2017-09-10	male	Kinh (Việt)	2566	None	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Thợ lắp ráp và vận hành máy móc, thiết bị	02030301
46321	Nguyễn Thái Anh Thư	1994-02-26	female	Kinh (Việt)	2566	university	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	207609501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030301
46322	Phan Nguyễn Thủy Tiên	1997-03-01	female	Khơ-me	2566	high	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205646201	Lao động giản đơn	02030301
46323	Đặng Thị Thúy Hiền	1943-02-08	female	Kinh (Việt)	2566	none	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	206919601	Lao động giản đơn	02030301
46324	Vũ Thị Vân Anh	2020-11-28	female	Kinh (Việt)	2566	None	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02030301
46325	Phạm Quang Huy	1985-12-28	male	Kinh (Việt)	2566	high	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	206950101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	02030301
46326	Nguyễn Đạt Thành	1990-09-04	male	Kinh (Việt)	2566	primary	Không	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 1 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	204841701	Lao động thủ công và các nghề nghiệp có liên quan khác	02030301
46327	Trần Trí Tín	2007-01-01	male	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030302
46328	Nguyễn Thị Hoài Thương	2019-03-18	female	Kinh (Việt)	2567	None	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030302
46329	Trần Minh Triết	2009-06-22	male	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên trợ lý văn phòng	02030302
46330	Nguyễn Chí Cường	1992-10-14	male	Kinh (Việt)	2567	secondary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	208225501	Lao động giản đơn	02030302
46331	Nguyễn Tuấn Hưng	1996-08-06	male	Sán Chay	2567	high	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205020101	Nhân viên dịch vụ và bán hàng	02030302
46332	Nguyễn Hoàng Hữu Bằng	1978-09-28	male	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	200246701	Lao động giản đơn	02030302
46333	Nguyễn Ngọc Phương Uyên	1926-10-16	female	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	202842301	Lao động giản đơn	02030302
46334	Bùi Thị Thu Trâm	1962-03-12	female	Kinh (Việt)	2567	none	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	201203001	Lao động giản đơn	02030302
46335	Nguyễn Hoàng Bảo Khanh	1981-09-19	female	Kinh (Việt)	2567	secondary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	206955401	Lao động giản đơn	02030302
46336	Đặng Kim Hòa	2007-04-05	male	Nùng	2567	primary	Cao đài	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động thủ công và các nghề nghiệp có liên quan khác	02030302
46337	Phạm Thái Hiền	1974-09-07	female	Kinh (Việt)	2567	none	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	207395201	Lao động giản đơn	02030302
46338	Đinh Thùy Trang	1993-02-05	female	Kinh (Việt)	2567	primary	Công giáo	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	208654201	Lao động thủ công và các nghề nghiệp có liên quan khác	02030302
46339	Hoàng Nguyễn Quỳnh Nhi	1999-08-17	female	Kinh (Việt)	2567		Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205327501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030302
46340	Trần Minh Thư	2007-10-13	female	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Nhân viên dịch vụ và bán hàng	02030302
46341	Đỗ Hiếu Hiển	2000-06-29	male	Kinh (Việt)	2567		Cao đài	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	200076301	Lao động giản đơn	02030302
46342	Nguyễn Lê Phương Anh	2010-07-10	female	Kinh (Việt)	2567	primary	Phật giáo	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030302
46343	Nguyễn Hữu Đăng Khoa	1958-10-06	male	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205298501	Lao động giản đơn	02030302
46344	Nguyễn Thanh Hải	1974-10-24	male	Kinh (Việt)	2567	none	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	206233101	Lực lượng vũ trang	02030302
46345	Lê Kim Ngân	1983-05-09	female	Kinh (Việt)	2567	primary	Không	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	205829701	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	02030302
46346	Võ Thị Kiều Trinh	2021-11-05	female	Kinh (Việt)	2567	None	Cơ đốc Phục lâm	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang	Thôn 2 Xã Pải Lủng Huyện Mèo Vạc Tỉnh Hà Giang		Lao động giản đơn	02030302
46347	Đặng Huỳnh Thanh Thảo	1998-12-15	female	Kinh (Việt)	2571		Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	207341801	Lao động giản đơn	03010101
46348	Phạm Huỳnh Ni	1977-04-17	female	Ê-đê	2571	none	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	200422801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010101
46349	Nguyễn Ngọc Quỳnh Như	1962-09-10	female	Kinh (Việt)	2571	high	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	200582701	Lao động thủ công và các nghề nghiệp có liên quan khác	03010101
46350	Nguyễn Văn Sơn	1968-01-17	male	Kinh (Việt)	2571	university	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204469301	Lao động giản đơn	03010101
46351	Liêu Hán Vĩ	2005-10-22	male	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	201254201	Lao động giản đơn	03010101
46352	Trương Thị Yến Trang	1980-09-20	female	Kinh (Việt)	2571	secondary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	200658601	Lao động giản đơn	03010101
46353	Hồ Trí Tâm	1974-02-10	male	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204156501	Lao động giản đơn	03010101
46354	Lê Huyền Vân	2006-10-31	female	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động thủ công và các nghề nghiệp có liên quan khác	03010101
46355	Vương Gia Tân	1974-08-04	male	Kinh (Việt)	2571	secondary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	208192401	Tự do	03010101
46356	Nguyễn Văn Hương Biển	1972-09-05	male	Kinh (Việt)	2571	high	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	207382301	Lao động giản đơn	03010101
46357	Nhiêu Gia Lợi	1977-06-22	female	Kinh (Việt)	2571	secondary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204820401	Nhà chuyên môn bậc cao (đại học trở lên)	03010101
46358	Lê Nguyễn Thu Phương	2017-06-07	female	Kinh (Việt)	2571	None	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010101
46359	Nguyễn Lê Anh Thư	2015-06-13	female	Kinh (Việt)	2571	None	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lực lượng vũ trang	03010101
46360	Lê Anh Vũ	1966-03-08	male	Kinh (Việt)	2571	secondary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	208506601	Lao động giản đơn	03010101
46361	Nguyễn Quốc Hoàng	1985-02-25	male	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	207156201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010101
46362	Mai Nguyễn Phương Nghi	2018-12-16	female	Kinh (Việt)	2571	None	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010101
46572	Nguyễn Đan Trường	1961-10-31	male	Kinh (Việt)	2588	none	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	204174201	Tự do	03020302
46363	Nguyễn Thị Kỳ Duyên	2011-11-05	female	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Thợ lắp ráp và vận hành máy móc, thiết bị	03010101
46364	Nguyễn Thị Ngọc Huyền	1959-09-29	female	Kinh (Việt)	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	206297901	Lao động giản đơn	03010101
46365	Nguyễn Thị Ngọc Mai	1947-08-17	female	Kinh (Việt)	2571	none	Mặc môn	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	208702801	Lao động giản đơn	03010101
46366	Trần Ngọc Thanh Thảo	1986-04-18	female	Chu-ru	2571	primary	Không	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	208886601	Nhà chuyên môn bậc cao (đại học trở lên)	03010101
46367	Trần Huy Long	1973-04-24	male	Kinh (Việt)	2572	secondary	Mặc môn	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	206744201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010102
46368	Nguyễn Đức Thịnh	2011-08-10	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lực lượng vũ trang	03010102
46369	Trần Hải Đăng	1969-04-22	male	Kinh (Việt)	2572	secondary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204923301	Tự do	03010102
46370	Trần Hòa Thuận	1930-08-21	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	202231301	Lao động giản đơn	03010102
46371	Nguyễn Lưu Minh Khuê	2009-01-26	female	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Tự do	03010102
46372	Nguyễn Hoàng Phúc	1985-09-29	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	208624201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010102
46373	Lê Khắc Huy	2006-03-07	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010102
46374	Đặng Quốc Huy	1990-11-24	male	Kinh (Việt)	2572	high	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204934501	Thợ lắp ráp và vận hành máy móc, thiết bị	03010102
46375	Nguyễn Hồ Ngọc Ngân	2011-06-30	female	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03010102
46376	Trần Ngọc Thùy Dương	1970-08-23	female	Kinh (Việt)	2572	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	200974901	Lực lượng vũ trang	03010102
46377	Nguyễn Phạm Xuân Nhi	1992-08-30	female	Kinh (Việt)	2572	primary	Cao đài	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	201234401	Lao động giản đơn	03010102
46378	Kha Ngọc Tuyền	1986-01-14	female	Kinh (Việt)	2572	secondary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	205982901	Lao động giản đơn	03010102
46379	Trần Minh Quý	2001-06-17	male	Tày	2572		Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	200323501	Lao động giản đơn	03010102
46380	Nguyễn Văn Khang	1982-07-13	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	207887701	Lao động giản đơn	03010102
46381	Thái Quốc An	1973-02-05	male	Kinh (Việt)	2572	primary	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	204277301	Lao động giản đơn	03010102
46382	Trà Huỳnh Khương Thịnh	2013-01-11	male	Kinh (Việt)	2572	None	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03010102
46383	Lưu Nhật Gia Linh	2016-03-01	female	Kinh (Việt)	2572	None	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010102
46384	Nguyễn Hoàng Yến	1972-11-02	female	Kinh (Việt)	2572	primary	Phật giáo	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	203208501	Lao động thủ công và các nghề nghiệp có liên quan khác	03010102
46385	Huỳnh Tuyết Nhi	1996-10-06	female	Kinh (Việt)	2572	high	Bà-la-môn giáo	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	203770401	Thợ lắp ráp và vận hành máy móc, thiết bị	03010102
46386	Trần Thanh Nghĩa	1924-09-27	male	Kinh (Việt)	2572	none	Không	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Hiến Thành phố Cao Bằng Tỉnh Cao Bằng	207760101	Lao động giản đơn	03010102
46387	Trần Tấn Kiệt	2002-01-23	male	Thái	2574		Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	203604601	Lao động giản đơn	03010201
46388	Trần Đào Bích Ngọc	1962-06-30	female	Kinh (Việt)	2574	none	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	202434101	Nhân viên trợ lý văn phòng	03010201
46389	Vương Nhật Minh	1977-09-19	male	Xinh-mun	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	206976001	Lao động giản đơn	03010201
46390	Đoàn Vĩnh Phát	1969-01-11	male	Kinh (Việt)	2574	secondary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	202148501	Lao động giản đơn	03010201
46391	Đỗ Gia Hạnh	1973-03-20	female	Kinh (Việt)	2574	none	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	200281101	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03010201
46392	Nguyễn Vũ Hoàng Anh	1959-06-17	female	Kinh (Việt)	2574	none	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	200003201	Lao động giản đơn	03010201
46393	Nguyễn Ngọc Tố Trân	1981-05-31	female	Kinh (Việt)	2574	none	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	201510901	Lao động giản đơn	03010201
46394	Nguyễn Ngọc Thanh Bình	1970-03-05	female	Kinh (Việt)	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	203021301	Lao động thủ công và các nghề nghiệp có liên quan khác	03010201
46395	Đặng Gia Bảo	1999-08-25	male	Kinh (Việt)	2574		Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	200906301	Lao động giản đơn	03010201
46396	Lâm Quang Triều	2021-10-29	male	Kinh (Việt)	2574	None	Baha'I	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Thợ lắp ráp và vận hành máy móc, thiết bị	03010201
46397	Trần Ngọc Bảo Vy	1962-05-11	female	Kinh (Việt)	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	202961801	Lao động giản đơn	03010201
46398	Phạm Phương Khanh	1979-10-23	female	Gia-rai	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	205289701	Lao động giản đơn	03010201
46399	Nguyễn Thy Thy Ân	2021-06-25	female	Kinh (Việt)	2574	None	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010201
46400	Dương Phạm Hoàng Nam	2017-11-27	male	Kinh (Việt)	2574	None	Baha'I	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010201
46401	Nguyễn Đình Anh Khôi	2007-04-10	male	Kinh (Việt)	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010201
46402	Nguyễn Ngọc Gia Hân	1960-08-05	female	Kinh (Việt)	2574	primary	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	205293301	Lao động giản đơn	03010201
46403	Nguyễn Đình Trường	2001-06-01	male	Kinh (Việt)	2574		Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	202000101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010201
46404	Phạm Thị Hồng Vân	1968-03-19	female	Kinh (Việt)	2574	high	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	208915501	Lao động giản đơn	03010201
46405	Vũ Thị Hồng Liên	2013-12-02	female	Kinh (Việt)	2574	None	Không	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Nhân viên trợ lý văn phòng	03010201
46406	Hồ Thị Thanh Thùy	1985-11-22	female	Kinh (Việt)	2574	primary	Phật giáo Hòa Hảo	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	205489301	Lao động giản đơn	03010201
46407	Phan Tùng Anh	1982-07-11	male	Kinh (Việt)	2575	secondary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	201959301	Lao động giản đơn	03010202
46408	Phan Kim Khánh	2019-06-28	female	Kinh (Việt)	2575	None	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010202
46409	Phạm Phương Thảo	2003-03-04	female	Kinh (Việt)	2575	secondary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	203009901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010202
46410	Nguyễn Tấn Đạt	2020-07-24	male	Kinh (Việt)	2575	None	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010202
46411	Trần Hiếu Gia Bảo	1999-08-22	male	Kinh (Việt)	2575		Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	206890501	Nhà chuyên môn bậc cao (đại học trở lên)	03010202
46412	Phạm Thị Mỹ Ngọc	1972-06-28	female	Kinh (Việt)	2575	secondary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	207762301	Lao động giản đơn	03010202
46413	Đào Ngọc Hoàng Ngân	1994-10-02	female	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	207549101	Lực lượng vũ trang	03010202
46414	Lê Hoài An	1977-11-13	female	Kinh (Việt)	2575	none	Minh Sư đạo	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	205065801	Lao động thủ công và các nghề nghiệp có liên quan khác	03010202
46415	Đoàn Văn Hoạch	2012-12-09	male	Kinh (Việt)	2575	None	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03010202
46416	Ngô Thị Hồng Nhung	1961-09-21	female	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	203361801	Lao động giản đơn	03010202
46417	Nguyễn Thanh Tiểu My	2020-11-27	female	Pu Péo	2575	None	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03010202
46418	Nguyễn Thảo Thanh Thư	1989-03-16	female	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	203790101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010202
46419	Lâm Phương Anh	2001-11-25	female	Kinh (Việt)	2575		Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	202576501	Tự do	03010202
46420	Lê Huy Hoàng	2018-03-12	male	Kinh (Việt)	2575	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03010202
46421	Nguyễn Đức Tài	2019-09-26	male	Kinh (Việt)	2575	None	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010202
46422	Dương Hà Mây	1964-04-19	female	Kinh (Việt)	2575	none	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	200341001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010202
46423	Võ Ngô Tuấn Kiệt	1958-04-03	male	Kinh (Việt)	2575	none	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	205781601	Nhà chuyên môn bậc cao (đại học trở lên)	03010202
46424	Nguyễn Hoàng Tính	1980-11-15	male	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	207615101	Lực lượng vũ trang	03010202
46425	Cam Hoàng Phương Trang	2008-03-16	female	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010202
46426	Phan Thành Phát	1985-10-28	male	Kinh (Việt)	2575	primary	Không	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Sông Bằng Thành phố Cao Bằng Tỉnh Cao Bằng	208379701	Lao động giản đơn	03010202
46427	Nguyễn Lê Anh Tuấn	1958-06-20	male	Kinh (Việt)	2577	none	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	201252501	Lao động giản đơn	03010301
46428	Giang Phan Hoàng Minh	1966-10-28	male	Kinh (Việt)	2577	primary	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	202744701	Tự do	03010301
46429	Trần Lê Trung Tín	2018-05-27	male	Kinh (Việt)	2577	None	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03010301
46430	Cao Xuân Khang	1990-01-12	male	Kinh (Việt)	2577	university	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	208449901	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03010301
46431	Nguyễn Huỳnh Bảo Ngọc	1971-05-11	female	Kinh (Việt)	2577	secondary	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	200999301	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010301
46432	Trần Khánh Huy	1980-07-01	male	Cơ-tu	2577	high	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	201847701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010301
46433	Nguyễn Đức Duy	2020-09-04	male	Kinh (Việt)	2577	None	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động thủ công và các nghề nghiệp có liên quan khác	03010301
46434	Nguyễn Quỳnh Hương	1998-05-28	female	Kinh (Việt)	2577		Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	207166801	Lao động giản đơn	03010301
46435	Lê Thanh Hùng	1984-12-03	male	Kinh (Việt)	2577	high	Bửu Sơn Kỳ Hương	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	207691201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010301
46436	Nguyễn Hữu Minh Phú	1968-02-11	male	Kinh (Việt)	2577	none	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	208481101	Lao động giản đơn	03010301
46437	Đặng Ngọc Nhã Ca	2015-12-08	female	Thái	2577	None	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010301
46438	Võ Thanh Mai	1966-09-13	female	Kinh (Việt)	2577	none	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	208703201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03010301
46439	Nguyễn Hoàng Thủy Hà	1987-04-10	female	Kinh (Việt)	2577	none	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	202271601	Lao động giản đơn	03010301
46440	Nguyễn Lan Hương	2015-09-04	female	Kinh (Việt)	2577	None	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010301
46441	Trần Ngọc Hân	1961-09-01	female	Kinh (Việt)	2577	primary	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	202192801	Lao động giản đơn	03010301
46442	Phan Thị Ngọc Ý	1984-05-11	female	Kinh (Việt)	2577	none	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	204107901	Nhân viên trợ lý văn phòng	03010301
46443	Nguyễn Kim Khánh	2014-11-08	female	Kinh (Việt)	2577	None	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010301
46444	Nguyễn Đặng Quỳnh Như	1972-11-11	female	Kinh (Việt)	2577	primary	Không	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	204084701	Lao động giản đơn	03010301
46445	Phạm Lê Hoàng Phúc	1985-12-17	male	Kinh (Việt)	2577	none	Bà-la-môn giáo	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	208121301	Thợ lắp ráp và vận hành máy móc, thiết bị	03010301
46446	Dương Gia Bảo Trâm	2021-11-02	female	Kinh (Việt)	2577	None	Bà-la-môn giáo	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 1 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010301
46447	Trần Quốc Nam	1997-06-16	male	Kinh (Việt)	2578	primary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	201063901	Lao động giản đơn	03010302
46448	Đỗ Thụy Minh Thư	2012-11-05	female	Kinh (Việt)	2578	None	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Nhân viên trợ lý văn phòng	03010302
46449	Lê Quang Bảo Ngân	1961-09-15	female	Kinh (Việt)	2578	none	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	202749301	Lao động giản đơn	03010302
46450	Hồ Đoàn Thanh Thảo	1967-05-13	female	Kinh (Việt)	2578	none	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	201012701	Lao động giản đơn	03010302
46451	Vũ Thị Phương Mai	1993-10-19	female	Kinh (Việt)	2578	secondary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	201483501	Lao động giản đơn	03010302
46452	Võ Quốc Huy	1958-08-22	male	Chăm (Chàm)	2578	secondary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	203599801	Lao động thủ công và các nghề nghiệp có liên quan khác	03010302
46453	Gu Nguyễn Thanh Hiếu	1976-04-14	male	Kinh (Việt)	2578		Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	205548701	Lực lượng vũ trang	03010302
46454	Trần Thị Yến Nhi	1991-06-02	female	Kinh (Việt)	2578		Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	208114101	Lao động thủ công và các nghề nghiệp có liên quan khác	03010302
46455	Phạm Tuyết Nhi	2013-11-25	female	Kinh (Việt)	2578	None	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46456	Vương Bá Lộc	1999-06-12	male	Kinh (Việt)	2578		Phật giáo	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	205582601	Nhà chuyên môn bậc cao (đại học trở lên)	03010302
46457	Lê Hoàng Yến Nhi	1965-12-09	female	Kinh (Việt)	2578	high	Tin lành	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	207317001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010302
46458	Hồ Thanh Hải	2012-04-09	male	Kinh (Việt)	2578	None	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46459	Đặng Hoàng Anh	2020-08-31	male	Kinh (Việt)	2578	None	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46460	Ngô Hoàng Như	1958-11-29	female	Kinh (Việt)	2578	none	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	203236101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03010302
46461	Trần Châu Bảo Hưng	1994-12-28	male	Cơ Lao	2578	primary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	203182701	Lao động giản đơn	03010302
46462	Võ Ngọc Trúc Giang	2019-07-31	female	Kinh (Việt)	2578	None	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46463	Trương Thị Thanh Trúc	2010-07-07	female	Kinh (Việt)	2578	primary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46464	Võ Chí Cường	2006-11-26	male	Xinh-mun	2578	primary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46465	Trần Thị Thúy An	2007-12-10	female	Kinh (Việt)	2578	primary	Không	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng		Lao động giản đơn	03010302
46466	Lê Thị Hiền My	1978-01-01	female	Kinh (Việt)	2578	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	Thôn 2 Phường Hợp Giang Thành phố Cao Bằng Tỉnh Cao Bằng	202746301	Thợ lắp ráp và vận hành máy móc, thiết bị	03010302
46467	Lại Hoàng Thảo Vy	1999-11-17	female	Pu Péo	2581		Bửu Sơn Kỳ Hương	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203748101	Tự do	03020101
46468	Nguyễn Hoàng Long Vũ	2010-05-31	male	Xtiêng	2581	primary	Hồi giáo	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Tự do	03020101
46469	Nguyễn Lê Gia Bảo	2017-07-23	male	Kinh (Việt)	2581	None	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020101
46470	Võ Hải Cường	1983-02-24	male	Kinh (Việt)	2581	primary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	207129401	Lao động giản đơn	03020101
46471	Nguyễn Minh Tú	1940-02-04	female	Kinh (Việt)	2581	secondary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203507501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020101
46472	Nguyễn Thị Thanh Tâm	2003-09-01	female	Kinh (Việt)	2581	secondary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	208386401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020101
46473	Nguyễn Minh Anh	2012-02-11	female	Sán Dìu	2581	None	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020101
46474	Huỳnh Thị Kim Hương	1981-09-06	female	Kinh (Việt)	2581	none	Mặc môn	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	207885101	Lao động giản đơn	03020101
46475	Phạm Lê Phương Thảo	1988-11-18	female	Kinh (Việt)	2581	none	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203495001	Lao động giản đơn	03020101
46476	Huỳnh Thanh Vy	1993-07-15	female	Kinh (Việt)	2581	secondary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	202729001	Nhà chuyên môn bậc cao (đại học trở lên)	03020101
46477	Dương Vĩnh An	1946-10-26	male	Kinh (Việt)	2581	secondary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	206004901	Lao động giản đơn	03020101
46478	Đào Văn Lượng	2003-10-18	male	Kinh (Việt)	2581	high	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	205795501	Lao động giản đơn	03020101
46479	Nguyễn Lê Quỳnh Anh	2018-02-20	female	Kinh (Việt)	2581	None	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Nhân viên trợ lý văn phòng	03020101
46480	Đặng Thế Bảo	2011-04-05	male	Tày	2581	primary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020101
46481	Bạch Thị Kim Tiền	1993-09-27	female	Kinh (Việt)	2581	high	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203311501	Lao động giản đơn	03020101
46482	Danh Trần Phi Dung	1995-09-09	female	Phù Lá	2581	primary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	200909001	Thợ lắp ráp và vận hành máy móc, thiết bị	03020101
46483	Nghiêm Hoàng Trang	2003-07-17	female	Kinh (Việt)	2581	primary	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	202610401	Lao động giản đơn	03020101
46484	Nguyễn Thị Cẩm Ly	1976-06-15	female	Kinh (Việt)	2581		Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	204969501	Lực lượng vũ trang	03020101
46485	Nguyễn Phúc Thiên An	2015-11-07	female	Kinh (Việt)	2581	None	Minh lý đạo - Tam Tông Miếu	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lực lượng vũ trang	03020101
46486	Lê Thị Yến Vy	2016-12-14	female	Lô lô	2581	None	Không	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020101
46487	Phạm Văn Hiệp	2021-03-01	male	Kinh (Việt)	2582	None	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020102
46488	Trương Hoàng Trân	1963-04-30	female	Kinh (Việt)	2582	secondary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	204850501	Nhân viên trợ lý văn phòng	03020102
46489	Trần Anh Việt	1987-12-04	male	Kháng	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203746601	Lao động giản đơn	03020102
46490	Nguyễn Ja Kỳ	1988-11-01	female	Hà nhì	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	200989401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020102
46491	Nguyễn Huỳnh Như	2016-10-27	female	Kinh (Việt)	2582	None	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Tự do	03020102
46492	Nguyễn Thị Tố Uyên	2019-10-16	female	Kinh (Việt)	2582	None	Cao đài	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lực lượng vũ trang	03020102
46493	Đinh Ngọc Huyền	1998-06-13	female	Kinh (Việt)	2582		Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	207400101	Lao động giản đơn	03020102
46494	Nguyễn Thái Việt	2012-03-15	male	Thái	2582	None	Minh lý đạo - Tam Tông Miếu	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020102
46495	Lý Thanh Tâm	1969-12-10	male	Kinh (Việt)	2582	secondary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	207038801	Tự do	03020102
46496	Trương Khả Vy	1967-12-27	female	Kinh (Việt)	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	206276101	Lao động giản đơn	03020102
46497	Lê Thanh Vy	2003-06-17	female	Kinh (Việt)	2582	primary	Tịnh độ Cư sỹ Phật hội	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203070101	Lao động giản đơn	03020102
46498	Phạm Hoàng Minh	1992-07-27	male	Kinh (Việt)	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	200994501	Nhà chuyên môn bậc cao (đại học trở lên)	03020102
46499	Lê Huỳnh Phương Nhi	1985-10-29	female	Kinh (Việt)	2582	primary	Phật giáo Hòa Hảo	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	203677501	Lực lượng vũ trang	03020102
46500	Nguyễn Lê Đình Phương	1993-10-11	male	Kinh (Việt)	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	200100101	Lao động giản đơn	03020102
46501	Trần Ngọc Phương Anh	2008-04-18	female	Kinh (Việt)	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020102
46502	Nguyễn Phan Huỳnh Đức	1958-12-31	male	Kinh (Việt)	2582	none	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	207389601	Lao động giản đơn	03020102
46503	Vũ Văn Nghĩa Huy	2014-01-12	male	Kinh (Việt)	2582	None	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020102
46504	Nguyễn Hoàng Phi Lâm	1983-01-05	male	Kinh (Việt)	2582	none	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	201172601	Lao động giản đơn	03020102
46505	Ngô Gia Hân	1984-11-05	female	Phù Lá	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	204744501	Lao động giản đơn	03020102
46506	Trần Nhựt Duy	2005-08-16	male	Kinh (Việt)	2582	primary	Không	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Thị trấn Pác Miầu Huyện Bảo Lâm Tỉnh Cao Bằng	200138701	Lao động giản đơn	03020102
46507	Nguyễn Tấn Đạt	2013-02-17	male	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020201
46508	Lâm Tâm Như	1974-09-16	female	Kinh (Việt)	2584	secondary	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	206320201	Nhân viên trợ lý văn phòng	03020201
46509	Lê Thành Đạt	1991-06-16	male	Kinh (Việt)	2584		Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	204116501	Tự do	03020201
46510	Nguyễn Thị Bích Thảo	2021-10-10	female	Ba-na	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020201
46511	Cao Ngọc Sơn	2015-08-22	male	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03020201
46512	Nguyễn Ngọc Tuyết	1966-12-24	female	Mnông	2584	none	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	205657401	Nhà chuyên môn bậc cao (đại học trở lên)	03020201
46513	Phí Đức Minh	2001-08-21	male	Kinh (Việt)	2584		Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	206750801	Nhân viên trợ lý văn phòng	03020201
46514	Triệu Trúc Quỳnh	2014-10-18	female	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020201
46515	Huỳnh Lê Thanh Danh	2012-12-27	male	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020201
46516	Nguyễn Lê Trúc Thy	1931-01-20	female	Kinh (Việt)	2584	secondary	Tịnh độ Cư sỹ Phật hội	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	208649001	Lao động giản đơn	03020201
46517	Trần Thị Ánh Phương	2014-12-10	female	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020201
46518	Đặng Lâm Hoàng Nhi	1971-10-15	female	Kinh (Việt)	2584	secondary	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	203233901	Lao động giản đơn	03020201
46519	Châu Mỹ Hằng	2017-03-06	female	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020201
46520	Nguyễn Ngọc Minh Châu	1992-02-01	female	Kinh (Việt)	2584	high	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	203158201	Lao động giản đơn	03020201
46521	Nguyễn Đoàn Khánh Ngọc	1967-03-24	female	Gié-Triêng	2584	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	200032801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020201
46522	Lê Tài Phúc	2017-09-10	male	Kinh (Việt)	2584	None	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020201
46523	Nguyễn Hoài Linh Nhi	1962-04-30	female	Kinh (Việt)	2584	secondary	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	203425501	Lao động thủ công và các nghề nghiệp có liên quan khác	03020201
46524	Bùi Võ Ngọc Ánh	1965-11-09	female	Kinh (Việt)	2584	primary	Phật giáo	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	202253701	Lao động giản đơn	03020201
46525	Huỳnh Chấn Bảo	2009-07-09	male	Kinh (Việt)	2584	primary	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Tự do	03020201
46526	Phạm Hoàng Minh	1959-11-28	male	Kinh (Việt)	2584	primary	Không	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	200930301	Lao động giản đơn	03020201
46527	Trần Mai Anh	2021-11-18	female	Kinh (Việt)	2585	None	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03020202
46528	Phan Hoàng Thiên Kim	1975-06-30	female	La Chí	2585	none	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	200022901	Lao động thủ công và các nghề nghiệp có liên quan khác	03020202
46529	Võ Lê Cao Tiến	1998-12-22	male	Kinh (Việt)	2585		Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	202398701	Lao động thủ công và các nghề nghiệp có liên quan khác	03020202
46530	Phan Huỳnh Lý	2012-01-14	female	Kinh (Việt)	2585	None	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020202
46531	Đàm Mỹ Dung	1976-05-03	female	Kinh (Việt)	2585		Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	201320001	Tự do	03020202
46532	Trịnh Hoài Song Thư	1975-07-11	female	Kinh (Việt)	2585	primary	Minh Sư đạo	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	201082201	Lao động giản đơn	03020202
46533	Cao Bá Phương Trâm	2002-02-14	female	Kinh (Việt)	2585		Cao đài	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	201344801	Lao động giản đơn	03020202
46534	Nguyễn Minh Đức	1979-12-08	male	Kinh (Việt)	2585	primary	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	207982901	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020202
46535	Lê Trúc Anh	2021-10-22	female	Kinh (Việt)	2585	None	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lực lượng vũ trang	03020202
46536	Lê Anh Duy	1994-08-21	male	Xinh-mun	2585	primary	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	208757501	Tự do	03020202
46537	Nguyễn Hoàng Yến Nhi	2020-08-12	female	Kinh (Việt)	2585	None	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020202
46538	Vũ Tuyết Trân	2007-06-08	female	Gié-Triêng	2585	primary	Tin lành	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020202
46539	Nguyễn Hoàng Ngọc Châu	1991-10-20	female	Kinh (Việt)	2585		Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	207663601	Lao động giản đơn	03020202
46540	Phạm Phương Vy	1990-08-05	female	Kinh (Việt)	2585	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	206871701	Nhà chuyên môn bậc cao (đại học trở lên)	03020202
46541	Nguyễn Thị Ngọc Trâm	1982-04-18	female	Kinh (Việt)	2585	primary	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	200710701	Thợ lắp ráp và vận hành máy móc, thiết bị	03020202
46542	Nguyễn Thị Tuyết Xinh	1961-11-02	female	Kinh (Việt)	2585	none	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	207315001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020202
46543	Nguyễn Thị Thanh Vân	2001-04-24	female	Kinh (Việt)	2585		Cơ đốc Phục lâm	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	203385601	Lao động giản đơn	03020202
46544	Nguyễn Hoàng Ngọc Thảo	2011-01-16	female	Kinh (Việt)	2585	primary	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020202
46545	Nguyễn Hoàng Thanh Uyên	2016-03-26	female	Tày	2585	None	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng		Thợ lắp ráp và vận hành máy móc, thiết bị	03020202
46546	Ngô Đức Thái Bảo	1993-04-06	male	Kinh (Việt)	2585	primary	Không	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Đức Hạnh Huyện Bảo Lâm Tỉnh Cao Bằng	201963101	Nhà chuyên môn bậc cao (đại học trở lên)	03020202
46547	Lê Văn Tuyến	1991-02-11	male	Kinh (Việt)	2587		Baha'I	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	207840001	Tự do	03020301
46548	Đặng Thanh Toàn	1982-05-31	male	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	207615401	Lao động giản đơn	03020301
46549	Bùi Lê Bảo Trân	2001-12-11	female	Kinh (Việt)	2587		Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208657401	Lao động giản đơn	03020301
46550	Nguyễn Thị Cẩm Nhung	1967-08-23	female	Kinh (Việt)	2587	none	Cơ đốc Phục lâm	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208840901	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020301
46551	Ngô Hiền Minh	1963-01-29	male	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	205801201	Lực lượng vũ trang	03020301
46552	Hà Thế Khánh	2003-02-28	male	Sán Chay	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	201698001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03020301
46553	Hoàng Đình Thành	1963-02-05	male	Kinh (Việt)	2587	none	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	200430401	Lao động giản đơn	03020301
46554	Đặng Như Phương	1951-08-04	female	Kinh (Việt)	2587		Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208122501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020301
46555	Phạm Anh Kiệt	2009-03-20	male	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020301
46556	Võ Tấn Cao Kỳ	1989-11-10	male	La Hủ	2587	high	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	202974901	Thợ lắp ráp và vận hành máy móc, thiết bị	03020301
46557	Nguyễn Quốc An	1973-01-10	male	Kinh (Việt)	2587	university	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	207066701	Lao động giản đơn	03020301
46558	Cao Nguyễn Đức Huy	1992-11-23	male	Kinh (Việt)	2587	university	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	200620101	Lao động giản đơn	03020301
46559	Lê Thị Hoàng Oanh	1944-03-04	female	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208279801	Lao động giản đơn	03020301
46560	Đặng Vĩnh Hưng	1922-03-10	male	Kinh (Việt)	2587	high	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208344501	Lao động giản đơn	03020301
46561	Nguyễn Thụy Kim Ngân	2009-02-19	female	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020301
46562	Phan Huỳnh Hà Tiên	1972-09-23	female	Kinh (Việt)	2587	none	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208139601	Lao động thủ công và các nghề nghiệp có liên quan khác	03020301
46563	Ngô Nhật Minh	1979-08-19	male	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	203609801	Thợ lắp ráp và vận hành máy móc, thiết bị	03020301
46564	Đặng Đoàn Thục Anh	1960-01-03	female	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	202373401	Nhân viên trợ lý văn phòng	03020301
46565	Nguyễn Vũ Huỳnh Chí	1977-06-16	male	Kinh (Việt)	2587	primary	Minh lý đạo - Tam Tông Miếu	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	205258701	Lao động giản đơn	03020301
46566	Lê Đức Doãn Lệnh	1995-07-03	male	Kinh (Việt)	2587	primary	Không	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 1 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	205578701	Lao động giản đơn	03020301
46567	Đỗ Thành Nhân	2013-07-19	male	Kinh (Việt)	2588	None	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020302
46568	Nguyễn Cao Trí	2004-10-15	male	Kinh (Việt)	2588	secondary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	203574201	Lao động thủ công và các nghề nghiệp có liên quan khác	03020302
46569	Phạm Quang Dự	1985-10-16	male	Kinh (Việt)	2588	primary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	208760001	Nhân viên trợ lý văn phòng	03020302
46570	Nguyễn Duy Khang	1999-11-02	male	Kinh (Việt)	2588		Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	207169301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020302
46571	Trần Hữu Khải	2021-08-09	male	Kinh (Việt)	2588	None	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động giản đơn	03020302
46573	Lê Ngọc Bảo Phương	1993-02-12	female	Kinh (Việt)	2588	university	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	202443401	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03020302
46574	Trần Công Duy Bảo	1965-07-12	male	Kinh (Việt)	2588	primary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	206017401	Nhà chuyên môn bậc cao (đại học trở lên)	03020302
46575	Trần Sơn Duy	1968-08-14	male	Brâu	2588	none	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	203718701	Lực lượng vũ trang	03020302
46576	Trương Ái Phương	2008-02-09	female	Kinh (Việt)	2588	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03020302
46577	Lương Ái Hân	1985-06-24	female	Kinh (Việt)	2588	primary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	203925401	Nhân viên trợ lý văn phòng	03020302
46578	Nguyễn Ngô Mạnh Khang	1960-06-07	male	Kinh (Việt)	2588	primary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	204960401	Nhà chuyên môn bậc cao (đại học trở lên)	03020302
46579	Phạm Phước Minh Trí	1973-11-29	male	Khơ-me	2588	none	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	201085501	Nhân viên dịch vụ và bán hàng	03020302
46580	Nguyễn Quốc Thái	2013-04-18	male	La Chí	2588	None	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03020302
46581	Nguyễn Mỹ Tâm	1979-11-14	female	Kinh (Việt)	2588	none	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	204774701	Lao động giản đơn	03020302
46582	Ngô Thị Tú Thuận	2005-05-17	female	Kinh (Việt)	2588	primary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	205562401	Lực lượng vũ trang	03020302
46583	Tiêu Lệ Quân	1966-05-29	female	Kinh (Việt)	2588	secondary	Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	205870701	Lao động giản đơn	03020302
46584	Nguyễn Hoàng Minh	1998-10-30	male	Kinh (Việt)	2588		Không	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	206400401	Lao động giản đơn	03020302
46585	Huỳnh Hoàng Hải	1964-08-27	male	Kinh (Việt)	2588	secondary	Hồi giáo	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	206232901	Lao động giản đơn	03020302
46586	Lê Phan Thanh Thảo	1990-06-02	female	Kinh (Việt)	2588	none	Cơ đốc Phục lâm	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	Thôn 2 Xã Lý Bôn Huyện Bảo Lâm Tỉnh Cao Bằng	207941101	Lực lượng vũ trang	03020302
46587	Đặng Xuân Trường	1971-05-01	male	Kinh (Việt)	2591	primary	Phật giáo	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	205058801	Lao động giản đơn	03030101
46588	Nguyễn Trung Sơn	1977-08-03	male	Ba-na	2591	high	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	207591301	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030101
46589	Trương Đoàn Phi	2007-01-22	male	Thái	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030101
46590	Đoàn Lê Uyên Nhi	2010-04-26	female	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lực lượng vũ trang	03030101
46591	Lê Trung Hải	1962-12-14	male	Kinh (Việt)	2591	primary	Hồi giáo	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	207144601	Lao động giản đơn	03030101
46592	Nguyễn Hạnh Quyên	1960-04-18	female	Xinh-mun	2591	none	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	205634101	Thợ lắp ráp và vận hành máy móc, thiết bị	03030101
46593	Dương Ngọc Anh	2007-05-16	female	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030101
46594	Ngô Ngọc Hân	2014-06-04	female	Kinh (Việt)	2591	None	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03030101
46595	Nguyễn Thị Trúc Mai	2010-07-21	female	Tà-ôi	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030101
46596	Vũ Thành Lộc	2021-01-21	male	Kinh (Việt)	2591	None	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03030101
46597	Trần Vinh	1984-02-20	male	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	205566401	Lao động thủ công và các nghề nghiệp có liên quan khác	03030101
46598	Nguyễn Tuấn Tuấn	1970-07-23	male	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	200276201	Nhân viên dịch vụ và bán hàng	03030101
46599	Huỳnh Lê Nhật Thanh	2001-10-29	male	Kinh (Việt)	2591		Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	208193001	Lao động giản đơn	03030101
46600	Trần Lê Minh Khoa	1966-09-22	male	Tày	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	200183701	Lao động giản đơn	03030101
46601	Nguyễn Hồng Thiên Kim	2010-06-14	female	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Thợ lắp ráp và vận hành máy móc, thiết bị	03030101
46602	Nguyễn Trần Thiên Duy	1971-02-28	male	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	203274701	Lao động giản đơn	03030101
46603	Nguyễn Phương Anh	1976-06-09	female	Kinh (Việt)	2591		Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	206463901	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030101
46604	Phạm Đinh Cát Tường	1974-04-13	female	Kinh (Việt)	2591	none	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202723701	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030101
46605	Võ Phạm Khánh Như	1934-05-19	female	Kinh (Việt)	2591	primary	Minh Sư đạo	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	206420701	Lao động thủ công và các nghề nghiệp có liên quan khác	03030101
46606	Nguyễn Phúc Thịnh	2007-12-08	male	Kinh (Việt)	2591	primary	Không	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030101
46607	Vũ Đức Châu Anh	2003-07-19	female	Kinh (Việt)	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202923001	Lao động giản đơn	03030102
46608	Trần Lâm Thanh Tú	2003-09-15	female	Kinh (Việt)	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	200440101	Nhà chuyên môn bậc cao (đại học trở lên)	03030102
46609	Ngô Đức Đông Điền	2003-07-25	male	Kinh (Việt)	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202527801	Nhân viên trợ lý văn phòng	03030102
46610	Nguyễn Hồ Phương Quyên	2007-06-05	female	Kinh (Việt)	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03030102
46611	Trần Ngọc Anh Thư	1984-02-04	female	Kinh (Việt)	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202232801	Lao động giản đơn	03030102
46612	Ngô Nguyên Khang	2009-04-10	male	Kinh (Việt)	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030102
46613	Lê Như Ý	1980-09-27	female	Cơ-tu	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202515601	Lao động giản đơn	03030102
46614	Đào Ngọc Vương Anh	1997-04-12	female	Chu-ru	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	201092901	Lao động giản đơn	03030102
46615	Đặng Trường An	1977-07-25	female	Pà Thẻn	2592	none	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	201151801	Nhân viên dịch vụ và bán hàng	03030102
46616	Bùi Thị Linh Chi	1965-07-23	female	Kinh (Việt)	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	208053001	Lao động giản đơn	03030102
46617	Lê Nguyễn Kim Chi	2003-06-26	female	Kinh (Việt)	2592	secondary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	206894901	Lao động giản đơn	03030102
46618	Nguyễn Hữu Tài	2000-08-16	male	Kinh (Việt)	2592		Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202360201	Nhà chuyên môn bậc cao (đại học trở lên)	03030102
46619	Phan Trung Hiếu	1992-09-17	male	Kinh (Việt)	2592	university	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202278401	Tự do	03030102
46620	Huỳnh Thúy Duyên	1993-08-01	female	Kinh (Việt)	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	200787301	Tự do	03030102
46621	Phạm Thị Thanh Trúc	1970-05-31	female	Kinh (Việt)	2592	high	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	208860401	Lao động giản đơn	03030102
46622	Nguyễn Đặng Nhật Huy	1985-08-06	male	Thái	2592	high	Cơ đốc Phục lâm	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	200462101	Thợ lắp ráp và vận hành máy móc, thiết bị	03030102
46623	Võ Thị Mai Phương	2004-05-14	female	Cơ Lao	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	204593801	Nhà chuyên môn bậc cao (đại học trở lên)	03030102
46624	Danh Thị Kim Yến	2019-02-19	female	Kinh (Việt)	2592	None	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030102
46625	Trần Thị Yến Nhi	2008-03-09	female	Mảng	2592	primary	Không	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030102
46626	Hồ Nguyễn Kim Ngân	1998-06-30	female	Cống	2592		Minh lý đạo - Tam Tông Miếu	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Thị trấn Bảo Lạc Huyện Bảo Lạc Tỉnh Cao Bằng	202642701	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030102
46627	Tăng Bạch Ngọc	2014-02-22	female	Thái	2594	None	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030201
46628	Ngô Vương Thế Kiệt	1994-03-15	male	Kinh (Việt)	2594	high	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	200799601	Tự do	03030201
46629	Lê Nguyễn Thanh Huy	1986-11-24	male	Kinh (Việt)	2594	secondary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	206237601	Lao động giản đơn	03030201
46630	Nguyễn Tiến Đạt	2020-09-04	male	Kinh (Việt)	2594	None	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động thủ công và các nghề nghiệp có liên quan khác	03030201
46631	Nguyễn Hoàng Việt	1960-02-26	male	Kinh (Việt)	2594	none	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	200665301	Tự do	03030201
46632	Tiêu Doanh Doanh	2008-12-12	female	Kinh (Việt)	2594	primary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lực lượng vũ trang	03030201
46633	Dương Chí Bảo	1965-11-07	male	Kinh (Việt)	2594	secondary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	206015301	Lao động giản đơn	03030201
46634	Vũ Nguyễn Tú Anh	1963-05-29	female	Kinh (Việt)	2594	primary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	202793701	Nhân viên dịch vụ và bán hàng	03030201
46635	Lê Nguyễn Gia Hiệp	1987-11-04	male	Kinh (Việt)	2594	primary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	200285401	Nhân viên trợ lý văn phòng	03030201
46636	Võ Thị Bích Trâm	1926-04-22	female	Kinh (Việt)	2594	high	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	203193101	Lao động giản đơn	03030201
46637	Nguyễn Thị Ngọc Duyên	2017-03-26	female	Kinh (Việt)	2594	None	Cao đài	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Nhân viên trợ lý văn phòng	03030201
46638	Trang Phạm Quỳnh Như	1988-04-14	female	Kinh (Việt)	2594	high	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	205624201	Lao động giản đơn	03030201
46639	Nguyễn Hải Đăng	1981-09-09	male	Kinh (Việt)	2594	primary	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	202688501	Lực lượng vũ trang	03030201
46640	Huất Thanh Dũng	2004-10-23	male	Kinh (Việt)	2594	secondary	Bà-la-môn giáo	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	203717701	Tự do	03030201
46641	Trần Lê Xuân Bắc	1973-12-11	male	Tày	2594	secondary	Bửu Sơn Kỳ Hương	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	207092901	Nhân viên trợ lý văn phòng	03030201
46642	Dương Nguyễn Đăng Khoa	1979-12-09	male	Kinh (Việt)	2594	none	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	207200701	Lao động giản đơn	03030201
46643	Ngô Minh Khoa	1986-09-09	male	Kinh (Việt)	2594	high	Phật giáo	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	200922801	Lao động giản đơn	03030201
46644	Võ Huỳnh Khánh Như	2014-11-09	female	Dao	2594	None	Cơ đốc Phục lâm	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lực lượng vũ trang	03030201
46645	Lê Thị Phương Huỳnh	2015-04-10	female	Kinh (Việt)	2594	None	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030201
46646	Võ Trần Luân	2021-03-05	male	Kinh (Việt)	2594	None	Không	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030201
46647	Trần Minh Phương	2007-09-01	male	Kinh (Việt)	2595	primary	Minh Sư đạo	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Nhân viên dịch vụ và bán hàng	03030202
46648	Nguyễn Ngọc Xuân Hồng	1954-11-21	female	Kinh (Việt)	2595	none	Baha'I	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	206050401	Nhân viên trợ lý văn phòng	03030202
46649	Nguyễn Thị Song Hương	1984-09-18	female	Kinh (Việt)	2595	secondary	Bửu Sơn Kỳ Hương	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	204373701	Lao động giản đơn	03030202
46650	Vũ Thanh Hoài	1997-07-24	male	Khơ-me	2595	high	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	204931701	Nhân viên dịch vụ và bán hàng	03030202
46651	Nguyễn Thiện Lĩnh	2017-04-11	male	Brâu	2595	None	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Nhà chuyên môn bậc cao (đại học trở lên)	03030202
46652	Trần Thị Thạch Thảo	2005-04-24	female	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	208613301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03030202
46653	Trần Đào Bảo Minh	1969-11-23	male	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	203541901	Lực lượng vũ trang	03030202
46654	Huỳnh Ngọc Trường	1928-02-27	male	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	206857701	Lao động giản đơn	03030202
46655	Đào Huỳnh Anh Khoa	1976-08-17	male	Kinh (Việt)	2595		Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	207519301	Lực lượng vũ trang	03030202
46656	Đỗ Ngọc Phương Anh	2015-03-16	female	Kinh (Việt)	2595	None	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030202
46657	Nguyễn Minh Ngọc	1962-11-13	female	Kinh (Việt)	2595	none	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	205453201	Lao động giản đơn	03030202
46658	Nguyễn Thị Phương Liên	2008-09-19	female	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030202
46659	Nguyễn Lê Mỹ Tâm	1934-10-15	female	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	208127701	Lao động giản đơn	03030202
46660	Lê Thị Trúc Phương	1959-06-15	female	Kinh (Việt)	2595	none	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	204715701	Lao động giản đơn	03030202
46661	Lê Hoàng Bảo Trâm	1971-07-29	female	Mảng	2595	primary	Phật giáo	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	201995901	Lao động giản đơn	03030202
46662	Nguyễn Minh Trâm	2002-09-29	female	Kinh (Việt)	2595		Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	207826601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03030202
46663	Lâm Quỳnh Như	2004-08-17	female	Kinh (Việt)	2595	secondary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	202994901	Nhân viên trợ lý văn phòng	03030202
46664	Tiêu Thiên Ngọc	2009-07-02	female	Kinh (Việt)	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030202
46665	Phan Lê Cát Tường	1978-03-04	female	Cơ-ho	2595	primary	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	200277601	Lao động giản đơn	03030202
46666	Nguyễn Thoại Khả Trân	1965-03-30	female	Kinh (Việt)	2595	none	Không	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Cốc Pàng Huyện Bảo Lạc Tỉnh Cao Bằng	208904801	Lao động giản đơn	03030202
46667	Nguyễn Đình Tiến Dũng	2003-01-29	male	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	203023101	Nhân viên dịch vụ và bán hàng	03030301
46668	Nguyễn Cao Kiều Duyên	1983-06-08	female	Kinh (Việt)	2597	primary	Bà-la-môn giáo	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204920401	Nhân viên dịch vụ và bán hàng	03030301
46669	Bùi Nhật Uyên	1994-01-15	female	Kinh (Việt)	2597	secondary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	205507401	Lao động giản đơn	03030301
46670	Hồ Ngọc Bảo Quỳnh	1998-11-03	female	Sán Dìu	2597		Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	203244501	Lao động giản đơn	03030301
46671	Lê Gia Thống	1977-04-06	male	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	202783401	Thợ lắp ráp và vận hành máy móc, thiết bị	03030301
46672	Mai Quỳnh Tương	2001-10-25	female	Kinh (Việt)	2597		Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	200545501	Tự do	03030301
46673	Nguyễn Thị Thanh Tâm	2010-07-06	female	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030301
46674	Trương Nguyễn Hoàng Long	1964-01-11	male	Kinh (Việt)	2597	none	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	202326901	Lao động giản đơn	03030301
46675	Trần Lương Thiên Ngọc	2020-10-05	female	Kinh (Việt)	2597	None	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030301
46676	Nguyễn Quốc Khải	1976-03-13	male	Kinh (Việt)	2597		Phật giáo Hòa Hảo	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204678201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030301
46677	Lê Nguyễn Khánh Uyên	1947-01-28	female	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	205508301	Lao động giản đơn	03030301
46678	Hồ Thanh Thảo	1938-09-21	female	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	201393301	Lao động giản đơn	03030301
46679	Trương Thị Kim Ngân	1973-12-31	female	Kinh (Việt)	2597	none	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204697901	Lao động giản đơn	03030301
46680	Đặng Đức Anh	1978-05-15	male	Kinh (Việt)	2597	none	Công giáo	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	200966301	Tự do	03030301
46681	Đặng Công Thành	2010-04-22	male	Thái	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030301
46682	Nguyễn Tất Anh Minh	2008-12-25	male	Xinh-mun	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030301
46683	Nguyễn Phúc Thịnh	2016-02-12	male	Kinh (Việt)	2597	None	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Tự do	03030301
46684	Ngô Gia Hân	1967-06-18	female	Kinh (Việt)	2597	none	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	205739501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030301
46685	Tô Thanh Nhã	2003-10-21	female	Kinh (Việt)	2597	primary	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	206598301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	03030301
46686	Phạm Ngọc Thư	2015-03-18	female	Kinh (Việt)	2597	None	Không	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 1 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Thợ lắp ráp và vận hành máy móc, thiết bị	03030301
46687	Trần Văn Đạt	1958-01-10	male	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	208689401	Nhà chuyên môn bậc cao (đại học trở lên)	03030302
46688	Phan Nhật Trường	1963-05-26	male	Kinh (Việt)	2598	primary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	200716401	Lao động giản đơn	03030302
46689	Đinh Hoàng Duy Sơn	1977-01-15	male	Kinh (Việt)	2598	none	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	202555701	Lao động giản đơn	03030302
46690	Mạc Tấn Hưng	1952-02-25	male	Kinh (Việt)	2598	high	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	201414501	Nhà chuyên môn bậc cao (đại học trở lên)	03030302
46691	Lê Trần Nhã Lynh	2015-09-10	female	Kinh (Việt)	2598	None	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	03030302
46692	Nguyễn Quốc Hào	1958-07-17	male	Khơ-me	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	203860901	Lao động giản đơn	03030302
46693	Kiều Thị Thúy Bông	1966-10-11	female	Kinh (Việt)	2598	high	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204499301	Lao động giản đơn	03030302
46694	Trần Nguyễn Quỳnh Như	2020-07-10	female	Kinh (Việt)	2598	None	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lực lượng vũ trang	03030302
46695	Nguyễn Vũ Hoàng Oanh	1960-08-19	female	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	203553801	Tự do	03030302
46696	Bùi Châu Khánh Đan	2004-01-23	female	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	207676801	Lao động thủ công và các nghề nghiệp có liên quan khác	03030302
46697	Nguyễn Chấn Hưng	2009-11-10	male	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030302
46698	Lý Niệm Du	1964-01-19	female	Bru-Vân Kiều	2598	none	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	203917301	Lao động giản đơn	03030302
46699	Lê Hoàng Tuấn	1989-03-06	male	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	208311001	Lao động thủ công và các nghề nghiệp có liên quan khác	03030302
46700	Trần Đặng Nam Anh	1994-02-02	male	Kinh (Việt)	2598	secondary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	200604501	Lao động giản đơn	03030302
46701	Hồ Thị Ngọc Thảo	2005-11-25	female	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	205361901	Lao động giản đơn	03030302
46702	Lê Thị Bảo Ngọc	2005-06-28	female	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204762701	Lao động giản đơn	03030302
46703	Nguyễn Tấn Lộc	1958-02-19	male	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	202635701	Lao động giản đơn	03030302
46704	Trần Lê Trọng Trí	2001-11-23	male	Kinh (Việt)	2598		Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	204337201	Lao động giản đơn	03030302
46705	Nguyễn Minh Thư	1970-05-29	female	Kinh (Việt)	2598	none	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	200891201	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	03030302
46706	Võ Lệ Quyên	2008-01-01	female	Kinh (Việt)	2598	primary	Không	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng	Thôn 2 Xã Thượng Hà Huyện Bảo Lạc Tỉnh Cao Bằng		Lao động giản đơn	03030302
46707	Trần Thị Thục Đoan	1973-02-01	female	Kinh (Việt)	2602	primary	Công giáo	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201649301	Lao động giản đơn	04010101
46708	Trần Thị Liễu	1973-08-30	female	Kinh (Việt)	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208352401	Lao động giản đơn	04010101
46709	Võ Thị Minh Trang	1968-04-13	female	Tày	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207360501	Tự do	04010101
46710	Huỳnh Yến Nhi	1967-09-12	female	Kinh (Việt)	2602	none	Phật giáo Hòa Hảo	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206129301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04010101
46711	Nguyễn Đức Minh	1971-07-10	male	Kinh (Việt)	2602	secondary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203344001	Lao động giản đơn	04010101
46712	Phan Ngọc Thanh	1979-05-06	female	Kinh (Việt)	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206571001	Lao động giản đơn	04010101
46713	Dương Mạnh Khôi	1972-11-16	male	Kinh (Việt)	2602	none	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200083401	Lao động giản đơn	04010101
46714	Nguyễn Hồng Vân	1976-12-03	female	Kinh (Việt)	2602		Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208313101	Tự do	04010101
46715	Hoàng Ngọc Quỳnh	1958-06-06	female	Kinh (Việt)	2602	none	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203431801	Lao động giản đơn	04010101
46716	Huỳnh Thạch Minh Đức	2008-03-19	male	Kinh (Việt)	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010101
46717	Phan Thanh Thảo Nguyên	2001-08-24	female	Pà Thẻn	2602		Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200578701	Lao động giản đơn	04010101
46718	Trần Minh Hiếu	1989-04-05	male	Kinh (Việt)	2602	none	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203465801	Lao động giản đơn	04010101
46719	Huỳnh Thị Bích Ngọc	1973-11-01	female	Kinh (Việt)	2602	high	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207553501	Nhân viên trợ lý văn phòng	04010101
46720	Đinh Huỳnh Tuyết Nga	1979-04-06	female	Kinh (Việt)	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201903301	Nhà chuyên môn bậc cao (đại học trở lên)	04010101
46905	Huỳnh Trường Vũ	2000-08-07	male	Kinh (Việt)	2616		Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	208417101	Lao động giản đơn	04020202
46721	Nguyễn Thị Thanh Hiền	1958-11-27	female	Pà Thẻn	2602	secondary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201581701	Tự do	04010101
46722	Huỳnh Lê An Phú	1959-10-22	male	Kinh (Việt)	2602	none	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200482401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010101
46723	Lê Nguyễn Nhật Anh	1976-12-11	male	Kinh (Việt)	2602		Phật giáo	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203708401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010101
46724	Phạm Tiến Dũng	1929-10-30	male	Kinh (Việt)	2602	secondary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203082401	Lao động giản đơn	04010101
46725	Nguyễn Duy Nghĩa	2003-10-11	male	Kinh (Việt)	2602	primary	Minh Sư đạo	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203351901	Lực lượng vũ trang	04010101
46726	Nguyễn Minh Anh	1978-10-26	female	Kinh (Việt)	2602	primary	Không	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207377501	Lao động giản đơn	04010101
46727	Nguyễn Thanh Vĩnh Lâm	2005-09-12	male	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208454301	Lao động giản đơn	04010102
46728	Trần Minh Nhật	1962-03-06	male	Kinh (Việt)	2603	high	Mặc môn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202755601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010102
46729	Đinh Ngọc Thái	1941-04-07	male	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208611101	Tự do	04010102
46730	Dương Tú Vy	1924-11-25	female	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200331501	Lực lượng vũ trang	04010102
46731	Trịnh Cao Minh Hoàng	1983-05-03	male	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201531401	Lao động giản đơn	04010102
46732	Mầu Thị Minh Anh	1972-01-11	female	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207074201	Lao động giản đơn	04010102
46733	Trần Minh Quang	2012-07-21	male	Kinh (Việt)	2603	None	Bà-la-môn giáo	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04010102
46734	Nguyễn Thùy Linh	2003-11-08	female	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203960201	Lao động giản đơn	04010102
46735	Trần Quốc Thái Dương	1997-01-20	male	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206032001	Lao động giản đơn	04010102
46736	Trần Bùi Đức Thuận	1975-02-09	male	Kinh (Việt)	2603	none	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200774401	Lao động giản đơn	04010102
46737	Nguyễn Bảo Trâm	1994-09-10	female	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203316901	Lao động thủ công và các nghề nghiệp có liên quan khác	04010102
46738	Lý Thu Ngân	1973-11-10	female	Thái	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202030401	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010102
46739	Tôn Thất Phúc	1977-04-10	male	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207586501	Lao động giản đơn	04010102
46740	Đào Đăng Khoa	1963-09-08	male	Kinh (Việt)	2603	none	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201170501	Lao động giản đơn	04010102
46741	Lễ Hữu Nghị	1993-09-04	male	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204698601	Thợ lắp ráp và vận hành máy móc, thiết bị	04010102
46742	Trần Nữ Quỳnh Như	2018-07-07	female	Kinh (Việt)	2603	None	Cao đài	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Nhân viên dịch vụ và bán hàng	04010102
46743	Trần Thanh Trúc	1992-03-14	female	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203321601	Lao động giản đơn	04010102
46744	Trịnh Nam Thanh	1969-11-08	male	Kinh (Việt)	2603	primary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203250301	Lao động giản đơn	04010102
46745	Nhan Hoàng Anh Thư	1995-05-11	female	Kinh (Việt)	2603	secondary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201557501	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04010102
46746	Nguyễn Ánh Tuyết	1975-09-26	female	Kinh (Việt)	2603	primary	Không	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Nguyễn Thị Minh Khai Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206272601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04010102
46747	Nguyễn Huỳnh Anh	1967-07-09	female	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207467501	Nhân viên dịch vụ và bán hàng	04010201
46748	Nguyễn Ngọc Mỹ Tiên	1955-11-11	female	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	205372401	Lao động giản đơn	04010201
46749	Nguyễn Thị Thu Hiền	1996-12-17	female	Kinh (Việt)	2605	high	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207688601	Lao động giản đơn	04010201
46750	Trịnh Quỳnh Lam	2008-12-17	female	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010201
46751	Bùi Bình Thiên	1980-01-06	male	Kinh (Việt)	2605	none	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200106201	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010201
46752	Nguyễn Ái Nhi	2013-01-12	female	Kinh (Việt)	2605	None	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lực lượng vũ trang	04010201
46753	Vũ Ngọc Long	2005-03-24	male	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201894201	Lao động thủ công và các nghề nghiệp có liên quan khác	04010201
46754	Trần Ngọc Diễm Hằng	2012-04-28	female	Kinh (Việt)	2605	None	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010201
46755	Nguyễn Phạm Ngọc Quỳnh	1977-10-05	female	Kinh (Việt)	2605	none	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203124401	Lao động giản đơn	04010201
46756	Đỗ Nhật Huy	1976-10-20	male	Kinh (Việt)	2605		Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	205284401	Nhân viên dịch vụ và bán hàng	04010201
46757	Phan Tấn Hậu	2000-01-25	male	Kinh (Việt)	2605		Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204121701	Lao động giản đơn	04010201
46758	Nguyễn Trần Gia Long	1995-03-28	male	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208702001	Lao động giản đơn	04010201
46759	Lin Huy Thắng	1967-04-29	male	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204480801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04010201
46760	Bùi Nguyễn Minh Quân	1960-04-05	male	Kinh (Việt)	2605	high	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207032901	Lao động giản đơn	04010201
46761	Ngô Thị Phương	1981-07-07	female	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204260001	Lao động giản đơn	04010201
46762	Lưu Nhật Nguyên	1997-04-24	male	Thái	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	208833401	Lao động giản đơn	04010201
46763	Phan Hoàng Nhật Minh	1951-02-19	male	Tày	2605		Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206974901	Tự do	04010201
46764	Quách Thị Hồng Nhung	1984-12-22	female	Kinh (Việt)	2605	high	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206781601	Lao động giản đơn	04010201
46765	Tô Duy Nguyên Hoàng	1965-01-27	male	Kinh (Việt)	2605	none	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200982301	Lao động giản đơn	04010201
46766	Trương Thị Ngọc Hân	2010-10-30	female	Kinh (Việt)	2605	primary	Không	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010201
46767	Trịnh Ngọc Khánh	1986-10-02	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200182201	Lao động giản đơn	04010202
46768	Phạm Hoàng Vỹ	2018-09-11	male	Kinh (Việt)	2606	None	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010202
46769	Trần Nhật Huy	2010-05-30	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010202
46770	Trần Quốc Tú	1970-04-24	male	Kinh (Việt)	2606	none	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204542901	Lao động giản đơn	04010202
46771	Nguyễn Lê Nhật Minh	1966-11-10	male	Kinh (Việt)	2606	none	Bửu Sơn Kỳ Hương	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202482901	Lao động giản đơn	04010202
46772	Trần Nguyễn Ngọc Linh	1982-07-15	female	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202634401	Lao động giản đơn	04010202
46773	Nguyễn Lâm Thiên Lộc	1995-12-26	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204968601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04010202
46774	Hồ Thị Thu Thủy	1955-04-20	female	Tà-ôi	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200225801	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010202
46775	Trần Viết Tài	1978-01-25	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204994901	Lao động giản đơn	04010202
46776	Châu Ý Nhi	1975-06-13	female	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207560501	Lao động giản đơn	04010202
46777	Trương Thị Quế Dương	1960-04-15	female	Tày	2606	secondary	Minh Sư đạo	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	205267301	Lao động giản đơn	04010202
46778	Võ Chung Thắng	1966-03-08	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202167701	Lao động thủ công và các nghề nghiệp có liên quan khác	04010202
46779	Nguyễn Tuấn Đạt	1993-10-28	male	Kinh (Việt)	2606	primary	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207678301	Lao động giản đơn	04010202
46780	Ki Phối Ân	2019-03-22	female	Thái	2606	None	Tịnh độ Cư sỹ Phật hội	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010202
46781	Châu Bảo Hân	2020-10-21	female	Kinh (Việt)	2606	None	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010202
46782	Phạm Trung Trí	1959-04-22	male	Si La	2606	none	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203898101	Tự do	04010202
46783	Trần Thoại Nhi	1999-04-15	female	Kinh (Việt)	2606		Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202144601	Lao động giản đơn	04010202
46784	Hoàng Xuân Đạt	1932-02-17	male	Tà-ôi	2606	primary	Phật giáo	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203024701	Nhà chuyên môn bậc cao (đại học trở lên)	04010202
46785	Tô Ngọc Minh Châu	2001-10-13	female	Kinh (Việt)	2606		Baha'I	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207858301	Lao động giản đơn	04010202
46786	Phạm Ngọc Thảo	2013-06-16	female	Kinh (Việt)	2606	None	Không	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Sông Cầu Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010202
46787	Nguyễn Gia Bảo	1978-02-27	male	Kinh (Việt)	2608	high	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	205079801	Lao động giản đơn	04010301
46788	Hồ Trần Quốc Cường	1996-07-15	male	Kinh (Việt)	2608	primary	Baha'I	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202260201	Tự do	04010301
46789	Hoàng Vĩnh Linh	1977-05-18	male	Kinh (Việt)	2608	high	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202538101	Thợ lắp ráp và vận hành máy móc, thiết bị	04010301
46790	Huỳnh Thiện Nhân	1989-08-16	male	Kinh (Việt)	2608	none	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201783701	Lao động giản đơn	04010301
46791	Nguyễn Thị Thanh Thúy	2007-09-15	female	Kinh (Việt)	2608	primary	Phật giáo Hòa Hảo	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động thủ công và các nghề nghiệp có liên quan khác	04010301
46792	Ngô Gia Quốc Thống	2004-11-28	male	Kinh (Việt)	2608	primary	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207239901	Lao động thủ công và các nghề nghiệp có liên quan khác	04010301
46793	Phan Quốc Đạt	1998-10-08	male	Kinh (Việt)	2608		Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	206035301	Lao động giản đơn	04010301
46794	Phạm Minh Thùy	1924-05-30	female	Kinh (Việt)	2608	none	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200533901	Lao động giản đơn	04010301
46795	Lê Đức Thiện	1982-10-25	male	Kinh (Việt)	2608	high	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204483001	Lực lượng vũ trang	04010301
46796	Trần Hoài Nam	2019-07-14	male	Kinh (Việt)	2608	None	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động thủ công và các nghề nghiệp có liên quan khác	04010301
46797	Lê Trung Sơn	2015-02-21	male	Kinh (Việt)	2608	None	Công giáo	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010301
46798	Nguyễn Hữu Phú Đăng	1977-10-09	male	Kinh (Việt)	2608	university	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203592601	Lao động giản đơn	04010301
46799	Trần Lê Thúy Anh	2008-06-17	female	Kinh (Việt)	2608	primary	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Tự do	04010301
46800	Nguyễn Thành Nhân	2021-09-11	male	Kinh (Việt)	2608	None	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04010301
46801	Nguyễn Thị Phương Quyên	1992-05-24	female	Kinh (Việt)	2608	high	Phật giáo Hòa Hảo	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201007801	Nhà chuyên môn bậc cao (đại học trở lên)	04010301
46802	Nguyễn Anh Thái	1971-09-21	male	Kinh (Việt)	2608	primary	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204474501	Lao động giản đơn	04010301
46803	Nguyễn Lê Huy	1991-09-23	male	Cơ-ho	2608		Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	207399501	Lao động giản đơn	04010301
46804	Trần Thị Hồng Yến	1973-01-12	female	Kinh (Việt)	2608	primary	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202516301	Nhân viên dịch vụ và bán hàng	04010301
46805	Nguyễn Hào Kiệt	2020-05-10	male	Kinh (Việt)	2608	None	Không	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010301
46806	Đỗ Thành Lộc	2020-07-22	male	Mảng	2608	None	Minh lý đạo - Tam Tông Miếu	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 1 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010301
46807	Nguyễn Trương Ngọc Khánh	1995-04-12	female	Kinh (Việt)	2609	primary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202970501	Lao động giản đơn	04010302
46808	Nguyễn Tấn Huy	1987-09-22	male	Kinh (Việt)	2609	high	Minh Sư đạo	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200290801	Lao động giản đơn	04010302
46809	Nguyễn Hoàng Phương Duyên	1971-10-30	female	Kinh (Việt)	2609	primary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202186301	Nhân viên dịch vụ và bán hàng	04010302
46810	Lê Đặng Như Quỳnh	2010-10-05	female	Kinh (Việt)	2609	primary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Nhà chuyên môn bậc cao (đại học trở lên)	04010302
46811	Đặng Ngọc Vy	1986-04-23	female	Kinh (Việt)	2609	primary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201687801	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04010302
46812	Hà Linh Vy	1939-01-04	female	Kinh (Việt)	2609	none	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200060601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04010302
46813	Phạm Trí Đức	1989-09-11	male	Kinh (Việt)	2609	high	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202935601	Lao động thủ công và các nghề nghiệp có liên quan khác	04010302
46814	Trịnh Vũ Nguyên	2019-08-02	male	Kinh (Việt)	2609	None	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động thủ công và các nghề nghiệp có liên quan khác	04010302
46815	Trần Nguyễn Thanh Ngân	1968-08-21	female	Kinh (Việt)	2609	university	Bửu Sơn Kỳ Hương	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202643601	Lao động giản đơn	04010302
46816	Nguyễn Quang Huy	1985-05-17	male	Kinh (Việt)	2609	primary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201585001	Lao động giản đơn	04010302
46817	Lưu Thanh Hỷ	1964-07-17	male	Kinh (Việt)	2609	secondary	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201224301	Lao động giản đơn	04010302
46818	Lê Ngọc Linh	1996-07-19	female	Kinh (Việt)	2609	primary	Bà-la-môn giáo	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200188601	Lao động giản đơn	04010302
46819	Võ Nguyễn Kim Xuyến	1966-04-03	female	Kinh (Việt)	2609	high	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202246601	Lao động thủ công và các nghề nghiệp có liên quan khác	04010302
46820	Hồ Quốc Trường	1995-06-23	male	Nùng	2609	university	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	201679401	Lao động thủ công và các nghề nghiệp có liên quan khác	04010302
46821	Bùi Thị Anh Thư	2019-03-09	female	Kinh (Việt)	2609	None	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Lao động giản đơn	04010302
46822	Nguyễn Thị Thu Ngân	1945-10-21	female	Kinh (Việt)	2609	none	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	202213601	Lao động giản đơn	04010302
46823	Nguyễn Lê Thanh	2013-05-04	male	Kinh (Việt)	2609	None	Không	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn		Tự do	04010302
46824	Tô Khải Minh	1962-12-10	male	Kinh (Việt)	2609	secondary	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	200804901	Lao động giản đơn	04010302
46825	Mai Thị Bích Trâm	1954-08-26	female	Hà nhì	2609	none	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	204223701	Thợ lắp ráp và vận hành máy móc, thiết bị	04010302
46826	Nguyễn Bùi Ánh Nguyệt	1982-11-06	female	Kinh (Việt)	2609	primary	Phật giáo	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	Thôn 2 Phường Đức Xuân Thành Phố Bắc Kạn Tỉnh Bắc Kạn	203356301	Lao động giản đơn	04010302
46827	Nguyễn Nhật Hào	1959-11-10	male	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	208543901	Lao động giản đơn	04020101
46828	Trần Thị Thúy An	2004-01-01	female	Cơ Lao	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	202786801	Lao động giản đơn	04020101
46829	Huỳnh Khải Nhạn	2015-10-31	female	Kinh (Việt)	2612	None	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020101
46830	Diệp Thanh Tùng	1943-12-14	male	Kinh (Việt)	2612	none	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	200116201	Lực lượng vũ trang	04020101
46831	Nguyễn Phú Thịnh	2017-04-21	male	Kinh (Việt)	2612	None	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04020101
46832	Nguyễn Bảo Châu	1986-12-24	female	Ngái	2612	none	Mặc môn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205256901	Nhân viên dịch vụ và bán hàng	04020101
46833	Trịnh Thái Anh Thư	1964-06-15	female	Kinh (Việt)	2612	none	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	202946401	Nhân viên dịch vụ và bán hàng	04020101
46834	Lâm Gia Nghi	2015-06-13	female	Kinh (Việt)	2612	None	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020101
46835	Nguyễn Đăng Chương	1964-11-17	male	Tày	2612	none	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	203588101	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020101
46836	Trần Hữu Luân	1983-03-31	male	Kinh (Việt)	2612	high	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	208101701	Lao động giản đơn	04020101
46837	Nguyễn Quách Hạ Vy	1994-10-05	female	Kinh (Việt)	2612	high	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	206219501	Lao động giản đơn	04020101
46838	Nguyễn Ngọc Quỳnh	2004-08-26	female	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205635901	Lao động giản đơn	04020101
46839	Nguyễn Tấn Hưng	1968-05-09	male	Kinh (Việt)	2612	secondary	Phật giáo	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	200293401	Lao động giản đơn	04020101
46840	Nguyễn Huỳnh Bảo Trâm	1994-12-26	female	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	207047801	Lao động giản đơn	04020101
46841	Phạm Trần Hoàng Nhi	1971-12-23	female	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	207909301	Lao động giản đơn	04020101
46842	Nguyễn Hoàng Việt	1973-08-15	male	Kinh (Việt)	2612	none	Cao đài	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	208313701	Lao động giản đơn	04020101
46843	Văn Ngọc Phương Anh	1963-10-07	female	Kinh (Việt)	2612	high	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	201632701	Lao động giản đơn	04020101
46844	Lê Nguyễn Phương Uyên	1975-12-12	female	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	202304001	Thợ lắp ráp và vận hành máy móc, thiết bị	04020101
46845	Nguyễn Khoa Trường	1997-08-31	male	Kinh (Việt)	2612	high	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	207055701	Nhân viên trợ lý văn phòng	04020101
46846	Phạm Thế Phong	1966-07-08	male	Kinh (Việt)	2612	primary	Không	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	200881301	Lao động giản đơn	04020101
46847	Dương Ngân Hà	1995-03-12	female	Kinh (Việt)	2613	high	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	202810201	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020102
46848	Nguyễn Đình Quang	2018-04-05	male	Kinh (Việt)	2613	None	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020102
46849	Lâm Phước Hùng	1964-12-26	male	Gié-Triêng	2613	high	Cơ đốc Phục lâm	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	206527601	Lao động giản đơn	04020102
46850	Phan Hoài Bảo	2000-03-26	male	Kinh (Việt)	2613		Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	206226501	Lao động giản đơn	04020102
46851	Phạm Thanh Hòa	2002-05-25	male	Kinh (Việt)	2613		Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205747601	Lao động giản đơn	04020102
46852	Trần Minh Thảo	1973-12-03	female	Thái	2613	secondary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	206627801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020102
46853	Trần Ngọc Thạch	1962-12-20	male	Tày	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	207793801	Lao động giản đơn	04020102
46854	Đặng Vĩnh Hào	2008-04-18	male	Kinh (Việt)	2613	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Nhân viên trợ lý văn phòng	04020102
46855	Huỳnh Bảo Kỳ	1984-08-11	female	Kinh (Việt)	2613	none	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205782901	Lao động giản đơn	04020102
46856	Nguyễn Thảo Nguyên	2018-07-20	female	Kinh (Việt)	2613	None	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Nhà chuyên môn bậc cao (đại học trở lên)	04020102
46857	Lê Uyên Nhi	1970-03-03	female	Kinh (Việt)	2613	high	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	202992001	Lao động giản đơn	04020102
46858	Thân Thiên Trọng Nhân	2004-08-20	male	Kinh (Việt)	2613	primary	Bửu Sơn Kỳ Hương	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	208010901	Lao động giản đơn	04020102
46859	Từ Bái Đạt	1968-10-28	male	Kinh (Việt)	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205416501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020102
46882	Võ Ngọc Thanh Trúc	1997-05-17	female	Ra-glai	2615	high	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	206447601	Lao động giản đơn	04020201
46860	Ngô Tấn Hào	1980-05-13	male	Cơ Lao	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	206376501	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020102
46861	Huỳnh Minh Kha	2014-03-22	male	Kinh (Việt)	2613	None	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020102
46862	Cao Thị Thảo Nhi	2008-09-04	female	Kinh (Việt)	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020102
46863	Huỳnh Tuấn Vĩ	1972-10-23	male	Kinh (Việt)	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205991501	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020102
46864	Phan Minh Chánh	2018-09-13	male	Kinh (Việt)	2613	None	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Tự do	04020102
46865	Lê Nguyễn Thiên Phúc	2010-10-09	male	Kinh (Việt)	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020102
46866	Nguyễn Thị Như Ý	1924-08-21	female	Kinh (Việt)	2613	primary	Không	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bằng Thành Huyện Pác Nặm Tỉnh Bắc Kạn	205516001	Lao động giản đơn	04020102
46867	Lê Nguyễn Bảo Nghi	2000-07-28	female	Kinh (Việt)	2615		Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	203968801	Lao động giản đơn	04020201
46868	Lê Linh Trường Bảo Trâm	1965-07-03	female	Kinh (Việt)	2615	primary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204535501	Nhân viên trợ lý văn phòng	04020201
46869	Hồ Xuân Quý	2005-05-25	male	Kinh (Việt)	2615	secondary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204595601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020201
46870	Bùi Mai Minh Thương	1961-07-28	female	Kinh (Việt)	2615	primary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	208648601	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020201
46871	Phan Phạm Thiên Ân	2010-06-02	male	Kinh (Việt)	2615	primary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020201
46872	Nguyễn Đoàn Phương Anh	2015-02-04	female	Kinh (Việt)	2615	None	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020201
46873	Phạm Thanh Phương	1987-08-27	female	Tày	2615	primary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	200213301	Nhà chuyên môn bậc cao (đại học trở lên)	04020201
46874	Lê Hoàng Phương Ánh	1993-04-15	female	Khơ-mú	2615	high	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	201571701	Lao động giản đơn	04020201
46875	Lê Ngọc Hà Linh	1984-10-23	female	Ra-glai	2615	none	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207727501	Lao động giản đơn	04020201
46876	Trần Minh Hiếu	1983-02-01	male	Thái	2615	university	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	206699901	Lao động giản đơn	04020201
46877	Nguyễn Thu Hằng	2020-03-25	female	Sán Chay	2615	None	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Tự do	04020201
46878	Đặng Bảo Sơn	1977-04-16	male	Kinh (Việt)	2615	none	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207789601	Lao động giản đơn	04020201
46879	Đỗ Minh Tuấn	1972-05-27	male	Kinh (Việt)	2615	none	Hồi giáo	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	206449501	Lao động giản đơn	04020201
46880	Nguyễn Lý Quỳnh Hương	2020-04-20	female	Giáy	2615	None	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020201
46881	Lê Hồ Phương Uyên	1995-08-01	female	Kinh (Việt)	2615	secondary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	203201601	Lao động giản đơn	04020201
46883	Nguyễn Hồng Phúc	2018-11-25	male	Kinh (Việt)	2615	None	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04020201
46884	Trần Hoàng Giao Tiên	1984-04-10	female	Kinh (Việt)	2615	none	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	208495701	Lao động giản đơn	04020201
46885	Huỳnh Quốc Nam	2016-07-11	male	Tày	2615	None	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020201
46886	Kiều Nguyễn Việt Hùng	2008-06-30	male	Lô lô	2615	primary	Không	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Nhà chuyên môn bậc cao (đại học trở lên)	04020201
46887	Trương Vĩnh Phúc	1969-02-22	male	Kinh (Việt)	2616	primary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	200318501	Lao động giản đơn	04020202
46888	Nguyễn Đức Thành	1997-08-12	male	Kinh (Việt)	2616	secondary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204476301	Lao động giản đơn	04020202
46889	Chu Minh Quốc	1973-11-03	male	Kinh (Việt)	2616	secondary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204990401	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04020202
46890	Trịnh Dương Vân Anh	1972-08-04	female	Kinh (Việt)	2616	primary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	205673601	Tự do	04020202
46891	Nguyễn Tường Vy	1969-02-28	female	Kinh (Việt)	2616	primary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204793301	Lao động giản đơn	04020202
46892	Trương Nguyên Khoa	1988-08-27	male	Kinh (Việt)	2616	secondary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	202477301	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020202
46893	Trương Thị Hồng Thắm	1977-11-18	female	Kinh (Việt)	2616	secondary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	204999001	Lao động giản đơn	04020202
46894	Trần Tuấn Kiệt	2012-05-04	male	Kinh (Việt)	2616	None	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020202
46895	Trương Quốc Huy	2015-02-14	male	Kinh (Việt)	2616	None	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020202
46896	Đào Hải Đăng	1988-10-11	male	Kinh (Việt)	2616	none	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	202078701	Lao động giản đơn	04020202
46897	Phạm Hồng My Sa	1988-10-16	female	Kinh (Việt)	2616	primary	Minh lý đạo - Tam Tông Miếu	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	208485901	Lao động thủ công và các nghề nghiệp có liên quan khác	04020202
46898	Ngô Hoàng Anh Tuấn	1984-06-01	male	Kinh (Việt)	2616	primary	Minh Sư đạo	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207307301	Lao động giản đơn	04020202
46899	Trương Hoàng Yến Nhi	1980-07-04	female	Kinh (Việt)	2616	none	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	200581301	Thợ lắp ráp và vận hành máy móc, thiết bị	04020202
46900	Tống Nữ Thảo Anh	2006-05-01	female	Kinh (Việt)	2616	primary	Tin lành	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020202
46901	Huỳnh Đắc Anh Thư	1967-09-24	female	Kinh (Việt)	2616	high	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	201399601	Lao động giản đơn	04020202
46902	Bùi Nguyễn Vĩnh Hưng	1932-10-18	male	Kinh (Việt)	2616	primary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	202110601	Nhà chuyên môn bậc cao (đại học trở lên)	04020202
46903	Phan Anh Khải	1984-10-26	male	Kinh (Việt)	2616	primary	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207516701	Lao động giản đơn	04020202
46904	Cao Thị Thủy Tiên	1972-12-11	female	Kinh (Việt)	2616	none	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207820101	Lao động giản đơn	04020202
46906	Phan Thanh Hải	1969-10-12	male	Cơ-tu	2616	none	Không	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Nhạn Môn Huyện Pác Nặm Tỉnh Bắc Kạn	207697201	Lực lượng vũ trang	04020202
46907	Lý Hoàng Kim Ánh	1958-10-04	female	Thái	2618	none	Tin lành	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	205675101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04020301
46908	Trần Hằng Hương	1926-06-02	female	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	208697101	Nhân viên trợ lý văn phòng	04020301
46909	Phạm Kiều Thúy Ngân	1964-11-28	female	Kinh (Việt)	2618	none	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	205831301	Lao động giản đơn	04020301
46910	Trần Nguyễn Anh Khoa	1958-12-21	male	Ngái	2618	none	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	206390101	Nhân viên dịch vụ và bán hàng	04020301
46911	Mai Thị Mai Thương	2006-06-15	female	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020301
46912	Phan Phúc Thịnh	1958-07-04	male	Mảng	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	206628801	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020301
46913	Phạm Gia Hiếu	1960-10-31	male	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	207689501	Lao động giản đơn	04020301
46914	Võ Minh Hiếu	1977-07-27	male	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	203597601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04020301
46915	Lại Quốc Huy	1957-06-24	male	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	208798401	Lao động giản đơn	04020301
46916	Huỳnh Vân Thùy	2008-01-16	female	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020301
46917	Nguyễn Thành Phước	1924-03-22	male	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	208186301	Lao động giản đơn	04020301
46918	Nguyễn Việt Tuấn	2000-03-30	male	Kinh (Việt)	2618		Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	205386801	Nhân viên dịch vụ và bán hàng	04020301
46919	Phạm Thị Quỳnh Anh	1994-10-08	female	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202178601	Nhà chuyên môn bậc cao (đại học trở lên)	04020301
46920	Thôi Huỳnh Quốc Quang	1987-07-04	male	Kinh (Việt)	2618	none	Phật giáo	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202157001	Lao động giản đơn	04020301
46921	Ngô Trần Anh Thư	1976-11-19	female	Kinh (Việt)	2618		Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	205369201	Tự do	04020301
46922	Đào Lý Quang Thụy	2001-03-15	male	Kinh (Việt)	2618		Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202286801	Lực lượng vũ trang	04020301
46923	Trần Ngọc Thanh Phúc	2014-10-20	female	Kinh (Việt)	2618	None	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Thợ lắp ráp và vận hành máy móc, thiết bị	04020301
46924	Trương Ngọc Nhật Vy	1954-02-10	female	Kinh (Việt)	2618	none	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	208142601	Lao động giản đơn	04020301
46925	Trần Quốc Việt	1999-07-20	male	Kinh (Việt)	2618		Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	204672001	Nhân viên dịch vụ và bán hàng	04020301
46926	Huỳnh Như Tâm	2011-03-19	female	Kinh (Việt)	2618	primary	Không	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 1 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04020301
46927	Nguyễn Trung Kiệt	1988-11-07	male	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	203753601	Lao động giản đơn	04020302
46928	Huỳnh Nhật Thông	2000-08-09	male	Kinh (Việt)	2619		Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	204608201	Lao động giản đơn	04020302
46929	Trần Mai Chi	1990-10-25	female	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	205085201	Lao động thủ công và các nghề nghiệp có liên quan khác	04020302
46930	Bùi Minh Trí	2019-07-06	male	Tày	2619	None	Phật giáo Hiếu Nghĩa Tà Lơn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020302
46931	Lâm Tú Tiên	1937-11-07	female	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	206170501	Lao động giản đơn	04020302
46932	Lê Phúc Uyên	1967-06-16	female	Kinh (Việt)	2619	none	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	206349201	Lao động giản đơn	04020302
46933	Phạm Thị Ngọc Huyền	1997-04-12	female	Kinh (Việt)	2619	secondary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	200017101	Lao động giản đơn	04020302
46934	Sato Do	2021-10-26	male	Co	2619	None	Cao đài	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04020302
46935	Nguyễn Thị Lan Anh	1967-06-24	female	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	204734801	Lao động giản đơn	04020302
46936	Nguyễn Vũ Thảo Nguyên	1978-12-09	female	Kinh (Việt)	2619	secondary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	207763901	Lao động giản đơn	04020302
46937	Võ Eamy	1971-09-04	female	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	201102001	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020302
46938	Nguyễn Chí Bình	1997-08-29	male	Kinh (Việt)	2619	university	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	208524501	Tự do	04020302
46939	Nguyễn Đình Trung	2005-09-24	male	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	200166001	Lực lượng vũ trang	04020302
46940	Trương Trọng Khôi	1994-11-18	male	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202477901	Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản	04020302
46941	Trần Lê Sơn Trà	2010-07-04	female	Kinh (Việt)	2619	primary	Bửu Sơn Kỳ Hương	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020302
46942	Trương Thị Mỹ Trang	2007-09-20	female	Dao	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020302
46943	Phan Tiểu Vy	1973-01-12	female	Kinh (Việt)	2619	secondary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	206456301	Lao động giản đơn	04020302
46944	Hồ Trần Hạnh Thư	2012-04-03	female	Kinh (Việt)	2619	None	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn		Lao động giản đơn	04020302
46945	Trần Duy Kiên	1935-11-13	male	Kinh (Việt)	2619	none	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202017601	Nhân viên dịch vụ và bán hàng	04020302
46946	Nguyễn Ngọc Bích	1990-08-27	female	Kinh (Việt)	2619	primary	Không	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	Thôn 2 Xã Bộc Bố Huyện Pác Nặm Tỉnh Bắc Kạn	202523201	Lao động giản đơn	04020302
46947	Tăng Ngọc Anh Thư	1964-10-16	female	Kinh (Việt)	2622	none	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	201300601	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030101
46948	Nguyễn Ngọc Thùy Linh	2000-06-09	female	Kinh (Việt)	2622		Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	204965401	Lao động giản đơn	04030101
46949	Dương Võ Hoàng Tấn	1984-04-09	male	Kinh (Việt)	2622	secondary	Công giáo	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	206406001	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030101
46950	Nguyễn Văn Tài	1985-10-14	male	Kinh (Việt)	2622	primary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200218801	Tự do	04030101
46951	Nguyễn Đặng Gia Huy	1969-06-16	male	Kinh (Việt)	2622	high	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202472201	Lao động giản đơn	04030101
46952	Nguyễn Minh Trí	1980-11-29	male	Kinh (Việt)	2622	primary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202952401	Lao động giản đơn	04030101
46953	Tống Gia Bảo	1943-10-27	male	Kinh (Việt)	2622	primary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	204189901	Lao động thủ công và các nghề nghiệp có liên quan khác	04030101
46954	Trần Hà Nguyên	1935-06-19	female	Kinh (Việt)	2622	none	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202881701	Lao động giản đơn	04030101
46955	Trần Huy Thịnh	1984-01-28	male	Kinh (Việt)	2622	primary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	208720901	Lao động giản đơn	04030101
46956	Nguyễn Huỳnh Đức Mạnh	1994-03-21	male	Kinh (Việt)	2622	secondary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200631301	Nhân viên dịch vụ và bán hàng	04030101
46957	Huỳnh Minh Nhựt	2014-11-25	male	Kinh (Việt)	2622	None	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030101
46958	Nguyễn Võ An Bình	2020-10-20	male	Kinh (Việt)	2622	None	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Nhân viên trợ lý văn phòng	04030101
46959	Trần Ngọc Phương Vy	1985-10-15	female	Kinh (Việt)	2622	primary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200062101	Nhân viên dịch vụ và bán hàng	04030101
46960	Trương Công Hoài Nam	1991-09-23	male	Kinh (Việt)	2622		Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	203347501	Lao động giản đơn	04030101
46961	Phạm Thị Ngọc Trang	2002-01-01	female	Kinh (Việt)	2622		Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	203839701	Lao động giản đơn	04030101
46962	Trần Trường Giang	1986-04-03	male	Kinh (Việt)	2622	high	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200686401	Thợ lắp ráp và vận hành máy móc, thiết bị	04030101
46963	Đào Nguyên Như Ý	1960-08-26	female	Kinh (Việt)	2622	secondary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	205614001	Lao động giản đơn	04030101
46964	Nguyễn Đỗ Ngọc Phát	2012-10-09	male	Kinh (Việt)	2622	None	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030101
46965	Hồ Ngọc Yến Vy	2002-10-27	female	Kinh (Việt)	2622		Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	204413701	Lao động giản đơn	04030101
46966	Nguyễn Viết Thanh Tú	1982-03-11	male	Kinh (Việt)	2622	secondary	Không	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	208310301	Lao động thủ công và các nghề nghiệp có liên quan khác	04030101
46967	Nguyễn Kim Ngân	2008-06-08	female	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030102
46968	Nguyễn Thanh Trúc	1993-12-09	female	Cơ-ho	2623	university	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	207245201	Lao động giản đơn	04030102
46969	Trang Hoàng Phúc	2014-07-16	male	Kinh (Việt)	2623	None	Phật giáo	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030102
46970	Mai Thị Kim Nhi	1982-02-09	female	Cống	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	206762301	Lao động thủ công và các nghề nghiệp có liên quan khác	04030102
46971	Phạm Lê Bảo Nghi	1995-11-13	female	Kinh (Việt)	2623	high	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	201231501	Lao động giản đơn	04030102
46972	Nguyễn Minh Triển	1975-02-12	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	207958101	Nhà chuyên môn bậc trung (cao đẳng, trung cấp)	04030102
46973	Nguyễn Hữu Minh Huy	2005-09-16	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	205285201	Thợ lắp ráp và vận hành máy móc, thiết bị	04030102
46974	Lê Nhật Minh	1998-06-21	male	Kinh (Việt)	2623		Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	203670701	Lao động giản đơn	04030102
46975	Trần Gia Lập	1983-01-04	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200409001	Lao động giản đơn	04030102
46976	Nguyễn Minh Phương	1979-12-28	male	Kinh (Việt)	2623	none	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	200817901	Tự do	04030102
46977	Nguyễn Đình Thao	1990-04-26	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	208489701	Nhân viên dịch vụ và bán hàng	04030102
46978	Huỳnh Hồng Luân	2006-10-16	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030102
46979	Trần Thảo Băng Tâm	1985-03-31	female	Kinh (Việt)	2623	secondary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	203493601	Lao động giản đơn	04030102
46980	Nguyễn Hoài Bảo	2002-01-27	male	Kinh (Việt)	2623		Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	206664001	Nhà chuyên môn bậc cao (đại học trở lên)	04030102
46981	Lê Thái Tuấn	1993-10-01	male	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202405601	Lao động giản đơn	04030102
46982	Phạm Văn Đức Anh	1991-07-18	male	Kinh (Việt)	2623		Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202674101	Lao động giản đơn	04030102
46983	Đào Ngọc Đức	1963-10-03	male	Kinh (Việt)	2623	secondary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	204313001	Nhà chuyên môn bậc cao (đại học trở lên)	04030102
46984	Huỳnh Nguyễn Thị Trà My	1994-06-14	female	Kinh (Việt)	2623	primary	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	208104301	Lao động giản đơn	04030102
46985	Trần Minh Thành	2018-10-27	male	Kinh (Việt)	2623	None	Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030102
46986	Nguyễn Yến Nhi	1999-11-08	female	Kinh (Việt)	2623		Không	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 2 Thị trấn Chợ Rã Huyện Ba Bể Tỉnh Bắc Kạn	202346601	Lao động giản đơn	04030102
46987	Trịnh Quốc Thạnh	2016-11-25	male	Kinh (Việt)	2625	None	Bửu Sơn Kỳ Hương	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn		Lao động giản đơn	04030201
46988	Nguyễn Hằng Minh Nguyệt	1990-12-17	female	Kinh (Việt)	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	202343001	Lao động giản đơn	04030201
46989	Nguyễn Ngọc Tuyền	1989-09-27	female	Hoa (Hán)	2625	secondary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	207367701	Lao động giản đơn	04030201
46990	Nguyễn Quốc Vũ	2005-08-07	male	Kinh (Việt)	2625	secondary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	201687101	Lao động giản đơn	04030201
46991	Đặng Lê Hoài Phúc	1979-02-20	male	Kinh (Việt)	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	203366701	Lao động giản đơn	04030201
46992	Nguyễn Đặng Thùy Linh	2005-05-31	female	Kinh (Việt)	2625	secondary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	204020801	Lao động giản đơn	04030201
46993	Bùi Ngọc Hà	1960-06-09	female	Kinh (Việt)	2625	secondary	Phật giáo Tứ Ân Hiếu nghĩa	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	202592501	Tự do	04030201
46994	Lâm Ngọc Anh Thư	1987-03-18	female	Ngái	2625	primary	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	208493601	Lao động giản đơn	04030201
46995	Hà Văn Minh	1997-06-15	male	Kinh (Việt)	2625	high	Không	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	Thôn 1 Xã Bành Trạch Huyện Ba Bể Tỉnh Bắc Kạn	208820601	Lãnh đạo, quản lý trong các ngành, các cấp và các đơn vị	04030201
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-11-20 09:46:39.705711+00	3	00	1	[{"added": {}}]	6	2
2	2021-11-20 09:47:56.79213+00	3	00	2	[{"changed": {"fields": ["Supervisor"]}}]	6	2
3	2021-11-20 09:50:35.433166+00	4	01	1	[{"added": {}}]	6	2
4	2021-11-20 09:51:28.046959+00	5	0101	1	[{"added": {}}]	6	2
5	2021-11-20 09:52:05.063112+00	4	01	2	[{"changed": {"fields": ["Declared permission"]}}]	6	2
6	2021-11-20 09:54:14.922542+00	4	01	2	[]	6	2
7	2021-11-23 01:24:56.407838+00	01	Agency object (01)	1	[{"added": {}}]	7	2
8	2021-11-26 15:46:07.987049+00	10	010101	1	[{"added": {}}]	6	2
9	2021-11-26 15:47:37.097178+00	1	Citizen object (1)	1	[{"added": {}}]	8	2
10	2021-11-27 03:16:27.384118+00	10	010101	2	[{"changed": {"fields": ["Supervisor"]}}]	6	2
11	2021-11-27 03:16:36.01528+00	5	0101	2	[]	6	2
12	2021-11-27 03:17:26.324493+00	4	01	2	[{"changed": {"fields": ["Declared permission"]}}]	6	2
13	2021-11-27 03:17:37.430646+00	5	0101	2	[{"changed": {"fields": ["Declared permission"]}}]	6	2
14	2021-11-30 14:32:23.668806+00	5	010101 Nguyen văn C	1	[{"added": {}}]	8	2
15	2021-12-01 03:48:16.0122+00	5	0101	2	[{"changed": {"fields": ["Agency"]}}]	6	2
16	2021-12-01 08:06:15.309445+00	1	family 1	1	[{"added": {}}]	9	2
17	2021-12-01 08:14:44.665569+00	5	010101 Nguyen văn C	2	[{"changed": {"fields": ["Family"]}}]	8	2
18	2021-12-01 08:17:55.00344+00	4	010101 Nguyen Van B	2	[{"changed": {"fields": ["Family"]}}]	8	2
19	2021-12-01 08:18:03.894924+00	1	010101 Nguyen Van A	2	[{"changed": {"fields": ["Family"]}}]	8	2
20	2021-12-01 09:19:30.70809+00	2	family 2	1	[{"added": {}}]	9	2
21	2021-12-01 16:32:36.512219+00	010101	010101 Xã X	1	[{"added": {}}]	7	2
22	2021-12-01 16:35:18.978342+00	10	010101	2	[{"changed": {"fields": ["Agency"]}}]	6	2
23	2021-12-02 03:05:25.460148+00	11	010102	2	[{"changed": {"fields": ["Operate to", "Agency"]}}]	6	2
24	2021-12-02 03:36:14.061529+00	11	010103	2	[{"changed": {"fields": ["Username"]}}]	6	2
25	2021-12-02 03:37:13.506908+00	11	010103	2	[{"changed": {"fields": ["Agency"]}}]	6	2
26	2021-12-05 02:54:13.867439+00	0101	0101 Quận Cầu giấy	2	[{"changed": {"fields": ["Name"]}}]	7	2
27	2021-12-06 15:42:22.493289+00	17	010105 Nguyen văn dgd05	2	[]	8	2
28	2021-12-06 16:28:03.210686+00	01010101	01010101 Thôn Y	1	[{"added": {}}]	7	2
29	2021-12-07 04:06:27.031981+00	39	01 Nguyễn Văn J	3		8	2
30	2021-12-07 04:06:27.036788+00	38	01 Nguyễn Văn Q	3		8	2
31	2021-12-07 04:06:27.038735+00	37	01 Nguyễn Văn Z	3		8	2
32	2021-12-07 04:06:27.040616+00	36	01 Nguyễn Văn Y	3		8	2
33	2021-12-07 04:06:27.043435+00	35	01 Nguyễn Văn X	3		8	2
34	2021-12-07 04:06:27.046423+00	34	01 Nguyễn Văn V	3		8	2
35	2021-12-07 04:06:27.048627+00	33	01 Nguyễn Văn S	3		8	2
36	2021-12-07 04:06:27.051561+00	32	01 Nguyễn Văn P	3		8	2
37	2021-12-07 04:06:27.055429+00	31	01 Nguyễn Văn O	3		8	2
38	2021-12-07 04:06:27.059466+00	30	01 Nguyễn Văn L	3		8	2
39	2021-12-07 04:06:27.062661+00	29	01 Nguyễn Văn N	3		8	2
40	2021-12-07 04:06:27.065826+00	28	01 Nguyễn Văn M	3		8	2
41	2021-12-07 04:06:27.069772+00	27	01 Nguyễn Văn K	3		8	2
42	2021-12-07 04:06:27.073733+00	26	01 Nguyễn Văn I	3		8	2
43	2021-12-07 04:06:27.076947+00	25	01 Nguyễn Văn H	3		8	2
44	2021-12-07 04:06:27.080234+00	24	01 Nguyễn Văn G	3		8	2
45	2021-12-07 04:06:27.08439+00	23	01 Nguyễn Văn F	3		8	2
46	2021-12-07 04:06:27.088257+00	22	01 Nguyễn Văn E	3		8	2
47	2021-12-07 04:06:27.091227+00	21	01 Nguyễn Văn D	3		8	2
48	2021-12-07 04:06:27.094237+00	20	01 Nguyễn Văn C	3		8	2
49	2021-12-07 04:06:27.098064+00	19	01 Nguyễn Văn B	3		8	2
50	2021-12-07 04:06:27.102081+00	18	01 Nguyễn Văn A	3		8	2
51	2021-12-08 16:21:38.700531+00	4	01	2	[{"changed": {"fields": ["Agency"]}}]	6	2
52	2021-12-14 16:03:00.314834+00	5	0101	2	[{"changed": {"fields": ["Declared permission"]}}]	6	2
53	2021-12-17 15:11:40.025652+00	22	010102	1	[{"added": {}}]	6	2
54	2021-12-22 01:39:23.205545+00	01010101	01010101 Thôn 1	1	[{"added": {}}]	7	2
55	2021-12-22 01:40:19.756236+00	23	01010101	1	[{"added": {}}]	6	2
56	2021-12-22 09:01:19.997089+00	00	00 Trung ương	1	[{"added": {}}]	7	2
57	2021-12-22 09:08:07.675754+00	3	00	2	[{"changed": {"fields": ["Agency"]}}]	6	2
58	2021-12-22 09:15:28.168436+00	00	00 Trung ương	2	[]	7	2
59	2021-12-22 09:50:57.155164+00	171	010101 Nguyễn Văn J	3		8	2
60	2021-12-22 09:50:57.160472+00	170	010101 Nguyễn Văn Q	3		8	2
61	2021-12-22 09:50:57.163506+00	169	010101 Nguyễn Văn Z	3		8	2
62	2021-12-22 09:50:57.16577+00	168	010101 Nguyễn Văn Y	3		8	2
63	2021-12-22 09:50:57.16778+00	167	010101 Nguyễn Văn X	3		8	2
64	2021-12-22 09:50:57.170745+00	166	010101 Nguyễn Văn V	3		8	2
65	2021-12-22 09:50:57.17383+00	165	010101 Nguyễn Văn S	3		8	2
66	2021-12-22 09:50:57.175675+00	164	010101 Nguyễn Văn P	3		8	2
67	2021-12-22 09:50:57.177777+00	163	010101 Nguyễn Văn O	3		8	2
68	2021-12-22 09:50:57.18175+00	162	010101 Nguyễn Văn L	3		8	2
69	2021-12-22 09:50:57.185002+00	161	010101 Nguyễn Văn N	3		8	2
70	2021-12-22 09:50:57.18719+00	160	010101 Nguyễn Văn M	3		8	2
71	2021-12-22 09:50:57.189143+00	159	010101 Nguyễn Văn K	3		8	2
72	2021-12-22 09:50:57.191909+00	158	010101 Nguyễn Văn I	3		8	2
73	2021-12-22 09:50:57.195119+00	157	010101 Nguyễn Văn H	3		8	2
74	2021-12-22 09:50:57.197786+00	156	010101 Nguyễn Văn G	3		8	2
75	2021-12-22 09:50:57.20025+00	155	010101 Nguyễn Văn F	3		8	2
76	2021-12-22 09:50:57.203462+00	154	010101 Nguyễn Văn E	3		8	2
77	2021-12-22 09:50:57.20656+00	153	010101 Nguyễn Văn D	3		8	2
78	2021-12-22 09:50:57.208804+00	152	010101 Nguyễn Văn C	3		8	2
79	2021-12-22 09:50:57.211162+00	151	010101 Nguyễn Văn B	3		8	2
80	2021-12-22 09:50:57.214345+00	150	010101 Nguyễn Văn A	3		8	2
81	2021-12-22 09:50:57.217889+00	149	010101 Nguyễn Văn J	3		8	2
82	2021-12-22 09:50:57.220794+00	148	010101 Nguyễn Văn Q	3		8	2
83	2021-12-22 09:50:57.223906+00	147	010101 Nguyễn Văn Z	3		8	2
84	2021-12-22 09:50:57.22858+00	146	010101 Nguyễn Văn Y	3		8	2
85	2021-12-22 09:50:57.233434+00	145	010101 Nguyễn Văn X	3		8	2
86	2021-12-22 09:50:57.237261+00	144	010101 Nguyễn Văn V	3		8	2
87	2021-12-22 09:50:57.240821+00	143	010101 Nguyễn Văn S	3		8	2
88	2021-12-22 09:50:57.245524+00	142	010101 Nguyễn Văn P	3		8	2
89	2021-12-22 09:50:57.24989+00	141	010101 Nguyễn Văn O	3		8	2
90	2021-12-22 09:50:57.25375+00	140	010101 Nguyễn Văn L	3		8	2
91	2021-12-22 09:50:57.25731+00	139	010101 Nguyễn Văn N	3		8	2
92	2021-12-22 09:50:57.261805+00	138	010101 Nguyễn Văn M	3		8	2
93	2021-12-22 09:50:57.266353+00	137	010101 Nguyễn Văn K	3		8	2
94	2021-12-22 09:50:57.269767+00	136	010101 Nguyễn Văn I	3		8	2
95	2021-12-22 09:50:57.272935+00	135	010101 Nguyễn Văn H	3		8	2
96	2021-12-22 09:50:57.277414+00	134	010101 Nguyễn Văn G	3		8	2
97	2021-12-22 09:50:57.282008+00	133	010101 Nguyễn Văn F	3		8	2
98	2021-12-22 09:50:57.285819+00	132	010101 Nguyễn Văn E	3		8	2
99	2021-12-22 09:50:57.289239+00	131	010101 Nguyễn Văn D	3		8	2
100	2021-12-22 09:50:57.293584+00	130	010101 Nguyễn Văn C	3		8	2
101	2021-12-22 09:50:57.297445+00	129	010101 Nguyễn Văn B	3		8	2
102	2021-12-22 09:50:57.300361+00	128	010101 Nguyễn Văn A	3		8	2
103	2021-12-22 09:50:57.305095+00	127	010101 Nguyễn Văn J	3		8	2
104	2021-12-22 09:50:57.308303+00	126	010101 Nguyễn Văn Q	3		8	2
105	2021-12-22 09:50:57.311639+00	125	010101 Nguyễn Văn Z	3		8	2
106	2021-12-22 09:50:57.31597+00	124	010101 Nguyễn Văn Y	3		8	2
107	2021-12-22 09:50:57.320079+00	123	010101 Nguyễn Văn X	3		8	2
108	2021-12-22 09:50:57.323632+00	122	010101 Nguyễn Văn V	3		8	2
109	2021-12-22 09:50:57.327335+00	121	010101 Nguyễn Văn S	3		8	2
110	2021-12-22 09:50:57.331898+00	120	010101 Nguyễn Văn P	3		8	2
111	2021-12-22 09:50:57.336374+00	119	010101 Nguyễn Văn O	3		8	2
112	2021-12-22 09:50:57.339706+00	118	010101 Nguyễn Văn L	3		8	2
113	2021-12-22 09:50:57.343357+00	117	010101 Nguyễn Văn N	3		8	2
114	2021-12-22 09:50:57.347623+00	116	010101 Nguyễn Văn M	3		8	2
115	2021-12-22 09:50:57.352012+00	115	010101 Nguyễn Văn K	3		8	2
116	2021-12-22 09:50:57.35543+00	114	010101 Nguyễn Văn I	3		8	2
117	2021-12-22 09:50:57.358822+00	113	010101 Nguyễn Văn H	3		8	2
118	2021-12-22 09:50:57.362954+00	112	010101 Nguyễn Văn G	3		8	2
119	2021-12-22 09:50:57.367191+00	111	010101 Nguyễn Văn F	3		8	2
120	2021-12-22 09:50:57.370463+00	110	010101 Nguyễn Văn E	3		8	2
121	2021-12-22 09:50:57.37388+00	109	010101 Nguyễn Văn D	3		8	2
122	2021-12-22 09:50:57.37859+00	108	010101 Nguyễn Văn C	3		8	2
123	2021-12-22 09:50:57.382961+00	107	010101 Nguyễn Văn B	3		8	2
124	2021-12-22 09:50:57.386273+00	106	010101 Nguyễn Văn A	3		8	2
125	2021-12-22 09:50:57.389583+00	105	010101 Nguyễn Văn J	3		8	2
126	2021-12-22 09:50:57.393701+00	104	010101 Nguyễn Văn Q	3		8	2
127	2021-12-22 09:50:57.3977+00	103	010101 Nguyễn Văn Z	3		8	2
128	2021-12-22 09:50:57.400792+00	102	010101 Nguyễn Văn Y	3		8	2
129	2021-12-22 09:50:57.40442+00	101	010101 Nguyễn Văn X	3		8	2
130	2021-12-22 09:50:57.408636+00	100	010101 Nguyễn Văn V	3		8	2
131	2021-12-22 09:50:57.412742+00	99	010101 Nguyễn Văn S	3		8	2
132	2021-12-22 09:50:57.416023+00	98	010101 Nguyễn Văn P	3		8	2
133	2021-12-22 09:50:57.41924+00	97	010101 Nguyễn Văn O	3		8	2
134	2021-12-22 09:50:57.423423+00	96	010101 Nguyễn Văn L	3		8	2
135	2021-12-22 09:50:57.427479+00	95	010101 Nguyễn Văn N	3		8	2
136	2021-12-22 09:50:57.430691+00	94	010101 Nguyễn Văn M	3		8	2
137	2021-12-22 09:50:57.434095+00	93	010101 Nguyễn Văn K	3		8	2
138	2021-12-22 09:50:57.43825+00	92	010101 Nguyễn Văn I	3		8	2
139	2021-12-22 09:50:57.442195+00	91	010101 Nguyễn Văn H	3		8	2
140	2021-12-22 09:50:57.44616+00	90	010101 Nguyễn Văn G	3		8	2
141	2021-12-22 09:50:57.449188+00	89	010101 Nguyễn Văn F	3		8	2
142	2021-12-22 09:50:57.452442+00	88	010101 Nguyễn Văn E	3		8	2
143	2021-12-22 09:50:57.45693+00	87	010101 Nguyễn Văn D	3		8	2
144	2021-12-22 09:50:57.461155+00	86	010101 Nguyễn Văn C	3		8	2
145	2021-12-22 09:50:57.464415+00	85	010101 Nguyễn Văn B	3		8	2
146	2021-12-22 09:50:57.467822+00	84	010101 Nguyễn Văn A	3		8	2
147	2021-12-22 09:50:57.472046+00	83	010101 Nguyễn Văn J	3		8	2
148	2021-12-22 09:50:57.476565+00	82	010101 Nguyễn Văn Q	3		8	2
149	2021-12-22 09:50:57.479905+00	81	010101 Nguyễn Văn Z	3		8	2
150	2021-12-22 09:50:57.483022+00	80	010101 Nguyễn Văn Y	3		8	2
151	2021-12-22 09:50:57.48718+00	79	010101 Nguyễn Văn X	3		8	2
152	2021-12-22 09:50:57.491374+00	78	010101 Nguyễn Văn V	3		8	2
153	2021-12-22 09:50:57.494726+00	77	010101 Nguyễn Văn S	3		8	2
154	2021-12-22 09:50:57.498047+00	76	010101 Nguyễn Văn P	3		8	2
155	2021-12-22 09:50:57.502514+00	75	010101 Nguyễn Văn O	3		8	2
156	2021-12-22 09:50:57.506809+00	74	010101 Nguyễn Văn L	3		8	2
157	2021-12-22 09:50:57.510407+00	73	010101 Nguyễn Văn N	3		8	2
158	2021-12-22 09:50:57.513478+00	72	010101 Nguyễn Văn M	3		8	2
159	2021-12-22 09:51:18.545197+00	71	010101 Nguyễn Văn K	3		8	2
160	2021-12-22 09:51:18.548838+00	70	010101 Nguyễn Văn I	3		8	2
161	2021-12-22 09:51:18.551184+00	69	010101 Nguyễn Văn H	3		8	2
162	2021-12-22 09:51:18.553658+00	68	010101 Nguyễn Văn G	3		8	2
163	2021-12-22 09:51:18.556919+00	67	010101 Nguyễn Văn F	3		8	2
164	2021-12-22 09:51:18.559936+00	66	010101 Nguyễn Văn E	3		8	2
165	2021-12-22 09:51:18.561967+00	65	010101 Nguyễn Văn D	3		8	2
166	2021-12-22 09:51:18.563811+00	64	010101 Nguyễn Văn C	3		8	2
167	2021-12-22 09:51:18.56688+00	63	010101 Nguyễn Văn B	3		8	2
168	2021-12-22 09:51:18.569777+00	62	010101 Nguyễn Văn A	3		8	2
169	2021-12-22 09:51:18.571592+00	17	010105 Nguyen văn dgd05	3		8	2
170	2021-12-22 09:51:18.573474+00	16	010105 Nguyen văn 205	3		8	2
171	2021-12-22 09:51:18.57616+00	15	010105 Nguyen văn fffkf	3		8	2
172	2021-12-22 09:51:18.579102+00	14	010101 Nguyen văn xchgvgh	3		8	2
173	2021-12-22 09:51:18.581037+00	13	010101 Nguyen văn gh	3		8	2
174	2021-12-22 09:51:18.583219+00	12	010101 Nguyen văn Xfhg	3		8	2
175	2021-12-22 09:51:18.587318+00	11	010101 Nguyen văn xc	3		8	2
176	2021-12-22 09:51:18.592341+00	10	010101 Nguyen văn gh	3		8	2
177	2021-12-22 09:51:18.59568+00	9	010101 Nguyen văn X	3		8	2
178	2021-12-22 09:51:18.598941+00	8	010101 Nguyen Van F	3		8	2
179	2021-12-22 09:51:18.603131+00	7	010101 Nguyen Van E	3		8	2
180	2021-12-22 09:51:18.607172+00	6	010101 Nguyen văn D	3		8	2
181	2021-12-22 09:51:18.610223+00	4	010101 Nguyen Van B	3		8	2
182	2021-12-22 09:51:18.614217+00	1	010101 Nguyen Van A	3		8	2
183	2021-12-22 15:14:56.002881+00	02031101	Thôn 1 Xã Cán Chu Phìn Huyện Mèo Vạc Tỉnh Hà Giang Trung ương 	3		7	2
184	2021-12-22 15:15:59.864474+00	02031101	Thôn 3 Xã Tả Lủng Huyện Mèo Vạc Tỉnh Hà Giang Trung ương 	1	[{"added": {}}]	7	2
185	2021-12-22 15:17:43.914229+00	2503	02031003	2	[{"changed": {"fields": ["Operate to"]}}]	6	2
186	2021-12-22 15:18:05.608086+00	2503	02031003	3		6	2
187	2021-12-22 15:36:52.350535+00	2353	02	3		6	2
188	2021-12-22 15:38:12.542511+00	4	01	3		6	2
189	2021-12-22 15:42:36.636995+00	01	Thành phố Hà Nội 	3		7	2
190	2021-12-22 15:43:22.318676+00	02	Tỉnh Hà Giang Trung ương 	3		7	2
191	2021-12-22 16:01:25.135825+00	01	Ha noi	1	[{"added": {}}]	7	2
192	2021-12-22 16:02:01.835302+00	2506	01	1	[{"added": {}}]	6	2
193	2021-12-22 16:11:48.166842+00	45626	09020101 Nguyễn Thụy Thùy Dương	3		8	2
194	2021-12-22 16:11:48.171553+00	45625	09020101 Phan Ngọc Thảo Vy	3		8	2
195	2021-12-22 16:11:48.174936+00	45624	09020101 Phạm Nguyễn Anh Thư	3		8	2
196	2021-12-22 16:11:48.177655+00	45623	09020101 Liêu Minh Hiếu	3		8	2
197	2021-12-22 16:11:48.180267+00	45622	09020101 Nguyễn Hồ Phương Thy	3		8	2
198	2021-12-22 16:11:48.183942+00	45621	09020101 Võ Trần Đăng Khoa	3		8	2
199	2021-12-22 16:11:48.18748+00	45620	09020101 Trần Thị Thảo Vy	3		8	2
200	2021-12-22 16:11:48.194579+00	45619	09020101 Phạm Huỳnh Đoan Trang	3		8	2
201	2021-12-22 16:11:48.19676+00	45618	09020101 Nguyễn Hoàng Huy	3		8	2
202	2021-12-22 16:11:48.199766+00	45617	09020101 Hồ Hoàng Vy	3		8	2
203	2021-12-22 16:11:48.202791+00	45616	09020101 Huỳnh Ngọc Trâm Anh	3		8	2
204	2021-12-22 16:11:48.205112+00	45615	09020101 Đỗ Nguyễn Khánh Duy	3		8	2
205	2021-12-22 16:11:48.207436+00	45614	09010302 Nguyễn Thị Trang Đài	3		8	2
206	2021-12-22 16:11:48.210363+00	45613	09010302 Nguyễn Thanh Hải	3		8	2
207	2021-12-22 16:11:48.213253+00	45612	09010302 Nguyễn Vũ Bảo Huyền	3		8	2
208	2021-12-22 16:11:48.21511+00	45611	09010302 Bùi Nguyễn Thu An	3		8	2
209	2021-12-22 16:11:48.217386+00	45610	09010302 Đoàn Minh Nghĩa	3		8	2
210	2021-12-22 16:11:48.221956+00	45609	09010302 Vương Chí Đức	3		8	2
211	2021-12-22 16:11:48.225979+00	45608	09010302 Tô Hoài Duy Khương	3		8	2
212	2021-12-22 16:11:48.229086+00	45607	09010302 Trần Tuấn Kiệt	3		8	2
213	2021-12-22 16:11:48.232234+00	45606	09010302 Phạm Trần Bảo Ngọc	3		8	2
214	2021-12-22 16:11:48.236146+00	45605	09010302 Nguyễn Hoàng Huy	3		8	2
215	2021-12-22 16:11:48.240114+00	45604	09010302 Đỗ Mạnh Dũng	3		8	2
216	2021-12-22 16:11:48.24374+00	45603	09010302 Nguyễn Ngọc Như Ý	3		8	2
217	2021-12-22 16:11:48.246468+00	45602	09010302 Từ Gia Khang	3		8	2
218	2021-12-22 16:11:48.249573+00	45601	09010302 Trần Thanh Hướng	3		8	2
219	2021-12-22 16:11:48.252744+00	45600	09010302 Ngô Phạm Thanh Ngân	3		8	2
220	2021-12-22 16:11:48.254956+00	45599	09010302 Nguyễn Phúc Nhân	3		8	2
221	2021-12-22 16:11:48.256949+00	45598	09010302 Nguyễn Quốc Đạt	3		8	2
222	2021-12-22 16:11:48.259832+00	45597	09010302 Trần Thị Yến Linh	3		8	2
223	2021-12-22 16:11:48.26281+00	45596	09010302 Trần Thị Diệu Linh	3		8	2
224	2021-12-22 16:11:48.264797+00	45595	09010302 Nguyễn Ngọc Mẫn Nghi	3		8	2
225	2021-12-22 16:11:48.266726+00	45594	09010301 Hồ Phi Anh	3		8	2
226	2021-12-22 16:11:48.269474+00	45593	09010301 Trần Thị Nhàn	3		8	2
227	2021-12-22 16:11:48.272303+00	45592	09010301 Nguyễn Hồng Hân	3		8	2
228	2021-12-22 16:11:48.274344+00	45591	09010301 Huỳnh Lê Lan Anh	3		8	2
229	2021-12-22 16:11:48.276323+00	45590	09010301 Lê Tuấn Tú	3		8	2
230	2021-12-22 16:11:48.278987+00	45589	09010301 Huỳnh Văn Lý	3		8	2
231	2021-12-22 16:11:48.281762+00	45588	09010301 Nguyễn Trâm Anh	3		8	2
232	2021-12-22 16:11:48.283702+00	45587	09010301 Nguyễn Danh Thắng	3		8	2
233	2021-12-22 16:11:48.285616+00	45586	09010301 Phan Nguyễn Minh Thy	3		8	2
234	2021-12-22 16:11:48.288425+00	45585	09010301 Phạm Gia Huy	3		8	2
235	2021-12-22 16:11:48.291301+00	45584	09010301 Huỳnh Phúc Thái	3		8	2
236	2021-12-22 16:11:48.29313+00	45583	09010301 Đinh Khánh Phương	3		8	2
237	2021-12-22 16:11:48.29495+00	45582	09010301 Lục Phương Nghi	3		8	2
238	2021-12-22 16:11:48.297876+00	45581	09010301 Lê Khánh Linh	3		8	2
239	2021-12-22 16:11:48.300564+00	45580	09010301 Phan Gia Đức Trí	3		8	2
240	2021-12-22 16:11:48.302521+00	45579	09010301 Nguyễn Thị Quỳnh Như	3		8	2
241	2021-12-22 16:11:48.304426+00	45578	09010301 Nguyễn Thanh Trúc	3		8	2
242	2021-12-22 16:11:48.307499+00	45577	09010301 Đinh Phương Ngân	3		8	2
243	2021-12-22 16:11:48.310801+00	45576	09010301 Trần Ngọc Yến Vy	3		8	2
244	2021-12-22 16:11:48.313037+00	45575	09010301 Lê Minh Phúc	3		8	2
245	2021-12-22 16:11:48.315484+00	45574	09010202 Lê Quang Vũ	3		8	2
246	2021-12-22 16:11:48.318333+00	45573	09010202 Nguyễn Vĩnh Hưng	3		8	2
247	2021-12-22 16:11:48.321126+00	45572	09010202 Trịnh Lê Văn Quân	3		8	2
248	2021-12-22 16:11:48.323428+00	45571	09010202 Nguyễn Mạnh Quyền	3		8	2
249	2021-12-22 16:11:48.32558+00	45570	09010202 Nguyễn Hữu Thành	3		8	2
250	2021-12-22 16:11:48.328682+00	45569	09010202 Hoàng Bích Ngọc	3		8	2
251	2021-12-22 16:11:48.331781+00	45568	09010202 Huỳnh Vĩ Khang	3		8	2
252	2021-12-22 16:11:48.33417+00	45567	09010202 Lê Phan Ngọc Quý	3		8	2
253	2021-12-22 16:11:48.336449+00	45566	09010202 Nguyễn Xuân Khanh	3		8	2
254	2021-12-22 16:11:48.339538+00	45565	09010202 Phạm Huỳnh Thiên Bảo	3		8	2
255	2021-12-22 16:11:48.342675+00	45564	09010202 Trịnh Quý Thy	3		8	2
256	2021-12-22 16:11:48.345926+00	45563	09010202 Lương Vũ Tú Thanh	3		8	2
257	2021-12-22 16:11:48.349112+00	45562	09010202 Nguyễn Trúc Ly	3		8	2
258	2021-12-22 16:11:48.355504+00	45561	09010202 Nguyễn Hoàng Phúc	3		8	2
259	2021-12-22 16:11:48.358578+00	45560	09010202 Trần Nhật Khánh	3		8	2
260	2021-12-22 16:11:48.361623+00	45559	09010202 Mai Phương	3		8	2
261	2021-12-22 16:11:48.365771+00	45558	09010202 Vũ Đức Quân	3		8	2
262	2021-12-22 16:11:48.36998+00	45557	09010202 Lưu Mỹ Anh	3		8	2
263	2021-12-22 16:11:48.373063+00	45556	09010202 Phùng Trang Hưng Tuấn	3		8	2
264	2021-12-22 16:11:48.376124+00	45555	09010202 Ông Phước Hải	3		8	2
265	2021-12-22 16:11:48.38012+00	45554	09010201 Lý Ngọc Mỹ Hạnh	3		8	2
266	2021-12-22 16:11:48.384037+00	45553	09010201 Nguyễn Anh Khôi	3		8	2
267	2021-12-22 16:11:48.387105+00	45552	09010201 Mai Quỳnh Đông Nhi	3		8	2
268	2021-12-22 16:11:48.390034+00	45551	09010201 Dương Thị Phương Anh	3		8	2
269	2021-12-22 16:11:48.39401+00	45550	09010201 Nguyễn Ngọc Hoàng Vũ	3		8	2
270	2021-12-22 16:11:48.398135+00	45549	09010201 Thạch Thị Triệu Huy	3		8	2
271	2021-12-22 16:11:48.401419+00	45548	09010201 Nguyễn Minh Quang	3		8	2
272	2021-12-22 16:11:48.404489+00	45547	09010201 Hùng Ngọc Tuyết Nhi	3		8	2
273	2021-12-22 16:11:48.408468+00	45546	09010201 Nguyễn Hồng Phương Trâm	3		8	2
274	2021-12-22 16:11:48.412533+00	45545	09010201 Đôn Hoàng Anh Thư	3		8	2
275	2021-12-22 16:11:48.415617+00	45544	09010201 Nguyễn Duy Anh Khôi	3		8	2
276	2021-12-22 16:11:48.418912+00	45543	09010201 Nguyễn Đình Hải	3		8	2
277	2021-12-22 16:11:48.42304+00	45542	09010201 Phạm Trần Khôi	3		8	2
278	2021-12-22 16:11:48.426991+00	45541	09010201 Phan Nhật Thành	3		8	2
279	2021-12-22 16:11:48.430812+00	45540	09010201 Trần Thị Mỹ Duyên	3		8	2
280	2021-12-22 16:11:48.43485+00	45539	09010201 Phạm Gia Long	3		8	2
281	2021-12-22 16:11:48.438806+00	45538	09010201 Vũ Hoàn	3		8	2
282	2021-12-22 16:11:48.441875+00	45537	09010201 Võ Thanh Liêm	3		8	2
283	2021-12-22 16:11:48.444899+00	45536	09010201 Ngô Nguyễn Quang Sang	3		8	2
284	2021-12-22 16:11:48.448754+00	45535	09010201 Nguyễn Huỳnh Đức	3		8	2
285	2021-12-22 16:11:48.452959+00	45534	09010102 Đạo Hoàng Đăng	3		8	2
286	2021-12-22 16:11:48.456333+00	45533	09010102 Mai Hoàng Vương	3		8	2
287	2021-12-22 16:11:48.459541+00	45532	09010102 Lê Ngọc Vân Khánh	3		8	2
288	2021-12-22 16:11:48.463894+00	45531	09010102 Nguyễn Kim Ngân	3		8	2
289	2021-12-22 16:11:48.467885+00	45530	09010102 Tô Dĩ Khang	3		8	2
290	2021-12-22 16:11:48.47125+00	45529	09010102 Hứa Mộc Nhu	3		8	2
291	2021-12-22 16:11:48.474634+00	45528	09010102 Trần Tuấn Kiệt	3		8	2
292	2021-12-22 16:11:48.478855+00	45527	09010102 Trần Thị Lệ Hoa	3		8	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	account	user
7	agency	agency
8	citizen	citizen
9	citizen	family
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-17 15:12:29.30828+00
2	contenttypes	0002_remove_content_type_name	2021-11-17 15:12:29.3351+00
3	auth	0001_initial	2021-11-17 15:12:29.419988+00
4	auth	0002_alter_permission_name_max_length	2021-11-17 15:12:29.427963+00
5	auth	0003_alter_user_email_max_length	2021-11-17 15:12:29.439879+00
6	auth	0004_alter_user_username_opts	2021-11-17 15:12:29.449018+00
7	auth	0005_alter_user_last_login_null	2021-11-17 15:12:29.459634+00
8	auth	0006_require_contenttypes_0002	2021-11-17 15:12:29.467966+00
9	auth	0007_alter_validators_add_error_messages	2021-11-17 15:12:29.476864+00
10	auth	0008_alter_user_username_max_length	2021-11-17 15:12:29.484826+00
11	auth	0009_alter_user_last_name_max_length	2021-11-17 15:12:29.493038+00
12	auth	0010_alter_group_name_max_length	2021-11-17 15:12:29.502989+00
13	auth	0011_update_proxy_permissions	2021-11-17 15:12:29.511223+00
14	auth	0012_alter_user_first_name_max_length	2021-11-17 15:12:29.519818+00
15	account	0001_initial	2021-11-17 15:12:29.623305+00
16	admin	0001_initial	2021-11-17 15:12:29.668371+00
17	admin	0002_logentry_remove_auto_add	2021-11-17 15:12:29.682914+00
18	admin	0003_logentry_add_action_flag_choices	2021-11-17 15:12:29.698312+00
19	sessions	0001_initial	2021-11-17 15:12:29.727452+00
20	account	0002_alter_user_operate_to	2021-11-17 15:22:08.107233+00
21	account	0003_alter_user_username	2021-11-18 01:19:33.508439+00
22	account	0004_alter_user_operate_from	2021-11-20 09:45:32.234647+00
23	account	0005_alter_user_supervisor	2021-11-20 09:47:47.865155+00
24	agency	0001_initial	2021-11-23 01:12:01.734145+00
25	citizen	0001_initial	2021-11-26 15:25:03.335465+00
26	citizen	0002_alter_citizen_dob	2021-11-26 15:28:18.109378+00
27	citizen	0003_delete_citizen	2021-11-26 15:33:37.707741+00
28	citizen	0004_citizen	2021-11-26 15:39:19.889393+00
29	account	0006_user_agency	2021-12-01 03:28:48.230877+00
30	citizen	0005_auto_20211201_1237	2021-12-01 05:37:46.137112+00
31	citizen	0006_alter_citizen_educational	2021-12-01 07:38:53.679864+00
32	citizen	0007_alter_family_create	2021-12-01 08:04:33.481478+00
33	citizen	0008_citizen_family	2021-12-01 08:13:12.987329+00
34	citizen	0009_alter_citizen_address	2021-12-01 08:14:36.42118+00
35	citizen	0010_citizen_dod	2021-12-01 08:49:13.542235+00
36	citizen	0011_rename_create_family_created	2021-12-01 09:07:19.722574+00
37	citizen	0012_alter_citizen_family	2021-12-01 16:03:37.337466+00
38	account	0007_alter_user_agency	2021-12-02 01:58:14.70783+00
39	citizen	0013_auto_20211206_2208	2021-12-06 15:34:32.990596+00
40	citizen	0014_auto_20211206_2234	2021-12-06 15:35:06.463625+00
41	citizen	0015_auto_20211206_2301	2021-12-06 16:01:35.297969+00
42	citizen	0016_auto_20211206_2330	2021-12-06 16:30:13.880733+00
43	citizen	0017_alter_citizen_educational	2021-12-22 03:46:13.893311+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
eauzpd42r6dze8if41hfibarugti17ah	.eJxVjDsOwjAQBe_iGlle_-KlpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM5MstPvFig-cttBulO7dR57W5c58F3hBx382lN-Xg7376DSqN-6YIwGgkUhUy6mWAhZgAAnEbQspLSJDkjo4ixJVBnRgjJTFEGriZC9P9eyNxE:1moMO7:vHwAY8Rhhw6mZIKrKvlY_gxinfvX8MuoSCzVlSc7-VA	2021-12-04 09:10:23.829802+00
cvdh6g4knnlnzva0f8dymt4ea5avhzeb	.eJxVjE0OwiAYBe_C2hChUMGle89Avj-kaiAp7cp4d23ShW7fzLyXSrAuJa1d5jSxOiurDr8bAj2kboDvUG9NU6vLPKHeFL3Trq-N5XnZ3b-DAr18a0eOkBlNHsSLd4bGCBw8MUTjfDYUgTCYnDnQEEbMJ3GebZSjCQxWvT8bPDkp:1msFtx:I371RcE00NkHIQz62zAL-JzLPD1U8bGF6h9GJIiUd8Q	2021-12-15 03:03:21.482017+00
0mb2ayxkgttl4e32dpogqf1su0spruno	.eJxVjE0OwiAYBe_C2hChUMGle89Avj-kaiAp7cp4d23ShW7fzLyXSrAuJa1d5jSxOiurDr8bAj2kboDvUG9NU6vLPKHeFL3Trq-N5XnZ3b-DAr18a0eOkBlNHsSLd4bGCBw8MUTjfDYUgTCYnDnQEEbMJ3GebZSjCQxWvT8bPDkp:1myEoV:Fi90uo59HTyhHrEKdag_F1zJQ_XAOVrSObzJR2DayNA	2021-12-31 15:06:27.24714+00
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_user_groups_id_seq', 1, false);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_user_id_seq', 2815, true);


--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: citizen_citizen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citizen_citizen_id_seq', 49226, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 292, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 43, true);


--
-- Name: account_user account_user_agency_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_agency_id_key UNIQUE (agency_id);


--
-- Name: account_user_groups account_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups account_user_groups_user_id_group_id_4d09af3e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_group_id_4d09af3e_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions account_user_user_permis_user_id_permission_id_48bdd28b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permis_user_id_permission_id_48bdd28b_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions account_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: account_user account_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_username_key UNIQUE (username);


--
-- Name: agency_agency agency_agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agency_agency
    ADD CONSTRAINT agency_agency_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: citizen_citizen citizen_citizen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citizen_citizen
    ADD CONSTRAINT citizen_citizen_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: account_user_agency_id_6280f2ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_agency_id_6280f2ec_like ON public.account_user USING btree (agency_id varchar_pattern_ops);


--
-- Name: account_user_groups_group_id_6c71f749; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_groups_group_id_6c71f749 ON public.account_user_groups USING btree (group_id);


--
-- Name: account_user_groups_user_id_14345e7b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_groups_user_id_14345e7b ON public.account_user_groups USING btree (user_id);


--
-- Name: account_user_supervisor_id_1e9d7100; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_supervisor_id_1e9d7100 ON public.account_user USING btree (supervisor_id);


--
-- Name: account_user_user_permissions_permission_id_66c44191; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_user_permissions_permission_id_66c44191 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: account_user_user_permissions_user_id_cc42d270; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_user_permissions_user_id_cc42d270 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: account_user_username_d393f583_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_user_username_d393f583_like ON public.account_user USING btree (username varchar_pattern_ops);


--
-- Name: agency_agency_id_4b83437a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agency_agency_id_4b83437a_like ON public.agency_agency USING btree (id varchar_pattern_ops);


--
-- Name: agency_agency_sup_agency_id_7d1c3fc4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agency_agency_sup_agency_id_7d1c3fc4 ON public.agency_agency USING btree (sup_agency_id);


--
-- Name: agency_agency_sup_agency_id_7d1c3fc4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agency_agency_sup_agency_id_7d1c3fc4_like ON public.agency_agency USING btree (sup_agency_id varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: citizen_citizen_declarer_id_aa081d02; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX citizen_citizen_declarer_id_aa081d02 ON public.citizen_citizen USING btree (declarer_id);


--
-- Name: citizen_citizen_village_id_id_1c28285b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX citizen_citizen_village_id_id_1c28285b ON public.citizen_citizen USING btree (village_id_id);


--
-- Name: citizen_citizen_village_id_id_1c28285b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX citizen_citizen_village_id_id_1c28285b_like ON public.citizen_citizen USING btree (village_id_id varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: account_user account_user_agency_id_6280f2ec_fk_agency_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_agency_id_6280f2ec_fk_agency_agency_id FOREIGN KEY (agency_id) REFERENCES public.agency_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_group_id_6c71f749_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_group_id_6c71f749_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_user_id_14345e7b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_14345e7b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user account_user_supervisor_id_1e9d7100_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_supervisor_id_1e9d7100_fk_account_user_id FOREIGN KEY (supervisor_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_permission_id_66c44191_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_permission_id_66c44191_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_user_id_cc42d270_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_user_id_cc42d270_fk_account_u FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agency_agency agency_agency_sup_agency_id_7d1c3fc4_fk_agency_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agency_agency
    ADD CONSTRAINT agency_agency_sup_agency_id_7d1c3fc4_fk_agency_agency_id FOREIGN KEY (sup_agency_id) REFERENCES public.agency_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: citizen_citizen citizen_citizen_declarer_id_aa081d02_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citizen_citizen
    ADD CONSTRAINT citizen_citizen_declarer_id_aa081d02_fk_account_user_id FOREIGN KEY (declarer_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: citizen_citizen citizen_citizen_village_id_id_1c28285b_fk_agency_agency_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citizen_citizen
    ADD CONSTRAINT citizen_citizen_village_id_id_1c28285b_fk_agency_agency_id FOREIGN KEY (village_id_id) REFERENCES public.agency_agency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

