PGDMP         '            	    z         
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
                postgres    false            Y           1259    55911    master_tempat_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_pelaksanaan (
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
    kategori character varying
);
 -   DROP TABLE public.master_tempat_pelaksanaan;
       public         heap    postgres    false            Z           1259    55918     master_tempat_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    345            &          0    55911    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kategori) FROM stdin;
    public          postgres    false    345   4       .           0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 13, true);
          public          postgres    false    346            �           2606    62754 8   master_tempat_pelaksanaan master_tempat_pelaksanaan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.master_tempat_pelaksanaan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.master_tempat_pelaksanaan DROP CONSTRAINT master_tempat_pelaksanaan_pkey;
       public            postgres    false    345            &   �  x�}��n�0 �3<E`����fDD�@�gU�^*M�*M���g�k
R	$������Ӛi�}Ge�U�H0"ݔ�GItP�H�4�%�Y���y�N.h�����g�FVH#ןO��d�|�X���JԔ�b��V��nٛYh������c��&5� ��E�M�C8��l�ϫ�rm���P���󐜏���\���jA/� -�h58�-l��m����t��ȋ0r>yy�,��	��>�%M}���^��b�^Er�AբB�ex�1���K�Bs��ܝ���ǯ��@=�P�E��&P�L�%�C��-`�)�O�V4�Ε�ۭ��d
N'`��7v!օW6�$���L����7�,�N��ܐ7<h�+}x����
�     