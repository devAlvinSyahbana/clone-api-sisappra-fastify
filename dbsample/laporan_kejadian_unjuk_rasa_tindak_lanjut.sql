PGDMP         9                z            dbsisappra2    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            5           1259    18595 )   laporan_kejadian_unjuk_rasa_tindak_lanjut    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa_tindak_lanjut (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    jumlah_masa integer,
    tuntutan character varying,
    penanggung_jawab_unras character varying,
    jenis_bantuan_satpol_pp character varying,
    jenis_bantuan_instansii_terkait character varying,
    korban_jiwa character varying,
    jumlah_korban_pria integer,
    jumlah_korban_wanita integer
);
 =   DROP TABLE public.laporan_kejadian_unjuk_rasa_tindak_lanjut;
       public         heap    postgres    false            �          0    18595 )   laporan_kejadian_unjuk_rasa_tindak_lanjut 
   TABLE DATA           ;  COPY public.laporan_kejadian_unjuk_rasa_tindak_lanjut (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, jumlah_masa, tuntutan, penanggung_jawab_unras, jenis_bantuan_satpol_pp, jenis_bantuan_instansii_terkait, korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita) FROM stdin;
    public          postgres    false    309   �
       /           2606    18605 X   laporan_kejadian_unjuk_rasa_tindak_lanjut laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut DROP CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey;
       public            postgres    false    309            �      x������ � �     