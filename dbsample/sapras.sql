PGDMP         7    
        
    z         
   dbsisappra    14.5    14.5 	    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    116996 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            h           1259    117642    sarana_prasarana    TABLE     C  CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer,
    status_sarana_prasarana integer,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    file_dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    sapras_date date
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false            i           1259    117649    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    360            3          0    117642    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, file_dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date) FROM stdin;
    public          postgres    false    360   h       ;           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 35, true);
          public          postgres    false    361            �           2606    117782 &   sarana_prasarana sarana_prasarana_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sarana_prasarana
    ADD CONSTRAINT sarana_prasarana_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sarana_prasarana DROP CONSTRAINT sarana_prasarana_pkey;
       public            postgres    false    360            3     x����m1D�ti ����"RA��#�dɑ�{1�"���L�ٞϟ�_"�c�`�<����C^h���ҁ��i�s�U���1��A��	diRi}r��N퓛j�s�I��
�g��Ձ°P9�8�3P6�R���V��PX��d*�Y��tl2� l֧�/@�%�([�^,l�g�m`�b���<eI�!~�ʀ72�"�m�Y&��W�<g��e����A]�R��f���r;8ET�j'���*C=�N:@4HD'��h�|
���$�� ����$|� ��4!���U�4@����f*����=�����LT]dD7Ui����7���4�Q!�� �{AP�� �+��h�~�8�,@�t�U�MS�A�A�\o1Tު����3�j䠇����m4�s�T'�����-��'p΅�@4ݴAT(�*ciʹ;D_'�h�9k��Ҵ�h_uS8��E�h^���t��n=�����>Q���5�/�`�}�Z�|=�_�	�     