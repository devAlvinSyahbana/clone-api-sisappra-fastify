PGDMP     &    !        	        z         
   dbsisappra    14.5    14.5     s           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            t           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            u           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            v           1262    24994 
   dbsisappra    DATABASE     n   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    25213    sarana_prasarana    TABLE       CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer NOT NULL,
    status_sarana_prasarana integer NOT NULL,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    updated_at timestamp without time zone,
    updated_by integer
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false                       1259    25220    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    263            o          0    25213    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    263   �	       w           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    264            o   �  x��Mn1�יSp"۱��eP� l�Q�����3�f
����(�,&ʧ�g�E�����}�S��?�����$(ʤP<���[=~;d���d	Q�鰻䂭���k��W��y�L��`v��1����޿�f4�(�`ׯ�A)('_0S��]�~T�f�������� ��S�8"��q��>#�L�L���0l�!]u�(�Y%�(p"M�Y2��.$*���1g��A'/ꚙ�[��
H���j�*�`��su����ca&��l��@��|Tp>3��T^�Զ� 
NJ��8��ð!�
��7�i���0t�sR�� �:ł!R�0\��:�=l�+q��&N؛;�n��*��>�����B�-Z �@h���B���]�}*�h�     