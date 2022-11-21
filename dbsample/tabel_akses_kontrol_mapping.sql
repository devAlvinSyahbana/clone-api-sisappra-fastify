PGDMP         %            
    z         
   dbsisappra    14.5    14.5 	    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            7           1262    32852 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            g           1259    33642    akses_kontrol_mapping    TABLE     �  CREATE TABLE public.akses_kontrol_mapping (
    id integer NOT NULL,
    id_hak_akses integer NOT NULL,
    id_akses_kontrol integer NOT NULL,
    id_permission integer NOT NULL,
    value_permission boolean,
    is_deleted integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 )   DROP TABLE public.akses_kontrol_mapping;
       public         heap    postgres    false            h           1259    33651    akses_kontrol_mapping_id_seq    SEQUENCE     �   ALTER TABLE public.akses_kontrol_mapping ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.akses_kontrol_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    359            0          0    33642    akses_kontrol_mapping 
   TABLE DATA           �   COPY public.akses_kontrol_mapping (id, id_hak_akses, id_akses_kontrol, id_permission, value_permission, is_deleted, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    359   :       8           0    0    akses_kontrol_mapping_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.akses_kontrol_mapping_id_seq', 4, true);
          public          postgres    false    360            �           2606    33650 0   akses_kontrol_mapping akses_kontrol_mapping_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.akses_kontrol_mapping
    ADD CONSTRAINT akses_kontrol_mapping_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.akses_kontrol_mapping DROP CONSTRAINT akses_kontrol_mapping_pkey;
       public            postgres    false    359            0   5   x�3�4�NN###]CC]C#+C+#=#SKs�?d����� 7s
�     