PGDMP     :    :    
            z            dbsisappra2    14.5    14.5     v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    16655    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false                       1259    16975 #   laporan_kegiatan_jenis_penyelesaian    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_penyelesaian (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 7   DROP TABLE public.laporan_kegiatan_jenis_penyelesaian;
       public         heap    postgres    false            s          0    16975 #   laporan_kegiatan_jenis_penyelesaian 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_penyelesaian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    269   �       �           2606    16979 L   laporan_kegiatan_jenis_penyelesaian laporan_kegiatan_jenis_penyelesaian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian
    ADD CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian DROP CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey;
       public            postgres    false    269            s      x������ � �     