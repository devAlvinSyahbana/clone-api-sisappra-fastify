PGDMP     (            	        z            dbsisappra2    14.5    14.5 	    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            j           1262    41378    dbsisappra2    DATABASE     k   CREATE DATABASE dbsisappra2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra2;
                postgres    false                       1259    41680    dashboard_wasdak_ppkm    TABLE     �   CREATE TABLE public.dashboard_wasdak_ppkm (
    id integer NOT NULL,
    tanggal_wasdak date,
    jenis_wasdak character varying
);
 )   DROP TABLE public.dashboard_wasdak_ppkm;
       public         heap    postgres    false                       1259    41687    dashboard_wasdak_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.dashboard_wasdak_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_wasdak_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    268            c          0    41680    dashboard_wasdak_ppkm 
   TABLE DATA           Q   COPY public.dashboard_wasdak_ppkm (id, tanggal_wasdak, jenis_wasdak) FROM stdin;
    public          postgres    false    268   P	       k           0    0    dashboard_wasdak_ppkm_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.dashboard_wasdak_ppkm_id_seq', 1, false);
          public          postgres    false    269            �           2606    41686 0   dashboard_wasdak_ppkm dashboard_wasdak_ppkm_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_wasdak_ppkm
    ADD CONSTRAINT dashboard_wasdak_ppkm_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_wasdak_ppkm DROP CONSTRAINT dashboard_wasdak_ppkm_pkey;
       public            postgres    false    268            c   o   x�3�4202�50�54��N-*�-�K��2�
��q���$�(�'f$*�$�)�$f��U&rCU��r�e'���!�ô�&���2 ��Z@�Ӂ�1z\\\ J.%0     