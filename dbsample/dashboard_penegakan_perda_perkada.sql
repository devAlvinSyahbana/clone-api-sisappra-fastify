PGDMP     -        
            z         
   dbsisappra    14.5    14.5     O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    41123 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    41371 !   dashboard_penegakan_perda_perkada    TABLE     �   CREATE TABLE public.dashboard_penegakan_perda_perkada (
    id integer NOT NULL,
    kasus_perda character varying,
    jenis_pelanggaran_perda character varying,
    tanggal_kasus date
);
 5   DROP TABLE public.dashboard_penegakan_perda_perkada;
       public         heap    postgres    false            L          0    41371 !   dashboard_penegakan_perda_perkada 
   TABLE DATA           t   COPY public.dashboard_penegakan_perda_perkada (id, kasus_perda, jenis_pelanggaran_perda, tanggal_kasus) FROM stdin;
    public          postgres    false    258   �       �           2606    41377 H   dashboard_penegakan_perda_perkada dashboard_penegakan_perda_perkada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada
    ADD CONSTRAINT dashboard_penegakan_perda_perkada_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada DROP CONSTRAINT dashboard_penegakan_perda_perkada_pkey;
       public            postgres    false    258            L      x������ � �     