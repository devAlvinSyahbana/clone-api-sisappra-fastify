PGDMP         6                z         
   dbsisappra    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16760 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    16785    pengguna    TABLE     K  CREATE TABLE public.pengguna (
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
    created_by integer
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false            �            1259    16793    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �          0    16785    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    211   �	       �           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 6, true);
          public          postgres    false    212            �   �   x�3�4�44261�T1JT14P1/�prH��p����0)�/),O�q��
s�L7
r�O.L4I͏L,I6��H�J+K�L�H�-�IuHI-�K��j �1~dd`d�k`�kd�`hiejfeb�gnhfjf�i����� �i$�     