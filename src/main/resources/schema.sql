DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;
DROP TABLE IF EXISTS pizza CASCADE ;
DROP TABLE IF EXISTS price CASCADE;
DROP TABLE IF EXISTS pizzeria CASCADE;
DROP TABLE IF EXISTS format CASCADE;
DROP TABLE IF EXISTS booking CASCADE;
DROP TABLE IF EXISTS contact CASCADE;

DROP SEQUENCE IF EXISTS roles_id_seq ;
DROP SEQUENCE IF EXISTS users_id_seq ;
DROP SEQUENCE IF EXISTS pizza_id_seq ;
DROP SEQUENCE IF EXISTS price_id_seq ;
DROP SEQUENCE IF EXISTS pizzeria_id_seq ;
DROP SEQUENCE IF EXISTS format_id_seq ;
DROP SEQUENCE IF EXISTS booking_id_seq ;
DROP SEQUENCE IF EXISTS contact_id_seq ;

CREATE SEQUENCE roles_id_seq;
CREATE SEQUENCE users_id_seq;
CREATE SEQUENCE pizza_id_seq;
CREATE SEQUENCE price_id_seq;
CREATE SEQUENCE pizzeria_id_seq;
CREATE SEQUENCE format_id_seq;
CREATE SEQUENCE booking_id_seq;
CREATE SEQUENCE contact_id_seq;


CREATE TABLE public.users
(
    id bigint NOT NULL DEFAULT nextval('users_id_seq'),
    description character varying(255),
    email character varying(255) ,
    password character varying(255),
    username character varying(255),
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email),
    CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username)
);


CREATE TABLE public.roles
(
    id integer NOT NULL DEFAULT nextval('roles_id_seq'),
    name character varying(20),
    CONSTRAINT roles_pkey PRIMARY KEY (id)
);

CREATE TABLE public.user_roles
(
    user_id bigint NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id),
    CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id)
        REFERENCES public.roles (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE TABLE public.format
(
    id integer NOT NULL DEFAULT nextval('format_id_seq'),
    name character varying(255),
    CONSTRAINT format_pkey PRIMARY KEY (id)
);


CREATE TABLE public.pizza
(
    id integer NOT NULL DEFAULT nextval('pizza_id_seq'),
    name character varying(255),
    recipe character varying(255),
    image_name character varying(255),
    price character varying(255),
    CONSTRAINT pizza_pkey PRIMARY KEY (id)
);


CREATE TABLE public.price
(
    id integer NOT NULL DEFAULT nextval('price_id_seq'),
    pizza_id bigint,
    format_id bigint,
    price integer NOT NULL,
    CONSTRAINT participation_pkey PRIMARY KEY (pizza_id,format_id),
    CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (pizza_id)
        REFERENCES public.pizza (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkh8ciramu9cc9q3qcqiv4u8468 FOREIGN KEY (format_id)
        REFERENCES public.format (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE TABLE public.pizzeria
(
    id integer NOT NULL DEFAULT nextval('pizzeria_id_seq'),
    name character varying(255),
    city character varying(255),
    address character varying(255),
    CONSTRAINT pizzeria_pkey PRIMARY KEY (id)
);

CREATE TABLE public.booking
(
    id integer NOT NULL DEFAULT nextval('booking_id_seq'),
    fullname character varying(255),
    date date,
    hour integer,
    nb_people integer,
    email character varying(255)
);


CREATE TABLE public.contact
(
    id integer NOT NULL DEFAULT nextval('contact_id_seq'),
    fullname character varying(255),
    email character varying(255),
    message text,
    mobile character varying(255)
);
