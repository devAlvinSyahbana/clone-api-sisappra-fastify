PGDMP         8            	    z         
   dbsisappra    14.4    14.4     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    36792 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            a           1259    37548    master_status_kenaikan_pangkat    TABLE     �  CREATE TABLE public.master_status_kenaikan_pangkat (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 2   DROP TABLE public.master_status_kenaikan_pangkat;
       public         heap    postgres    false            `           1259    37547 %   master_status_kenaikan_pangkat_id_seq    SEQUENCE     �   ALTER TABLE public.master_status_kenaikan_pangkat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_status_kenaikan_pangkat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    353                       0    37548    master_status_kenaikan_pangkat 
   TABLE DATA           �   COPY public.master_status_kenaikan_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    353   y	       '           0    0 %   master_status_kenaikan_pangkat_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.master_status_kenaikan_pangkat_id_seq', 7, true);
          public          postgres    false    352                �   x���1�0�99E/�(v��1w1R��-���bc�d���'�9�]^Ҍ7�E4�#��{�����%�!����\K{�u�YZ7?�#Ӂ�y��Q}R_'Y�>��!fudn�nϲ��.��i`p�)��Gg��l2�     