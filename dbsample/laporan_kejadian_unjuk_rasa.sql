PGDMP     /    9                z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            3           1259    18585    laporan_kejadian_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    alamat_lengkap text,
    jenis_kegiatan character varying,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer
);
 /   DROP TABLE public.laporan_kejadian_unjuk_rasa;
       public         heap    postgres    false            4           1259    18594 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    307            �          0    18585    laporan_kejadian_unjuk_rasa 
   TABLE DATA           :  COPY public.laporan_kejadian_unjuk_rasa (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi) FROM stdin;
    public          postgres    false    307   �       �           0    0 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.laporan_kejadian_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    308            /           2606    18593 =   laporan_kejadian_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey1 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1 PRIMARY KEY (id_kecamatan);
 g   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1;
       public            postgres    false    307            �      x������ � �     