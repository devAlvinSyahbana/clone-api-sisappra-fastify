PGDMP                         z         
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
                postgres    false            �            1259    17428    laporan_kegiatan_jenis_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_kegiatan (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    nama character varying NOT NULL
);
 3   DROP TABLE public.laporan_kegiatan_jenis_kegiatan;
       public         heap    postgres    false            s          0    17428    laporan_kegiatan_jenis_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_kegiatan (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, nama) FROM stdin;
    public          postgres    false    226   �       �           2606    17655 D   laporan_kegiatan_jenis_kegiatan laporan_kegiatan_jenis_kegiatan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan
    ADD CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan DROP CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey;
       public            postgres    false    226            s      x������ � �     