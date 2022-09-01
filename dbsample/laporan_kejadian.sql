PGDMP     	    $                z         	   dblaporan    14.5    14.5 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16553 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16562    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
    id integer NOT NULL,
    tanggal_kejadian date,
    waktu_kejadian timestamp without time zone,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying,
    alamat_lengkap text,
    id_jenis_kejadian integer,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi_lain integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 $   DROP TABLE public.laporan_kejadian;
       public         heap    postgres    false            �            1259    16575    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            
          0    16562    laporan_kejadian 
   TABLE DATA           7  COPY public.laporan_kejadian (id, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, id_jenis_kejadian, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi_lain, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    211   %                  0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    213            ~           2606    16638 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    211            
      x������ � �     