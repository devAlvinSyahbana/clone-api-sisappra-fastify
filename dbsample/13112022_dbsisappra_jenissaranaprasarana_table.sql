PGDMP                     
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
                postgres    false            �            1259    57426    jenis_sarana_prasarana    TABLE     �  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            j           1259    65547    jenis_sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.jenis_sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.jenis_sarana_prasarana_id_seq
    START WITH 60
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            2          0    57426    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    226   �
       :           0    0    jenis_sarana_prasarana_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.jenis_sarana_prasarana_id_seq', 62, true);
          public          postgres    false    362            �           2606    58035 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    226            2   W  x���Mo�6���_���Z"�ۇ�I[��򶗽�m&f-�*%9�����d�M�|83z��nԾ7��Mg����g�<3������!��{d���b���-(��J{R�d�)�S((�J?ֹ���l��(?���������)�u���QF9촹g����ݪ�'������>��f�
�� �C�(�gWEL`e�qODt��Qu�*?N�P���-�)H�J�ڰ�>���F��q�Ju��&���.%�ZWՠ�{dWn�l��ȞK�o[��C�3T�Z�t��M�b�����Y�g�0��c���D��b�?��)b�N:P��0���V
���c�C���F�'��s۩��$�vTG۲wҥ�iY�J2����n>�h�����N5�fK��#͹�.Sp����R����v��VQ��)T�~'s�{�����7C{M��ILu�=[��L����0H�09�5X����b�t"���6�UIsK[i\?鶩���(�U���&)�;:���Ӱ��#�~�<F���h��|k�sM��QI�����/�;���1,{���G�%��>D<?!I>{VG����pw����+��w��u�i����M�ŋ���q�Y�a�	h�f�V'[�L��Phl;럂tB��H��o{��N��<o-���Cy��u.z�RUX?>�3��0�gB�9�x��z����X&"ϧ/yF�Í�б��������f�ϒd�'2�S��f+t��p��Xo�Q��$��LLg|2N�X���Y�1Q<�8`����4xx䣂���4�k>�A���w��<�y���ʸ����>�L�A�$����x4�(�     