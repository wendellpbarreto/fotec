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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO fotec_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO fotec_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO fotec_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO fotec_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO fotec_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO fotec_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO fotec_admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO fotec_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO fotec_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO fotec_admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO fotec_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO fotec_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: core_about; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_about (
    id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.core_about OWNER TO fotec_admin;

--
-- Name: core_about_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_about_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_about_id_seq OWNER TO fotec_admin;

--
-- Name: core_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_about_id_seq OWNED BY core_about.id;


--
-- Name: core_address; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_address (
    id integer NOT NULL,
    street character varying(32) NOT NULL,
    number character varying(8) NOT NULL,
    complement character varying(64) NOT NULL,
    district character varying(32) NOT NULL,
    zip_code integer NOT NULL,
    city character varying(32) NOT NULL,
    state character varying(2) NOT NULL
);


ALTER TABLE public.core_address OWNER TO fotec_admin;

--
-- Name: core_address_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_address_id_seq OWNER TO fotec_admin;

--
-- Name: core_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_address_id_seq OWNED BY core_address.id;


--
-- Name: core_contact; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_contact (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    value character varying(32) NOT NULL
);


ALTER TABLE public.core_contact OWNER TO fotec_admin;

--
-- Name: core_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_contact_id_seq OWNER TO fotec_admin;

--
-- Name: core_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_contact_id_seq OWNED BY core_contact.id;


--
-- Name: core_curricularpractice; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_curricularpractice (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE public.core_curricularpractice OWNER TO fotec_admin;

--
-- Name: core_curricularpractice_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_curricularpractice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_curricularpractice_id_seq OWNER TO fotec_admin;

--
-- Name: core_curricularpractice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_curricularpractice_id_seq OWNED BY core_curricularpractice.id;


--
-- Name: core_discipline; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_discipline (
    id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.core_discipline OWNER TO fotec_admin;

--
-- Name: core_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_discipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_discipline_id_seq OWNER TO fotec_admin;

--
-- Name: core_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_discipline_id_seq OWNED BY core_discipline.id;


--
-- Name: core_editorial; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_editorial (
    id integer NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE public.core_editorial OWNER TO fotec_admin;

--
-- Name: core_editorial_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_editorial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_editorial_id_seq OWNER TO fotec_admin;

--
-- Name: core_editorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_editorial_id_seq OWNED BY core_editorial.id;


--
-- Name: core_event; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_event (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    views integer NOT NULL,
    comments integer NOT NULL,
    likes integer NOT NULL,
    active boolean NOT NULL,
    featured boolean NOT NULL,
    date date NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    subtitle character varying(128) NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.core_event OWNER TO fotec_admin;

--
-- Name: core_event_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_id_seq OWNER TO fotec_admin;

--
-- Name: core_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_event_id_seq OWNED BY core_event.id;


--
-- Name: core_event_notices; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_event_notices (
    id integer NOT NULL,
    event_id integer NOT NULL,
    notice_id integer NOT NULL
);


ALTER TABLE public.core_event_notices OWNER TO fotec_admin;

--
-- Name: core_event_notices_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_event_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_notices_id_seq OWNER TO fotec_admin;

--
-- Name: core_event_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_event_notices_id_seq OWNED BY core_event_notices.id;


--
-- Name: core_event_photogalleries; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_event_photogalleries (
    id integer NOT NULL,
    event_id integer NOT NULL,
    photogallery_id integer NOT NULL
);


ALTER TABLE public.core_event_photogalleries OWNER TO fotec_admin;

--
-- Name: core_event_photogalleries_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_event_photogalleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_photogalleries_id_seq OWNER TO fotec_admin;

--
-- Name: core_event_photogalleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_event_photogalleries_id_seq OWNED BY core_event_photogalleries.id;


--
-- Name: core_event_podcasts; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_event_podcasts (
    id integer NOT NULL,
    event_id integer NOT NULL,
    podcast_id integer NOT NULL
);


ALTER TABLE public.core_event_podcasts OWNER TO fotec_admin;

--
-- Name: core_event_podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_event_podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_podcasts_id_seq OWNER TO fotec_admin;

--
-- Name: core_event_podcasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_event_podcasts_id_seq OWNED BY core_event_podcasts.id;


--
-- Name: core_event_video_libraries; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_event_video_libraries (
    id integer NOT NULL,
    event_id integer NOT NULL,
    videolibrary_id integer NOT NULL
);


ALTER TABLE public.core_event_video_libraries OWNER TO fotec_admin;

--
-- Name: core_event_video_libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_event_video_libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_event_video_libraries_id_seq OWNER TO fotec_admin;

--
-- Name: core_event_video_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_event_video_libraries_id_seq OWNED BY core_event_video_libraries.id;


--
-- Name: core_member; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_member (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    about text NOT NULL,
    email character varying(32) NOT NULL,
    phone character varying(32) NOT NULL,
    role_id integer NOT NULL,
    photo character varying(256) NOT NULL
);


ALTER TABLE public.core_member OWNER TO fotec_admin;

--
-- Name: core_member_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_member_id_seq OWNER TO fotec_admin;

--
-- Name: core_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_member_id_seq OWNED BY core_member.id;


--
-- Name: core_notice; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_notice (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    views integer NOT NULL,
    comments integer NOT NULL,
    likes integer NOT NULL,
    active boolean NOT NULL,
    featured boolean NOT NULL,
    date date NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    subtitle character varying(128) NOT NULL,
    body text NOT NULL,
    editorial_id integer NOT NULL,
    discipline_id integer,
    curricular_practice_id integer,
    photo character varying(256) NOT NULL
);


ALTER TABLE public.core_notice OWNER TO fotec_admin;

--
-- Name: core_notice_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_notice_id_seq OWNER TO fotec_admin;

--
-- Name: core_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_notice_id_seq OWNED BY core_notice.id;


--
-- Name: core_photo; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_photo (
    id integer NOT NULL,
    photogallery_id integer NOT NULL,
    title character varying(128) NOT NULL,
    credits character varying(64) NOT NULL,
    photo character varying(256) NOT NULL
);


ALTER TABLE public.core_photo OWNER TO fotec_admin;

--
-- Name: core_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_photo_id_seq OWNER TO fotec_admin;

--
-- Name: core_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_photo_id_seq OWNED BY core_photo.id;


--
-- Name: core_photogallery; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_photogallery (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    views integer NOT NULL,
    comments integer NOT NULL,
    likes integer NOT NULL,
    active boolean NOT NULL,
    featured boolean NOT NULL,
    date date NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    subtitle character varying(128) NOT NULL,
    body text NOT NULL,
    editorial_id integer NOT NULL,
    discipline_id integer,
    curricular_practice_id integer
);


ALTER TABLE public.core_photogallery OWNER TO fotec_admin;

--
-- Name: core_photogallery_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_photogallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_photogallery_id_seq OWNER TO fotec_admin;

--
-- Name: core_photogallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_photogallery_id_seq OWNED BY core_photogallery.id;


--
-- Name: core_podcast; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_podcast (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    views integer NOT NULL,
    comments integer NOT NULL,
    likes integer NOT NULL,
    active boolean NOT NULL,
    featured boolean NOT NULL,
    date date NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    subtitle character varying(128) NOT NULL,
    body text NOT NULL,
    download_url character varying(128) NOT NULL
);


ALTER TABLE public.core_podcast OWNER TO fotec_admin;

--
-- Name: core_podcast_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_podcast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_podcast_id_seq OWNER TO fotec_admin;

--
-- Name: core_podcast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_podcast_id_seq OWNED BY core_podcast.id;


--
-- Name: core_role; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.core_role OWNER TO fotec_admin;

--
-- Name: core_role_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_role_id_seq OWNER TO fotec_admin;

--
-- Name: core_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_role_id_seq OWNED BY core_role.id;


--
-- Name: core_socialnetwork; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_socialnetwork (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    url character varying(32) NOT NULL
);


ALTER TABLE public.core_socialnetwork OWNER TO fotec_admin;

--
-- Name: core_socialnetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_socialnetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_socialnetwork_id_seq OWNER TO fotec_admin;

--
-- Name: core_socialnetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_socialnetwork_id_seq OWNED BY core_socialnetwork.id;


--
-- Name: core_video; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_video (
    id integer NOT NULL,
    video_library_id integer NOT NULL,
    file character varying(256) NOT NULL,
    youtube character varying(32) NOT NULL,
    vimeo character varying(32) NOT NULL
);


ALTER TABLE public.core_video OWNER TO fotec_admin;

--
-- Name: core_video_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_video_id_seq OWNER TO fotec_admin;

--
-- Name: core_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_video_id_seq OWNED BY core_video.id;


--
-- Name: core_videolibrary; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE core_videolibrary (
    id integer NOT NULL,
    type character varying(16) NOT NULL,
    views integer NOT NULL,
    comments integer NOT NULL,
    likes integer NOT NULL,
    active boolean NOT NULL,
    featured boolean NOT NULL,
    date date NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    title character varying(64) NOT NULL,
    subtitle character varying(128) NOT NULL,
    body text NOT NULL,
    editorial_id integer NOT NULL,
    discipline_id integer,
    curricular_practice_id integer
);


ALTER TABLE public.core_videolibrary OWNER TO fotec_admin;

--
-- Name: core_videolibrary_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE core_videolibrary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_videolibrary_id_seq OWNER TO fotec_admin;

--
-- Name: core_videolibrary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE core_videolibrary_id_seq OWNED BY core_videolibrary.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO fotec_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO fotec_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO fotec_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fotec_admin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO fotec_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fotec_admin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO fotec_admin;

--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO fotec_admin;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_about ALTER COLUMN id SET DEFAULT nextval('core_about_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_address ALTER COLUMN id SET DEFAULT nextval('core_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_contact ALTER COLUMN id SET DEFAULT nextval('core_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_curricularpractice ALTER COLUMN id SET DEFAULT nextval('core_curricularpractice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_discipline ALTER COLUMN id SET DEFAULT nextval('core_discipline_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_editorial ALTER COLUMN id SET DEFAULT nextval('core_editorial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event ALTER COLUMN id SET DEFAULT nextval('core_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_notices ALTER COLUMN id SET DEFAULT nextval('core_event_notices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_photogalleries ALTER COLUMN id SET DEFAULT nextval('core_event_photogalleries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_podcasts ALTER COLUMN id SET DEFAULT nextval('core_event_podcasts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_video_libraries ALTER COLUMN id SET DEFAULT nextval('core_event_video_libraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_member ALTER COLUMN id SET DEFAULT nextval('core_member_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_notice ALTER COLUMN id SET DEFAULT nextval('core_notice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photo ALTER COLUMN id SET DEFAULT nextval('core_photo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photogallery ALTER COLUMN id SET DEFAULT nextval('core_photogallery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_podcast ALTER COLUMN id SET DEFAULT nextval('core_podcast_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_role ALTER COLUMN id SET DEFAULT nextval('core_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_socialnetwork ALTER COLUMN id SET DEFAULT nextval('core_socialnetwork_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_video ALTER COLUMN id SET DEFAULT nextval('core_video_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_videolibrary ALTER COLUMN id SET DEFAULT nextval('core_videolibrary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add kv store	1	add_kvstore
2	Can change kv store	1	change_kvstore
3	Can delete kv store	1	delete_kvstore
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add Social network	8	add_socialnetwork
23	Can change Social network	8	change_socialnetwork
24	Can delete Social network	8	delete_socialnetwork
25	Can add Contact	9	add_contact
26	Can change Contact	9	change_contact
27	Can delete Contact	9	delete_contact
28	Can add Address	10	add_address
29	Can change Address	10	change_address
30	Can delete Address	10	delete_address
31	Can add About	11	add_about
32	Can change About	11	change_about
33	Can delete About	11	delete_about
34	Can add Role	12	add_role
35	Can change Role	12	change_role
36	Can delete Role	12	delete_role
37	Can add Member	13	add_member
38	Can change Member	13	change_member
39	Can delete Member	13	delete_member
40	Can add Discipline	14	add_discipline
41	Can change Discipline	14	change_discipline
42	Can delete Discipline	14	delete_discipline
43	Can add Curricular practice	15	add_curricularpractice
44	Can change Curricular practice	15	change_curricularpractice
45	Can delete Curricular practice	15	delete_curricularpractice
46	Can add Editorial	16	add_editorial
47	Can change Editorial	16	change_editorial
48	Can delete Editorial	16	delete_editorial
49	Can add Notice	17	add_notice
50	Can change Notice	17	change_notice
51	Can delete Notice	17	delete_notice
52	Can add Photogallery	18	add_photogallery
53	Can change Photogallery	18	change_photogallery
54	Can delete Photogallery	18	delete_photogallery
55	Can add Photo	19	add_photo
56	Can change Photo	19	change_photo
57	Can delete Photo	19	delete_photo
58	Can add Video library	20	add_videolibrary
59	Can change Video library	20	change_videolibrary
60	Can delete Video library	20	delete_videolibrary
61	Can add Video	21	add_video
62	Can change Video	21	change_video
63	Can delete Video	21	delete_video
64	Can add Podcast	22	add_podcast
65	Can change Podcast	22	change_podcast
66	Can delete Podcast	22	delete_podcast
67	Can add Event	23	add_event
68	Can change Event	23	change_event
69	Can delete Event	23	delete_event
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 69, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$12000$Is7udfLnZ5NC$kUPTHJtaYkfOXjCFs0NXG5BDtk7AMgRCgRX++pxQaOU=	2014-07-30 21:39:02-04	f	teste01	teste	da silva	teste@teste.com.br	t	f	2014-07-28 21:39:02-04
3	pbkdf2_sha256$12000$okhcdG9xSHZp$Ht6ulmqJnUqOMIp99oRT7MqvNiyBlVNA6DK4pAFeTbM=	2014-09-10 21:53:27.926815-04	f	comum	João	Pereira	pereira@gmail.com	t	t	2014-09-10 21:29:42-04
1	pbkdf2_sha256$12000$vxY7XIhar4Da$mz88KiJrgrSLHaAR2HiJvaf952BoE/IUktOns3S9pcU=	2014-09-10 21:59:03.774802-04	t	admin			admin@admin.com	t	t	2014-07-27 21:28:20.480043-04
4	pbkdf2_sha256$12000$vPTUlJQbJqyK$xWVHfdx1LQKqlLgQnKrHwMmbluBh5nuF88FcjtvPtlk=	2014-09-10 21:59:50-04	f	joao				f	t	2014-09-10 21:59:50-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: core_about; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_about (id, body) FROM stdin;
1	<p style="margin-top: 15px; margin-right: 15px; margin-left: 22px; color: rgb(20, 24, 35); background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"></p>\r\n\r\n<p style="zoom: 1;"></p>\r\n\r\n<p style="text-align: justify;">O Projeto Agência Fotec de Comunicação Experimental Multimídia propõe uma inovação na Comunicação Social da UFRN ao articular o ensino, a pesquisa e a extensão. Nossas coberturas e informações podem ser acessadas através do:&nbsp;<a href="http://www.fotec.ufrn.br/" target="_blank" style=" color: rgb(59, 89, 152); cursor: pointer; text-decoration: none;">http://www.fotec.ufrn.br/</a></p>\r\n\r\n<p style="text-align: justify;">Nossa missão é propiciar aos alunos do curso de Comunicação Social a experimentação da produção jornalística e da fotografia de imprensa em uma mesma pauta; estimular a formação de um profissional habilitado para assumir múltiplas funções; estimular o trabalho em equipe; desenvolver nos participantes a responsabilidade produtiva; estimular, nos monitores, a capacidade de liderança e de gestão de grupos em formação profissional.\r\n</p>\r\n\r\n<p style="text-align: justify;">\r\n</p>\r\n\r\n<p><span style="color: rgb(20, 24, 35);">Agência de Comunicação Experimental Multimídia também está nas redes sociais!</span><br>\r\n\r\n<span style=" color: rgb(20, 24, 35);">Facebook:&nbsp;</span><span style="color: #141823;">https://www.facebook.com/AgenciaFotec</span><br>\r\n\r\n<span style="color: rgb(20, 24, 35); line-height: 1.5em;">Instagram: @fotec&nbsp;</span><br>\r\n\r\n<span style="color: rgb(20, 24, 35); line-height: 1.5em;">Twitter: @fotec</span><br>\r\n\r\n<span style="line-height: 1.5em; color: rgb(20, 24, 35);">YouTube:&nbsp;</span><span style="line-height: 1.5em; color: rgb(20, 24, 35);">https://www.youtube.com/user/AgenciaFotec</span><br>\r\n\r\n</p>\r\n\r\n<p style="margin-left: 20px; margin-right: 20px;"></p>
\.


--
-- Name: core_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_about_id_seq', 1, true);


--
-- Data for Name: core_address; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_address (id, street, number, complement, district, zip_code, city, state) FROM stdin;
\.


--
-- Name: core_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_address_id_seq', 2, true);


--
-- Data for Name: core_contact; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_contact (id, type, value) FROM stdin;
\.


--
-- Name: core_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_contact_id_seq', 1, false);


--
-- Data for Name: core_curricularpractice; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_curricularpractice (id, name, discipline_id) FROM stdin;
\.


--
-- Name: core_curricularpractice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_curricularpractice_id_seq', 1, false);


--
-- Data for Name: core_discipline; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_discipline (id, name) FROM stdin;
\.


--
-- Name: core_discipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_discipline_id_seq', 1, false);


--
-- Data for Name: core_editorial; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_editorial (id, name) FROM stdin;
3	Educação
\.


--
-- Name: core_editorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_editorial_id_seq', 3, true);


--
-- Data for Name: core_event; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_event (id, type, views, comments, likes, active, featured, date, date_modified, title, subtitle, body) FROM stdin;
\.


--
-- Name: core_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_event_id_seq', 1, false);


--
-- Data for Name: core_event_notices; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_event_notices (id, event_id, notice_id) FROM stdin;
\.


--
-- Name: core_event_notices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_event_notices_id_seq', 1, false);


--
-- Data for Name: core_event_photogalleries; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_event_photogalleries (id, event_id, photogallery_id) FROM stdin;
\.


--
-- Name: core_event_photogalleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_event_photogalleries_id_seq', 1, false);


--
-- Data for Name: core_event_podcasts; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_event_podcasts (id, event_id, podcast_id) FROM stdin;
\.


--
-- Name: core_event_podcasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_event_podcasts_id_seq', 1, false);


--
-- Data for Name: core_event_video_libraries; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_event_video_libraries (id, event_id, videolibrary_id) FROM stdin;
\.


--
-- Name: core_event_video_libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_event_video_libraries_id_seq', 1, false);


--
-- Data for Name: core_member; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_member (id, name, about, email, phone, role_id, photo) FROM stdin;
6	Itamar Nobre	<p>Professor Dr. do Departamento de Comunicação Social e idealizador do projeto Agência Fotec</p>\r\n	itanobre@gmail.com		1	/var/www/fotec/media/members/10338772_847272078619584_1592047641724079544_n_1.jpg
\.


--
-- Name: core_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_member_id_seq', 6, true);


--
-- Data for Name: core_notice; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_notice (id, type, views, comments, likes, active, featured, date, date_modified, title, subtitle, body, editorial_id, discipline_id, curricular_practice_id, photo) FROM stdin;
13	notice	3	0	0	t	t	2014-05-19	2014-09-11 17:30:33.43453-04	Comércio informal no setor 2 sustenta famílias de ambulantes	Ambulantes são protegidos por alunos enquanto universidade os persegue	<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;"><strong style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; float: none; background: none;">Por Jackson Dantas</strong>&nbsp;</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Alguns meses após o fechamento da cantina do setor de aulas teóricas do Centro de Ciências Humanas, Letras e Artes (CCHLA) da Universidade Federal do Rio Grande do Norte (UFRN), vários ambulantes - divididos nos turnos matutino, vespertino e noturno - dominam informalmente o comércio local com a venda de açaís, cafezinhos, refrigerantes, sucos, águas e salgadinhos.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Mesmo cientes da irregularidade cometida, principalmente, as vigentes no artigo segundo da lei 8.666/93 - que fere os princípios constitucionais da impessoalidade, moralidade, eficiência e da economicidade - os comerciantes se veem obrigados a continuarem na clandestinidade, pois, sustentam suas famílias com a venda dos produtos.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Além de sofrerem com a falta de condições estruturais e sanitárias, alguns ambulantes comentam que são constantemente perseguidos pela universidade e creditam aos alunos, a oportunidade de ainda estarem nas dependências, conquistando com honestidade, o pão de cada dia. Para o vendedor de açaí, Cleilton Evangelista, 26, que está a dois anos vendendo no local, “a oportunidade surgiu após o fechamento da lanchonete do setor 2 que se deu, segundo os estudantes, devido aos altos preços cobrados e a má qualidade dos produtos e serviços oferecidos”, disse.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Para a vendedora de salgadinhos, Camila Nascimento, 21, o que falta na administração da universidade é humanidade. Há nove meses vendendo no local, a ambulante diz que já conquistou a simpatia e uma boa freguesia entre os alunos. “Sou casada, mãe de um filho e minha renda mensal é de aproximadamente R$ 800,00 mensais que conquisto vendendo sucos, cafés e salgadinhos diariamente”, enfatizou.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Ainda segundo Nascimento, os alunos tem preferência pelos ambulantes não só pelos baixos preços, mas, pela qualidade no atendimento, ponto em que todos os concessionários anteriores das cantinas deixaram a desejar. A jovem Camila também revelou que os universitários orientaram os vendedores para que eles mantivessem um diálogo com a universidade com o intuito de encontrar uma solução confortável a todos. “Muitos alunos dizem que nós éramos para tomar conta da cantina através de uma cooperativa, porém, enquanto nada é feito, somos obrigados a esperar pela universidade”, concluiu.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A administração do CCHLA e da Pré-reitoria de Administração da UFRN foram procuradas para comentarem sobre a problemática, porém, não foi possível fazer o contato com os responsáveis devido agenda administrativa.</span></p>\r\n	3	\N	\N	/var/www/fotec/media/news/471bcecc748f4cd9adb23f986164718a.png
12	notice	9	0	0	t	t	2014-05-19	2014-09-28 09:39:09.409278-04	O abandono da terceira idade	Com o número de idosos crescendo, a busca por casas de repouso vem aumentando	<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;"><strong style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; float: none; background: none;">Por Ananda Braga&nbsp;</strong></span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">No Brasil o número de idosos vem crescendo de forma considerável. Pesquisas do Instituto Brasileiro de Geografia e Estatística (IBGE) apontam que nas próximas décadas a quantidade de pessoas acima dos 60 anos será maior que a de crianças, dado inédito para um país periférico como o nosso. Os números são positivos, mas a forma como o brasileiro trata seus idosos ainda é preocupante, pois muitos são abandonados por seus familiares na fase inicial de possíveis doenças.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">No Rio Grande do Norte os dados não são diferentes, muitos idosos são deixados em casas de repouso, populares asilos, quando passam a “incomodar” seus familiares. No nosso Estado um dos abrigos mais conhecidos é o Lar da Vovózinha, casa espírita fundada em 1952, a casa só abriga mulheres e atualmente conta com 40 vovós.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A assistente Social do lar, Daniele Rodrigues, explica que a grande maioria das senhoras chegam a casa após sofrerem algum tipo de violência, seja física, verbal ou financeira, “Infelizmente os casos de violência financeira ainda são muitos, os filhos ficam com o idoso apenas para receber sua pensão ou aposentadoria, esquecem que é dever da família cuidar de seu idoso”, declara Daniele.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Apesar desta violência acontecer de forma mais frequente os casos de agressão verbal e física também são comuns, “Acredito que o brasileiro possui uma cultura grosseira, por isso muitas vezes os familiares tratam mal seus idosos sem perceberem que o estão fazendo”, afirma a assistente.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">De forma voluntária, ou não, o fato é que após o idoso ser deixado no lar a grande maioria das famílias o esquece. Dona Maria de Lurdes, moradora do lar, afirma que a casa é boa, mas a solidão sempre lhe acompanha “Aqui é bom, mas a gente se sente muito sozinha. Minha maior vontade é voltar para casa”, declara à aposentada. Daniele afirma que em alguns casos as famílias até prometem levá-las de volta, mas isso nunca acontece e as moradoras aceleram o processo de depressão “Quando esse tipo de coisa acontece, elas envelhecem em 6 meses o que deviam envelhecer em 5 anos”, afirma.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">No lar ainda encontramos idosas que já chegaram até lá sem filhos ou parentes próximos. São mulheres que passaram a maior parte de suas vidas trabalhando em casas de família, e quando chegam à terceira idade não possuem alguém que possa cuidar delas.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A dependência que sentem dos filhos e netos transmitem para os brinquedos. As paredes de seus quartos são repletas de bonecas, as quais beijam, trocam as roupas e cuidam como filhas. A auxiliar administrativa da casa, Marineide Borges, afirma que nessa fase elas voltam à infância “Elas adoram bonecas e quebra-cabeças”.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A fila de espera do Lar da Vovózinha não para de crescer. Atualmente dezenas de senhoras aguardam, em uma lista de espera, a visita dos auxiliares do S.O.S idoso, estes irão constatar a necessidade da mudança para um lar. A realidade é triste, pois na maioria dos casos encontramos pessoas que dedicaram toda sua vida a outras, e na fase final de sua história se encontram sozinhas.</span></p>\r\n	3	\N	\N	/var/www/fotec/media/news/0f2cc337bed44c089df0a0b6f2eb4db5.png
10	notice	9	0	0	t	t	2014-08-06	2014-09-30 17:23:36.936211-04	Consegui viver diversidade dentro da universidade		<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;"><strong style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; float: none; background: none;">Por João Victor Leal</strong></span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Em um país de grave crise de evasão escolar, chegar à universidade torna-se hoje a glória de muitas famílias, principalmente daquelas onde os patriarcas mal conseguiram concluir o ensino médio.&nbsp; Foi assim na minha casa, deve ser assim na casa de muitos. A universidade é pintada para nos como um lugar de ampla diversidade e liberdade, passados quatro anos aqui dentro é necessário dizer que isso existe sim aqui, mas é bem menos intenso do que achava que seria. Há ainda, na universidade, uma completa desconexão com um mundo que tratamos exterior, parece que somos abduzidos por um mundo paralelo ao cruzar o portão de entrada ou ao passar pela reitoria. Assim, é comum perceber que a diversidade construída na universidade só consegue se alimentar dentro de seus muros. Ainda há muito medo dos rugidos e do confronto de idéias com aqueles que ainda não tiveram a oportunidade de vivenciar tal liberdade.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Falo tanto em diversidade aqui, pois para mim um momento chave para quebrar essa barreira quase de ficção cientifica entre a universidade e o mundo “externo” aconteceu recentemente, com a Teia Nacional da Diversidade. Evento que reuniu pontos de cultura de todo o país e teve a UFRN como sede. A Teia trouxe para a universidade representantes das mais diversas cores, credos e etnias. Era quase uma trégua entre os dois lados do muro. Mais que uma trégua, era finalmente aquilo que tanto se espera que a universidade faça: a junção do saber da&nbsp; academia com o calor humano daqueles que adoramos analisar, estudar, sentir.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Era algo tocante escutar a&nbsp; manifestação dos povos indígenas presentes e se questionar porque não há remanescentes da população indígena potiguar estudando ao meu lado. Qual o número de representantes de comunidades quilombolas dentro da universidade? Me questionava. Acho que tinha medo de saber a resposta e ela ser algo perto de nada. A conexão obtida naquela semana marca o quanto a universidade precisa dessa troca de conhecimento e o quanto isso não pode estar limitado há apenas uma semana. Dentro de um evento especial. Índios, negros,&nbsp; realizadores da cultura popular não podem ser convidados em um lugar que a eles pertence.&nbsp;</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Tenho certo receio, dada a conjuntura mercantilista da educação, que a universidade pública brasileira vire um lugar “asséptico”, não apenas no sentido de limpeza, mas no sentido de vida mesmo.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Um pensamento conservador das relações humanas, tenta, assim como um câncer, que em estágios iniciais não damos atenção, se apropriar de espaços antes naturalmente sintonizados com ambições e desejos populares. Olha quanta vida pulsa em cada grafite, em cada manifestação artística,transgressoramente, colocada em cada parede do Setor 2 , por exemplo.&nbsp; Alguns torcem o nariz. Que torçam. Mas ali a arte está em casa,&nbsp; e deveria ser assim por toda a universidade. Deixar talhado em seu cimento que a diversidade que ela tanto estuda, tem a necessidade de ficar marcada em suas paredes.&nbsp;</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Espero que a universidade continue a se pintar de povo, e continue a ser ocupada por povo. Que ela consiga se resumir a uma grande ciranda, onde as mais diferentes pessoas dão as mãos e vivem o natural dos movimentos humanos o de girar em torno da celebração da diversidade.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Grupo de afoxé se apresenta durante a Teia Nacional da Diversidade. Que esses grupos convivam com a universidade, não sejam apenas convidados na casa que são donos.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></p>\r\n	3	\N	\N	/var/www/fotec/media/news/cc7e86a23d59424bbbf0aaa496be9645.png
11	notice	4	0	0	t	t	2014-05-21	2014-10-03 03:03:42.442197-04	UFRN recebe encontro sobre acessibilidade cultural	A abertura contou com apresentações culturais	<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;"><strong style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; float: none; background: none;">Por Caio Rodrigues</strong></span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A UFRN recebe de hoje até sábado o 2° ENAC (encontro nacional de acessibilidade cultural), e o 4° SENAAC (seminário nacional de acessibilidade em ambientes culturais). Esses eventos fazem parte da programação da Teia Nacional da Diversidade, que está acontecendo em alguns pontos da universidade e também no IFRN da Cidade Alta. O encontro de acessibilidade irá abordar em suas discussões questões como “audiovisual e acessibilidade”, “cultura acessível sob a ótica de artistas e produtores culturais com deficiência”, entre outros e vão acontecer algumas oficinas na sexta e no sábado.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">Na abertura houve uma apresentação cultural feita pela dupla de palhaças Las Muchachas, que apresentaram o espetáculo “Circo das Muchachas”, fazendo alguns números de malabarismo com bolas e girando pratos, também números de acrobacia, além de convidar um deficiente visual que estava na plateia, para fazer uma brincadeira no palco.</span></p>\r\n\r\n<p style="margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); float: none; overflow-x: hidden; text-align: justify; background-image: none; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;"><span style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: none;">A programação de hoje conta ainda com duas mesas, a primeira será sobre “Políticas Públicas Culturais Inclusivas e Acessíveis: Diretrizes e Cenários”, com a participação do Secretário de políticas culturais do Ministério da Cultura, Américo Córdula, e Antônio José Ferreira- Secretário nacional de promoção dos direitos da pessoa com deficiência. A partir das 14h acontece outra mesa com o tema “Políticas públicas culturais inclusivas e acessíveis: um panorama das ações e programas”, com a presença da Secretária da cidadania e diversidade cultural, Márcia Rollemberg, e Elisa Machado- Coordenadora do sistema nacional de bibliotecas públicas do Ministério da Cultura. Os debates estão ocorrendo no Auditório da Reitoria, e conta com recursos de acessibilidade: Estenotipia, Audiodescrição, LIBRAS.</span></p>\r\n	3	\N	\N	/var/www/fotec/media/news/ce1f92dfde2248bdbc512219cb80b1e0.png
\.


--
-- Name: core_notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_notice_id_seq', 13, true);


--
-- Data for Name: core_photo; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_photo (id, photogallery_id, title, credits, photo) FROM stdin;
\.


--
-- Name: core_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_photo_id_seq', 1, true);


--
-- Data for Name: core_photogallery; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_photogallery (id, type, views, comments, likes, active, featured, date, date_modified, title, subtitle, body, editorial_id, discipline_id, curricular_practice_id) FROM stdin;
\.


--
-- Name: core_photogallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_photogallery_id_seq', 1, true);


--
-- Data for Name: core_podcast; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_podcast (id, type, views, comments, likes, active, featured, date, date_modified, title, subtitle, body, download_url) FROM stdin;
\.


--
-- Name: core_podcast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_podcast_id_seq', 1, false);


--
-- Data for Name: core_role; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_role (id, name) FROM stdin;
1	Coordenador Geral
\.


--
-- Name: core_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_role_id_seq', 3, true);


--
-- Data for Name: core_socialnetwork; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_socialnetwork (id, type, url) FROM stdin;
1	facebook	http://migre.me/lfuOD
2	twitter	https://twitter.com/Fotec
3	instagram	http://instagram.com/fotec
\.


--
-- Name: core_socialnetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_socialnetwork_id_seq', 3, true);


--
-- Data for Name: core_video; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_video (id, video_library_id, file, youtube, vimeo) FROM stdin;
\.


--
-- Name: core_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_video_id_seq', 1, true);


--
-- Data for Name: core_videolibrary; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY core_videolibrary (id, type, views, comments, likes, active, featured, date, date_modified, title, subtitle, body, editorial_id, discipline_id, curricular_practice_id) FROM stdin;
\.


--
-- Name: core_videolibrary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('core_videolibrary_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-07-28 08:50:35.955338-04	1	16	1	Rn	1	
2	2014-07-28 08:53:07.838236-04	1	17	1	Transporte escolar: 97% dos veículos estão em situação irregular	1	
3	2014-07-28 08:56:01.641653-04	1	17	1	Transporte escolar: 97% dos veículos estão em situação irregular	2	Modificado subtitle.
4	2014-07-28 08:56:40.339901-04	1	17	1	Transporte escolar: 97% dos veículos estão em situação irregular	2	Nenhum campo modificado.
5	2014-07-28 21:03:22.374238-04	1	16	2	Br	1	
6	2014-07-28 21:25:57.502596-04	1	17	2	Titulo	1	
7	2014-07-28 21:27:45.979387-04	1	17	4	Brasil	1	
8	2014-07-28 21:29:26.508073-04	1	17	6	Oi	1	
9	2014-07-28 21:30:08.662364-04	1	17	7	Titulo 0001	1	
10	2014-07-28 21:30:53.329497-04	1	17	2	Titulo	2	Modificado active.
11	2014-07-28 21:37:20.639965-04	1	17	7	Titulo 0001	2	Nenhum campo modificado.
12	2014-07-28 21:39:02.256145-04	1	5	2	teste01	1	
13	2014-07-28 21:41:06.242757-04	1	5	2	teste01	2	Modificado first_name, last_name e email.
14	2014-07-28 21:42:19.91536-04	1	5	2	teste01	2	Modificado last_login.
15	2014-07-28 21:42:29.63562-04	1	5	2	teste01	2	Modificado is_staff.
16	2014-07-28 21:43:58.183216-04	1	5	2	teste01	2	Modificado is_active.
17	2014-07-28 22:18:52.612458-04	1	17	2	Titulo	2	Modificado active.
18	2014-08-26 16:58:10.154395-04	1	16	3	Educação	1	
19	2014-08-26 16:58:35.439562-04	1	17	8	Editais debulha (teste)	1	
20	2014-08-26 17:00:31.291521-04	1	17	2	Titulo	3	
21	2014-08-26 17:00:31.30116-04	1	17	6	Oi	3	
22	2014-08-26 17:00:31.305267-04	1	17	1	Transporte escolar: 97% dos veículos estão em situação irregular	3	
23	2014-08-26 17:00:31.308647-04	1	17	4	Brasil	3	
24	2014-08-26 17:00:31.31215-04	1	17	8	Editais debulha (teste)	3	
25	2014-08-26 17:04:37.393309-04	1	17	7	Titulo 0001	3	
26	2014-08-26 17:14:14.706865-04	1	17	10	Consegui viver diversidade dentro da universidade	1	
27	2014-08-26 17:22:38.291948-04	1	17	11	Ufrn recebe encontro sobre acessibilidade cultural	1	
28	2014-08-26 17:27:36.967013-04	1	17	12	O abandono da terceira idade	1	
29	2014-08-26 17:30:25.838604-04	1	17	13	Comércio informal no setor 2 sustenta famílias de ambulantes	1	
30	2014-08-26 17:36:47.926719-04	1	20	1	Inscrições cientec 2014	1	
31	2014-08-26 17:39:44.694941-04	1	20	1	Inscrições cientec 2014	2	Modificado youtube para Vídeo "1".
32	2014-08-26 17:41:23.397383-04	1	20	1	Inscrições cientec 2014	2	Modificado body.
33	2014-08-26 17:41:45.573474-04	1	20	1	Inscrições cientec 2014	3	
34	2014-08-26 17:43:51.041691-04	1	8	1	Facebook contact	1	
35	2014-08-26 17:46:00.22031-04	1	8	1	Facebook contact	2	Modificado url.
36	2014-08-26 17:47:02.284553-04	1	8	1	Facebook contact	2	Modificado url.
37	2014-08-26 17:48:23.075003-04	1	8	2	Twitter contact	1	
38	2014-08-26 17:49:18.267716-04	1	8	3	Instagram contact	1	
39	2014-08-26 17:51:44.310094-04	1	8	3	Instagram contact	2	Modificado url.
40	2014-08-26 17:53:58.780476-04	1	16	2	Br	3	
41	2014-08-26 17:53:58.786061-04	1	16	1	Rn	3	
42	2014-08-26 18:04:59.459273-04	1	11	1	1	1	
43	2014-08-26 18:06:18.213777-04	1	11	1	1	2	Modificado body.
44	2014-08-26 18:08:22.156767-04	1	11	1	1	2	Modificado body.
45	2014-08-26 18:11:33.462583-04	1	11	1	1	2	Modificado body.
46	2014-08-26 18:12:39.295616-04	1	11	1	1	2	Modificado body.
47	2014-08-26 18:13:55.165089-04	1	11	1	1	2	Modificado body.
48	2014-08-26 18:15:28.539154-04	1	11	1	1	2	Modificado body.
49	2014-08-26 18:16:15.369305-04	1	11	1	1	2	Nenhum campo modificado.
50	2014-08-26 18:18:21.262796-04	1	11	1	1	2	Modificado body.
51	2014-08-26 18:19:19.299518-04	1	12	1	Coordenador geral	1	
52	2014-08-26 18:23:40.59366-04	1	13	1	Itamar nobre	1	
53	2014-08-26 18:27:31.796053-04	1	12	2	Bolsista de extensão 	1	
54	2014-08-26 18:28:44.398053-04	1	13	2	Ítalo albano	1	
55	2014-08-26 18:32:09.68586-04	1	12	3	Bolsista de pesquisa	1	
56	2014-08-26 18:32:56.620567-04	1	13	3	Alice andrade	1	
57	2014-08-26 18:35:23.945149-04	1	13	4	Beatriz lima	1	
58	2014-08-26 18:37:08.570051-04	1	13	4	Beatriz lima	2	Modificado photo.
59	2014-08-26 18:38:40.961478-04	1	13	2	Ítalo albano	3	
60	2014-08-26 18:38:40.977484-04	1	13	1	Itamar nobre	3	
61	2014-08-26 18:39:39.888381-04	1	13	5	Ítalo albano	1	
62	2014-08-26 18:40:59.034143-04	1	13	6	Itamar nobre	1	
63	2014-08-30 11:01:59.317847-04	1	12	3	Bolsista de pesquisa	3	
64	2014-08-30 11:01:59.331749-04	1	12	2	Bolsista de extensão 	3	
65	2014-09-07 21:39:11.209109-04	1	11	1	1	2	Modificado body.
66	2014-09-09 20:11:22.635066-04	1	18	1	In magni ratione rerum autem elit quisquam assumenda est libero	1	
67	2014-09-09 20:12:08.830347-04	1	18	1	In magni ratione rerum autem elit quisquam assumenda est libero	3	
68	2014-09-10 21:29:42.841515-04	1	5	3	comum	1	
69	2014-09-10 21:52:51.935164-04	1	5	3	comum	2	Modificado first_name, last_name, email e is_staff.
70	2014-09-10 21:53:00.942964-04	1	5	3	comum	2	Nenhum campo modificado.
71	2014-09-10 21:59:51.061754-04	1	5	4	joao	1	
72	2014-09-10 21:59:56.091386-04	1	5	4	joao	2	Nenhum campo modificado.
73	2014-09-10 21:59:58.805011-04	1	5	4	joao	2	Nenhum campo modificado.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 73, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	kv store	thumbnail	kvstore
2	log entry	admin	logentry
3	permission	auth	permission
4	group	auth	group
5	user	auth	user
6	content type	contenttypes	contenttype
7	session	sessions	session
8	Social network	core	socialnetwork
9	Contact	core	contact
10	Address	core	address
11	About	core	about
12	Role	core	role
13	Member	core	member
14	Discipline	core	discipline
15	Curricular practice	core	curricularpractice
16	Editorial	core	editorial
17	Notice	core	notice
18	Photogallery	core	photogallery
19	Photo	core	photo
20	Video library	core	videolibrary
21	Video	core	video
22	Podcast	core	podcast
23	Event	core	event
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fotec_admin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 23, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
mr2s8shcjm7sw4panxuu6lc0ugwlya1l	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-10 21:29:30.665544-04
h2e9k275ztopdtui8p1a06kgvtgw2yid	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-10 22:08:19.881691-04
u6xqn34zbaconr4s3n60njadmx7cc0vr	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-21 14:04:50.97904-04
w1fkra3stmr2y6kzy6ofsqpoznibxprl	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-23 19:33:57.744116-04
g23pr48rcruwhr26dncf3m2gwqy0ypy7	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-09 16:55:30.514362-04
2pphagzt5v9lsmej8qc1csocdz6rzznv	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-21 17:13:12.118969-04
94nxcmqynaobi91s1jdmpwdg5vp36c4s	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-23 19:26:16.777832-04
jty4axtqm0wrhp0mufaou2t3tnd1i00g	ZDYzNDM4ZWRmMTgzN2UxZjcyYzk3ZTAwNWJjOTI2ZDE2MTU1OGQ0Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-24 21:59:03.777494-04
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: fotec_admin
--

COPY thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||fc63bf765657943103dd2db4bc0a8343	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/4cbe6999269f4610ae2dbb050970dbc2.png", "size": [600, 400]}
sorl-thumbnail||image||b157c1103e354e0514b1be6518bb3635	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/03/e0/03e01525c57838be3093e6ef421b816f.jpg", "size": [1200, 675]}
sorl-thumbnail||image||0b4405332a4bc56589a61348a3f63c11	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f9/73/f973fb1ded6d0c36a9d979e86675da05.jpg", "size": [1200, 675]}
sorl-thumbnail||image||1d534b9625ef863925429dc0fc26721d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c2/43/c2433e3f0e676e5f8baf91404997ab65.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||fc63bf765657943103dd2db4bc0a8343	["b157c1103e354e0514b1be6518bb3635", "1d534b9625ef863925429dc0fc26721d"]
sorl-thumbnail||image||7ede89edc994f4cf7b2431607607dc03	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/fa2a11b4cfac411290548ab3fc953db9.png", "size": [1600, 1200]}
sorl-thumbnail||image||c25a07579f53f4fb5f4b745e8b9baad4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/28/b5/28b51554dd97f2d279f89efe20a22778.jpg", "size": [1200, 675]}
sorl-thumbnail||image||5b03e9053b2d8731d367d7b2fb8fa28c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/99f649203cac43238f58cbdd5b6de94b.png", "size": [1600, 1200]}
sorl-thumbnail||image||07f3335cee0a2838b0e2cbcef1fded7a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b2/b1/b2b169d397566535d46e36c274a91279.jpg", "size": [1200, 675]}
sorl-thumbnail||image||1b0af1cbe41757bb224f75a156c26543	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c3/da/c3da21fc613e4fc954ae36382a8ce5a9.jpg", "size": [90, 90]}
sorl-thumbnail||image||6a3c057e6108b666babcfe74035214e5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/ba08318e07f04998834079e888f7a93a.png", "size": [1024, 640]}
sorl-thumbnail||image||cba31ff927507d883573493dffc1b45c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ca/29/ca299a195d158c9257d86c9f08df1c1c.jpg", "size": [1200, 675]}
sorl-thumbnail||thumbnails||922453be00f0497a595d781ab01145a5	["a59b71d5ba67bc44c0cd3e9b973f6399", "1b0af1cbe41757bb224f75a156c26543"]
sorl-thumbnail||image||503bcdc7c00a90418c016f332f3c73f8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d3/c4/d3c4a139d1b7f2bd8b8a44f5d1287323.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||7ede89edc994f4cf7b2431607607dc03	["c25a07579f53f4fb5f4b745e8b9baad4", "503bcdc7c00a90418c016f332f3c73f8"]
sorl-thumbnail||image||28c8637659be1902f6edbc6d84c8fd79	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f3/5f/f35f1bc36658c5d8dfc4726e86f2b8fa.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||5b03e9053b2d8731d367d7b2fb8fa28c	["07f3335cee0a2838b0e2cbcef1fded7a", "28c8637659be1902f6edbc6d84c8fd79"]
sorl-thumbnail||image||6b9f485e59d49e278a74c8c3bedc6397	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/7e/a2/7ea269b2d3b9f9d4fc0c6d5de89180a1.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||6a3c057e6108b666babcfe74035214e5	["6b9f485e59d49e278a74c8c3bedc6397", "cba31ff927507d883573493dffc1b45c"]
sorl-thumbnail||image||2e251ed1476bdd44eda3158feb6b0ade	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/5ca8425ba21e474997d3e56f6f44acf1.png", "size": [800, 600]}
sorl-thumbnail||image||20d80cf0e7c716bd4f9fea2415457359	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/58/df/58df9c4265469cffbca03c58fa881b1e.jpg", "size": [1200, 675]}
sorl-thumbnail||image||88456e656a806dd7fa5883c57cba7c61	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/98/14/9814619d5d28e40bd386348b4f82486a.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||2e251ed1476bdd44eda3158feb6b0ade	["88456e656a806dd7fa5883c57cba7c61", "20d80cf0e7c716bd4f9fea2415457359"]
sorl-thumbnail||image||922453be00f0497a595d781ab01145a5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/7e2f1adf761e4d10afbf494a9a6374a8.png", "size": [336, 339]}
sorl-thumbnail||image||a59b71d5ba67bc44c0cd3e9b973f6399	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/14/09/14096a8d357dbb5fb61d3e2b981d00d7.jpg", "size": [1200, 675]}
sorl-thumbnail||image||9f2412c83e8baa65bda1f72f86c77abb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/cc7e86a23d59424bbbf0aaa496be9645.png", "size": [630, 350]}
sorl-thumbnail||image||6e2968cdb9dc8178a6fcce5100fea33d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f3/eb/f3ebcdc4bce8a4330a05afae37d5f1ae.jpg", "size": [1200, 675]}
sorl-thumbnail||image||8976bc90cddefb2b09c648f3de91d63a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/78/ed/78edc2f533b6b792664fea59f41948d7.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||9f2412c83e8baa65bda1f72f86c77abb	["8976bc90cddefb2b09c648f3de91d63a", "6e2968cdb9dc8178a6fcce5100fea33d"]
sorl-thumbnail||image||8f040e2eadcc2be68e39de8088423d9b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/ce1f92dfde2248bdbc512219cb80b1e0.png", "size": [630, 350]}
sorl-thumbnail||image||82f63864a9c086a3151911c27c408fde	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/61/ea/61ea166ef58d99b79f693ead69d0b601.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||8f040e2eadcc2be68e39de8088423d9b	["0b4405332a4bc56589a61348a3f63c11", "82f63864a9c086a3151911c27c408fde"]
sorl-thumbnail||image||3819dd941998178c193abd7bc119a12b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/471bcecc748f4cd9adb23f986164718a.png", "size": [630, 350]}
sorl-thumbnail||image||81a9eb8dcd695db906abe04838a00f2b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/5e/97/5e97685d937fd90e1cb02397cbc34b94.jpg", "size": [1200, 675]}
sorl-thumbnail||image||113af2aef384c575a4d76cbe9c465c34	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/news/0f2cc337bed44c089df0a0b6f2eb4db5.png", "size": [630, 350]}
sorl-thumbnail||thumbnails||3819dd941998178c193abd7bc119a12b	["81a9eb8dcd695db906abe04838a00f2b", "14c2faa41c898a7bd521404138a985ad"]
sorl-thumbnail||image||83cdf9fae5ebd876bd3feaebd8e4a6ee	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a1/4d/a14d2a6ebc111433094a6799d3e5512d.jpg", "size": [1200, 675]}
sorl-thumbnail||thumbnails||662dad805bd11ae962a6bbc7f6b69cb6	["ff547961868ab6523e50c5390708e0d8"]
sorl-thumbnail||image||14c2faa41c898a7bd521404138a985ad	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/8e/a1/8ea1778ad2d5c010e67d1b305956d6c2.jpg", "size": [90, 90]}
sorl-thumbnail||image||040673380b3642e85f35bc1e95cd2cc9	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4c/2b/4c2bbe7d701abdc1a13113b450c3f8a6.jpg", "size": [90, 90]}
sorl-thumbnail||thumbnails||113af2aef384c575a4d76cbe9c465c34	["83cdf9fae5ebd876bd3feaebd8e4a6ee", "040673380b3642e85f35bc1e95cd2cc9"]
sorl-thumbnail||image||e7d2bb3f94062d0d8d7863b08eeafa54	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/10338772_847272078619584_1592047641724079544_n.jpg", "size": [696, 672]}
sorl-thumbnail||image||0ae295938d0b7a3fe2b9ad84f50320c7	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c7/f4/c7f4d3585ae8fc4e7f5055ebc0e16014.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||e7d2bb3f94062d0d8d7863b08eeafa54	["0ae295938d0b7a3fe2b9ad84f50320c7"]
sorl-thumbnail||image||0fa52b1d15fe9854bed98624fe2c1861	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/10383768_719176898120783_7871656211729440316_o.jpg", "size": [944, 960]}
sorl-thumbnail||image||664945f7a63b1aaa58ec377bdd1f919f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/91/b3/91b3a7c61bdd22d10321a9501a1fbfdd.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||0fa52b1d15fe9854bed98624fe2c1861	["664945f7a63b1aaa58ec377bdd1f919f"]
sorl-thumbnail||image||08a355a89fec6debc23895e6fb74e629	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/1470260_787758731237317_1836738040_n.jpg", "size": [634, 637]}
sorl-thumbnail||image||824db72c04c042fbc2926b6a046baafb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/37/4f/374faff3609c3fb67c7ee3ea3cbbd5f8.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||08a355a89fec6debc23895e6fb74e629	["824db72c04c042fbc2926b6a046baafb"]
sorl-thumbnail||image||2b84de65129de68ecb84735b936c9fa2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/374403_390904804342400_867198516_n.jpg", "size": [182, 402]}
sorl-thumbnail||image||cbf8a045db665d4d60d6afc0bc18a638	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/db/33/db33cdb368921ea9088a763612dd86a6.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||2b84de65129de68ecb84735b936c9fa2	["cbf8a045db665d4d60d6afc0bc18a638"]
sorl-thumbnail||image||d29dc9cf23b580a8bf3eaa129091c30d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/374403_390904804342400_867198516_n_1.jpg", "size": [182, 273]}
sorl-thumbnail||image||4b33cdfa68cd0d8c06bbd80f21660384	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f2/56/f2563a41cc0d6716970b4e7837908ebb.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||d29dc9cf23b580a8bf3eaa129091c30d	["4b33cdfa68cd0d8c06bbd80f21660384"]
sorl-thumbnail||image||52c9b527a86581edd13838232c79abe2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/10383768_719176898120783_7871656211729440316_o_1.jpg", "size": [944, 960]}
sorl-thumbnail||image||bbedcf124bcff74926bfcfa21e7b4a6c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/60/48/6048148580dd89d4bbd38941bd58b050.jpg", "size": [250, 250]}
sorl-thumbnail||thumbnails||52c9b527a86581edd13838232c79abe2	["bbedcf124bcff74926bfcfa21e7b4a6c"]
sorl-thumbnail||image||662dad805bd11ae962a6bbc7f6b69cb6	{"storage": "django.core.files.storage.FileSystemStorage", "name": "/var/www/fotec/media/members/10338772_847272078619584_1592047641724079544_n_1.jpg", "size": [696, 672]}
sorl-thumbnail||image||ff547961868ab6523e50c5390708e0d8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/41/4f/414f4ad2e5e377e7b601a75fa552fa0a.jpg", "size": [250, 250]}
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_about_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_about
    ADD CONSTRAINT core_about_pkey PRIMARY KEY (id);


--
-- Name: core_address_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_address
    ADD CONSTRAINT core_address_pkey PRIMARY KEY (id);


--
-- Name: core_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_contact
    ADD CONSTRAINT core_contact_pkey PRIMARY KEY (id);


--
-- Name: core_curricularpractice_name_discipline_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_curricularpractice
    ADD CONSTRAINT core_curricularpractice_name_discipline_id_key UNIQUE (name, discipline_id);


--
-- Name: core_curricularpractice_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_curricularpractice
    ADD CONSTRAINT core_curricularpractice_pkey PRIMARY KEY (id);


--
-- Name: core_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_discipline
    ADD CONSTRAINT core_discipline_name_key UNIQUE (name);


--
-- Name: core_discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_discipline
    ADD CONSTRAINT core_discipline_pkey PRIMARY KEY (id);


--
-- Name: core_editorial_name_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_editorial
    ADD CONSTRAINT core_editorial_name_key UNIQUE (name);


--
-- Name: core_editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_editorial
    ADD CONSTRAINT core_editorial_pkey PRIMARY KEY (id);


--
-- Name: core_event_notices_event_id_notice_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_notices
    ADD CONSTRAINT core_event_notices_event_id_notice_id_key UNIQUE (event_id, notice_id);


--
-- Name: core_event_notices_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_notices
    ADD CONSTRAINT core_event_notices_pkey PRIMARY KEY (id);


--
-- Name: core_event_photogalleries_event_id_photogallery_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_photogalleries
    ADD CONSTRAINT core_event_photogalleries_event_id_photogallery_id_key UNIQUE (event_id, photogallery_id);


--
-- Name: core_event_photogalleries_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_photogalleries
    ADD CONSTRAINT core_event_photogalleries_pkey PRIMARY KEY (id);


--
-- Name: core_event_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event
    ADD CONSTRAINT core_event_pkey PRIMARY KEY (id);


--
-- Name: core_event_podcasts_event_id_podcast_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_podcasts
    ADD CONSTRAINT core_event_podcasts_event_id_podcast_id_key UNIQUE (event_id, podcast_id);


--
-- Name: core_event_podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_podcasts
    ADD CONSTRAINT core_event_podcasts_pkey PRIMARY KEY (id);


--
-- Name: core_event_video_libraries_event_id_videolibrary_id_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_video_libraries
    ADD CONSTRAINT core_event_video_libraries_event_id_videolibrary_id_key UNIQUE (event_id, videolibrary_id);


--
-- Name: core_event_video_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_event_video_libraries
    ADD CONSTRAINT core_event_video_libraries_pkey PRIMARY KEY (id);


--
-- Name: core_member_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_member
    ADD CONSTRAINT core_member_pkey PRIMARY KEY (id);


--
-- Name: core_notice_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_notice
    ADD CONSTRAINT core_notice_pkey PRIMARY KEY (id);


--
-- Name: core_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_photo
    ADD CONSTRAINT core_photo_pkey PRIMARY KEY (id);


--
-- Name: core_photogallery_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_photogallery
    ADD CONSTRAINT core_photogallery_pkey PRIMARY KEY (id);


--
-- Name: core_podcast_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_podcast
    ADD CONSTRAINT core_podcast_pkey PRIMARY KEY (id);


--
-- Name: core_role_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_role
    ADD CONSTRAINT core_role_pkey PRIMARY KEY (id);


--
-- Name: core_socialnetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_socialnetwork
    ADD CONSTRAINT core_socialnetwork_pkey PRIMARY KEY (id);


--
-- Name: core_video_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_video
    ADD CONSTRAINT core_video_pkey PRIMARY KEY (id);


--
-- Name: core_videolibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY core_videolibrary
    ADD CONSTRAINT core_videolibrary_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: fotec_admin; Tablespace: 
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: core_curricularpractice_discipline_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_curricularpractice_discipline_id ON core_curricularpractice USING btree (discipline_id);


--
-- Name: core_discipline_name_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_discipline_name_like ON core_discipline USING btree (name varchar_pattern_ops);


--
-- Name: core_editorial_name_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_editorial_name_like ON core_editorial USING btree (name varchar_pattern_ops);


--
-- Name: core_event_notices_event_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_notices_event_id ON core_event_notices USING btree (event_id);


--
-- Name: core_event_notices_notice_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_notices_notice_id ON core_event_notices USING btree (notice_id);


--
-- Name: core_event_photogalleries_event_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_photogalleries_event_id ON core_event_photogalleries USING btree (event_id);


--
-- Name: core_event_photogalleries_photogallery_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_photogalleries_photogallery_id ON core_event_photogalleries USING btree (photogallery_id);


--
-- Name: core_event_podcasts_event_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_podcasts_event_id ON core_event_podcasts USING btree (event_id);


--
-- Name: core_event_podcasts_podcast_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_podcasts_podcast_id ON core_event_podcasts USING btree (podcast_id);


--
-- Name: core_event_video_libraries_event_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_video_libraries_event_id ON core_event_video_libraries USING btree (event_id);


--
-- Name: core_event_video_libraries_videolibrary_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_event_video_libraries_videolibrary_id ON core_event_video_libraries USING btree (videolibrary_id);


--
-- Name: core_member_role_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_member_role_id ON core_member USING btree (role_id);


--
-- Name: core_notice_curricular_practice_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_notice_curricular_practice_id ON core_notice USING btree (curricular_practice_id);


--
-- Name: core_notice_discipline_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_notice_discipline_id ON core_notice USING btree (discipline_id);


--
-- Name: core_notice_editorial_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_notice_editorial_id ON core_notice USING btree (editorial_id);


--
-- Name: core_photo_photogallery_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_photo_photogallery_id ON core_photo USING btree (photogallery_id);


--
-- Name: core_photogallery_curricular_practice_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_photogallery_curricular_practice_id ON core_photogallery USING btree (curricular_practice_id);


--
-- Name: core_photogallery_discipline_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_photogallery_discipline_id ON core_photogallery USING btree (discipline_id);


--
-- Name: core_photogallery_editorial_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_photogallery_editorial_id ON core_photogallery USING btree (editorial_id);


--
-- Name: core_video_video_library_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_video_video_library_id ON core_video USING btree (video_library_id);


--
-- Name: core_videolibrary_curricular_practice_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_videolibrary_curricular_practice_id ON core_videolibrary USING btree (curricular_practice_id);


--
-- Name: core_videolibrary_discipline_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_videolibrary_discipline_id ON core_videolibrary USING btree (discipline_id);


--
-- Name: core_videolibrary_editorial_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX core_videolibrary_editorial_id ON core_videolibrary USING btree (editorial_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_like; Type: INDEX; Schema: public; Owner: fotec_admin; Tablespace: 
--

CREATE INDEX thumbnail_kvstore_key_like ON thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_curricularpractice_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_curricularpractice
    ADD CONSTRAINT core_curricularpractice_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES core_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event_notices_notice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_notices
    ADD CONSTRAINT core_event_notices_notice_id_fkey FOREIGN KEY (notice_id) REFERENCES core_notice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event_photogalleries_photogallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_photogalleries
    ADD CONSTRAINT core_event_photogalleries_photogallery_id_fkey FOREIGN KEY (photogallery_id) REFERENCES core_photogallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event_podcasts_podcast_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_podcasts
    ADD CONSTRAINT core_event_podcasts_podcast_id_fkey FOREIGN KEY (podcast_id) REFERENCES core_podcast(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_event_video_libraries_videolibrary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_video_libraries
    ADD CONSTRAINT core_event_video_libraries_videolibrary_id_fkey FOREIGN KEY (videolibrary_id) REFERENCES core_videolibrary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_member_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_member
    ADD CONSTRAINT core_member_role_id_fkey FOREIGN KEY (role_id) REFERENCES core_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_notice_curricular_practice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_notice
    ADD CONSTRAINT core_notice_curricular_practice_id_fkey FOREIGN KEY (curricular_practice_id) REFERENCES core_curricularpractice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_notice_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_notice
    ADD CONSTRAINT core_notice_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES core_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_notice_editorial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_notice
    ADD CONSTRAINT core_notice_editorial_id_fkey FOREIGN KEY (editorial_id) REFERENCES core_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_photo_photogallery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photo
    ADD CONSTRAINT core_photo_photogallery_id_fkey FOREIGN KEY (photogallery_id) REFERENCES core_photogallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_photogallery_curricular_practice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photogallery
    ADD CONSTRAINT core_photogallery_curricular_practice_id_fkey FOREIGN KEY (curricular_practice_id) REFERENCES core_curricularpractice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_photogallery_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photogallery
    ADD CONSTRAINT core_photogallery_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES core_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_photogallery_editorial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_photogallery
    ADD CONSTRAINT core_photogallery_editorial_id_fkey FOREIGN KEY (editorial_id) REFERENCES core_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_video_video_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_video
    ADD CONSTRAINT core_video_video_library_id_fkey FOREIGN KEY (video_library_id) REFERENCES core_videolibrary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_videolibrary_curricular_practice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_videolibrary
    ADD CONSTRAINT core_videolibrary_curricular_practice_id_fkey FOREIGN KEY (curricular_practice_id) REFERENCES core_curricularpractice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_videolibrary_discipline_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_videolibrary
    ADD CONSTRAINT core_videolibrary_discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES core_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_videolibrary_editorial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_videolibrary
    ADD CONSTRAINT core_videolibrary_editorial_id_fkey FOREIGN KEY (editorial_id) REFERENCES core_editorial(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_id_refs_id_0cf92d63; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_photogalleries
    ADD CONSTRAINT event_id_refs_id_0cf92d63 FOREIGN KEY (event_id) REFERENCES core_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_id_refs_id_497f646e; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_podcasts
    ADD CONSTRAINT event_id_refs_id_497f646e FOREIGN KEY (event_id) REFERENCES core_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_id_refs_id_7f209ed9; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_notices
    ADD CONSTRAINT event_id_refs_id_7f209ed9 FOREIGN KEY (event_id) REFERENCES core_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_id_refs_id_d08d147f; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY core_event_video_libraries
    ADD CONSTRAINT event_id_refs_id_d08d147f FOREIGN KEY (event_id) REFERENCES core_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: fotec_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

