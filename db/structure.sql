--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airlines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airlines (
    id integer NOT NULL,
    iata character varying,
    name character varying
);


--
-- Name: airlines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airlines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airlines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airlines_id_seq OWNED BY airlines.id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE airports (
    id integer NOT NULL,
    name character varying,
    city character varying,
    country character varying,
    iata character varying,
    icao character varying,
    latitude numeric(10,6),
    longitude numeric(10,6),
    altitude integer,
    timezone integer,
    dst character varying
);


--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE airports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE airports_id_seq OWNED BY airports.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying,
    city character varying,
    country character varying,
    iata character varying,
    icao character varying,
    latitude numeric(10,6),
    longitude numeric(10,6),
    altitude integer,
    timezone integer,
    dst character varying
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    h1 text,
    h2 text,
    h3 text,
    href text
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airlines ALTER COLUMN id SET DEFAULT nextval('airlines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY airports ALTER COLUMN id SET DEFAULT nextval('airports_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: airlines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airlines
    ADD CONSTRAINT airlines_pkey PRIMARY KEY (id);


--
-- Name: airports_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: airlines_iata; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airlines_iata ON airlines USING btree (iata);


--
-- Name: airlines_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airlines_name ON airlines USING btree (name);


--
-- Name: airports_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_city ON airports USING btree (city);


--
-- Name: airports_country; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_country ON airports USING btree (country);


--
-- Name: airports_iata; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_iata ON airports USING btree (iata);


--
-- Name: airports_lower_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_lower_city ON airports USING btree (lower((city)::text) varchar_pattern_ops);


--
-- Name: airports_lower_country; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_lower_country ON airports USING btree (lower((country)::text) varchar_pattern_ops);


--
-- Name: airports_lower_iata; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_lower_iata ON airports USING btree (lower((iata)::text));


--
-- Name: airports_lower_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_lower_name ON airports USING btree (lower((name)::text) varchar_pattern_ops);


--
-- Name: airports_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX airports_name ON airports USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20161102111548');

INSERT INTO schema_migrations (version) VALUES ('20170728054241');

INSERT INTO schema_migrations (version) VALUES ('20170806103239');

INSERT INTO schema_migrations (version) VALUES ('20170816160512');

INSERT INTO schema_migrations (version) VALUES ('20170817173526');

INSERT INTO schema_migrations (version) VALUES ('20170825183742');

INSERT INTO schema_migrations (version) VALUES ('20170825190630');

