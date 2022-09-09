PGDMP     	            	        z         
   dbsisappra    14.5    14.5 	    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    41690 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    41943    sarana_prasarana    TABLE     2  CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer NOT NULL,
    status_sarana_prasarana integer NOT NULL,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    sapras_date date
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false                       1259    41950    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    271            s          0    41943    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date) FROM stdin;
    public          postgres    false    271   M       {           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    272            �           2606    42026 &   sarana_prasarana sarana_prasarana_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sarana_prasarana
    ADD CONSTRAINT sarana_prasarana_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sarana_prasarana DROP CONSTRAINT sarana_prasarana_pkey;
       public            postgres    false    271            s   �  x��T�n�0<[_�? �O��P�r��)�"��);=��۴(d�`3���u�8��p~�yY>�_�/�'��IO�]ȡ�n�<|��Ws��M��ݟ��3Aj��H>�����_9��(Y�94#�����Nr^���J78D����l��̐	�H�1G�zBu1�Z�`�kjƖ0�EÛ���U'qn�Hnt[S A��sglӝt�j��8{ʎ�8D,m�8��#�T8��btlv3�,}c�7��O@=a/�\�5#'\F؆Ϗ/�/ϓ��0!Y�41h_��XG��Y�,2&p��~{���P+ ;�����Ѩ]��֠$[�n?�M�!�*d�p@�@�$�eY������*Bz#1�6,�\�5�L��@l���~����2��̲u�:JJ�>��     