PGDMP     3                    z         
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
                postgres    false            �            1259    17463    laporan_kegiatan_proses    TABLE     �  CREATE TABLE public.laporan_kegiatan_proses (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 +   DROP TABLE public.laporan_kegiatan_proses;
       public         heap    postgres    false            s          0    17463    laporan_kegiatan_proses 
   TABLE DATA           �   COPY public.laporan_kegiatan_proses (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    231   @       �           2606    17667 4   laporan_kegiatan_proses laporan_kegiatan_proses_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_kegiatan_proses
    ADD CONSTRAINT laporan_kegiatan_proses_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_kegiatan_proses DROP CONSTRAINT laporan_kegiatan_proses_pkey;
       public            postgres    false    231            s      x������ � �     