PGDMP                     	    z            dbsisappra_b3    14.5    14.5     +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    18685    dbsisappra_b3    DATABASE     m   CREATE DATABASE dbsisappra_b3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra_b3;
                postgres    false            d           1259    19467    modul_permission    TABLE     �  CREATE TABLE public.modul_permission (
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
    updated_by character varying
);
 $   DROP TABLE public.modul_permission;
       public         heap    postgres    false            c           1259    19466    modul_permission_id_seq    SEQUENCE     �   ALTER TABLE public.modul_permission ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.modul_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    356            (          0    19467    modul_permission 
   TABLE DATA           �   COPY public.modul_permission (id, akses_kontrol, nama_permission, status, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    356   V	       /           0    0    modul_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.modul_permission_id_seq', 1, true);
          public          postgres    false    355            (   ;   x�3�4�,JMLR�1~ dd`d�kh�kd�`h`elfej�gbn`hhU������ q��     