PGDMP                 	    
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
                postgres    false            Q           1259    88703    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
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
       public         heap    postgres    false            R           1259    88710    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    337            0          0    88703    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    337   �
       8           0    0    master_pendidikan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 19, true);
          public          postgres    false    338            �           2606    103739 (   master_pendidikan master_pendidikan_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.master_pendidikan
    ADD CONSTRAINT master_pendidikan_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.master_pendidikan DROP CONSTRAINT master_pendidikan_pkey;
       public            postgres    false    337            0   �   x�}˻�@@�z�+(�@wgY^�$K(�����!��&��9��_#E��"1:Ҷ�T��Y�H���kWO��ce�$Fh��	�`
��C�Qs$F )ڍ&�����
(�<O-�����3<�2d�t|m�\O�4h�%��6+4�m��(1����cJ     