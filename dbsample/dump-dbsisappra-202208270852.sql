PGDMP     +    4                z         
   dbsisappra    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16423 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    24582 
   auth_token    TABLE       CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    token character varying NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.auth_token;
       public         heap    postgres    false    3            �            1259    24581    auth_token_id_seq    SEQUENCE     �   ALTER TABLE public.auth_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    3    212            �            1259    16425    pengguna    TABLE     K  CREATE TABLE public.pengguna (
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
       public         heap    postgres    false    3            �            1259    16424    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210    3            �          0    24582 
   auth_token 
   TABLE DATA           R   COPY public.auth_token (id, id_pegawai, no_pegawai, token, create_at) FROM stdin;
    public          postgres    false    212   �       �          0    16425    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    210   2       �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 14, true);
          public          postgres    false    211            �           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 6, true);
          public          postgres    false    209            �   O  x���ˮ�@ �����~�N^
(����/@A��|��l&�ْ�7�Z�TU����e�dSz�e��	�Ҽ��O7�)��K���:G�;�Lb����%��W�ȭt�tf�L�&�
��d�W�T�T�1���&N�o�J��F�֋���x ��D`�K�D0��C�ҠL/
�)���fQ·��Ռ�2�m�{��d�&������F
X�RJ��vb�M�s�:;��טּ�����Y�w[dm�M;[�H�*���#� ��G��9O�R�P?CRyF�A_ϻ)|mLV:�Q�)��4t��B|~� �k*0����ae^зZt�v����^B��k1��簌��O��r��������Vc����8$mӹU��T�#_��W<I �@O*dU��D,�t����|�'!4"rO��8iPr�>�8����R^�0��:��͘������I��i}�I�F	� (��<��A_�ys3�Ù�uI��nd�u�z�mcR�jM����T�G�w�z� ʘbȱai���بrr�)J^�0�o7HZ�ݯ�j�[�ےŒ�|�؈@RA�A0�-l���f?Q�)Τ>�Q~L����h���^L��q�����5A�o6<Bt�@�,ː�pPr���H�xК�S6	²*��}� >��Q�����n������&�>o�ކ�wM�|+>�ER�U�W�,���������Y�����6��)����_[�f��kf:,�,H��v"m��M�������*��y���=��FE��P�����6O��`tG�kl�z�)ċ�d^V�|��f�O�0��vw����|�ľ���~��8������      �   �   x�3�4�44261�T1JT14P1/�prH��p����0)�/),O�q��
s�L7
r�O.L4I͏L,I6��H�J+K�L�H�-�IuHI-�K��j �1~dd`d�k`�kd�`hiejfeb�gnhfjf�i����� �i$�     