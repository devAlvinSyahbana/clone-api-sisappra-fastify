PGDMP     #    #        	        z            db_sisappra    14.5    14.5     d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    16406    db_sisappra    DATABASE     o   CREATE DATABASE db_sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE db_sisappra;
                postgres    false            �            1259    24703    jenis_sarana_prasarana    TABLE     m  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            a          0    24703    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    217   &       �           2606    24709 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    217            a   �  x���Mo�0��̯бÀ9�G>.���$��ۥ&QͲ�Ir��׏NR`(��zDR/_�#(k�n�A��(��X�%60���W��hw¡ae�Jؽ�a�f��x�2��h���r��Vl%�p�b�P�?Sw|�Q�TN���ƻ����D��z�,�b���� 8y�^l
�>p�n����gP�[���LW�����)�-œ�/gPh�p#9��t}�J���[�>���)��Gv�Վ(e�@�r�c�ELa��q'":��x�r��I*t߱�aŭP����7h�&.Zq��lqk�ߥ�R�ڽG�pmz�h���Rz����&� �(�k�. ��ލ��i�gfp��@:�PQ�eJ�#&C�(�A�KF�7-yNl�Đ��P��F�#�ʣu�	%)��갖��.��ֲ��dt�F�1�n>�h���ɋN�a����\E�)
86��B�↭��vk��Q��!T���9�3��2���*ګfO�T�ٱ�n��PVK�e���ɱZ�d/E�<��4�%�N��Մ斶Ҹ��J<��
:�5͠���X��]=�$��SXG�~r�i���ֺ暞�QI�����'R�=�_�!,:cř�#�s�
�.$��?��|��k��c�n�W�~et��֊F�e��I�xM.�ϫ��c�*y��4�ư�-C��&P�N�� ���%	��w��_~ٌ>�Ǎ&;{�?�/ O     