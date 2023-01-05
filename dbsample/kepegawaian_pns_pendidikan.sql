PGDMP                          {            sisappra_db    14.6    14.6 	    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
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
            public          postgres    false    243            8          0    18956    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    243   8       @           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 1, false);
          public          postgres    false    244            �           2606    19525 8   kepegawaian_pns_pendidikan kepegawaian_pns_pendidikan_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT kepegawaian_pns_pendidikan_pk PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT kepegawaian_pns_pendidikan_pk;
       public            postgres    false    243            8      x��\[w�H�~��g�ꪒ�M2Hp��^�"�C��������g�*I��r�����8t�M}uٗo_J��|0�N�Y$�p��4���A:�H���G���	������;����w4��x�����Ao��<���;�?3��|q�9~����P�Z��y�ើ�O2Ioe�4!��0��<�yi?�9����/w ���lgy�Ut����ɗ8O�^��RN�1ٕ6Bqx,�4���q���wpI�����O����	))E����K硕'�<gDX�p0��gw��tC�<�f�b��[ċ��O�- ��p�F�K<�h'B���6+�fE�Kf������ߍ�emF�������Hv�`17$g>X��$�ƃ�b��n�@����!$�l{���t�G��s-��o\�X'/���`�'�8'��|�+�����OF~��Q�*)�����q�z���'��V���QB&�CA��c�k`i�"���� ���%^,�Q2O��#��]��0.��4��a5����|����w+(���ӆe cdV>�=ʦ�`�oUO�t�a4�e���O@�A�U��`��G�?�M�� \���_��J��l��گɸ|y=m��l����mzd���M ��s[����P�/%l�˒� 7=�wTށ})O������;��nכ��-d���$��d�� ��^�r?�Rfu�ɀ�;��[FY2&q�O��S�L��9Wֶ�,��7طr�{gcL4� �2�F_5����F#��������,;2"R 8��l�#�M)Y���RfD04����Jq��v��ڬ��'ĨܛT!�a�@5�?���;,�06y����R�VY7g�zb�R@������g�|.�z��溜<���)_�?�H��ɈⰄ�Ĩ ������7'g ��emn8��1c��/��E�~�1�L��.L~/���	��xS��	�@���J�Add�ip�1���k���4�f�mpF5���׺(�$��l�%#P2�b����h&G�eP�Ǐ��_������r)�jgeT�(j�S��p0�l��G�����"���|�Z�E`��})�y2��@�e����.�UzT���r������%����V!��q�����#M��ح*a��:<�f˕�aE(�����i{,������'�Ƀ��.�f�Ҧ���闇r�~�
8�u%UB��rS��H�eQEyH��6��uC
jjl�@�k \q}�F����	CCp�+��������m�^K�Ǥ�a� ;������q�6�8��x����(���}mG���U�	R��(�$g�R�]�]�7�Q�3w�� y"/��z�'iM+sSL�|6 >���S�U �I� ͙9���aG�_�$�!�_�5
���S�)��Q7���s2�ZF��~���<p�i%Ƅ��i�"*i��+{*�H�%�E����Q[�������]�F_*ex���������04��Ӽ4��Ȍ`�����,�1C����w��Y"�`�~�dI���y����H��cC�k ��6�q�OTm�6[���W�ּxlv�yUl:�KƣI��O'ވ1�M��w�6s@�;	B�A�m��2dg�����ʰ��8�����'��*�h�>�B�d�r�0!�����)M�x� ���$����6QU�<��W�i+Cu���E��n^y`>��Q��y�	�
H�L3����b�h��<�'n#��셲�bؽ@����`��M�r�~��U�d`�Q	|�W/�@P��A	+���4���
.��1)���o��`��CHt���l~zJGF������)D��ܕ?�]zv� ���i��{y8�d8���f��P�H�
��-C0	�e�
#o�>���6F������W�,�"U����Y���V���XH�k��f�ԫ�~doy�o����}�S�E��\^Zn�o��Ֆ���lv����m���2�	�	�q�ǉ�V��M�,��BZutФ+�rL�N�/��1=FZ��G���U�K��ߊ(���Eb��� } ��R ��4nr��q��d:�s�n��*	=�c'#I֟f0S�`hh@/k]ǔ�w.�VV,��ez�Z��������ӣ���F'q��r�Qy �4l::.XV��� �`]�]YxK<i0Α	����,���H�@�A;��>|xuDL�xX��I�T(�3�C�t4��rA�8Mp��b:I��-��4|$=�F�� ��2�'��>+�JY	�H���F:�h�X�2U�*!i1���4�J����ƇQMќ�B�3]� ��K\c<��@��u  |!w��WD���v�VV�2����s��y<�>&y�&��F)t#=U��gd�vM�	(��Wc����%�}�����{ݑ��V��|)���8,2P�/fi�o�����)o�@������z��<��$����w�u�L��|�����Rh@Ӳ��A�N�X���T�f�2ޏF�*{�N$1F���ѥV�)�@T�>@/z�$�1e�@�uPs"+ܦ��}vjw��h�j�t$�H")�l�NT�1��jݑ��Z���N������v�nκ S
��TۘBs	��/85]$@Pn��s�ȃuI�NH/2h.�1�<pj�C�5H��N�.i��A�
#vP~1����^��G϶M�@j�/t�:��	����I�C�ܙF�ց��� �ӑ1�����2B�R��.N�������se�A�� ��̰
����Sl���UB�+�rL@Eg��U7eēQ�K6�h� �B��p)�0��������9x�|0���J�[�I����s��^.��t��H�N5������4����fdf�^��Q�M��^"�>@PC)2I@2䎹
���>�dևX�M��|����p�F�tH�V�~�W��_|� ��3e���C����jGC��[���\��j�S��D������@V8Z�\�wT��l���n�8��O
ڼX$��_LH�������I�$SBP�.V�"s,��
jm�2��w��/�}<W�i�J�C\���	X�7�;N�. 5�]��A#�N﹕��D�
0�ѹ���̶Sy�#c�&-�@(1�61h�ܟ�������.�}��4�r�J�[:�+uw�06zS��WϘ#�.�SJX>�*�pY&612J��|��L�J�&�u��vxV���>�����ZÕ�^m�R�Ɂ��T�%ہl��&�)�2%��9�@��ZY��#�CJa���g�#kSk�8�&L�Lq�n��5��Z����<�����/�=4�r�ڙ��3���捪ƒl�u�"}N�	�� Mf�tе����6�*��ˀ�A/��6�_�*���:�m�K���+�ޯd�m]�mF�Dݴ������9%�qfh5Ϝ�9����}{�-暏2c#�8���l>�����t�/����-���������DUT�,�&�W?/~������oؒ	��n��gS����VD8w~���ׇm���~Ŭv��$9�����sU6>�6�"#6	ar6��~���( Z�@��R���5���S�p2>�]�P��ܛ��i�f�v�����GR�l��_ ������Jt8"n�у�G��*�lz=m�'�4� l��tn1��OYp��'i�B�_�zt ;��9:9�/K��=O����@(=Y��B*u{_��:g/V� ��$�P�q_'/�v���,��%��bh��d� ����1��U%.������<��ES�K�Qя�W3��Y�Z�%Z�F���b)#�8z�9��� o&�q+}����rʅ��$n�Q0�����6n��6��fEo�`��/��djQ,����P7�Dl#�f>�iLޏ�L�u�=�k�~�q_�.B.���"��V�bv�����3� ��G�1��*Lg�s,@�@�#-?��8f@�AU�a5��֫Z{� �  �@����iM��	�v~~S~/�K�l����.A������|*�`&o>������V?x��(zu��L��0�H�c�M��J�26Tlo�^���e�_�g� �s�( ���B5!�D?�6x�Y� �3�<1;�)k���_mCx3�V/�A�[F/.|��>�����)�N��8�T�&0\b�qS>������@tk���Tj����Rv���?:<f��b�_�o��x�m62G����F�+M�r�z�����s��D)�Qˏ(����e&�-�s^��kuW��H@U]mc��FW?����e����և�7��m/���bETUydޮ�5S�����r�'?q���%�dX��,I^�Ɗ����D��v��u�߀���vr��BD/j��|�x�|N�֕W`��n
�`3�HMS�ֆ�G-�4L�)��"upV�5M�d�w�a�E�������s���a�7��c�ӹK���qU�3��c���-�xs��S��6�-����am%?��f;�V*#`�T鳢!y��q��!��v�'�;�*�a;����_��G�I��A��lS���b���E�s�[���nj `��5>���ۿ������[�g��Y[Mp�Y�
�E�E؎U�����J^���83�.p�ʅ��V
���U��?p��n݆� ��d�leۙ~����]G��'�I���C2�m�bO*Dy��Iꗨm�]ff9og�M�ϱ�	�R���U��H<�S�
:S��L CG��D�f�}I��U�00A�k�C!@]�G���*�Ɔ�3 ��r\eZ ���M��.9���q��=����(�?�Q��%к��r��E^��b<�m�Q���5<���ڹ%!t �R��s�=�~���W?�A����FǪ�>�/�s;�|p?�ˊ"��ؽ�*��v�^f�0�J��<�m����1n��)1�
6H�~��5��t8�4�}쎊�ɏHkEG����j@E�9-��p|�� T�(P�X�8CS~:��猴�cP_��*z�4p�E��t�8�b�ㅵ�νOv>�JR���`A��+Z��M�<���[U)kJӠ�0����������?u(�!��~1Ƈɘʹ�^)��k~)-�B�/�}�X���--�MC0����h��� Bs�\a���jo�[D[q�Ȇ��ϵ��`�����	�% �M�[�\��JPw��NK�Mf�fu$@�g�#��"�!��M�B��Mk[c�~2?�w?�Viu��įwc�PFUal.N���8x�dq��
�˫���_!�ˇ��OG�"�y�ǀM�Z�w���aEI���<>}���䩆��46�4�c���_�y��+)��~��Gvxqe���ډ���Kw��u�ֆ�ꪨs����ҙ�������=�ڂ�0���8�vR�!1��贁�۾�[YbWտ|���Zڌ�4�!�Yis˾�'����S�$��l��E����J�5-�7@�Ƣ�/�{L!���W ́6\U�X��Aw�
/
�ڗ�������~��.<g��J��7�S��ҋ$8@Z��*AdWu���c��w�	�Eu�	�[�=����'��0v�a�sE�Q8��"�s�0nA���B�ܴ��J��]$7,��v$���x4Gkq�����]e4������7ݍu�\�x\/K�1W�����K���+௹�+q�-!U� {\e�QH�ئ��9V���H&z�mI��6n����PA��6�d����g��Do�mQ|�E��d��J62s|�K  4}J�~��,���盆�-E�=7wT27����ۛ;��(���wL�����vD���9�E�?��f���:����I��v���˽��js�������� ��4����L,�.Ox7�uR��	�F��g$�B��E��c>ۏ���q����|1���u+��@׿�g��<��;�0�]_{X���M��̺�R���.�uͦEgʲuM�������ZU �P&*D�3tk���y&�E,aB��z���M6c��}�U�x_�E7�[Yl�Gzyrn;��%��s�`w@�^O�՞��%�)�d{8���#ɏ��e�� Z۰�CUWFl�J۶�N��N��-dӍ��Y_ �+�7�/h��nF����-�HpZ�.�v;���N��Ed�     