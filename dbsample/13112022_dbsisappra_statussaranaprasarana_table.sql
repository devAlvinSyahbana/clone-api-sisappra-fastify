PGDMP     1                
    z         
   dbsisappra    14.5    14.5 	    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    57354 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            d           1259    57992    status_sarana_prasarana    TABLE     �  CREATE TABLE public.status_sarana_prasarana (
    id integer NOT NULL,
    status_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 +   DROP TABLE public.status_sarana_prasarana;
       public         heap    postgres    false            i           1259    65546    status_sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.status_sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.status_sarana_prasarana_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    356            2          0    57992    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    356   �
       :           0    0    status_sarana_prasarana_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.status_sarana_prasarana_id_seq', 5, true);
          public          postgres    false    361            �           2606    58131 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    356            2   �   x���K�0D��)�@��'$�^ � l�Ȣ*�J\�Pԏ覒W~�1Sw��i�w��w�a�l}�І�h,�.1Vd���6��2��W��e����-�]�D����RBju��Fi<�>נ����(�K��_)�=Y]β��1��O9w     