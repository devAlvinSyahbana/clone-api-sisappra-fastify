PGDMP                         z         
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
                postgres    false            �            1259    17456 1   laporan_kegiatan_penyelesaian_penertiban_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_penertiban_bangunan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone,
    updated_by character varying,
    updated_at time without time zone
);
 E   DROP TABLE public.laporan_kegiatan_penyelesaian_penertiban_bangunan;
       public         heap    postgres    false            s          0    17456 1   laporan_kegiatan_penyelesaian_penertiban_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_penertiban_bangunan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    230   Y	       �           2606    17663 h   laporan_kegiatan_penyelesaian_penertiban_bangunan laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan DROP CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey;
       public            postgres    false    230            s      x������ � �     