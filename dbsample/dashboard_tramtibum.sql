PGDMP         6                z            dbsisappra2    14.5    14.5     b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    41378    dbsisappra2    DATABASE     k   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false                       1259    41673    dashboard_tramtibum    TABLE     �   CREATE TABLE public.dashboard_tramtibum (
    id integer NOT NULL,
    kasus_tramtibum character varying,
    jenis_pelanggaran_perda_tramtibum character varying,
    kegiatan_tramtibum character varying,
    date integer
);
 '   DROP TABLE public.dashboard_tramtibum;
       public         heap    postgres    false            _          0    41673    dashboard_tramtibum 
   TABLE DATA              COPY public.dashboard_tramtibum (id, kasus_tramtibum, jenis_pelanggaran_perda_tramtibum, kegiatan_tramtibum, date) FROM stdin;
    public          postgres    false    267   Z       �           2606    41679 ,   dashboard_tramtibum dashboard_tramtibum_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dashboard_tramtibum
    ADD CONSTRAINT dashboard_tramtibum_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.dashboard_tramtibum DROP CONSTRAINT dashboard_tramtibum_pkey;
       public            postgres    false    267            _   �   x�m����0D��W�P�m?aW�!�#��ִ�ĩ�F���eY�.�'����E�Ü/J3&��M+nX�A�ۯb�:�v�j�Ô����V�2Ҟed=���*:����~���)��l��x��%'#�ɐX5/F�gt�f#X�i�)~pb�Ԝ���d���<�P
Nr���"Y�=g6�4Aݫk�&�!&��UY�wHWk�     