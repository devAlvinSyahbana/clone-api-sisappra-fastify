PGDMP         +            	    z         
   dbsisappra    14.5    14.5     $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    17172 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            Y           1259    17761    pengguna    TABLE     �  CREATE TABLE public.pengguna (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    kata_sandi character varying NOT NULL,
    email character varying NOT NULL,
    hak_akses integer NOT NULL,
    status_pengguna integer DEFAULT 0 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    nama_lengkap character varying,
    terakhir_login timestamp without time zone
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false            Z           1259    17769    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    345                       0    17761    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, nama_lengkap, terakhir_login) FROM stdin;
    public          postgres    false    345   
       (           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 8, true);
          public          postgres    false    346                �   x����N�@���)\t�2s�߮�R-�"H1a��+A)C���S5�ε�gyr��J��.ą�e�UusM0��0�1?e�P�p��<:�౟u�*�h��C��^k$���n�����(mo��(�G�↙@Ȁ_1)$��ϊ�|Y��ք�U��"�7GY���Ex����`�>�Ѥ÷f?9&��Ȟ�y{��Z��^��7J�Gه�ӠK}�(�#ф�6\(����ǹ��n�     