PGDMP         (            	    z         
   dbsisappra    14.5    14.5     .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    32060 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            e           1259    32834    akses_kontrol    TABLE     �  CREATE TABLE public.akses_kontrol (
    id integer NOT NULL,
    nama_akses_kontrol character varying,
    hak_akses integer NOT NULL,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_by character varying,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.akses_kontrol;
       public         heap    postgres    false            +          0    32834    akses_kontrol 
   TABLE DATA           �   COPY public.akses_kontrol (id, nama_akses_kontrol, hak_akses, created_by, created_at, updated_by, updated_at, is_deleted, deleted_by, deleted_at) FROM stdin;
    public          postgres    false    357           �           2606    32842     akses_kontrol akses_kontrol_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.akses_kontrol
    ADD CONSTRAINT akses_kontrol_pkey PRIMARY KEY (hak_akses);
 J   ALTER TABLE ONLY public.akses_kontrol DROP CONSTRAINT akses_kontrol_pkey;
       public            postgres    false    357            +      x������ � �     