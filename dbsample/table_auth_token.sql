PGDMP     *    5                z         
   dbsisappra    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16760 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    16778 
   auth_token    TABLE       CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    token character varying NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.auth_token;
       public         heap    postgres    false            �            1259    16784    auth_token_id_seq    SEQUENCE     �   ALTER TABLE public.auth_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �          0    16778 
   auth_token 
   TABLE DATA           R   COPY public.auth_token (id, id_pegawai, no_pegawai, token, create_at) FROM stdin;
    public          postgres    false    209   �       �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 16, true);
          public          postgres    false    210            �   �  x����Ң8�u��PIH������bMU
�pQP�O���'�,f��R��ů��p����v�b����u���ڹ9]D���8��:5\*�Km����:[;��p/�zQ��������gG�|Ҭdv�v�y�N���������R�Ya�h��� $MD�/F �dUR��,�Ai0�m*�U��X���i!&�<0��>����羓������.�O�P�@�Ai�7OT�zf����ė��Rc9�b��7����c��V$5��>i�Q	@� ,�!i�3ht*��7��n�W'���[�־uT��K��%>9�cR)��<S���VƼ��2�?�+���v	�R4��z��z��s�&w;���)�F!�_eH��4��y@��{eX�)<� Z@�P�4À�D��Z�r���a�ӈ
TA����X��*Bt��@�B�'~��r�=]5�F�d�Fkϯ����A� ���G��_��w7{�,ϸ��c�����f�8���!����5���$�4�/�.�I�&
tXZh��;C���A��D/'֭☂�'���n����-�Zu�Oa(A�!H��%�oF�l�����Gf�"�F�<�j�(����z�i�'���M!2X�H�4(@8���{z����ʔN�n�����
�K�?Z0Zȑe;=q>l2�$c� �ۀ�������Y�a#�}�fTGi���Ż�my�-"��:mt������w�2�2 p!���*�nf����lJn'�޶��?�},�-�g�}ݓ?mD��5��m���fJ%�ut^��]O-��b�:�U=_d�S�,a��ߟ/���6���������)ɯ�{��S$�[���:�}a���ǉ���!�)�K�I7�!�ۆ��T��g:�R���w�re��jG~�t-�QZ��EPce���[z+��/����F���BH�,�-	���{�#     