PGDMP     %    !            	    z         
   dbsisappra    14.5    14.5 	    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    70969 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            R           1259    71533    master_skpd    TABLE     �  CREATE TABLE public.master_skpd (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
    DROP TABLE public.master_skpd;
       public         heap    postgres    false            S           1259    71540    master_skpd_id_seq    SEQUENCE     �   ALTER TABLE public.master_skpd ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_skpd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    338            (          0    71533    master_skpd 
   TABLE DATA           �   COPY public.master_skpd (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    338   *
       0           0    0    master_skpd_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_skpd_id_seq', 19, true);
          public          postgres    false    339            �           2606    87354    master_skpd master_skpd_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.master_skpd
    ADD CONSTRAINT master_skpd_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.master_skpd DROP CONSTRAINT master_skpd_pkey;
       public            postgres    false    338            (   �  x�}T�n�0<�_�c$��ҭ�4u[qz˅�U��Cz���w)ɒ�d@��3;Ý���yےm�8�ۮq֓�>��)�6���<����Mg��f��	K���3�oYv�9�C����L)n?Y��������vC���s�MFɹ\Nn�c�Yo� !c���*��g3��E��;�j�P1����0c�ɝ�l틭���־oYۢ��4��
C5H�-��E[}F��ݐ��=Z��˝��/|i��-��pM[Z<%�8��������Ķ�[gOC��Ջ\H��4��\�]���}Ѡ�7K>��HYI�xƙ���Mnn��v=�ܡ������u�"��=���ǁ�"8y�J-�^�̃ӡ�~��`���l���.��d(VE9� ��B�'�{w������ސ'��(������ �b�k�����9_V}h�|q��<bE��r��p���K֏�����aR!�:�� ��}=c��C_MNޣ���Ν�8^��
�)�J��T��m���6�8l�����#�����="Gs��pr�UvA/ ���O� ��}Xj� �7�נa䈦+ͅ����%�`f_�⸀D#��JS�R����d�	;-�"h^�Ha���+Îx����݂�)��9u�2�	 9پ�dg;��n���&�����ja?��j�E��8     