PGDMP     :    7            	    z         
   dbsisappra    14.4    14.4     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    36792 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            c           1259    37556    struktur_data_hirarki    TABLE     �  CREATE TABLE public.struktur_data_hirarki (
    id integer NOT NULL,
    level character varying NOT NULL,
    sub_level character varying NOT NULL,
    id_relasi_hirarki integer,
    kategori integer,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 )   DROP TABLE public.struktur_data_hirarki;
       public         heap    postgres    false            b           1259    37555    struktur_data_hirarki_id_seq    SEQUENCE     �   ALTER TABLE public.struktur_data_hirarki ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.struktur_data_hirarki_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    355            $          0    37556    struktur_data_hirarki 
   TABLE DATA           �   COPY public.struktur_data_hirarki (id, level, sub_level, id_relasi_hirarki, kategori, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    355   �	       +           0    0    struktur_data_hirarki_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.struktur_data_hirarki_id_seq', 1, true);
          public          postgres    false    354            $   <   x�3�4��+��R@���id`d�kh�k`�`hbebaed�g`dfhdTT����� =�
_     