PGDMP         :                z            db_sisappra    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16406    db_sisappra    DATABASE     o   CREATE DATABASE db_sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE db_sisappra;
                postgres    false            �            1259    24717    kondisi_sarana_prasarana    TABLE     h  CREATE TABLE public.kondisi_sarana_prasarana (
    id integer NOT NULL,
    kondisi_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 ,   DROP TABLE public.kondisi_sarana_prasarana;
       public         heap    postgres    false            �          0    24717    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    219   7       r           2606    24723 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    219            �   $   x�3��I�L����D\F�!�)��
x���qqq mT�     