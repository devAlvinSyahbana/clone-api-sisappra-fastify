PGDMP         ;                z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            1           1259    18569 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at time without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying NOT NULL,
    alamat_lengkap text,
    jenis_kegiatan character varying,
    uraian_kejadian text,
    jumla_personil_satpol_pp integer,
    jumlah_personil_instansi_lain integer
);
 F   DROP TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak;
       public         heap    postgres    false            7           1259    18599 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    305            �          0    18569 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak 
   TABLE DATA           U  COPY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumla_personil_satpol_pp, jumlah_personil_instansi_lain) FROM stdin;
    public          postgres    false    305   %       �           0    0 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq', 1, false);
          public          postgres    false    311            /           2606    18577 Y   laporan_kejadian_kekerasan_pada_perempuan_dan_anak kekerasan_pada_perempuan_dan_anak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak
    ADD CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey PRIMARY KEY (id_kelurahan);
 �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak DROP CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey;
       public            postgres    false    305            �      x������ � �     