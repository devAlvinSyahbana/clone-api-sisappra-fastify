PGDMP         5            
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
    public          postgres    false    360          8           0    0    struktur_data_hirarki1_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.struktur_data_hirarki1_id_seq', 28, true);
          public          postgres    false    359            �           2606    88971 2   struktur_data_hirarki1 struktur_data_hirarki1_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.struktur_data_hirarki1
    ADD CONSTRAINT struktur_data_hirarki1_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.struktur_data_hirarki1 DROP CONSTRAINT struktur_data_hirarki1_pkey;
       public            postgres    false    360            1   E  x�ݖ͎�0���S�h;�=eZ�]D{��$Cc��`;�}{�m��rjr��H�"����&�����#��uK6wO�(�<�Ҕ������MPj������h��8�����t���Q�����n-�\o��d'm)��F⢅
7P��U����Ͳ-e%��u�w���=wrT�C+�h��^�v����
����-�@�Jtr����ٕ�vł�݁�>\<�|��e�R��|�� �)���`��������&�����r����p@6�	���'L��e�ǧoX<B�g�CƽC�HHD�,y�8������j�yy����o�B����N��۠��`ƌ$�
���Fw`�k*�d�t�|;�^P�d+��F O�)c���d[j���$��։�M����wư��c�l>N��x�l8Ǐu���p���W�Qq������g��@�5�ɡ�Y�d'�M�l��R�����j'I6Bl���6]��J�g��b���ْ�ْ�ْE�%�gK�̖l��!<�-Y����댏��;a�I�5ς�����ŨX�E�9Gu����1&A�f,�|t�`�X���M.     