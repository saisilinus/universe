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

--
-- Name: star_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.star_type AS ENUM (
    'O',
    'B',
    'A',
    'F',
    'G',
    'K',
    'M'
);


ALTER TYPE public.star_type OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    star_id integer NOT NULL,
    description text,
    diameter_in_km numeric(4,1),
    name character varying(40) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_stars_in_billions integer,
    description text,
    distance_from_earth_in_light_years integer NOT NULL,
    bigger_than_milky_way boolean,
    is_elliptical boolean,
    age_in_billion_years numeric(3,1) NOT NULL
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
    name character varying(40) NOT NULL,
    mass_in_earth_moons numeric(3,1),
    planet_id integer NOT NULL,
    orbital_period integer NOT NULL,
    description text,
    has_atmosphere boolean,
    bigger_than_earth_moon boolean NOT NULL
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
    name character varying(40) NOT NULL,
    description text,
    age_in_billion_years numeric(2,1),
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    orbital_period_in_earth_days integer,
    bigger_than_earth boolean NOT NULL
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
    name character varying(40) NOT NULL,
    mass_in_solar_masses numeric(4,1) NOT NULL,
    number_of_planets integer NOT NULL,
    type character varying(10),
    galaxy_id integer NOT NULL,
    description text,
    visible_without_telescope boolean,
    bigger_than_sun boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, NULL, NULL, 'Megaclite');
INSERT INTO public.asteroid VALUES (2, 2, NULL, NULL, 'Thelxinoe');
INSERT INTO public.asteroid VALUES (3, 3, NULL, NULL, 'Thyone');
INSERT INTO public.asteroid VALUES (4, 4, NULL, NULL, 'Mneme');
INSERT INTO public.asteroid VALUES (5, 5, NULL, NULL, 'Chaldene');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, NULL, 0, false, true, 13.6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, NULL, 3, true, false, 10.1);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 1000, NULL, 21, true, false, 10.1);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40, NULL, 3, false, false, 10.5);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 100, NULL, 24, false, false, 10.5);
INSERT INTO public.galaxy VALUES (6, 'Blackeye', 100, NULL, 17, false, false, 13.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', NULL, 1, 27, NULL, NULL, false);
INSERT INTO public.moon VALUES (2, 'Europa', NULL, 2, 3, NULL, NULL, true);
INSERT INTO public.moon VALUES (3, 'Io', NULL, 3, 2, NULL, NULL, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 4, 35, NULL, NULL, false);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 5, 15, NULL, NULL, true);
INSERT INTO public.moon VALUES (6, 'Amalthea', NULL, 6, 2, NULL, NULL, false);
INSERT INTO public.moon VALUES (7, 'Kalichore', NULL, 7, 10, NULL, NULL, false);
INSERT INTO public.moon VALUES (8, 'Adrastea', NULL, 8, 1, NULL, NULL, true);
INSERT INTO public.moon VALUES (9, 'Cyllene', NULL, 9, 3, NULL, NULL, true);
INSERT INTO public.moon VALUES (10, 'Eirene', NULL, 10, 45, NULL, NULL, false);
INSERT INTO public.moon VALUES (11, 'Aitne', NULL, 11, 25, NULL, NULL, true);
INSERT INTO public.moon VALUES (12, 'Himalia', NULL, 12, 3, NULL, NULL, false);
INSERT INTO public.moon VALUES (13, 'Carme', NULL, 1, 7, NULL, NULL, true);
INSERT INTO public.moon VALUES (14, 'Euphorie', NULL, 3, 8, NULL, NULL, false);
INSERT INTO public.moon VALUES (15, 'Kalyke', NULL, 5, 3, NULL, NULL, true);
INSERT INTO public.moon VALUES (16, 'Elara', NULL, 7, 12, NULL, NULL, false);
INSERT INTO public.moon VALUES (17, 'Harpalyke', NULL, 9, 13, NULL, NULL, true);
INSERT INTO public.moon VALUES (18, 'Hermippe', NULL, 11, 23, NULL, NULL, false);
INSERT INTO public.moon VALUES (19, 'Thebe', NULL, 1, 7, NULL, NULL, false);
INSERT INTO public.moon VALUES (20, 'Sponde', NULL, 3, 8, NULL, NULL, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, NULL, true, 1, NULL, false);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, NULL, false, 2, NULL, false);
INSERT INTO public.planet VALUES (3, 'Mars', NULL, NULL, true, 3, NULL, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', NULL, NULL, false, 4, NULL, true);
INSERT INTO public.planet VALUES (5, 'Neptune', NULL, NULL, false, 5, NULL, false);
INSERT INTO public.planet VALUES (6, 'Venus', NULL, NULL, false, 6, NULL, false);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, NULL, true, 3, NULL, true);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, false, 4, NULL, false);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, false, 5, NULL, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', NULL, NULL, false, 6, NULL, true);
INSERT INTO public.planet VALUES (11, 'AEgir', NULL, NULL, true, 2, NULL, false);
INSERT INTO public.planet VALUES (12, 'Tahay', NULL, NULL, false, 3, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 8, NULL, 1, NULL, NULL, false);
INSERT INTO public.star VALUES (2, 'Sirius', 2.1, 0, NULL, 2, NULL, NULL, false);
INSERT INTO public.star VALUES (3, 'Vega', 2.1, 1, NULL, 3, NULL, NULL, true);
INSERT INTO public.star VALUES (4, 'Rigel', 21.0, 0, NULL, 4, NULL, NULL, true);
INSERT INTO public.star VALUES (5, 'Antares', 12.0, 5, NULL, 5, NULL, NULL, true);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 0.9, 15, NULL, 6, NULL, NULL, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

