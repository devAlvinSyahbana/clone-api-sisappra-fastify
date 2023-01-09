PGDMP     7    4                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            �            1259    18956    kepegawaian_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_pns_pendidikan (
    id integer NOT NULL,
    jenis_pendidikan integer NOT NULL,
    nama_sekolah character varying NOT NULL,
    nomor_ijazah character varying,
    tgl_ijazah date,
    jurusan character varying,
    fakultas character varying,
    file_ijazah character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 .   DROP TABLE public.kepegawaian_pns_pendidikan;
       public         heap    postgres    false            �            1259    18963 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            9          0    18956    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    243   9       A           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 204, true);
          public          postgres    false    244            �           2606    19525 8   kepegawaian_pns_pendidikan kepegawaian_pns_pendidikan_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT kepegawaian_pns_pendidikan_pk PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT kepegawaian_pns_pendidikan_pk;
       public            postgres    false    243            9      x��\[w�H�~��g@uU��M2p��Y�"�i��.'��ן��$!p��Ez�Z��c0��e_�})q*����v���ܓt�ݬ��2�/�x��>�^�Ҹ�_,�r�wX�6�~�ݔ���4O�A��W����RC8�M�ߨ�	&���7�{:2�����|�����d�����p2�M�d�NG��d�4�f�)I�,��2AÜw�~�~�2ڥQ�%�4_��$�����^A���l8~��l�oT�l�w�M�M���]�'��
/MgYJn�Q2Iy��a2	s�8'	�u) � ��e2�Ӡ���,�y> _�<]�m�r2Kȶ$���(`q�a�]ƃ.�y����� �]��F�0t���*�.��C�@y6�A`���!�`��dO�j��;%���2Y&�_�xR~h��G��0��D;*�4ڮ��� �'�t�u��n$�(�h�02-�L��9�@}D�6#p�@r�e�H�`2�)�������p�4��e��e�<f�k���"�:1�i�i���e���l1��b�8
�qX�C�J��.W�U�q1)��}�IPr��y:�3J�mrW�4����ڢ�%p,�`dkI��d�.�/�8�!e���&>ͺ�TSn�9�o���?�n��vpڰ�)����뀲Y�-)�H�kՓ1w�@��S¢���� ��L0����UL.T��/PK���t��ڭɤ|y�B��M@l�=���m0��oAB�C�߿���/�F��Fv��})�������=8��n�O�?\Z�P��4��IB�ì{ULA��eN���X�c1���r8����tF>����cM�s�a���p�dYn�Y��}gcM4� �F_u�Lo
8X�.�,	�����wTF��؊H�`~�#q��hJ�a1G���D�XS��i�8�v��_=���'ĨܛT�R�,����ϯ1���:Mm|)W�����3�=1p) �=�w�g�|.���Sxf�|�i�W�b-~p-�p�3%���#�d�Dn��-�o^� �����pPCk���_����c�V���~2�>'f�,�*B`�@���J�Ade�ip�1���k�	�Ԙ���QM;(�.
r�N���h��A����6"3`�E�<��Eq?�
~_�Fʥ�e��U=_��YN}"��-Pe{}�����4�o-�8�3�Z�闢X@AEV��2I��K�B����"����G�J��u����^����#x�~����=M��ٵ*�v:<�f˕�a��Q{���qs(7�����'�Ƀ��#.�f�ܦ櫧-�-2(����Rq��B��"7�S�;�#A�E冶�l���������@����5�tƑ����2W����YW�:Y�ܗ6J.`��Μ#�H0v}\�DG��G2��^{<
e������ӛ���j��2Ej7���,T*�֛��b����;���<���~�񄓴&���)n�|>>�\X�S�U�IZ� �y����#ٙ�ISr��_f5
���S�)��QW���s2���ZF�l���<p�i%ք��i�"*i��+{,�83J��6ok-ⶬ� �)�9����FTJs��������-��4���<4��Ȏa����e�&�!2,ga���Y�B@��d���4_.�<EqI��m��D�@4��=�ǁ?q�e�n��i�r����`���,�b��n:�&y��1p�Ssi��~z���ݑHj�o;��H�N
z���ewIq%�)wuߒ��зX�E�`�`YܒmʭÄ�f�@@2�ȧ8T4�a^�0�$_�Z���J�DU���^�4*�(^9ų>�ܼ
�|a=�&`{�f�8B�,(fLy+��,��gy����,k�gd�Ű{�jkq?�>5�����#6U�d`�Q	|��V/�@P��A	+��[����䁊���1)���o��`�^CHu���l~|JG���6Ǉ��sW�|~��}�S�����P��d�����^J@}$9X*0F��l�$l �q+l������[?yoc\��ɱ|>~0`9b���R��.*�%����X�R���������>�n�!U&,�7���rS~[��6$d��i�پ�����)��P� ��I����d/�R�*�U]��6]ᗳ`Bw"~�dP�	hm/�	0{̧W�/�Z~-��N�!�A�;��l�BH
Ӹ���Bo�P���v6J��ʋ$�d�E�)I���tf*�e��
NE�ʊ�U��̎_˗��a����x��,;��1Q$�S]^1*�@|��̓AG��J�d6) <X�Vf��'-�)2� �#�E�I)�i�Û�#b�$�"_��X��B�4�in��Q�K��8Mp��rv��M[��Y>�H�0����@R��$���I�(W�IhTE�7Ҧ�m0��d\M"��d�b�f�aU��P7��5E�K�Nt�8�/I��H b���� ��܃38^i�C��cZ9�G�,N��΁��ɸ�{�|4J��R�=#cwk�N@��u�e�{����#�]�d����}ݒ��W��|)��9,2R2,�Y�o����	)o�@������=d�_�I��/G�o���<��ͷ��O�5L���Fq;m�(���4B�:�e����*{�N$1F�åեV�)�HT�>B/z�$�2e�@�uTs"'ܶ��}rj1w��h�j�t$�H")�\�NT�1��juəg��4N�����)V�l�;�zI/g=�)�����6��\Bt�N���g	�!�\%� O]Ңc�C�e0&�Nmvȳ���vNk��Wq���AGw/��q}\���q>�B��s�]S�WLJ�ʇ�m(`�/�a`:=���Hɜ 0-#��ZUt�rj�5\�d�7�+K-� ����`�*�j>�N���c���0W��3S�b��O+�
�n�Hn�� ,���i��
�J�¥�¸k�Le9��%���6�r+�o�'�V����+{�`����ǊuL��Tt�B����t^���Ƙ��O�zcXD1�	�zi�4� A��$ɒ;�+��4�� b}.4������]�[�!�ZA�!^E>~�����N�O�-_�w)flo��w:Uy9��j�W���������F@V-8Z�\G�wT��\���n�x��Oڼ\��dPܒ"ˀ����ҞM�P�.V�"���jm�2ݏi7!�+�4X������k
V�����@���}P����{~�:.:q��t|*hi ��T��Ș��� ��?�tP�����`�!ea��xH�䕺{z��d�g�]�ш)%W�r�,���� ��E&�R�	=��U>��I��株�pe�W��or��(�@I�v ��`�	w
�LI���F*�V�Vpd��H�!컺��pdMb�b�	^�i��)�Z��ٿfQT���t������|	��a��3��|�����pRL?`ިj,�θ�Y�OI1�ټ� �ɬ\�z�vqmh��	8�<���hS�����C,�c�F��� �j���J�XІ ��J�N�����=w����:���6��Fؓ��?g\��s�ξe�|�Qvl�ǖ��/f!�_�����l>���!W\cT?�Q=�����Ű�F�����ɤ��=���dB�[����t�~�1Ν_�&&��~S>|_�bV�`�{�щ~ƹ*bD����9�|h���}-b \E����5����2��dBF{��0��Iu�D+�p����_���\�hՠ �9�o����-��(��F!ΫH�����D>�0�i`C]�s�ɖ�|ʢ�=���#*���۠#)ة����9 }^J�y|:~�d�����`-�R��U9�S�b�RJ�@�%�e�"j'/@8O��P�$/F6ON&)2X�Zs+XTU�+��x���� [�0Տ	�d@�{5Sx�,��.��7�8VK��.`X�y�y�k��g�Sά�$�+n�V�y`Zz�a���m�:���}c^�o=�^5c� ��L-�%�Ts�� ��0 �  �6bi�clc�~��f*�s��9\��S��bv1r!eg���g�k%�u�d���4��0��ϱ�a��� s��U9��Ы�BX�h�֛��5Y�',�����{�\�.�Q�d���_T�Sa3}�����z���V���i�09w8LG�$9��4逪t,#���Q�����	<t��׻�Y, ��8�H8�îPm&��ޯCV=��L1Om�N�i�Q�]�W�^��j��Os����F�P �
E�DH��9w�wD�S5}�=�0��T>������@t����Tj����DRv���?:<f��b�_�o��ptm.2G����+F�+M��a��R}П��[�R���Q4X��+�L��-�S^��kuW��H@U]mc��FW?}�sB��Kg	Cl���w�v{6C��b�X1UU���p�T&�o�ݱ���;��t�DÄ�J��%����ZQ�W�ߘ�@V�.>��vO C���.���E�3܃o��iк�
��覰6Â\��4%�hmXz�BK�4��E)2gUA9�4I��xS�!�X��z��0�}Jy_8��f�ӡ�b~v���ts�?�Jr��|�O��2L���?�a��OQ�2j[}��V�c���l{��JeL�*��hD�,�$#� 8i�<�u�tޅ�"�a�P�9���d[��1t)�6e�,�IA,0���&�uS#�t�������<�����~�]���g=T����0�X�/�j�H��E)>O�6�N�B9A;m��O�oZU���t�6T>�$3��mg�-VR��W=�/��'m���9l�4	T��ø�LR�Dm+��<3�y;l�|��L���v~�R��h�P��'�I�[Ag���	d� ރ��ެ�/���
n"���;ԅ�8ScW�6��Wf쀼�R�q�m�w�n7�*��=(Z���n{|��G)�a��_�-q�����/mt(�,���h《� ��	�O��/	�#�Д:���﹛���)�"N5=5*xV]��Q}����Û^V�Ȝ���V����2����8HY�<�U�q��l�T�A��K���/f��mS���d����Vt$�kH�V�T|n��QǇ�B��������ө��?g�����g��Uћ����(�f�o��ǩ`k�,����}r�a���g�K�Ou�^�bQo��&�!nU�`�)M��6B�k��nj<0�P$C�N�b����sǽ�-SD?���RZ��/�}�X���)�-�M�|}j��4�@c ��U��u�q����-���}dC�����d1TS�z��� �&�-~�]Y%��d���M����@>���?�G6�"�%��M�B��Mk[c�~�0uw?��Uiu�j��_�ƐFFUal.N���8x��p��2�����D������Cenf�d�͢����c��p-ڻ��ﰢ��yq��@Fvl�T�̯����	�B�/μKΕ��z���#7�����ba�Dr�c�{��zBkKhuUԹ��:Py���s�B������X[�攄�a�N�1�#6�� �v�߭�
���_�[_=���,������e�ܓ�{R�nJZ�n�"D{�t\%嚖�+ tcр��������+��H���a,j���C��B����~\�������(���Q��T�C� 3�+[%�ݪ� ۽�̖����n:��QTg�����xd$o�xxy(M%���;p0�+�x�Fg�߅q��R�m7W*��"�b?�#�?���h�b.��������]_�q𶻱�K���v�U%�l�	2*B�2����x�#��%��F5 q�UQ�ƶ]�̳
��F2�_oJ2٭�q���_�
*\?�=$�� ��>;xM$��o[���O-R��%sVr����]"! ��Sr��+e�5?�<_5|m)zﹹ���|���;"�oo�v�̟_߱?�;<v�1����\�����w��>w�&�wۃ�/�ϫ��n�Y?�8l_��	L#n�����������N�]<#��X]���_��s�P��>��X� �h�$��ɗC�\X�b�t�{�h�S�ｓ31�������$��hZUd��"eO�0�k6->Q��o�o����-֪ه2Q!b�OЯi�0\]�Lγ2X6Z{�4&��l��k���g�H�>��n�r(�
>������v^=K���������JS��fX�����:����a�UWF\�J۶̏��^��dӍ��Y_ �+�7�/j��nF���N-�HpZ�.�v;���N���[�*     