PGDMP     ;    ,                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18925    kepegawaian_non_pns_keluarga    TABLE     I  CREATE TABLE public.kepegawaian_non_pns_keluarga (
    id integer NOT NULL,
    hubungan character varying NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 0   DROP TABLE public.kepegawaian_non_pns_keluarga;
       public         heap    postgres    false            �            1259    18932 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            9          0    18925    kepegawaian_non_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    236   �       A           0    0 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.kepegawaian_non_pns_keluarga_id_seq', 42, true);
          public          postgres    false    237            �           2606    19517 <   kepegawaian_non_pns_keluarga kepegawaian_non_pns_keluarga_pk 
   CONSTRAINT     z   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga
    ADD CONSTRAINT kepegawaian_non_pns_keluarga_pk PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga DROP CONSTRAINT kepegawaian_non_pns_keluarga_pk;
       public            postgres    false    236            9   M  x����N�H������;��u,&$�8aG��)�����(~��nۃXi��J�D ��:����7qd]9��JZ7������ԡ�C'��2�\���Ң�ϥ��s�Q���o��F������ln���[q��@�.�}ݐ�:Y�!pʘC��֭�G����	nK��L������E�U�@:�`��G�1i!|�,�-������!@�0�"�m����F>a��M��dq���P�a�i��.�=T�L�Y��R���:��e�����.WP�G"�����>;u(S��hL�	#��)��]��Q���)d���tX0
�h/�典&�������nYs��[��#zͨ� ։b���,0��Yߋ+�#8E��)�k�[�;���+xA)��4)2�ɪ�
���Pj�(X'���#A�ݕ ��[_�[7b.�h5�9P\����&�&b=��\��,"Be�7o�Bx]���k%�Ǩ���u�k�?�
q�S�<���Xm
�M��#�G�B��}����&����)���[��^'I�{�h�<���R��r�̯��
���\g�ע3��`j�N�s���x��r_�;8MG5}��5$����I�?`�`_���B�B�G��L�s?�9?����c���u��v�P��͍�J�w�}�U/E��@��Nt��|]��;Z��'�&?S=�#S��$��$�3yv5�:c�ީ:Y*A�/��X���Q>B9�Cj��G��tҞ�L��d;�6
]6X�Ϭ�k]��Y�+\쟠H\�_�B���K���M{�É��m���Ճe�S�o������5o�S��H>���vǜ�m���Z��b��O�o��5�w5��ۮ6:�pvەg=d���]pQ�����p=�@�;;t]��t�?��)�� MT����@Iа��,��_z���C���U]���bHUcO�&�`��l�a:e�cL�����:�����͋�Z�|`��d^A�L.dR<~?-�D��p�^��^�˺�DPٸ4ԅs��r5R:���=�t��K�}q<�%��,��_�������s���4�ug�x�D<cg�J�Э%�>F���Ͽl����     