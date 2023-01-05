PGDMP     (                     {            sisappra_db    14.6    14.6 	    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18948    kepegawaian_pns_keluarga    TABLE     E  CREATE TABLE public.kepegawaian_pns_keluarga (
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
 ,   DROP TABLE public.kepegawaian_pns_keluarga;
       public         heap    postgres    false            �            1259    18955    kepegawaian_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            8          0    18948    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    241   �       @           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 5, true);
          public          postgres    false    242            �           2606    19523 4   kepegawaian_pns_keluarga kepegawaian_pns_keluarga_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT kepegawaian_pns_keluarga_pk PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT kepegawaian_pns_keluarga_pk;
       public            postgres    false    241            8      x��][s�H�~ƿ"��e�B��%F !h	ًc^ҍlT������9y��l�rv7����:&?������fǏW���s�p>d�$��/����2�w�4#��m��?����Y��;_&4�����eX���a�e�����P���c��3=��<f�#���3v��꘳�Y����������U��хU� �2f�s�#���d�λ���o��?�!~_@g����-72�C��I�����nD�)����k��~�iY�]O|H���ޣ�8��EfI�D#�`,Ä�����0M"JB����h �`������Mr���NYg��/i���Ń�Z��3̻�������lC�����	�6�s���^3;�1�6YV�c�P�ͳWR\X�z��[�A�O6��ik��F'N���݅m��C����v]�ޙ���t�?=�g�-Q+���P
���UŘ���y�=�A��H��w����]�YC-[�A��\�'+�/;tF��s�24zm��;��h
������_��y4z�%�8��.���	��"�%I�t^E��t-GJC��������� 4������J]��aRml�MJ�� �����/�Ko�(8аVk;aY�;S
u���=���:�J� ~��ʖ!y�����.�3go�o(�p��hm,���YR�Cv�X��l�__l���a1���aE9�%�aN���)ytWhH���د��`�M��Z�;&�J��5%:�F"X��Ƀ������A��҂�`{�CM���?������w����6�;J<��}m��|8��i���� �P����<SϏH��h�ւf�w�Su���$�:�V��n�c��I� .�4�~��p�h4�e�x�ּ�@���"���e��޺zQa��Uۛ M)�J�x�]����-��w�8�)Ob�>��%ޜ>�?Y6�oTkgܴ�+�4؄5H���]��x�����+ݽw�[�?ӕ_�:�0�ز˹"��Z�ֳ��<���xa�<��_N���q�"���@{a3����=�����p��g����c�6�&8�w])�S�W
�!ho�(Oi~��w�C��
����si�����l�2�@hsaW��;��Q�*��
��bJ��� :ID������t,8])�t4��>��`ƞP����w;��tIa��L���юS�7'��lw�o%������o�=�	͆����u/c��>�e�Ɲm)g��C�=����(p�t"�ҕ���Eg����oi{3������t.=0
��q��k
"����z��'^OJ��pAC�8Li���3�<?��헠>�/i}�B��I�Iw�4��~f�Π�ls�0ަ�9�a�gK#���tG�#�.�~��t$18���01yd��E�qw�}��� ���wp��-B����g�؎���_����ֺ������2�s�&�e���~ܲ��<P�?��t�z���#n
�y�W4�Q�+���ޤv��]��P�q՛�qG���+K9���KO����Ú��SF��"�Z���F�{��d���x�p�A�;C���{8X��̩����`ʪ��V���y�Ѹ\�e������%���&��
����D��]ߨ��xJ��=�7v�eφ�X����HsaFqK����Aҋj�m�����M�Z���L�L�W������5����شǵ�F
�{חB�/�3��;�7�������o��������32������\�ZƦ�s)���l�*�]��Ƶ�����!�JV��'����w����vpח��~���/�����WV���.�]�!�xU�%+
�S�U6�����{���8FYM�Q�NBt[-��g�>+g�z�;G�� ^=
��<�e*b�.3qO�\N�`�R�?�a�f�ʛ�D�K���N �qT��cƉ�ޫ�	�*��[����#��=C�J�Ⓗ22�њ��*�ϙC(�����$��?6�< P�d��m��>��� o��>����X\��+�anw����,�u��޹seb�P�6m[7��kv��j�l�	�C�B�8T�G#� ��-v�G?�[N}
N�
��y���,��Fhп� �F�� ��e�<%@J�UG���p�<�Ϙ���S�~W�V���(�a���^F~@��{?��(���Z��q(���Oຆ.	����P|��W:��=���,�=�8L=d��(��/�.��[Q�T�O`��Jr�H	��-:h�"�������ϸ/�5�gZ����(�����Zz[z���o�J�����|ʊ���|S�k"k����*)�}����廼��>�_0���bm�^@��qVW�ߢ����Ȏ (��d ��3%h,�hI�P�^w���ٹ�g�h��Җ�ð�a�'9��	E���3iX�(�<슪<���%%1�@W��%�^�$V��e �)��3T��9�������>C̱�R� 
`�H���.���5r`�n�n(���@���/"��q7-�P�0�g��&�Vx��_`^u���j���4*�g��߂S�USA�u87���K	���/8l⿜@�a`�p��7��iH Y$�`�uRp�>�'�>� qJ�3#�B��dK�D��ayi�'�n#~�U���!�F�D ����+n#�3p�-��x$��ek�gG���m��	9|�l�����;�}pM�(ZZ׶g��R�g�[4f�x���C��`�Zʉ�H�>�X��8��g=2к�c*�Q�xB���hA�	��݅��*ye��F������F"Z{�ևťL���z{v؞�����]נω�.=jPz��tϫ%�cz�b�����/P�M��ಞ��O@���L~�b���lt_r]}��N�E�ݿɖ~���f�ju]#K�T%0��2]���u�h��CVk��WB����sB?�l��*\����r�&�S����,��d@tBqD��29qAe�O��m�;Ь5�+;Z�Q���{�p"/k�o�U�dWkEau��jIY����t+ky��f�* �{�N`o�;�S&��t���\_�`����}g�v�����HY��Ud�K�I?�z� ��4�ѳ`e���@�W��wF����0J�1��k��I��}���(S���ђ��r|a�MGR��u6Q���!�zm3���Ki�n��f9ߣ4@��)@I§�V���-��~3�ޑ�9g�[���s*�*5�;�`߂�"��s�D��!�30�hꤋX�.��~�<t>4��@ĸ:�9�ri��(d��>e�X�15��GJ�S�0D��<�������rTA������GL�����Ĉ~I���_kw��ɓ��4���,�+7,�����et��"�<��:$�d�!]rN���%����5G�����A��A@%��,���;.���	S'�Ng>��,^�dE�0�̒�l&�F�����(�X�x�)��c7�C*1*�f���ZD崑�@�x��@�	=YMi��)�7�
a�ϳjx�B
�"~��x�(�ߠ�s�=��*ɟq(']�<Y{�7JJ�8-0Ŝh��T��I��(��W�4���"\t֋�V���W�*e��zdF�0����hQu�42f�䈭�������7�CK!:������tƬY�; o�eX�sU�J�t�=�+E�wHܩ�I�s$eɑ�*�_a� 6Ղ�_ګ�a �{���6�`�ƚ৮�U]�۞r�'4y���Y�YY p�A.z���C�g��"�v�3��d�#���C��8�R�WFB���=ïLdj$���4�;	�h%�s�# �!��5ᤚOtJhX2�<Nq���q�AL�3�3=�N&pE�)�������Ő R�'p��Q?M�����wh�F�>�h*������\��%����v�4�c���`���>��eG�
�FY�7�[��h�q}i�A"dt>��Û~�x:&� o�j�A���YN%�Т��8�    ����0ϛ/��͈�
�\I�g{)HR<f��r8���##�w-*��&�nLE1�ٞ�*�v��r{Z���ڦ��`(w��Fέ��Q�p�Eq�د\fQxF4>��]��h1%�>�N�8�8^a��IN��o����W�|~9r�er:�7��}s	_]��.�B�~>� -N��+7���%�CU���L����x�r�6X��|Z\��4����o���Y¯���-D���R��\`��:�xl��g��YQ���K����$+nϝʿ����:�ԑ0T���t��W�9(���g�X,��-['r4���9P	�0=��r�.!��4�x�G�=�ź���r���þ&yU��C<f����p�K��
�3��/i�xN�L0}���7�3�t�!J�w/}<�]�^,'�Au}�3^_D"wF�'�Y�:������3��ِ0�ޱ��%�{ע@ �S����9ˊ�ɏ5��d|u5@E�)b�l�H�t5���0h��z�n��'�1i�t!�*iF� �XXƑ�h�hxY\��Z8&��ո99`�}����D�"�!�Q~ �/ʦ*h�s�:IF��L���D�t�j� ŋ�Ȣ �a���g���Ӷ9����<H )�1�aM
+R��F�o���(���!��6f�_����EKI�zϪ����\%U!���W��cڇ}bQ�c�%�G�&�_�$�v��U?���^Ϸ���/���[*i|=�A�<�nWW2�n<���>W8�"�yt�q�7�=�K��BA���p�{ X��l�	/-�A�tU#I$FY��s�/�j]��=VHU����W��Rl*64��=ۄ�U�G8�p�f~�d�9�ܸ>�Cd��s�L�a�&�F����L�H�C�pѱKf��b1+NF�B��P�ցo�6`i)đ;��x���(��z�]P?߰CN���6�(�	��	�ym��'���X�3ύ|'Sl�Z����(����@k� �W�N�j,^�EL�~5�am5 ���8������_�ecHJ�C��:r()��% *$7 ��[$>�}5K I�<s�أ���.��e���Z���L�'�\:�ܑ_�����2W�5����&4��o���2 *p~a�����:P���ݢ��K���
u�3�1����Ӵ���~R��T!�8�C:h}�8F9�l~�.d��3O�+�pmC�.�W5�l�Kw�ig����Pd��P�qtt�ĳ��k���a��H3�~����]��⭅Y��)�Y�!_q��ӥѪ�r�>?/p��9�������i�bm���X�"�nt�q �O�f�`'4zb�@�����"�Alx!ؖ�[�x����v�vH�H�{Ɋw�b�X�Y�C��m�P�K�~H�YSs~m��5].�X_��,ǖ�/�ᰔ�������^Ec�36�g2I-�Y����Zq���[B�_%����ajhq���DɊ�s7������[��#t����N����
˶��o:��[�jl�A�J��˓s�J�T����Q�"����/��?�L��+�!��i0A�2�!6��W'�3�Bˡ]FWs�@Q�,�%��E6Wh��E�Zh�~`�������o����IBy+��/��+�oV8a�®��q4'os$E_���{�8
�
�(�a]�kl�{��gE�C#�rޝ9��1�B;������?�����Ar[�����}��[�\��%�&��4CvYl�?SpB���	���Tfg+�#~^tĎ���pl��h�C��8e��8}�6p�3eV����,���7�p��A���ҵ�����I�FÄ�Y�Ch�F �^��o�ATZ홏	(3OVsꇨ�kXMn��RU�0�p"IL�whh��.{OJ���4"%�a��E��A�9�]N@=�G5�E␁e��I��S��E�2{���<�mF9۝O�A�|�4�u��m{�D+��z&,��++��5F��0b5�'+õ«<�'�Z����	��M�g���y��k��o���!$����{�L\1�Ư�x�ʦ2�=SA���al�Ė),T�|����ے#���[ $%_P����-#E9\0�:q� ���.�"�/y�"�uy�i�p�+��m	C�ޡ���I�+Y�Q��;���|���D�P!�����	�>IV���7~�S8Y;י�/�]�$�����zep�RkWK �ol���'��dbo���X}�mU
�Q�+�=����,���c��5{`�om솏�jA�Ի����(�
 �j�p�� ?�ղ��#��Φݬ7yS"�jI�~ELh�o:�pc�Y�򎚽�ޗ(��q^�et��\���R�K�ګ���!j��q����"6:j�|!��'6�nU�C���}Qum>Q<L��v�	a��j
]Ӊ�'�kqڻw�U���v��Ē�x@���N��<�l��b�Y���)xK�s~�X��χbj�����k|~>�4"F�4�:�S	Q�Ͳz>��^{���i��߮���Sh��f���#˰�I���Y�:�p��%h��"��Uc���/d���a��+2�s@�t��h���t��*�hN��SHָ�O+x
�X��n@q��h�4p�b��%�.�D�0�a���ŵy�QmWm�vVW�317���5����Q�=
G�1-�<?x����~B��T�z\L�~�_������)�T�����q�!Fa����(��Z*�������N`�|C�k}���D^�K�"D�d���g ��o�L@�ṋȭ+)�hclw��t4�#I�5����v��(���G4¦Z��=^r]D��BtOg,�m ��y��bM0��Ѻk��A{���������m���	V��EX�FM��I����Y��GFh�Pw��k�&�\�>B���]ü�5#a�r�!�w�;خIth�\p�C�,}�����6J�bH�)O�0Ak�L��Zk_��aumpӆMfK����gu耯���G��!C�7��`l
6�����)���bȌz5�O9hT���X^8���j�W���c����Qv{�@�#���9��	a��d|�^}���홀!�������e)���_�7(�F�$���#W͍��h�˹Ӛ�e�i���]`���,(̓��yI��ۃ�U�|��e'1/���NUl� *Y��u�<f�H�}�GҴ�WJU÷�_�f�G�O�S�W#\���=�Ԝm�Q�78=Η�|��s���j>{���_��`��58��B͏�{G�i)P�*�}�_�lE��е��X|y�F��	��c��Z��봘��!,�rg8�z�����;�׈���+�W�o?��0M*O���@Gw���g@|��!�PX��|\G�͏�(�h�"��dk�Ќ�6u���>,��4R�0 ���W���i_�	�q�P�1�[)� ��� 3�&�#�&&�ő�/��y�ǹ�������F��fAV�^���D����Xy�T�P[�5����w�?#��tO/pKKی�l���O���Zzu9��b����[���*OF���gU=p]m�<a��9�X�l_���xGB	�ԏC�A���`�\k���4��U$�	�
!F�A�]zX��9���6~悂ʓ�5��,�=�e��O||��|W+(�}�}��\_Z��17�?�+�q���t����QEjޤ��Q��p^����{MU⨇|��H���a� ��kLdv�V�R1p�>���l��5�WB�=\�[�Cv)R�7�m�'�<z(�2-#2��#����;O`F�t���Π���$��õ��`aEG4Z̮@�&��V�@��{ �ٛ��h�=WҘU�aT�ILFt�,����>�Q	���Ɗg���v���M�j�^\��:w�= /^�¹O�8�/gr|�QzE��-}W=8)�l�(�4p^��d���zU��{��pˊ���/�Ǘ��e/�`1�������Q��T�q�r�Z�:�HF?��'�oTuR5b}i��]�����m�g������>92N�T��.��r����]��R�3n= �  ��+ރ	��_%�$H���z$pT��K=�?N�e݄�ړ�8̕�6A�?X��� �����í���|`�u�Po�������gb���D�C�#������ىxh�/�񨃞޼O����U;����s|>�������g�nO�7ȭ�):x�_#J��2��c7�a�s'�����������3p�T��"��k:���4$3��@ΆәFe轕m�p���N�k_22I5&_�T���x�n:�N��}Y|���,�	g��,/����|)�._�&��V�t�9}��VYU�ŭp�<�
��keÁ廕*G�h,-_��pe����!��	rQ:|Ȳ�o_�<� �C�щ�FB�MԢ���W�N��"�OƁ����^�#���d��]sB��9>��`���̲��m��=����^�rް��۟���<r9u�u�(Mf�FS�q��mpP����XMCG��p�J���4֖.�F���V�i�4�п���+곱���J���K���������`qՉ�^�1�}m� ,�(�r��j��g2��r͒��D0$u]���8�+��'>?F�%4/.l�x������02���#��w/���-��hC=r�DS����br���P������O�O�g�~��6�>%�l��3B���`��w���'��=Mrj!��_[v�BP�)���9z1id�>�G�mIT��K�r�̲7p_Ř�J�@sDGP3��y�ەݵd���T4b��f��5P>K�Yζ���w�";Ԍ�sѸn:DG	�\��&�d��L�g�����ph���0&�7�8���=�b��'<V�vth��c�ˠxg<�|3�Y��Zig��@�T ��_7zb8�����aC���O�� Ɨ��>�@�Q����O����'`���V0,Cs������ާ�kI��>���3�>�����-���O���������ߠ3�Β\Z��u|A��ʔ��"�4$���_UgA��aY|��Ng[�Kx:�BM�{��%s4yF�����l,���78���^��r��t�8�;<�6���'{��9�y��:�!	Ĕ>�4rg��?޳R�㹿�0^t�?�3�0�1%c{}�O�����QܥN����sl��g͗�0�l�1tD�ϐ6���ݩ���Dr:��' �e�8CX�zii�!�[�3�����D�zO8�f{���s���@Q&��4J�m~����jakm�Q��^�[��p�z}9���A�~OAZ�5}[7���q�e�t�W	���OԈ���;%r�l����i���3T�<��-�A��6���G�{t=���$�����J�Dٌ��c*�g���_)x��G�lV��=κ�)'*%s�����|�N�0�SM���액(ʨ�(Z�,�*&��S5�$���4\Z��o����C*�o��S�C��4�/���j�Aw����N�m�g��˅<�Q'��f�,�,���B �ء��7��v@q{�P���߉�1��b F��
%㑿�(@�W�a~o���;�|�s��Z��*!|
ba�9�S �e���ad	:���Z��S-�$�l���&�NC387�2�h-�C{Toא��ֺϱ@�+BZ�m8�	�sv�טˮ�B͆�Zf��~�A	S#/�H��yww��֧Rp     