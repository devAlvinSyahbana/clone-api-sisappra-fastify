PGDMP     ;    ;            
    z            sisappra    14.6    14.6 	    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16394    sisappra    DATABASE     h   CREATE DATABASE sisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra;
                postgres    false            �            1259    16470    jenis_sarana_prasarana    TABLE     �  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying,
    pelaksana_id integer
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            �            1259    16476    jenis_sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.jenis_sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.jenis_sarana_prasarana_id_seq
    START WITH 60
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            3          0    16470    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, pelaksana_id) FROM stdin;
    public          postgres    false    228   �
       ;           0    0    jenis_sarana_prasarana_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.jenis_sarana_prasarana_id_seq', 62, true);
          public          postgres    false    229            �           2606    17077 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    228            3   �  x��W�r";|6_�G��60W�Q3#���=�YN����\��r�R)R�l�ju+h��Z���[5�~�4K�������(����M��B�h���0�:��qϰ<�/"�R�щ95W��D@��ۋ�R��8�����0���F�Uc�A�H�a�W�0��}�v�h��K�3�d��P��|�0R�ox��˵2��٠E\�z4��ƈ�ѐ�)�[1g.�'΄�z�+D܋����iҜx�i�q�Ep�:��DH��OL�OeݪУ�2�ʍ�@����]����g�(�μ�W��*����|�P[{FX���/����!;�طj�&��0�r]U�s"S&��y>!�0;��H�+�|�w��YZ�i��!���bD�W!����:�6�U��"z%���r�q��\ឈ���#8�@u���;1���w�p��rD�D�&S�,_rHC@>�Kc�7hɊ�[u �:ar�)4��Zng�f%����e�m{�-bJ�gq�љ9q�aj]�	�3���_�]]s���!�MN$��i�i�Nz �Sh���|*�{���*>o�Qw���z%��]g�"7���U��<���l�S~z]��U��|�fV��JR���=#eS�0�M��OnQS�;�������wd�M���"��<]��(�	�W>$��¢����������8��.��k�>y�zg�wd-c��h#����%�T��A����դ��y�B�i��K0�Ć������G������m��{�'�4�� ���c�Ѳ��w~dq��������xL!�3޲�2q�#Cٚ�8�,C^v+N[:`þ�g��A��7n�SEߔ������U�zDdu_�X{���[��SxQ�`]�Y�XL^ؽv����?"�������7�U,j���쀻E��g��gH��U�K�re���7k��w�ȏ��b�&�g     