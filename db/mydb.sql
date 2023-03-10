--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-05 23:14:48

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
-- TOC entry 214 (class 1259 OID 17956)
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17961)
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 215
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- TOC entry 216 (class 1259 OID 17962)
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17965)
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- TOC entry 218 (class 1259 OID 17966)
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17971)
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- TOC entry 220 (class 1259 OID 17972)
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17977)
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- TOC entry 222 (class 1259 OID 17978)
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order integer,
    user_order integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17981)
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 223
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- TOC entry 224 (class 1259 OID 17982)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17987)
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order integer
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17990)
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 226
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- TOC entry 227 (class 1259 OID 17991)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- TOC entry 228 (class 1259 OID 17992)
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17997)
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 229
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- TOC entry 230 (class 1259 OID 17998)
-- Name: g_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_accounts (
    id integer NOT NULL,
    user_name character varying(255),
    is_member boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    meta_data text,
    sub character varying(255)
);


ALTER TABLE public.g_accounts OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18003)
-- Name: g_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 231
-- Name: g_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_accounts_id_seq OWNED BY public.g_accounts.id;


--
-- TOC entry 232 (class 1259 OID 18004)
-- Name: g_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_characters (
    id integer NOT NULL,
    name character varying(255),
    max_hp character varying(255),
    current_hp character varying(255),
    gold character varying(255),
    point integer,
    location integer,
    lvl character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    exp character varying(255),
    account_id integer,
    atk integer,
    def integer,
    dex integer
);


ALTER TABLE public.g_characters OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18009)
-- Name: g_characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_characters_id_seq OWNER TO postgres;

--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 233
-- Name: g_characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_characters_id_seq OWNED BY public.g_characters.id;


--
-- TOC entry 234 (class 1259 OID 18010)
-- Name: g_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_configurations (
    id integer NOT NULL,
    name character varying(255),
    value_str character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.g_configurations OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18015)
-- Name: g_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_configurations_id_seq OWNER TO postgres;

--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 235
-- Name: g_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_configurations_id_seq OWNED BY public.g_configurations.id;


--
-- TOC entry 236 (class 1259 OID 18016)
-- Name: g_formulas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_formulas (
    id integer NOT NULL,
    format_formula text,
    name_formula character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.g_formulas OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18021)
-- Name: g_formulas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_formulas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_formulas_id_seq OWNER TO postgres;

--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 237
-- Name: g_formulas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_formulas_id_seq OWNED BY public.g_formulas.id;


--
-- TOC entry 238 (class 1259 OID 18022)
-- Name: g_session_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_session_tokens (
    id integer NOT NULL,
    token character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    account_id integer
);


ALTER TABLE public.g_session_tokens OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18025)
-- Name: g_session_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_session_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_session_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 239
-- Name: g_session_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_session_tokens_id_seq OWNED BY public.g_session_tokens.id;


--
-- TOC entry 240 (class 1259 OID 18026)
-- Name: g_travel_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_travel_logs (
    id integer NOT NULL,
    text text,
    heading character varying(255),
    wait_length integer,
    reward_gold integer,
    reward_exp integer,
    step_type character varying(255),
    item text,
    travel_background character varying(255),
    char_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.g_travel_logs OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 18031)
-- Name: g_travel_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_travel_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_travel_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 241
-- Name: g_travel_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_travel_logs_id_seq OWNED BY public.g_travel_logs.id;


--
-- TOC entry 242 (class 1259 OID 18032)
-- Name: g_travel_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.g_travel_texts (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.g_travel_texts OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18037)
-- Name: g_travel_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.g_travel_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.g_travel_texts_id_seq OWNER TO postgres;

--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 243
-- Name: g_travel_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.g_travel_texts_id_seq OWNED BY public.g_travel_texts.id;


--
-- TOC entry 244 (class 1259 OID 18038)
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18043)
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 245
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- TOC entry 246 (class 1259 OID 18044)
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18047)
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 247
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- TOC entry 248 (class 1259 OID 18048)
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order integer
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18051)
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- TOC entry 250 (class 1259 OID 18052)
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18057)
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 251
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- TOC entry 252 (class 1259 OID 18058)
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18063)
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 253
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- TOC entry 254 (class 1259 OID 18064)
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18069)
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 255
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- TOC entry 256 (class 1259 OID 18070)
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18073)
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 257
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- TOC entry 258 (class 1259 OID 18074)
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18079)
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 259
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- TOC entry 260 (class 1259 OID 18080)
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18083)
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 261
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- TOC entry 262 (class 1259 OID 18084)
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 18087)
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 263
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- TOC entry 264 (class 1259 OID 18088)
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 18093)
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 265
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- TOC entry 266 (class 1259 OID 18094)
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 18099)
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 267
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- TOC entry 268 (class 1259 OID 18100)
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order integer
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 18103)
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 269
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- TOC entry 270 (class 1259 OID 18104)
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 18109)
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 271
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- TOC entry 272 (class 1259 OID 18110)
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order integer
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 18113)
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 273
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- TOC entry 3341 (class 2604 OID 18114)
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 18115)
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 18116)
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 18117)
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 18118)
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 18119)
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 18120)
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 18121)
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 18122)
-- Name: g_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_accounts ALTER COLUMN id SET DEFAULT nextval('public.g_accounts_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 18123)
-- Name: g_characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_characters ALTER COLUMN id SET DEFAULT nextval('public.g_characters_id_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 18124)
-- Name: g_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_configurations ALTER COLUMN id SET DEFAULT nextval('public.g_configurations_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 18125)
-- Name: g_formulas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_formulas ALTER COLUMN id SET DEFAULT nextval('public.g_formulas_id_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 18126)
-- Name: g_session_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_session_tokens ALTER COLUMN id SET DEFAULT nextval('public.g_session_tokens_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 18127)
-- Name: g_travel_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_logs ALTER COLUMN id SET DEFAULT nextval('public.g_travel_logs_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 18128)
-- Name: g_travel_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_texts ALTER COLUMN id SET DEFAULT nextval('public.g_travel_texts_id_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 18129)
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 18130)
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- TOC entry 3358 (class 2604 OID 18131)
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- TOC entry 3359 (class 2604 OID 18132)
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- TOC entry 3360 (class 2604 OID 18133)
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- TOC entry 3361 (class 2604 OID 18134)
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- TOC entry 3362 (class 2604 OID 18135)
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- TOC entry 3363 (class 2604 OID 18136)
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 18137)
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 18138)
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 18139)
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 18140)
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 18141)
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 18142)
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 18143)
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- TOC entry 3707 (class 0 OID 17956)
-- Dependencies: 214
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions VALUES (1, 'plugin::upload.read', NULL, '{}', '[]', '2023-01-26 21:31:26.514', '2023-01-26 21:31:26.514', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (2, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-01-26 21:31:26.523', '2023-01-26 21:31:26.523', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (3, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-01-26 21:31:26.526', '2023-01-26 21:31:26.526', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (4, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-01-26 21:31:26.528', '2023-01-26 21:31:26.528', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (5, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-01-26 21:31:26.531', '2023-01-26 21:31:26.531', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (6, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-01-26 21:31:26.534', '2023-01-26 21:31:26.534', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (7, 'plugin::upload.read', NULL, '{}', '["admin::is-creator"]', '2023-01-26 21:31:26.537', '2023-01-26 21:31:26.537', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (8, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-01-26 21:31:26.54', '2023-01-26 21:31:26.54', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (9, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-01-26 21:31:26.543', '2023-01-26 21:31:26.543', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (10, 'plugin::upload.assets.update', NULL, '{}', '["admin::is-creator"]', '2023-01-26 21:31:26.546', '2023-01-26 21:31:26.546', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (11, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-01-26 21:31:26.548', '2023-01-26 21:31:26.548', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (12, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-01-26 21:31:26.551', '2023-01-26 21:31:26.551', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (13, 'plugin::content-manager.explorer.create', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-01-26 21:31:26.567', '2023-01-26 21:31:26.567', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (14, 'plugin::content-manager.explorer.read', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-01-26 21:31:26.571', '2023-01-26 21:31:26.571', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (15, 'plugin::content-manager.explorer.update', 'plugin::users-permissions.user', '{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}', '[]', '2023-01-26 21:31:26.574', '2023-01-26 21:31:26.574', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (16, 'plugin::content-manager.explorer.delete', 'plugin::users-permissions.user', '{}', '[]', '2023-01-26 21:31:26.577', '2023-01-26 21:31:26.577', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (17, 'plugin::content-manager.single-types.configure-view', NULL, '{}', '[]', '2023-01-26 21:31:26.581', '2023-01-26 21:31:26.581', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (18, 'plugin::content-manager.collection-types.configure-view', NULL, '{}', '[]', '2023-01-26 21:31:26.584', '2023-01-26 21:31:26.584', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (19, 'plugin::content-manager.components.configure-layout', NULL, '{}', '[]', '2023-01-26 21:31:26.587', '2023-01-26 21:31:26.587', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (20, 'plugin::content-type-builder.read', NULL, '{}', '[]', '2023-01-26 21:31:26.59', '2023-01-26 21:31:26.59', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (21, 'plugin::email.settings.read', NULL, '{}', '[]', '2023-01-26 21:31:26.593', '2023-01-26 21:31:26.593', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (22, 'plugin::upload.read', NULL, '{}', '[]', '2023-01-26 21:31:26.596', '2023-01-26 21:31:26.596', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (23, 'plugin::upload.assets.create', NULL, '{}', '[]', '2023-01-26 21:31:26.599', '2023-01-26 21:31:26.599', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (24, 'plugin::upload.assets.update', NULL, '{}', '[]', '2023-01-26 21:31:26.603', '2023-01-26 21:31:26.603', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (25, 'plugin::upload.assets.download', NULL, '{}', '[]', '2023-01-26 21:31:26.606', '2023-01-26 21:31:26.606', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (26, 'plugin::upload.assets.copy-link', NULL, '{}', '[]', '2023-01-26 21:31:26.609', '2023-01-26 21:31:26.609', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (27, 'plugin::upload.configure-view', NULL, '{}', '[]', '2023-01-26 21:31:26.611', '2023-01-26 21:31:26.611', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (28, 'plugin::upload.settings.read', NULL, '{}', '[]', '2023-01-26 21:31:26.614', '2023-01-26 21:31:26.614', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (29, 'plugin::users-permissions.roles.create', NULL, '{}', '[]', '2023-01-26 21:31:26.617', '2023-01-26 21:31:26.617', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (30, 'plugin::users-permissions.roles.read', NULL, '{}', '[]', '2023-01-26 21:31:26.621', '2023-01-26 21:31:26.621', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (31, 'plugin::users-permissions.roles.update', NULL, '{}', '[]', '2023-01-26 21:31:26.624', '2023-01-26 21:31:26.624', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (32, 'plugin::users-permissions.roles.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.627', '2023-01-26 21:31:26.627', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (33, 'plugin::users-permissions.providers.read', NULL, '{}', '[]', '2023-01-26 21:31:26.629', '2023-01-26 21:31:26.629', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (34, 'plugin::users-permissions.providers.update', NULL, '{}', '[]', '2023-01-26 21:31:26.632', '2023-01-26 21:31:26.632', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (35, 'plugin::users-permissions.email-templates.read', NULL, '{}', '[]', '2023-01-26 21:31:26.635', '2023-01-26 21:31:26.635', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (36, 'plugin::users-permissions.email-templates.update', NULL, '{}', '[]', '2023-01-26 21:31:26.637', '2023-01-26 21:31:26.637', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (37, 'plugin::users-permissions.advanced-settings.read', NULL, '{}', '[]', '2023-01-26 21:31:26.64', '2023-01-26 21:31:26.64', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (38, 'plugin::users-permissions.advanced-settings.update', NULL, '{}', '[]', '2023-01-26 21:31:26.644', '2023-01-26 21:31:26.644', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (39, 'plugin::i18n.locale.create', NULL, '{}', '[]', '2023-01-26 21:31:26.646', '2023-01-26 21:31:26.646', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (40, 'plugin::i18n.locale.read', NULL, '{}', '[]', '2023-01-26 21:31:26.649', '2023-01-26 21:31:26.649', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (41, 'plugin::i18n.locale.update', NULL, '{}', '[]', '2023-01-26 21:31:26.651', '2023-01-26 21:31:26.651', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (42, 'plugin::i18n.locale.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.654', '2023-01-26 21:31:26.654', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (43, 'admin::marketplace.read', NULL, '{}', '[]', '2023-01-26 21:31:26.656', '2023-01-26 21:31:26.656', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (44, 'admin::marketplace.plugins.install', NULL, '{}', '[]', '2023-01-26 21:31:26.659', '2023-01-26 21:31:26.659', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (45, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', '2023-01-26 21:31:26.661', '2023-01-26 21:31:26.661', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (46, 'admin::webhooks.create', NULL, '{}', '[]', '2023-01-26 21:31:26.664', '2023-01-26 21:31:26.664', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (47, 'admin::webhooks.read', NULL, '{}', '[]', '2023-01-26 21:31:26.666', '2023-01-26 21:31:26.666', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (48, 'admin::webhooks.update', NULL, '{}', '[]', '2023-01-26 21:31:26.669', '2023-01-26 21:31:26.669', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (49, 'admin::webhooks.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.672', '2023-01-26 21:31:26.672', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (50, 'admin::users.create', NULL, '{}', '[]', '2023-01-26 21:31:26.674', '2023-01-26 21:31:26.674', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (51, 'admin::users.read', NULL, '{}', '[]', '2023-01-26 21:31:26.677', '2023-01-26 21:31:26.677', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (52, 'admin::users.update', NULL, '{}', '[]', '2023-01-26 21:31:26.68', '2023-01-26 21:31:26.68', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (53, 'admin::users.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.682', '2023-01-26 21:31:26.682', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (54, 'admin::roles.create', NULL, '{}', '[]', '2023-01-26 21:31:26.685', '2023-01-26 21:31:26.685', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (55, 'admin::roles.read', NULL, '{}', '[]', '2023-01-26 21:31:26.688', '2023-01-26 21:31:26.688', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (56, 'admin::roles.update', NULL, '{}', '[]', '2023-01-26 21:31:26.69', '2023-01-26 21:31:26.69', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (57, 'admin::roles.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.693', '2023-01-26 21:31:26.693', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (58, 'admin::api-tokens.access', NULL, '{}', '[]', '2023-01-26 21:31:26.696', '2023-01-26 21:31:26.696', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (59, 'admin::api-tokens.create', NULL, '{}', '[]', '2023-01-26 21:31:26.698', '2023-01-26 21:31:26.698', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (60, 'admin::api-tokens.read', NULL, '{}', '[]', '2023-01-26 21:31:26.701', '2023-01-26 21:31:26.701', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (61, 'admin::api-tokens.update', NULL, '{}', '[]', '2023-01-26 21:31:26.704', '2023-01-26 21:31:26.704', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (62, 'admin::api-tokens.regenerate', NULL, '{}', '[]', '2023-01-26 21:31:26.707', '2023-01-26 21:31:26.707', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (63, 'admin::api-tokens.delete', NULL, '{}', '[]', '2023-01-26 21:31:26.709', '2023-01-26 21:31:26.709', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (64, 'admin::project-settings.update', NULL, '{}', '[]', '2023-01-26 21:31:26.711', '2023-01-26 21:31:26.711', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (65, 'admin::project-settings.read', NULL, '{}', '[]', '2023-01-26 21:31:26.714', '2023-01-26 21:31:26.714', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (73, 'plugin::content-manager.explorer.delete', 'api::g-account.g-account', '{}', '[]', '2023-01-26 21:42:04.273', '2023-01-26 21:42:04.273', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (77, 'plugin::content-manager.explorer.delete', 'api::g-character.g-character', '{}', '[]', '2023-01-26 22:03:05.09', '2023-01-26 22:03:05.09', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (78, 'plugin::content-manager.explorer.create', 'api::g-travel-log.g-travel-log', '{"fields": ["text", "heading", "wait_length", "reward_gold", "reward_exp", "step_type", "item", "travel_background", "char_id"]}', '[]', '2023-01-26 23:48:58.938', '2023-01-26 23:48:58.938', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (79, 'plugin::content-manager.explorer.read', 'api::g-travel-log.g-travel-log', '{"fields": ["text", "heading", "wait_length", "reward_gold", "reward_exp", "step_type", "item", "travel_background", "char_id"]}', '[]', '2023-01-26 23:48:58.945', '2023-01-26 23:48:58.945', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (80, 'plugin::content-manager.explorer.update', 'api::g-travel-log.g-travel-log', '{"fields": ["text", "heading", "wait_length", "reward_gold", "reward_exp", "step_type", "item", "travel_background", "char_id"]}', '[]', '2023-01-26 23:48:58.948', '2023-01-26 23:48:58.948', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (81, 'plugin::content-manager.explorer.delete', 'api::g-travel-log.g-travel-log', '{}', '[]', '2023-01-26 23:48:58.951', '2023-01-26 23:48:58.951', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (82, 'plugin::content-manager.explorer.create', 'api::g-formula.g-formula', '{"fields": ["format_formula", "name_formula"]}', '[]', '2023-01-26 23:52:18.962', '2023-01-26 23:52:18.962', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (83, 'plugin::content-manager.explorer.read', 'api::g-formula.g-formula', '{"fields": ["format_formula", "name_formula"]}', '[]', '2023-01-26 23:52:18.968', '2023-01-26 23:52:18.968', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (84, 'plugin::content-manager.explorer.update', 'api::g-formula.g-formula', '{"fields": ["format_formula", "name_formula"]}', '[]', '2023-01-26 23:52:18.972', '2023-01-26 23:52:18.972', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (85, 'plugin::content-manager.explorer.delete', 'api::g-formula.g-formula', '{}', '[]', '2023-01-26 23:52:18.975', '2023-01-26 23:52:18.975', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (86, 'plugin::content-manager.explorer.create', 'api::g-travel-text.g-travel-text', '{"fields": ["content"]}', '[]', '2023-01-26 23:57:48.119', '2023-01-26 23:57:48.119', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (87, 'plugin::content-manager.explorer.read', 'api::g-travel-text.g-travel-text', '{"fields": ["content"]}', '[]', '2023-01-26 23:57:48.127', '2023-01-26 23:57:48.127', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (88, 'plugin::content-manager.explorer.update', 'api::g-travel-text.g-travel-text', '{"fields": ["content"]}', '[]', '2023-01-26 23:57:48.131', '2023-01-26 23:57:48.131', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (89, 'plugin::content-manager.explorer.delete', 'api::g-travel-text.g-travel-text', '{}', '[]', '2023-01-26 23:57:48.134', '2023-01-26 23:57:48.134', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (93, 'plugin::content-manager.explorer.delete', 'api::g-session-token.g-session-token', '{}', '[]', '2023-01-27 00:35:52.47', '2023-01-27 00:35:52.47', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (94, 'plugin::content-manager.explorer.create', 'api::g-session-token.g-session-token', '{"fields": ["token", "account_id"]}', '[]', '2023-01-30 22:50:20.777', '2023-01-30 22:50:20.777', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (95, 'plugin::content-manager.explorer.read', 'api::g-session-token.g-session-token', '{"fields": ["token", "account_id"]}', '[]', '2023-01-30 22:50:20.79', '2023-01-30 22:50:20.79', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (96, 'plugin::content-manager.explorer.update', 'api::g-session-token.g-session-token', '{"fields": ["token", "account_id"]}', '[]', '2023-01-30 22:50:20.793', '2023-01-30 22:50:20.793', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (101, 'plugin::content-manager.explorer.create', 'api::g-configuration.g-configuration', '{"fields": ["name", "value_str"]}', '[]', '2023-01-31 10:56:55.359', '2023-01-31 10:56:55.359', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (102, 'plugin::content-manager.explorer.read', 'api::g-configuration.g-configuration', '{"fields": ["name", "value_str"]}', '[]', '2023-01-31 10:56:55.365', '2023-01-31 10:56:55.365', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (103, 'plugin::content-manager.explorer.update', 'api::g-configuration.g-configuration', '{"fields": ["name", "value_str"]}', '[]', '2023-01-31 10:56:55.369', '2023-01-31 10:56:55.369', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (104, 'plugin::content-manager.explorer.delete', 'api::g-configuration.g-configuration', '{}', '[]', '2023-01-31 10:56:55.372', '2023-01-31 10:56:55.372', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (108, 'plugin::content-manager.explorer.create', 'api::g-character.g-character', '{"fields": ["name", "max_hp", "current_hp", "exp", "gold", "point", "account_id", "location", "atk", "def", "dex", "lvl"]}', '[]', '2023-01-31 23:25:47.392', '2023-01-31 23:25:47.392', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (109, 'plugin::content-manager.explorer.read', 'api::g-character.g-character', '{"fields": ["name", "max_hp", "current_hp", "exp", "gold", "point", "account_id", "location", "atk", "def", "dex", "lvl"]}', '[]', '2023-01-31 23:25:47.397', '2023-01-31 23:25:47.397', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (110, 'plugin::content-manager.explorer.update', 'api::g-character.g-character', '{"fields": ["name", "max_hp", "current_hp", "exp", "gold", "point", "account_id", "location", "atk", "def", "dex", "lvl"]}', '[]', '2023-01-31 23:25:47.401', '2023-01-31 23:25:47.401', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (111, 'plugin::content-manager.explorer.create', 'api::g-account.g-account', '{"fields": ["user_name", "is_member", "meta_data", "sub"]}', '[]', '2023-01-31 23:26:58.049', '2023-01-31 23:26:58.049', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (112, 'plugin::content-manager.explorer.read', 'api::g-account.g-account', '{"fields": ["user_name", "is_member", "meta_data", "sub"]}', '[]', '2023-01-31 23:26:58.057', '2023-01-31 23:26:58.057', NULL, NULL);
INSERT INTO public.admin_permissions VALUES (113, 'plugin::content-manager.explorer.update', 'api::g-account.g-account', '{"fields": ["user_name", "is_member", "meta_data", "sub"]}', '[]', '2023-01-31 23:26:58.061', '2023-01-31 23:26:58.061', NULL, NULL);


--
-- TOC entry 3709 (class 0 OID 17962)
-- Dependencies: 216
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_permissions_role_links VALUES (1, 1, 2, 1);
INSERT INTO public.admin_permissions_role_links VALUES (2, 2, 2, 2);
INSERT INTO public.admin_permissions_role_links VALUES (3, 3, 2, 3);
INSERT INTO public.admin_permissions_role_links VALUES (4, 4, 2, 4);
INSERT INTO public.admin_permissions_role_links VALUES (5, 5, 2, 5);
INSERT INTO public.admin_permissions_role_links VALUES (6, 6, 2, 6);
INSERT INTO public.admin_permissions_role_links VALUES (7, 7, 3, 1);
INSERT INTO public.admin_permissions_role_links VALUES (8, 8, 3, 2);
INSERT INTO public.admin_permissions_role_links VALUES (9, 9, 3, 3);
INSERT INTO public.admin_permissions_role_links VALUES (10, 10, 3, 4);
INSERT INTO public.admin_permissions_role_links VALUES (11, 11, 3, 5);
INSERT INTO public.admin_permissions_role_links VALUES (12, 12, 3, 6);
INSERT INTO public.admin_permissions_role_links VALUES (13, 13, 1, 1);
INSERT INTO public.admin_permissions_role_links VALUES (14, 14, 1, 2);
INSERT INTO public.admin_permissions_role_links VALUES (15, 15, 1, 3);
INSERT INTO public.admin_permissions_role_links VALUES (16, 16, 1, 4);
INSERT INTO public.admin_permissions_role_links VALUES (17, 17, 1, 5);
INSERT INTO public.admin_permissions_role_links VALUES (18, 18, 1, 6);
INSERT INTO public.admin_permissions_role_links VALUES (19, 19, 1, 7);
INSERT INTO public.admin_permissions_role_links VALUES (20, 20, 1, 8);
INSERT INTO public.admin_permissions_role_links VALUES (21, 21, 1, 9);
INSERT INTO public.admin_permissions_role_links VALUES (22, 22, 1, 10);
INSERT INTO public.admin_permissions_role_links VALUES (23, 23, 1, 11);
INSERT INTO public.admin_permissions_role_links VALUES (24, 24, 1, 12);
INSERT INTO public.admin_permissions_role_links VALUES (25, 25, 1, 13);
INSERT INTO public.admin_permissions_role_links VALUES (26, 26, 1, 14);
INSERT INTO public.admin_permissions_role_links VALUES (27, 27, 1, 15);
INSERT INTO public.admin_permissions_role_links VALUES (28, 28, 1, 16);
INSERT INTO public.admin_permissions_role_links VALUES (29, 29, 1, 17);
INSERT INTO public.admin_permissions_role_links VALUES (30, 30, 1, 18);
INSERT INTO public.admin_permissions_role_links VALUES (31, 31, 1, 19);
INSERT INTO public.admin_permissions_role_links VALUES (32, 32, 1, 20);
INSERT INTO public.admin_permissions_role_links VALUES (33, 33, 1, 21);
INSERT INTO public.admin_permissions_role_links VALUES (34, 34, 1, 22);
INSERT INTO public.admin_permissions_role_links VALUES (35, 35, 1, 23);
INSERT INTO public.admin_permissions_role_links VALUES (36, 36, 1, 24);
INSERT INTO public.admin_permissions_role_links VALUES (37, 37, 1, 25);
INSERT INTO public.admin_permissions_role_links VALUES (38, 38, 1, 26);
INSERT INTO public.admin_permissions_role_links VALUES (39, 39, 1, 27);
INSERT INTO public.admin_permissions_role_links VALUES (40, 40, 1, 28);
INSERT INTO public.admin_permissions_role_links VALUES (41, 41, 1, 29);
INSERT INTO public.admin_permissions_role_links VALUES (42, 42, 1, 30);
INSERT INTO public.admin_permissions_role_links VALUES (43, 43, 1, 31);
INSERT INTO public.admin_permissions_role_links VALUES (44, 44, 1, 32);
INSERT INTO public.admin_permissions_role_links VALUES (45, 45, 1, 33);
INSERT INTO public.admin_permissions_role_links VALUES (46, 46, 1, 34);
INSERT INTO public.admin_permissions_role_links VALUES (47, 47, 1, 35);
INSERT INTO public.admin_permissions_role_links VALUES (48, 48, 1, 36);
INSERT INTO public.admin_permissions_role_links VALUES (49, 49, 1, 37);
INSERT INTO public.admin_permissions_role_links VALUES (50, 50, 1, 38);
INSERT INTO public.admin_permissions_role_links VALUES (51, 51, 1, 39);
INSERT INTO public.admin_permissions_role_links VALUES (52, 52, 1, 40);
INSERT INTO public.admin_permissions_role_links VALUES (53, 53, 1, 41);
INSERT INTO public.admin_permissions_role_links VALUES (54, 54, 1, 42);
INSERT INTO public.admin_permissions_role_links VALUES (55, 55, 1, 43);
INSERT INTO public.admin_permissions_role_links VALUES (56, 56, 1, 44);
INSERT INTO public.admin_permissions_role_links VALUES (57, 57, 1, 45);
INSERT INTO public.admin_permissions_role_links VALUES (58, 58, 1, 46);
INSERT INTO public.admin_permissions_role_links VALUES (59, 59, 1, 47);
INSERT INTO public.admin_permissions_role_links VALUES (60, 60, 1, 48);
INSERT INTO public.admin_permissions_role_links VALUES (61, 61, 1, 49);
INSERT INTO public.admin_permissions_role_links VALUES (62, 62, 1, 50);
INSERT INTO public.admin_permissions_role_links VALUES (63, 63, 1, 51);
INSERT INTO public.admin_permissions_role_links VALUES (64, 64, 1, 52);
INSERT INTO public.admin_permissions_role_links VALUES (65, 65, 1, 53);
INSERT INTO public.admin_permissions_role_links VALUES (73, 73, 1, 61);
INSERT INTO public.admin_permissions_role_links VALUES (77, 77, 1, 65);
INSERT INTO public.admin_permissions_role_links VALUES (78, 78, 1, 66);
INSERT INTO public.admin_permissions_role_links VALUES (79, 79, 1, 67);
INSERT INTO public.admin_permissions_role_links VALUES (80, 80, 1, 68);
INSERT INTO public.admin_permissions_role_links VALUES (81, 81, 1, 69);
INSERT INTO public.admin_permissions_role_links VALUES (82, 82, 1, 70);
INSERT INTO public.admin_permissions_role_links VALUES (83, 83, 1, 71);
INSERT INTO public.admin_permissions_role_links VALUES (84, 84, 1, 72);
INSERT INTO public.admin_permissions_role_links VALUES (85, 85, 1, 73);
INSERT INTO public.admin_permissions_role_links VALUES (86, 86, 1, 74);
INSERT INTO public.admin_permissions_role_links VALUES (87, 87, 1, 75);
INSERT INTO public.admin_permissions_role_links VALUES (88, 88, 1, 76);
INSERT INTO public.admin_permissions_role_links VALUES (89, 89, 1, 77);
INSERT INTO public.admin_permissions_role_links VALUES (93, 93, 1, 81);
INSERT INTO public.admin_permissions_role_links VALUES (94, 94, 1, 82);
INSERT INTO public.admin_permissions_role_links VALUES (95, 95, 1, 83);
INSERT INTO public.admin_permissions_role_links VALUES (96, 96, 1, 84);
INSERT INTO public.admin_permissions_role_links VALUES (101, 101, 1, 85);
INSERT INTO public.admin_permissions_role_links VALUES (102, 102, 1, 86);
INSERT INTO public.admin_permissions_role_links VALUES (103, 103, 1, 87);
INSERT INTO public.admin_permissions_role_links VALUES (104, 104, 1, 88);
INSERT INTO public.admin_permissions_role_links VALUES (108, 108, 1, 92);
INSERT INTO public.admin_permissions_role_links VALUES (109, 109, 1, 93);
INSERT INTO public.admin_permissions_role_links VALUES (110, 110, 1, 94);
INSERT INTO public.admin_permissions_role_links VALUES (111, 111, 1, 95);
INSERT INTO public.admin_permissions_role_links VALUES (112, 112, 1, 96);
INSERT INTO public.admin_permissions_role_links VALUES (113, 113, 1, 97);


--
-- TOC entry 3711 (class 0 OID 17966)
-- Dependencies: 218
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_roles VALUES (1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2023-01-26 21:31:26.5', '2023-01-26 21:31:26.5', NULL, NULL);
INSERT INTO public.admin_roles VALUES (2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2023-01-26 21:31:26.509', '2023-01-26 21:31:26.509', NULL, NULL);
INSERT INTO public.admin_roles VALUES (3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2023-01-26 21:31:26.512', '2023-01-26 21:31:26.512', NULL, NULL);


--
-- TOC entry 3713 (class 0 OID 17972)
-- Dependencies: 220
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users VALUES (1, 'ad', 'min', NULL, 'superadmin@gmail.com', '$2a$10$i5RgmV/9Kvsx1kMIARZ9zu0Hw/tDqUZUXn2OK2GTsDbLQ4DMFJsHC', NULL, NULL, true, false, NULL, '2023-01-26 21:31:53.624', '2023-01-26 21:31:53.624', NULL, NULL);


--
-- TOC entry 3715 (class 0 OID 17978)
-- Dependencies: 222
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_users_roles_links VALUES (1, 1, 1, 1, 1);


--
-- TOC entry 3717 (class 0 OID 17982)
-- Dependencies: 224
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3718 (class 0 OID 17987)
-- Dependencies: 225
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3721 (class 0 OID 17992)
-- Dependencies: 228
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3723 (class 0 OID 17998)
-- Dependencies: 230
-- Data for Name: g_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.g_accounts VALUES (7, 'hunganhly2208', false, '2023-02-05 15:34:58.91', '2023-02-05 15:34:58.91', NULL, NULL, '{"given_name":"H??ng Anh","family_name":"L??","nickname":"hunganhly2208","name":"H??ng Anh L??","picture":"https://lh3.googleusercontent.com/a/AEdFTp6t07VQFCqi39qcKyzxk9ib36iEqgn8StXyTbyiBw=s96-c","locale":"vi","updated_at":"2023-02-05T15:34:55.824Z","sub":"google-oauth2|103603845299296538621","sid":"kBC0k-4ugdKKurZlAcFUtsTVTME6oH_U"}', 'google-oauth2|103603845299296538621');
INSERT INTO public.g_accounts VALUES (8, 'hunganhly2208', false, '2023-02-05 15:35:41.867', '2023-02-05 15:35:41.867', NULL, NULL, '{"nickname":"hunganhly2208","name":"hunganhly2208@gmail.com","picture":"https://s.gravatar.com/avatar/0b5cbea203cc636680ba26a1599c7778?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fhu.png","updated_at":"2023-02-05T15:35:38.922Z","sub":"auth0|63d93d32263160d5468ffea9","sid":"9l--N3rXrswWTiiFoBKRFBVoEFBDS0_V"}', 'auth0|63d93d32263160d5468ffea9');


--
-- TOC entry 3725 (class 0 OID 18004)
-- Dependencies: 232
-- Data for Name: g_characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.g_characters VALUES (5, 'user 1675611298941', '75', '75', '1000', 0, 1, '1', '2023-02-05 15:34:58.941', '2023-02-05 15:34:58.941', NULL, NULL, '0', 7, 0, 0, 0);
INSERT INTO public.g_characters VALUES (6, 'user 1675611341881', '75', '75', '1127', 0, 1, '1', '2023-02-05 15:35:41.881', '2023-02-05 15:35:41.881', NULL, NULL, '62', 8, 0, 0, 0);


--
-- TOC entry 3727 (class 0 OID 18010)
-- Dependencies: 234
-- Data for Name: g_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.g_configurations VALUES (1, 'char_base_hp', '70', '2023-01-31 10:57:17.419', '2023-01-31 10:57:17.419', 1, 1);
INSERT INTO public.g_configurations VALUES (2, 'char_base_exp', '50', '2023-01-31 10:57:35.444', '2023-01-31 10:57:35.444', 1, 1);
INSERT INTO public.g_configurations VALUES (3, 'char_point_per_lvl', '2', '2023-01-31 10:57:56.317', '2023-01-31 10:57:56.317', 1, 1);
INSERT INTO public.g_configurations VALUES (4, 'reward_gold_min', '1.3', '2023-01-31 10:58:23.77', '2023-01-31 10:58:23.77', 1, 1);
INSERT INTO public.g_configurations VALUES (5, 'reward_gold_max', '2', '2023-01-31 10:58:39.285', '2023-01-31 10:58:39.285', 1, 1);
INSERT INTO public.g_configurations VALUES (6, 'reward_exp_min', '14', '2023-01-31 10:58:54.216', '2023-01-31 10:58:54.216', 1, 1);
INSERT INTO public.g_configurations VALUES (7, 'reward_exp_max', '16', '2023-01-31 10:59:17.645', '2023-01-31 10:59:17.645', 1, 1);
INSERT INTO public.g_configurations VALUES (8, 'monster_extra_gold', '4', '2023-01-31 22:33:52.08', '2023-01-31 22:33:52.08', 1, 1);
INSERT INTO public.g_configurations VALUES (9, 'wait_time_min', '2000', '2023-01-31 22:37:40.115', '2023-01-31 22:37:40.115', 1, 1);
INSERT INTO public.g_configurations VALUES (10, 'wait_time_max', '7000', '2023-01-31 22:37:49.822', '2023-01-31 22:37:49.822', 1, 1);


--
-- TOC entry 3729 (class 0 OID 18016)
-- Dependencies: 236
-- Data for Name: g_formulas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3731 (class 0 OID 18022)
-- Dependencies: 238
-- Data for Name: g_session_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3733 (class 0 OID 18026)
-- Dependencies: 240
-- Data for Name: g_travel_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.g_travel_logs VALUES (1, 'let''s go', 'take your next step', 2510, 13, 5, 'text', NULL, 'xxxxx/xxx/xxx.png', 1, NULL, '2023-01-31 23:53:36.95', NULL, 1);
INSERT INTO public.g_travel_logs VALUES (2, 'let''s go', 'take your next step', 2386, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:49:30.066', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (3, 'let''s go', 'take your next step', 3183, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:10.325', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (4, 'hello', 'take your next step', 2466, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:26.636', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (5, 'hello', 'take your next step', 4233, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:28.793', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (6, 'hello', 'take your next step', 5098, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:31.781', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (7, 'hello', 'take your next step', 3522, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:33.113', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (8, 'hello', 'take your next step', 3524, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:34.509', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (9, 'let''s go', 'take your next step', 2680, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:51:35.971', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (10, 'hello', 'take your next step', 6706, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:53:36.08', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (11, 'let''s go', 'take your next step', 5114, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:55:12.695', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (12, 'hello', 'take your next step', 4663, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:56:43.832', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (13, 'let''s go', 'take your next step', 6822, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:57:05.703', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (14, 'hello', 'take your next step', 5822, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:57:24.327', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (15, 'let''s go', 'take your next step', 4019, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:58:42.121', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (16, 'hello', 'take your next step', 6843, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:59:09.427', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (17, 'let''s go', 'take your next step', 6279, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:59:22.036', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (18, 'let''s go', 'take your next step', 3596, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 15:59:23.902', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (19, 'hello', 'take your next step', 4852, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:01:10.54', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (20, 'hello', 'take your next step', 2059, 9, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:01:34.616', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (21, 'hello', 'take your next step', 3924, 9, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:03:11.833', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (22, 'let''s go', 'take your next step', 6258, 8, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:03:17.706', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (23, 'let''s go', 'take your next step', 5650, 6, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:03:19.528', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (24, 'let''s go', 'take your next step', 2816, 7, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:03:21.097', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (25, 'let''s go', 'take your next step', 6713, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:05:59.544', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (26, 'let''s go', 'take your next step', 4282, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:06:47.33', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (27, 'hello', 'take your next step', 2023, 9, 7, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:11.507', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (28, 'hello', 'take your next step', 5963, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:44.762', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (29, 'let''s go', 'take your next step', 6918, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:45.998', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (30, 'let''s go', 'take your next step', 5307, 9, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:47.593', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (31, 'hello', 'take your next step', 3536, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:52.552', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (32, 'let''s go', 'take your next step', 2322, 8, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:54.509', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (33, 'hello', 'take your next step', 4237, 8, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:56.254', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (34, 'let''s go', 'take your next step', 6003, 6, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:57.774', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (35, 'let''s go', 'take your next step', 2970, 9, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:07:59.317', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (36, 'let''s go', 'take your next step', 5632, 8, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:00.87', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (37, 'hello', 'take your next step', 6391, 7, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:14.153', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (38, 'let''s go', 'take your next step', 3046, 9, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:15.121', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (39, 'hello', 'take your next step', 3571, 9, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:15.997', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (40, 'let''s go', 'take your next step', 5986, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:16.968', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (41, 'hello', 'take your next step', 6684, 0, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:17.829', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (42, 'hello', 'take your next step', 3171, 0, 6, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:18.642', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (43, 'let''s go', 'take your next step', 5342, 6, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:19.548', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (44, 'let''s go', 'take your next step', 4816, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:20.642', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (45, 'let''s go', 'take your next step', 6263, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:21.598', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (46, 'let''s go', 'take your next step', 6406, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:22.361', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (47, 'let''s go', 'take your next step', 5182, 0, 7, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:23.155', NULL, NULL, NULL);
INSERT INTO public.g_travel_logs VALUES (48, 'let''s go', 'take your next step', 2446, 0, 0, 'text', NULL, 'xxxxx/xxx/xxx.png', 6, '2023-02-05 16:08:25.097', NULL, NULL, NULL);


--
-- TOC entry 3735 (class 0 OID 18032)
-- Dependencies: 242
-- Data for Name: g_travel_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.g_travel_texts VALUES (1, 'hello', '2023-01-26 23:58:21.654', '2023-01-26 23:58:21.654', 1, 1);
INSERT INTO public.g_travel_texts VALUES (2, 'let''s go', '2023-01-26 23:58:35.614', '2023-01-26 23:58:35.614', 1, 1);
INSERT INTO public.g_travel_texts VALUES (3, 'next step', '2023-01-26 23:58:52.632', '2023-01-26 23:58:52.632', 1, 1);


--
-- TOC entry 3737 (class 0 OID 18038)
-- Dependencies: 244
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.i18n_locale VALUES (1, 'English (en)', 'en', '2023-01-26 21:31:26.422', '2023-01-26 21:31:26.422', NULL, NULL);


--
-- TOC entry 3739 (class 0 OID 18044)
-- Dependencies: 246
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3741 (class 0 OID 18048)
-- Dependencies: 248
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3743 (class 0 OID 18052)
-- Dependencies: 250
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3745 (class 0 OID 18058)
-- Dependencies: 252
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_core_store_settings VALUES (2, 'plugin_content_manager_configuration_content_types::admin::permission', '{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (3, 'plugin_content_manager_configuration_content_types::admin::role', '{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (4, 'plugin_content_manager_configuration_content_types::admin::api-token', '{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (5, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (6, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (8, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (1, 'strapi_content_types_schema', '{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"api::g-account.g-account":{"kind":"collectionType","collectionName":"g_accounts","info":{"singularName":"g-account","pluralName":"g-accounts","displayName":"g_account","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user_name":{"type":"email","required":true,"unique":true},"is_member":{"type":"boolean","default":false,"required":false},"meta_data":{"type":"text","required":true},"sub":{"type":"string","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_accounts","info":{"singularName":"g-account","pluralName":"g-accounts","displayName":"g_account","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user_name":{"type":"email","required":true,"unique":true},"is_member":{"type":"boolean","default":false,"required":false},"meta_data":{"type":"text","required":true},"sub":{"type":"string","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-account","connection":"default","uid":"api::g-account.g-account","apiName":"g-account","globalId":"GAccount","actions":{},"lifecycles":{}},"api::g-character.g-character":{"kind":"collectionType","collectionName":"g_characters","info":{"singularName":"g-character","pluralName":"g-characters","displayName":"g_character","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"maxLength":15,"minLength":5,"unique":true},"max_hp":{"type":"string","default":"200"},"current_hp":{"type":"string","default":"200"},"exp":{"type":"string","default":"0"},"gold":{"type":"string","default":"1000"},"point":{"type":"integer","default":0},"account_id":{"type":"integer","required":true},"location":{"type":"integer","required":true,"default":1},"atk":{"type":"integer","required":true,"default":10},"def":{"type":"integer","default":10,"required":true},"dex":{"type":"integer","default":10,"required":true},"lvl":{"type":"string","default":"1","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_characters","info":{"singularName":"g-character","pluralName":"g-characters","displayName":"g_character","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"maxLength":15,"minLength":5,"unique":true},"max_hp":{"type":"string","default":"200"},"current_hp":{"type":"string","default":"200"},"exp":{"type":"string","default":"0"},"gold":{"type":"string","default":"1000"},"point":{"type":"integer","default":0},"account_id":{"type":"integer","required":true},"location":{"type":"integer","required":true,"default":1},"atk":{"type":"integer","required":true,"default":10},"def":{"type":"integer","default":10,"required":true},"dex":{"type":"integer","default":10,"required":true},"lvl":{"type":"string","default":"1","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-character","connection":"default","uid":"api::g-character.g-character","apiName":"g-character","globalId":"GCharacter","actions":{},"lifecycles":{}},"api::g-configuration.g-configuration":{"kind":"collectionType","collectionName":"g_configurations","info":{"singularName":"g-configuration","pluralName":"g-configurations","displayName":"g_configuration"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"unique":true},"value_str":{"type":"string","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_configurations","info":{"singularName":"g-configuration","pluralName":"g-configurations","displayName":"g_configuration"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true,"unique":true},"value_str":{"type":"string","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-configuration","connection":"default","uid":"api::g-configuration.g-configuration","apiName":"g-configuration","globalId":"GConfiguration","actions":{},"lifecycles":{}},"api::g-formula.g-formula":{"kind":"collectionType","collectionName":"g_formulas","info":{"singularName":"g-formula","pluralName":"g-formulas","displayName":"g_formula"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"format_formula":{"type":"text","required":true},"name_formula":{"type":"string","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_formulas","info":{"singularName":"g-formula","pluralName":"g-formulas","displayName":"g_formula"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"format_formula":{"type":"text","required":true},"name_formula":{"type":"string","required":true,"unique":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-formula","connection":"default","uid":"api::g-formula.g-formula","apiName":"g-formula","globalId":"GFormula","actions":{},"lifecycles":{}},"api::g-session-token.g-session-token":{"kind":"collectionType","collectionName":"g_session_tokens","info":{"singularName":"g-session-token","pluralName":"g-session-tokens","displayName":"g_session_token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"token":{"type":"string","required":true},"account_id":{"type":"integer","required":true,"unique":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_session_tokens","info":{"singularName":"g-session-token","pluralName":"g-session-tokens","displayName":"g_session_token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"token":{"type":"string","required":true},"account_id":{"type":"integer","required":true,"unique":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-session-token","connection":"default","uid":"api::g-session-token.g-session-token","apiName":"g-session-token","globalId":"GSessionToken","actions":{},"lifecycles":{}},"api::g-travel-log.g-travel-log":{"kind":"collectionType","collectionName":"g_travel_logs","info":{"singularName":"g-travel-log","pluralName":"g-travel-logs","displayName":"g_travel_log"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"text":{"type":"text","required":true},"heading":{"type":"string","required":true},"wait_length":{"type":"integer","required":true,"min":2000},"reward_gold":{"type":"integer","default":0},"reward_exp":{"type":"integer","default":0},"step_type":{"type":"string","required":true},"item":{"type":"text"},"travel_background":{"type":"string","required":true},"char_id":{"type":"integer","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_travel_logs","info":{"singularName":"g-travel-log","pluralName":"g-travel-logs","displayName":"g_travel_log"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"text":{"type":"text","required":true},"heading":{"type":"string","required":true},"wait_length":{"type":"integer","required":true,"min":2000},"reward_gold":{"type":"integer","default":0},"reward_exp":{"type":"integer","default":0},"step_type":{"type":"string","required":true},"item":{"type":"text"},"travel_background":{"type":"string","required":true},"char_id":{"type":"integer","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-travel-log","connection":"default","uid":"api::g-travel-log.g-travel-log","apiName":"g-travel-log","globalId":"GTravelLog","actions":{},"lifecycles":{}},"api::g-travel-text.g-travel-text":{"kind":"collectionType","collectionName":"g_travel_texts","info":{"singularName":"g-travel-text","pluralName":"g-travel-texts","displayName":"g_travel_text"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"text","required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"g_travel_texts","info":{"singularName":"g-travel-text","pluralName":"g-travel-texts","displayName":"g_travel_text"},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"content":{"type":"text","required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"g-travel-text","connection":"default","uid":"api::g-travel-text.g-travel-text","apiName":"g-travel-text","globalId":"GTravelText","actions":{},"lifecycles":{}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (7, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (10, 'plugin_content_manager_configuration_content_types::admin::user', '{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (11, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (9, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (12, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (13, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (14, 'plugin_upload_view_configuration', '{"pageSize":10,"sort":"createdAt:DESC"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (29, 'plugin_content_manager_configuration_content_types::api::g-configuration.g-configuration', '{"uid":"api::g-configuration.g-configuration","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"value_str":{"edit":{"label":"value_str","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"value_str","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","value_str","createdAt"],"edit":[[{"name":"name","size":6},{"name":"value_str","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (16, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (17, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\n\n<p>But don???t worry! You can use the following link to reset your password:</p>\n<p><%= URL %>?code=<%= TOKEN %></p>\n\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\n\n<p>You have to confirm your email address. Please click on the link below.</p>\n\n<p><%= URL %>?confirmation=<%= CODE %></p>\n\n<p>Thanks.</p>"}}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (18, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (19, 'plugin_i18n_default_locale', '"en"', 'string', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (15, 'plugin_upload_metrics', '{"weeklySchedule":"26 36 21 * * 4","lastWeeklyUpdate":1674743786025}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (20, 'core_admin_auth', '{"providers":{"autoRegister":false,"defaultRole":null}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (25, 'plugin_content_manager_configuration_content_types::api::g-formula.g-formula', '{"uid":"api::g-formula.g-formula","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name_formula","defaultSortBy":"name_formula","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"format_formula":{"edit":{"label":"format_formula","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"format_formula","searchable":true,"sortable":true}},"name_formula":{"edit":{"label":"name_formula","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name_formula","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","format_formula","name_formula","createdAt"],"edit":[[{"name":"format_formula","size":6},{"name":"name_formula","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (26, 'plugin_content_manager_configuration_content_types::api::g-travel-text.g-travel-text', '{"uid":"api::g-travel-text.g-travel-text","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","content","createdAt","updatedAt"],"edit":[[{"name":"content","size":6}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (27, 'plugin_content_manager_configuration_content_types::api::g-session-token.g-session-token', '{"uid":"api::g-session-token.g-session-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"token","defaultSortBy":"token","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"token","searchable":true,"sortable":true}},"account_id":{"edit":{"label":"account_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"account_id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","token","createdAt","updatedAt"],"edit":[[{"name":"token","size":6},{"name":"account_id","size":4}]]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (23, 'plugin_content_manager_configuration_content_types::api::g-character.g-character', '{"uid":"api::g-character.g-character","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"max_hp":{"edit":{"label":"max_hp","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"max_hp","searchable":true,"sortable":true}},"current_hp":{"edit":{"label":"current_hp","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"current_hp","searchable":true,"sortable":true}},"exp":{"edit":{"label":"exp","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"exp","searchable":true,"sortable":true}},"gold":{"edit":{"label":"gold","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gold","searchable":true,"sortable":true}},"point":{"edit":{"label":"point","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"point","searchable":true,"sortable":true}},"account_id":{"edit":{"label":"account_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"account_id","searchable":true,"sortable":true}},"location":{"edit":{"label":"location","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"location","searchable":true,"sortable":true}},"atk":{"edit":{"label":"atk","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"atk","searchable":true,"sortable":true}},"def":{"edit":{"label":"def","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"def","searchable":true,"sortable":true}},"dex":{"edit":{"label":"dex","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"dex","searchable":true,"sortable":true}},"lvl":{"edit":{"label":"lvl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lvl","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"name","size":6},{"name":"max_hp","size":6}],[{"name":"current_hp","size":6}],[{"name":"gold","size":6},{"name":"point","size":4}],[{"name":"location","size":4}],[{"name":"lvl","size":6},{"name":"exp","size":6}],[{"name":"account_id","size":4},{"name":"atk","size":4},{"name":"def","size":4}],[{"name":"dex","size":4}]],"list":["id","name","max_hp","current_hp","createdAt"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (24, 'plugin_content_manager_configuration_content_types::api::g-travel-log.g-travel-log', '{"uid":"api::g-travel-log.g-travel-log","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"heading","defaultSortBy":"heading","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"text":{"edit":{"label":"text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"text","searchable":true,"sortable":true}},"heading":{"edit":{"label":"heading","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"heading","searchable":true,"sortable":true}},"wait_length":{"edit":{"label":"wait_length","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"wait_length","searchable":true,"sortable":true}},"reward_gold":{"edit":{"label":"reward_gold","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"reward_gold","searchable":true,"sortable":true}},"reward_exp":{"edit":{"label":"reward_exp","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"reward_exp","searchable":true,"sortable":true}},"step_type":{"edit":{"label":"step_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"step_type","searchable":true,"sortable":true}},"item":{"edit":{"label":"item","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"item","searchable":true,"sortable":true}},"travel_background":{"edit":{"label":"travel_background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"travel_background","searchable":true,"sortable":true}},"char_id":{"edit":{"label":"char_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"char_id","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"text","size":6},{"name":"heading","size":6}],[{"name":"wait_length","size":4},{"name":"reward_gold","size":4},{"name":"reward_exp","size":4}],[{"name":"step_type","size":6},{"name":"item","size":6}],[{"name":"travel_background","size":6},{"name":"char_id","size":4}]],"list":["char_id","text","heading","wait_length","item","reward_exp","reward_gold","step_type"]}}', 'object', NULL, NULL);
INSERT INTO public.strapi_core_store_settings VALUES (22, 'plugin_content_manager_configuration_content_types::api::g-account.g-account', '{"uid":"api::g-account.g-account","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"user_name":{"edit":{"label":"user_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"user_name","searchable":true,"sortable":true}},"is_member":{"edit":{"label":"is_member","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"is_member","searchable":true,"sortable":true}},"meta_data":{"edit":{"label":"meta_data","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"meta_data","searchable":true,"sortable":true}},"sub":{"edit":{"label":"sub","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sub","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","user_name","is_member","createdAt"],"edit":[[{"name":"user_name","size":6}],[{"name":"is_member","size":4},{"name":"meta_data","size":6}],[{"name":"sub","size":6}]]}}', 'object', NULL, NULL);


--
-- TOC entry 3747 (class 0 OID 18064)
-- Dependencies: 254
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.strapi_database_schema VALUES (16, '{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_accounts","indexes":[{"name":"g_accounts_created_by_id_fk","columns":["created_by_id"]},{"name":"g_accounts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_accounts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_accounts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_member","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"meta_data","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sub","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_characters","indexes":[{"name":"g_characters_created_by_id_fk","columns":["created_by_id"]},{"name":"g_characters_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_characters_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_characters_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"max_hp","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"current_hp","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"exp","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"gold","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"point","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"account_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"location","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"atk","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"def","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"dex","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lvl","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_configurations","indexes":[{"name":"g_configurations_created_by_id_fk","columns":["created_by_id"]},{"name":"g_configurations_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_configurations_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_configurations_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value_str","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_formulas","indexes":[{"name":"g_formulas_created_by_id_fk","columns":["created_by_id"]},{"name":"g_formulas_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_formulas_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_formulas_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"format_formula","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name_formula","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_session_tokens","indexes":[{"name":"g_session_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"g_session_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_session_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_session_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"account_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_travel_logs","indexes":[{"name":"g_travel_logs_created_by_id_fk","columns":["created_by_id"]},{"name":"g_travel_logs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_travel_logs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_travel_logs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"heading","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"wait_length","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reward_gold","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reward_exp","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"step_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"item","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"travel_background","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"char_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"g_travel_texts","indexes":[{"name":"g_travel_texts_created_by_id_fk","columns":["created_by_id"]},{"name":"g_travel_texts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"g_travel_texts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"g_travel_texts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}', '2023-01-31 23:26:57.738', 'd24612337f1a7f24db69171b8621ee4f');


--
-- TOC entry 3749 (class 0 OID 18070)
-- Dependencies: 256
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3751 (class 0 OID 18074)
-- Dependencies: 258
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3753 (class 0 OID 18080)
-- Dependencies: 260
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions VALUES (1, 'plugin::users-permissions.user.me', '2023-01-26 21:31:26.389', '2023-01-26 21:31:26.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (2, 'plugin::users-permissions.auth.changePassword', '2023-01-26 21:31:26.389', '2023-01-26 21:31:26.389', NULL, NULL);
INSERT INTO public.up_permissions VALUES (3, 'plugin::users-permissions.auth.callback', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (4, 'plugin::users-permissions.auth.connect', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (5, 'plugin::users-permissions.auth.forgotPassword', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (8, 'plugin::users-permissions.auth.emailConfirmation', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (6, 'plugin::users-permissions.auth.resetPassword', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (9, 'plugin::users-permissions.auth.sendEmailConfirmation', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);
INSERT INTO public.up_permissions VALUES (7, 'plugin::users-permissions.auth.register', '2023-01-26 21:31:26.4', '2023-01-26 21:31:26.4', NULL, NULL);


--
-- TOC entry 3755 (class 0 OID 18084)
-- Dependencies: 262
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_permissions_role_links VALUES (1, 2, 1, 1);
INSERT INTO public.up_permissions_role_links VALUES (2, 1, 1, 1);
INSERT INTO public.up_permissions_role_links VALUES (3, 3, 2, 1);
INSERT INTO public.up_permissions_role_links VALUES (4, 4, 2, 1);
INSERT INTO public.up_permissions_role_links VALUES (5, 9, 2, 2);
INSERT INTO public.up_permissions_role_links VALUES (6, 7, 2, 2);
INSERT INTO public.up_permissions_role_links VALUES (7, 5, 2, 3);
INSERT INTO public.up_permissions_role_links VALUES (8, 8, 2, 3);
INSERT INTO public.up_permissions_role_links VALUES (9, 6, 2, 3);


--
-- TOC entry 3757 (class 0 OID 18088)
-- Dependencies: 264
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.up_roles VALUES (1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2023-01-26 21:31:26.379', '2023-01-26 21:31:26.379', NULL, NULL);
INSERT INTO public.up_roles VALUES (2, 'Public', 'Default role given to unauthenticated user.', 'public', '2023-01-26 21:31:26.383', '2023-01-26 21:31:26.383', NULL, NULL);


--
-- TOC entry 3759 (class 0 OID 18094)
-- Dependencies: 266
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3761 (class 0 OID 18100)
-- Dependencies: 268
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3763 (class 0 OID 18104)
-- Dependencies: 270
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3765 (class 0 OID 18110)
-- Dependencies: 272
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 215
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 113, true);


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 217
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 113, true);


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 221
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 223
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 226
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 227
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 1, false);


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 229
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1, false);


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 231
-- Name: g_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_accounts_id_seq', 8, true);


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 233
-- Name: g_characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_characters_id_seq', 6, true);


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 235
-- Name: g_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_configurations_id_seq', 10, true);


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 237
-- Name: g_formulas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_formulas_id_seq', 1, false);


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 239
-- Name: g_session_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_session_tokens_id_seq', 1, false);


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 241
-- Name: g_travel_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_travel_logs_id_seq', 48, true);


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 243
-- Name: g_travel_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.g_travel_texts_id_seq', 3, true);


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 245
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 247
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 249
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 251
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 253
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 29, true);


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 255
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 16, true);


--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 257
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 259
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 261
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);


--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 263
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 9, true);


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 265
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 267
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 269
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 271
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 273
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- TOC entry 3373 (class 2606 OID 18147)
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3379 (class 2606 OID 18149)
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3381 (class 2606 OID 18151)
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- TOC entry 3384 (class 2606 OID 18153)
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 18155)
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 18157)
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 18159)
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- TOC entry 3412 (class 2606 OID 18161)
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 18163)
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- TOC entry 3400 (class 2606 OID 18165)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 3417 (class 2606 OID 18167)
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 18169)
-- Name: g_accounts g_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 18171)
-- Name: g_characters g_characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 18173)
-- Name: g_configurations g_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 3432 (class 2606 OID 18175)
-- Name: g_formulas g_formulas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_pkey PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 18177)
-- Name: g_session_tokens g_session_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 18179)
-- Name: g_travel_logs g_travel_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 18181)
-- Name: g_travel_texts g_travel_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_pkey PRIMARY KEY (id);


--
-- TOC entry 3448 (class 2606 OID 18183)
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- TOC entry 3452 (class 2606 OID 18185)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3458 (class 2606 OID 18187)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3460 (class 2606 OID 18189)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- TOC entry 3463 (class 2606 OID 18191)
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3466 (class 2606 OID 18193)
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3468 (class 2606 OID 18195)
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3470 (class 2606 OID 18197)
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3472 (class 2606 OID 18199)
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 18201)
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3481 (class 2606 OID 18203)
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3483 (class 2606 OID 18205)
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- TOC entry 3486 (class 2606 OID 18207)
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3490 (class 2606 OID 18209)
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 18211)
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3498 (class 2606 OID 18213)
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- TOC entry 3511 (class 2606 OID 18215)
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 18217)
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- TOC entry 3501 (class 2606 OID 18219)
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- TOC entry 3503 (class 2606 OID 18221)
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- TOC entry 3505 (class 2606 OID 18223)
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- TOC entry 3371 (class 1259 OID 18224)
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- TOC entry 3375 (class 1259 OID 18225)
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3376 (class 1259 OID 18226)
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- TOC entry 3377 (class 1259 OID 18227)
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- TOC entry 3374 (class 1259 OID 18228)
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- TOC entry 3382 (class 1259 OID 18229)
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- TOC entry 3385 (class 1259 OID 18230)
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- TOC entry 3386 (class 1259 OID 18231)
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- TOC entry 3390 (class 1259 OID 18232)
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- TOC entry 3391 (class 1259 OID 18233)
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- TOC entry 3392 (class 1259 OID 18234)
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- TOC entry 3393 (class 1259 OID 18235)
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- TOC entry 3389 (class 1259 OID 18236)
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- TOC entry 3398 (class 1259 OID 18237)
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- TOC entry 3408 (class 1259 OID 18238)
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- TOC entry 3409 (class 1259 OID 18239)
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- TOC entry 3410 (class 1259 OID 18240)
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- TOC entry 3415 (class 1259 OID 18241)
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- TOC entry 3401 (class 1259 OID 18242)
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- TOC entry 3418 (class 1259 OID 18243)
-- Name: g_accounts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_accounts_created_by_id_fk ON public.g_accounts USING btree (created_by_id);


--
-- TOC entry 3421 (class 1259 OID 18244)
-- Name: g_accounts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_accounts_updated_by_id_fk ON public.g_accounts USING btree (updated_by_id);


--
-- TOC entry 3422 (class 1259 OID 18245)
-- Name: g_characters_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_characters_created_by_id_fk ON public.g_characters USING btree (created_by_id);


--
-- TOC entry 3425 (class 1259 OID 18246)
-- Name: g_characters_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_characters_updated_by_id_fk ON public.g_characters USING btree (updated_by_id);


--
-- TOC entry 3426 (class 1259 OID 18247)
-- Name: g_configurations_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_configurations_created_by_id_fk ON public.g_configurations USING btree (created_by_id);


--
-- TOC entry 3429 (class 1259 OID 18248)
-- Name: g_configurations_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_configurations_updated_by_id_fk ON public.g_configurations USING btree (updated_by_id);


--
-- TOC entry 3430 (class 1259 OID 18249)
-- Name: g_formulas_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_formulas_created_by_id_fk ON public.g_formulas USING btree (created_by_id);


--
-- TOC entry 3433 (class 1259 OID 18250)
-- Name: g_formulas_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_formulas_updated_by_id_fk ON public.g_formulas USING btree (updated_by_id);


--
-- TOC entry 3434 (class 1259 OID 18251)
-- Name: g_session_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_session_tokens_created_by_id_fk ON public.g_session_tokens USING btree (created_by_id);


--
-- TOC entry 3437 (class 1259 OID 18252)
-- Name: g_session_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_session_tokens_updated_by_id_fk ON public.g_session_tokens USING btree (updated_by_id);


--
-- TOC entry 3438 (class 1259 OID 18253)
-- Name: g_travel_logs_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_travel_logs_created_by_id_fk ON public.g_travel_logs USING btree (created_by_id);


--
-- TOC entry 3441 (class 1259 OID 18254)
-- Name: g_travel_logs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_travel_logs_updated_by_id_fk ON public.g_travel_logs USING btree (updated_by_id);


--
-- TOC entry 3442 (class 1259 OID 18255)
-- Name: g_travel_texts_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_travel_texts_created_by_id_fk ON public.g_travel_texts USING btree (created_by_id);


--
-- TOC entry 3445 (class 1259 OID 18256)
-- Name: g_travel_texts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX g_travel_texts_updated_by_id_fk ON public.g_travel_texts USING btree (updated_by_id);


--
-- TOC entry 3446 (class 1259 OID 18257)
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- TOC entry 3449 (class 1259 OID 18258)
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- TOC entry 3450 (class 1259 OID 18259)
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- TOC entry 3454 (class 1259 OID 18260)
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- TOC entry 3455 (class 1259 OID 18261)
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- TOC entry 3456 (class 1259 OID 18262)
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- TOC entry 3453 (class 1259 OID 18263)
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- TOC entry 3461 (class 1259 OID 18264)
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- TOC entry 3464 (class 1259 OID 18265)
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- TOC entry 3473 (class 1259 OID 18266)
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- TOC entry 3477 (class 1259 OID 18267)
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- TOC entry 3478 (class 1259 OID 18268)
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- TOC entry 3479 (class 1259 OID 18269)
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- TOC entry 3476 (class 1259 OID 18270)
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- TOC entry 3484 (class 1259 OID 18271)
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- TOC entry 3487 (class 1259 OID 18272)
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- TOC entry 3488 (class 1259 OID 18273)
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- TOC entry 3492 (class 1259 OID 18274)
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- TOC entry 3493 (class 1259 OID 18275)
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- TOC entry 3494 (class 1259 OID 18276)
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- TOC entry 3491 (class 1259 OID 18277)
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- TOC entry 3402 (class 1259 OID 18278)
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- TOC entry 3403 (class 1259 OID 18279)
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- TOC entry 3404 (class 1259 OID 18280)
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- TOC entry 3405 (class 1259 OID 18281)
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- TOC entry 3406 (class 1259 OID 18282)
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- TOC entry 3407 (class 1259 OID 18283)
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- TOC entry 3499 (class 1259 OID 18284)
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- TOC entry 3507 (class 1259 OID 18285)
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- TOC entry 3508 (class 1259 OID 18286)
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- TOC entry 3509 (class 1259 OID 18287)
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- TOC entry 3506 (class 1259 OID 18288)
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- TOC entry 3514 (class 2606 OID 18289)
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3516 (class 2606 OID 18294)
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3517 (class 2606 OID 18299)
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3515 (class 2606 OID 18304)
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3518 (class 2606 OID 18309)
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3519 (class 2606 OID 18314)
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3520 (class 2606 OID 18319)
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3522 (class 2606 OID 18324)
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- TOC entry 3523 (class 2606 OID 18329)
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3521 (class 2606 OID 18334)
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3524 (class 2606 OID 18339)
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3526 (class 2606 OID 18344)
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 3527 (class 2606 OID 18349)
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3528 (class 2606 OID 18354)
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- TOC entry 3525 (class 2606 OID 18359)
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3529 (class 2606 OID 18364)
-- Name: g_accounts g_accounts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3530 (class 2606 OID 18369)
-- Name: g_accounts g_accounts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3531 (class 2606 OID 18374)
-- Name: g_characters g_characters_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3532 (class 2606 OID 18379)
-- Name: g_characters g_characters_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3533 (class 2606 OID 18384)
-- Name: g_configurations g_configurations_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3534 (class 2606 OID 18389)
-- Name: g_configurations g_configurations_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3535 (class 2606 OID 18394)
-- Name: g_formulas g_formulas_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3536 (class 2606 OID 18399)
-- Name: g_formulas g_formulas_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3537 (class 2606 OID 18404)
-- Name: g_session_tokens g_session_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3538 (class 2606 OID 18409)
-- Name: g_session_tokens g_session_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3539 (class 2606 OID 18414)
-- Name: g_travel_logs g_travel_logs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3540 (class 2606 OID 18419)
-- Name: g_travel_logs g_travel_logs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3541 (class 2606 OID 18424)
-- Name: g_travel_texts g_travel_texts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3542 (class 2606 OID 18429)
-- Name: g_travel_texts g_travel_texts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3543 (class 2606 OID 18434)
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3544 (class 2606 OID 18439)
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3545 (class 2606 OID 18444)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3547 (class 2606 OID 18449)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 18454)
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- TOC entry 3546 (class 2606 OID 18459)
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3549 (class 2606 OID 18464)
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3550 (class 2606 OID 18469)
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3551 (class 2606 OID 18474)
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3553 (class 2606 OID 18479)
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 18484)
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3552 (class 2606 OID 18489)
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3555 (class 2606 OID 18494)
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3556 (class 2606 OID 18499)
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3557 (class 2606 OID 18504)
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3559 (class 2606 OID 18509)
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- TOC entry 3560 (class 2606 OID 18514)
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- TOC entry 3558 (class 2606 OID 18519)
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3561 (class 2606 OID 18524)
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- TOC entry 3563 (class 2606 OID 18529)
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3564 (class 2606 OID 18534)
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- TOC entry 3562 (class 2606 OID 18539)
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


-- Completed on 2023-02-05 23:14:48

--
-- PostgreSQL database dump complete
--

