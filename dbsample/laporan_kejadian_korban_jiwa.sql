PGDMP     +                    z         	   dblaporan    14.5    14.5 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16553 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16584    laporan_kejadian_korban_jiwa    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_jiwa (
    id integer NOT NULL,
    id_laporan integer,
    id_korban_jiwa integer,
    jumlah_korban_pria integer,
    jumlah_korban_wanita integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 0   DROP TABLE public.laporan_kejadian_korban_jiwa;
       public         heap    postgres    false            �            1259    16592 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            
          0    16584    laporan_kejadian_korban_jiwa 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_jiwa (id, id_laporan, id_korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    216   �                  0    0 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE SET     S   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq1', 1, false);
          public          postgres    false    218            ~           2606    16647 ?   laporan_kejadian_korban_jiwa laporan_kejadian_korban_jiwa_pkey1 
   CONSTRAINT     }   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey1 PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey1;
       public            postgres    false    216            
      x������ � �     