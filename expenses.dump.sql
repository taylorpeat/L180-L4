--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date DEFAULT now(),
    CONSTRAINT expenses_amount_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE expenses OWNER TO taylorpeat;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO taylorpeat;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY expenses (id, amount, memo, created_on) FROM stdin;
1	14.56	Pencils	2017-07-17
4	49.99	Text Editor	2017-07-17
5	3.29	Coffee	2017-07-17
8	0.99	Donut	2017-07-18
9	15.99	Uber Ride	2017-07-18
10	15.99	Uber Ride	2017-07-18
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('expenses_id_seq', 10, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

