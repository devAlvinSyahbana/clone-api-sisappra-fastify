PGDMP     $    +                z            dbsisappra2    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    42650    dbsisappra2    DATABASE     k   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false            "           1259    43010    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_eselon integer
);
 !   DROP TABLE public.master_eselon;
       public         heap    postgres    false            #           1259    43017    master_eselon_id_seq    SEQUENCE     �   ALTER TABLE public.master_eselon ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_eselon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    290            �          0    43010    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_eselon) FROM stdin;
    public          postgres    false    290   	       �           0    0    master_eselon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_eselon_id_seq', 6, true);
          public          postgres    false    291            �   i   x�m�1�0�9~(J�H�PX��;��"y��J.�r�'T2�,w�g���N���NI#K�X`؂"���m-�����u�ۿS�΀A,�������5e     