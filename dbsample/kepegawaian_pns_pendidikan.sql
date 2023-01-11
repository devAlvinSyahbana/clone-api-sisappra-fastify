PGDMP     #    7                 {            sisappra_db    14.6    14.6 	    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    243   9       A           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 202, true);
          public          postgres    false    244            �           2606    19525 8   kepegawaian_pns_pendidikan kepegawaian_pns_pendidikan_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT kepegawaian_pns_pendidikan_pk PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT kepegawaian_pns_pendidikan_pk;
       public            postgres    false    243            9      x��\[w�H�~��g��^Ҽ�@@�Bq�k^�1�l��r�z~�ٻJ'�\��u:cS_]��ۗ� ��wɈ,��p��,�$��l0!i����S&h��|#��L�/7��Pd�0�����,�?$y2��w�N�/��)��)N�A�?h�����s9��.+�5�f)�M��8��	�˄�8�Y��`$|��  �d\L�$O��~��>����<�l���iB�%��P��ű���0����.��Ȁ��bv6z?��c%��V�o��Z"ȳ����� �ɍ�$[j���)�4�"!�"Ǔ�CӀ6�S�h|�G�H�022vEܮ��,	&����w#1��F&�)='����n�`17$g>X$�4ƃ�b��n �d'�qI9[$ABY6�c�޹��7NӨ�����`���$'��|�+��<�b����(`���7\V	FŸ���h�Q'ϓ�QJ����i�7 �,6EP/�cZ�c��d�HF�<���Rv��¸`"���GՔ�kN�$#�O�[A��:8mX�d��ʧU@�4ٖ����Z�d̘���lB��a�~
J/i����?���nZ��B���Z:(�@&˧�nE����q�Df�M@l����m0u#�߂���)a�_)ո鑼���Ky<l_�����a�u�Z��p�P���O'I��2d=ثb�ܟt)s�Ϥf����n��$���S�)��k�\��D�m��'�r����l_��Xͅ ;������W�%���F#K�����a��tlE� p0?�!�8Fd4�,b1G�K��ȚRN+�ɷ���r�|&��roRE�F�y�,����@�`����ɫ��Ɨr��p�ʸ=C���wؓ�qw|&���k0H?��a��'��=*���	w8�8,!;2*@�"���B���@[���5�f��%X���O8�	�aՙ��%3�!8A�sb�L�4(���	����u�YYb�#Cg��Zn�9�����j�s�EA���b:N�(X1�F�(c�E�<��Eq?�
~��Fʥ�e��U=_��YN}"��Pe{=���`N��<�L��� c�(��P�%�Iq~��: T�Q�+_���?JTj���T���R4iDG���F�6045&fת����-W����'���Pn�+���N��3k.�f�ܦ������r����\u���*��m�.w{$貨�<�m��k��!�; P�W\����82~��\�~}��{"�j[�˗��1)`��Μ#h-�>.S�#��k���]�CFY7a��k;��f�v����|�H���Gi 9��7���q�F�:�a�{���yY�WO8IkX����g�����:�^ij��A�3�TY�dG�3_���>�+�Lk8!��vDq�F]��k��x�+�j=��BP�����X�g����m��|D��(�-ڼ���۲��=p�	)�9����j*et��������-��4���<4��Ȏ�1GB|�e�&�!�X���;��,����I?K'i��'y�����ظcMW@4���������2c�l��-��y��h�<����&�}�8�F�iti�Ͼ{��S��%�Z�ڎOG2b'���ʲ��$���{�����U�Y,Т'0|��,n�6��aBP�O  z�S*��� /@o�/	I-��I%l������W�j+#e:�WN�,����'7�0XϨ	�޼�Y�$�(�Ō)o���%Z�4O�;��em�"�h1�Vm-�%#اfӜ�Ga����,��._^��TɃV$�i�������1)���o��`�^CH��TV6?>�##`X���#xS�t���p6;��A���ӆ��r(�p<��I͖/%�>�,#X[6�E�˸6���jح���Wv~|,��_X���T�w���������,w�աܓ���X��WE���
�߬���IHU��Sy@Y�)�-_����`��n�/+�ujV9e��! ��#�-�v[��XJQ����MW��,�P�Ͻ��0=AZ�����U�K��_�(���Eb���"} ۯR ��4nYr��u��tz7���� �Ez<�"΄���t2 3�����uL	�"�oe���Pfǯ��K����uq|py���DZ��T�O�
,�u�n�<tt\��dB��P�#�u1ne�5��8E& $y��;#)��t;��?|tqD̐dX��K�T(�2�������:�4�i'��]
6mAn���#��4�^�Iŗqr���Q���P]E�7�c��]ƣjbA�$+擔0;��`��3�F\S4���D�>�s���O"&P{k�y  _�=8������1�]f�{���j�8��`����i���I\���n�{��w]�m����uK��[�ʧ��{��0�dX̲��z��qR����n��Ǘ�]X�_����/G�o���<�v̶ϫ�O% U���,긝�p(����:�e�/�R�B+��Cʊ��`a���X��kts�Y�+s:
��蚴8�%VfO^'Vu�6�W��\��8��(�*i�2`	wf农�?�ȉ� ��.��MKY7��2���Ө+m9�)�g���ױ��Y��F�:��Dų�	��3
Ka4��S���,�;�񎷃�U.ܠ�l�3����<���k�Z瓳�:gJw�: �`Rr_>nm���u���ƥ�m�t��"gr����0�4�������f2��dVj� 4@�\�1������Xv"}���J��Z�$PP��WA�]��(�%�u5�S%U	[Y�U�uVTYN$Z�\Z>�K�J�[�I���h��^>Z{�S�P��M���i!L=ˣ�T`�S&�q/#��"��̀�KC���:(E�H�}1_�vX�H����@ra(8�ϟ@�����ز@X	�%�o�/�2���ĩ�yz�bz�6���Pq�S���~^���Q�X�����ؤG������KѺ�E7A<w��ai&m^,�Q�/�H�e@���di�f;"PL�U��c�F]0�Z� ��7�$,nC<WL:�J�#\�ң)X�7�{N���w�]�Ac�ο���xԉ[%Zf�S��(�sm�#cF%+�Pb��l��~�; �X��օ]\���Y��!�2tt�W���a,l��Ԕ/�1�sY�C#����Ӵ��L�e�Qz�@�]d"R�7�gA��*�\ܦNUsPUg����#�7IJ_��_��c��k2�ۄ;R�$5W�B��bV5�U���C\vu���Ț�T���	��-S���۳�̢����.����4��x������{vx}�bf�q1������c2�&f�9e��_w���I}\���.����h [py�V�֔f��0z,��ǴQ@ .5H��,A{��V�!�ū�"0$�fE�>xf�N9#���CC��{���g�K~�ٷ�o�Ȏ���r?���#��spr�A��ΦA�<����6�WQ=��mT�~^�����;�ĉ��j��e��M!�K��Zap��"71ޭ��������e ����N�3�U���� ���$��A��C��w����*�(5y��"�U�TN&d��*�[���]���N����^���&�F��P�!�`�.*�D�#�����ց��yf���qM>�0�����.ҹ�dK�[�/R�$+wO���V��R�S����s@����>~�d�����`-�R�7>9�S�b�RJz@�%�e�B�� �'���l(I�C��&���L��LW�2}�*��<�ES�� K�Q�O��2��Y�T�5T�N���j&#�8z�9�˥ o6�q-}s����ș'��]�*t`6LKw2hTں-Pǟ���?��;�W�XQ�N@�ł`.8K-���$"`���l�~��f*�s��9\��S�bv1r!eg���g�ke�u�ī<���i�0��p� �a��� s��U9��ʫ�6�@��4��<=��
=a��ϯ���sI���v �  �ܯJP@&�}-��"�
3��Oo\v������h�^�6��s��d�NH�cL��j�R����[��5x���wó7�8Ҥ7�aW�6�����!�&���������´eנ�6�W���a���e���"���L���?�s�x�8US��.�W�60|�<�|^9��߁����ש�.�y7��x�D����m抑��������]d�F���W�^W�f���ťz�?����BSǏ(����e&jL�T!��Z�v& PUۙ�X���O�9!s�F��!6���;�Mz6C׬�b�X���<2oWᚩ��ߎ�c����x��5�2,�~�$/;kEq^�c"Ym�:��ܭA��;@;�ݠ���E�3܃o��iк�
�62M�l������ڰ�h ��L���[�"�pV�3M�t�w>�2�M��+h�ݧ����no�9���g�s�&E7��$g&��!|w3[�����4�]�)*ZFm/���J~,��n�'޽NV����O��@���K2�������M��n�ȇ�@�7b||�"�V�%Az��
��۔�c�% �`��o6�m����]O7�ow/�a�.�ֻ=�6`5em5�YO�Up,b#�v��������E)>O&6�N�B�(���R�'�7��?���L�R> �(1��l;3o������	ّ�Mc����`[&I���PF�d��%j[!��Y��`�s,eB���s�:L�P��?�K2�
:S��I C��D�fՅF��]�H� ͷ�! ԅ�8�Ȯml�_����K!�U�Gܑ�~�����h��������	*~���Z�����ѡȳ�u^����*�}�''�9Q;�$�Q�)u�G�s?�'}L�S�5���<�.vx]���n���v��	E62'���Ul���m�`̅.��y��"O?A�c�"1[bl�|���k*���pz����;*�?"����j����s����28>�n�m�e,x��-?���sF��Q��0����4\@l�G�6C|]?��X�dᬵw����2X|�6s�z�$�B�VU
ƚ�4(!a#�&��ƃ�O�dH��qX��i/�r�e
��|�/��XL׷�>c,s|ٔ�ߦ�|sj��4��� �������i����-���}�B�����d1TS�z������v��oW�E�u�L�����,Y/����x���T���Z����7mִ�5�r&Sw93]�Vף����n����
cs�!OG���F �SoVdq^^�_O���
ɜ?��v:J�����>��6��{^�`|��a��y|<ڱ!�S3�jl~nJ�Ϳ8�.9WR���~������2����Y����K�
c,�5UQ�.�@�E�3�?�/$���˯;��aNI�q���C:b#��qA�{}��*�ժ������˘M1�������,~�R���&�dd��,B����UR�i���4Xy�a�>l�i��6pUc�݃���M(G��*�m���]x�@�<�o��*� �� Y�Bd��[�d�׾��2�޻��M'�xV�Y'<o5�0�#��=~�ě���u؁��\Q�sT��s~7�?7PH���!�\�X���e�؎$�����h�b.��������]_�q𶻱�K���v�U%�l�	2*B��4���x�#~�%F�j��Ꭻ�,2���v�3�*��Do�)�x�����*�p������~��>;xM$z�o[���O-R�sO>r��S�J5}J�~��,�᧖竆�-E�=7wT27�g�������n����;���}��N;�U^ߞ������{�����!��y�\����y�>춛��a�r��H`q�ee'�n�xy�wR��!������B�p�1���s/�i�8����\X�b�t�{���S�ｓ�bs��6v�Iq5�V�u��H�5]�M�O�e��Û,>= ���@��IT�8�'��41\]��̳2X6b�Z{�$��l��k��g�H�B=��n�r(�
>/�����v^=��������!GS��fX��V��*���Xװ�#UWF\�J۶̎�^��dӍ��Y_ �K�7�O����>��h�XT�tj�E�Ӫu����aY#��=u|���p����'~����v:���d�     