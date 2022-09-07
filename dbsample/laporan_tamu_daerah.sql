PGDMP     9    )                z            dbsisappra2    14.5    14.5 	    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            n           1262    16655    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            �            1259    16774    laporan_tamu_daerah    TABLE     �  CREATE TABLE public.laporan_tamu_daerah (
    tanggal_kunjungan date,
    waktu_mulai_kunjungan timestamp without time zone,
    waktu_selesai_kunjungan timestamp without time zone,
    asal_instansi text,
    jml_pengunjung numeric,
    maksud_dan_tujuan text,
    pejabat_penerima_kunjungan text,
    tempat_kunjungan text,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id integer NOT NULL,
    pelaksanaan character varying
);
 '   DROP TABLE public.laporan_tamu_daerah;
       public         heap    postgres    false            �            1259    16781    laporan_tamu_daerah_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_tamu_daerah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_tamu_daerah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            g          0    16774    laporan_tamu_daerah 
   TABLE DATA           5  COPY public.laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id, pelaksanaan) FROM stdin;
    public          postgres    false    238   A       o           0    0    laporan_tamu_daerah_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.laporan_tamu_daerah_id_seq', 1, false);
          public          postgres    false    239            �           2606    16916 ,   laporan_tamu_daerah laporan_tamu_daerah_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.laporan_tamu_daerah
    ADD CONSTRAINT laporan_tamu_daerah_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.laporan_tamu_daerah DROP CONSTRAINT laporan_tamu_daerah_pkey;
       public            postgres    false    238            g      x������ � �     