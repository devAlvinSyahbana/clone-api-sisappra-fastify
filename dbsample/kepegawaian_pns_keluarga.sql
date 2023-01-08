PGDMP          3                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
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
            public          postgres    false    241            9          0    18948    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    241   �       A           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 428, true);
          public          postgres    false    242            �           2606    19523 4   kepegawaian_pns_keluarga kepegawaian_pns_keluarga_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT kepegawaian_pns_keluarga_pk PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT kepegawaian_pns_keluarga_pk;
       public            postgres    false    241            9      x��][s�H�~�E���T R��,$�R��W�yI��EY�j��B��{N^`�F���5]1��y����f/H�q�
�p9�e$�/����O�X��,'1;�d��9��o֠��bo�Ji�3z���˰�o��������a����t��գ��f�����g��EΎ9Y�
v|#kvx�ٱ���Yqf հ�}����	;\�=��� v���}	6�f���B:���l��q$J�`C�A/�b�`���t�Ӳ�;G|H�7�ާ�$�q ������T�X�	��o��30>McJ"��S�h!8 ��aj!�r����~�s��KV���q���m:�y7?|qٱÁmɄ��22e�v)
�;�mfg���7X&���jԂ�E�J�+�_/��i�>��Ɲ0m-��%)]����m^Rs���w�ʵ�ѝi�_Ow�ӓC~����P�"�~haXu�)�kW�_���oj��� �_���5�°�$��������@�4^S����t=pA�Rh

$!]l�$X���4~��؉�.���)��� G�!ItQG@�����+�!��bA'd��LN�@%�Z���m�0Ci6��6#V������gǷwԊ!�XX����,�ΔJ]�2���ޏ�)��)�2�/Or�zѥ8�����-��	�n�����e[�;K�s�.�v���!���
Vsl�p�4�(��7,h	%�����	�5���k�;�pׄ�@�t��dJ���H�כ�>�z�I@(��<+��'?6�+|������,g4���VOv9�Q���cGƗ��vC�8�O�TJ���g�L� &qKц`�:+�i�Yn��	d!L���K�����0��|��!$馃�K��x��j�yT9���e<��'��tO�M���ܪvw �RD�����1B�KW�0qS���{
�K�}�x��l6_����i��]_:i�	�d?]x���2�|�[C�W�{C�w6�/�b}9c�c�KM��?��ͱ���=/���teGP����_Χ����"���@we3�`����`��t<��s�NG���1;;fû�T��+%y��7D�笸���;��*N[�u�9�t���W3�� iU@"�����͝��)啓`Gt9���Ɛ��"��EwSa��Te:�@�B��g�	?�O��#�z��lKe��\��*�N287g�\�|�Eo�%���{�9��lrB�ś��'!|G3��\�sf�qg[*���rO��&�&
&��D���B=��d�[g��?Eb����������QL:��>8�Q��G�@�-� �~ك�e�FǓl���tAC�8L噽�3�<?���/A{
_�y�����|���hx�9��Iz���:��I��x��� F���-���^�=IN���I �d����s �s.*���{��� �!YPǾ�sq{4|�9JӟYvd{���ԝ�ͽuwt��;G��ˏ����^ry?�X�C�
�C�?p�w���!d򉗀�1O��&4�Gat������s�-��ԣ����,��FA!=%�j0ҏ/m�님j9���X{���d���D���a+:C���{8���̭���`ʫ{�V�	��y��8\�e�9R���z|{�o
8��t�Lؼ��/	]~`��Ǝ��������s��c�(��9=hzY϶^10��i�(�� �i��e�:�+�Z_ѿյ������:�
j���w�����;#+���x���t��N�I�v��� H_]�#��9�k/*�oTl0G���~��X���ܹv7�(ܕ+��de	Qyy��Z_�+Aw�j�w���o��1��Ȁ�_Y���O0x��=�R��%�Z"�p8ŵʶQs���ȼ��CרnS�l�( ���~�w�ʙ��ܹ�l�:�Q�'��y Ko���s�rrK]��1��L�x��8�I�����I$9�J��8�z�{�8�
���)�ӿs�>{HRiY^�WF�>��6��}�9�r��@�+���$����u������5���O�qGw�-���|�r����7��~}��w��aU�E;�O�5]��⺧]\�H���X0>��ĭM�4J }(}�>h��hPZ��-�Axda�5�@���P%�4����\�J!R�tQ�q�u�����6Iv����v��
�~�b��n���U���B,��dӾ�56E|���a�	��#Q��Ê�C@�o��@��.�Q��*;����g�LX��ŕ�r+�Z����,�4w�� H��S�>,f?�+���b�F�J�5wCOSwuOo�H����Q��W��Oyy�@8Zl�vMTM4�]��#���_<�}C�FS|��4t�@����Y	[gW0od�7��ŗh���#��c�J�89�l}�4^�hi�H�^o�����<��hh�Җ�ð�Q�'� E���T0�X\�,�<���yΎ�kF�C���Xz	��.�5�AU��R��h0�r|+.�ρz�
1�r+ł,����^`�dy�֨����H:�)؁��T�,~�lZWH@��x)<ߝ����kV� �rl&��Vg�� �Q�{��U���H�sc�(_j�<;~�f���&ㄽ@���Oh���UC���h���I?Er�k��hp3�)�XJ�$Kt��K<��[��oV���j5nM��N�xa��AxW� ��-i-[#=8��a#�O��{f��M����'�$�kCK��:H��=gWX�	{œ�� ��2NE��s�������a|޲#C��0��� -�/,���+h�$A#7�� ܬ�W,�b����N�L�m$�uwo.uz�.��;���R䷟>��}N�tQ��Å�~[�:e��H�->��U���.��T�$Jh���'(6	��o��Kn�1V�ܼكO���6lW����ҹ�n͘�.��fp4��!�slk�g=F��ПE�G�]W.�F�Jc9H��)x���oV\?U@tRqD���8qEc}����N{���ov�+��.�
M�0��~��*�:
��dUK�r���dX٨�5sW��ܻ�xs�3^��1���l��|��;�����g�C2�6Z�d-���x�`��ʛe���˘�c�d�_��H�G��wNf���0J�����>��g;���)�^h`L�[��@O�J��ɕ��IA�Y0Dik�3H��k�e��a��_����p�[d %	�:|R���_1>�fs�#�s����^_/�@��H��}	b�ڋΡBkG���r��S.rA�]�^bV����e�"��I��K�<C%��b�9g_��(�� oK��O�|���E����ӆn,̗�U��$}��>bv:��'F�{hh�U��x�u@��(�fI���!]{QFv��-�?��D�腛��Ӊ�t���Xf�(�nu��9�-}�=��C*��xC�	m޽���~N���p{�l�i̓eD�4���<]�f"Nj����"�E�ǀ�i0�� ��Vn1A��%@TM�
��+��0��Đn��bH��/ x�U#
Rٗ�#'KX-@y�E��ԕ����r���u'�x���O��P�i�%�\�34�7e(�ڛ���9[F��f9�4nl��U�a�*�y ��i��4�I�-n�-���@�8b���'����z4���At!cw����|��Y�; ?w#ʴB#�8��*+����Y|_!�J�Α�'G�:��`���@�/�E���̏�P\��t���k���R�]�o�Oi��9�"Z�4�@��^8�Z�C6Ի2���sv�e�#JШ�8�,��T����}�����W&*5F�:靄Q��9� Ƃ���VpR�':WhT1�|Nq���q�AL�=�3=�N�pDa�):����5���Ő R��p���>M�����Wh⎢{�-�T����,�,�K��u��XҙO�G��/PD����U*=�e�Nlf�=@�җ�)D��r|��7�y�=�XD�k�񎧻�p�Ȇ���0    �8�	��`ﻜ��ȵ��~v�"�$�c^�O�!���=�{2f7��@��"���T3�X��n�1TmO�U]\��#��]%ƵUs��cT=\YY^Ņ��W!�(�"�\
�®L���� l�b�Q�0�ό�g������ūp���8�2=��O�=V��.]�߮�B�~9�0+�X��o����C�|��,�:��l�����o�
�ϊ-(hym3��Զ�`�*7!����_;���&.�Ng����u���Rq��%f͌��.��KC���i�vF(��3r{�hSGo�H1���J0_�`�{��	b�B^m�:��a�̡*�E�1ɵ{	�$��6��+>�:8/����*�z�:h�W�oo0�v)a8�u{�3\A~����1+�#��_���y���rf�� ?Di�>�WϗV׺����oP]_��/"�;'��3�ՠ:������3��ْ(�޳��%�{ע@ �[���N�˲͏5��d\�����x6mQ�CGD4Tq������C�tp�����6#MB,�Ƒ�j�jDYܬ���p,*c�q{r��Ǌݽ���EVC��� �/�MU���hu��K�������)k�/N��" �ۣ/؞M��++ϻ�`
[�� ���'l�wR�X��R��`��`q��B����zc6��}�Zi��{^�m��*!T��cB^���tO��P�c�%�G��a��$�v��~�0���Yo�#^p��L���Awܾ� �+��/����Fk�n�::���;b��R���Ɛ{�9\䞆��(�r�K�o }�H�QB>bN�]o�g]��j����7�$��u������c� \�yD�i�H�_P�K��?D��;]�ZnlJh,Nn��T�4.0T�xd�L(^f%�X��
�9�ulDK%��)'ޏD	,������erʎƨ�DMMLX�i,�?�:�]Ī���^�$�a��ۜ�S��"�jMb�|�ߛt���Z�t�d�)4��}n��2\�ZCR��;ՑCI�/�H!y!y�|F��w��f	$��^�����2��e�=�*^�u�A��F�����7��co�%� ��1�G`�e��pلF��u�Qf@%�Ϡ�����~���{X4�A���Y��>�3��i�LkZ�� u{FB�c�>a�A��Ǩ�- �ºL~`u�	�%�k*�G��F�- �b�#�[YQ2�J�\01����xVu�Z��s��@��*����ba��xkQ^�`In���W������j�A��^�8U��Қ���t7��9 ��j,ΐx7��8�'g��dgtzb�@�����"�Anx%ؖ�[�x������VH�Ȩ{��w�b�T6Y�#Q��^P�v?de���?��ƚ�Uȗ�=/�e�ȯ�pXʧ��C�����Ts�6��H-�Y��a �Zq�&옕;Bw����ajXq�����/������!Z��#t�V��N����
����/:��[�����U$�,�/�\UD�����Q����B�/�i���L��+����`��#lx��v ��VC����$��X-x��U|�O(��B#��(��B��'��y�*����&�	�$Է�	��/"�%{��
glZ�72���m���kV Q8f�9G�RA��7�k}���q�t�⬨#{c�$^.�'���^jg����x�B >�@$�eŎ?��F���U�~!Фߞ���!��͊ӯ����p"��>����
��#�p`G[�%���5?N��� IAG��LU�1?���uQ|;	��c,��-m�ڟ�Qe4,Hᘵ 0�%k%�5h�&D�՞����0�t��A�ƹ�5��,u��1N$I����?0 dw���8N v#�Q��fN<XZ�q�a�#��j���1�$�xF��1����Z�*���XmA�r����|�F��gY�Ø_�v'OJ���o����漲��Xc�#V3��{q�2+<ʓ`:mTXMn� q>�{�AHh��˽�&�j��8Rr��$���co�挷�l*�[3���Dv 7�����e
/*q��A�Ylɑ�
d, ��/��� ������.�#��S H�`�S�㗼�%�M�`�t/�
��v@_�wlw5	�B���''��H�/G��ki���m��.�`�t�\,�y���=��w�:����!��4$8��L��]�j	��̀�@�����\C�mcV�ꏁt���wT��h�8˅&����X�sM��M��1X/	���ư�7F4�k�{�t8r���z�K���xg[�n֛��%�A�J�~EBh�o6�pb�YɊ����=�(�*
�B~3֨�豹@��J�+���͒�!��q����"6j�b)�ֹ��NU�C��ֽ�Q¨{m>Q"�`ުv�a)[5�n�4��8����T*
аv��Ē�yB����T�<�l��c�Y��&DK�Kq�Y����Ժv���6��r<"iD�di�O�O%D�7˛�4Wz��.x���|�vߛ�E����I��7�0���6�ϑ�u>�F1Kc�DEI���X�4�5��>�1��dB�L�8]Ӹ��T$�U������˧�lPT@kx�
�\�$^Hq��h�4p�b��%���D�(�c���ŭy�UmW]�� �+����N��;��n�q�=
W�1-�<� |����~"��Ԉ�Gz\L!��/�߳#	YN��*YM��!�8��({cbx��,L�v��'�\� �u>�B�� ��RvQ�Yn:��@��?п[skDrg��A**��㥏)����6U_�:�l@T�MccS-��>�r]���Rn��3��6A�<�N�@�!���i34��;�W@H��`�6L��o�!DX�֝��S� vE�+�6����X��7�i�&�Rf9>B���}˽�5#a�r�!�w��?ؾMtj�\p�C�<{��Z���6J�bH��.��(Eo������ցa������̖�&�����!��=�G��!S�/I�`l
>�Q�7S4H�Ő9�^r�p�R��/�)�N��+R|��ƽ��Q~{
�@ �����	a��t|��b���wL���{�����2����/��[�K#W@Rӑ���|Z4��Y#�2�����.0*G~�iS�Լ$��w@�*��_w�,�%}�y©��K�D˱�Ǽų���H���J@����W�X���{��T����j���W��m�j�����
�Ϟs���w�j!�6��=n��-�c�j�<��������������WTⅭ�����U-�XrO<к���@��t`�@����,�9>�����2
Co,�������?�4�=�"(&C�-dWπ8�C^B�5~�*��6?�\t�{��v���I�C3��0��2� ^9i��aB4���ki�Ӂ�㨡j��R @��`I�>�M�DML'�#�X󐟗�g����G�42Ttj����Ng����ۤ�
��_¥���)��uю^�.DKߌ�l���#ޟ�U����t���ṹ��u�����^U:�(:�AE��e{��h����щ�$�R�Y�D��.�����Yk0p�t�CȫH��5B���+zT_���~Ɠ׼5��,�=�e��w||��|�P+�䋾ҁ�Bʗ�7	�G��M��/��_ D�8}�#$q�%5o҈�S�h��E8�I�车*q�C>q~"+~�e�$ɪ��kLd��V�R1p�>/��l��5�WBT=\�[�#v-3�7�mő|=�AU������*�7�'p�3�J��DgP�7D*�C��X�y���c/�7 u�uf�r jO|�ĥ��Rn�ٞ��4fq� j��1ݤ����~H�&�#(f+K�]s`�-��7Q�q���4ܙ��x�
�!�������5|F���j��]������@���y���N�}T��R�}��%+k��3^:�/q�U/�`1����ʜ5�Q��T�q�j�Z�6�D����;IZoT�tJ5B�t��>c�S�|[�Y`)_]z��O�L�U|��1���djTGh��{ �  �Y��`"�
��*Ӧ�k�	�G{�R�Lҕ@ٴa����$!sc�M1�����#�A��*���'&pj��>��6}�7��� �W�31BO��
�ɡ��i�QMRˋ�L|����xԡ�7��@��zg6ĶA���|����q������T�.����_#K����_`7�a�K/�����������T��SH�]$io�9�I(g��L�2�ު�6�8k��ogޭ/���/�d���A4�`�������D_K����4��O��\�� �Wj�!�y`����� 0w ����n���V4I�h�?�������~�#\�D��4B�n�
��t�\��,�;�%O=��tl�P�)kQ�z�լ�	���N? ��������n/ڑ�}�f��<���[�O=&�����Y���2��q�P�+Z���}�=R����`�n����h*�0����i�XPsARE1バҖl�kd�\���ƹA���{|��9{�Y�J������5TU���!W����s���¢��A,��Uv0����k���L��!��:����)^��r<��1b(�Eye���|}���������x���o���6�#�H4ՠ�(�������@LC�1����$��	�I��5�OS#��ާ��ͲCNhy��c�����U`����$�:��ڱ���_bz<���0�F&p��~�ޖD@{�� �,��U�����5GTq5�Rd�}�]Kfٹ�D#kY��Q���l�^�i-��Q�h����Ct�P*�o�_�8��U䀹>�1����0&�7�8���}�byГ�<V�vth��k@Ƞxg���iH��g���B�P�T! �0شzb8���Q�!k`ç��������j���(GQou�',����!�0"@k��9�]`4^�g���J��1���3ہ�_���G�V�����F�牄t5��7�ߌ��$E�R�N,(E�J�++�M�'�_��Q����W^*1�t�#?����)����\2W��'a�S/Yy��;���.�}�#9yݵY��\LgJR�Ë�Qk���fʙ��쬃�@N�qJcoNA9��5��;Yk�� @�q��5��S���'��4�5Y�A:��}V��̏�����C�~Ys���a@�i#�p�۟KhQi$�C�Dq�_ծ���֐FB��C��6'�@�{�5�ϵ-~u�q!&P��~���ߢD��x5���5�(�[o����U8|�����j� ֠�� =���������8Ҳ�:�Q���/��W��6Ъ3%j�l����g��yZ�[X���m� �����fJɟiL�)�ś1d3���p�=����J��<�d��y��L5Q)]�xDd��M���zo0�d��\@QN���W��	�,��e$1t��i��w�L���a����OMs���B4#��~��e�a8&
W�����JP��+y �N6���}�oj���
�c��.��F�����8������x�c�>A���Z_�t<V�%��9�˷B㭖�ygW�|N�ZKb/Y��OA�!�4x
��d&bXY���ּV1�Tª'���f��I������\6z��G��5�5$��s-����c�Nl�Fゝ����D�!������_?!���QHj�{}Ŗ����-������g�^s1@��G���o}�����{����?L��c��~_����:��;������www��-l�     