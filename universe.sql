--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age numeric NOT NULL,
    history text,
    discoverer character varying(50),
    color character varying(50),
    is_spiral boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    age numeric NOT NULL,
    discoverer character varying(50),
    color character varying(50),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    name character varying(50) NOT NULL,
    other_id integer NOT NULL,
    type character varying(50)
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_other_id_seq OWNED BY public.other.other_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    discoverer character varying(50),
    color character varying(50),
    has_rings boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    discoverer character varying(50),
    color character varying(50),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, NULL, 'Unknown', 'Various', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Nearest major galaxy to Milky Way', 'Messier', 'Blue-White', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 'Third largest in Local Group', 'Herschel', 'Blue', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 12000, 'Famous spiral galaxy', 'Lord Rosse', 'White', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13000, 'Known for its bright nucleus and large dust lane', 'Pierre Méchain', 'Yellow-White', true);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 12000, 'Grand design spiral galaxy', 'Johann Elert Bode', 'White', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 'Unknown', 'Grey', 1);
INSERT INTO public.moon VALUES (2, 'Luna', 4500, 'Galileo', 'Silver', 1);
INSERT INTO public.moon VALUES (5, 'Selene', 4500, 'Huygens', 'Pale Grey', 1);
INSERT INTO public.moon VALUES (23, 'Phobos', 4500, 'Hall', 'Dark Grey', 14);
INSERT INTO public.moon VALUES (24, 'Deimos', 4500, 'Hall II', 'Dark Red', 14);
INSERT INTO public.moon VALUES (25, 'Io', 4500, 'Galileo II', 'Yellow', 15);
INSERT INTO public.moon VALUES (26, 'Europa', 4500, 'Galileo III', 'White', 15);
INSERT INTO public.moon VALUES (27, 'Ganymede', 4500, 'Galileo IV', 'Light Brown', 15);
INSERT INTO public.moon VALUES (28, 'Callisto', 4500, 'Galileo V', 'Grey', 15);
INSERT INTO public.moon VALUES (29, 'Titan', 4500, 'Huygens II', 'Orange', 16);
INSERT INTO public.moon VALUES (30, 'Rhea', 4500, 'Cassini II', 'Pale Grey', 16);
INSERT INTO public.moon VALUES (31, 'Oberon', 4500, 'Herschel IV', 'Grey-Blue', 17);
INSERT INTO public.moon VALUES (32, 'Titania', 4500, 'Herschel V', 'Light Blue', 17);
INSERT INTO public.moon VALUES (33, 'Umbriel', 4500, 'Herschel VI', 'Dark Grey', 17);
INSERT INTO public.moon VALUES (34, 'Triton', 4500, 'Lassell', 'Light Blue', 18);
INSERT INTO public.moon VALUES (35, 'Nereid', 4500, 'Galle', 'Grey', 18);
INSERT INTO public.moon VALUES (36, 'Kepler-22b I', 6000, 'Kepler Team II', 'Light Blue', 19);
INSERT INTO public.moon VALUES (37, 'Kepler-22b II', 6000, 'Kepler Team III', 'Blue', 19);
INSERT INTO public.moon VALUES (38, 'Proxima b I', 4500, 'Anglada-Escudé II', 'Grey', 20);
INSERT INTO public.moon VALUES (39, 'Trappist-1e I', 5700, 'Gillon II', 'Brown', 23);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES ('Comet Halley', 1, 'Comet');
INSERT INTO public.other VALUES ('Andromeda', 2, 'Galaxy');
INSERT INTO public.other VALUES ('Mars Rover', 3, 'Probe');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 'Unknown', 'Blue', false, 1);
INSERT INTO public.planet VALUES (13, 'Earth', 4500, 'Copernicus', 'Blue', false, 1);
INSERT INTO public.planet VALUES (14, 'Mars', 4600, 'Galileo', 'Red', false, 1);
INSERT INTO public.planet VALUES (15, 'Jupiter', 4600, 'Herschel', 'Orange', true, 4);
INSERT INTO public.planet VALUES (16, 'Saturn', 4500, 'Cassini', 'Yellow', true, 5);
INSERT INTO public.planet VALUES (17, 'Uranus', 4500, 'Herschel III', 'Blue-Green', true, 6);
INSERT INTO public.planet VALUES (18, 'Neptune', 4500, 'Le Verrier', 'Blue', true, 6);
INSERT INTO public.planet VALUES (19, 'Kepler-22b', 6000, 'Kepler Team', 'Light Blue', false, 7);
INSERT INTO public.planet VALUES (20, 'Proxima b', 4500, 'Anglada-Escudé', 'Grey', false, 7);
INSERT INTO public.planet VALUES (21, 'Gliese 581g', 5000, 'Vogt', 'Red-Orange', false, 8);
INSERT INTO public.planet VALUES (22, 'HD 209458 b', 5500, 'Charbonneau', 'Yellow', false, 8);
INSERT INTO public.planet VALUES (23, 'Trappist-1e', 5700, 'Gillon', 'Brown', false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1000, 'Hipparchus', 'White', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 1000, 'Hipparchus II', 'White', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8000, 'Ptolemy II', 'Red', 1);
INSERT INTO public.star VALUES (6, 'Rigel', 9000, 'Tycho Brahe II', 'Blue-White', 2);
INSERT INTO public.star VALUES (7, 'Vega', 4000, 'Herschel II', 'Blue', 3);
INSERT INTO public.star VALUES (8, 'Polaris', 7000, 'Messier II', 'Yellow-White', 4);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 39, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 23, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: galaxy galaxy_discoverer_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discoverer_key UNIQUE (discoverer);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_discoverer_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discoverer_key UNIQUE (discoverer);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other other_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_pkey PRIMARY KEY (other_id);


--
-- Name: other other_type_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_type_unique UNIQUE (type);


--
-- Name: planet planet_discoverer_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_discoverer_key UNIQUE (discoverer);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_discoverer_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discoverer_key UNIQUE (discoverer);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

