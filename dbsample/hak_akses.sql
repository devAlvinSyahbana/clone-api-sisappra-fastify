PGDMP     &                	    z            dbsisappra_b3    14.5    14.5     *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    18685    dbsisappra_b3    DATABASE     m   CREATE DATABASE dbsisappra_b3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra_b3;
                postgres    false            �            1259    18741 	   hak_akses    TABLE     �  CREATE TABLE public.hak_akses (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    modul_permission integer
);
    DROP TABLE public.hak_akses;
       public         heap    postgres    false            �            1259    18748    hak_akses_id_seq    SEQUENCE     �   ALTER TABLE public.hak_akses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hak_akses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            &          0    18741 	   hak_akses 
   TABLE DATA           �   COPY public.hak_akses (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, modul_permission) FROM stdin;
    public          postgres    false    222   	       .           0    0    hak_akses_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.hak_akses_id_seq', 2, true);
          public          postgres    false    223            &   p   x�U̽
�@�z�)|���;6�6�4&����b��f�}�e-Ozt�b��a��B ;�H��8U�#4����r����C�h5xx/k�68N1��5�����     