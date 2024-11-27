--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-26 21:12:28

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
-- TOC entry 215 (class 1259 OID 32795)
-- Name: avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avion (
    id_avion integer NOT NULL,
    modelo character varying(1000) NOT NULL,
    capacidad numeric NOT NULL,
    id_avion_pilotos integer
);


ALTER TABLE public.avion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32809)
-- Name: pasajero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pasajero (
    id_pasajero integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    nacionalidad character varying NOT NULL,
    numero_pasaporte character varying NOT NULL,
    fecha_nacimiento date NOT NULL
);


ALTER TABLE public.pasajero OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32802)
-- Name: pilotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pilotos (
    id_piloto integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    hora_vuelo integer NOT NULL
);


ALTER TABLE public.pilotos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32823)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id_reserva integer NOT NULL,
    numero_reserva character varying NOT NULL,
    fecha_reserva date NOT NULL,
    estado character varying NOT NULL,
    id_reserva_pasajero integer NOT NULL,
    id_reserva_vuelos integer NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32816)
-- Name: vuelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelos (
    id_vuelos integer NOT NULL,
    origen character varying NOT NULL,
    destino character varying NOT NULL,
    fecha_salida timestamp with time zone NOT NULL,
    fecha_llegada timestamp with time zone NOT NULL,
    numero_vuelo character varying NOT NULL,
    clase character varying NOT NULL,
    id_vuelos_avion integer NOT NULL
);


ALTER TABLE public.vuelos OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 32795)
-- Dependencies: 215
-- Data for Name: avion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avion (id_avion, modelo, capacidad, id_avion_pilotos) FROM stdin;
1	Boeing_737	215	1
2	Boeing 747	500	2
3	Airbus A320	240	3
5	Bombardier CRJ700	70	5
6	Boeing 787 Dreamliner	355	2
7	Airbus A380	853	1
8	Airbus A350:	410	2
9	Gulfstream G650	19	5
10	Cessna Citation X	12	4
11	Lockheed Martin C-130 Hercules	92	5
\.


--
-- TOC entry 4862 (class 0 OID 32809)
-- Dependencies: 217
-- Data for Name: pasajero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pasajero (id_pasajero, nombre, apellido, nacionalidad, numero_pasaporte, fecha_nacimiento) FROM stdin;
1	Jose	alvarez	colombiano	10001	1990-12-01
2	Maria	Gomez	colombiana	10002	1985-05-15
3	Carlos	Perez	Argentino	10003	1992-08-23
4	Ana	Martinez	Espanol	10004	1988-11-30
5	Luis	Rodriguez	Peruano	10005	1995-07-19
6	Laura	Lopez	Estado Unidense	10006	1993-03-10
7	Juan	Hernandez	Brasileno	10007	1987-09-25
8	Sofia	Garcia	Italiano	10008	1991-12-12
9	Miguel	Torres	colombiano	10009	1989-06-05
10	Lucia	Ramirez	colombiana	10010	1994-04-18
\.


--
-- TOC entry 4861 (class 0 OID 32802)
-- Dependencies: 216
-- Data for Name: pilotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pilotos (id_piloto, nombre, apellido, hora_vuelo) FROM stdin;
1	Carlos	Gomez	1200
2	Ana	Martinez	1500
3	Luis	Rodriguez	1800
4	Maria	Lopez	2000
5	Juan	Perez	2200
\.


--
-- TOC entry 4864 (class 0 OID 32823)
-- Dependencies: 219
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id_reserva, numero_reserva, fecha_reserva, estado, id_reserva_pasajero, id_reserva_vuelos) FROM stdin;
1	RES1001	2024-11-01	confirmada	3	7
2	RES1002	2024-11-02	pendiente	5	2
3	RES1003	2024-11-03	cancelada	1	9
4	RES1004	2024-11-04	confirmada	7	4
5	RES1005	2024-11-05	pendiente	2	8
6	RES1006	2024-11-06	confirmada	9	1
7	RES1007	2024-11-07	cancelada	4	10
8	RES1008	2024-11-08	confirmada	6	3
9	RES1009	2024-11-09	pendiente	8	5
10	RES1010	2024-11-10	confirmada	10	6
\.


--
-- TOC entry 4863 (class 0 OID 32816)
-- Dependencies: 218
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelos (id_vuelos, origen, destino, fecha_salida, fecha_llegada, numero_vuelo, clase, id_vuelos_avion) FROM stdin;
1	Bogotá	Medellín	2024-12-01 08:00:00-05	2024-12-01 09:30:00-05	AV123	Economy	1
2	Cali	Cartagena	2024-12-02 10:00:00-05	2024-12-02 12:00:00-05	AV124	Business	2
3	Medellín	Bogotá	2024-12-03 14:00:00-05	2024-12-03 15:30:00-05	AV125	First	3
4	Cartagena	Cali	2024-12-04 16:00:00-05	2024-12-04 18:00:00-05	AV126	Economy	5
5	Bogotá	Cali	2024-12-05 06:00:00-05	2024-12-05 07:30:00-05	AV127	Business	6
6	Cali	Bogotá	2024-12-06 09:00:00-05	2024-12-06 10:30:00-05	AV128	First	7
7	Medellín	Cartagena	2024-12-07 11:00:00-05	2024-12-07 13:00:00-05	AV129	Economy	8
8	Cartagena	Medellín	2024-12-08 15:00:00-05	2024-12-08 17:00:00-05	AV130	Business	9
9	Bogotá	Cartagena	2024-12-09 18:00:00-05	2024-12-09 20:00:00-05	AV131	First	10
10	Cali	Medellín	2024-12-10 07:00:00-05	2024-12-10 08:30:00-05	AV132	Economy	11
\.


--
-- TOC entry 4704 (class 2606 OID 32801)
-- Name: avion avion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_pkey PRIMARY KEY (id_avion);


--
-- TOC entry 4708 (class 2606 OID 32815)
-- Name: pasajero pasajero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id_pasajero);


--
-- TOC entry 4706 (class 2606 OID 32808)
-- Name: pilotos pilotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pilotos
    ADD CONSTRAINT pilotos_pkey PRIMARY KEY (id_piloto);


--
-- TOC entry 4712 (class 2606 OID 32829)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 4710 (class 2606 OID 32822)
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (id_vuelos);


--
-- TOC entry 4713 (class 2606 OID 40986)
-- Name: avion id_avion_pilotos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT id_avion_pilotos FOREIGN KEY (id_avion_pilotos) REFERENCES public.pilotos(id_piloto) NOT VALID;


--
-- TOC entry 4715 (class 2606 OID 40991)
-- Name: reservas id_reserva_pasajero; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT id_reserva_pasajero FOREIGN KEY (id_reserva_pasajero) REFERENCES public.pasajero(id_pasajero) NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 40996)
-- Name: reservas id_reserva_vuelos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT id_reserva_vuelos FOREIGN KEY (id_reserva_vuelos) REFERENCES public.vuelos(id_vuelos) NOT VALID;


--
-- TOC entry 4714 (class 2606 OID 41006)
-- Name: vuelos id_vuelos_avion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT id_vuelos_avion FOREIGN KEY (id_vuelos_avion) REFERENCES public.avion(id_avion) NOT VALID;


-- Completed on 2024-11-26 21:12:28

--
-- PostgreSQL database dump complete
--

