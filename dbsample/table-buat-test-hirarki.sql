PGDMP         &            
    z         
   dbsisappra    14.5    14.5 	    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    88140 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            h           1259    88963    struktur_data_hirarki1    TABLE     �  CREATE TABLE public.struktur_data_hirarki1 (
    id integer NOT NULL,
    parentid integer,
    name character varying,
    positionname character varying,
    phone character varying,
    email character varying,
    team character varying,
    location character varying,
    department character varying,
    description character varying,
    imageurl character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 *   DROP TABLE public.struktur_data_hirarki1;
       public         heap    postgres    false            g           1259    88962    struktur_data_hirarki1_id_seq    SEQUENCE     �   ALTER TABLE public.struktur_data_hirarki1 ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.struktur_data_hirarki1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    360            1          0    88963    struktur_data_hirarki1 
   TABLE DATA           �   COPY public.struktur_data_hirarki1 (id, parentid, name, positionname, phone, email, team, location, department, description, imageurl, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    360          8           0    0    struktur_data_hirarki1_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.struktur_data_hirarki1_id_seq', 43, true);
          public          postgres    false    359            �           2606    88971 2   struktur_data_hirarki1 struktur_data_hirarki1_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.struktur_data_hirarki1
    ADD CONSTRAINT struktur_data_hirarki1_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.struktur_data_hirarki1 DROP CONSTRAINT struktur_data_hirarki1_pkey;
       public            postgres    false    360            1   �  x�ݘ�r�6Ư���4�!�����p �Ms���DŖ][n'o�5H��́����e����]a�W��B�.$�>�0�ȟM��{�+OA$�e��뾳1"F�9��/L���T�e��8K���BQH���.3Y��*(�"�R���/K����L��*��x��K����V�&���)Wۭ9Ma%�B"���Eޔ�˧v� giU��6䢍[��*�)�m��G�"F����˺7�{�CM���>YݖauL�q��ջ��IBxE}(�D�$/l<�����y:�8�&��$tǁ�`���/$�9��YMa��{1���p�<:�Χ�q<s`��C��p�N��fÀM�`�6g�PC��p�&�G��l�z�1�5��~d��Y�(S�z�����A4�_��z'��Hw���j�18����Z6L�کf_�>���yl����x�#���q���`��o�`�~HV�m�p|A�>2�7t���I&r�>�(��܃y��>݃�ML�ȅ?�}%�g(휋�ͮF�3���~���nUP7�Z��������"O5+�t
�;����	�mu��R �\�J�"�v*c���S�ۄ+2���d�)H��|M
� {ȾHb�;��*��4��2�L'�
m�'C�S�\g����0Tg9C%��2�1�B?��$��6����JK*�i"��3�A����$:��s�"�񱱸|&;��A�\-�M�|V�	�+Џk��I*ǎ���8S�9�9=b}���j���@����i'�mx67�K�4��=�ـ��c�`V��uumg@��CR�K=�#�Cl�'�6�?�p>'�$K�lM�â��~CS�"�����,�/]Z��+��H��-U��G���k��JEr�&�T$�<@�@Er,��S��s�����ں�����=0     