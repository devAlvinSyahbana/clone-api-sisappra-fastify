PGDMP                 	        z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            &           1259    18497 ,   laporan_kejadian_sumber_informasi_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone[]
);
 @   DROP TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa;
       public         heap    postgres    false            '           1259    18506 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    294            �          0    18497 ,   laporan_kejadian_sumber_informasi_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    294   �       �           0    0 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    295                       2606    18505 M   laporan_kejadian_sumber_informasi_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey PRIMARY KEY (id);
 w   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey;
       public            postgres    false    294            �      x������ � �     