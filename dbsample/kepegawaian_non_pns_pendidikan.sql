PGDMP         '                 {            sisappra_db    14.6    14.6     ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18933    kepegawaian_non_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_non_pns_pendidikan (
    id integer NOT NULL,
    jenis_pendidikan integer NOT NULL,
    nama_sekolah character varying NOT NULL,
    nomor_ijazah character varying,
    tgl_ijazah date,
    jurusan character varying,
    fakultas character varying,
    file_ijazah character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 2   DROP TABLE public.kepegawaian_non_pns_pendidikan;
       public         heap    postgres    false            8          0    18933    kepegawaian_non_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    238   �	       �           2606    19519 @   kepegawaian_non_pns_pendidikan kepegawaian_non_pns_pendidikan_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan
    ADD CONSTRAINT kepegawaian_non_pns_pendidikan_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan DROP CONSTRAINT kepegawaian_non_pns_pendidikan_pk;
       public            postgres    false    238            8     x��U�n�8}6_� �kc0��*��	����ţ0CBf�U�~�I���R��	p��9���$���l/v�͡}��Ҟ���a��M��E�G�An-p��� �  "_��#/����~�=ղG�/w�C�>������=�A$�`1�f�^���ڝ}��x8�=K7 ;������{p�w����ΦOi;j�a���$uPՙ�kS�G���`�r�3�Jh*��G��۾��\���������*�^��E�ܜ[���\hp�_Y� �ܝ@�� �q�|:P��"W�u���uT���.��0��:4��ee5Gm%#/bȪe��t����*]��X�˔��dN R*�$v`�}�����/Me63`C�<���uY�󈯚�W�?;�b�;{�A/3�Z�(���0��q뚭��~ej�xS����EO�
N>���lY�Ɉ:T�2|�UEVќ�1S��4O��xɫ�����))���J��:nw�㊆J{T�*iy�w���=���$>���'��q:5�W@nL 9������j�HF< �A���Y��_��YU?����
t�l!e �A���@p�R�C�ӕ�jȉ�g.3���O����j~�)U�5w���4r9��5H]�!�>ǻSY�ºo�nΗv��17��ei��ꖞHX&.;i
�m���󼌞���ؽER���N�� �\��N�ۧ��[BPx��~h�g͏S�@�L����K�L����uo�8v��li/skQ�Q�&K�hZ�3�Yx��/c��     