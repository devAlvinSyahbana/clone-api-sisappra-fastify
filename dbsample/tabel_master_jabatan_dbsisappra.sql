PGDMP     /    2                z         
   dbsisappra    14.4    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    34642 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            *           1259    35036    master_jabatan    TABLE     �  CREATE TABLE public.master_jabatan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    status character varying
);
 "   DROP TABLE public.master_jabatan;
       public         heap    postgres    false            +           1259    35043    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    298                      0    35036    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at, status) FROM stdin;
    public          postgres    false    298   +	                  0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 30, true);
          public          postgres    false    299               n  x����n� F��S��5��ؽ7�!���ЪR��9
8��R�\DI8|f�0Qb�3Z��y�r�ŭJT���{A���}��:>�*߻���K؁x��XI��D���F�bу��Y~�j$��x��\���p�5I8n�F���xͰ#;���L�ɀ8��� v��ޠ˔3G9��F�C��6�t�o�0���1^r8�C,[��/�a���>.�w�ߗ���L&hE:K�9�8�^�o����(SI�~Eq=̖ѐ!T�������������{�_�ݙ�w��]J�m�ޣ�޶{U�Q`��~���٫h{UMm��H�Y�h���ްe1'��VG�Χ�v�X�s�*�Yu/����R�~1s��
��W���`��1�S�*w�q�Ӗ�p�Y��JW�����pī���n���d��@�"�sn��Ø�A{gcˈ�R��H��g T[�����Ő5J��O�B��]x�8���贻���k,��n{8�W�͋������/(N�%�U��ƙ%�ta�8Ʊ�8!���Ft��b�y���s�l�@�48�� �P�F�;t��vC(� ��z(A[Z�����kt��I]��T衔���q��g��}0�(�     