PGDMP                 	        z            dbsisappra2    14.5    14.5 	    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18052    dbsisappra2    DATABASE     n   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            �            1259    18189    laporan_kejadian_korban_jiwa    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_jiwa (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    nama character varying NOT NULL
);
 0   DROP TABLE public.laporan_kejadian_korban_jiwa;
       public         heap    postgres    false            �            1259    18197 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �          0    18189    laporan_kejadian_korban_jiwa 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_jiwa (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nama) FROM stdin;
    public          postgres    false    237          �           0    0 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE SET     S   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq1', 1, false);
          public          postgres    false    239                       2606    18369 ?   laporan_kejadian_korban_jiwa laporan_kejadian_korban_jiwa_pkey1 
   CONSTRAINT     }   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey1 PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey1;
       public            postgres    false    237            �      x������ � �     