PGDMP     2                    {            mydb    15.1    15.1 S   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    mydb    DATABASE     o   CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE mydb;
                postgres    false            �            1259    17956    admin_permissions    TABLE     J  CREATE TABLE public.admin_permissions (
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
 %   DROP TABLE public.admin_permissions;
       public         heap    postgres    false            �            1259    17961    admin_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public          postgres    false    214            �           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public          postgres    false    215            �            1259    17962    admin_permissions_role_links    TABLE     �   CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);
 0   DROP TABLE public.admin_permissions_role_links;
       public         heap    postgres    false            �            1259    17965 #   admin_permissions_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.admin_permissions_role_links_id_seq;
       public          postgres    false    216            �           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;
          public          postgres    false    217            �            1259    17966    admin_roles    TABLE     ;  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_roles;
       public         heap    postgres    false            �            1259    17971    admin_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public          postgres    false    218            �           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public          postgres    false    219            �            1259    17972    admin_users    TABLE     B  CREATE TABLE public.admin_users (
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
    DROP TABLE public.admin_users;
       public         heap    postgres    false            �            1259    17977    admin_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public          postgres    false    220            �           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public          postgres    false    221            �            1259    17978    admin_users_roles_links    TABLE     �   CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order integer,
    user_order integer
);
 +   DROP TABLE public.admin_users_roles_links;
       public         heap    postgres    false            �            1259    17981    admin_users_roles_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.admin_users_roles_links_id_seq;
       public          postgres    false    222            �           0    0    admin_users_roles_links_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;
          public          postgres    false    223            �            1259    17982    files    TABLE     �  CREATE TABLE public.files (
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
    DROP TABLE public.files;
       public         heap    postgres    false            �            1259    17987    files_folder_links    TABLE     �   CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order integer
);
 &   DROP TABLE public.files_folder_links;
       public         heap    postgres    false            �            1259    17990    files_folder_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.files_folder_links_id_seq;
       public          postgres    false    225            �           0    0    files_folder_links_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;
          public          postgres    false    226            �            1259    17991    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    224            �           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    227            �            1259    17992    files_related_morphs    TABLE     �   CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);
 (   DROP TABLE public.files_related_morphs;
       public         heap    postgres    false            �            1259    17997    files_related_morphs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.files_related_morphs_id_seq;
       public          postgres    false    228            �           0    0    files_related_morphs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;
          public          postgres    false    229            �            1259    17998 
   g_accounts    TABLE     A  CREATE TABLE public.g_accounts (
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
    DROP TABLE public.g_accounts;
       public         heap    postgres    false            �            1259    18003    g_accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.g_accounts_id_seq;
       public          postgres    false    230            �           0    0    g_accounts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.g_accounts_id_seq OWNED BY public.g_accounts.id;
          public          postgres    false    231            �            1259    18004    g_characters    TABLE       CREATE TABLE public.g_characters (
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
     DROP TABLE public.g_characters;
       public         heap    postgres    false            �            1259    18009    g_characters_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.g_characters_id_seq;
       public          postgres    false    232            �           0    0    g_characters_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.g_characters_id_seq OWNED BY public.g_characters.id;
          public          postgres    false    233            �            1259    18010    g_configurations    TABLE       CREATE TABLE public.g_configurations (
    id integer NOT NULL,
    name character varying(255),
    value_str character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 $   DROP TABLE public.g_configurations;
       public         heap    postgres    false            �            1259    18015    g_configurations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.g_configurations_id_seq;
       public          postgres    false    234            �           0    0    g_configurations_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.g_configurations_id_seq OWNED BY public.g_configurations.id;
          public          postgres    false    235            �            1259    18016 
   g_formulas    TABLE       CREATE TABLE public.g_formulas (
    id integer NOT NULL,
    format_formula text,
    name_formula character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.g_formulas;
       public         heap    postgres    false            �            1259    18021    g_formulas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_formulas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.g_formulas_id_seq;
       public          postgres    false    236            �           0    0    g_formulas_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.g_formulas_id_seq OWNED BY public.g_formulas.id;
          public          postgres    false    237            �            1259    18022    g_session_tokens    TABLE       CREATE TABLE public.g_session_tokens (
    id integer NOT NULL,
    token character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    account_id integer
);
 $   DROP TABLE public.g_session_tokens;
       public         heap    postgres    false            �            1259    18025    g_session_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_session_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.g_session_tokens_id_seq;
       public          postgres    false    238            �           0    0    g_session_tokens_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.g_session_tokens_id_seq OWNED BY public.g_session_tokens.id;
          public          postgres    false    239            �            1259    18026    g_travel_logs    TABLE     �  CREATE TABLE public.g_travel_logs (
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
 !   DROP TABLE public.g_travel_logs;
       public         heap    postgres    false            �            1259    18031    g_travel_logs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_travel_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.g_travel_logs_id_seq;
       public          postgres    false    240            �           0    0    g_travel_logs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.g_travel_logs_id_seq OWNED BY public.g_travel_logs.id;
          public          postgres    false    241            �            1259    18032    g_travel_texts    TABLE     �   CREATE TABLE public.g_travel_texts (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.g_travel_texts;
       public         heap    postgres    false            �            1259    18037    g_travel_texts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.g_travel_texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.g_travel_texts_id_seq;
       public          postgres    false    242            �           0    0    g_travel_texts_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.g_travel_texts_id_seq OWNED BY public.g_travel_texts.id;
          public          postgres    false    243            �            1259    18038    i18n_locale    TABLE       CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.i18n_locale;
       public         heap    postgres    false            �            1259    18043    i18n_locale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public          postgres    false    244            �           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public          postgres    false    245            �            1259    18044    strapi_api_token_permissions    TABLE       CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 0   DROP TABLE public.strapi_api_token_permissions;
       public         heap    postgres    false            �            1259    18047 #   strapi_api_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strapi_api_token_permissions_id_seq;
       public          postgres    false    246            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;
          public          postgres    false    247            �            1259    18048 (   strapi_api_token_permissions_token_links    TABLE     �   CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order integer
);
 <   DROP TABLE public.strapi_api_token_permissions_token_links;
       public         heap    postgres    false            �            1259    18051 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.strapi_api_token_permissions_token_links_id_seq;
       public          postgres    false    248            �           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;
          public          postgres    false    249            �            1259    18052    strapi_api_tokens    TABLE     �  CREATE TABLE public.strapi_api_tokens (
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
 %   DROP TABLE public.strapi_api_tokens;
       public         heap    postgres    false            �            1259    18057    strapi_api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public          postgres    false    250            �           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public          postgres    false    251            �            1259    18058    strapi_core_store_settings    TABLE     �   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap    postgres    false            �            1259    18063 !   strapi_core_store_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public          postgres    false    252            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public          postgres    false    253            �            1259    18064    strapi_database_schema    TABLE     �   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap    postgres    false            �            1259    18069    strapi_database_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public          postgres    false    254            �           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public          postgres    false    255                        1259    18070    strapi_migrations    TABLE     �   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap    postgres    false                       1259    18073    strapi_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public          postgres    false    256            �           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public          postgres    false    257                       1259    18074    strapi_webhooks    TABLE     �   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap    postgres    false                       1259    18079    strapi_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public          postgres    false    258            �           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public          postgres    false    259                       1259    18080    up_permissions    TABLE     �   CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.up_permissions;
       public         heap    postgres    false                       1259    18083    up_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public          postgres    false    260            �           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public          postgres    false    261                       1259    18084    up_permissions_role_links    TABLE     �   CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order integer
);
 -   DROP TABLE public.up_permissions_role_links;
       public         heap    postgres    false                       1259    18087     up_permissions_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.up_permissions_role_links_id_seq;
       public          postgres    false    262            �           0    0     up_permissions_role_links_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;
          public          postgres    false    263                       1259    18088    up_roles    TABLE     8  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_roles;
       public         heap    postgres    false            	           1259    18093    up_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public          postgres    false    264            �           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public          postgres    false    265            
           1259    18094    up_users    TABLE     �  CREATE TABLE public.up_users (
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
    DROP TABLE public.up_users;
       public         heap    postgres    false                       1259    18099    up_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public          postgres    false    266            �           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public          postgres    false    267                       1259    18100    up_users_role_links    TABLE     �   CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order integer
);
 '   DROP TABLE public.up_users_role_links;
       public         heap    postgres    false                       1259    18103    up_users_role_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.up_users_role_links_id_seq;
       public          postgres    false    268            �           0    0    up_users_role_links_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;
          public          postgres    false    269                       1259    18104    upload_folders    TABLE     +  CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.upload_folders;
       public         heap    postgres    false                       1259    18109    upload_folders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.upload_folders_id_seq;
       public          postgres    false    270            �           0    0    upload_folders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;
          public          postgres    false    271                       1259    18110    upload_folders_parent_links    TABLE     �   CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order integer
);
 /   DROP TABLE public.upload_folders_parent_links;
       public         heap    postgres    false                       1259    18113 "   upload_folders_parent_links_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.upload_folders_parent_links_id_seq;
       public          postgres    false    272            �           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;
          public          postgres    false    273                       2604    18114    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                       2604    18115    admin_permissions_role_links id    DEFAULT     �   ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);
 N   ALTER TABLE public.admin_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                       2604    18116    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                       2604    18117    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                       2604    18118    admin_users_roles_links id    DEFAULT     �   ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);
 I   ALTER TABLE public.admin_users_roles_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222                       2604    18119    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    224                       2604    18120    files_folder_links id    DEFAULT     ~   ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);
 D   ALTER TABLE public.files_folder_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225                       2604    18121    files_related_morphs id    DEFAULT     �   ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);
 F   ALTER TABLE public.files_related_morphs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228                       2604    18122    g_accounts id    DEFAULT     n   ALTER TABLE ONLY public.g_accounts ALTER COLUMN id SET DEFAULT nextval('public.g_accounts_id_seq'::regclass);
 <   ALTER TABLE public.g_accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230                       2604    18123    g_characters id    DEFAULT     r   ALTER TABLE ONLY public.g_characters ALTER COLUMN id SET DEFAULT nextval('public.g_characters_id_seq'::regclass);
 >   ALTER TABLE public.g_characters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232                       2604    18124    g_configurations id    DEFAULT     z   ALTER TABLE ONLY public.g_configurations ALTER COLUMN id SET DEFAULT nextval('public.g_configurations_id_seq'::regclass);
 B   ALTER TABLE public.g_configurations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234                       2604    18125    g_formulas id    DEFAULT     n   ALTER TABLE ONLY public.g_formulas ALTER COLUMN id SET DEFAULT nextval('public.g_formulas_id_seq'::regclass);
 <   ALTER TABLE public.g_formulas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                       2604    18126    g_session_tokens id    DEFAULT     z   ALTER TABLE ONLY public.g_session_tokens ALTER COLUMN id SET DEFAULT nextval('public.g_session_tokens_id_seq'::regclass);
 B   ALTER TABLE public.g_session_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238                       2604    18127    g_travel_logs id    DEFAULT     t   ALTER TABLE ONLY public.g_travel_logs ALTER COLUMN id SET DEFAULT nextval('public.g_travel_logs_id_seq'::regclass);
 ?   ALTER TABLE public.g_travel_logs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240                       2604    18128    g_travel_texts id    DEFAULT     v   ALTER TABLE ONLY public.g_travel_texts ALTER COLUMN id SET DEFAULT nextval('public.g_travel_texts_id_seq'::regclass);
 @   ALTER TABLE public.g_travel_texts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242                       2604    18129    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244                       2604    18130    strapi_api_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);
 N   ALTER TABLE public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246                       2604    18131 +   strapi_api_token_permissions_token_links id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);
 Z   ALTER TABLE public.strapi_api_token_permissions_token_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248                       2604    18132    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250                        2604    18133    strapi_core_store_settings id    DEFAULT     �   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    252            !           2604    18134    strapi_database_schema id    DEFAULT     �   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            "           2604    18135    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            #           2604    18136    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            $           2604    18137    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260            %           2604    18138    up_permissions_role_links id    DEFAULT     �   ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);
 K   ALTER TABLE public.up_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262            &           2604    18139    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    264            '           2604    18140    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    267    266            (           2604    18141    up_users_role_links id    DEFAULT     �   ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);
 E   ALTER TABLE public.up_users_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    268            )           2604    18142    upload_folders id    DEFAULT     v   ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);
 @   ALTER TABLE public.upload_folders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    271    270            *           2604    18143    upload_folders_parent_links id    DEFAULT     �   ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);
 M   ALTER TABLE public.upload_folders_parent_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    272            {          0    17956    admin_permissions 
   TABLE DATA           �   COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    214   ��      }          0    17962    admin_permissions_role_links 
   TABLE DATA           d   COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    216   ��                0    17966    admin_roles 
   TABLE DATA           x   COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    218   ��      �          0    17972    admin_users 
   TABLE DATA           �   COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    220   ��      �          0    17978    admin_users_roles_links 
   TABLE DATA           _   COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
    public          postgres    false    222   U�      �          0    17982    files 
   TABLE DATA           �   COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    224   w�      �          0    17987    files_folder_links 
   TABLE DATA           P   COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
    public          postgres    false    225   ��      �          0    17992    files_related_morphs 
   TABLE DATA           e   COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
    public          postgres    false    228   ��      �          0    17998 
   g_accounts 
   TABLE DATA           �   COPY public.g_accounts (id, user_name, is_member, created_at, updated_at, created_by_id, updated_by_id, meta_data, sub) FROM stdin;
    public          postgres    false    230   ��      �          0    18004    g_characters 
   TABLE DATA           �   COPY public.g_characters (id, name, max_hp, current_hp, gold, point, location, lvl, created_at, updated_at, created_by_id, updated_by_id, exp, account_id, atk, def, dex) FROM stdin;
    public          postgres    false    232   ��      �          0    18010    g_configurations 
   TABLE DATA           u   COPY public.g_configurations (id, name, value_str, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    234   ;�      �          0    18016 
   g_formulas 
   TABLE DATA           |   COPY public.g_formulas (id, format_formula, name_formula, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    236   C�      �          0    18022    g_session_tokens 
   TABLE DATA           w   COPY public.g_session_tokens (id, token, created_at, updated_at, created_by_id, updated_by_id, account_id) FROM stdin;
    public          postgres    false    238   `�      �          0    18026    g_travel_logs 
   TABLE DATA           �   COPY public.g_travel_logs (id, text, heading, wait_length, reward_gold, reward_exp, step_type, item, travel_background, char_id, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    240   }�      �          0    18032    g_travel_texts 
   TABLE DATA           k   COPY public.g_travel_texts (id, content, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    242   n�      �          0    18038    i18n_locale 
   TABLE DATA           k   COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    244   ��      �          0    18044    strapi_api_token_permissions 
   TABLE DATA           x   COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    246   (�      �          0    18048 (   strapi_api_token_permissions_token_links 
   TABLE DATA           �   COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
    public          postgres    false    248   E�      �          0    18052    strapi_api_tokens 
   TABLE DATA           �   COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    250   b�      �          0    18058    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public          postgres    false    252   �      �          0    18064    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public          postgres    false    254   ��      �          0    18070    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public          postgres    false    256   ��      �          0    18074    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public          postgres    false    258   ��      �          0    18080    up_permissions 
   TABLE DATA           j   COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    260   ��      �          0    18084    up_permissions_role_links 
   TABLE DATA           a   COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    262   ��      �          0    18088    up_roles 
   TABLE DATA           u   COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    264   ��      �          0    18094    up_users 
   TABLE DATA           �   COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    266   s�      �          0    18100    up_users_role_links 
   TABLE DATA           O   COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
    public          postgres    false    268   ��      �          0    18104    upload_folders 
   TABLE DATA           w   COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    270   ��      �          0    18110    upload_folders_parent_links 
   TABLE DATA           a   COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
    public          postgres    false    272   ��      �           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 113, true);
          public          postgres    false    215            �           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 113, true);
          public          postgres    false    217            �           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public          postgres    false    219            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public          postgres    false    221            �           0    0    admin_users_roles_links_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);
          public          postgres    false    223            �           0    0    files_folder_links_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);
          public          postgres    false    226            �           0    0    files_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.files_id_seq', 1, false);
          public          postgres    false    227            �           0    0    files_related_morphs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1, false);
          public          postgres    false    229            �           0    0    g_accounts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.g_accounts_id_seq', 8, true);
          public          postgres    false    231            �           0    0    g_characters_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.g_characters_id_seq', 6, true);
          public          postgres    false    233            �           0    0    g_configurations_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.g_configurations_id_seq', 10, true);
          public          postgres    false    235            �           0    0    g_formulas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.g_formulas_id_seq', 1, false);
          public          postgres    false    237            �           0    0    g_session_tokens_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.g_session_tokens_id_seq', 1, false);
          public          postgres    false    239            �           0    0    g_travel_logs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.g_travel_logs_id_seq', 48, true);
          public          postgres    false    241            �           0    0    g_travel_texts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.g_travel_texts_id_seq', 3, true);
          public          postgres    false    243            �           0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);
          public          postgres    false    245            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);
          public          postgres    false    247            �           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);
          public          postgres    false    249            �           0    0    strapi_api_tokens_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);
          public          postgres    false    251            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 29, true);
          public          postgres    false    253            �           0    0    strapi_database_schema_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 16, true);
          public          postgres    false    255            �           0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public          postgres    false    257            �           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public          postgres    false    259            �           0    0    up_permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);
          public          postgres    false    261            �           0    0     up_permissions_role_links_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 9, true);
          public          postgres    false    263            �           0    0    up_roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);
          public          postgres    false    265            �           0    0    up_users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);
          public          postgres    false    267            �           0    0    up_users_role_links_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);
          public          postgres    false    269            �           0    0    upload_folders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);
          public          postgres    false    271            �           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);
          public          postgres    false    273            -           2606    18147 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public            postgres    false    214            3           2606    18149 >   admin_permissions_role_links admin_permissions_role_links_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_pkey;
       public            postgres    false    216            5           2606    18151 @   admin_permissions_role_links admin_permissions_role_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_unique;
       public            postgres    false    216    216            8           2606    18153    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public            postgres    false    218            <           2606    18155    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public            postgres    false    220            C           2606    18157 4   admin_users_roles_links admin_users_roles_links_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_pkey;
       public            postgres    false    222            E           2606    18159 6   admin_users_roles_links admin_users_roles_links_unique 
   CONSTRAINT     }   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_unique;
       public            postgres    false    222    222            T           2606    18161 *   files_folder_links files_folder_links_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_pkey;
       public            postgres    false    225            V           2606    18163 ,   files_folder_links files_folder_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_unique;
       public            postgres    false    225    225            H           2606    18165    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    224            Y           2606    18167 .   files_related_morphs files_related_morphs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_pkey;
       public            postgres    false    228            \           2606    18169    g_accounts g_accounts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.g_accounts DROP CONSTRAINT g_accounts_pkey;
       public            postgres    false    230            `           2606    18171    g_characters g_characters_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.g_characters DROP CONSTRAINT g_characters_pkey;
       public            postgres    false    232            d           2606    18173 &   g_configurations g_configurations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.g_configurations DROP CONSTRAINT g_configurations_pkey;
       public            postgres    false    234            h           2606    18175    g_formulas g_formulas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.g_formulas DROP CONSTRAINT g_formulas_pkey;
       public            postgres    false    236            l           2606    18177 &   g_session_tokens g_session_tokens_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.g_session_tokens DROP CONSTRAINT g_session_tokens_pkey;
       public            postgres    false    238            p           2606    18179     g_travel_logs g_travel_logs_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.g_travel_logs DROP CONSTRAINT g_travel_logs_pkey;
       public            postgres    false    240            t           2606    18181 "   g_travel_texts g_travel_texts_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.g_travel_texts DROP CONSTRAINT g_travel_texts_pkey;
       public            postgres    false    242            x           2606    18183    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public            postgres    false    244            |           2606    18185 >   strapi_api_token_permissions strapi_api_token_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_pkey;
       public            postgres    false    246            �           2606    18187 V   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_pkey;
       public            postgres    false    248            �           2606    18189 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_unique;
       public            postgres    false    248    248            �           2606    18191 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public            postgres    false    250            �           2606    18193 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public            postgres    false    252            �           2606    18195 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public            postgres    false    254            �           2606    18197 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public            postgres    false    256            �           2606    18199 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public            postgres    false    258            �           2606    18201 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public            postgres    false    260            �           2606    18203 8   up_permissions_role_links up_permissions_role_links_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_pkey;
       public            postgres    false    262            �           2606    18205 :   up_permissions_role_links up_permissions_role_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_unique;
       public            postgres    false    262    262            �           2606    18207    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public            postgres    false    264            �           2606    18209    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public            postgres    false    266            �           2606    18211 ,   up_users_role_links up_users_role_links_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_pkey;
       public            postgres    false    268            �           2606    18213 .   up_users_role_links up_users_role_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_unique;
       public            postgres    false    268    268            �           2606    18215 <   upload_folders_parent_links upload_folders_parent_links_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_pkey;
       public            postgres    false    272            �           2606    18217 >   upload_folders_parent_links upload_folders_parent_links_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_unique;
       public            postgres    false    272    272            �           2606    18219 +   upload_folders upload_folders_path_id_index 
   CONSTRAINT     i   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);
 U   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_id_index;
       public            postgres    false    270            �           2606    18221 (   upload_folders upload_folders_path_index 
   CONSTRAINT     c   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);
 R   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_index;
       public            postgres    false    270            �           2606    18223 "   upload_folders upload_folders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_pkey;
       public            postgres    false    270            +           1259    18224 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public            postgres    false    214            /           1259    18225    admin_permissions_role_links_fk    INDEX     q   CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);
 3   DROP INDEX public.admin_permissions_role_links_fk;
       public            postgres    false    216            0           1259    18226 #   admin_permissions_role_links_inv_fk    INDEX     o   CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);
 7   DROP INDEX public.admin_permissions_role_links_inv_fk;
       public            postgres    false    216            1           1259    18227 )   admin_permissions_role_links_order_inv_fk    INDEX     ~   CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);
 =   DROP INDEX public.admin_permissions_role_links_order_inv_fk;
       public            postgres    false    216            .           1259    18228 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public            postgres    false    214            6           1259    18229    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public            postgres    false    218            9           1259    18230    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public            postgres    false    218            :           1259    18231    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public            postgres    false    220            >           1259    18232    admin_users_roles_links_fk    INDEX     a   CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);
 .   DROP INDEX public.admin_users_roles_links_fk;
       public            postgres    false    222            ?           1259    18233    admin_users_roles_links_inv_fk    INDEX     e   CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);
 2   DROP INDEX public.admin_users_roles_links_inv_fk;
       public            postgres    false    222            @           1259    18234     admin_users_roles_links_order_fk    INDEX     j   CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);
 4   DROP INDEX public.admin_users_roles_links_order_fk;
       public            postgres    false    222            A           1259    18235 $   admin_users_roles_links_order_inv_fk    INDEX     n   CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);
 8   DROP INDEX public.admin_users_roles_links_order_inv_fk;
       public            postgres    false    222            =           1259    18236    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public            postgres    false    220            F           1259    18237    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public            postgres    false    224            P           1259    18238    files_folder_links_fk    INDEX     W   CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);
 )   DROP INDEX public.files_folder_links_fk;
       public            postgres    false    225            Q           1259    18239    files_folder_links_inv_fk    INDEX     ]   CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);
 -   DROP INDEX public.files_folder_links_inv_fk;
       public            postgres    false    225            R           1259    18240    files_folder_links_order_inv_fk    INDEX     d   CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);
 3   DROP INDEX public.files_folder_links_order_inv_fk;
       public            postgres    false    225            W           1259    18241    files_related_morphs_fk    INDEX     [   CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);
 +   DROP INDEX public.files_related_morphs_fk;
       public            postgres    false    228            I           1259    18242    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public            postgres    false    224            Z           1259    18243    g_accounts_created_by_id_fk    INDEX     [   CREATE INDEX g_accounts_created_by_id_fk ON public.g_accounts USING btree (created_by_id);
 /   DROP INDEX public.g_accounts_created_by_id_fk;
       public            postgres    false    230            ]           1259    18244    g_accounts_updated_by_id_fk    INDEX     [   CREATE INDEX g_accounts_updated_by_id_fk ON public.g_accounts USING btree (updated_by_id);
 /   DROP INDEX public.g_accounts_updated_by_id_fk;
       public            postgres    false    230            ^           1259    18245    g_characters_created_by_id_fk    INDEX     _   CREATE INDEX g_characters_created_by_id_fk ON public.g_characters USING btree (created_by_id);
 1   DROP INDEX public.g_characters_created_by_id_fk;
       public            postgres    false    232            a           1259    18246    g_characters_updated_by_id_fk    INDEX     _   CREATE INDEX g_characters_updated_by_id_fk ON public.g_characters USING btree (updated_by_id);
 1   DROP INDEX public.g_characters_updated_by_id_fk;
       public            postgres    false    232            b           1259    18247 !   g_configurations_created_by_id_fk    INDEX     g   CREATE INDEX g_configurations_created_by_id_fk ON public.g_configurations USING btree (created_by_id);
 5   DROP INDEX public.g_configurations_created_by_id_fk;
       public            postgres    false    234            e           1259    18248 !   g_configurations_updated_by_id_fk    INDEX     g   CREATE INDEX g_configurations_updated_by_id_fk ON public.g_configurations USING btree (updated_by_id);
 5   DROP INDEX public.g_configurations_updated_by_id_fk;
       public            postgres    false    234            f           1259    18249    g_formulas_created_by_id_fk    INDEX     [   CREATE INDEX g_formulas_created_by_id_fk ON public.g_formulas USING btree (created_by_id);
 /   DROP INDEX public.g_formulas_created_by_id_fk;
       public            postgres    false    236            i           1259    18250    g_formulas_updated_by_id_fk    INDEX     [   CREATE INDEX g_formulas_updated_by_id_fk ON public.g_formulas USING btree (updated_by_id);
 /   DROP INDEX public.g_formulas_updated_by_id_fk;
       public            postgres    false    236            j           1259    18251 !   g_session_tokens_created_by_id_fk    INDEX     g   CREATE INDEX g_session_tokens_created_by_id_fk ON public.g_session_tokens USING btree (created_by_id);
 5   DROP INDEX public.g_session_tokens_created_by_id_fk;
       public            postgres    false    238            m           1259    18252 !   g_session_tokens_updated_by_id_fk    INDEX     g   CREATE INDEX g_session_tokens_updated_by_id_fk ON public.g_session_tokens USING btree (updated_by_id);
 5   DROP INDEX public.g_session_tokens_updated_by_id_fk;
       public            postgres    false    238            n           1259    18253    g_travel_logs_created_by_id_fk    INDEX     a   CREATE INDEX g_travel_logs_created_by_id_fk ON public.g_travel_logs USING btree (created_by_id);
 2   DROP INDEX public.g_travel_logs_created_by_id_fk;
       public            postgres    false    240            q           1259    18254    g_travel_logs_updated_by_id_fk    INDEX     a   CREATE INDEX g_travel_logs_updated_by_id_fk ON public.g_travel_logs USING btree (updated_by_id);
 2   DROP INDEX public.g_travel_logs_updated_by_id_fk;
       public            postgres    false    240            r           1259    18255    g_travel_texts_created_by_id_fk    INDEX     c   CREATE INDEX g_travel_texts_created_by_id_fk ON public.g_travel_texts USING btree (created_by_id);
 3   DROP INDEX public.g_travel_texts_created_by_id_fk;
       public            postgres    false    242            u           1259    18256    g_travel_texts_updated_by_id_fk    INDEX     c   CREATE INDEX g_travel_texts_updated_by_id_fk ON public.g_travel_texts USING btree (updated_by_id);
 3   DROP INDEX public.g_travel_texts_updated_by_id_fk;
       public            postgres    false    242            v           1259    18257    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public            postgres    false    244            y           1259    18258    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public            postgres    false    244            z           1259    18259 -   strapi_api_token_permissions_created_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_created_by_id_fk;
       public            postgres    false    246            ~           1259    18260 +   strapi_api_token_permissions_token_links_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);
 ?   DROP INDEX public.strapi_api_token_permissions_token_links_fk;
       public            postgres    false    248                       1259    18261 /   strapi_api_token_permissions_token_links_inv_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);
 C   DROP INDEX public.strapi_api_token_permissions_token_links_inv_fk;
       public            postgres    false    248            �           1259    18262 5   strapi_api_token_permissions_token_links_order_inv_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);
 I   DROP INDEX public.strapi_api_token_permissions_token_links_order_inv_fk;
       public            postgres    false    248            }           1259    18263 -   strapi_api_token_permissions_updated_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_updated_by_id_fk;
       public            postgres    false    246            �           1259    18264 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public            postgres    false    250            �           1259    18265 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public            postgres    false    250            �           1259    18266    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public            postgres    false    260            �           1259    18267    up_permissions_role_links_fk    INDEX     k   CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);
 0   DROP INDEX public.up_permissions_role_links_fk;
       public            postgres    false    262            �           1259    18268     up_permissions_role_links_inv_fk    INDEX     i   CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);
 4   DROP INDEX public.up_permissions_role_links_inv_fk;
       public            postgres    false    262            �           1259    18269 &   up_permissions_role_links_order_inv_fk    INDEX     x   CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);
 :   DROP INDEX public.up_permissions_role_links_order_inv_fk;
       public            postgres    false    262            �           1259    18270    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public            postgres    false    260            �           1259    18271    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public            postgres    false    264            �           1259    18272    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public            postgres    false    264            �           1259    18273    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public            postgres    false    266            �           1259    18274    up_users_role_links_fk    INDEX     Y   CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);
 *   DROP INDEX public.up_users_role_links_fk;
       public            postgres    false    268            �           1259    18275    up_users_role_links_inv_fk    INDEX     ]   CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);
 .   DROP INDEX public.up_users_role_links_inv_fk;
       public            postgres    false    268            �           1259    18276     up_users_role_links_order_inv_fk    INDEX     f   CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);
 4   DROP INDEX public.up_users_role_links_order_inv_fk;
       public            postgres    false    268            �           1259    18277    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public            postgres    false    266            J           1259    18278    upload_files_created_at_index    INDEX     U   CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);
 1   DROP INDEX public.upload_files_created_at_index;
       public            postgres    false    224            K           1259    18279    upload_files_ext_index    INDEX     G   CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);
 *   DROP INDEX public.upload_files_ext_index;
       public            postgres    false    224            L           1259    18280    upload_files_folder_path_index    INDEX     W   CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);
 2   DROP INDEX public.upload_files_folder_path_index;
       public            postgres    false    224            M           1259    18281    upload_files_name_index    INDEX     I   CREATE INDEX upload_files_name_index ON public.files USING btree (name);
 +   DROP INDEX public.upload_files_name_index;
       public            postgres    false    224            N           1259    18282    upload_files_size_index    INDEX     I   CREATE INDEX upload_files_size_index ON public.files USING btree (size);
 +   DROP INDEX public.upload_files_size_index;
       public            postgres    false    224            O           1259    18283    upload_files_updated_at_index    INDEX     U   CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);
 1   DROP INDEX public.upload_files_updated_at_index;
       public            postgres    false    224            �           1259    18284    upload_folders_created_by_id_fk    INDEX     c   CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);
 3   DROP INDEX public.upload_folders_created_by_id_fk;
       public            postgres    false    270            �           1259    18285    upload_folders_parent_links_fk    INDEX     k   CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);
 2   DROP INDEX public.upload_folders_parent_links_fk;
       public            postgres    false    272            �           1259    18286 "   upload_folders_parent_links_inv_fk    INDEX     s   CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);
 6   DROP INDEX public.upload_folders_parent_links_inv_fk;
       public            postgres    false    272            �           1259    18287 (   upload_folders_parent_links_order_inv_fk    INDEX     x   CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);
 <   DROP INDEX public.upload_folders_parent_links_order_inv_fk;
       public            postgres    false    272            �           1259    18288    upload_folders_updated_by_id_fk    INDEX     c   CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);
 3   DROP INDEX public.upload_folders_updated_by_id_fk;
       public            postgres    false    270            �           2606    18289 4   admin_permissions admin_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public          postgres    false    3388    214    220            �           2606    18294 <   admin_permissions_role_links admin_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_fk;
       public          postgres    false    3373    216    214            �           2606    18299 @   admin_permissions_role_links admin_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_inv_fk;
       public          postgres    false    218    216    3384            �           2606    18304 4   admin_permissions admin_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public          postgres    false    214    220    3388            �           2606    18309 (   admin_roles admin_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public          postgres    false    220    3388    218            �           2606    18314 (   admin_roles admin_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public          postgres    false    220    3388    218            �           2606    18319 (   admin_users admin_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public          postgres    false    3388    220    220            �           2606    18324 2   admin_users_roles_links admin_users_roles_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_fk;
       public          postgres    false    220    222    3388            �           2606    18329 6   admin_users_roles_links admin_users_roles_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_inv_fk;
       public          postgres    false    222    3384    218            �           2606    18334 (   admin_users admin_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public          postgres    false    220    220    3388            �           2606    18339    files files_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public          postgres    false    3388    224    220            �           2606    18344 (   files_folder_links files_folder_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_fk;
       public          postgres    false    3400    225    224            �           2606    18349 ,   files_folder_links files_folder_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_inv_fk;
       public          postgres    false    3505    225    270            �           2606    18354 ,   files_related_morphs files_related_morphs_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_fk;
       public          postgres    false    3400    228    224            �           2606    18359    files files_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public          postgres    false    3388    224    220            �           2606    18364 &   g_accounts g_accounts_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.g_accounts DROP CONSTRAINT g_accounts_created_by_id_fk;
       public          postgres    false    3388    230    220            �           2606    18369 &   g_accounts g_accounts_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_accounts
    ADD CONSTRAINT g_accounts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.g_accounts DROP CONSTRAINT g_accounts_updated_by_id_fk;
       public          postgres    false    3388    230    220            �           2606    18374 *   g_characters g_characters_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.g_characters DROP CONSTRAINT g_characters_created_by_id_fk;
       public          postgres    false    220    3388    232            �           2606    18379 *   g_characters g_characters_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_characters
    ADD CONSTRAINT g_characters_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.g_characters DROP CONSTRAINT g_characters_updated_by_id_fk;
       public          postgres    false    220    3388    232            �           2606    18384 2   g_configurations g_configurations_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.g_configurations DROP CONSTRAINT g_configurations_created_by_id_fk;
       public          postgres    false    220    3388    234            �           2606    18389 2   g_configurations g_configurations_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_configurations
    ADD CONSTRAINT g_configurations_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.g_configurations DROP CONSTRAINT g_configurations_updated_by_id_fk;
       public          postgres    false    220    3388    234            �           2606    18394 &   g_formulas g_formulas_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.g_formulas DROP CONSTRAINT g_formulas_created_by_id_fk;
       public          postgres    false    236    3388    220            �           2606    18399 &   g_formulas g_formulas_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_formulas
    ADD CONSTRAINT g_formulas_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.g_formulas DROP CONSTRAINT g_formulas_updated_by_id_fk;
       public          postgres    false    3388    236    220            �           2606    18404 2   g_session_tokens g_session_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.g_session_tokens DROP CONSTRAINT g_session_tokens_created_by_id_fk;
       public          postgres    false    3388    238    220            �           2606    18409 2   g_session_tokens g_session_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_session_tokens
    ADD CONSTRAINT g_session_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.g_session_tokens DROP CONSTRAINT g_session_tokens_updated_by_id_fk;
       public          postgres    false    3388    238    220            �           2606    18414 ,   g_travel_logs g_travel_logs_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.g_travel_logs DROP CONSTRAINT g_travel_logs_created_by_id_fk;
       public          postgres    false    220    240    3388            �           2606    18419 ,   g_travel_logs g_travel_logs_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_travel_logs
    ADD CONSTRAINT g_travel_logs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.g_travel_logs DROP CONSTRAINT g_travel_logs_updated_by_id_fk;
       public          postgres    false    240    220    3388            �           2606    18424 .   g_travel_texts g_travel_texts_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.g_travel_texts DROP CONSTRAINT g_travel_texts_created_by_id_fk;
       public          postgres    false    242    220    3388            �           2606    18429 .   g_travel_texts g_travel_texts_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.g_travel_texts
    ADD CONSTRAINT g_travel_texts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.g_travel_texts DROP CONSTRAINT g_travel_texts_updated_by_id_fk;
       public          postgres    false    242    220    3388            �           2606    18434 (   i18n_locale i18n_locale_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public          postgres    false    3388    220    244            �           2606    18439 (   i18n_locale i18n_locale_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public          postgres    false    220    244    3388            �           2606    18444 J   strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_created_by_id_fk;
       public          postgres    false    220    246    3388            �           2606    18449 T   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;
 ~   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_fk;
       public          postgres    false    246    248    3452            �           2606    18454 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_inv_fk;
       public          postgres    false    248    3463    250            �           2606    18459 J   strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_updated_by_id_fk;
       public          postgres    false    3388    246    220            �           2606    18464 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public          postgres    false    250    3388    220            �           2606    18469 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public          postgres    false    250    3388    220            �           2606    18474 .   up_permissions up_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public          postgres    false    260    3388    220            �           2606    18479 6   up_permissions_role_links up_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_fk;
       public          postgres    false    262    3475    260            �           2606    18484 :   up_permissions_role_links up_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_inv_fk;
       public          postgres    false    3486    262    264            �           2606    18489 .   up_permissions up_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public          postgres    false    260    3388    220            �           2606    18494 "   up_roles up_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public          postgres    false    264    3388    220            �           2606    18499 "   up_roles up_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public          postgres    false    264    3388    220            �           2606    18504 "   up_users up_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public          postgres    false    3388    220    266            �           2606    18509 *   up_users_role_links up_users_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_fk;
       public          postgres    false    268    266    3490            �           2606    18514 .   up_users_role_links up_users_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_inv_fk;
       public          postgres    false    268    3486    264            �           2606    18519 "   up_users up_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public          postgres    false    3388    220    266            �           2606    18524 .   upload_folders upload_folders_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_created_by_id_fk;
       public          postgres    false    270    220    3388            �           2606    18529 :   upload_folders_parent_links upload_folders_parent_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_fk;
       public          postgres    false    272    270    3505            �           2606    18534 >   upload_folders_parent_links upload_folders_parent_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_inv_fk;
       public          postgres    false    270    272    3505            �           2606    18539 .   upload_folders upload_folders_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_updated_by_id_fk;
       public          postgres    false    270    220    3388            {   �  x��Zێ�8}���V���G��aߦG�4.��h���6� �`&�#��(����||��2���qW�Ir<�M��-K��ow?�����y(p<�A��I�'���A����=�͚���[��m�<
@�d>��O�������{�d����zX?r����c�z޼�b�`?�A�d�@�4��,���`m����`6i^�?�3,F�n ?�O~��4�BM"�EA!��P����$dOVh6T����d��l���^�++����+ݳ�w��Nw�u�;w���<:����s`mUt]�Ԝ`����<�̻M��}#�:��毇�Ң��y-r��|"oM����9�-��=�:��Ҟ���l��S�d��c۔l�� �'J�~��Ðr_�
��j5�ed6}i�:EU���29+�W� 4I�&)EWԻ�9�ǁu�Jth ��@�YS�,K�K��#�z|�suhj��}��Gs염,G�e�]x�s��E�����#�`��M�w��{����m`ۋն�.�������tڋ!F4%���g�D���m�=���tpくxf�.=\���$��i.pi�⤷B��Eȹ��TFQ��D|s�
\v%ޢ#�� �.��
�E7V�E qH�EGr�Yp�4q�Gjs�#�2RZB+WVr~ \:�W����Yu(�+��q{.�������z�e���u�rgMB�Ԫ�V9��e��N�5������dvu�݈��B�h܆*@{�M[�4lD7l!2��	@Nt��{i�Wi�g=mf�	�ƚ��d�4������,�� ��V��99�vn�D/Qn���K��-�2(�t���°���h��VZ$ �D�_��!j8U5{��Pm���:��:�C��=�=FS�VĚ�}����6�8� N#ͩ��ǯ��"��a<�j�iM_ϟLmZq
hUIөM+N�ދ����J�Ӌ{	�f�%�@����Vk�Ɗ_�L//�̅Q�Ұo0l�z�3���id�y�j�Z�7������`�F#h�n��;~���e��c:9�;9�A�
trTwr��X2ŹK����9ֽ����C�x���<�θ�߂����M���gC�Q�x؝-���7b�;rAߦ��t�f��[ў����/_-�����d��9]���m��5e>r�b���7UbP�C|�|m��l�k9����"7܈I%8r� q�|77�����囱�{B�n��r �@������r G1k�Ƹ����禭�e���0���o�,�B�M�a��<&�@\�jQ=�y�y������H-ހM��i�R�U�D辶:4�z����q�����qG��NFSΤ539�g���1���,6LC�����Ǹ�b'5���\0/+g\g����)�+q� .%���ձ�&�tnug�y,��� sM�!�`�EI��|!��Ƨ���C���x�0��y.u�s\kQƲ��Pc��Z�i|b����Xl�S��Tûzw6�F�~�G���v���{	&	�n0����*V���X�)� �"���>-V�Urfբ
������6�9��Y݋ݠ��*}߾���ضܶɳ�:����g9�G�&^Lp�K�9{>}��ᵼ\	� ���b�j�+���3u
�r�����L>]��q5��5�p3�A�V;���N�ĪX�n9��y�;>�'�!���U�+�	_�M�*�����N.���S�������O� �      }   �  x��ۍ!C��bV��^n�u�=� �4�I���l���Ԟ,��b��7��Ë�?6�?��'��"��7��-ai)k+E��]p(s7�=p8���܁ù\Ƃbc�CE��C�|u��M��P���d�sv1. ݌A���!�ڗ�f���T����T;��b�k�b3����5ҴH�A����L�fjl��ajr��e-�i1,���x,]�i�X��i�Y��2X��F��:(ӲXeZ6kP��a=�iy�mZ[�6-[�lZ-�nϴ��B�V��L�d�wc2�E�V��iu�mZ]��cZ��Ӵz<2�i�x��z��i<�cZ'o����y�?�N������v.gaL;ÑSL;����$�bW.�i78�1�&�`��-�Řv�#Ûv�a>C^�ĳ�l�³��M4��&���F�^v��{�/�t���t�RY��� ����KL�2u�%�v�� $�g�%����޻�������         �   x�u�1��  k����-�u��.E�4i���&Fr�b�H�}�!��
$
v���.y�G��A�$\}����s�`1 ZK̀���	pY�F(9Q�L">�yPf4S?�����äf7|5��\Vg��y�ik�:UX6m1��{�<��A(�vɮ�A���Q��̔ZA��kԤ�����u��_Tqm1��f|����k�i�]׽��}y      �   �   x�3�LL�������,.-H-JL��s3s���s9U�UT2M��s��-�ˊ+�}=��,�J<��K\
C�B#�����C�]�|M\|ݼ�=�A�Q	g�2202�50�52S02�26�25�332�)������ �+�      �      x�3�4�@�=... �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x����N�0��ۧ�"�Ւ:v�ؕ*hY#�2���!�T9N�XM�4qʺ��Ůx�9-1�uҹ8�}��|:Y�SY���΢D6�6�{�?@��'uߒ�.��f	�I�\�Uj���J�F*��Y����y���є��'�U�v����D)�n����z���rDQ�<m��ҩ�/V}�M�0*���cx�����t��˒�a9YE���6��r|?�)��i���m��4��L�N�9�Fyy}��z�!л5uu���U�5:�.@ ���RH���n[+S�����5"�N��6��Z��,�0���������.9��x�Cp���0�W�X1����+���0ͪ=�]����A�8�cb1s}Jy�zW�R'Ý���O��N��f���M�5N��Z&�_���������A���A�{�,)��A�ܶ/QuS���#)�b<��g�$����o����vTP�      �   m   x�u���0�og
 �s��d�N�o �?XT�*��N'?�co[�F��K�t��@x�B��am�:�s����t�H�G)��_���+6*s��[i*�a֜R:b�&�      �   �   x�u�[�� �og��Z�@ �e$Ĵh)/��4˟ЪUS��9�6�s��O�D��`�� � 鋄�ƑAEM1'��_��N�?0R�R��'Fޙil��Oq��_�?�5J2�<Q
�x�������� ����u,�d�#N��;a��X'd��yrꇳ��^';�uZ!S]̓cv�V'�o���*��̓c��˲�8��n������iFaKq���v�K���^,�x�7N	$��<A$^�m3�Yj�2�$}cUU�آ7      �      x������ � �      �      x������ � �      �   �  x����N[A�ד�Ȯ+��{~�O����JE�J*ѷ�o@��Č|C�\����s�}��x:{=><���ߧ���O�����|zI$	9I:۵t�#�m������!�v������H<�k���`p���5B?�Ow G�Q�`Ƞ�}��>���8�I���~��(�h�#�feW�L�xG�r�|%� �[���k�+�N,D;�]mN(;%[�WB_hV�H���y��:�BXO�As��!��Ò���;[ �T�V��¹19����⺪$Wp��e��EHu�R {��F���5s���H�s�)�.:B5\HD|b[���K�¹�WW�	�I��:�2:�\	4�:��ԣ�,EwT��I*vK�n�	 x ��?h1ʕ���Լeݕ�𺨀�'J�Y�E���<�n�5�a��\B�kŘ��I���ե�P���ep�7͟���˦�!�M_��f�ݜ>�:J�U��i1ٵclz��d�N\	��t|�"~���c�xAew\�\�-��7ʧm�d6]{kj�B4�`^�]�S,���,�N�B��fwFg^�]��Mi 7��]���=H��Q�~W��FO�(r��l���B��}ʗ��{���b���B��쮶�%w��FΈe�ɛq�e-.Q�j��}:h�v��ş���e���|�e5�)>�ڶC�&eaw-�'�w
eVg����/;Dh·m�F��AYX�J�S��n]��p8�
B?9      �   ^   x�u�1
�0@�99E7��� =�kС��_
n���?��r��g?�gu,)��)h\����![���;\bP��7.p�S]�v���A����- ��&�      �   <   x�3�t�K��,�P�H���L��4202�50�52S02�26�22�312�)�D\1z\\\ �q5      �      x������ � �      �      x������ � �      �      x������ � �      �      x��]��6��]y
�����r��oY#���m����F��E�!�,�VJ�I��4�k���,I��C��M��#L&)���G��;�yty��V�4�&E^���q�PI~O�٪�봐���U�q�,�|<^�r�V�p�q�J��xh�O���4�U�����*��o24��
��iV�R}R�����'K�m�O����t�����e��I�T��i���EY��Hx]&��iWo��T�I\���q�����ŉYZ���Y|�2\�C�*,V�^ガb)L�P U�2]6����2�'h^d<��.�R�"I��F'D� �V7��IA�I!0J�> �e�U�NQ�TRC@�īh�qVip���,C �*�!�j����i#��wƨO�<^�! �����5J�@��������ܻ�x��e��*�`U�o�JďŪ�J��z�P�d1m�p}8eMz��c3�*�P�~�>IʤgiNeA}�5���5�������^��ғ�^��z���#�M�&�6�Q�-�M��� ��g[��}��EEb���0m�M�܆�&�@����
���j�l�iY�.��k��e�ׄ�%yύ`��Z��>Do�k�� l�9�K��� X8cZE��C�QW!��{������Y]�"k'zSw��3'D� ��y�L��"}�����^���0Ku)�jW���ŴJj��x�e�b���2-Qw�L��t/I��Z� +�� �!��K���nt�$�ɻ�]�Q��kո(�ӋU�� )��b�W�&>��g{���;�P��>U�'�}O��t!o������vO�GG�B��(�^�)*�ٹ�{�)5e���2+�d�YD�]i���(v1����F�1��K�/��+R�d6��O�zAlB �}��Q:����RB �}N�r����'��(e�-��q3}��>]�١f��^�05��!�1�^'�i�)��A�(4��|�2��8�F���	t���w0>%5��	E��9���V��h����»�����Xf
�\�ŏ ��V�Ƴ�t��:G��g|H�71l�0&H�/ˎpY�<m�}�>b��.����Ӓ <?�㤔�N��x;�9�kX�arKk��af@�쌽�;|�G�iK�FZP;%7X���\<��♼�U����瓹��;�=���coI�6�� m����H��IU��2�9(�&s��1��g�1�I�e�V��! �"�%I�O��!y������U����-t\0OfV
]���WV�o�%?�>e,�Z<��1B&���nR�<�K�nV)�X���q�LoVusD\�Os�`���oHV��K�ψ�xA�7F@U���JK�%S���$��J?��D�^Ѯ�!����u�|'y�?(��e�K��|��?������Q����%��JS���C���r�"2��!P�Y�tV��G%Z��4�3���2��&A���Y����iY�w��'֌ㆉqަ91_�k��w�#�(ꩨ��/����O<�"A�uS5S
6/h
��8[�����ܑk4�'������_H�+�H�n��3�/5��
��1f!�m�����̣=��	r`j���ԛ�f
9�R>�KO��1C��"����{��; [��lW�}Q&J]�Q���Dx���ɼ��3�neۢf)q���IRZ]M�ސ"���++��1���ҕ���^��_��&��9ߩ�lqB�E@��&+&�(�_ӗ%�"�/c�:��G���ދ<��z����mVo�z��e۬ݗ��7.4$)�/18%�}�&ꦗ-��ձ�n5H���D��e[E�nA�"<�Au��[�����l��Pҵrx��7�ʋx�d��)膬�C�+��\/P�R[E�~�����o�騧�Ϛ�vw	�s��%����pm�n�C�9a��40����Z�Ц�z�\��"����8c�S��f�D꾨S<a�i��6_��*���_�9�{�Y�gD˧�,;k���[Uu� �̽Z'�"���}�EѯQ�����N6��q�o3a�[F��h�����S��S�gM�fn��o�3��ݪ��{6������{�*���s����2� |Գ�L�k?�r�旆����8T�ĳ��- �/蠋��8���i��rT0���s��;��h��:�r눟A��
� �?IP��P\�AST^DW̟Sh��(�p?M�,�mB*!�
�p,{�õV��{P��o<n�����N}�/�oW��͍+���8�.�ndoW�~kگ����mkn��)�I�Ŷ�D�r9�:ez#6� ]����=��9Ø��~�07�ИkLSJ�Lr�$O�!l�N)U���A�z�ģѼO�Z�~�$�]����*�Ԡ��<6|Q\C�d��4��i2�Oyɡy�$J�$P�����@h]/�ak��w:z��w:z��O�t쾰d�غ��C��d�X_A���(��F���s�As�Q9�j��E1�Λ�G���@tX3~I@b�Ͻ %K�0�JO��%ۭ�{y�l*n�Nyc�Z�>e3i/�4*��2*��4#{���`���=0�?��Q�$=R>� �V���l�����s��ō{pOx�;9(���ȶ��R��e���e�7:�8p$�iL���˳�;LGk�ؙҖ�5��noɏ��o^���e��ݭ���R�8zҠ���B��T�w�pG9t�q��4n�k%���W�O|5x���D�*q[�O�y{`��g���p[e�H��b�M����ɔ������B;�{>�6�9�z	�p��c�:�B�+��Eä���U��Y�d)y�Ə�a2��x���Hm������6W=�У�ۮ��|�A3�ר�A=���C[�w�q�E���s�0�j��X#x��$!��#��	Z�nWO�=��D��|w/�'"�F�w[/R'7���#<0qӳ���,�A�Ӧ���I:�����9�或�u�"~���;��#H�����������̝��Y��A����2y�-y��
O�r��+6��3��x<#�ۋU^��_�O\�h�5�X��� R���"��C!wo�:���Cܭ�� ��Z�h.��ϰo��Ӧ�qܴn>^ż��*��󣂹޸����q̛ݩ\��˰.��THS��?�dމ22$���q��ZKR���gD�H��#��r�**�[J�	0�T-HQ]�����O���i��g���|	I��^.��)��Jr4�7;zؐ��YҞ�⼑��_jy��4Q�(��2��f��`�`r�Vj���s۱�9}�5mo� b�a�R�x�D����7L���Z�k=�m�}8F�\�q�`�Ew��窃���E�D��]]%�l;�h���b
��E+hF1H�.�V(¹��h'{�>����</�l�.�0�4�4�r>�In�����:�%+ժQ\��KJaS�x�}�Os�?R�aǁ�����*^Ϗ�Ӈ{=��x�({͇m>�	P>U��g�ׇ�*D_m7a�F����ڑ�-��k��HK�TI�)܂�v����tY��y�0}�W��}jv���s�N�f�J�o�4�ދ_�2�C�YV�Fꏎ���p�VmS�[�&� =��O�� O.�<GqBt�G��㴎2���}�����9ٗ*�}\&����dc��->GުF˨��ф�F�W�c��7��vV�	��;��������12�����ns~�VS/c�2x���T{M^6:Xҩ#��v&����oL��	ǅ8fW��L96x��7 ����b5r���*��O _��Rl��fEZ8j}R������
��Ջ���"֠���_�T�w�x`:��!<S���	��Uvۨbc!�)�X�>�P\b��<Yb`oi�T��u���)"V�y� ��ۢ�����w^����(DJ!5�%i�;�����7(#&-B�*,V�^�-=E� �7���OМ�$��mj r�ldL�6I�D�RB����m6B��3B@w@Ь6�j�7�H;p�>:�|�]���L�"X�!`���0��t��a_eP}KDb'��'6�T��`��+�L�U�+?�&x#�}Cʌ�Ͱ��ᔵ�ʩ����J�O�Q4�����{%�s�UN�m,Q-)� R	  �P-��4��[�f�YYw ���iZV��;�b�e� ˩����t���.�"-PE�q(7�-��i!p*�}p���&H~�b��d?oG^6�m��u	�>8�;�&b W�`5~����C}u�\��af
���&��Մ|�B.�B V�{uu�p*E8�C8��2?�R�g`��I!zV��b�MQ���q>[aK2��'�ؕ���zǪ�yaG!7Y�Z,�Uu �W��VYa���M�
¤H�������
*�Z) ����_������\G­4P_�IY�.�~\V%��mxXZJT���uW�Է��v���T���2�1�@5� ��21�Ҩ�}�~�*��-��}���M��M���cƷ�����>ߩ����랝<R���'Ծ��;8tF�p���.�0?Ef"������{yuzt˱�?ӲO�>�9|Z�~�M"|:��;v����?��F~����,���N� �'���RWoǖ��f�u\�d��|���#����<��^A%a�1�����ņHvA'����'�_�wS9�|�����E�Ov̶iD��%����.P�|�&-^���2�TĊ4Ш��Q)���Nh�z�QHϩ�0��'B����>���=�~z>��d� eb����^��^�qڒc��v�s�y�C4+��#�`��T:���;�͡�$�&|��gf}�r���[���v�p��o��e�R�h_cޞ͊|-�p�	��v&�t�(��>�bx8o���rV���K�/
� fE1cۥ0��C�M�M������ꪷ�Х^Z���|$�K�tRU1�[`ܧyR�W]p�N(#<W
��Ok����� ��Փ#<yU�x�,Z��y:T&
9[-˂~�4��M��n��|�I�I?L��v2�ڵ����c2���ei~��0o� �t@�ˀ8�(Kk��;��'	v=+
kR��.ZP�n��V7IA\*�s�8?G�b����k.r�
�Զ��R��YHN����``M�ʮ)����__�a�۪Z9��V��ûK��I�:�Q�A������z@�-#��mĩ��ݬH}��.��J~"yF5Z��5YE{��|2�n�M˂�s9���tqZg�&�Q&z�*�Y���㿓�t�õX���g#U���%P���L����.��̱���y\�C5Ȋ��Q�2�^s�����[4�_��z��o���,�{�4)�������$�_��M�|�;@�i�e6W���A]h����T,�ۿ�m��ח��~�od��7�����z��hu_�����gCqT$R�v���]��d�&�ss�1c��0m�h��M�rМ�B�>�>8d$��"}��5�N�0��d(ƃ5���� ���+��#M�6:!�^��S� �3��̋��8���,�i��[lK�(Uě.Vp�
�EM2�q��2�Θ�%����b��y�O��P�,/�=��gA���M[L�Ó&� ����<���2���{�n�ǷX%������������_����������х�p|����O�������3s;���PD��D�d[��&�:N�{~=���5�~��v�9���v٦�b��[3P����1��ږ��s��
�g���s��cVựԆ���M1��8�>�mj�1h�[:�^Z�;�8�w.���i�H&���<�qi0��� |�� ��{���2�;\k�i�4 �Gm�M~eHݓz�8>�
͉�)�a��-�Q��x~�)^�A;g��U���z�L���&���#�"�ԛ�j�e+}��[�������������Փ�-���-?�d�c)!�	�^$�}��b!��uS�{�#{ a��A�=��/Md�yhL���b��+�`1Mr]�I����/�H�D
����bVwַa�����90����an
L��=��{�U�;��,yD��|���lx����4��iv���=�O�s*.���%�e�HfV�W�8��X��$ �Y&��S}E�:St��M����?�Î��ٱ��x����w�fӁE������ [|�v36%ĺ	O��}#��}@��M�jr��|��Z@y;n�L�J���cy����X���`eb��t��`,����>���KЇ,��2a,�� ��+��ƒ�������<R7��@�ySL��\o�ЩՕ�z��C����^�*(4E�طB3�Q���7���Zc4]��v.��WʼF�B��_�[ie�P��izX�-XV4ZV�a�8��Z���db���R��7����-��s+ҽ�v#�tx�=� �����0pV�>U�o?���b��hSǲl�����8�;�6�ꫯ�&��L      �   �  x��K��8�ϙ_���lŞ�LַT��֦r��i7E� cŀX!<�������BM2�����%Z_7z��ͳ�G�����V�l���3ۡ�1��ǜ�Ћ��EB?d�?/�mz�x�_�k�C�$҈���_����a8�!���#b_�5g	^��B�O~�r]�E��卑�_X!��_��e�$�S[�k��ȏ�ţ	�Tԣi�ҦT�OJϤ�����J��o�4����+� 6��h(n��<��?�|�7;J�O�k���!a�N����,�T}�i��궇�ހ)E��Gl(�1
�z-r�f�cBæ���S�D���M\{���m5�ZR�v�I�����P�e��bx�����W�L�ܕ��o+)yU��>�Χ�w�?��ქ���M�e����$��d�;��&b4�ל`H>84t	/�,��b��Z	��$�~���ݷGy�~n�oN���Q���jD��a±�ٔ>�N��@��,.ҋ���D��2��^�.x�+4��%,��9���u�;����q
��=e.����x��ds�Ǡ�a��G1ᵑ�ˡ����J�Ƨ��Q���d�qm�^�<P�6i�����X�Vd&���i��]�i�BC/(����uA�8v��}v�������==�mSFp[�.O��m��Ԡ	���Ǳ�\(�����d�⇈�O�?��lq���l���t"�p{����"���� �����9C�Yp�����[�;͓D>E�X%�-�]��񝝕m��e1�r��A�V��U^�%��s��U��%��<���Ϻ�deI�ɷN	��a�CgS��5���;65;rj�Q�2�(4�b���Xm�,v�g.Z!�'�{⦔�I���7��8��t�t��;�� �H�Y(�r�4Q	�_)X�\�4oׄ�(����j聸�����Q�Ȩ'K&q7��R�^f��/����2E��v�ť*�LU��l�j�}h>������ѕ�N�2���\��j�s�������S��22]=�:X�)�6S�`&�|X^�-���,��ph�����9+9;V^��Y����,�9/v�Ǭ�~>ã\�D�2�r���|�j��\&�s�%�ס�z�qw�P��u�¯�]�X����0��*��s�g#ǡI>(:pX]W�aM�.�Z�B�f^
E�lh��p��?0 d�b���ܨ�>�8��«��!��;�T/1��5!�8�j,�U�zA���|��]�ń�w�k���=��jE���[���
z׏x�m.A���A�Ձ�?�ބ�T�It�<���^����?�i����4iLz&X��Lh�I~��,{}���5�4�T��8��������	�|���jV�RQ������c�OsL��m}��� �l����pǥ& �H�>lN��S�|A��3�<��y�3t���S����"PY����ʶ�BR���D��+)`�+g/�;NᶏS�a�t��=b��\$���X� Ps�Ч2��nV�r�K#3�2�X�4��D~�_���П���s1ڃ��u�D��^P�wh���,�!�9���u��4��p��5Y����sM*�������!�ۀ$�,*��wI�P&^��eoMUVh���T)����|mG~o�|z����� �UJ����e�|�X`l(�PE�sg P~�5��I��
�3������`Ӯ�řR�´%�p鴭D�P!]�̌ʦ}�4��m�F��ˡP�vO�?5�L�*�����O$�Z���]5��6Xx��j�J�g�ً#}���O�N+N�R����_4"g�Fo�h���n�ׂ����7-�_�ϰ�=	�E�Dv�l��(tjNl���>^~�œ�벱�����y�@��l	�=�2��+^.IM��$�N&�3�NW��"*�����b���L��d`L�hdɔ�iF���mM�T]���=-Iށ�켠��
G�LB�+g����	�ڝ;�*��L��'���DQ�P�Q��]r��A����6zF�P��<�/c�tq�]S�4�J)w��Q=j�B�ތ7�I�����/��ゃV����I�����.���Fu��Q9l�ht__�c�v���g����/�/���W��������n�_?sW�n�������nW����������j���տ�]]]�U�      �      x������ � �      �      x������ � �      �   �   x���A�0E��^��D`k����PiK:%^_�[�I5��[��?,��E*�4��t����P	�x�f,�偳&g/i^՛���G��Y,~��(���@|Z�GV�`EL�]t���b�~�E�m���G��!�`��~�9��*T -�t�fPN��H�8@�eE
 ���%���Ѓ�p���m��      �   8   x��� 1��7U��s����XG����2�w��vpʦɲ�Q�6�����de	1      �   x   x�3�t,-�H�+�LN,IM�tIMK,�)Q(��IUH�,K�S(�WHDV�PZ�Z�ǉ"�id`d�k`�kd�`dhelhed�gln�S<����8J�r2�qX[������&[������� M�Ea      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     