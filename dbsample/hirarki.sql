PGDMP         
            
    z         
   dbsisappra    14.5    14.5 	    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    115283 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            f           1259    116075    hirarki    TABLE     j   CREATE TABLE public.hirarki (
    id integer NOT NULL,
    parentid integer,
    position_name integer
);
    DROP TABLE public.hirarki;
       public         heap    postgres    false            g           1259    116078    hirarki_coba_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_coba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    358            6          0    116075    hirarki 
   TABLE DATA           >   COPY public.hirarki (id, parentid, position_name) FROM stdin;
    public          postgres    false    358   �       >           0    0    hirarki_coba_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hirarki_coba_id_seq', 1, false);
          public          postgres    false    359            �           2606    116080    hirarki hirarki_coba_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.hirarki
    ADD CONSTRAINT hirarki_coba_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.hirarki DROP CONSTRAINT hirarki_coba_pkey;
       public            postgres    false    358            6   D  x�-�Kv�0��a���K�����UD�3�%Q��>���c~�ͱ�������qx?��;�_�����G�f�f�<��MU���gk�N������v��'�a/��	�7ܴ������}�L��W��s�=\�7����p����7c�ߴ1=�_z&�1W��ܼs�yΘ7��O���o��~���l,����g�]�x���X'Kg����X�c�,����7�%�؞�c�?jϱ�/���?k�=�I8c߄;v�>16S�7�Op~�X���n��q���9�JX�����w�8����q�
�8/���߸�}����ǝ	sܕ��ݹ�W����&�q�G�n���toď�/~#,�Fh�/|����9b%�;a�8���������H�/���>�7���=�|��0�[��o���=�I8�݄;^$px�!?�
9L~^ȁ�+�T����8`~����w�9n~�̡�{�(u����f�yp��r,J�#T��M�:J����LF��2�E3Z��huԊ9nMn�"����l����6S}�b�0֐-|��z4���+F;���a]��#�Xa4��r����7r�·�f���h9��9�c�-Gm1�5�������xW�y����ЮhF��^��8H&�D(FK(���K2��l�݌u�f�dD1��hI�b��E2qa�E1ړ P?R��%7�ўݬ�?�h�mF{�-9R��(��#-4b�gc%Q��*�V"��X�i֗�mƪO��c����k��Ik�^��7F���12�/�S�7N�7��8�}�x��b��WLAT��y3�7�'�d���$#���ӌ��f��S��j_��m�߷|�Q�|����e�g|�SN���KN��KN����|�S�|�S�x�Wl���f���x�~_���������*ƛ�b�:oH�KP�%�����X':�H�9�7����LC�:��Ɇ�'���#��9���#��<���_1I�Ӛ�T�:���xg�=������U�x��b�:+I�KT�]�b�ʉ*l�����JP�X�U�+AU�`%]j���*�JRc%�j�$U�I*�֌w{3^��h�ʉ�o���f��4�ݷ�ǻur�3=��5�%���*?֌�L)�{f3޳��ݬ��ӌ����r�*�d��U�x�?%&��Z3^Ҫ/iU��*�{w3^ҪX'���N��H+'�rLZ9i�LZyX3^R�/iU���*��/	S�7n�Ρ�o�����^��_{I+�%����/i�O�ՌI+'���V�xI�b�/�u���u
�Kf[3'�J�d��Vɜ��V3g���{fmyq^OZsjOZsv�{�xu�#6]=X3^�f���I�KZ�݌Wi��@ZM�Jc�p4�%��������nͺp�f�$F1^Ҫ��f��^�j�V����.j���e���i�xuŔ�k�ٌWWF�xu锌w�W�O���Ք.�tݔ�W�Q�xu%�W\xk��L*�K^�rm5�UAX�~�8�K�mc%������`%�rLZMҪ��f��P�OZͭ+C�[׉�/iU�w��/i�c�j�׌��J&��ڟ���U�I�IZ�=���ͺD=�x�m�KZ�%���Vɤռ֌�z}�j�V9&��]�x�n�KZ���6�%��V�xI�d�j�5�o��%�&i������[^xI�b��U�.̣o�f��WLZ�g�x�7�}��KZͧ�1&����xI�b��U1�ͺ'�u[����f�����<��}�¹���|��|�h�5�%��Mw$�/iU��f3^k/i�,����xI�b��xI�b��U2i�H�b��f��U1^_�x�������V��KZ-��>'i�\�H���"��I�EZ�ެ1��\�x�n�;O3�Y�/[X?�s�V��*�KZ%��iU�7o����fO���f��ƫ�>�xW{u?H7�twH��tO(�n�ɫ�;C�xus(��xɫb�~��xɫb��Wl�Ж^�/y�L^-2�/yU���f��U1޳�u�K��x��>i��ni���*�JZ�>��"�rLZ-R�+iU�������V9&��=ͺ�v������V9&�V��I�֌7��'�i�c�j�$�xI�b�q��Vź��xI�b��U2i�H�t�V��g��W�����*�KZ�}�/iU���*֍�׬{��d��5\�/[xj�k«y��yç�������k�KZ%�nsZ3^�f��^�j[���������i�KZ�%����k�KZ%�V��*�Vo�KZ��ՌWi��@Zm�-/��U1^����f��U2i�I�b��U�n��f��_�jO�Lw|��ӌ��(�;�/iU���J&�6iU�wy3^ҪX7�W3�տ/i�Wny�]�/iU�W����Vɺ�MZ�%����-l1^ݳN�=�݌Wi�Ϡ;ۺ���ܺ��;��xu�;��q�I�����xu�;/iU���f��ߣ��兗L*�K^�%���C���&���W�xɫb��Wla�L����Ӭ;��/9T���*�K^%�W��*�K��%����j��%���!���Fl��j�5^3���}H��Ĩ��XI�b�o��XI��V��f��U1���V/ޗ��_2[ؚ��;<��5�ռ�ݼ��|��|�h�uO����lak�kތ�f3^[�xm7�%�rLZҪ�xM�1�5��1^�*Ǥ�!�r�Z���x]K7�u��h�׵��1^Ҫ�xI��%�j����1iuH��Vgj�Hc�ͯ�xI��"�	��_�p�PU�5�[5\K���Pg�75�,-CQ#�	�����U�ߑ��^�jxI���]�ޥު���M��:[���PgkՋ	u�8�	uH��imlU�KzT/	U5�Za�ޭު�=�MM�pG��i)N�m�i5N�q�iAN+rYëE��iY�|UÛks����\��j�.kx�H�Kwxs�N�wxI���P���	uH���՚]��^-��%��U�Uo��^�Vo�75�zS#�	�5�PY#�	U5�$T���X�����jZ�To���z����752�<��FF2*kd�!��FF��jxɨ��%����i�S5�ʞ�i!T�U�Z�z��V���/��~�k��ڂ�W���j��jVo�Vo��zS3-ê752Ꚗb��QWk���Q״ �^2�jxM���%�����[5��ު�u��FF]Woj�`��FF]2)kd�%���W��Y�K&U/�T5��ު�u�V�Tojdԝ�M���dR֦��52�IUëU���%����L�ީު��ޥ��ȫ�ԛyuɤ��W�L��Һ�����L�^-f/�T5�K�Uû�[5�[���Ww�75��IY#���U#�.�T5-��jx���Uû��ޭު���ޣ��ȫ{ԛyu��yuɤ��W�L�ޣ�}մ������Y�{�[5�G�U�{՛�+Г���=Z��.�����=`�5��8�jx��A�������WOd�8�^=s�yu��A>��7�<�SxC��ȫZ�WohuY5���jxɤ���Vo��jx�=����75��IY#�.��5���鄬�%����L�^2�jx�IY��jla��a��^l���/������1y]X=4G��Cs�S昞�P�Ka��r)L=�|^�'�KA��r)L=�C.��sȥ0�������Ճ9�R�z0�� �z����!���	sȥp=J�r)\=�C.���<���9x]=4�T�K1Ճ9�RL�`�Գ+��r)Ȟ�C.ٓsȥ��'\�N�`�S=4�T���ԃ9�R,�`�K=�C.�R�,=6���C.ٓsȥX�j�.�`�K=4�R���Ճ9�Rl�`�[=�C.�V�KA�䜭'v��sȥ���w�n�`�[=4�V��{ԃ9�R���>x�z�y�G=��^�'�KA��r����?��Ki     