PGDMP     9    #                z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            +           1259    18539    laporan_kejadian_kebakaran    TABLE     �  CREATE TABLE public.laporan_kejadian_kebakaran (
    id integer NOT NULL,
    id_tanggal_kejadian date,
    id_waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    id_alamat_lengkap text,
    id_jenis_kejadian character varying,
    id_uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 .   DROP TABLE public.laporan_kejadian_kebakaran;
       public         heap    postgres    false            ,           1259    18548 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_kebakaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kebakaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    299            �          0    18539    laporan_kejadian_kebakaran 
   TABLE DATA           H  COPY public.laporan_kejadian_kebakaran (id, id_tanggal_kejadian, id_waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, id_alamat_lengkap, id_jenis_kejadian, id_uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    299   �       �           0    0 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.laporan_kejadian_kebakaran_id_seq', 1, false);
          public          postgres    false    300                       2606    18547 :   laporan_kejadian_kebakaran laporan_kejadian_kebakaran_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kebakaran
    ADD CONSTRAINT laporan_kejadian_kebakaran_pkey PRIMARY KEY (id_kecamatan);
 d   ALTER TABLE ONLY public.laporan_kejadian_kebakaran DROP CONSTRAINT laporan_kejadian_kebakaran_pkey;
       public            postgres    false    299            �      x������ � �     