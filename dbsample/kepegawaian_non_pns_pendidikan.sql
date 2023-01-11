PGDMP         6                 {            sisappra_db    14.6    14.6 
    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18933    kepegawaian_non_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_non_pns_pendidikan (
    id integer NOT NULL,
    jenis_pendidikan integer NOT NULL,
    nama_sekolah character varying NOT NULL,
    nomor_ijazah character varying,
    tgl_ijazah date,
    jurusan character varying,
    fakultas character varying,
    file_ijazah character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 2   DROP TABLE public.kepegawaian_non_pns_pendidikan;
       public         heap    postgres    false            o           1259    20478 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kepegawaian_non_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.kepegawaian_non_pns_pendidikan_id_seq;
       public          postgres    false    238            A           0    0 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.kepegawaian_non_pns_pendidikan_id_seq OWNED BY public.kepegawaian_non_pns_pendidikan.id;
          public          postgres    false    367            9          0    18933    kepegawaian_non_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    238   f       B           0    0 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.kepegawaian_non_pns_pendidikan_id_seq', 19, true);
          public          postgres    false    367            �           2606    19519 @   kepegawaian_non_pns_pendidikan kepegawaian_non_pns_pendidikan_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan
    ADD CONSTRAINT kepegawaian_non_pns_pendidikan_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan DROP CONSTRAINT kepegawaian_non_pns_pendidikan_pk;
       public            postgres    false    238            9     x��U�n�H|n�� sN_��[GF	�!���4/=23�xֆ]���4N<�UV
#ah�:]U]�L�����b����,�y<�|�W��,]d�f��
� �	 �!�`��8�韛��G�S-{d>�R0p':�#�s�@~��'t �	�mV��Ş�o����;���ݳt�đCU�f��؃{��_��w6}Js�Qc7�u ����_��?�Ξ˖�q�"�(|�|$�ݱ���@̵������>
���S�Q4�͹e��|�E���+K����(�@;n�O�����C%�<MU����c�� RG�t�C²������Y�,x�n�^�kS�y���������Z'�a�D�������<��f���#��j]�=��9~��3��*6��g;�2#��Û�1��;���:+�W���7����^��U�I�G�2T�-b�#1V�W�ﲪ�*�31f
��i1/yU��ߐ��9%E,0������۝���JK�J^%-O������r��'2�Dcq*��z�����X^_��6p�d�*B��w�7��z,���|Ϊ�i��gW�c�g)� 0
�؁���<�?]ɫ��h{j�!��d~�����kO�B��3w����Q�_��5�H�9ޝ�j�}�ws����p��y/�H�D�[z"a�J\v���fqM�y=O��{��ܱ���	�A&$$t�*!��O?&8
������CK>k~�:�eB(�u]�d���o \׽!��������̭E�ɛ,��g���<�_�p��     