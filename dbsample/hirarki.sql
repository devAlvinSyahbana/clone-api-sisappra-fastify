PGDMP         
            
    z         
   dbsisappra    14.5    14.5 	    2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            5           1262    113607 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            g           1259    114440    hirarki    TABLE     j   CREATE TABLE public.hirarki (
    id integer NOT NULL,
    parentid integer,
    position_name integer
);
    DROP TABLE public.hirarki;
       public         heap    postgres    false            h           1259    114445    hirarki_coba_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_coba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    359            .          0    114440    hirarki 
   TABLE DATA           >   COPY public.hirarki (id, parentid, position_name) FROM stdin;
    public          postgres    false    359   �       6           0    0    hirarki_coba_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hirarki_coba_id_seq', 1, false);
          public          postgres    false    360            �           2606    114447    hirarki hirarki_coba_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.hirarki
    ADD CONSTRAINT hirarki_coba_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.hirarki DROP CONSTRAINT hirarki_coba_pkey;
       public            postgres    false    359            .   (  x�-�˕�0��`��2��?�-4� ���L�;&,Qn��kѿ��_�F�o|3�7����#'�w���������~�E�	=�п�h���f����m~}��ۯ�h��h/�E�	�/z�1�'��~�G	#�L��W��k���$��7�F8���c��_���-FO�E��c�13�b��c'�'�ĸy̍��7^̟`�b���7{L��C�'�1W��v��Ơpc������[�X-���	=��Pk��O4��k}�k'�X'�ĺy̍ŏ�/�O��[B�����[�o��3a�^	����;�a����o���������t���qF3f��Ǭ8�~�w�I8q�O�΍�{�7݋�c��_ܖ��������wGܙ0㮄w�1;.���]��7��}	/�OǼ_���{-^O��F7�o��ފ�v��p����K����fd������F��/��H�0�]̤��b���3u~��f�8'f+F��S���(�f�����&�fi2Z��d����h�-F�)��V�V̼m��ɪ�^���b������4��a7��v�S���b�L>3��33��ڌ��mV�b��`3�a-s�1ɵ��b���e���2ᓙ�9oFˬ5���X=8���U�w�ۓ<	�y��2��h��d
��f�����ߖfhL~�2«���h�3�u���f��E2u��3ڝ��Cjv���^Ū�]�v�b����G�h��*i���a=�}�4�+��c�R!��zv�>tN1V=�<��g���ޟ��i�����7���}*��9f�Ԏ��u<ޫO8��>�n1^*Ȍ����P���x_/���'��Tڧ��d��v1�w���Nf}Ծb}�����\:��g�ϯ��c|�QS�1��KO������|�N1�����bzʌ���M��o��x�_/#��|}�㥨�x�A�W��x)*3^�ʌ���:��9D��1z1�^^�i�TC�:���D2^�p$��9G2^�v$�ՙG2��3�T}�b�4�Y�7�����^	^�ʌ��2��YI2^�ʌw��TU���QT}�H�RT��y�,�JQ�������Tf�4�+M���T�OS�Պ�^�Wg0:���TU�/�ҭb�k�]��ǻtr�3=��㥪����[1^:Ōw�b�{�ݫXg���./]��ܧ�:]eƫ�����㥭�xi+3^ZȌ��b���Y'���N��h�N[�>m�i�dڪ�V��2㥭�xi+3޻���0f�����奭�+/m�_yi���K[�W_ڪ?�W�O[u�ʌ��2㥭�x�-���+�)�/�nŜȫ1�9�W[%s:��Ŝ���~f��F�y=me�Ԟ�2sv�{�xu�#n�zh�x[/ƫ��d���o[�x�Vz�ՠ����b���o��i��[�.\z1^Ì��2���o//m5h+�3·�.j���e���ъ��)Y�L��������)�(���t��)]B�)�.����J*�����`�t�/}e���,ƫ��N=�8�S�m��J[���W�`��r�������Xi�<��KW��/]'�b����:u<^�*�i��^1^�*����x�j�V�O[�ʌw�b�{�u�ݧ/me�K[���Vɴ�8���~�ՠ�r��g�=�/me���)�K���Vf��U2m5n+�{{1�[^�j�V�|h�qs$xi+3^�ʬ�[���b��g���k�x_/����K[���ا��[�xi+3^�ʌ��b�	�b-���V��^��Q<`�^F8G��]��S|�[|�W���JnZ�h�xi+3�6����V��H��f���o��xi+3^�*�����Y�!�/me��g1�^^�j���V�����j+=O�jv���<h�I[%�V��2��X1���x�*�;v1�����1�m5i+3^�*Y+?��o.���j�'Yk@��7�W�>�xgy��!�iIHkB�x�,$���V���jq(��x�+���V1^�ʌ����	^�ʌ��J��&�a�K_���Q���2�ݫX+_ZGb��m5�������2c����j�V�O[MZ��2c��|<V�*�i�yv���N1�s�x��U��V��̴ռ���>����U��V�&1㥭�x�.�K[���w���Vf��U2m5i�t�V��1��Uc$㥭�xi+3޷���Vf���Y��Xk��dF�7د�ɀg�W�w�O�o�_1^�*�i���m�o+/m�������H�]���2㥭�x�+�K[%�V��2k��㥭�x�,ƫ��s��Vϑ७�xi3�����Vɴբ��xi+�wG1�Q���ZC�i����xi3�q���Vf��U2m�h+3�ً��Vf-,�b��^/m�f��<�xi+3^�Q'㥭���M[���Vf���-ƫ5�d�i�b�j+=�lki[��Z�֊v2^-p'�����ZZ�Nƫ��d�����xw�ޭ��	^:Ɍ��2㥯�x�d�j�Wf���/}e�[}��1���=�X+��/=d�K_���W��բ��x�3^�ʌ��b�����ҵ ����#|?�c������j�1�c���X߬��V�O[�����Vf����{�����Kf�[q���ɀg�W�w�O�o�_�N�����V���b�m�m�o[�xi�
�ׁu7&��Llڪ�u`��[7Xwo2�n�d`��Ӂq:0N'6mU�q:��e`��ǁ�80���x��4T�������80�ρq:0N���8�����8Xw�20N���8��t`��ӉMCU`�/���˖�q:0Nֽ��Ӂuo.�t`�N�I��q:0N���8��&`����-��ug0����8��t`��Ӂq:��?f`��ӉMGU`��Ӂq:0N���8X�;30N��ġ�*p�*p�*��*��*��*��*��f��U��U��Q��Vl�������n���8��~���盁q:0N���8��t`��ӉC?U`�b��8��t`��Ӂq:0N��ġ�*��hg`��Ӂq:0N���8��t��U��t`��Ӂq:�n�g`�y��8�����8��t`������t`��ӉCWU`��Ӂq:0N��	20N���8�G�9p`���X�[3�n�g`�]���͛�q:0N�2q���20N���8��t`��oTd��I�x|x~x}x�|�~X_��ĥ�*0N���8��t`��Ӂq:��#��K'U`��Ӂ�%���d`}�$�t`����d`�N\:��t`}[%�t`��Ӂq:0N���8��tR����rL���8��t`��Ӂq:q�
�Ӂ�]��Ӂq:0N���8��t��I��t`��Ӂq:��/"��Ku     