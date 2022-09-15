PGDMP         :                z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            /           1259    18559    laporan_kejadian_banjir    TABLE     �  CREATE TABLE public.laporan_kejadian_banjir (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian timestamp without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    alamat_lengkap text,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer,
    ketinggian_air integer,
    jumlah_pengungsi integer,
    jumlah_pengungsi_per_kk integer,
    lokasi_penampungan character varying,
    lokasi_dapur_umum character varying,
    jenis_kejadian character varying
);
 +   DROP TABLE public.laporan_kejadian_banjir;
       public         heap    postgres    false            0           1259    18568    laporan_kejadian_banjir_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_banjir ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_banjir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    303            �          0    18559    laporan_kejadian_banjir 
   TABLE DATA           �  COPY public.laporan_kejadian_banjir (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, ketinggian_air, jumlah_pengungsi, jumlah_pengungsi_per_kk, lokasi_penampungan, lokasi_dapur_umum, jenis_kejadian) FROM stdin;
    public          postgres    false    303   �       �           0    0    laporan_kejadian_banjir_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.laporan_kejadian_banjir_id_seq', 1, false);
          public          postgres    false    304            /           2606    18567 4   laporan_kejadian_banjir laporan_kejadian_banjir_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_banjir
    ADD CONSTRAINT laporan_kejadian_banjir_pkey PRIMARY KEY (id_kecamatan);
 ^   ALTER TABLE ONLY public.laporan_kejadian_banjir DROP CONSTRAINT laporan_kejadian_banjir_pkey;
       public            postgres    false    303            �      x������ � �     