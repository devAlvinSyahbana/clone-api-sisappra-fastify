PGDMP         7                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    241   �       A           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 426, true);
          public          postgres    false    242            �           2606    19523 4   kepegawaian_pns_keluarga kepegawaian_pns_keluarga_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT kepegawaian_pns_keluarga_pk PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT kepegawaian_pns_keluarga_pk;
       public            postgres    false    241            9      x��][s�H�~ƿ"��e�	�`�#������1/�F6*sqK����9y��l�rv7����;:?������Fǋ֡��2�Pӿ�����t�Y,:Q���>خc����s�Y9��X�4�t;�
�/�k�?��cH��?��v���h���١�wfE~N�cz�3B��,eǔ�O;��5;�Gv�<�w���ڵ~t{��dO@F�P${2>YF�ا�|6�����t���?Z�Yr#C/�H�ކ��N�4���M�v���ٿ�	��ܻ4��4��_�y=ѐ*�k�JƏ��30.�CJ��zS�h �a�]C����dG�����8K^����m�>h����/�;ؖL��+#S�n�E���A3;�1�~�6�f�c�P���W�_X�Z����� �'O°�P�n'������m��#{���v]�;�3���ztH�;�� �	��<-��1e���{���-�^����1z|�FZ�<�(;�G��[u蜆k���Ge���]z`�w�h
�E>]l��[�ع4|�%�8��.���)�wC��>�tQE����Z���إ����75A�?m*0��z������&ۄXVc�9�_l���Q*�p�a��v��u�)�9������*����+�]�ˣ�^Pd'���΂�%{���û����v����)�9`E���_�1�~}�]�*�� .��� ���}/���Y�5 �2��"�7Vkn�杩D:�P2�c�o$��כ�<�z�I@(���4���'=֔+|���lm��AwtgJ���R���e��׎���UNC��5� )�z���䙺^H�A��.�]u���{$r;�V��n��m}��!�4�^�Dp�h8�U�x�ּ�@���2����e���zQa��\��7 �Rx�����1�|�[[�2qC���y��K�}B�"lߨ�θa�w=i��&l@��x�DGK�qig�^����Z�	����uq�8b�.EE�h?u��߇R�y񓄧;��eY
�p>uN��_� ���3��0Xv9O��ܻ�Q�a`p�ֆ� ��'�x�JN!��9Ɋ�8y;T�����n=����{��j��� �2��vE0��3Ze���r��.gtC����XD<ܱh�*ۀ�#E��'��g�l���|��CxNg��-C)̖�I K9�Q��L�"O��N�Q"�?}��Z�����YF�?
71�O�|������Bk����L�L޻��':``?�M.�ND"Pzr����r������-m/`xv�u�C���FAbT"�nP{M!@�]v�٬��D�i	r.hH�)-��y��g���ԧ�%��Z@(�<M���������H�c:�ȶ'��mj���w�4�.{I�$:��B�'�K'�s�j	��@F�XT Iw���A(B���}g��h�"��+Ifɑ��oX��j�,n���`W�z��#ä ء���~�Su����q�W>8�L.q"P��̓���^�@(��&�7��{�U��>wZ<���sx���L��AO?�9L<��m�_�P��W��3c���a��W:}o���oxg�UZ���0��LYu�`��0@C@�>7 ��_�/�-,�Ƿ7��U G_]'�����O	���|c�Z�lds��^�9�4�!fw䉉�$=�F�]�10��iPK��� �i�i�*�-�Z_ѻ�<��������H���R�=�ŝwFV�a�����阼�����<��A�2�*�#��)�k/��el0G���>�F����mn\۫A\ܖ;��dy^y~��Z��A{�j�û�����7X�}�g@��,K���'ty����R��9�Z��p9EYe[�9Y?�g�>�(v����)�ā����3n��3�}��Vi3��A�B<�=�=���8��\�S=��#����MhH�X����>�1aH�o��Hr`{�q�����uª
?��!d߸��<;�4�/�+#s��I����9�2�__�@��c��m�qn�&-�C�(k������^a�ŕO�f)�v���˂_Oo�;{X&vQ�h�vu0䉸�a_~��O��0>�(čC��4R��P�b���.���̣മ��[T�>��B[k$�����
�ix��<]���S�xQűe�IG����M��S��r��h_E���߽
=������Qm�� K�P�(���u�;��=8�����t���*�+�Y%v-pz*Ȅ�Q��]8] E��**�j������R lO9ڰ��b/,gd̲���e���Vs0���?M�I�U-�%=��"?]��^_A_>��� w4����Țh8���GJ���<�}C�F}��4��@����YG&Pod�֕�ɷh���#)�c�r�9)�l�D	�%ZR;R����/d^�u_�ԡ|t{�ݨ�pB�*�?eL[#J6�f܍T�99n/	�����-1�$���0Q��H������|��-+��z�1ǲK��(�e"��^`�dz��ȁM�n$���@���/"��q7M�P�0���6�VxͲ_`^�u���l��6�Z{��8U_5���H�sӵ,X_J�<9~�a��*㈽�����'4HCɬ A��g������7�\���)%̌4
��%����K<M�[��Z���h5�&��n�Xap���{�����#i\-K#<8*�n#8�O��{f��M%����k�F��Ի�CXYJ��]`�&�o���cH�5lKK9q)���'�K��!����G�z7`%�jWhU�-h� A#6�z��Q%�,X��h�3>��2�[HDkoސ�&ez�
���qWd������A�?]zԠ�p��WKV��|�!���g�_��]��c�e=�*��D	���&a��.���6��#�ʋX{p�-��k�v��0�F�N�J`�e�*��u�h��Cfk��WB����Y�G�].�F�
c9H��)x���o�]n2 :�8���29qAe}H���N{Ь5�+;Z�Q���{�p"/k�o�U�dWkEa�H�3�,GɞaJ�����P3v �ɽK�g�7Ş�E�� 4]ke$�W�1�c�����Y�}�8$#��5R�bq��l�ϴ�6@��>��탑T\0ZdɑЯd���@��-`�$c�>��#���]�C�5��ׄW����`��{o:��&��a�Ҕ�gp��	�k�i�_JCw#N�4�����H J>u���UG�r�������������꽞�S�f���9����A���:sȍ�N�d�g��K�
?2:�n(b\��⪞4�3��HV�S�M,���m�#��)݂����S��O������UA������G�N����Ĉ~I���_g��ȓx�,���ܧk'(�����ɽ�s�q<q�.����E荡N隣X�F�Sߏߧ��7t�z��jo��!���	fs�L}o-��qw��J6qR���b�>�H���%So��^@%F%�,|��WK���6��w�7�'��!��3��X!����yV/\@Ha_F�ԟ,a� ��q�'2P%���r�ϓ�'��)�$�0s��oSq]M�D�߿vf1'hΖ���Y�6����
<DP)3�#s�{ �>iTeE�����1(%Gl]>���z�� 4�Z
q {_p?9�f�2�yۍ(�
��㨊U�%~��_	���C�N�N�#)K�,uPY�[�����E��^͏L�P\��/4���k����V�l�o��A���٫rf��fjd�̞a�ʃ��C6�]��:�);���W�ȡ�C)bXT����}��@��+�	#*�}��N�(Z���� }A��gM8������$�Sܪ�v\�j����E{��)\Q8g�F5x@�z��ir1$��)��{�OS�v��5���Q���
�]4|��"���a�����]�%���y�A�p�E�O��_�ѡ³q�g����a6Z6xW�=�i ���o�q�=�D������^g	8�dC��?�:�    .�j�,�_�}�A�����R$��"xL��	>�x"t�'tO���ZT"��M$6��bF��T��C���0l�ŵK>�P�"1.��[O���J��"
Jg�_�̢��hTd�]��h1%�Z�qFq��,=3�A��Xy.����r����|:�n�=f����ʿ]�I�(�8?�Ϙ�+7���%�CU�ٹ ˿Χ#�c�{��[,�I��/M��V���ę=h���Y¯Y��"���[��Y.0�dH<�TRYĬ�QC�%�'��S�4�;#����u��#7`�u��|!�(���g�X,��-K'r�ZpU�.H�	�\�K�&)��x0����΋u>S>W�\uWGM���5�xĊ���p�K��
�3��/�I�yN� ��ާu֛͙Q:5R�%����>��F׺�ˉoP]_���ȝ����}֨�]�S���ə��lI��`�Y�M��kQ �.}pB���y���Zl2�����1y6m$QzCGD4T~������Cᘴ���%�H�8��^C/���QYǤ2�7'���޺��Sd5�8���E�T�u��P'�(��)�_���NY��xq�%OX�G_�=�nw��w���F�AI��kR`X����7z�}s��WE!��qt�1��ֶG,ZJ��{Zu�-��*��
��ƀ��(�>��J?(=4��'������q� �{=�&G����o����1���z��+�='���b�k�n��<:����9��U��{�9\��V�([r�K�o =�H�Qb}Ĝx+����h��R���3��w�u�������~o��6�`��6ͽ���:Q}���ַ��AÌM��ͭ��j������̗�bV�Ņ��P��~��ЙR���H��V=�.���5�]9eGc�آ�ƀ&&,�����|�t�.b�C�\'�Hϰ�k	�nN�1�k�lu&��m~��{O�X�F��N�j��߮�P���v�\{K�jI�q��TG%E������qs���ﴯf	$i������2��e�=�,�Zˠ�P#SVq�ěKǡ3v���Z���XWq]|oJ�ڄ�z�u�Qf@�� �ބ� nC
��[42`})�3/X�|�?ft�z��05�A���*� �`�A���(�-��¼L~av��	�$�m(�3��H�DR,٣��bK �r�SB��
fB����Q�,K�8g8�/"� �q�o�e��xkA��`Jn���W�b��|i��\����2sN�	8i�|�z4�]��Vr���w�ǁ�?9�택��y�cO��5u49^���V,�.���G=��(��^����=�uV�H�z�'���R��<G�Ԃ_�fcMO��*֗�=ϰe���p8,�fl�P'w�!zW������T&���4k�?��^+�ڄ�|G�55{8-.0Ԡ�0^o���s`6�9xk8x���2����Ai��5����8��֨�6�ؒĶ��r圫�(��t�|c��лw=�KC�-�/�}�
f�kxL��t�����	��\��rhW��9I�(V�s���u�"�+4�K��X-4O>0W�sVQq@&盼D:$|p���M�^����7+��ia_O�ؚ��9���MX�Dᐽ�S�Nް��5�r���y����썡�x)�'��]��βpr��ǽOp�$o y�ܖ;�b`_k�V>W�}	B�I�=K��C�' �e������p��i?���Y
��#�p`G[�-���5?N��G/�AF��L��1?}-Kk�`�f��	(22F_�[Zz�?	��h���1k`M�`�k��M8�J�=�1! �a�zA� �sk��MX���!N$�����?�/�?�qp!��0s��� �k���{('���<��"q��2b�$� ����"TN�5U��v��X�v��g�k�=IjƼ|۞<)�J3�Y�	�����&c��nhL5�'+õ«<��Z����m ��|���	��|�5�P-�GCCH���{�L1�ƫ�x�ɦ2�=SA���al�Ė),T�|���X�#��tHJ���ܧ�[J�r0�`4�t�N ���]Ny�_�E����>�*�W����Ľcmq[�(W��D��w�sq���D8�Z��] ��#�z�Xb����{' k�:����>u��'8�X������� �;V������TC�mc�������J����~Ϩ�8˅F����X�c�>�?Pd���[/	��7c��#�Z`_-Ο��g�^u�_`$��ٖ���&���%m�{����ٌ}g9�:j�n{_J��J/��ye����cs���J���j�7K�_�����"Z����P#�Ki0�=%�I�p���{%��k��az�F���H˵US�N�?1_���ݛ�R^���8�$�x��5g���fke��sVM�	xK�";��Z��C1��nr���>+�G$���,����TB�|���O����A��=o��߾���Sh��f���#˰�I���Y�:�p���!h� �"��uc���/dt �"��cgM&t� Ȅ��5�N�@☥= �	�\�|
���hC!���)�-�]��ؾ{	��&Q/���p{qm�U�U�|�1���L�M�bMɧ�x�x���`L5���a�𵟀><ռ�S�_����ɑ�,�vN���&?���pq�Q��11<Jt���� �t�.�����7����Y,�:�A�ż�BdM���|v�l��������с�ڰr���6�v�p�bHG�?���к�ki�QtnIF��1���p��\�������Â�⣁J���PnN�z�x!�����[?^�S������������ VI���&�����!V�7n�[�I���$�l�0�:o�H�&��eH����/�o݆Z-�n��,M^將�l�:��R�Gxʳ8��Z�3����:� l�=ԅ�&�%r�����:t��h��#@�+C�'��`l
6�����)���bȜ�5�O9hT���X^8�S��j�W���c����Qv{
�@�!������	a��d|�\}��޳CZ��:�s�� R}��CoPL�XI IIG���i�ܗsf5'���۟��(y!(�Ӻ�yI��׃�U�|��cg1/���NUl� *Y��u�<��H�}�GҴ�WJU�w�_�f�[�O�S�W#\���}�Ԝ��&�78]Η�|��s���j>{���_��`��58��B͏�{G�i)Pz*�~�_�lE��е���by�F�)��#��Z�贘,<P�;�Y�s|>w!��F]���r}U���Ӵ򄊠�ut�X�|�ù��e�����u4��8�2ѡ��-D��A�&��j�Hg�J4�啑FjDS��ʼ��:�0�8��6��x+d'�d��ۤu$����F	$��`�Q��4��qӈP�,n�"A��Ng���ۤ���ڮ�ť������ե�z��XZ�f�g� /�X?�>�j�����J���ssw9��<Q�n�U���������˶��h�Ƒ��$���,����֬58bui�}��H��B���������.�	l��!�'�yk��=���e��O||��|W�/�}���\_Z���17ſ�k�q��������QEjޤ��Q��pn��;�{MU⨇|��DV��e� Ѫ�kLd!���b��}�1���|+Bkί�({��	���'8o��J_�y�PeZFdb�G�+/�t�����*.#�A)�(R�� ��j΃�5�p9����3[�)W{�$.eo�2���,\IcV�Q` &�ML�|ћ��F%�#(f�s�]s`�-��7��{q���4���)����9}��k���+Ze�,���I�g�@�������'�����E���d�[�W�V�x�<���.{���xoG����꽦�7.��e��Nd���~���F�H'U#֗F��'�xʾ[��{X���^+�#�xA�j��)';�������J�@G�BG� �  Е��W��%\��H�8���z\o�ʦ	#��'	q�+m�N��\,��Aj�W	5<1�[���/����0��� Ks`����gb���D�C�#�����f陸h�/��þ޼Os��ݯvf�o�e�|�7�!!h�g��Pݞ�o�[uSt�ҿF��eZ?�n��E'J��������iq��$ц.��3��ė��t�Q]̑�m�q���Μk_22Iu^�ƕ�T�{�d�n:�N��}Y|���̧1g��,/����|)�_�&��V�t��}�fYU�ŭ`?�
�heh�J��_6��/�i�2��x����(>dY֎w S�z�!w��� ��&jQ�z�Y�p�yM�#�������	�n/ڑ�=W2���9 !�q��zL����Kf���6KqDy�h9oX����@@H	;�:�ͺU�&�C�������68�j�V}�fWG�C��K��7֖.�F���V�i�4Mѿ���+곱��J���M��������䃒S����c����"��ѝ�W-���E�?X�y�#Z�]I]�ygv�{���3�#����m����`�HO���ị�Z=��[���E��m�Dq������1�r���H�&����O�O�g�~�6�>%�l�RB�s��}���;�W���ھ&9����׎���~���|�^�@�����{[������<���W1��>�Q��L�"K�����̒s��F,��,Zݣ���el�^�i���Q�h.��u�!:J(���'�Nd�>�0ק7�C�>n�1�)ġ�O�˝�(�����Ccw����͐f��j����C�S�H �}o� ���z��J�Y>�ׅ _���TC�7FE��	�� ���O���`�]�	���>{��%q�����,����OqTn9��|jl4�|�H��������w���"կ�ʥU�앿�����t��:Z��4A�+��t�#����������\2[��'a�Q�Y~H�;���)�}�#9y��Y�(�\Lg�b�Ó�Ac���gʘ��쬃�@L��qJcgNA8��=+�;Zxk�� @7q��=���kL�;f�^5��h�d�ki��I�3���*i�e!�-�c���~��8�����9�(%�ӡu�8�+s�ya���1�Q��oڶK+�͉4���qF��6��K�1��L��h�0��)����¶W�(k��/��W����r҇�������{�Gߖ��epiY���U�(���5���5��N�\�����7vZ`?���%O�q���Y�z�_��n����t�?P)^�HW6#��
���"�K��W
�]�'�U`xσ��.`ʉJ�/ �'�l�'��T�x��&{e�e�inxi���FCw�.��P�ηI@P�!�7���i��bu��f����S5͠;���U'�.=����B���M��5K��K@����0�(���oD�P���j2b�~�;�<�<�@���Z_�d<�V!w�1�͏B㭖����	fkI�D��)���� O�`�E6o"����h�kO� ̒p���o����:͸�2�h-�E{Toא��ֺ�6��Q���&pb6g�6�1�]'�  �!������r�$�F^���������R     