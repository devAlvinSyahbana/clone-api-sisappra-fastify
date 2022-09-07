PGDMP     "    )                z            dbsisappra2    14.5    14.5 	    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    16655    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            �            1259    16766    laporan_pengawasan    TABLE     �  CREATE TABLE public.laporan_pengawasan (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying(15),
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    nrk integer,
    nama character varying,
    tgl_pengecekan date,
    share_location character varying,
    alamat character varying,
    lokasi_tiang character varying,
    kawasan_kendali character varying,
    status character varying,
    ukuran character varying,
    pemilik_reklame character varying,
    konstruksi_reklame character varying,
    konten_iklan character varying
);
 &   DROP TABLE public.laporan_pengawasan;
       public         heap    postgres    false            �            1259    16773    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            g          0    16766    laporan_pengawasan 
   TABLE DATA             COPY public.laporan_pengawasan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) FROM stdin;
    public          postgres    false    236   ]       o           0    0    laporan_pengawasan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, true);
          public          postgres    false    237            �           2606    16902 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    236            g   3   x�3�4202�5��56P02�2��21�304312��"������ 
�     