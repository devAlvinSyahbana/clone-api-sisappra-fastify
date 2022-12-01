PGDMP         $                z            sisappra_db    14.6    14.6     :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    18816    sisappra_db    DATABASE     k   CREATE DATABASE sisappra_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE sisappra_db;
                postgres    false            U           1259    19381    master_kelurahan    TABLE     �  CREATE TABLE public.master_kelurahan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    kode_kecamatan character varying
);
 $   DROP TABLE public.master_kelurahan;
       public         heap    postgres    false            V           1259    19388    master_kelurahan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kelurahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    341            6          0    19381    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kecamatan) FROM stdin;
    public          postgres    false    341   S	       >           0    0    master_kelurahan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 1, false);
          public          postgres    false    342            6   �  x��[�n��\7��?����Ξ���1v�M6�!ӒHA1���:���nX@6�Jdw�yt&�[�m�����!1���?�������I�$��ֿo���~K"k��m�4z�Z��;w|mςK	\f�׾�;9Ag:7O͵��g���|N����՝��]����]����m")W�ب2�@���p�|��}m�V�5L6���s��[.��`I̓��s|�΃���hk�5Ǔۻ�^si��_6`��E����M8�.~���z� e�_�p���������������<7���^|�V�y8�W����tm �.~r�����5�Fvcn�{��ޮ�]���a��^s@ZsvGwU�z����_�5��]�/@39&ͫ�\�^Y���ܮ��������pm�䈅�^/�<�����6l��@S�
�e�el�t�1ήX�s�wr2���t�ȀN¡~n����+pk���p�^j���K;<��yɤ��tfn�n�����W{Iy���(��]s�}6K��HD2w<IP�uݲt�ހ/%�5��wi�ۯW�1��ᬦ��|���L���\e�)P!�g�5t�:��X�^mU�Y�[d�l���N�]�c����>3/�sPS�e��|.��H����֋��2�i�/��5x�-{w;w;�^o W #��[9o
_/7�k�tZ��z��Q�	:�ņy��땖l�\j��ԀZ��D� �E�n���R!�6��f7��'�d#�w�+�����E��"��s���P� ���(���E����c�W[���2n�{�z�	���ۺ���i��@Sl�4s�Dh$�yv��)
B ��`�}B}��()m����+�٨@ӊ��"mA����y@U�XBq��G��#�t	�Ss���P��`*B� �qb���a��٨ܘ��g����Z��讴�^�$��$��$TdY���ܶ�
i|BYTf_x��!��|Qf�=�R��t�n������̣�\��/C�$���B.QJ@��/"Ih3�*I�['�D�B|�wi��"�
�$D�!$���(��ܝ��?"!�"�R��:�.�Ǌ�$��A���S1���i�"���Ӕ*B��)�KeUE����Ӿc���2��BCm��֗$��2�E�n7��hMh4��a?��	�j������5PA
��[��43Om'a�7�5!>�E|���9�MԄ� W���J���L��&4VEu�u�sRA�	��Q2�������6\_^�Hq$3�C�����&D�pw.���'����<�Cz��|�:'�'�國�w������5����R�24��͹qOA�0ٌI�9�G dX?^�|o�>�ʟ�Dso���� L%IF��@$���v��B�V��Z���>ad(M6�,^����z���������n�/�u�ǮW�bK-J�SKGC	�O�����]���!�	�p	ai�Eht��<Ԅ�5lx�N�ܢ]���2@�h���')v��K�YL���4b~��ٽy�z-*<7χ��S�(�0��ݸ�ś,e#^}��i	9
O��Y,"!Ka��#B�0G�!B�nF��9GD)�,]�e�. ,�[s;�۫��~K	cĊ�Nמ�1&�%�B�zv_cB��<OhS��h�� 8zB�޼6׹�N�D��0u�	�(C-&�u�̢$���~���pL�$	$�!pzB�Bb=���,4������$٤����RNE)�0����� d)��E��HHR𥹕~(�Pj��慜%M�)J�P�bl�O2�1�o�]�\|��T�ʥ���I�%�t��S�
+ծ���YZ��b��Z��1�>��Z�AǴ�nk�kQ��L�}�&��(Ԥ�YH�0]���8�IhT8d�a7��%��(ZfP��	M�QRl�ߧ�EX/J��$s@�/JaU:�?����<�:�,�J�x.B�B�R���>�B����p�󉛅F�4}qQ�67����j����s��/�KVh*�������·Q�z\��ބ0o��܌�1�-��X��e2�Ƃ����01���P��ѱX�g �)���W�	�F�~�u׏ua�(t�J	�F��h���0g�@���8I3
�e�}��Mh�J������	K&E7_%�	/��o9a�(�^�5��W��H���i.�pe.��(��ͨQ�\7�=LB%��p��;qd|�#\��{Uj�@(�hb�U�ʞ�ۻ�%�=1�*��3T��JB�1�Qo�~9~�J�;Q�d���H4ʁλ�8�9 ܙ}{-�i+��-H�pi�B�x���B6J�/��\@7JS��û;zeލ�eN�c�V+4Z������8��l�G9j�Z�$E�@�8�`�ɑ{��pin��������Xl�%���iW-a�(�L������N��i�䡄,�+�k�Jo1=�Ja)��t����r��yV��u���RA�K�q!	i
��6��!ȁ��L�o�Cܗk�_�pu�	"�V6���I
����}�O�f�U��+�,r�k��f*��3�e>Z�|�Fg-�劐��R�~� �|�"$c�)��' +�ȥ�;�j��b0�F���o�'�F(��4�k	�G��N$�Q]��x�vo?��A=���)��2dF��]�yB��͔{�'-����u�1J&���b7�~�p����Ma�(����ч�&�t*b��-��(��b����v��<!=!H�A��0nhQ,a�(ErU3�|��Q���/V�����仏��?�0s���&ڄ6l(!���!]F����\&Q��zK�9mF�q��V�2$�M��Y�%���#��I�%�H'��^��0,2�"+�N�Kn�B�9�O�}�r����R��@���S	Jl�ޅ�>K8;��^��:,�z}*�\���!RvN�D6�[����5K89�N�=�?͘�	7Gi,t=���O.#Bi|=��UЙ�7�!,�FT��.½Ql�o�w{w�xB}�כ �[	�F�y^����-��(��н&�p�����o a�(I"֬$�a�P+9�q���s�Cg]��cW	F)�@�a/	�FI�$$����"��SwKX3JQ����D����e���(��U�e�     