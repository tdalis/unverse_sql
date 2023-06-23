--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: civilizationtype; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilizationtype (
    civilizationtype_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type integer,
    type_description text NOT NULL,
    planet_id integer
);


ALTER TABLE public.civilizationtype OWNER TO freecodecamp;

--
-- Name: civilizationtype_civilizationtype_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilizationtype_civilizationtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilizationtype_civilizationtype_id_seq OWNER TO freecodecamp;

--
-- Name: civilizationtype_civilizationtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilizationtype_civilizationtype_id_seq OWNED BY public.civilizationtype.civilizationtype_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_size_in_light_years integer,
    n_of_planets_in_billions integer,
    has_planets_with_life boolean,
    n_planets_with_life integer,
    n_of_stars_in_billions integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_km integer,
    distance_from_planet_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_km integer,
    n_of_species_in_millions integer,
    has_life boolean NOT NULL,
    has_intelligent_life boolean NOT NULL,
    n_of_moons integer,
    avg_age_of_intelligent_inhabitants numeric,
    main_spoken_languages text,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_in_km integer,
    n_of_planets integer,
    n_planets_with_life integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: civilizationtype civilizationtype_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilizationtype ALTER COLUMN civilizationtype_id SET DEFAULT nextval('public.civilizationtype_civilizationtype_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: civilizationtype; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilizationtype VALUES (1, 'Humans', 0, 'The type 0 civilization has not  managed to access all the energy available on its planet and store it for consumption', 1);
INSERT INTO public.civilizationtype VALUES (2, 'Nolenians', 2, 'The type 2 civilization can directly consume the energy of a star.', 7);
INSERT INTO public.civilizationtype VALUES (3, 'Alphabetians', 0, 'The type 0 civilization has not managed to access all the energy available on its planet and store it for consumption.', 9);
INSERT INTO public.civilizationtype VALUES (4, 'Esonians', 3, 'The type 3 civilization is able to capture all the energy emitted by its galaxy.', 11);
INSERT INTO public.civilizationtype VALUES (5, 'Menions', 0, 'The type 0 civilization has not managed to access all the energy available on its planet and store it for consumption.', 14);
INSERT INTO public.civilizationtype VALUES (6, 'Esoterians', 1, 'The type 1 civilization is able to access all the energy available on its planet and store it for consumption.', 16);
INSERT INTO public.civilizationtype VALUES (7, 'Tadamians', 1, 'The type 1 civilization is able to access all the energy available on its planet and store it for consumption.', 17);
INSERT INTO public.civilizationtype VALUES (8, 'Adronians', 2, 'The type 2 civilization can directly consume the energy of a star.', 18);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'IC 1101', 4000000, 500000, true, 5, 100000);
INSERT INTO public.galaxy VALUES (2, 'Hercules A', 1500000, 2500000, false, 0, 75000);
INSERT INTO public.galaxy VALUES (3, 'A2262-BGG', 1000000, 50000, true, 3, 10000);
INSERT INTO public.galaxy VALUES (4, 'ESO 306-17', 950000, 30000, true, 6, 80000);
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', 600000, 10000, false, 0, 5000);
INSERT INTO public.galaxy VALUES (6, 'Condor Galaxy', 522000, 8000, false, 0, 3700);
INSERT INTO public.galaxy VALUES (7, 'UGC 2885', 463000, 6800, true, 8, 3200);
INSERT INTO public.galaxy VALUES (8, 'ESO 444-46', 400000, 34500, true, 2, 2000);
INSERT INTO public.galaxy VALUES (9, 'Tadpole Galaxy', 280000, 5000, true, 2, 1980);
INSERT INTO public.galaxy VALUES (10, 'Andromeda Galaxy', 200000, 4750, true, 4, 1850);
INSERT INTO public.galaxy VALUES (11, 'Milky Way', 100000, 5000, true, 2, 3800);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1560, 629000000, 19);
INSERT INTO public.moon VALUES (2, 'Io', 1822, 628000000, 19);
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634, 628000000, 19);
INSERT INTO public.moon VALUES (4, 'Callisto', 2410, 628000000, 19);
INSERT INTO public.moon VALUES (5, 'Cyllene', 1, 15000000, 19);
INSERT INTO public.moon VALUES (6, 'Titan', 2575, 7590000, 20);
INSERT INTO public.moon VALUES (7, 'Enceladus', 252, 148000, 20);
INSERT INTO public.moon VALUES (8, 'Dione', 561, 377400, 20);
INSERT INTO public.moon VALUES (9, 'Tethys', 531, 295000, 20);
INSERT INTO public.moon VALUES (10, 'Nolon', 345, 301324, 7);
INSERT INTO public.moon VALUES (11, 'Luna', 1737, 384400, 1);
INSERT INTO public.moon VALUES (12, 'DemiMoon', 500, 458000, 8);
INSERT INTO public.moon VALUES (13, 'Small Alpha', 120, 234890, 9);
INSERT INTO public.moon VALUES (14, 'Gazelin', 432, 567839, 10);
INSERT INTO public.moon VALUES (15, 'Down Luna', 1123, 325605, 11);
INSERT INTO public.moon VALUES (16, 'Comet Square', 140, 140700, 12);
INSERT INTO public.moon VALUES (17, 'Loki', 412, 312879, 13);
INSERT INTO public.moon VALUES (18, 'Super', 1823, 540832, 15);
INSERT INTO public.moon VALUES (19, 'Warm', 978, 523495, 15);
INSERT INTO public.moon VALUES (20, 'Gyneka', 125, 250000, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371, 2, true, true, 1, 45, 'English, Spanish, Chinese, Hindi, French, Arabic', NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Nolan', 10000, 3, true, true, 2, 123, 'Nolanian, Markish, Tele, Greno', 12, 1);
INSERT INTO public.planet VALUES (8, 'DemiGod', 20000, 0, false, false, 4, 0, 'No people no language', 11, 2);
INSERT INTO public.planet VALUES (9, 'Big AlphaBeta', 12000, 1, true, true, 3, 67, 'Alpha N Omega, AtoZe, Zymbols, Heroglphs', 13, 3);
INSERT INTO public.planet VALUES (10, 'Petrolium 5', 8000, 4, true, false, 2, 0, 'No inteligent inhabitants no languages', 14, 4);
INSERT INTO public.planet VALUES (11, 'TopEso', 15000, 5, true, true, 5, 155, 'The One, Topeanian, Esonian, Petrolian, Uforian', 14, 4);
INSERT INTO public.planet VALUES (12, 'Planet Comet', 7000, 0, false, false, 7, 0, 'No life, only comets', 15, 5);
INSERT INTO public.planet VALUES (13, 'Condorium', 8500, 0, false, false, 3, 0, 'Only void in Condorium', 16, 6);
INSERT INTO public.planet VALUES (14, 'UnMe', 9800, 2, true, true, 4, 55, 'Barbarian, Sophoclian, Glasgordian, Elementorian', 17, 7);
INSERT INTO public.planet VALUES (15, 'SuperHot', 20000, 0, false, false, 12, 0, 'This planet is too hot to handle', 18, 7);
INSERT INTO public.planet VALUES (16, 'Esoteric', 6500, 1, true, true, 1, 102, 'Esotian, Flabodian, Stratopian', 19, 8);
INSERT INTO public.planet VALUES (17, 'Tadam', 9876, 3, true, true, 2, 78, 'Tudum, Talum, Taden, Tadim', 20, 9);
INSERT INTO public.planet VALUES (18, 'Adras', 1234, 7, true, true, 5, 123, 'Adrika, Ginekia, Pediarika, Gerika, Kleftika', 21, 10);
INSERT INTO public.planet VALUES (19, 'Jupyter', 139820, 0, false, false, 95, 0, 'Tears of Jupyter', 10, 11);
INSERT INTO public.planet VALUES (20, 'Saturn', 116460, 0, false, false, 146, 0, 'Too many moons for people to live here', 10, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 'Sun', 696340, 8, 1, 11);
INSERT INTO public.star VALUES (11, 'Zeus', 890000, 12, 0, 2);
INSERT INTO public.star VALUES (12, 'IC Star 23', 750000, 10, 1, 1);
INSERT INTO public.star VALUES (13, 'BGG Starlight', 720000, 7, 1, 3);
INSERT INTO public.star VALUES (14, 'Es Star', 783000, 9, 1, 4);
INSERT INTO public.star VALUES (15, 'Comet Star 02', 999090, 15, 0, 5);
INSERT INTO public.star VALUES (16, 'Condor Star 44', 979000, 14, 0, 6);
INSERT INTO public.star VALUES (17, 'Star Galactico', 867000, 10, 1, 7);
INSERT INTO public.star VALUES (18, 'Super Star', 987000, 12, 1, 7);
INSERT INTO public.star VALUES (19, 'The Star', 712000, 11, 1, 8);
INSERT INTO public.star VALUES (20, 'Tap That Star', 783409, 13, 1, 9);
INSERT INTO public.star VALUES (21, 'Andros Star', 876203, 9, 1, 10);


--
-- Name: civilizationtype_civilizationtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilizationtype_civilizationtype_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: civilizationtype civilizationtype_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilizationtype
    ADD CONSTRAINT civilizationtype_name_key UNIQUE (name);


--
-- Name: civilizationtype civilizationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilizationtype
    ADD CONSTRAINT civilizationtype_pkey PRIMARY KEY (civilizationtype_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: civilizationtype civilizationtype_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilizationtype
    ADD CONSTRAINT civilizationtype_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

