--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: custumers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.custumers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    email character varying(50),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    status boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, email, password, created_at, updated_at) FROM stdin;
1	trunglv@gmail.com	$2b$10$A1YXsG8lu4DgcJo5.An5A.InV5f4/x8ZKRO4UxxvhEM3m2wz6YD5K	2024-01-06 21:47:15.417492+07	2024-01-06 21:47:15.417492+07
2	hang16@gmail.com	$2b$10$YWFvvOu5PNFm7XJM324/Oef0eZ3XUerLGKaEWz3sOzjmkK2IZ7meG	2024-01-07 02:08:39.616658+07	2024-01-07 02:08:39.616658+07
3	lien3@gmail.com\n	$2b$10$tNyvL.BORHuWvve0STA84u87ScKfAjYiiP2XsduUnMjd/TrxPU5r.	2024-01-07 02:12:41.977255+07	2024-01-07 02:12:41.977255+07
4	tuanhung@gmail.com	$2b$10$M.MUYPDd0z6YbLHZ0dB9Q.qkfQ.v624hnZxBDI/2PSKGkUp4zzR/q	2024-01-07 02:12:41.977255+07	2024-01-07 02:12:41.977255+07
5	ngocminh@gmail.com	$2b$10$mWOiJpG/hjkMojzruQX9IuOVhU8M16WEH5YOf9.ZF4TWMm5Cim/ye	2024-01-07 02:12:41.977255+07	2024-01-07 02:12:41.977255+07
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at, updated_at, status) FROM stdin;
12	user16	user6@gmail.com	2024-01-03 00:34:30.986297+07	2024-01-03 00:34:30.986297+07	f
13	user61	user3@gmail.com	2024-01-03 19:13:41.140679+07	2024-01-03 19:13:41.140679+07	f
4	users 7	user9@gmail.com	2024-01-02 08:32:41.681158+07	2024-01-02 08:32:41.681158+07	t
\.


--
-- Name: custumers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custumers_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: customers custumers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT custumers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

