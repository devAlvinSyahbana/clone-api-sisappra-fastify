PGDMP                         z         
   dbsisappra    14.4    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    27796 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            X           1259    28483    master_diklat    TABLE     �  CREATE TABLE public.master_diklat (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 !   DROP TABLE public.master_diklat;
       public         heap    postgres    false            W           1259    28482    master_diklat_id_seq    SEQUENCE     �   ALTER TABLE public.master_diklat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_diklat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    344            Z           1259    28491    master_skpd    TABLE     �  CREATE TABLE public.master_skpd (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
    DROP TABLE public.master_skpd;
       public         heap    postgres    false            Y           1259    28490    master_skpd_id_seq    SEQUENCE     �   ALTER TABLE public.master_skpd ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_skpd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    346                      0    28483    master_diklat 
   TABLE DATA           �   COPY public.master_diklat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    344   �                 0    28491    master_skpd 
   TABLE DATA           �   COPY public.master_skpd (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    346   :                  0    0    master_diklat_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_diklat_id_seq', 6, true);
          public          postgres    false    343                       0    0    master_skpd_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_skpd_id_seq', 19, true);
          public          postgres    false    345               �   x����
�0��s���%I�8��F��b�a��?�6��0� ���	��O��&�e�ʺ� @l�=D-�-Q�z�0�Q��ؑ��DR�5޳��M�_��+Th�����b>��5s@Sa�N�������?��JG����i�*�l� �@p>Ƈ���$Rh�ۥܔ��	)�Nq         �  x�uT]o�0}���Z������2i�����/fɂpP>6���NB�*Y)
��{�Ϲ����	�)J�/��ϻ5Zm���r����n��  �۳�PB�=��)E��a�8<��/��QJ�Z��k�Z+�2��f��(�����P��[�SPE���DM,X�撗mU��?�<�)I�Ą��fB>N�ɏ]��2=�A�ՉE�#Obi2��r�>�����`���lIջ*{���s��5�T^�c�AY�%p���U[u� ��C��:*���>�$?s��BQ�[��5e�P�� A���$����-�vU�թ?�γ�q�0��t>���·���?Z��H�I�hL�����nn�F��}x���KN��nu������:}�M|6ysə��L�i����;gܝ}sR.K�3���P��rXG �3ŵ=��b/g��u���>o����M0��c	�T
�n���MQvn|�]g�e��I$�qD��s��]?v�n
x�$\eT�E 1�z�}겮�|��;}�C��[1��Ʉ��T��U������o��2�Y�M��V���=6���� �`���N}���[jS̇��i8��
�0�d�2D�/M~�A�!1pΣ���vlo'-�"��]���YnG|^�ڸ�iA�X�Ϝ2!1� m_���b�t۠�     