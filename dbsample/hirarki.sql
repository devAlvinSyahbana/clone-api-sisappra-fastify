PGDMP     5    3             
    z         
   dbsisappra    14.5    14.5 	    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    88140 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            d           1259    88783    struktur_data_hirarki    TABLE     �  CREATE TABLE public.struktur_data_hirarki (
    id integer NOT NULL,
    parent_id integer,
    nama character varying,
    jabatan integer,
    tim character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 )   DROP TABLE public.struktur_data_hirarki;
       public         heap    postgres    false            e           1259    88790    struktur_data_hirarki_id_seq    SEQUENCE     �   ALTER TABLE public.struktur_data_hirarki ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.struktur_data_hirarki_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    356            +          0    88783    struktur_data_hirarki 
   TABLE DATA           �   COPY public.struktur_data_hirarki (id, parent_id, nama, jabatan, tim, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    356   �
       3           0    0    struktur_data_hirarki_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.struktur_data_hirarki_id_seq', 49, false);
          public          postgres    false    357            �           2606    88926 0   struktur_data_hirarki struktur_data_hirarki_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.struktur_data_hirarki
    ADD CONSTRAINT struktur_data_hirarki_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.struktur_data_hirarki DROP CONSTRAINT struktur_data_hirarki_pkey;
       public            postgres    false    356            +   �  x����n�0E��W�Z��WwL-G�%+УA���w̥f1	(Z(�y�+������M����/��0���{����9?��G7��������m@H$MI^)dka���j*!JU�	_��%�k�{�U0w�]m���x�PҴ��' ��2dȘ�+}�G�63ꇇH��h���ْ�$�}=d(�h�YGC��x�W��i5�	22�4���b2$�O�-�X�;�?*��|���(��p�~S�˱pb���f\5Ր�cH9�k�W�(�wH�TM����ȍ&�z���3�3mI��&�έ'�LBJ�f�'_(?p��_�*��U�"��vϣ���2����l6��%�����~��_$g\o�V8�������5R��Fm��c��	��i��qz�D2��<ȂR=�ơdC��l籺�c�5�������.�9�E��spǌ{ތ\LB�)�l@{%�M`1�����ᱹ��ůg�ɣ��j���k�0{>��63�$�b��wL3�8�[��(ŝQ{ۘE1'q=ϳ��ڲ(}�����lБ�0Ŧ��M5�tU��,jA�җ�r�KM�bWM�.yJ��S\{��#�������szr.Ƶ�<��h�y��Z��Mu'��N�b�\�U]��Q2Tb;#ȴ�f,�g�z��b���e�gH��B�r��
��$/�[�B��"��"܎�G~iKX�YEq����omX�Kdv�ե�_�5�K ���el5�E��x{{����l     