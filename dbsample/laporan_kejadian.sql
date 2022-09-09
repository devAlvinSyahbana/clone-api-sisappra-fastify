PGDMP                 	        z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            �            1259    18166    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    bidang_wilayah character varying,
    jumlah_kejadian integer,
    banjir character varying,
    hewan_buas_dan_berbisa character varying,
    kebakaran character varying,
    kecelakaan character varying,
    pendampingan_kekerasan_pada_perempua_dan_anak character varying,
    kerusakan_konstruksi character varying,
    kriminalitas character varying,
    pembunuhan character varying,
    penemuan_mayat character varying,
    penyelamatan_orang character varying,
    pohon_tumbang character varying,
    tawuran character varying,
    terorisme character varying,
    unjuk_rasa character varying,
    keterangan character varying
);
 $   DROP TABLE public.laporan_kejadian;
       public         heap    postgres    false            �            1259    18180    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �          0    18166    laporan_kejadian 
   TABLE DATA           �  COPY public.laporan_kejadian (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempua_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan) FROM stdin;
    public          postgres    false    232   �       �           0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    234                       2606    18373 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    232            �      x������ � �     