PGDMP     (                     z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false                       1259    18420 ,   laporan_kegiatan_pelanggaran_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    updated_by character varying,
    updated_at timestamp without time zone
);
 @   DROP TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol;
       public         heap    postgres    false                       1259    18460 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    275            �          0    18420 ,   laporan_kegiatan_pelanggaran_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_pelanggaran_minuman_alkohol (id, nama, is_deleted, created_by, created_at, deleted_by, deleted_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    275          �           0    0 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    283                       2606    18428 ^   laporan_kegiatan_pelanggaran_minuman_alkohol laporan_kegiatan_pelanggaran_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey;
       public            postgres    false    275            �      x������ � �     