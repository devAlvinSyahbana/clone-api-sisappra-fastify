PGDMP     -                
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
                postgres    false            �            1259    57486    kondisi_sarana_prasarana    TABLE     �  CREATE TABLE public.kondisi_sarana_prasarana (
    id integer NOT NULL,
    kondisi_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 ,   DROP TABLE public.kondisi_sarana_prasarana;
       public         heap    postgres    false            k           1259    65548    kondisi_sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.kondisi_sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kondisi_sarana_prasarana_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            2          0    57486    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    239   �
       :           0    0    kondisi_sarana_prasarana_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.kondisi_sarana_prasarana_id_seq', 5, true);
          public          postgres    false    363            �           2606    58053 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    239            2   �   x�m�;�0Cg��@Q��Xg(:u�b (Pd���7�in�)t�Lm���fb�_	��\{X'�V\jT�+
��z���:�+;[TX�a���р����sAQ���;������e��+-���6dO�I�hI�e�0����8�     