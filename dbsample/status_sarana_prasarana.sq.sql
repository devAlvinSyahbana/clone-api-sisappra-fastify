PGDMP         !        	        z         
   dbsisappra    14.5    14.5     s           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            t           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            u           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            v           1262    24994 
   dbsisappra    DATABASE     n   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE dbsisappra;
                postgres    false            	           1259    25221    status_sarana_prasarana    TABLE     f  CREATE TABLE public.status_sarana_prasarana (
    id integer NOT NULL,
    status_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 +   DROP TABLE public.status_sarana_prasarana;
       public         heap    postgres    false            p          0    25221    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    265   &       �           2606    25278 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    265            p   /   x�3�t,N-���D\F�~�y���9R��SS2󰫈���� �f�     