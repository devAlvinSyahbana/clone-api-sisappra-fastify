PGDMP     *    9                z            db_sisappra    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16406    db_sisappra    DATABASE     o   CREATE DATABASE db_sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE db_sisappra;
                postgres    false            �            1259    24703    jenis_sarana_prasarana    TABLE     d  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            �          0    24703    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    217          r           2606    24709 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    217            �   �  x����o�0ǟ���*-@~ /�(U��"B�������l����� ���k%%��w���0}X��<=����p/7��FS4���Pr�.��0�f�ш�ݠH.s�k�G^����
��Z��?�	}9������د�`ߦbX���F2Hw�j���r�����H�A��(dW��e��l�ȷ�q��F�5����܈�\C�[J��N�KY�R3<IH��1E'��.̥WF,U�=��
�7Fs�q�������֭��	ܸV�)z����W�r�jp�rR��.��n8E��l�X�-khc�A�D�A���k�hc3�M-��0�����W�q�?Ԋ�8��jH�����(���Q,ދ�<��X{��j_��8���"Z#�v�W���T���9a�Skq5aj�\I'�H	�sXɨ�n�F3��T�fK�c6~���l��O��ۈ���0�jfL$����5��KLQ>y#�IfX[3�1�3m�6�U��x`�r:O���P�i�q��q�mI���eT����f�a ���G{�M�EiQ��@ʶ��e&�´q^� ���,�j83����a��t�Y����p���ar�ҥ�k�*��C���+�ɒ�z2Y~�����J�I�f��{��2N�+��2����5�`�k|�L�tD�ae��/Y�U@'
�Ty�FF��[�ڑM7Z���]
E�����Fǎ/�����N���j�     