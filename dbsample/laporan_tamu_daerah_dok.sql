PGDMP     !                    z         
   dbsisappra    14.5    14.5     v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    17355 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    17525    laporan_tamu_daerah_dok    TABLE     x  CREATE TABLE public.laporan_tamu_daerah_dok (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at date,
    updated_by character varying,
    dir_file character varying
);
 +   DROP TABLE public.laporan_tamu_daerah_dok;
       public         heap    postgres    false            s          0    17525    laporan_tamu_daerah_dok 
   TABLE DATA           �   COPY public.laporan_tamu_daerah_dok (id, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, dir_file) FROM stdin;
    public          postgres    false    245   (       �           2606    17679 4   laporan_tamu_daerah_dok laporan_tamu_daerah_dok_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_tamu_daerah_dok
    ADD CONSTRAINT laporan_tamu_daerah_dok_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_tamu_daerah_dok DROP CONSTRAINT laporan_tamu_daerah_dok_pkey;
       public            postgres    false    245            s      x������ � �     