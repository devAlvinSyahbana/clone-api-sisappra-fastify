PGDMP                     	    z         
   dbsisappra    14.5    14.5 	    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    32852 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            e           1259    33626    akses_kontrol    TABLE     �  CREATE TABLE public.akses_kontrol (
    id integer NOT NULL,
    nama_akses_kontrol character varying,
    hak_akses integer,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_by character varying,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.akses_kontrol;
       public         heap    postgres    false            f           1259    33637    akses_kontrol_id_seq    SEQUENCE     �   ALTER TABLE public.akses_kontrol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.akses_kontrol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    357            ,          0    33626    akses_kontrol 
   TABLE DATA           �   COPY public.akses_kontrol (id, nama_akses_kontrol, hak_akses, created_by, created_at, updated_by, updated_at, is_deleted, deleted_by, deleted_at) FROM stdin;
    public          postgres    false    357   W
       4           0    0    akses_kontrol_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.akses_kontrol_id_seq', 1, false);
          public          postgres    false    358            �           2606    33636     akses_kontrol akses_kontrol_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.akses_kontrol
    ADD CONSTRAINT akses_kontrol_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.akses_kontrol DROP CONSTRAINT akses_kontrol_pkey;
       public            postgres    false    357            ,      x������ � �     