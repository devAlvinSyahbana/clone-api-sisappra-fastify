PGDMP         &                z         	   dblaporan    14.5    14.5 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16553 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16601    laporan_pengawasan    TABLE     ,  CREATE TABLE public.laporan_pengawasan (
    id integer NOT NULL,
    tanggal_pelaporan date,
    deskripsi text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying,
    id_jenis_pengawasan character varying
);
 &   DROP TABLE public.laporan_pengawasan;
       public         heap    postgres    false            �            1259    16608    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            
          0    16601    laporan_pengawasan 
   TABLE DATA           �   COPY public.laporan_pengawasan (id, tanggal_pelaporan, deskripsi, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, id_kota, id_kecamatan, id_kelurahan, id_jenis_pengawasan) FROM stdin;
    public          postgres    false    221   P                  0    0    laporan_pengawasan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, true);
          public          postgres    false    222            ~           2606    16626 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    221            
   U   x�3�4404�#����|N###]]c#++=C3#C�?(2��U�%���99���ى�9����99��\1z\\\ ��$     