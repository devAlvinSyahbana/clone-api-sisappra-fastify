PGDMP                         z         
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
                postgres    false            �            1259    17435 +   laporan_kegiatan_jenis_pelanggaran_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_pelanggaran_bangunan (
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
 ?   DROP TABLE public.laporan_kegiatan_jenis_pelanggaran_bangunan;
       public         heap    postgres    false            s          0    17435 +   laporan_kegiatan_jenis_pelanggaran_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_pelanggaran_bangunan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    227   	       �           2606    17657 \   laporan_kegiatan_jenis_pelanggaran_bangunan laporan_kegiatan_jenis_pelanggaran_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan
    ADD CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan DROP CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey;
       public            postgres    false    227            s      x������ � �     