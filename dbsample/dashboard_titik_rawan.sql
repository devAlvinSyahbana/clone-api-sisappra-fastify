PGDMP     #    #                z            sisappra_db    14.6    14.6     9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18862    dashboard_titik_rawan    TABLE     @  CREATE TABLE public.dashboard_titik_rawan (
    id integer NOT NULL,
    lokasi character varying,
    kota character varying,
    kecamatan character varying,
    kelurahan character varying,
    lat character varying,
    long character varying,
    kategori character varying,
    rawan_terhadap character varying
);
 )   DROP TABLE public.dashboard_titik_rawan;
       public         heap    postgres    false            6          0    18862    dashboard_titik_rawan 
   TABLE DATA           |   COPY public.dashboard_titik_rawan (id, lokasi, kota, kecamatan, kelurahan, lat, long, kategori, rawan_terhadap) FROM stdin;
    public          postgres    false    220   �       �           2606    19499 0   dashboard_titik_rawan dashboard_titik_rawan_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_titik_rawan
    ADD CONSTRAINT dashboard_titik_rawan_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_titik_rawan DROP CONSTRAINT dashboard_titik_rawan_pkey;
       public            postgres    false    220            6      x�̽�VI�&|M=�_��\�Bn�Y߁�%!@�2��W�8"�<N�V�U���d��6�G�{n��}*%A��m۞r�e|������1�����M�8����]���H��G�'D�\�#���%���������C�=�?��p<\�l5YM��`6�/��r^.�b~�=��<{>�c�|�},����b�����辸��Ť����$��Zpe�|f6���k�o�����hū��xun���`���Gw��p����l� �
~����U����.�!�_|. �#<s�� G��b�=����⋿q�6�.�b�v��(��ʉJF<��&�r�K�^k^��K�6x���rt7/&���~59�)��﹘'�i���=�,�wg��G1�4����ٟ�&��ƣr�EyJ	���ӒQJ���%åWV���J	�����BSE�<�2s��^�9^���}�����?���]��FN�ٯ�b��-�}`3xJ(49�h��Ir���q1\��k�rI� -�������=������z�����.��o����i	��^�[W߾,�S�#d�G3�e��Ĥ��zD��C;�|���΅y(�Z-V�c1&pI�O�exv_,�Qay���Q�s��0!xE����'$�*CTc�R��Op���C@$�#���t[1�Ay�=���� Mx2Ӗ=��O��٧O�h�t�k�Ã�1��h�fo�hD(f@���y5�f�bTf%��E<��'��A��O�<���m�<�0���S	��vpO�q:s�p"���FP;��@��$,X5?���@zWN��m�
����{%�r0o��� ~��}�?��u�=����G��@��(H��rh_i6��0��o4���4�E��p<l��:���(�j)J�l�,����b+N������\�S��H�
M������3SF�����2�V���/]?�p�����ۓ���A;�(�ҋÜ[�t�E��F�����A[�T����&�,���T� #�^����D��r���H�@��:�ᬋ�b?4�,�i�`���۪�:���H�p���'�w�j��
��J�k�[ ?>��g_t�8�=N��`�Iʔ9�D,�A���j�F��X?��Y�����N����=���)KQ28�@����p����
�u��9������&���ge���f�v���R�4a.��H��D��*����}�3��(�����lr�7f��7o�,�yGK�媍JwNʱ�|5q�c5���(;+�V|��d������|����Pm�(7��u�q!*ä����.�h���Te��3n�����j<�w1 �:����Fh9��dPP^g��b6�EA?6���h0�w��㽀<W��sA�_.O���U��y.�_o��ʛR4�A�Ї{���ev��;�>O�O��[���.*�-5*<-�J0�In��9|q��xp?|�~�3��� 5�����=��^�(��e��S��H�V�h�L���:~���8B��I+,�B ��p�;��L�V��� r����50���Y;�<��d�B��#���o�{^�hv�&����/�0��Y�d����I�N�@>ߖ��y��5`�DF��vp�'�h?]�s�zԇ��`�(������]�=5{��	�G3�4@]Iw ��M���h�f3��eS ���!�P��DS<���������8,�<���$D��m�)AD��t��͋�������]f�s�`�_�o<!����N���\�yV��[8xRq!]�ŕ=��l�@6BuΆb�xr��y����,iSq��W[��p8V�*ͤ�&y1F����77���W��-�IӐ�^�� ��̾��vi�uI���R�4�P�"��r�-\4�R��#��N�z�1/0}X=�FA�J�#hʹ�M���o�F�'��-�6����2 ����bf�j��L�VE/JA��1r̟���p����Sx�-�̝�2��1nt��S�˞��������\D=�'9ɾ��km�����e2�֤�.s��Q<(3mD:�ثq%�S���qN4�<<Z$Th�ĝl���R����JM�	�ά@�^�P.�)r!�(&�>� �O��c�1P��/�3�B��q1�~�zL���)c,
�L���趘��^��E�����VU	�������U�d��^X��{9/���1�Ћ��y�Y*��v�r��*8K�*�P���O<�J����>(�]�t�v��d>{+d�0�F�o��mK�;5�҇��	g��.�/�}�Z��$�f$4%����ڢ��q9}l�+� �SIҡRG��b�
�j���^���fy_wLo ��PE_k���+��d2�8	q[��)�nE��&����]�9�4�U4.��3��s�Ƴ��^�O�a���:���7�Dulּ�P��X<��9�_��r�Bt�������91(����e`=�џ�>�{w���q��:�� {���0d�������i��݌����4|0.+B6�<����՜c���cF�	��}�|��I�TXKً(0�`�嫫����}"����~�|��$X
Ma���vsT�N��a*���j�/��acw�-������_6�-���,��s�Wr0P
�z,�@[ �x0ɾQ��r[�4	�.��:Tr�zl<�Eݲ�x*z�\��k<�\�a���V>��|q�εJ` 9���Kxϗ@�
��]��R� ;m�]G���k/ە�k�B�l�=��.82�a�zj��� �3������� �%�h;˝���N��޼���=2W�i�5���+�B+ފ��v("�ت<W��.+b��N��]v�3�_!�R��Xr�J(�Lb�����ܕev�{��VE�������o��n����ޕ��裂�.Z��f��ꦱ:��D1���D��Mx�"6'��9���8��ٶI	�o�N���\�.zԈi�5S|�22�5�?��cU�K����4��u���x�x<`>YC|��:�	f���r�n��'�5u����WY��P~��[;x(~��������`��.VjB��m��z�� ���WV�0P��R�W�͂��Xe�B��%Ҍ�C���'��?���,N��^̱4�8M+��@��E~v~RN�繬��x`�-گ9;w'Rz�؇p1�n���|�0��[W<�)�]�u��*�$1��R�����+������8ߡu�gw�	�'�l-�������%�%	�`���&`�?�<��l\������I���7����!�[�W�S�%�wD�F��b�P3�ڳʽ3�o/��QVN��� {��������W���G����>����;��d[b�ֹ[�*G�<���k�m�
MB&MS�eB�`���Y���<[� �/�Ǟ��?�s�o!l����8��s�CS�$	K���u01�2ts�l6�,�3����m���g�e?5A�F��*�1}pщ�̾�#�����fK�5
� fh�Fbva�2q�����	R��R�0�K\��������E	6��
X��=���Უ�j����b<U�������~$Gm�ٷ�^Ő�Ge�:�ʄ^"3o�g*|	��˯�w������x�O�P]*��+FR��n'��b��O��D]J���b��>""崧4<�M��{�6ڵ�𦭦'��o��s��eC_C��#,D������.^H�GrMcFW݅"�ad�E�����y��P��r�6G�5�9V3f?���2ǉ���9�}
\�(�u.�Y	�1W[k'�k�Jt�X'��1���^B|��� �$�Hvt�`�^5��EH�*.�I�������|�jM����È$ƻh0����:�QdWC@��֥kU�u�����f�:)|jcNX����P��1�s�2�������Z��dg+4ΚA�#��y�$�͏    .d���[FY.���p�`�/��;��$4tEey/=j_`����CEBJ�#g�νy��l�"$�u�G��+��G�X�!�kL:1�4�j(�E|�� ��R�5/���]`����}?���
��Yq<_��\��,�4��-s�}�W}5���,��
�Y�ʤ7�}��G>0�5|;�%+�7z���A�β��*z<m�#��2� �s݁~�]��h|,��y3x<�b�gh�t��s�� L|>7�L��G�J6[��m7
8�s,cFt���ܳ�v8���m����l_��ϸ[������=�\��*�~,��v~*�G3&D����l7��_�:\�V���JFӄ^<v�ڔ�NJ7��
��2C{Nl�����2�Q��`G��*�z�1��7b�"ЃF�P�7�^�
����>E{6��3�6���؂��mlA�Җ�]�NW�� �&R������wW��@�ltzpj�-iQ;4kh�A��A�:Q!�탤��#����L�<Xp���L~����Ġ�vv�=P�TT�y�W�H�pɏb2lV�a�7���j\�؋�=���
s�)�6�fT'��}��)g�s}�:!�V�Ԝ���i�B-��#��l��`~��aJ��䐊��3ׯ��@�G�H*#��[�	�r2F����gk��Ź���l�	���Y�7%s6�������wϴ�+���_	L'�V:�0���������1Ek3�MGN�c�Й0y� :Ï�nem�D����@ˮj��^�ش�ݕ�����q��`��%m+cg|�a�N�ly<hwo>
���=^o�����t ��K��F��(�P����Ϡ0�2(:YG
>b���	�[Dq�n�|�	#��� ��	�BC�sp��h���3��*�G+�^wh�oW�ᗾavQ+�~ ��s��z�lM�c�"IY�`���|�cκ�����W���9VRz�\�CĴkQ|Ӫ�n
[|���~�^!� ��t�yg.��=p�>��B���MR�W�WDf�w�T4�v(�%�T��z{$]/<j�4�:����=�N�9{y6y���qwQ�4�ΰ!
g0�	4��*^+�=P�zۯ�WK���f�x�\��m�I���+��#R�YX�d����Ե8~�~:,��`��>��Z(��\�t�pVZ
�[;�9�3��p�Ԃ�SȔУ���B�d4V��L�� C�2�*����.�A�/e#2���"�J՗H'.v��!����Qج4*��X�rp~��ʿ�uK����v_	���Am��1���b��~��Hݖ���%�K�&������a�8��hO,��Ŀ
w��ȗ	�r[h.b�	��Қ3�=��} ٴ<�f��;<�I�+j� 5.�2����&fd��`n���t�����������<�pJ�.ԃ�q7B=���ܰ���tq�_�(u�R��abAs0q����ڰ�?��|?s�.�]WF�ƃ�r�k㑝d�����8��T�-1��Hh�ŝ��:%�+��T�S����'�8n(7���q�q/�Sal�"�����>��߰�����r��
u]l{9���.�� �tk�&!Pۚ6=d�6	����d{3�rWJ3�zH`H �'k۪��{DcJMu��G]�ZZ���, �#����(��*�nE'�'z0���[��L̈�0a���m�l����̄ԍ��(-{#�ꁙ{�N~�+��m|�rf\��~�?4JC=$>�ڡ^N�{k��p%{����-�Q��;�h/��9d=�t�� M�/���Ѫڀ۴2Z���7�N�8�iY���t ��N���	wQ������]�&SE������񀪉HS�isG?��-q{���Ϟ23#ȣ�	�SD��1"X�5hXn�=��u��VW��a�]ӇV�\�+M����7�TL�)h�*\�(�˄2��襤=��`��_�H{굢����HL
�/!���ؕ�I,ea�>�z���:����9�k�*�i]o���^>
����z��1#��ʐ���n#[M���jK'_N�^.�#q^U�
rHn�u+%{'��%�F��lzroKz����M����"a��"}mգfOa�r�*y@�
���$Y4漣��`HvW;�|��Hw٩�Ƙ��������� ��IL�ٟ�������r��ퟴ��V��00V��cq>�fT�[ޕ�74'/L��
��}���u�O3b�gh�gG��'���֡�c1*��=�Y��:lR� Q�cl�ݘ��q]��r0(�‵���g�bTf�|�/t�����=P����uF�	`����PN���W��Z�_�mv�ŞG��4O:&��L�T8a�yJ4���DX9��\;��oG�x>d�辘� ��R�%��ֱS�����{ ��ۦ�@$�cb�9:[M젇+��t.!��\�.T:\n5Yv]L�P[��B#�X�"M2{������o�ib��r�n>s�̰��G1�S7�o�$���:�&!0�2�|"�R?{A=��R�Tfq?���|U�0�&���J�;�����c��k���M>ƒ��K�f�3J]4�GEf�R0�%��%����0|NJq�jHs��p�対릁�$�P��MO;'��oPx�F�����a�k#_��f�w[�"m�X��L���_L����W�e���_�r@G<���gq�hI��p#�����6�%�l�>Rq	���u�ď��� @)�n�+�����B��9�Υ�ĝZ�v�Wv9X>��g��ټ�-�$�0ϳ���n�N;=c���$��'�*~��6[.����I�<���R�]��m�	�;��Lw|vN���k=� W��J�0�b>�]8K`]T/��OU�,H�����@�E�!�"ñH�7 H�
|A�pd��%��4��WT<n�v6H����.{A+�+ܲp���-Q��?6�&�/�VA�)����4�$�q��e�謼�I@G�p찾d�X#:�޷c�S݃e���Xƛ�^5[lۼ�P�4���`.c��B��u@�;$�	��Xޖ�(��k��du�L�Ǻ��:6�R`��1Ɠ�.�"���r<����F���J�=�v��k迨����ъ�԰� ��d����t�u��Oƕ
7���o�� 5�L~�,�	�5W�%���I3[�r�ۿ��`�s�IB
�@?.|i�aaL7	���,a��6e���ħ"�P	���?ͱ�,!*���V�D�cY�A�m0:�	��4�6��Ƌ .�E<�HK�:"�|������p��&`��d&7]�J�\t�v��vP���I�Ԕ�ՙ�7
`����L���ap��I]�B�}�/k.�]�0�ۅ��-�ckn�?O�y�I�}`�|�{��$�{=�F���ꆗ�֥�ͧF^�!b��&�`���$-l��G�4�c~c���^��L��̀��x��/����a��|�-���\�-�p[��'��2�շ�I6�GM6-3��2����E᧪�ع�.�F7��%����R'L��N'gl.w�Q`a�M_'mM�ߋ��C��X�N2?O�^g��g�&f�Ko�o%���&�tD4G�paV���Ӊ��N^���k/Ҏ�V��rPL�����K�Tl��"q�&}���OS.`x����x��h���V@���fFG�i�ALʵo}���౜o��� �<��S{"�n�H�K�	K�q��OB�K`�9�9i��9Ɇ�ɛ�s��s�B�s���c_����F�XL���/s�JؚFؼ��"�nV��� 
����8tn�������y�;���OZr��1������ؤ��'a��,��q��n#y�B���5i(37?�pcM�~<���g׫q�}�l5�O���|^�8�iF��4wmd;�Qkd�F�)?�)0?�kC�hyꛫn�J��^�t8������.��;��>\,�wp�V�-jK�@$�z�S��D�>�����R��;��pI��^���/��Q���֏)2�b'�$���h���%���ϫb�mt�g�`���    ¶�N�Ŷt������gU�=�#��ɫ*YYӸ�C�?��i� ��
��cx���~����:�!u�vb$��l���ٯ�)�f>�����>���t�h���6�mLebi6�!���&,p�����1���F�'�E,o	޻���J�6�����ￔ`�ࢫy�m��|�s����i�Ai�	y�{K`io�"j��6�9��hv%�S�cm�N�V�E`a�:��^�8�6�ӿ:���k?�?�3��
�x;>�'�[�"s-��૧�;y�����ku�������g�ٻY��>O��Z���-c~�$	}5�#��]l�[�� ����Isu�Ԥ~�.��Y`%^��A����p�֝��~�}�#>��6��1���������JvQ���pmӉ� �4�G������P�:�.V�����'+Q�#]��ֹPC7[-�9su�k�tvYu�'*,��8
Q'��ǽ��؞K;۹glZֽ1b�1_j)r/�tZ�~������`X��e�B��(Ԧ�����r�A�~N��GdL<���ܷか1)�Í#��<7�s<�t)�7�}*������g��G���k}yh���rUj����`��X�K��!7x�x*�G*����}�]a �{����!�&2���X���C�m��b�S\�|ߘl�`�0h@����x�4�]�\��2��a�w�]�$���������o9=�{����F�lC��_�n����i����@�7ߚ4�5x�����o�� |v=��<��;o�Z]�#��&{JZ�#��^�Ɖ�/�r�ԅ�~4��TJb�x�]��Jv��Dق��y�r)�f����M���oJh����e�8<��n,����a#��������d�B��m�������8�|�4+����ȫk�0���ʬ��1�r���J,tAِҿᾷG���k���|{n{��#3���&��=�����h�X�v�/��oJ�(���n+<���ח�M1�t��������a3�� 0��;w4|O��`Y��uPQ˴�Vj>5Sۤ��	�7�����һ�˦�O��R�z>�*�N�_�S�l#Je��X����~}IC�H�:�x�ݦ����8;��ز���ˊ%:n��,�f�L�`���ʮ�uN
�;6��^���Y��8�=��"�g��g�N�o��uƧ��Q�Ꮟ�����l<��.��:��[Ew݇���N0{������n���r�S�����T��oM<��>���_��/��s� )΂������	�y��z3}�������E���qu�
�6���J����N�J�o�{�dl���+�%���1;R	�������$�Y�IL.�\l-�z^���;�~��ag`|�f�oZUXMҘ�X�-��n�����T���b�'ib��f�0L��8�4�PRˎ�IS8}�+�{򅮸Ҩ�É�k��`�o�0�E��͍i��Um�F��$Y.��;�_?�~iţjz'���;_>5�qt��2���݆{h�{�Ij��1������mV��c�u��.�Ev��l�M�Ȇ�(%��5)\ûxivt7�Z?��b���ao�Q<�6d�oqF���I$�pVWN>��b��p�kߜ���6>C��b33�Q�+�K�2����1/VC�Q�W���C��t�w�ѲOŲ\��Gj�E�8�"����z;�}���L}A��-�E�s��硝�ܽ@z4��M�]�ۧ��f
� �|��6i>�~����p���Is~��9̗�_����N�`D"�E>���{���0-|0$��N��d^M�k�'����6;;Y
!$� �����qM|������q�f���7�Ip�P�$�vq\v]�'��[)ٺ""�x���iDT�9w}]+��;�pB��$d|se�ҾR���J���p޲�7��uVs!U%(������b�=5�F��ۖ����l����)���'9	{�l�m}��C��}�1�-��Llۻx�G�dKh7�� ����L��Z?����*h$�S�E*N���~s7]�����P�f�y�:��%Y�FǇ���
L)	�\�43#��>2����lv(�M����k��x��UW�OǑ� ��m���NAܕ�mO�G�'��/+�^�P|�fKv�<��q��<i%IubR���N�.�:w]��>螭�õ8�N��Ŏ�|cO�£��f��>h���|:D�@[Y���	��qe�N�n4�����l��h�:C�ʹ4	;	�&ᬞ�O+�q���k\n��p��I�13��B��1qM����ߪ��8r|)w|���ԉf�GG�R"�0QV��0��o�XQ��uI)E���d6�"J⚎��2��`#o��ܷi�0�Ev�>v�k;�Aˣ�[�cu5�0(��=u�u��}�}k�N�	���#1�M`��c(�{�gh��/\4�r�kJTdˌ�)���y�c[��Q���m`�`�M1E$�t�9~�8qX�q?d�a�w�U��>
;���V&�0�H%0������� p<]]���u/�J�C�MG��߇c��d�J���p���Nz7��x1ƛ�hU�z����	]���[�������$a~֘�H�wj��%F����.�y�,�>n�1�bc���T��>�59�,��qq�,����8� E�M��ˍ~61�p�g��b��y1E�
�K5#�r�O`��T����N3�+�T�=Y�+n����`��?.�� �#l#Hm��bP���$�����D�>�Ӎ�N���#؍���¸��ǁm�����+ǿ�b�R׏K�X��2I�Ұ�����jV�kjg��_�ӇG��;?�\$)xd"\4q8,kt�G�뾗��M�{/��)|m3,jh϶*�Qm�ŗ��b�,V����!���z�t�d4
�Q�;� H0��H+MTE�d�K"n���:#DE���h��b�"QL��A����+5�V��FÁ	���|�F��:���m��a����{��T��H��+ ]�
\�l�X�ŸC5Rݶ�%��q�`D�H�*%G~=���`B^|�և{Ws|��ZZ�y���v_P���Ör�f����1{�qXd7Q&A�t�v���$�β�]X�4����~N����b�H׎��Ad~\�VOؔ@��o�Vy��hF�ػ��E�n0��l��*�]8d.��E2B�>����j����_����aZv��E����B�?�Fs�,�$|��'�a�SG�f�|/��ZQ�Fh���`�{?��+���ك2������1������}yD0A~�t�ǂ�)�lo���ڱQ`�� 2�����ޓ����T�K�ĝb�AG��YF�Γ���=�9K�=�}��@�Ѣ�6��݇X���
��*e�^����v����a,ҍv����\r�=�����ɂ����	�3����6��0Z�y?����U���X<�U�/�+��֗b!���[�ՙ�^/��?ƀ�~9U��dq��P�k1�� &�p]�a��-2·'^܂m��_M��ww׿�����c7��xJ���|r�K&u5G�֌�N���Gn�/�qU/,h!���'p{��ӆ�b+���(W��w�U���>��c�Q1�!�#y;C��w��T�%r6/G`)�*n��&!�k{��!ݏ����=�➞б���4q`p�1Þ���hG��ϵ2U9i��,��d��l�TJ���
����-*����ꨕ�{!�P�'t{/8��8�k�����W����vn����ń�'�wћ���_�`����7�Ҡ�KO ���6���dy[$��p��/A,��X����Ӻ���z3_&�Y@�z;׽}�j�.%}�a��qҙ�?�Oa��d���#�����$@���r�b�[?�l/���ksF*p�/ҹ�ʗ��d纷܅�ә�sU����4q�(_V�RTʟ��K�����\Gu_:L��%LXL�E*L��KX-Q�ý]�=��fQ��ޜ��'��Yc������i��i�۹�#L�E�"    :������>Z�Ĭ"]_��Y�7"��e{���5�T�%Z��#��:BD?�����#p�A��\�n_O��H:�������$��I�����+���I�zӀ�7�ģeB���ݪ�}|*�|���wM�[���,|�l^|�����+��6�o\v�6"Q��/���R��e���k�kl𹬫�<�13{����<{������*惝�	-v}�� ��?��~�C�����`���h�9S�~/���ĭD��/_{���	��\w�QL�}�����bT�V���pV�V~�@#�j��N����-��ʱ�f�#���_����q��kO����}t���`3�Bv7�>|�N�e�u���LG)+��=�X��p���8q�a���e(�v��bd�&>��נ\^_�oȍ�\�B��/=KB i�b����� IRm��Ι��B����4�?J�.���� ��c1�_�������"s��9�4��˞$���N�Mv5Gf�c�#�������X流�P� ��.��,����a�&z�cN�s#b�$4]ߎ�}�^����\�%���M��v�H�"]LJ9�ב�^FZ](�Ȕ'�:*j�G�6 #ylO7R��(݆N\�L4m�"��H��g���# �).f�2���nǪ�}�m�F�ӥ���tΌ� %��Ȁ���ϫ��`�N�.��7q3`�qM�!@�o�Q&�=E�_z��4��q��[i�I�����h��pj3\G�����P�F�Vb2���Y��$��%��s1Z�Íc�J'k7$�G���I��e������OǙ�α������G�"=�u�D�
���a�n9j��\g&�OQ�r�$�"yĆ�P!gE)I8�^b���/PeV�gf��	��Bo�Bee��%�h�c�z9�Um.FԽ���j2[-��	X��]�c-����Gk�b��s62���Cx��b
t��(�X<Ʉ�ڮ=	lgnn]�[F,2c;�ڤaQ���j�;/��UK���p��_d-2��Å��L����ժ�ԝ���p]����p�ҷ8���Y����L���b�x�����+Ȕ��w"�Du��<	��rfgry; ��#��t�ч���x,6���*jX�9|G�����VV�}����枟oG�qr��ȘH6�^�������8��]��|�]�^���ޝf�� ���Q~ Qj�R�������<�\���� ߠ|Ca��e�HC�Q�u�`S�J<��?j�cj��U�#C�-==[�ݔ�w�Vc8�f�oN�_쩨�eB�ȸwO����8�b҆�j0��U�Hlm��bn�2a'�Ϲ�������n�
�����_�
\�8m��J�cCxj�!Ƃh|9ޑ�,u��|7�/A}�$����ⴁ�7�HH���V�HBŎй�p�q_)/���԰
>]�H2'�?��pnN�a8��k�~o���j�$p��Ԑx�޽t�����EW˯�_�zW�;�7��r9�4�Wȉ�J�u�k��XF�G��/-�����ivD3���l!�w><�}k+y1��=�.1��Eʻu-��խ'f�>�d��H�l��!cvI�܋�Sv�K���-dJ\��Zc2�q�fa���m��Z������g��U��&'=��/.{<���p�g��7�1:d��`�yC@J�k ���]�k�X�d��en��/�_B�m���U���1tWa-���b�;�h��D��r����~��qm}����?ێ����ڈ�'��n3�E ���� �Fw �Ѱ�`���α����4�#(�H ��Aka4�p$�Y��+��N �j�5:��S�;�q5�@&\�V���C���@�����թ�H�e-�B���9���Y)AK�G\,&���Ν�����8�G��\pJƈ���w��"�+F��4����Wk	I�]kE0�9�ü�a�k>�8:͆��G�����h�tĕ�U��F[�[�0<�Q1Dk�y|��M[�b�S�V��:� �=Εw�'���vm#�����	o�X�y;��������>$���,]Y"����6Rû��
Z_�����ړn�LK�N��,j�b�T��\�WtU�k�'�T�t�Հ�\��;ex�pi�����H�y�?NV�$]�̶�v��<�Fٯ���&O6�R�=���,l8��5�t����z���t`����`��%xWǄng��v"��`$�"���d�7gk����O�����P��eB��iA}���kT>�x�f��j�ڭ�0が�����w ��H�#�P����e�g���nW��`��X",�Su�P\��Mۨ�h'Z2��`�Q�=��^W���"əܟ�y�=3{=6�����X�,����p2�֬~ӛBR�aMd�\vQY�T�*�V��4p9S�K�1���S��\�*�y�aį��eZ�jC�=�w9	��w{L�kO}���f�4<�RXi[S�#Fjn�Nv:�����)5��h�Ԍ�8�Y[#�����EuGV�������Z$a��
0ۜ������,fo�U����LVoъ����X�d;l��U����8�^����l>X�V�	[ XX���^}UP!bY�����2[e+E���%�eq�/�"���g7X�V�t�q�`��`5k�W#�4yû���{�-Ƅ�u�����-|��݆��ٿ�W��]�u
���Ʃ�kLk5�Am�9\�����R���'x9�;H�L۩�W�m͎�B55*TU���8
ɝ�mii,�`Y�W���:ҞFy�\�w=Q�BB�4��?7��zS�Ŕ�4*�zV�^���Q�������ޠ��x�7w��u�:����ޜ�6�:Xc8g9�\ա9O��-�/�*�;��u'4Q���-�S�#��}�l�'�\g7�����d�:�Y)�x:�>}�~�������|�6�,�0�z4=�f�WK4H)>����>IS�$͆��� T�@;����ٯʛ�3u���<?�~�[�'�e��b5u7tR`�'V�T_Z��;	F*���)�N�ex�sG�K�7�ѵ?�b]�h&v�t@\���:��2�L��" z�1f������Y��O�Ԭ�tVl�A�& ���;�"�N�!)��"v�ٓZ�v�+6,Μ�K;6�	S��!�9K_8�mw�����}�����E�ɦ�/'P�2}{H�M��V�����K�8�%%�Y"��3�?ǃ�������n?87¯d�a��{bM�����`;Z9��~Y��?��e1�1k?���!�۶P���{^�ƴ�H|�	U�z$��ʏ����W����T
�+���+˾�����@8����_T���E������/���A�z9�/1�2_m_?�8AY�/W�L*�=��a�b�,��'��_Ǡ����ԥ/���vJ⒈t }���׫�~�6,��$��d���w��)�,%�_����>+�.p���`��k�QQ����U7�&��T��|�8�c;k�1��5��;��K��d����깲��� g/��?�����x���N�Ϭx���g��w�� F|)O)԰\-����G9-Q��f��r[�澝�EiK��aǚ0�n��6�6ت��@=�&����80�(�HG@W��-����36��۽�����`wt��~���K�&�rz�Ό��v�.��ĵ�D�Q�Eعd���H\���aj�g�y�H�
��"�����a��n����ӏ�|$���i`] �ӽj�n2��1��<��=f���F����8h=Ȝ�K��Ҝ���.5Bƴ��W�%��/o�e$�E%jS&�NQf�����>���[E9�\����D�^�=`��O΢k(h'�'��l����{V�_o�&�wꯧ�b�qu�� X�<�+���n�b1,�0�A]��K���{�ޙ�W�P;�#!F�+O��G���?E���Ͽܾ��:�@҄��".kA���3i�	�A2g\(B��+z\�����3_�A�����$%��q�Q�����pv����:�)�T�ixZ�ǟ]�
w׸������o�    ���t�������������������q\��,ǎ�׃�j�t��6��"��ޕ�t1uR�6Ջr��#t��@L�x"�E���X��Б��28<l��PR��hltO9�A��}�N�Ҫ���ӳ�Ǫ.#�ARp.���s.�Uiaz�π<Ѳ����|G��� @�qo�3m��M��w�~ �y?�=�7���
E�� �=��s� �l�j���ߨ�,V����HD���'���?
ُ�܏�QJI�`龽Pa��e̤�/F���'Gz�\o�jW�{v��;O@�,#�[,\�sk�+�|x(b-r��P�Dۿ�M�u���ኇ���x���o���9�ͤ��Ō|�m��{�k)�5��C��w�ƺ+3��#"��`Fw���]�XH�,�F�~p�^�RĸIm�U*��v����"�Ϩ�a��$���^�x\C������w;2���3�y�����۵q6M#w░�7I]O�s{�K��~�rǫ��'˪ ��w��m��"�7f&;~���.8�&T4��p��W���B���%hj�� ��z�?+�o����&��wx�u�&j���������?��5>�Y(��e��s�ZqG;���q�&I9�^a������Cr�CT1C-��쇳pex[����ū��t�;��F���'�O�����4�U�>�cT�p�V���VƶÀ_xZф}q
�Ҷ�\Y�������f�n���S�AjT��r�E�R���9�+�����q(�
i�Bݢr�X�^=�!�O�Q�R�0K�g�T��Xtz����������#��OF�v�3���I���ՙ���J����q���F�c������ Es�Cמ�TW��E��� �� �S�rݶo�',׳��q�l��4��^���Oׅ�:sF�:鼫��J�}��xL�Pd�w��hG�F���O���/kZ��0S��	'�*����İlc�YP���E�|��h܉�rҗ4ǎ�Y����v�n�Sd��+(U�^L�fa}�>엽��S�+Q�4Vx�΄�1�������NvX\��&���*��	a��M�Ѥ)��R�T�у98���ں��i��Y����LV���������y���a�u�L�`$�,OX	�[i�V���}����#��c���;*��7y�has�+BmS�/V/@Pqa:!)S�n��'O���V�O�
i8�M_��qL�3p^TN�VFW?��p/���a�ir������8�-�������ۻ���D��4c��s�C��j�1�NPP����F��<�y1��@0�La!j:��pz���|�Z�~����?j�����jw���ka��w��Is@�p尶����KG<*��x�)}�v�+�n"m�� *���'��F�k���J���$�m��qk��ۥ�
 �Q��<�����;2���9�ń闻�Z)_�^/�I�`p�h:P������)�W�� &���4-#�[�w���S���[���C�'�`�� �}�#La
�S4O�ʤ�۲���Ǻ�\���ˣ�oX��G�-��s�l[b?�z�}�8�'d��=�s����oŪ��uԫ��Ą�*	;�krˉ�Э�'���<�� �o�e5�e��[�h���5y�SR�ͳoy�At
�n0�y��]㇗sX��UB��-k���:�&�)�Z4u)�ċ�8'D��q��N8e^S�AM-����
sX�L��X���)N���؇Q����ƭ>i�Ĭ��
NW���7�y��QZ�vҙ��e�� �،]LT��(�]P�m\y!���6���F��Q+�@b�z)����⥠ZD�nO�̾茈ّ�z������Q�ʰ�/�;�/�g�z}z{z����L辌F�<Z��Z����;xl?x�SC��7��9E�y� )	+9��W[^k��\��y{�?�{^��|p7To�E�NTvQ����h���t�/������^(£��k���Ng�5���p��y��� ��faH�/ĝ:�|��{�17�:��lN��@i�s�հ;��
��8�S���G��+���������e�Zb& \���'XpX�6�N�C�uC(M�����?��i9��_'yN-:�<	?�ɮ`j ���H5��֙�D2�� � W>��M�&s<6�:S�݊]��N����gXj��9w���Gߋ������P�`��vKy��~���$߃�j%�1��ij�;�I����W@2����#V*{-inG8�_o�GEy.�>*T,^������d�W׿�_�~�<�ׯٗ����㯗�����N�������]9�M�B\v�F���8d���ѵ��x���.r"�x8�bd��c9_�|�mx��_;[M���@y3Lj�ʦ�<���v  ��0��[�Y�Z6t팈/���SR�N���)Bn����dx�k�V"	;��z�D��*��D��%#��\e�X��Kg�+.��b�zx
sŞ���J&o������In�@e�'���\���5����ڶ�Q���5���+�Ƽ��ǉO�;����A޷��c�V�iۤ�5���]�����uBn ���0�`���a���
�;ck:@���iB�X���J�ա�%]��:��&`�U���(��*��Kom���ku�q��mw�6*w�C�8���ѿZ��N{�_J?��gFx��%Oȭ��9����.Eyq݆�j��������X�3��bF�E�%
�d:L�4��̤L�g<a�NV��ٺ���	�=��Ԋ�	��jۿܘIA����p]��+8��O�'�7�6NS&�ls����̭|k%!ѡ�Hh��v����
D���<��M���:��vu��Ǔ�]Fu������t�`�U�L�Vj�	�\�rv��"�h����m�����Y�UK�4v�����گ��<�ֿ5��;�~�
��K��}�m2�������׊{�?��N%9�jۅ��z�oh�N����H�����K�z���34��}��
Mª-��w8�Upzj^�z� #��A��!�]�3;ϲ�oti�f"D��øS���zY2R!���i��q�<���}d7q	Wc���{ߵ�:�A�ݺ�K������O�~��S{Jg�*��}�g�x�u�q���`Cl�"<ª-{�Lxm�:C=�0�ڈ�hh7ar&�p���Y �����%��s�]%~�b��׃���X�����u7�k�u�i@R���>\?w����.Ym���x�_���ߝ~m����1�`)�9�;�����ƍ��E���~��_{��3�*8vÉ_61ƶ	)���8f�P�;X_�o�c���b#`ew�Ǐ�z�ps�Ӥx@�ӿ���]�ݵ�سꕃ 	���o�=;���N�ؑKؐ��+�<2��\T7;s���m/B�;2"��i��5g�٧����#���p�oo[���/L�xmL�D�s���l2D�a���}�Oƕ�xƜ#c.wY*V� ���T�6��,���!V�;A� 8����=�������bw��~-N.ʇ�!���x�0B+*�Ě�����N��F1h�M��؆�m�ЈUe��G�����a���S�����o J�E�߳z:%�� �������F���V@�ۧK$��+c{�O�4i{85&�d�\�U�fl����}�����#D�J݁�k\��!�A�{�\��K���%\�����:*��W��:��,4��l���|6Tu�A��u�n@z'�#$_K��/�*���sM|�܄mF�p�H��0�o�C���GKE[�t�����Z�A��T��W[D\�+mX�K������b4X��`���9���I&n���i�C�d{��/�ca�� Dv:���V�5~�4R6uR��1�]8���ʑ�ZE��;�k@�%J�] D���d|�Y1|X��~o7C^�e�Oo����_Zc��WNJ*;����ǳ�?>��|�&5{g���J��۝������=��[L�D�3�����.Go���q��    i�K_�@��B`t������0^'X�E��*�k|����r5*5�ApW��`�H����P�1ي����p�Sؔ�twW�I�S.�W1np��� &i�յg�hyv����.
Q��I+���i9��狾с`�[��a&����7��ͮ�jT��3����.��H��ȍ{��Üqy�C�'E�4�6���~��8�)?Ź�x�힒�b8,��4-�l
�����;�k��nl��bZlW/a�����o�m7L�!YY$�%�7�9�ށ,h
D�;0��Fֵ��j��E����ݸ%���4�O�O/���������\���۬O��p0�~x���57k�F��p���h��[�v���:���̉�����-X��L+��i��؊��[0j"�5��,�]$?��k��"J�p(ϋ8^>�t?V(��,\ �d����V�n��hi��NV_<mֲ��yT�!�n�`/\^����/m�A.l%=�,]�ï	�c�U$\Zaºъ���:��͚���t�1��o>�6h�Ϣ3���4��v�h���g���+qU�j��N7p�)�[�b5!%)c�n��u�`�8=�����G��}��V�q����h��Ę�>�d�Π4�]/�.�\���u�����eņ`�RO����X�4x����s��5���	$�f?��xZ�>1��t�F�x��f�%���8�g9�CcX���,�k�{�p���Ճ�e褗Z�Tڶ���Wӏ;�ɨ���"yi\Cw�d���YM��MVQB�z��k��KB�Gk���)�p�0\�N'4S��p�.�5������>T�|��%#������樀�<���;�Ǐ�~��6�a@꼃]��n&�&ӳ�贫Fb#_�!��E�l�j��9������`�ݮ��rۄs��FGN���jܝd������w�\��Y9����E(!w�;`@Y�7T%��tA�EƐLqW׹7�5�b�x�J��h�\ �N��W��0%T9�G&s���טg��������*?�M G�/���f�5�Pƻ�*����誸g�s1�n����e�*r����(Ce_�J����l�	9�nI�ӄBjz@0 �&u�Df��@�O��b}�"֝�F�� ��R���ݾ]�����9���lY�U��e���0�Mk��|ͻ�[ʸ���> uȽ�R�'|zM4d�����E���"X��]�r�]qz�bd+;s�P�����@]���-�O���\�̦�ڸ��P����P��Bm0�}�UY�NyF��	q!�c�9d���C�����M��M�yX ���jP�d 5}�X�2�Us�Xu����g��1�ho:�v0�{FAR�5m�9䌬�o�VL�" �9+�'�tf��)�֎��76t��2��	����	�W��:*��6��݊�l��.ߊYU}5)��C�ޗ��P�,׭q19�h�+�&�}�:�Md�t\�`�-4#D�1'���kũ��a�QQ�k��Ē�ޅM�V*���$�ukL��>=�GW]�^e��ʹ��R�TQmTQ"zd�����ow�ܯ��:ˉ�`��y�b��B%�Rp��]���p�}1}Ν5�S�Qq�4*j�T�!<,^������**�n���~GKo�X�cT�|uV�8/���EQ/�RJ�N�c�-�_Z	u��^c�_a>΃����*66��}�X�5�oL�n���v��[��s ��r)#�ŔyoH���g�""I�L����j2���s��wE^�`�09�q�.Z����S���a��	;�����',�g-b��KH��Lz�<w��kX{���ax ��xx�צm��`���v�$q�
i�]��.@_i{b�'��!)fY�|��k�9v���{W���j�}��蠸Kl�VT@[�s/1jП~�,�a��6���6,���n��9���u�ܢ�|AP�(��_�H�����x�G?�l��pw�=O�D���G�Ctr�DX��dÒ�i/)�u�-����G�f_�X	'��l��iܭ���KW��µJ\�A�8!uk&x�G�5��v��7�$1�8��D���a\
r��p��q���8��MP�E���a�>a}��I��<�0�� �ê*L��OX}�>��L���X{���q�g�\����gm9w��I����[o��$�k�y���Ҳ'����U�J�s�0�=�� ��P�!5O/�>��%ʩ������G�0��oY!\�F8�o�;샔��k Sv:[ms��p���]GRJIט:G�{��lǷmS��{(6�9�K`�V��
 ㆀݏ���sᦷ�`������`>? �u��r�f���D��8w�%ު'�-�~�x�D��v`A������qE�p��4�����b�\�B�*������W��ʥ�\�S�4� ޖ�!��������_���ӯ�W�2O1tD�ZP	0�"�y�(N�ެ��Y���� ��L%Un�`��<����vr�cq��.9�NR��X�f9�Oź(Vk3��E��$����$g۩�w�Q1w�G`�V��������J� نe_|���z�!��!�y��S�����*~@&��^� ��W�Tu��b��B���}U1>�1�2N7�@��>��:X���a\��N�m�u�o�R(/�f��*`@J��y6YM�nG������?w����O0w�ykp���C��7M�.P���-�j�I�u�:ZNo,n;w_��%}���)ʪi`��(	�t�?ך�:��W���UA	H�,I�j��9�.����HY�|�����K�������R���l���N#��_�~��"���ǟ�w?���.��0�^�=�i�n�|p)3����ԗ������Ʀ�XO�����������Ӹ�rO���������__~��1����5�GZ��������:����zu�wz�[&�;`��������g���,�5lUGo��gVwW�F�1�Z����C��hs`7��Ԯ)�mwG��Q���-�zS��wO**�cǾ���T��Qz����u��֤�Io�P��� �jS!���!���+����*���{�ג��l��4�I{��rM��=�~�VhL\��҆��V\fR)��4��(?)��^-�#���W0�>6t���� �R_���|]>�u����Y#�Ԙ8����pHg�]�n��X��]��7��!����EՎ�\� �cXWځ�(���_-2�i�����>n�fq@�������v���?J*��@=�Qӛ�S��"lm_��Q(��5!�*���FqW��{��)/M\E��4l�Q U�v�Zd�&B��۫��n>\�����#�$��U�����(R���	Z;z��BG�;=W�ݒw�R�(��1ͺ?��_�0̳ �&e����,�2c��g�ܯq���c�F�m.<6<��ɻErۻ�s�I|�����IP�z�vo(���ЇM(g��hu�O����Yhg�8~1c�5��d�g�qY�"�3i������	
��[99�e0}��ߜ�f�%@��y����*E�j�IR�}XLdv��u8��v6�۰Q\�:H�8Ӂ0�ҷ���@�^��Ӧ�]�D�C�#�-v�fs����il��|��r�Zl�>�#LY\�Ȅ�J5�W!cy�gT��U���M� )ܙ�Ǫ�TU�Y����O��f�@�mM��IZ*7���+S�J�x,pT�
��f9n��>\"���_��+*{�u��`T����n:[�����CV��V���};�A�D������5A��9�Kh~�EGV�ɚY�� ���G�s0Q'���v
R�i�t6XI��n 侉���c���j�Q=����A�`\h��.��+`�a�@R.�"�a���<+���bhK������۔B4�2�k7��ڤ,޶}�ά>k�=$MD�rG��&t�:�h�T=
��p�#Jv#͞4� ����5��eтq�,�p�*�v�ݸ�Ol]j�lf� Q%�<D�ҝ/���o��a�m�]�)�[}X;^F��    `D?�a[8�.V���sߵ�����o/��QVN��� {�����	�������C����J�����P�٦�1Χ�?v?�^��mg�S��4�;��I��u0Kn�Y�E,�'�zN\�ad�}��ضvf�@ȇ�4��l���h��<�w��N�T�F6��78.��Ќ^ϙ�Q����v�D��V�@���t��먴_ڊr��B@�&������X,t{B�:�m~ ���&�B�X��%qJ�r�6�n.d�L���8���>�MF�b����G���]'�cD�w���h�o�}x�
�pك9��{wF��1������Ɏ�a�Wh���vL��w�Z`8����	����
��W�@���������i��������d
�F^�5���}s����W�H��9�[W���ڀ����VՈ�\�.ք�V�cMQ��qy�a~�03d�k��,�H|Ko�p��Fж�2�L���M�w�&�l� `�|���A�j���ɶ�uBc�W��t���u�|.{TΆ�������I7��l^��}����Gg���J�z�=B�C`H~?�����줇�^��0CA���i&���F��иյ����x��Gg�Z\��	.u�1F��W)tBQ�{퐌���'�d��L� �IB��ٍ
�+�E�;�����4|g8TF�Al����m~j�b:z	��8O+ΗEV<L�d�f��+��@�=�j��:E�\��!�d_�� $i�Q5�s�7ҝ$��j���}����I�FZ$"c���*����/����a:F��\F\K����'W�������C42nc@; ����u06��M��#�$颩�0�M�W�~�j�
�L�*���C�u c�7���	'�k�v@&�07}n��]��O-�r\)���nk�Hl�}Dj�e��o�pw��]�2�2r�w���^+K�®k�0�O�;q�էr^N��x��{:�XcȤ�j�  k�|� �c�8Y�d"�aK�ⴷ�^�o:�E�fԤW�y�D����w����b�&9��m8��k���X��+r?����9��uu�8_p -��r�I�����kN�m��#c�;���iY��MbS�M�Zᶴ4/g�AA����>�/W�5�r�0��C�4�"�ݺߋb�yLN����[9+�c�����˹[Ȍ�%�'=��5ms7n��66�>q�Z�,���mi|[�҅G�^�5�6R�Kd���f�海��ˍ����;H�p*�r���ox��{���n=xA|S��:��XOu������G:�3��|�ȱ<���c('��uE�<.0���`�E�����uNn�#{�6��~���t:m�q���Va�|�Bn��V�� $����|�c�2�,,���߄�V�ٚ���NX�j�j%� l�4��y)����L�U��g�nVv�[
a&�p2	�v��|���
��ǅ3��&x�9�Xv��q(���]��l3>qXQ%�:�ڒ.���Ȉ�Dд�G~SL�C}�e�GSP�Jް[�J���Ķ��#��x�W]���;?���#7�h����@��b�����3��2+�hx�#�~�^NAMٵ��j�44򘜦��G�v�����]Ӓ���*��E�{c M�����{�m� *��&��2��p������b'��}m��X�c9$�h�쇧b>�����]�a��*iD�Nl�*�ZAKY��j�RӸ���ֹ�!����]YSɖ~�E=�]����;6Ƹ	���"�� Ծ�_?yr��TY*���Dt�Ah9:�y���5���m��g=LX_M����p4���	a��GQK#ģ��f�g��+_4�x�-�R9Ua�J*�F��{%q��Z#���8bc_��sU?�C'Jj�����!�[4^�&�_@|NS�!^ӐJ ��(���Ղ߶Wh&����M4r��c�x<Bz=饊x��|�59{_�Cw��)�@a䙋��Ր�s[*"[�� �RR�7��ۤj+z<v=��F236.�<�7m��{0}eSU�kQ�z{������j�YfS4�5t��^�p#0�lf�?�W�=}�ާ�0j�P�a j��'*n��
|�׳�t���3��:Gf��X��ci_^�`�b97"�7/�5}k��{�~m<n��7����|����ْ>��B� ֮�w ����7�9c~0��mP�k��Y��
\�o����P�j ۡ�6�=Nn��Mo)o��D����ڤQ�.�����{�8���xȂF�o���(�nv{�A(�Z�1F�:�zwE`'����������#"  �����^DFXƇL8���nv&�s�2�W���G�j4�Hj��f.�̒����������$l�@�p%4kk��[�-�*�3��8�b�U'����]Iy1�0lG�ۅ?t����$�u�������
D��P�7�evy�d�N� _B����A����.Q��G�r�bZ%��u�苧)Ǒ!�c�]+��@2�����,$S�@��Q�U!�>
���к8�矦��Mz ��!�$o`N�H��b9��=y��h�r���xڲES��=_�~�H6@��B��f�.C�)�sF����O���J%׉�lS�+s��)����?�7'���ݍM.��:'�e9��5 s�əL!�69|���qEp�_D?A�T�����٬r�L=���6��K���UQ��[�X���W񱦎&*�0��R�n6�`�� ���j��`��U��ĥO�����=�DΒ��z��`�8�]L6DS�?p|�n�_*�3�糇��/���"�Â��+%��Z{�.���+�fw�B�9�㽐p*�39��纻ີ�۟!����rP����"m.C*UB�������ss5�Zk~�ͥ��}(.ݐZ!���1y��@�Pn����N$^u��]6�� H&kZ�����p$���HR��q1�Bh��歷H�#��c�I��0u:2���T���}���Ɓ9h�,�%q�����9m��3�=��}fe�u���X�c���������!߇?�U���#x��hށ��з��`�g0�z|s?�	_֦X3�ԅ�Q"����)� xmFg���;0����!�+��]�41��m;�CN���k}p	��;��5��h���c67?��!=�dTa6�j��/��t���#�Z6w�� ������z0�ު�6xosH��i16�J�a]hZ�2`��1� ��l�N!VIYT��4��l�����|QK�翟�dj�����2���4�t�P�yz��dXW���"2Gȼ�.��҉�4��Q����+I�'U<d�H��}�[ N�`2G����1,��ޕ��G!\)1`K���y9���s��.���F��O��Ц� ~T�hP�sp�P����qzgN���UJ@P�Pk���f�:��hl���lfγy1[g�<|{4E��S;�'��m=�M�l7�1N �r>I�?Ex�]3�J�P����ɍ�C#�ۊ4�<ۑ#I7C΋qHK庅,#�$o�b�veJ$H�N$
䔙�߀�f�V�(
P�#8�<?�-�s˫��C_L�0&�83ջ������|�Q��4�/t(5D,K����-�mJ,�}���6��z4�컀\������ۯ��<�ѤkP����8Rb�H�:�75�˱u�,���v�	�ñ��-wd=I}6�!	�PB&�]ųo �:U��[7�iƟ�9dq*AG1�ftc����N�cik��ج��C^��E������������Z����J51�ӿ1R��v �*�4������A{2w�z`{�ؖÜ����Ytk���#n��tl�|���=â6����n�NQf�����nu��}��{_O��l4$���.�t�Ц�j�y��y#��xbB{HQH<�����ߦ��u5No�jD����7gظ=N��M��=���~T��6�*�LBЕ�b���=v2L��8�������ж2���Ɓ�~�-����'�ü���-5f��'�Zy�{hpm    �^�^=Y=�o�h��a^x� ]X, \���M��}���1 ���%.���ZW�c?=��6M�W!�G�(%!B�pT�J�� !p�E�en��.�s}��?���i�8T06�W�T(ޠ"�	���깼:�Hg�W瀭'��X�f�wt
���l�|1���09�ɛ1<�A�G��.'?f/��\Iރ����!u/js�F�g�k���CfE:����~��7�`b�^c\����!�O�2�cH~��ѡz�N-��| ���f�F#`�����8?zy��]Ϟ�j�ר�l��ד�|�b�l���A������|I�����m���f#^;�}Z>�������op�����g��=�����PrG�o�Q�������g�[�\��߹_�M��p��e��s�����^�Ѧ�8���Wo'fQ��.�P����a{�M�{Wz;�Sg�2y�T_g��@�}�n�fO��w�EY�;|X�� +þ���@W��8Y���r��1z����%l�t�'��c}�U�ܟ�(Y�j2sd�.I
�q�v )��pP>-���2g�����U~���??g�ǟ�d��`�$���.��0!u�s2K3�ܽ�#H��=�2�+�h���;�"��d�G�$�8L
�r�uv6=���¤��K:d��x�W�wX���~���y���q�A�8�nw<۽Ic�!i)P⨶�3b�k>�\��C��>�g9�7f�'��� k�0�1�N"�v�t�{49"�cw����#�ۯ���rSz�)��&7�;o��=����c�?��z8M5���ϡ,e-���Ze6�\^FBI��2�a��-�H*<�4|Lַ����v�g�G��lT.6$v ��� �=0���|c��'0:��vr��X*c�U@�b@�줉/��'��*ל�v��fo�˭� �$ub�8�^Z.��T�qBH��!UBH���rHJ)�~�oZ��j����o���F��F�2@N*?j�1��ז7�z��HB�8á�B�եǦ�`�w�t(IE�P�P{f���0�c�h�dB�bk���g�M��[�Zhb߂	��
fhr|c�[�G`Z��M���m��Pe#C����	��Q��i�tl����tB�>�*�Ue�x�{�-qL�ɼ�ٶЭ��O4�����RĻb��)Xdc�<�h*aZF,�r@ԏU��.��t��Ͷ�ު�Ʈ�ФL�:��z�$H޾@|ۀ��p�=�����bH�j�z��*
�!(��0�������iG$��>S`|���LHljc$!��a7�.j��B<7v�ԬƜ�'PQ�����e7���)ґ�]���}'����Y�	�P��`��9:�)n�m�A�г6����J�{!`z�ݖ(G�� �玄On��r|����@��y*�W��L����$+����A	lL	J=]N��Y:~���;�����s�D��*�Њ��~�w�(�]Z�ፆ2���8��;%d��`�Emx���)�k4O���0�I#1�L�5į*Up�$I�P]�'ϓ���$����ݱ<�8�%���ZPw�<i���k��r�y ��O���X)_1q��ҢZ�i�;9|���C�e��h�M}��!�f�R2l���k���l� \��-�f��(�4��^�r��q��1j�&�@�>~�VscUHPϧ�Y��y�(�	fEL]ep�"?��?�<�\�#n�ɱQ)mԂ|~���>��Nۙ��3v��h��4���V�ch��=�;���W~_��[l!�<�HIE��� "��X�����ε������&xc[1D��d�(֫���mjG���eŅ]Y[���0̝%�Eӝ��i E�㆔�5X�@��uC�s�DG��!̷�vz�k�aUR��W:װ/��л���d��zj��5��$X�񚼈m]�(#=�ǟ��ߞ~:�:�/~���C2bP�6u��D��b7��F�Fj6\L`�V�T�;��Mʹ (,��.d�qꦪwm�$u$W:�ڹ�ճ�>�p�8O�Z>*�c��vu�1�/)fd�,�Q�]�R�LƼ'mD�I��J�T���H;���r�I"�D��Q�h�@��֫�k�Uǰ�9�����yӏ��h��4+'&�~�9eq��MZ`#��ױk+���=˿p𽴹��(O1"�R���䖐f���{%N5�q&�hh�Y[�wtX�4̔t=&�!r�m�2
��A�r�8`�a�����~�x��������	9
]FBVN����ck��C����rώ:�EФ�QL㋉)��LJ)Y-e1!��Ž��<g�>>�p��6=���DS�fO�@r�Db))�$�&�o�rFN�*0��4�1F����j �\O�F��a�Y(͙�V�|Z�~�&w�q�B5)��$i��tlIr:J�b7�e�n�#�ᱻYi]�t<�m*M-���tȜ Vp��b�q����K����q�(��w
&<f�q�D��m[��vKL��̥���=ɺ�mS&�Yj�
ٗ�g������@b?���
-p���zz�?,h �p6M�gr2峲ܳ4IhZ�{��"F���y�Xy��+�ra����Cb��V���~+VӛwJ��]̢3��g���巕o�x����}�?�������%�7����bqӥ��ƈ �43Ϯ����o��m/���|r?y�s�_TJ�s�'8/��* ��G������/�b�w1B��8*�9{�ޚ����#Ď��];�LU���^�����؈��K�8�Kg����S�� ��3�<xyCV��o��ɼ�
r~p��C,|�����Z���߁M�}3��u�ǧ��|�b ͏��練���S6دv�h���v�ͼA�;�Oi�T��P��,܃S��i����l߻��e�s��h*W��iV^_�W�{-b��R���>�3�b�ƴK���"6��d"����δK;�U�����ו����KQ�ڏ�4�t;�:�h��+&*�CԈ��H��@���Ў���P���ɚ�C���E��b�UT�6ml�H���y���f~bvAZNU��h�E�P�ćV��E㬜�z�'��J�b�u�����*�,g����ߢ�(�(��D#}�FB� �Ś.���&Z4��R����؇d.�Ry4���֭�� ^r�������<��<Z�R.)�s��UFɈ,wJݍp�) ���2c܂�L�A�1G��c�!3TJP�����"��E})%�F�+���6>Z��Y��<	r�SqEG}���e.�rJۈ+BSz����F3��A�w���=4�m�a �� ui�k$d��4��gI2�72��Mc#���ݐa��\$x�"5`��Yw����u��ʐ e0��� �,X�NAF<��u��J�X�Ŕ^9"���2ves�N�`�bk���[��t�C@4�C�>,F��rFϔ�rA�h}خO�]�و��N�2b>ȶY��$��+�� ڦ���id/(�����jk�{�L{Α�';�߫�V���U,���2Q� ŷucd��O"J�hQ�bH,\�7pt�?����A�x@x�Z�gDS�X���1�U��5}!b��b�vF��'���X �:��L��|ċ�OTmB�(Z1F�vр[+�F�9Jm� T��r)c���pXA�b{ͳ�w�3ML�ˑx��F��:N`{
�9+��lCƓ��q��b�;���U#ֿ ddb�����+W�d�2b��PY��r�O�I��ɋ���d�����
IG�"�R�b~(�~�؊J��m��������u�G��$h���E�z��0�g1A�p*Mbہ�Xqp�K)o?����r��^�
��Fm>���A�'T�����-�=� Lqo�b����m_-g�.$��My
��A�u1d|&�i9�s�+(�~���e� p��<���$��8e̊��3��jt5(Ca�$(����N��I�P�J�b��L�=�dq=&[P�{6�&19�Z�0�:1}���/�}�Ľ�U�l���	*w�Xp��@m����BB!D\{����  �  �6��c"�E͏տ�f�WI�����U�����0Q�O�9��ݥ4J����ݳ�J�H�ڠS_��1T�ZY������A/.�a�,%��<,t�6(D1��z��eݒ�T^�B���0��N����~R=.�e�h���� �_"�P�[9�i�U{m��h`y7��±����Ie�e�d��^>N^��	7�c��c��^�����yr�h�/���.��a����3}	���{�3�j_쪹Ot�ݛH��ǂS��Ź�P�P!n��b�p3���:nb	�YC>��� ���D�9� �6�|�J�+��V/ ?`f�����bЮ'xpھ����m�V���1�ՐP�,�c/��Ӈ�g����DX
,�v ��4�_!\�\�/^�E��1v��G��-��H
���8�����~�?JB�C     