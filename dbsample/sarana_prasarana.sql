PGDMP                          z            db_sisappra    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16406    db_sisappra    DATABASE     o   CREATE DATABASE db_sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE db_sisappra;
                postgres    false            �            1259    16409    sarana_prasarana    TABLE       CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer NOT NULL,
    status_sarana_prasarana integer NOT NULL,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    updated_at timestamp without time zone,
    updated_by integer
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false            �            1259    16408    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �          0    16409    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    210   �	                  0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    209            �   m  x���An1EיS��l�N/{��`,航T���4S(EU�(�Xy����}���~���2<�WD�I՘j�T5���"��Ī���긻�������W�������	�A?�����f���%:%�+*��j�׫aw��s���H
yBԐ���}Fv��@ub� v�.�r�=����EgB�U�%�|�B�[*Ui��h�F:�m5�&� R�k��<��O��od��{�������|���h�>7��t^{,��g�g��h��cxȲA��&>F��G�}+!u�y�[�S�2c��asp���w��o]�ptw�\�MА�V���e��ccښ     