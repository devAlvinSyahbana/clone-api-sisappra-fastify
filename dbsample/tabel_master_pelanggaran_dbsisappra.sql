PGDMP         '                z         
   dbsisappra    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    26450 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            0           1259    26866    master_jenis_pelanggaran    TABLE     �  CREATE TABLE public.master_jenis_pelanggaran (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode_penertiban character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 ,   DROP TABLE public.master_jenis_pelanggaran;
       public         heap    postgres    false            1           1259    26873    master_jenis_pelanggaran_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pelanggaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pelanggaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    304            �          0    26866    master_jenis_pelanggaran 
   TABLE DATA           �   COPY public.master_jenis_pelanggaran (id, nama, kode_penertiban, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    304   �	       �           0    0    master_jenis_pelanggaran_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_pelanggaran_id_seq', 279, true);
          public          postgres    false    305            �      x��\�r�8Ҿ�<k�f�|  $sY��"�<��<�\�5�_@J��eg��f�8��>7Pɱ����v�Ǻ�Շ0�ې>և��|�����|��$K�w	�љַYu�t��LɊ��Ȝu���Lrl���L�n @���z?,(��+�KU�����NW�+
Dʓ��0\�`2eJB�ISw[?x �P����xM� ��)�%��re�� �MdD��c��r
Qs	la3�����T�h?���۾۝8��[���g��iUZ+bk��� �i��(&״��633�&L7i��� �w�s�3֏u��ٿ�����8U8Z�ʐ�ݺk�ǯ���7�=���s��ǹ��!�ъ�,�y���F
l��T�l���%?����~�|+�<^�9�ݟ��?w����ĢԌ�_�<���i\�U�UQ��l/"�6P�=	�Hg_H�ds*+y����z�7��[�0\ǵB�"'Ђ5jC���*��
Er�P}0��W=̣oH�@�R�ڃ���� �R��ζ�b2�6�%�g����K����'b嚡P]s�#E���Ȓ���c��V!�5�P�؞yH����I�v��M2�KǕ:�qy2Շ����0���Ұ�G�i�;��%�Ֆ59����-�K�y�y$���=��.���~�d��H0���qD���0�5X>�t+��%�/��0F�4���g���_ �m���������(�e|�@0����:Wˡ�XŌ>۔c��\2K�A����_ih����1����_B��w��/Y~WUeYr ���6�%�4�A�-[�4�����eY�"��p� ���)�)� L�b �����d���T�x�݋�^8�s���c��'D��H��X8�^v��n��|@���(�y���?�]����!�%�
����t(�8<4��V�

��N�B�A��=|�l�ԭڕ��>�h��U����6���#(�����!қ�{�?�?��,_J�Ee9��}�D>JU��P�xBTd�r���'����B�� 4xQ�0ɞ����o� �,�~�;�~1�B~���M��Z�]�M6�Ý١h�}��2WFq	���l͔��\�Vv2y�̘C���� ����c@{"��Y���2�)=�^:)P�
0��26,��?J����f��  d&�������y�?I�mfI��b��%+�h�8����Pt�S@���G��99�.Z���<_�I���l6w��VN}{s�o����xe���`�Mr���f���7��wsF����mP�V,��*2���p�h��Z�>6�ɕQ*&���,� ��y6��Chc��K[v����cf���UI��#B��6)h���$�s�fd���r&��0�3���#��s.�X�3�a�� �xx�4��+��X���V�b �07>J#~K)2dW�t�Z�G���>��ش$2�RY.��ߊJ6�enZ!Fe���4���h���
�31���L���3�`�����¯t-�����ɳ�� ��B!i�ƑB�����Ǻ�5��GA%I'0�������;�9�w8���
�-�	�B���̍".��'0���.�}���?
�����P`^��ۨ8�bU?��_(ˬ�p�Sdqgh�#�-g,`_�SI �-����l
m�%�8��3���e]��'/u{�dd�iA`���^��U���|��c�M�k�����",����#d1$kB�����z\�G�2�X��`��	K�Ga��523�����y38����{v.U�!}�H�!��it�8B+
���v�p9�o�� zmX�N�"��r�HfK��̧02穞�oo'7D�LquB����	��
�僖2{�C)dn!-EH�$�R@��n��@�:���Ԥ�y��N!b�;>]�_��B��rV_��%*��lEn��s���K���������M!��<�.���-��،}aY%K՝kY�j���v>J]#�lu������=�'tl��t��8c�O�T�S��@��ꋁ�VS�S΁����T[�|�RsK_��ao��P���G�Km��s�y��tD��g�cT�j^�r?�O�J���0�P���j�HT��DYw�FEp	�`�CsŹEŎ��t*=������gU��)�d�Z���5�*�z���| F9�q��&�l�M�l����
M<TY���t�L��b [l��p|01�G!ʘZ�LsA���� !%���}���2���H�٬\���d��k �b;
B���� �11��i�̕is˂yөz!���}�֙��:@T�r���V%O���ߩ�k�m�s{!Z�bD�*?�U�(rJ%`f?G��-�2%}~436C��ϡ��s����Afe��9<]E}���&|�T:C��|��'W�Zܿ" ����'����shn��J���sB����o �����,B��
g=�����Hktt�oBGU���Ǚb�1)���hT�~��y���%������<DOyC�I/<5���c���|V�U ���_͈�X�{�B��a�&�b�5���(ΒAUƍ�I�m�������S���C��1#�������i�����˄Y�����;W��ڄ1HĪ�<w.g;��
KWu��7 ��=V�D�@x�ɘ��� �C�ۀ-SR�Js議!a��T7\��G:H���g��,��/+L�59T���m~B;9�-Mlv;�LK/m����ѷ�,,Ll�2xT3���?W�h���p�)"W�����喙�,�L����H.ms��D�$! �[�����J9�����`�H��\NKe�����?�@�_u�h�e\����M�Ǧ?J�B�;��d����f�c-�V\��d�1�~�7���jȣ�d���i�lp�-��OA<��2fe��3FcW�Ö�m�R�"��`u*IAJ�y8d]	Vf����TLr4�c݅��ǁ(�<�,i�y��a�h��F����	���WA`39��}4��ʳ˕�����{obEK8ܚ�,Xl�ߒ��+�s���öGR#�ꝤE��u�0a��ы���}RY0��v+�XRHG"B��� ��P�1
Hp��i4�uty��s!`0.K��T���S�"&��Bz5V�x4J<^��J��|(�,�;���������(c�=0��G,�	GV�&C�K�4h�T�,��B~�!���J?�����[��`N�D06�쐉�ȃx`n��EH�[j��c�y���H���KA%���UY4�J��c}�>�:V�@2����!�CY-�2�V6�E�n|��m����$݉*3�\�7F�u�ףt8X�H�M�����ET�qbw*����U�<ŝ���t��4���Q�y�����S'_���D
"]ߌ1��x2��'2WF�����
�4�����,ؙ����X��s���j(�Bj��J� ���������e�%���x��l�=��!��y,�o�����"D�a�
#��kD�x:�S.l���������ll��s:͛���)�
�u�՞�,��*47��>������47)p����$k��;��p6	W�cžt|�2����0�uS�ƿ�z�������v<:}K!��]�,Hߞ���O3��0ǣx��c�f2�b��,��J����7`9�
A@c���[@P��Ë":�*[�G���h�R��k�LV+B�䌻��x�Bc!=�
���k���U~��k �Z �J՛���Xu��J�5㍍��*<��v��\��8��k[Ot!	���U�J��σp\�tF.`̄�\VX�},m��ҁU���@K؆�S@<��|Ѕ�m�<�Eu��[���I�%���b����E���"�$�+�x��k��`���B��nyaĄQ/^�;긧�
gZ9�נC��'�W#�~m��'�R���ޥT���W�<�:ދؤ/"9e��Kݥ�;���35�M����/}G��mK���c8��| k  �+g���������[����� ����Jy
��;㭏˔�������J����?�����z��k���9�i�v���FJ�A�a�T�~
��݊{^ ��Ю� ț! }=x� c��6>�J�L;U�H��F:��hv��TK�ru�:Es���p�Р5|��{²��[���L`'F�o�Ð�oB7�_7�;Ԗ��'����,���1ry迅�-�?�.3��p�OԵR�j½��-ǚ�p��h�ل���I�(�jfn��[�#��}r�
�3˔>m�#�?��6�����@�t E�*�)ݦ�E�T%_��֙��m ����a~�x 6�է�L|�v�A�f��A$pbt`��� ���7��:���ѳxÛ�_���o����|L`(���z"���]���Uh)��gq��J�Ng.�e�ͦ�E��䉄��U̢��7x�Og"I֏z�c���� ���`��&=��W�Ăa��8xMy�'7�]W�򤣜և�+����e7N<�ϔ[nbѪ:���WA�ol۾�.�^g?�t�7��t����n p(|���mld�X��v:Mx�{ń���0G��ٚ��#<��SX*.�h���v{Yn�|�<&���Ud��E�Ė�&�s�H���k}�ʈ������\p���������m�0,��3�ai��B4e�(�m�:;9^��gn���)R~7�p5��g2��T���De�\*�u��q+.���%-6Vx��Cʗ����xڼZ6�����.d�����p8u�/M�(p�N��B0�2*���OGbҊ��0������쯌��Б���z���%0�o;,�ďA�M/�����O�>�D�����rW�R،��0ݢf?�x�XnOl梶����b�� P5^���A�Mg��?\gg�FPbl�[�'��7L�El��6V��д���4��a��[�)>G�&�cG;�u�o��ۂOɴ���2<gc].Ϯ�/�+����]@��i�(#���qM��k������u�Q�M����:F�3�(0KB���3�H�u��s�!ǈ尫���4�\$���o�M�T'*�7\����. ���g$ƽ�e��Y�!�}�9ʦ��[*���/���R1��W�v2p���;���(>~���_b[.�����q�Ļǋ����oޟ<�����ugS�-8�=��]�M���Qp�	��9S���Y��eж�qx����<���F����r���q_�j F+���T�������j��Ҩizm��Z��M�/yՂ�l�ٜ���X!�r�dν�BB@0�잝MZ�X��,�,%����~���n���^�Jm�t
�<���m���֦5�;�ӌ�ex"re���^�Sz|9��4�0YznR�R��|���yL�X�)���/G�V��9�z���g�:uDM�k:�R��3��'���]?�b�y�!u�قOԡ0ޤc?z���h�����^�VkM廌7�7|]엯�t�5w[��&'sy��:'r������~�~��5ڋ��.�b4Ѝ�m"� %	|���W{H�΃q�6���r�j8RY2
쓉���J:�Po�٭�6�⋉^W�0��`,,<%+�@�|�����L����9Lm�j�w �B��&7�o��B̎����o�!n6����k�EEh�pB�������P�ۏ�ۡ?��U��>=���p���S�>��Z�w���u����4z|[ ��+驲2V�;P3����!�� 6t5#��۠M��������M�mls�f���Mpz��f}m+>�q�~��#�%N�#��^�H���"�כNG���NR�뉀�ȳ�tL���P��31����t�	x�/�p��g��3�������޷}�F�ǅ��6��9����+7��|�������@�     