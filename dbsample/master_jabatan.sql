PGDMP     
    #    	             {         
   dbsisappra    12.8    12.8     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    69027 
   dbsisappra    DATABASE     �   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    69127 	   m_jabatan    TABLE     \   CREATE TABLE public.m_jabatan (
    id integer NOT NULL,
    deskripsi character varying
);
    DROP TABLE public.m_jabatan;
       public         heap    postgres    false            �            1259    69133    m_jabatan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_jabatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.m_jabatan_id_seq;
       public          postgres    false    226                       0    0    m_jabatan_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.m_jabatan_id_seq OWNED BY public.m_jabatan.id;
          public          postgres    false    227            y           2604    69769    m_jabatan id    DEFAULT     l   ALTER TABLE ONLY public.m_jabatan ALTER COLUMN id SET DEFAULT nextval('public.m_jabatan_id_seq'::regclass);
 ;   ALTER TABLE public.m_jabatan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            �          0    69127 	   m_jabatan 
   TABLE DATA           2   COPY public.m_jabatan (id, deskripsi) FROM stdin;
    public          postgres    false    226   }
                  0    0    m_jabatan_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_jabatan_id_seq', 512, true);
          public          postgres    false    227            {           2606    69857    m_jabatan m_jabatan_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.m_jabatan
    ADD CONSTRAINT m_jabatan_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.m_jabatan DROP CONSTRAINT m_jabatan_pk;
       public            postgres    false    226            �      x��]ђ������\�Vm�	�����0i	)��U��ϱ��@�$<���?�!
�%Y�'ɐ��ˇo|���m��#9�Ur��������u�$"��ӗuW>}W����}S�����|���n��6��e��!�SR�mw����v��=Н��W?=��~�p;�]r��>����W���y��Kٴ���?}�Ϸ�^����\�'�]�WU�ǃ}Mu8M=����[�����/0�[f0])�0o�n��?o9~���Ҍ��"X.;������~Z���j����8�����L;�ER��.RÍ��㝪3��@�k�{u?��Cj��!T�Ç��H������(`�Z��!���l��>y��=h���q<N��x�"�җ��Y,����U6+���|í�	�ō������-�&������$��������U�LK'́�%}������q��������@('�ëtY$G��b�>�Wz���{�ʬ$5]$�rn4K���G�N.�U�%L�_�����>2���sP�m4T�OX���۴��B��N����C(0�0Q������^	h"����y�ͭn���>�%�su���nh��η��t܍����գ�o�6}�[��9~.��I�!L�)`�>�@�����p��泼=�33����|W����:ܻp~��&�n":�,���i&��`8K5���o�po�+>
���3ޜ0�<���`D�+�!�1d�>����	�e�2��~rk����;N��8��q�v���g[C�49�%�鷬����o6�p���i,��X���S������wh0^8�����5�Z��ۦ���%q���>SИ<��Y��p��'����B�9�}�&�	�k���*��_5��&�Txp�%;]�5Pڐ�]�pyp�v��`�q3��X�H�fY0�tkb�/4a&�|�A-��S�
�6��
��u(@�-|3��3ӂ2ӲF1�_HD0X{m�{bpz<J�`�-�"N��D�U��i��"����J�=>��BQ�=����T�&�1�O���#���(� ~~�@�0���E}ԣ?��_�=���(=� ��..�e�~D8	;��&d�NfQ� .~} ��4 6A�)a���saC��d�mߢm��.����@���)bVة�_k&jbx�ݯ�E|a4R�IÙ�6z���)��A���,Wh�ZQ���(�Q1�?A����lG���$������h����%���I����;H�D�׸O?�J�3���O�Q�V��+m��n4��u�T��
�+p�Eɏ�7�:���� [�V��U��	q���WH,j�T�!�w���jR%���Gw�������7��T��\����J0�쌼W���Y�pqQ9]�>h�F� n��]������@S#nr��⸗s�6�����9���:4�\� ���z1!���g�^��׮���:d��)T��g����7�ɗ�� �N�ڠ���G/	���:��X�6?+�K���f�h�v���G�-�&ˤ�]�Hˤ�#/C���4jK�~I�I���BWi,>M9�*ޜ������qd�����N����ŎY�2��"қ � j9�y`�����a"W0�PRJ�(�^���`��}�;#�ky�W�%��>��pE���c�_��N��z�����u	����X	2ˎ1rώ�ώ��	~�2Q[�#��	�XT������$�o��d <�z�6p[
?�].-Љ��G�X�����+���f,���6V����e2n��E��mv��e<�@ƾ�~�����w5��^T���/��Y��L�B�j!�B?�?��_��㉚*DX�{{���n�2�N����d|��AF@&¯���`#4~m����K����eJ��e��2+Q����6@$'F_�΢�A��~R	�ٸt�Ѣ2.ʹ��K3�e�3�)����4�y\��iV=��ؖ^��43G:.�ؒkF�\3��Q�c��Z��f�o�Sl���t��c:ı�q1�1,�|�*��@�Z=��^D��"l%IC��+����1��C)�R�@��P��k@f�qB�0vo
��9�_���ז�T�G� U`9$�YN�#'@�I�
�T$����(�rR��:�vy��`�	{qLd���O��\R�����¦G \I�N��a����J��k�x�F�łM�8����D�~��q��}ٕ�x'�+C:H8I_�Ex*ѵ����3�J@�;�i*�,�Y��ISgޏ#Il
�ݵ�4ـ���W&��!=�E��LD��N�����#��˕XW�iψ�
N�S�p,c�#/SPN�Ha���k��PO `]�K��ș��?��[�]�*��%T1�u����U7ԑ�*l6��R�U)'�q�� hxѮ&�r�EXpn��W)'���'�)g���r�b��<��Q,qysþ" �Is�TJs)��Ue����Y����XI�!F��w�NƊ��`�'�e�/ݰ��>4���]xz),�\��Wa%�L�r�JYqR~q�p�8q����r'�l�k�ea�'�pB��4�[����+kؐϰ=�@%k%�Z��֜��rnfz�Qs��4�yrݚ��@�$�l�4kИ҄�J'I_j]�>IP�F��J�x����hP��0� ����Fd@��T7��p!|C�?e�=�nTo�O�-c���s�)T���W�U�J�A�Ŭ�\�i+��V�b�>�0!Q%.Ǹ��`6r��4��3�@)�y��e�+ ! 3K��F�0?�� ���3�A
#�UV�4�峂`�s�1Ude�*����[Qk6De@����D{=v �~����x���c�I9��e�������d7�p�NL���~S\�b���o?6R?Fs1	W处�r\FO9Q+�m\Sn���3�%�D?�'D�M�6$��ˡ�
'o�S	Ղ��<�����b���)��s�[�{Mq�٥A^�ɦ�\�m�!��1?&�Q!z�Gxdv~��< ��A��2����Q1D�}��r]����m=��Xv_o�O���+������i�����&��΢���U��4RGa��i��RQG)�#�dz�v�"�5#�3�\;�W˵S쓿��i�t���?�h�_xlG>H#��J�@�m������NG��R˻��%�����t1�_���V:�r��e/���u��E��$9��x�L��TTG��:4C��>�}��쵊)|h%>4�Tn^��[������{��XbgQE���t������a9��«y��˰��(w�Y��G��E����,]|Ķ��e<�+ߓ��8@,*�����������<4-�����NcD���n�n$^��z��o�6J!bV�gY�^���ex�y�{�O�2�X~1ma��� W��!��S�� X$BgQS���{A���X��OCi�D���S��(�m��Cm�'hK�3��Nb.��{��!�$��&a��$Ld��[�U�-�0,ݜj%�4�^@�3�	�b2�I�؇Нë���+��;���Y�	�kCcb�w�hL/�/#�;.�H���/7k2榁4&��)��.��9�F^|�F�(�G�2��;�y���d �wħ�t ��K�4�E#42����xa (cֆ9Jkð=�F�)�O� H��Zοz<�_����������2���od쌖���;'��;����N��7���م����s���G���DAh#Bh�Bh�s���QKx�5�$�^F�_c7����y�X&;n����3�o'4�MY�P�R��瘻�`C ʘ�#�5�![��p�<��p6	#7UW�k6;�<��j'$��rDc���8d���Ɔm06r�����]��[0�|���_\b�ЌE#��Q@22R�h�}��Xy���{<Lid���r4~2�*����O��FX���J�*Λ{�Zz#��Nɗ�؈�O�� {ϸ��'m�f�d\�2��HÙ#��Ѻ}�]cJ���C�%!��/�YD�ŊZ��0l��{� n?`k>�j�c��.Nw�ܰ b  K� �~�h%?�H���'#.���}1�Y*��Lrv��+fO��K�K�2E~r{"܎�]�~GQ�5P���������6�!+o'��Ef�6+n(���\�^q!Ƕ��ă��cǚ`ir1��	 �(�f8��5��������O W�m�_��b�fw0. a9D�P<|�9�����!��Ӗ~���(,��X*g�T.c����sI��Ӄj�Xƶ�8����;���*��Y,3|��c�`N�a�%���h��Y��@NC��\ak�ӽLP!���d �{�1�5���C���`�4��5����2�9 %|��vXh~�.>������������U4�F��п�c/ኔvɳ��ד�9�\<1�#f�mq �R���3ˉ��߻]�P�$���K��4����ρ]��D������.����%�lB�p�a�C �Oo������S��+�o��l�S�Ӏ�{ot��[�f5���+SS�|'1�}V�	��O�1�x	2J�%i���6AFI� ��N��-���>AFi� ����u��׿�PQyT�WrJ)����CJi�!�4ÐR�aH)Ѥ��CJi�!�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז�ז��V��"^[E���xm��*�U�k���V��"Z[��-{�֖=Fk���e��ڲ�hm�c���1Z[��-{��V��4^[i���xm���!��k��P�ͅ츽�n/d�j{Ao/��|{�n/l9Ͷ��-�j˩�r��TVm9U[NՖSoD�6�`x��6��K�P�/�g�k��rVg��&:m,�,���[C=��m2�:�f�Xd�4~jF�i5K���jF��u��R�p�95���QN͈z�ͩ�ԌrjF95#�
����fD5Y�	����fD�wYK��R3rԌ��,�9jF����F�9jF���[P3*�Ԍ�؂�QAͨ��/�]D�P�#0y����A'&��x����L��ȫ��1���c�U��pg�z�|���R�%�����=�v���}��q��.�_�Sfpc2����۬���䲃����1_����SiUL۠SQSW1��\TK��z꺋z���:*�T����d���[���,o���s��l7���s���7����l�yß��g6�Qa��[B�Bh"vo�;�1�nf������mG�@�œn��,�n#-��.0�Lm�y?}��_ž ���z����������]�ݏx�'������rJ�v`��͇�o�tV&��}�a�����,����E�'�
�!��Bێ�;��ɽ:˽y�J('K̐Տ���Ϧ��l��Ϧ��l��BdG�Ȏ
��������c�     