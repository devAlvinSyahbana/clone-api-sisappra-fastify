PGDMP         
             
    z         
   dbsisappra    14.5    14.5 	    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    32852 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            ^           1259    33465    pengguna    TABLE     ~  CREATE TABLE public.pengguna (
    id integer NOT NULL,
    no_pegawai character varying,
    kata_sandi character varying,
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
    terakhir_login timestamp without time zone,
    foto character varying,
    nama_lengkap character varying
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false            _           1259    33473    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    350            -          0    33465    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, terakhir_login, foto, nama_lengkap) FROM stdin;
    public          postgres    false    350          5           0    0    pengguna_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pengguna_id_seq', 23, true);
          public          postgres    false    351            �           2606    33641    pengguna pengguna_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pengguna DROP CONSTRAINT pengguna_pkey;
       public            postgres    false    350            -   �   x�32�44261�T1JT14P1/�prH��p����0)�/),O�q��
s�L7
r�O.L4I͏L,I6��H�J+K�,.-H-rHL����K���4�4 �?2202�54�54S00�2��25г04460F�	���2�+F��� �,*o     