PGDMP         (            	    z         
   dbsisappra    14.5    14.5 	    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    55322 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            [           1259    55919    master_tempat_seksi_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_seksi_pelaksanaan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_tempat_pelaksanaan integer
);
 3   DROP TABLE public.master_tempat_seksi_pelaksanaan;
       public         heap    postgres    false            \           1259    55926 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_seksi_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_seksi_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    347            &          0    55919    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_tempat_pelaksanaan) FROM stdin;
    public          postgres    false    347   �       .           0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 87, true);
          public          postgres    false    348            �           2606    62756 D   master_tempat_seksi_pelaksanaan master_tempat_seksi_pelaksanaan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan
    ADD CONSTRAINT master_tempat_seksi_pelaksanaan_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan DROP CONSTRAINT master_tempat_seksi_pelaksanaan_pkey;
       public            postgres    false    347            &   �  x���ݎ�8���S�rW�Y��;�x�c�@�"��?ǖ�I؞$}���&IO���:>��̬̺�|��4�|��d�w=̚�F�4�.�M�l�_��I�4��߲�'��"���O��V-�j�<�K?��o�#�4�ؼ6܌�m� ���ծ�x#;���T'J�ތ�ߍӇƹ3&�fg具��*�.�忻e݊��zY/������\���\���z5tFNaF%ճb�~���I�!s3�к��]E�ˢ��9�A�z���z��*g�Y�Tk��&z��"�05A�'q0�ޅ��!U�v�[mx@�c��|֓��_�4�{�qxb�GI�l߰����&��1�m�������'yp8���P�n�-�1#م�ɇ[�o�Q��%��>��n��H��(���/���Lg��%b�V��ڌ��c��/�$��N����">`@п3�>Kb�-,:�{l;����D,�2�������t���߬���%TFi|�j¨ؼv��J�Y�@ɟ4�Ç����`��b/Sb>1jv?Bۻ�ohW`a����i��4?��:=X��$F��ni�e4��wC]���2�]/�����º|z_kW���k����s�*�S��*O[��l/zР'�w|a�������p�^\�ؠ�6��F�ëj�}v��Rb\�(���9a1����ܣ&!#FV)C��^Gt�Ԑ�o��q�Z��h��� �K ��H9d%C���J�f��D�!�؛+:�q�蓗�9�jvq`����;�'�󍴫ג��cB�V4>.9�=�ɋ��D�`�~5u9�Q��R���]�I�r"Ű*��}�`�D�!/�>����C���E���m�G��D�!���ḉ(C%؛���K$YDE�&ٺ'�}��"!� �
,D|�8*�1(��:��9(��ArB
"�ί�$	e�U����e�Ȃ��W��c�
��ek��g�Q3'C%,�L;�pJ9�GB��2Fh�*��]}K"�N� ��5�^J�L���=8��T�q-3�{�*�f��SX�0�j�*�{S�L��xǒJ#|ʯƱ�R�A*BK*��?�cIe^`Z5*́�sU��]�l���GE�ڄ]$���F¥��E�)�r �u�Y��XC��4����8so@e���֮Ut���]����ҙ������LWt��������a�t�M��n{��r:h� T�E_V�pQQQL�:~Qj*��I�Zj*�$%Ԃ�J2��OjAM�^9r�l��R*ΐlZ�ѵ�k��k*�P��r��[�p+�T�!��qs^���j*�Pס�X��^Lebt���LGVĬ]� q<Sk��HP;�|��Jt�D�6r�t�D�1'y�+�X�C����_��<��
h�n|1T��H���C�|�T^1�T���Y7 �@�K��gq��@Pw��泻�<�K�ѯ�(�7�r     