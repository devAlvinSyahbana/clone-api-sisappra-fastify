PGDMP                          z         
   dbsisappra    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25760 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    26265    master_golongan    TABLE     �  CREATE TABLE public.master_golongan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_golongan integer
);
 #   DROP TABLE public.master_golongan;
       public         heap    postgres    false                       1259    26272    master_golongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_golongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_golongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    279            -           1259    26353    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_pendidikan integer
);
 %   DROP TABLE public.master_pendidikan;
       public         heap    postgres    false            .           1259    26360    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    301            �          0    26265    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_golongan) FROM stdin;
    public          postgres    false    279   '       �          0    26353    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    301   �       �           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 15, true);
          public          postgres    false    280            �           0    0    master_pendidikan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 9, true);
          public          postgres    false    302            �   �   x�m�;�@�z|
.�~���PR��s�3��� ��v�dY�f�ry��z�^x�����e.1�秿�r;�6$
MĦ��l�iӏ��rｨ�$xF���ȳ�u�"t�b��E�*���t�&���.&�����6t�	���P�`Jԧډ	�K��T;1�}�O�/�_��s����3��h,X� �Zʏ      �   }   x�m�;
A���^`��{��	�c��?�.(�NCe���c*�AZ�x�y˺���,R1��I� �Vڡo�VGF\�961c�j�c3��6;��b:ű��i��m�߆�lg���J�>L�     