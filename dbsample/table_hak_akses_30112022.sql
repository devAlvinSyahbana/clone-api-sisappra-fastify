PGDMP     &        	        
    z         
   dbsisappra    14.5    14.5 	    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    34477 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    34549 	   hak_akses    TABLE       CREATE TABLE public.hak_akses (
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
    modul_permission integer,
    wilayah_bidang integer,
    kecamatan integer,
    jabatan integer
);
    DROP TABLE public.hak_akses;
       public         heap    postgres    false            �            1259    34556    hak_akses_id_seq    SEQUENCE     �   ALTER TABLE public.hak_akses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hak_akses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            8          0    34549 	   hak_akses 
   TABLE DATA           �   COPY public.hak_akses (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, modul_permission, wilayah_bidang, kecamatan, jabatan) FROM stdin;
    public          postgres    false    226   �
       @           0    0    hak_akses_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.hak_akses_id_seq', 4, true);
          public          postgres    false    227            �           2606    35291    hak_akses hak_akses_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hak_akses
    ADD CONSTRAINT hak_akses_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.hak_akses DROP CONSTRAINT hak_akses_pkey;
       public            postgres    false    226            8   �   x�mλ
1�z����y$L��N��M�XPYV����V��)�������`�X�	j׆��:KT�3���s��0l���|3�n��M@-��hD���;l�x�S��\��0�7/?�	ZL���ҳj��b�Ƙ+��1�     