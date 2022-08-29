PGDMP                         z         
   dbsisappra    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16423 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    24582 
   auth_token    TABLE     �   CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pengguna character varying NOT NULL,
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
            public          postgres    false    212    3            �            1259    24594 
   kontak_pic    TABLE     �  CREATE TABLE public.kontak_pic (
    id integer NOT NULL,
    nama character varying NOT NULL,
    telepon character varying NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    status_pic integer NOT NULL
);
    DROP TABLE public.kontak_pic;
       public         heap    postgres    false    3            �            1259    24593    kontak_pic_id_seq    SEQUENCE     �   ALTER TABLE public.kontak_pic ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kontak_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214    3            �            1259    16425    pengguna    TABLE     K  CREATE TABLE public.pengguna (
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
            public          postgres    false    3    210            �          0    24582 
   auth_token 
   TABLE DATA           G   COPY public.auth_token (id, id_pengguna, token, create_at) FROM stdin;
    public          postgres    false    212   p       �          0    24594 
   kontak_pic 
   TABLE DATA           �   COPY public.kontak_pic (id, nama, telepon, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, status_pic) FROM stdin;
    public          postgres    false    214   Q       �          0    16425    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    210   �                  0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 21, true);
          public          postgres    false    211                       0    0    kontak_pic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kontak_pic_id_seq', 5, true);
          public          postgres    false    213                       0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 8, true);
          public          postgres    false    209            �   �  x����β:���U�7 iKK�3QP@P̗A�������~���=%�	�����U��U���tK�[:�y3�>��b��e4���R�~���,��/�ҭ�ȩ��nM�n��U99��\&��6p��5������\+��X��W�~@H���z �d*Q,C(�Ct�I}��sW��e�b���xhә�j��Q��hD��b��0ԓ�$+�"���4���,Nv^���,��|V��^�������.H�U��b�LAX����Ʃ4&�W�q���(�Nߙ�J{X�\��'�M�����AȻ)1!*�.]n�G,ڹy_����D}�.�,���O�W��g#|����������`Y�T�}�|}=ٹ��=pTpvi�p2R
Lw���ߝ�=�zX�0Bh�0��`���� a�B-���f�&�EË�G��&�S�^�o�$a U�+�|f��rv��|wo��$z��Z<O������$U�N�D�����rq���2������:Ox��"(~���hx�9A�@�"���18�Vv��%5�o�a(A�"����/[�y�&J���J�d���I��kX����y�/ǫ�=B�_2��H`	#UU� a�2d��H�x�S�l�eUn���)�rg��!�=����_2�?@�1C�׬���2��tSOg��<�1�PTYn9��f���?z>-�����d�-#�nʐɀ����+VLں����:���ǯt��� 7���+�P�=�)��#���(V���u����GL2��l���e b-{j��̋'f���0Y/_�����[��Q�0�Y����Nd��mj�Y��D���3�W�z�d��}�����,S̏�c{V�+S�|���������j��5��r���t
�v���`���Zy8���$�ek�p�#O���'5�L���� �� \f����n�!:�i����ۏ��R#[-��sߘM�F^������ݗ��?@��^�����`����\<��\��]N�������vfA�w�ss�n�^Tm�<W�_�O����(2�T��;���&�l��t�Pj�/k`^�w'�ܴN�ᘏ^ܐE����$A@���J���_�@�i�Q�������IZ4�;���􋗋���D������{1��d~ǆ������^揢ܭ� ��I틻��L��=mwb�1��.�ͷ��',)D�2�'	��A���      �   �   x�}�K
�@�u�)��?=}O��.��d��7�E0�P�*%p=�+`�����#�1qT�4O�f�cb�]����M��?i�u������ϥ�:�Q��%���ة����C���M�..�Jen��7?95h      �     x�U�OO�@����Sp�ʺ3���ݓ�&�IQ\��Z�����SL�ә�����'���A��&�U��6���ҵ���]�x����6�"�C>-�&*�~I�0+Ū���e��˧�:O
%P!���y&O m��"��;<�WJ*��p�{�<��l��: i�!��\\?�W�2�����$�����t�g��&��WZn)��-��w��Yy�-	��/��"�줶�!݉ڣ�J�D�[�BAp<�U     