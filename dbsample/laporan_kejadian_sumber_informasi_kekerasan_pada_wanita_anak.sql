PGDMP     (            	        z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            #           1259    18478 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 P   DROP TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak;
       public         heap    postgres    false            $           1259    18487 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    291            �          0    18478 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    291   P       �           0    0 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_id_seq', 1, false);
          public          postgres    false    292                       2606    18486 c   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak laporan_kejadian_sumber_informasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak
    ADD CONSTRAINT laporan_kejadian_sumber_informasi_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak DROP CONSTRAINT laporan_kejadian_sumber_informasi_pkey;
       public            postgres    false    291            �      x������ � �     