PGDMP     9                
    z         
   dbsisappra    14.5    14.5 	    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    32852 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            \           1259    33456    modul_permission    TABLE     �  CREATE TABLE public.modul_permission (
    id integer NOT NULL,
    akses_kontrol integer,
    nama_permission character varying,
    status integer DEFAULT 0,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan character varying
);
 $   DROP TABLE public.modul_permission;
       public         heap    postgres    false            ]           1259    33464    modul_permission_id_seq    SEQUENCE     �   ALTER TABLE public.modul_permission ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.modul_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    348            -          0    33456    modul_permission 
   TABLE DATA           �   COPY public.modul_permission (id, akses_kontrol, nama_permission, status, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan) FROM stdin;
    public          postgres    false    348   �
       5           0    0    modul_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.modul_permission_id_seq', 13, true);
          public          postgres    false    349            �           2606    33639 &   modul_permission modul_permission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.modul_permission
    ADD CONSTRAINT modul_permission_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.modul_permission DROP CONSTRAINT modul_permission_pkey;
       public            postgres    false    348            -   o   x���11�:�
>�h�$�&=��\q����H$
�@Ȯ,O(��ܷ=��r�����'xW�D2����(J�@���p�ٓ���}�:y��������WKͼ�8eI"��&�     