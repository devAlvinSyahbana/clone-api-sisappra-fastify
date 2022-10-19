PGDMP                      	    z         
   dbsisappra    14.5    14.5 	    *           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            +           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ,           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            -           1262    55322 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            .           1259    55736    master_jabatan    TABLE     $  CREATE TABLE public.master_jabatan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    status character varying,
    id_master_tempat_seksi_pelaksanaan integer,
    level character varying
);
 "   DROP TABLE public.master_jabatan;
       public         heap    postgres    false            d           1259    62772    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 32
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    302            &          0    55736    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at, status, id_master_tempat_seksi_pelaksanaan, level) FROM stdin;
    public          postgres    false    302   �
       .           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 37, true);
          public          postgres    false    356            �           2606    62771 "   master_jabatan master_jabatan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.master_jabatan
    ADD CONSTRAINT master_jabatan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.master_jabatan DROP CONSTRAINT master_jabatan_pkey;
       public            postgres    false    302            &      x��]ێ�:�|n}�w��K���&Wi�*_a[�h`��;6R���K�5�9�9�b��d$o!2�uloͩ�<���z��n��c��j�������?�_�_�w��f�,�Ƕ��I7i�?E�?������$���9v��p6���v8K̯G{�����=�O�@���'���Ҝ�������i��i~��͹��/mOͱ�<���x��?�K��7���}s��'E4��fx<)���������l�6�ss�]��G
�iR����C{�"ܟͳ�4����=�����O.�����#�Uʔ,E�T���{���z�7������`CRE����I�բ(5��0�0��{��CTw,\�����,xC+�F���$M�ZJ��@�l>���[D�Lͷw�������	���fk.��ei�O�\~����KS�������;�æ����xѧ�s��"�x����J9Fe�}ʏ<��ч��]>�_��z���IZ�B���3o��*��櫉�UVO��[�5�~lR�ڬ��IZ���i�g{�2m�� =</T)��j��1K�-���џ7t�:�L���ɷG��xϦw�����,3ܩ�]Ѩ7��Ƨ	�<S�^B��@h�xi��m>�x!�Xm�ګ��6�x"������A��߈,���sF�#��@��W�C$w�3���;n��d����d��nhj�q�]�9���Wj^��l��t�f�ǟ��a�5�ځ�61��&���kq�B͚�>�BƋ�Cbhjf����̓������֬Ì�]jl���8�ypB�\Z.K���j>���F0ĳ~���~��0s#���9�u6�aJb)�@bvcl���.o�Ú"�$OgÚ2�0���2б}b���{v� �����O�9!��Hr�MJ�H2�l�2'�V�I�O��p���/���9<D(ΡJ�-�9�,�:!��5�,Bb�]��z?��.'W�I^�AX�$��0%u�R��k&-�!����;�;^]� X�I��>�&��bQ�˱(���YRd�b.��`&)����0��͡EN2�{��[�ܠo�����w���,и6Sb��I���h��=�j����mm��(^����.^�#��v�G,���Q��=b/L�0�?��zyu����H���P��K־:ɡ��x�z�,)�{�2^��$e��P/몌x��Ii�wI,�:0	z
:!����:!�A��<s?I��g��{I���IY}�T�{~�T�P�in$�ʺKI(�aJ�-,�����_x��`&��W^����x=��� \����_ݳ9d�2[ ��������Z��\*Ba#$�:��R����ߚ��;���q��O�@;��,m��*� ڦU�6j�*�T���$T8B�"��;d2�|]�w�Z�6d���ge$�n��>�7=e<>��S�Fk[ ��ы�5�Z���C�!�5��2K���8?4��l��W:��Im&4�����s�Wd�V���*�mք�GH���n�&d9���.߻��^�&���@RW� O*p��xq�xЅ	������D@w���3�n����1�A����Im�d�F����x	�𲛺�J~�x�y�,��/���U���|&c���K!��}x�ػ�l�dW�4a�w�%��Yb߁K�!�+0m\gB�nDEt;;Bw#"B<�)����'!&$8�#Ȼ:�r��C���
�͑�H��6D���*�{jn��%D:��`IC,�'j��*�+�g���û� �9��`1!�����П���P�H�EP�L�~o����[B�ƕ G�|�I_6��+
�x`1�����<�jP��ՇC��m�r�B<�D?���6��c��4�u��M��e��E#��@�iPև��A�FF�P�����(D�E.S4
�@��3@���G��s�W���x�J�!_מ}���/�K��N��҅�\+=�ݣ��*���D�����Ҡ�]w}\]Dxy�F�����}�дg�ܲ���21�m�����Q-ʺ	��5��R�-��C����&)��4�R�`��@�L�t$?P�?�ט�v��pڍ�	�X��H������{�J ��#�"�?X4��DE؋�*췦��HA���q�h����Qf��nǎ�0)j�E-��ގ8;� ;�p���{�	�p)�	*��^���#%@F2Ae��i	�z�"-�����8�u�\���ڇ	��\��\ ��b�)�p%)(�kV���d�}srM������yt�1V-�\RTnT��9K�b߆�4)���ͧ��-kI9{�9˹�������9B՞�΃�޷�����dlR��L�w>+o?�$��p>M��a���4�@�1ӭv�-��ʕ K�BG�����+)�0F)0RH��(EE)��~����d;	�"�lH%Ex���ٝ]�Mا��J�>�$\�J���ͩN�ϲ���"�2�+��I�m �)��_άͪ	�����,R)�RP�GpR�oB��A�hx��*�:|v6��(%���?���Cx�� �����ݥR�F�,��ʠ��;tq����bO�>��U�(�����r�2;W&Ve������|Ee��J�姇\�)�RTȬ��Ǌ}�9�eO���27|�4m��4�Z���ur�a�R|�ZP�v���.��U4��Rh��S��OE��	�V�u%���^����++O]	 g�n-� j��R°���Z��]f=+)a��3W�E�m%%�Z�b�Xp	�0k)�Dl�ӜN-�CZ��ٚ�+)a�ʍ+�ݲ�%%�YR�[�,�)��RT��w1��!K��wKւ$%�Wy�J =�|e�':2q^�_��!KO'�4o�J	o��I'�֩����.a��W,`�0	���C5f��ЦG����)��RP�}�2T��}2&,]ʆl��2˦�%"��0�م׬_^K�ڄ�K�Ъv�y0*���x�GJ���ҕ G�\�p~y��Ԃ�\�!���h��`�JؾU"A�:�g�"M68���_�#�l�!�um)�s?�i	C���I��kn�QY2��,X�?�������5��b���� tף�!4]�`1+Z��Ǖs��:��2�o��/5 Ή�Cχ}���g����L���<x"\#{L��8##�`J#jo,�2w��S�i����`��9��e?��@ta?�M�)���R��;P{��r:��y�[��Z6Z�+���V��kW���&l`_�G��	�{d��%�}����,�zX�B�b*2g���\H a;ة9\]����Ha����2��4Ha3�o��L�1���-��YF8���"� �T�����Bޘw������]>ܜ1#L`�Ε C��	ϗ�Qg��&�^�Qg��wFX�U"���%�j%��) �,(�j%�9 ���؜�q�?#�_J1��_��|k�:����@�a����܌p�)dv��,4a�@��3@�a'��z��镰�M�����O֛O9��0��+�غ����>/k?�����/mEF�0�12� ��H&����q=٧㕬���7U�N��W�R!i��`*U5�	S*$�YO��ׄ�8Z5u%���^���GX��@6Q�^��f0O!�����#��=����M����ƕ m��N0O1,�t� ����S 	ߗ�!s�����X��IVl�7�2���!%�K�a9TB��]8+#�[�'Ǖ�=7�G�p%��Goze��3q^2���!KO'P.T �A�'!�@��7|ʑ�wg��;WQ�@�c'.�����߅�=��R`z�ܫ���-�G�Ż���,<��C%�[ʂa���fY��vMH�C���f	��ld��8��t8���P���D�[�4�G���C>����=iY,0�U�~\!%�\��9����jZG���KYЉ�KB>ܯ��g}F���ʕ I���Ä�Gx�s�&g¾���s8�5#<Z

WK�1�؄r=6�[-)��=�"�7���Rt��Z�S�o3��Rl(�ZR츃嶗��    ��R"��jI�c��G2#|YJ�VK�������)�ٽ!\O�V��ta��oMԵW��$$7\�� �[���E�����%5�ە�@�XN���n.Ej��;^��a�Rxd�zI�C���"�\���P{�i[$�[ʀ,Q/��:v��u#s�ϥH��v���2~1�..EG{��d�%ǒ������F.�@f��ժ�U㨊prMĄLP��~��s��0vM8�Xqv-T�f��5A�lwK�ﭕ-*�:	��]nX���*�I�0��?p
��<I��e�0*#�Z�Ε x�Y ����CN-�!Z,��."�Z�*�X뭻��s�I��K]N�:����)Bزix��Rwr�?�)#,Y�P&f��Q$��������r��C����b{���b���r���x�NCX�&���=7�߶Jᾚ�� �Z��,֢��n����b�[W� ��嶓��) �0^)p��q���Y)��H�������^�pY)G��tI�v��g��]���tY��-��V)�L��U٪���ɘ��*�@�I�4�9�5�ܢ�Y�u�%�:K���=��̓.��]k�����O�>0֭��Y�Y���zSWؑ���c��%9�+���\��H�;��RT$�lI�_ͳ�t4��Jё�E�^����~�2��JY��E񞺛�	�B��dK�}i��kJё��IC&+{y�0�4�r�e��o�f,��H1�b
�Z��2�<H5�R8�Џ��V�� �M�?���̭%��HY�+'Cذ��,��*%lXJ��`��Կ��K��R2p/oAdρ�c{r�,y��7C�i�,	��zp	�p])4�k�{ﱚ'U@�֓@�fQ�ͩ�lﭽ��0`�ƕ x�����by|�Y.��R`�#2؃v+E��"���h�'+�^����*	?��C���X�C�O���*�Gc����?mƳa�R|(5_�j�4M(�CC��j-ZۦY�pT��+�r��f#UY�@���m�pUy
m�ACX����m�1��oU��Db^�V+�6C��<�,�2��JQ���!�W������ln3���\	0���6C��<��Щ;��V)�w�[eo��ɫ��b6�3����]	����6C��<��u�Yz:T@9י!<V��
�?�o���ֶl�]U�\	�g�#%�b��k�� ��Iz`	t�$C�U�<�r�Z�a�R��gcٍ�{c��L���Gc��c�V^mB���v�`,w��өq}"�<H��|�^�8��J�0��=%�ۧ�֔cە��������a���o��w����5��ӶUm]	0Ğ{g/�ǗR��{g��O����JQ�A����BN,�y�*��Cy�'^�J��1{�������x=+>�F�v����-E�b�bV"$�z�!:�!XJ��Q���vM�,%B�ß��}�i7�Κ���~Dh��qkŖ�G��ৄ��|k�u�7��	�V�� ����n-/��^���F-F������HTuP��g�A�0h)��{厶S3֮-DH�� W�ߚm?�aK����'o��۰hai�{��	��5��.%B�Z9r�j\������w�@��!�\��ݭ9���R`�n�p�o�!��i ��ӱ�ӧ�M��RV��>I��>�pd)Q��۠$�✲5��,e��T�lL�W�N�9a�R�,+=؊���	������ru�{����C�×'
�p��s��2r4�h"{ٜpnyx�=_�>1'<[
�8���_KA@�ھ^>�Ggᴥm{	{xD�R���f.�+�<|d��dV��.%DJY�L�~ ��E���y%|���yyB��e�-�ŷ�]��./e@RI#�>�e�ݫ�]	����zyx�{��w����{�;��RP�=|~�A^��MHx��H�ҙ#T픆�����i�p)<d>HK�&>\��<'�_�M��ђ���ص֜��)��D�ތ6Lx,!h�A�\�h	~ �a�0k��]��#Ï�1g��1w����kk�e���^��c����S�|�h�ɉi�X�r
/\	D|���O��%����s�����	��kKQ��Y>�N;g¼�Tȭ��\n}e"4홐^�w*�)�j�pu)��݊o��Sc�	[�� ՚��Os�]�S��,��=�af�����V�0xU�+��3?r�������V/����E9��RTh/|��K�	��R@s�K����`�P��$��ڥ�rX��Q��Z�>E�����9��R
4��E���z��2����=���F�j�a��Rg��D�cs�� d\�`�<�#'�_^T����0w)0T\,��5,��K�!�B�}�Y;{a �����k����c?��	��@��'j��v�Ƴ�s� �<PuT�x̅vӄ+Ly�d�i�ɮ1������ep3\	Ә2@��7,�M�6�,!�ڕ ItM8�<��{�\����)0Խx.���ST�z�&ŷ��1�����R�����oAr�=�d�wބV2]� �dJ��A�c��՜m�Mx˔-6�-�w�q��6�+SH{�W�h�}�cV�\	��̗��9a,�����x;xNx�<�Ȼ|#��1��'���s�PV��h�x;xN��<��^�������J�̬a6'�b��4�~�b��α:s%�������197��gN�U�;{bN��O��~{�{:'|a�q%���j��yB�#��y�"���0�C,ܰ��/�C̻��,�2�� �� ��sڇ	}��C��9s�ܥ���76儥KA%�+3�|3�5��P�'AB�÷���.'_ʃ�T�����/�N>��	�2ah�~)�t�H��������&���ۜ��Ky����_~Vӟ��A�e!^�����>L�{���V>��	��C}���9��RT�o^�F̧!'4�I ��ꞔ��w�!4�I�����/	2���V,d�t�OxȔH�T��ǥ�o1�o�z	�2�I6�}t�43�����)�a׶��[��~[�HZ�U��m�3�B(�t%@�FA��<>2G�]��.����C�a�KLQP��>6�,������#��r���jNX�[�зg)�6kw�"�(!��YJ��yJ��>�*$�HX2媒"� ����9�P�0�)RH�4��g8�PG=aS:d��y�n2�)�D��,�.2��/�-3ل	�_q�Y��؍����\	pDZ�
�J��%��Y�
�J���aKV2��/��"���d�bN�޳Hԃ��7�~#�P��E�Ȕ�+l#��7���L	���F�������A�Ȕ �*�"���Nݨg�G��Wa�le������)2T�B�Ϊ=6�!?��*�Ҽ�����;����s�J�"�ς0�yx���	�aS`�,pIAx��b����ׂ��)�D��qz]�1�G��o_�辚����
�B�H+���:�Ha����{���0�)RD��ŏ��cD�w�J >�&b^d�t�>F��CV�;����U��ŷ�aS	zP�2��gk���$��ʕ��,/��w��SH,���S}�S-�s4~�� �bJ���b���C&�C���_�Ɔu��w˄ml"=t��1w�;Z�?���x�ﶮ8"���T��T�L�>���)0���Qa�y�� y%J�K����kޚ~��X�B��LiP�Ex��^>��a'Sd�b��d��b�G8��LY�T�f2�2ܙdi�Ů4H*a/������^&^�ʂ�v��,Áߖ�r�ʼ�L���7��E��y�J� �8O�c�i$�+�z��L��N� {�Մ�=8RI�������/a-S
䑰�������(�{
䐰��.9j�]f2�@;
�Ɏ���͟�S�T�$a3ٴ�	3�2 �̛�� g�ڜK��v�+��~�����H#�+��p�B��]�)� \c�*j[9�l�� �)���d���{�iL�P��S��o��1����O!{�7�_[Bݞ��� N  ��ݜ��x��̦W��L頿*<�n�7^'\f;�J� v&N8�<��Z���3���w��<SP�.|"�k�	i{
�xx��=�����!��I ���d�b��f?�+י�@p����lO���Cj�#�N�~��/.#��@b�Ȇo#��f9{����鼿|�'K���:f.�f�0H8�&D��U����ᐚ5����C[�wn�G��v�+�uxA��v�+�8�}���� 9�x������^�]�J�����=�SH�v!xA��U"6�/3�⡳��{���\	0<�aD�CpC��p�)�w�^V3œ��y��a��]	��{��Y��r�#xI�̔.ݼ�$�d�g�����v�����l�s%@k-+	k���c�ZV�2�������LA%�aK���V�2��A>{p���ȩ�.F��=O��st�l��uI�˔����z�n���N�Q%�/K�[W$)�ml�%�eJ �V�e�fK��&�h��B/kQ�U<AE���l<��N]V�	Z�U�Eٵ��p�MX�n�5k8X��2��j�X-��	Y���'I��:�e     