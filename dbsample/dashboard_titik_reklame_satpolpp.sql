PGDMP                         z         
   dbsisappra    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    42069 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            7           1259    43291     dashboard_titik_reklame_satpolpp    TABLE     !  CREATE TABLE public.dashboard_titik_reklame_satpolpp (
    id integer NOT NULL,
    produk character varying,
    pemilik_reklame character varying,
    konstruksi_reklame character varying,
    nrk character varying,
    nama character varying,
    tgl_pengecekan date,
    kawasan_kendali character varying,
    status character varying,
    keterangan character varying,
    lokasi character varying,
    lat character varying,
    long character varying,
    posisi character varying,
    ukuran character varying,
    is_deleted integer
);
 4   DROP TABLE public.dashboard_titik_reklame_satpolpp;
       public         heap    postgres    false            �          0    43291     dashboard_titik_reklame_satpolpp 
   TABLE DATA           �   COPY public.dashboard_titik_reklame_satpolpp (id, produk, pemilik_reklame, konstruksi_reklame, nrk, nama, tgl_pengecekan, kawasan_kendali, status, keterangan, lokasi, lat, long, posisi, ukuran, is_deleted) FROM stdin;
    public          postgres    false    311   f	       =           2606    43297 F   dashboard_titik_reklame_satpolpp dashboard_titik_reklame_satpolpp_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_titik_reklame_satpolpp
    ADD CONSTRAINT dashboard_titik_reklame_satpolpp_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.dashboard_titik_reklame_satpolpp DROP CONSTRAINT dashboard_titik_reklame_satpolpp_pkey;
       public            postgres    false    311            �      x��Z]s�ȶ}���݇kT��x cŀ��I��������#�x|~�]�Ւ`b;�jj�L2�b���cwk�1oR�ݟDQ�ֻ�_�LS<GW5��<�S=�_Us�MZ�]S?g{~5J����FK%ɘ���Xu�K�=/^��t�~���-��?�M��ȫ�h���j�JO�?���,ꬸb��x��Y:3�6t�aK?��W3G�\�����*M6����l�7��J�V5�=OS5���<�IZ�ؗ��W�%;H��X��"=�Çp7MU<6y>��E�s���,�������~�̮��+��{��4�Q�qU�mn�`��Y n�1 ��%֋(	#�5Pk`l]������5�N�K&��Y�5�U�F~�CU�?�o0-����O���1�WL3[�\Oc��h��ZP����ŗ��m���؟G��g8��?�0��g_�/�������8��:-��/����8��fvms�=n�+��g�lzH�SќF�	<�k�̳_�5��n)����ƚ�)��k�΂U��ٴ������`�p-X$��z|cG3��VM����~��=dU�?d��@�Gk����~�B@��J���gMu�ǫQX�q4��h���:���:�m�pum�p�0� �%�y�.�0қhF��::N�sUCV<VF��-+FIS��u�+�$Tj��5���;f��"�G�.i*T9.��XV)���!{����i(�gh��L]���g�F�|���bG6��m��ްy���;�k���Z4����AA�|?J�y�=Sq}�z{�i_�I\�5���:��U���<�Jg��ʞN���7���tE5m�Ę���:��l��Ț*�m�?���=�b�+���٪M���ˮ�㣲���}6Z5/?r��0�k|�2�<-��r�r�=��5+^D�,�&�3^ ����k8 �{����i�h�[�Ç�`<�)T�M��w�拨E��4.�����g�i��G^�tB��@^���y��g#�_�O��x�����]4��*�n3����c����v�F��kj[��v$��ӈ~ <}_�#�}��/|2���hݜ*.km�U�ݦ'~�x�y���xó<�K��*�ӡcT}l[
4H3<���*6��d18%#jr�E�#z�1?I�q��I=Ru�b>���X�x^ʙ�ƺ��L.yq�j-�������oҿ��L��nَ�4�Qt��o���#Z�m�#�.�c���_�S�g�FlUo�O���~�V�=�|�ŀ:��"�j���沚.�e4l�K�5U�`aB� ۘ�O3$�h�	�o�c�
���i��L�c�rJ��CE<�eY�^�c
Q�LHYUY�����'�fW�P���TO����8��խ@Jb�uj�:�t�*Lڣ�>hG�4���9��5����M��W��J�I�A�e�ޥ��H� ��5-И��U
WhD؋�8iV�v�F�&X��l2�o�@����dao�ۿ��P�?��%c�Y����M
�2�����b 
�)B��e��������wJ7���>��!�Ҍںu�s�3/�v�ќ��#�����}^���U/�ʁ�lŀs�]�8j �I�w+p�� ԑ@o��%�F�� &A=�$�s��io�ı��u�'�V�#�ം�l����{�z�Y�Ӫ�`&�u4���%���ng:�ٽ��*���B(y��n�3�����J�	�����S�Է���$������+�i+�	���C�źW�#�<�@�~��V;������H�2�e��,���E��C�7�4
_�������:u8Tt,~�ڙH�VL�T��PYC��m���,����v {���ŏ�>ڠz@�!/q8�Sֺ\�t�+j��yM-ڝ�&�u�e�C���t����a�!����&A��GH�Bt��v��Q|���8���+��Wh|�d1��(bTe)l|��p���(Fi���%qஂ���nƚ��D-�K*����[��nuK6�:�L!J���]m%����)PL�Jr�\��IE����'��YD������o��dZ����ŭ�H1����<.��t;�vu�:醴���&
c�F:ZI�S�R��.�VRh�Vn�BO�=�S�W�z�N��тS�Y���d�(�K-�f@7Uq]��(7PJ�	��� ^p=0�<H�!\In��5����Bd�CI=�"5)�� ?'*
�)&�� t�ߣ��)���`c(�p�:�.E׊��$�� ��I��%�c�W2=���(a�E�ڂ�t}�R�qʫ}]�u���Խ�m�-���������:d�S�q<�f�d~x�n��N�M��V�?��Ҫ�˩�Yyk����c�K�2iP��Y�=�n�9sL^	��t�z�t<������-k&�V�L�H�&� ��f�4B���/.����N%�!����|�O��BsBpx�"%�z���<R�B��A�Z`�X�Х%�,h���n'Y3_�sv�6�L��?�#���;X�ȋ�pF��"���w�c����y���~!�`Ze(~�$+{�b�Y���d�SXt�����`�G��������.�HB��8�.�����:�Ǧ>�e	� ��(ҺN�,�^�u��	�-�x�τm��͔*��k�%�U��piB&��W:P5Z����w�,W9�{@��ep��c^�Вg�-)&خB{
����L��_wQ����:N�U�¯�h�vr��4?tY�<=�;�b�[գX�'՛�E�j��޴,Ps�b�:��9<	��O��@9����PgD�M����0�F�f���Ձ����C�{p��ض�U91��Aܤ��t�M~��BA�?^1�a���1D����6��ٷ�T��������d���#��z���+�oؿ荘�6l	M� ����Ʋ'Z$�cI,a q�`m$M״Y���?PLd[�D�e�pG��C��Č��7�D��h^e���M�gG��7�9�����Ç��D��`5��X[�M���F��6�梢D��L]S���51ީLޞ������=A���F�T`�iԨz*�Hwi�=���3ڏ*p4&��������|.���A�"��`R�,��>���%+�3��!����|~,"��2�딜�)����m�2{�J��:V��hR3�y-�YmӶ�t��{�Ov,��A�q"�jr���h�YZ?gb�A��~�����5�)����/U\,�ƺ��Ю $��;��H�"8=^�k^4�X,ޅ��8M�.��-NM�B��?ɼ�"@~i���z��IU��v�Ł�%�e9�E a%�i��{�Hm;�ct���m����?��NW���Ev�ʬj_^y5���AC�:���8Π
��]2�Y��T/]6] �Һzף��y]�1퇦�yEa�.����3`sD�E�t���v���������m�`�ڀw�@[��~#z�FO��Ehݹ���1� ��؟�~E�$њZ/��E8��f���V�+LP�K���(N�cw���v�pƵ��	\����EJ+�v����U�B��h��b�hU��$E�]��ݶ%ᢕ����4Ѫ�O��*+�Jzb'��m���}�'����fX�ۍ�زIɉ�ǚ�)&zpV!mcvq�L)Y� X�Y�V�:�a�C�����Y]�5>B,�e���+�)�"�b}���K���-�yz}���'zL��q���F�L�!7��6�b�yF��Nl� �*���C�+�Z���2��6x�Z�8fDm�M5G�[��l������aU��(��;�	����l���,�l���� �`��fr�e�s���#�h�����|;7�6���Rܳ�;���F{�Y��683����/�][:e���ݬٲؓ0Z�w�,�q��lik\U�?��t�M�'n굣\������ԡ[��oO�>�bq���~jN�]TO�<t,�Xu,*��[���S��!��S#��0��G�lr���.�4{l�Լ�2�Ə�L)�s��Z�zN?�\�4G�\��i�A3-TY�e%0�����aj�rIX�1��q2�;KG s  ���&����z���%&<FE�y��U�KY %x�a��n����,�N�x�o�L�\\m1���#�@�7�YӆB�MA���ڨ���0d�b�����(>��T��+2�6�z�ن؀hB�����%��!3x��*�K�e3��T�D��u]��Sy:�u�
��u'L��1m8t4)�������b����huZ�#\,�)!X�72.��P72��.���7�W>��;T�L!�4�)T�a���d�n�h�qd�m�o�iҿM����A�T&K�zm��#63g����^f����}F+�axn�J�*L6�mA����=��F�f����e,aT��6�s,�`��3$�2�|�i�����k�!1󓱉�|UϜ��>t;ZL��Ƀ��Hs�JA��0:�I��^��N��d�Щ�hJW�b�Z~#�GX�f� ��iޤ�6eX��?��Mܮ�^E=-�<T{�ؖk1�G��{)�{��=;�d7	6�ƞ���?�Y4�k�����w���A7B1��t��t����q),1�q�*�G��s]�>Œ�k$U��t7]~O#�@)F ������M�7ֽ�N�.Ej�g��4�S~q���bx��vD@ �h;�	a�;r���-X $*��4Z�� n��F��=Ex	������b�ʸk�P�C�ʊ�)T[�����M{��1�Z^|م��h%&=\��p�����:�܃|�N刮d�ײ�� ��R�>�{H�/�fi�s�VG�g���7��6i14+�-*F�KS��pM�C��Ct�H�y�,�������,Ϯ���OX��Ż:�%�(ր��EstG�wv���K�c�&א�6��qQ��g6Z�vT���&[���W�C��O۔w�n�4u�u1D��%�|�����mM�F3�	M�,�H�t��;�%�����4�2q�
>G��Z:�>�FP������|�.��ҷ�����zo>l�\7��-'���Vֳ5���}����Ϸ�-͇ڦ��û8H'�B��(�G�L+�r�KjwOEwb��*�_�2���e֟��G�z�*߿������L����L�l#������Q��Þ��N���ۘ�N��O�8���J ��S�:d�O�O@���Y������C��=������2�_D�!0ٝ.���v���uk�Y��Ka���B��A�vbۣ��l��_`����Gy���+8p���j��ڰ붥�悵��s���G���h�w+ C�����G��+��K�z��Df��l��oca�S<��� *SF�	z4��%�S���G_�c��x$�ʀ�{�C��Yޗ!�b��~�O��S����7X{�	tpmS�����.��F�_�_���aZy     