PGDMP     :    *                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public            postgres    false    236            9   M  x����n�H���)�Xu7�ܵ�dC[��(��Td:68ᐑy��n`�������[�T����U0+Zo�Ⱥ,r���n`E��CC�N��e|�X݉�E��K��s�Q���o��F���k�Mln���[q��@�.�}ݐ�:Y�!pʘC��֭�G����	nK��L������E�U�@:�`��G�1i!��Y["d	iC��a�E��^	�|�:m��<��4ϡ��<��w�]�{�J�Z�d�T�U�u83�(���Y]��J�D��C!K9��ԡLa��1�'�l���v�NGQ�O�����kP��a�(��ؖ⚬�n""֛�Md��W��-pG��Q��f#�Y`d��W�Gp���S��8��wbYW��RX�iRd��U]04ס*�Q�N�_G���+A��"���n�\��js���:Y_�MtM�,z1���Y4D����o�j��V���J�9�Q%!���:V�*>��)x��w)�6�jT�hM
� �9T��m��t���+om�{�$y�!X����K!�K$˝2�$+ Kxr9�%_��ܪ���:u�eh����;�}���4��1�cאT*��]&���a�}��
y�
��22�}����
7�&��V��E�zصC��67*����V-���nt}x�;э����:N�њ6P?�7�����B/�'��'q�ɳ���8�6�T�,����s,�E�(��!5@FS:i�@��_��J�.��gV뵮�
׬�.�OP$��/@�^LƆ�Aa�&����DE����u{���2�)��n��r���D����&� ���1���t����V����S�!o�]��$Ƕ�̈́�;��v�G��n\uF�6;=�D�*���yh��.�G�V<����*�ٽ(	vB��^�e��K�PO�����A���WT]�j��ݤl~�M<�v;e�cL�����:�����ɋ�Z�|`��d^A�L.dR<~>-�D=�p�^��^�˺�DPٸ4ԅs��r5R:���=�t��K�}q<�%��,��_�������s���4�ug�x�D<cg�J�Э%�>F���Ͽl����׿     