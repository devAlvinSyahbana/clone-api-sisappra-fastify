PGDMP                         z         	   dblaporan    14.5    14.5 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16553 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16576    laporan_kejadian_jenis_bantuan    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_bantuan (
    id integer NOT NULL,
    id_laporan integer,
    id_bantuan_satpol integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    id_bantuan_instansi_terkait integer
);
 2   DROP TABLE public.laporan_kejadian_jenis_bantuan;
       public         heap    postgres    false            �            1259    16583 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            
          0    16576    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, id_laporan, id_bantuan_satpol, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, id_bantuan_instansi_terkait) FROM stdin;
    public          postgres    false    214   �                  0    0 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_bantuan_id_seq', 1, false);
          public          postgres    false    215            ~           2606    16645 B   laporan_kejadian_jenis_bantuan laporan_kejadian_jenis_bantuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan
    ADD CONSTRAINT laporan_kejadian_jenis_bantuan_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan DROP CONSTRAINT laporan_kejadian_jenis_bantuan_pkey;
       public            postgres    false    214            
      x������ � �     