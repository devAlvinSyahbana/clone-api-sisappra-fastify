PGDMP     ,    #                z         	   dblaporan    14.5    14.5 	               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16553 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16554    laporan_kegiatan    TABLE        CREATE TABLE public.laporan_kegiatan (
    id integer NOT NULL,
    id_kota character varying(15),
    id_kelurahan character varying(15),
    id_kecamatan character varying(15),
    kegiatan text,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal date
);
 $   DROP TABLE public.laporan_kegiatan;
       public         heap    postgres    false            �            1259    16561    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            
          0    16554    laporan_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan (id, id_kota, id_kelurahan, id_kecamatan, kegiatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal) FROM stdin;
    public          postgres    false    209   �
                  0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    210            ~           2606    16628 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    209            
   �   x�m��jAE��_1?�MU����.bp���a������������`��mv{��$���~��\� 7��"@p�Ff�Is萋���at9���z�e�ZW�M��*G�4O ����Z�Fc9Q� Q�$��cl�<~K��ھw�����*�&��c~V-v����%�@Hk�:��/�C	     