PGDMP     .    7    
            z         
   dbsisappra    14.5    14.5     x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    41690 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    42039    dashboard_plotting_anggota    TABLE     M  CREATE TABLE public.dashboard_plotting_anggota (
    id integer NOT NULL,
    kota_kab character varying,
    kecamatan character varying,
    kelurahan character varying,
    lokasi character varying,
    long character varying,
    lat character varying,
    total_jaga_pagi integer,
    total_jaga_sore integer,
    total_jaga_malam integer,
    rawan_terhadap character varying,
    pic character varying,
    pic_contact character varying,
    jam_jaga_pagi timestamp without time zone,
    jam_jaga_sore timestamp without time zone,
    jam_jaga_malam timestamp without time zone
);
 .   DROP TABLE public.dashboard_plotting_anggota;
       public         heap    postgres    false            u          0    42039    dashboard_plotting_anggota 
   TABLE DATA           �   COPY public.dashboard_plotting_anggota (id, kota_kab, kecamatan, kelurahan, lokasi, long, lat, total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam) FROM stdin;
    public          postgres    false    274   q	       �           2606    42045 :   dashboard_plotting_anggota dashboard_plotting_anggota_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.dashboard_plotting_anggota
    ADD CONSTRAINT dashboard_plotting_anggota_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.dashboard_plotting_anggota DROP CONSTRAINT dashboard_plotting_anggota_pkey;
       public            postgres    false    274            u   �  x����n�0���S�O"��[�C�v����,��I�`�ۏV�:�r$PMA�>R�������b�(^s�To�����;���S_��֙����P���/�_o�L��O�S�7�2Ǟ����s9t�g��-5�l�n��b=쮋��Z	�\���2Q���\� ���Yg�0iU�_\>�+q��-	��F��+7�*|T��uN�s)�{ɉ�@�hg�Z�e^��bq�0j�|��^�W:lh�]}��C߼���M�`�«�w`c4ގ��:�5�RQy�i]x�GQ4��nG`p|��q��x'`L�������%��=�UVt�������E}��(�=���L��M��$h1��4�5a�*�4	&F�.:�'D@Zg3�-���z؋���IzX�&lsC����Lz~���/��ʩ     