PGDMP     5            	        z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            �            1259    18173    laporan_kejadian_dokumentasi    TABLE     �  CREATE TABLE public.laporan_kejadian_dokumentasi (
    id integer NOT NULL,
    id_laporan integer,
    dir_file character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 0   DROP TABLE public.laporan_kejadian_dokumentasi;
       public         heap    postgres    false            �            1259    18196 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_dokumentasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �          0    18173    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    233   0       �           0    0 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq', 1, false);
          public          postgres    false    238                       2606    18367 >   laporan_kejadian_dokumentasi laporan_kejadian_korban_jiwa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey;
       public            postgres    false    233            �      x������ � �     