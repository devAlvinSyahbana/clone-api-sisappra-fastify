PGDMP     )    8    
        
    z            sisappra    14.6    14.6 	    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    16394    sisappra    DATABASE     h   CREATE DATABASE sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra;
                postgres    false            i           1259    17039    sarana_prasarana    TABLE     Z  CREATE TABLE public.sarana_prasarana (
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
    sapras_date date,
    pelaksana integer
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false            j           1259    17046    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    361            4          0    17039    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, file_dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date, pelaksana) FROM stdin;
    public          postgres    false    361   }       <           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 35, true);
          public          postgres    false    362            �           2606    17177 &   sarana_prasarana sarana_prasarana_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sarana_prasarana
    ADD CONSTRAINT sarana_prasarana_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sarana_prasarana DROP CONSTRAINT sarana_prasarana_pkey;
       public            postgres    false    361            4     x���ˑ\1E�tN`\�&G0��ax�Y�;Wu�U��|���e���-&_����0��c��ϰ�1���+ě���N�Dq+�$v�'�5|��]�:d���Z�J�n��i:Y�U��xuJ,�rI���Oٝu\��M����:l�x5�׈��[5-���и2���iw��T6$��Y{V�k,n��lS��'��%�gX�~q�~Ă��q�l��
�]wmw��miΛ�b�e�v,[m3dN�L���i��=ur�ܭ	�܇Lh"�z�5�#�Ɍ�F�Sfr��p����z����ywC6ڼ�v���>�-���{�1���!��{���=�@����uQN�]��:�ēk���.�m��C�p�9kcھ�I�9%�k��y��slb�ץ�951�%\{������u66��k��&98=%Wm��q���B:%�S��W\��M#�#X{��t�1y�wy��|�׸Ϸ���ބ�4Ӟ�,��.�;�k�Z�RN�� s˖ŧ�>���E����z�97G�     