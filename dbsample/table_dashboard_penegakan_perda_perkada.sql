PGDMP     ,    5                z            dbsisappra2    14.5    14.5     _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    41378    dbsisappra2    DATABASE     k   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false                       1259    41625 !   dashboard_penegakan_perda_perkada    TABLE     �   CREATE TABLE public.dashboard_penegakan_perda_perkada (
    id_perda integer NOT NULL,
    kasus_perda character varying,
    jenis_pelanggaran_perda character varying,
    tanggal_kasus date
);
 5   DROP TABLE public.dashboard_penegakan_perda_perkada;
       public         heap    postgres    false            \          0    41625 !   dashboard_penegakan_perda_perkada 
   TABLE DATA           z   COPY public.dashboard_penegakan_perda_perkada (id_perda, kasus_perda, jenis_pelanggaran_perda, tanggal_kasus) FROM stdin;
    public          postgres    false    258   �       �           2606    41631 H   dashboard_penegakan_perda_perkada dashboard_penegakan_perda_perkada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada
    ADD CONSTRAINT dashboard_penegakan_perda_perkada_pkey PRIMARY KEY (id_perda);
 r   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada DROP CONSTRAINT dashboard_penegakan_perda_perkada_pkey;
       public            postgres    false    258            \   �   x�}�A�0��5=� 3b�[WFcbݹy�F0����_0Uvlg��]��A瞘4��HJ�2m|ht�]6��E)��f 3���=�������'3��kx��,g��o�h0�81^N�EO�����o�S����Nk���+���P�     