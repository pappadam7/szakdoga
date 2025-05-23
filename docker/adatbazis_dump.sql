--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.accounts_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role character varying(10) NOT NULL
);


ALTER TABLE public.accounts_customuser OWNER TO beadandouser;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.accounts_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO beadandouser;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.accounts_customuser_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.accounts_customuser ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO beadandouser;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.accounts_customuser_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO beadandouser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO beadandouser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO beadandouser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_app_movie; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.customer_app_movie (
    "ID" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "Director" character varying(50) NOT NULL,
    "ReleaseDate" date NOT NULL,
    "Length" integer NOT NULL,
    "Description" text NOT NULL,
    "Poster" character varying(100) NOT NULL
);


ALTER TABLE public.customer_app_movie OWNER TO beadandouser;

--
-- Name: customer_app_movie_ID_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.customer_app_movie ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."customer_app_movie_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_app_screening; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.customer_app_screening (
    "ID" integer NOT NULL,
    "Start_Date" date NOT NULL,
    "Start_Time" time without time zone NOT NULL,
    "Room" integer NOT NULL,
    "MovieID_id" integer NOT NULL
);


ALTER TABLE public.customer_app_screening OWNER TO beadandouser;

--
-- Name: customer_app_screening_ID_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.customer_app_screening ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."customer_app_screening_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_app_ticket; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.customer_app_ticket (
    "ID" integer NOT NULL,
    "Row" integer NOT NULL,
    "Seat" integer NOT NULL,
    "CustomerFirsName" character varying(50) NOT NULL,
    "CustomerLastName" character varying(50) NOT NULL,
    "CustomerEmail" character varying(50) NOT NULL,
    "CustomerPhone" character varying(50) NOT NULL,
    "Sold" boolean NOT NULL,
    "ScreeningID_id" integer NOT NULL
);


ALTER TABLE public.customer_app_ticket OWNER TO beadandouser;

--
-- Name: customer_app_ticket_ID_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.customer_app_ticket ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."customer_app_ticket_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: beadandouser
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


ALTER TABLE public.django_admin_log OWNER TO beadandouser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO beadandouser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO beadandouser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: beadandouser
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: beadandouser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO beadandouser;

--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.accounts_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, role) FROM stdin;
1	pbkdf2_sha256$870000$3ZkD2t1iBMXwxm5ZUWbBmT$cM+0d/7rBlx1zyHWEYCt1/gnOnsImRlILXZ04eG5ag0=	2025-05-24 15:52:20.12458+00	t	Admin			admin@admin.hu	t	t	2025-05-24 15:51:57.370215+00	customer
3	pbkdf2_sha256$870000$eGAJ47fyJ8e3JiMG51yzxD$/AcGnpv5O+MasTcSFbK9GX+X9bbngTWmQJCVV8pTczo=	\N	f	Seller				f	t	2025-05-24 15:53:39+00	customer
2	pbkdf2_sha256$870000$Rg3ub8ZZ9LmDlvGkF8H128$y6BL4lKPqruNauWb+XlLSk8SGpnmQksilUn093iinMw=	2025-05-24 15:54:52.511594+00	f	Operator				t	t	2025-05-24 15:53:07+00	customer
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
1	2	2
2	3	1
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.auth_group (id, name) FROM stdin;
1	Seller
2	Operator
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: beadandouser
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
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add movie	7	add_movie
26	Can change movie	7	change_movie
27	Can delete movie	7	delete_movie
28	Can view movie	7	view_movie
29	Can add ticket	8	add_ticket
30	Can change ticket	8	change_ticket
31	Can delete ticket	8	delete_ticket
32	Can view ticket	8	view_ticket
33	Can add screening	9	add_screening
34	Can change screening	9	change_screening
35	Can delete screening	9	delete_screening
36	Can view screening	9	view_screening
\.


--
-- Data for Name: customer_app_movie; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.customer_app_movie ("ID", "Title", "Director", "ReleaseDate", "Length", "Description", "Poster") FROM stdin;
1	A sötét lovag	Christopher Nolan	2008-07-18	152	Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as "The Joker" appears in Gotham, creating a new wave of chaos. Batman''s struggle against The Joker becomes deeply personal, forcing him to "confront everything he believes" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes.	movies/2384_4_ACuso5u.jpg
2	A sötét lovag: Felemelkedés	Christopher Nolan	2012-07-20	165	Despite his tarnished reputation after the events of The Dark Knight (2008), in which he took the rap for Dent''s crimes, Batman feels compelled to intervene to assist the city and its Police force, which is struggling to cope with Bane''s plans to destroy the city.	movies/57611_37_xHLSRDN.jpg
3	A Gyűrűk ura Ura: A gyűrű szövetsége	Peter Jackson	2001-12-19	178	An ancient Ring thought lost for centuries has been found, and through a strange twist of fate has been given to a small Hobbit named Frodo. When Gandalf discovers the Ring is in fact the One Ring of the Dark Lord Sauron, Frodo must make an epic quest to Mount Doom in order to destroy it. However, he does not go alone. He is joined by Gandalf, Legolas the elf, Gimli the Dwarf, Aragorn, Boromir, and his three Hobbit friends Merry, Pippin, and Samwise. Through mountains, snow, darkness, forests, rivers and plains, facing evil and danger at every corner the Fellowship of the Ring must go. Their quest to destroy the One Ring is the only hope for the end of the Dark Lords reign.	movies/2314_47_ycM4zeG.jpg
4	A Gyűrűk Ura: A két torony	Peter Jackson	2002-12-18	179	The continuing quest of Frodo and the Fellowship to destroy the One Ring. Frodo and Sam discover they are being followed by the mysterious Gollum. Aragorn, the Elf archer Legolas, and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Saruman''s deadly spell.	movies/57611_37_EFVI35J.jpg
\.


--
-- Data for Name: customer_app_screening; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.customer_app_screening ("ID", "Start_Date", "Start_Time", "Room", "MovieID_id") FROM stdin;
1	2025-06-25	18:00:00	1	1
2	2025-06-25	13:00:00	1	1
3	2025-06-27	13:00:00	1	2
4	2025-06-26	19:30:00	1	2
5	2025-06-30	14:15:00	1	3
6	2025-06-25	16:30:00	1	4
\.


--
-- Data for Name: customer_app_ticket; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.customer_app_ticket ("ID", "Row", "Seat", "CustomerFirsName", "CustomerLastName", "CustomerEmail", "CustomerPhone", "Sold", "ScreeningID_id") FROM stdin;
1	6	6	Kiss	Miska	kiss@miska.hu	06302221100	f	1
2	6	5	Kiss	Miska	kiss@miska.hu	06302221100	f	1
3	6	4	Kiss	Miska	kiss@miska.hu	06302221100	f	1
4	5	5	Kiss	Miska	kiss@miska.hu	06302221100	f	1
5	5	6	Kiss	Miska	kiss@miska.hu	06302221100	f	1
6	5	7	Kiss	Miska	kiss@miska.hu	06302221100	f	1
7	8	4	Kiss	Miska	kiss@miska.hu	06302221100	f	1
8	7	3	Kiss	Miska	kiss@miska.hu	06302221100	f	1
9	7	4	Kiss	Miska	kiss@miska.hu	06302221100	f	1
10	7	5	Kiss	Miska	kiss@miska.hu	06302221100	f	1
11	8	6	Kiss	Miska	kiss@miska.hu	06302221100	f	1
12	9	7	Kiss	Miska	kiss@miska.hu	06302221100	f	1
13	3	5	Batman	Fan	batman@fan.hu	06302221100	f	3
14	4	5	Batman	Fan	batman@fan.hu	06302221100	f	3
15	4	6	Batman	Fan	batman@fan.hu	06302221100	f	3
16	4	7	Batman	Fan	batman@fan.hu	06302221100	f	3
17	5	4	Batman	Fan	batman@fan.hu	06302221100	f	3
18	5	3	Batman	Fan	batman@fan.hu	06302221100	f	3
19	5	2	Batman	Fan	batman@fan.hu	06302221100	f	3
20	6	4	Batman	Fan	batman@fan.hu	06302221100	f	3
21	6	5	Batman	Fan	batman@fan.hu	06302221100	f	3
22	6	6	Batman	Fan	batman@fan.hu	06302221100	f	3
23	7	6	Batman	Fan	batman@fan.hu	06302221100	f	3
24	7	7	Batman	Fan	batman@fan.hu	06302221100	f	3
25	7	8	Batman	Fan	batman@fan.hu	06302221100	f	3
26	8	4	Batman	Fan	batman@fan.hu	06302221100	f	3
27	8	3	Batman	Fan	batman@fan.hu	06302221100	f	3
28	9	4	Batman	Fan	batman@fan.hu	06302221100	f	3
29	9	5	Batman	Fan	batman@fan.hu	06302221100	f	3
30	9	6	Batman	Fan	batman@fan.hu	06302221100	f	3
31	4	3	Batman	Fan	batman@fan.hu	06302221100	f	2
32	4	4	Batman	Fan	batman@fan.hu	06302221100	f	2
33	4	5	Batman	Fan	batman@fan.hu	06302221100	f	2
34	4	6	Batman	Fan	batman@fan.hu	06302221100	f	2
35	3	4	Batman	Fan	batman@fan.hu	06302221100	f	2
36	3	5	Batman	Fan	batman@fan.hu	06302221100	f	2
37	3	6	Batman	Fan	batman@fan.hu	06302221100	f	2
38	6	7	Batman	Fan	batman@fan.hu	06302221100	f	2
39	6	6	Batman	Fan	batman@fan.hu	06302221100	f	2
40	6	5	Batman	Fan	batman@fan.hu	06302221100	f	2
41	6	4	Batman	Fan	batman@fan.hu	06302221100	f	2
42	8	4	Batman	Fan	batman@fan.hu	06302221100	f	2
43	8	5	Batman	Fan	batman@fan.hu	06302221100	f	2
44	8	6	Batman	Fan	batman@fan.hu	06302221100	f	2
45	9	6	Batman	Fan	batman@fan.hu	06302221100	f	2
46	9	7	Batman	Fan	batman@fan.hu	06302221100	f	2
47	3	4	Batman	Fan	batman@fan.hu	06302221100	f	4
48	3	6	Batman	Fan	batman@fan.hu	06302221100	f	4
49	3	7	Batman	Fan	batman@fan.hu	06302221100	f	4
50	5	6	Batman	Fan	batman@fan.hu	06302221100	f	4
51	5	5	Batman	Fan	batman@fan.hu	06302221100	f	4
52	5	4	Batman	Fan	batman@fan.hu	06302221100	f	4
53	7	3	Batman	Fan	batman@fan.hu	06302221100	f	4
54	7	4	Batman	Fan	batman@fan.hu	06302221100	f	4
55	7	5	Batman	Fan	batman@fan.hu	06302221100	f	4
56	7	6	Batman	Fan	batman@fan.hu	06302221100	f	4
57	9	9	Batman	Fan	batman@fan.hu	06302221100	f	4
58	9	8	Batman	Fan	batman@fan.hu	06302221100	f	4
59	9	7	Batman	Fan	batman@fan.hu	06302221100	f	4
60	5	9	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
61	5	8	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
62	5	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
63	4	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
64	4	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
65	4	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
66	4	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
67	9	9	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
68	9	8	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
69	9	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
70	9	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
71	8	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
72	8	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
73	8	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
74	7	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
75	7	3	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
76	6	2	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
77	6	3	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
78	6	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	5
79	2	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
80	2	8	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
81	2	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
82	2	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
83	4	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
84	4	3	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
85	4	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
86	4	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
87	6	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
88	6	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
89	6	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
90	6	3	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
91	7	4	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
92	7	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
93	7	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
94	7	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
95	8	8	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
96	9	7	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
97	9	6	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
98	9	5	Egy	Gyuru	egy@gyuru.hu	06302221100	f	6
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-05-24 15:53:07.815707+00	2	Operator	1	[{"added": {}}]	6	1
2	2025-05-24 15:53:24.63894+00	2	Operator	2	[{"changed": {"fields": ["Staff status"]}}]	6	1
3	2025-05-24 15:53:39.624543+00	3	Seller	1	[{"added": {}}]	6	1
4	2025-05-24 15:54:07.906862+00	1	Seller	1	[{"added": {}}]	3	1
5	2025-05-24 15:54:15.945057+00	2	Operator	1	[{"added": {}}]	3	1
6	2025-05-24 15:54:25.462087+00	2	Operator	2	[{"changed": {"fields": ["Groups"]}}]	6	1
7	2025-05-24 15:54:30.596292+00	3	Seller	2	[{"changed": {"fields": ["Groups"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	customuser
7	customer_app	movie
8	customer_app	ticket
9	customer_app	screening
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-05-24 15:27:04.023205+00
2	contenttypes	0002_remove_content_type_name	2025-05-24 15:27:04.033418+00
3	auth	0001_initial	2025-05-24 15:27:04.069566+00
4	auth	0002_alter_permission_name_max_length	2025-05-24 15:27:04.078175+00
5	auth	0003_alter_user_email_max_length	2025-05-24 15:27:04.088233+00
6	auth	0004_alter_user_username_opts	2025-05-24 15:27:04.097666+00
7	auth	0005_alter_user_last_login_null	2025-05-24 15:27:04.106116+00
8	auth	0006_require_contenttypes_0002	2025-05-24 15:27:04.111001+00
9	auth	0007_alter_validators_add_error_messages	2025-05-24 15:27:04.120425+00
10	auth	0008_alter_user_username_max_length	2025-05-24 15:27:04.129354+00
11	auth	0009_alter_user_last_name_max_length	2025-05-24 15:27:04.138703+00
12	auth	0010_alter_group_name_max_length	2025-05-24 15:27:04.148223+00
13	auth	0011_update_proxy_permissions	2025-05-24 15:27:04.156696+00
14	auth	0012_alter_user_first_name_max_length	2025-05-24 15:27:04.166247+00
15	accounts	0001_initial	2025-05-24 15:27:04.199735+00
16	admin	0001_initial	2025-05-24 15:27:04.221449+00
17	admin	0002_logentry_remove_auto_add	2025-05-24 15:27:04.231801+00
18	admin	0003_logentry_add_action_flag_choices	2025-05-24 15:27:04.242757+00
19	sessions	0001_initial	2025-05-24 15:27:04.256676+00
20	customer_app	0001_initial	2025-05-24 15:27:31.358013+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: beadandouser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
px7biy5r4xatn5jjeg94d2nldzmal406	.eJxVjMEOwiAQRP-FsyHFCst69N5vIEt3kaqBpLQn47_bJj3oaZJ5b-atAq1LDmuTOUysruqsTr9dpPEpZQf8oHKveqxlmaeod0UftOmhsrxuh_t3kKnlbU0dOejQoUDq-ULWYWK0YixSHxEQ0bgkFoQIew8sHmELg5YYPKvPF9t8N78:1uIrD2:H7k6FBye9Jip2teA3ikK_ZnAGUKnKTGeLcvxD7LKRQ4	2025-06-07 15:54:52.520327+00
\.


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 2, true);


--
-- Name: accounts_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.accounts_customuser_id_seq', 3, true);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: customer_app_movie_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public."customer_app_movie_ID_seq"', 4, true);


--
-- Name: customer_app_screening_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public."customer_app_screening_ID_seq"', 6, true);


--
-- Name: customer_app_ticket_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public."customer_app_ticket_ID_seq"', 98, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 7, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: beadandouser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: customer_app_movie customer_app_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.customer_app_movie
    ADD CONSTRAINT customer_app_movie_pkey PRIMARY KEY ("ID");


--
-- Name: customer_app_screening customer_app_screening_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.customer_app_screening
    ADD CONSTRAINT customer_app_screening_pkey PRIMARY KEY ("ID");


--
-- Name: customer_app_ticket customer_app_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.customer_app_ticket
    ADD CONSTRAINT customer_app_ticket_pkey PRIMARY KEY ("ID");


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_customuser_username_722f3555_like; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX accounts_customuser_username_722f3555_like ON public.accounts_customuser USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: customer_app_screening_MovieID_id_8a52d2a3; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX "customer_app_screening_MovieID_id_8a52d2a3" ON public.customer_app_screening USING btree ("MovieID_id");


--
-- Name: customer_app_ticket_ScreeningID_id_8ee89537; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX "customer_app_ticket_ScreeningID_id_8ee89537" ON public.customer_app_ticket USING btree ("ScreeningID_id");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: beadandouser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__permission_id_aea3d0e5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__permission_id_aea3d0e5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_app_screening customer_app_screeni_MovieID_id_8a52d2a3_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.customer_app_screening
    ADD CONSTRAINT "customer_app_screeni_MovieID_id_8a52d2a3_fk_customer_" FOREIGN KEY ("MovieID_id") REFERENCES public.customer_app_movie("ID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_app_ticket customer_app_ticket_ScreeningID_id_8ee89537_fk_customer_; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.customer_app_ticket
    ADD CONSTRAINT "customer_app_ticket_ScreeningID_id_8ee89537_fk_customer_" FOREIGN KEY ("ScreeningID_id") REFERENCES public.customer_app_screening("ID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: beadandouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

