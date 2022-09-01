PGDMP     1                    z         
   dbsisappra    14.5    14.5 U    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16760 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    16930 
   auth_token    TABLE       CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    token character varying NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.auth_token;
       public         heap    postgres    false            �            1259    16936    auth_token_id_seq    SEQUENCE     �   ALTER TABLE public.auth_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    16945    dashboard_kepegawaian    TABLE     B  CREATE TABLE public.dashboard_kepegawaian (
    id_pegawai integer NOT NULL,
    status_kepegawaian character varying,
    pendidikan_terakhir character varying,
    golongan character varying,
    eselon character varying,
    usia integer,
    status_ppns character varying,
    is_deleted integer DEFAULT 0 NOT NULL
);
 )   DROP TABLE public.dashboard_kepegawaian;
       public         heap    postgres    false            �            1259    16951 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE     �   ALTER TABLE public.dashboard_kepegawaian ALTER COLUMN id_pegawai ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_kepegawaian_baru_id_pegawai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    16937    jenis_sarana_prasarana    TABLE     d  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            �            1259    16970    kondisi_sarana_prasarana    TABLE     h  CREATE TABLE public.kondisi_sarana_prasarana (
    id integer NOT NULL,
    kondisi_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 ,   DROP TABLE public.kondisi_sarana_prasarana;
       public         heap    postgres    false            �            1259    16880    master_agama    TABLE     �  CREATE TABLE public.master_agama (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
     DROP TABLE public.master_agama;
       public         heap    postgres    false            �            1259    16879    master_agama_id_seq    SEQUENCE     �   ALTER TABLE public.master_agama ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_agama_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16826    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 !   DROP TABLE public.master_eselon;
       public         heap    postgres    false            �            1259    16862    master_golongan    TABLE     �  CREATE TABLE public.master_golongan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 #   DROP TABLE public.master_golongan;
       public         heap    postgres    false            �            1259    16861    master_golongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_golongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_golongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16795    master_jabatan    TABLE     �  CREATE TABLE public.master_jabatan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 "   DROP TABLE public.master_jabatan;
       public         heap    postgres    false            �            1259    16794    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    16911    master_kecamatan    TABLE     �  CREATE TABLE public.master_kecamatan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 $   DROP TABLE public.master_kecamatan;
       public         heap    postgres    false            �            1259    16910    master_kecamatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kecamatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    16921    master_kelurahan    TABLE     �  CREATE TABLE public.master_kelurahan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 $   DROP TABLE public.master_kelurahan;
       public         heap    postgres    false            �            1259    16920    master_kelurahan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kelurahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    16900    master_kota    TABLE     �  CREATE TABLE public.master_kota (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
    DROP TABLE public.master_kota;
       public         heap    postgres    false            �            1259    16899    master_kota_id_seq    SEQUENCE     �   ALTER TABLE public.master_kota ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16890    master_pangkat    TABLE     �  CREATE TABLE public.master_pangkat (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 "   DROP TABLE public.master_pangkat;
       public         heap    postgres    false            �            1259    16889    master_pangkat_id_seq    SEQUENCE     �   ALTER TABLE public.master_pangkat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pangkat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16852    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 %   DROP TABLE public.master_pendidikan;
       public         heap    postgres    false            �            1259    16851    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16806    master_tempat_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_pelaksanaan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 -   DROP TABLE public.master_tempat_pelaksanaan;
       public         heap    postgres    false            �            1259    16825 "   master_tempat_pelaksanaan_1_id_seq    SEQUENCE     �   ALTER TABLE public.master_eselon ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16805     master_tempat_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16816    master_tempat_seksi_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_seksi_pelaksanaan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 3   DROP TABLE public.master_tempat_seksi_pelaksanaan;
       public         heap    postgres    false            �            1259    16815 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_seksi_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_seksi_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16785    pengguna    TABLE     K  CREATE TABLE public.pengguna (
    id integer NOT NULL,
    id_pegawai character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    kata_sandi character varying NOT NULL,
    email character varying NOT NULL,
    hak_akses integer NOT NULL,
    status_pengguna integer DEFAULT 0 NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false            �            1259    16793    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    16962    sarana_prasarana    TABLE       CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer NOT NULL,
    status_sarana_prasarana integer NOT NULL,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    updated_at timestamp without time zone,
    updated_by integer
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false            �            1259    16969    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    16954    status_sarana_prasarana    TABLE     f  CREATE TABLE public.status_sarana_prasarana (
    id integer NOT NULL,
    status_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 +   DROP TABLE public.status_sarana_prasarana;
       public         heap    postgres    false            �          0    16930 
   auth_token 
   TABLE DATA           R   COPY public.auth_token (id, id_pegawai, no_pegawai, token, create_at) FROM stdin;
    public          postgres    false    233   O|       �          0    16945    dashboard_kepegawaian 
   TABLE DATA           �   COPY public.dashboard_kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, usia, status_ppns, is_deleted) FROM stdin;
    public          postgres    false    236   �       �          0    16937    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    235   ��       �          0    16970    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    241   ��       �          0    16880    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    224   ��       �          0    16826    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    218   K�       �          0    16862    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    222   ��       �          0    16795    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    212   i�       �          0    16911    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    230   ��       �          0    16921    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    232   E�       �          0    16900    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    228   ��       �          0    16890    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    226   ��       �          0    16852    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    220   [�       �          0    16806    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    214   ��       �          0    16816    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    216   U�       �          0    16785    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    209   �      �          0    16962    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    239   �      �          0    16954    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    238         �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 16, true);
          public          postgres    false    234            �           0    0 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.dashboard_kepegawaian_baru_id_pegawai_seq', 1, false);
          public          postgres    false    237            �           0    0    master_agama_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_agama_id_seq', 1, false);
          public          postgres    false    223            �           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 1, false);
          public          postgres    false    221            �           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 1, false);
          public          postgres    false    211            �           0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 1, false);
          public          postgres    false    229            �           0    0    master_kelurahan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 1, false);
          public          postgres    false    231            �           0    0    master_kota_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_kota_id_seq', 1, false);
          public          postgres    false    227            �           0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 1, false);
          public          postgres    false    225            �           0    0    master_pendidikan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 1, false);
          public          postgres    false    219            �           0    0 "   master_tempat_pelaksanaan_1_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_1_id_seq', 1, false);
          public          postgres    false    217            �           0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 1, false);
          public          postgres    false    213            �           0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 1, false);
          public          postgres    false    215            �           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 6, true);
          public          postgres    false    210            �           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    240            �           2606    16953 3   dashboard_kepegawaian dashboard_kepegawaian_baru_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.dashboard_kepegawaian
    ADD CONSTRAINT dashboard_kepegawaian_baru_pk PRIMARY KEY (id_pegawai);
 ]   ALTER TABLE ONLY public.dashboard_kepegawaian DROP CONSTRAINT dashboard_kepegawaian_baru_pk;
       public            postgres    false    236            �           2606    16944 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    235            �           2606    16977 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    241            �           2606    16799 "   master_jabatan master_jabatan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.master_jabatan
    ADD CONSTRAINT master_jabatan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.master_jabatan DROP CONSTRAINT master_jabatan_pkey;
       public            postgres    false    212            �           2606    16814 8   master_tempat_pelaksanaan master_tempat_pelaksanaan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.master_tempat_pelaksanaan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.master_tempat_pelaksanaan DROP CONSTRAINT master_tempat_pelaksanaan_pkey;
       public            postgres    false    214            �           2606    16824 @   master_tempat_seksi_pelaksanaan master_tempat_pelaksanaan_pkey_1 
   CONSTRAINT     ~   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_1 PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_1;
       public            postgres    false    216            �           2606    16834 .   master_eselon master_tempat_pelaksanaan_pkey_2 
   CONSTRAINT     l   ALTER TABLE ONLY public.master_eselon
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2 PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.master_eselon DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2;
       public            postgres    false    218            �           2606    16860 4   master_pendidikan master_tempat_pelaksanaan_pkey_2_1 
   CONSTRAINT     r   ALTER TABLE ONLY public.master_pendidikan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_1 PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.master_pendidikan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_1;
       public            postgres    false    220            �           2606    16870 2   master_golongan master_tempat_pelaksanaan_pkey_2_2 
   CONSTRAINT     p   ALTER TABLE ONLY public.master_golongan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2 PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.master_golongan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2;
       public            postgres    false    222            �           2606    16888 1   master_agama master_tempat_pelaksanaan_pkey_2_2_1 
   CONSTRAINT     o   ALTER TABLE ONLY public.master_agama
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1 PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.master_agama DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1;
       public            postgres    false    224            �           2606    16898 5   master_pangkat master_tempat_pelaksanaan_pkey_2_2_1_1 
   CONSTRAINT     s   ALTER TABLE ONLY public.master_pangkat
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1_1 PRIMARY KEY (id);
 _   ALTER TABLE ONLY public.master_pangkat DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1_1;
       public            postgres    false    226            �           2606    16908 ,   master_kota master_tempat_pelaksanaan_pkey_3 
   CONSTRAINT     j   ALTER TABLE ONLY public.master_kota
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3 PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.master_kota DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3;
       public            postgres    false    228            �           2606    16919 3   master_kecamatan master_tempat_pelaksanaan_pkey_3_1 
   CONSTRAINT     q   ALTER TABLE ONLY public.master_kecamatan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3_1 PRIMARY KEY (id);
 ]   ALTER TABLE ONLY public.master_kecamatan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3_1;
       public            postgres    false    230            �           2606    16929 3   master_kelurahan master_tempat_pelaksanaan_pkey_3_2 
   CONSTRAINT     q   ALTER TABLE ONLY public.master_kelurahan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3_2 PRIMARY KEY (id);
 ]   ALTER TABLE ONLY public.master_kelurahan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3_2;
       public            postgres    false    232            �           2606    16961 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    238            �   �  x����Ң8�u��PIH������bMU
�pQP�O���'�,f��R��ů��p����v�b����u���ڹ9]D���8��:5\*�Km����:[;��p/�zQ��������gG�|Ҭdv�v�y�N���������R�Ya�h��� $MD�/F �dUR��,�Ai0�m*�U��X���i!&�<0��>����羓������.�O�P�@�Ai�7OT�zf����ė��Rc9�b��7����c��V$5��>i�Q	@� ,�!i�3ht*��7��n�W'���[�־uT��K��%>9�cR)��<S���VƼ��2�?�+���v	�R4��z��z��s�&w;���)�F!�_eH��4��y@��{eX�)<� Z@�P�4À�D��Z�r���a�ӈ
TA����X��*Bt��@�B�'~��r�=]5�F�d�Fkϯ����A� ���G��_��w7{�,ϸ��c�����f�8���!����5���$�4�/�.�I�&
tXZh��;C���A��D/'֭☂�'���n����-�Zu�Oa(A�!H��%�oF�l�����Gf�"�F�<�j�(����z�i�'���M!2X�H�4(@8���{z����ʔN�n�����
�K�?Z0Zȑe;=q>l2�$c� �ۀ�������Y�a#�}�fTGi���Ż�my�-"��:mt������w�2�2 p!���*�nf����lJn'�޶��?�},�-�g�}ݓ?mD��5��m���fJ%�ut^��]O-��b�:�U=_d�S�,a��ߟ/���6���������)ɯ�{��S$�[���:�}a���ǉ���!�)�K�I7�!�ۆ��T��g:�R���w�re��jG~�t-�QZ��EPce���[z+��/����F���BH�,�-	���{�#      �      x���͒%Ǒ�ט��d6&����es@3a�!�jV�4��"�I����u�xVux�w:�`��Q��'�{_��ݷ_�y����~���?���߽~�_���W��������������W�?���o���?TD������W_��#����w_�_}5-���#0 C�|�Mmlz�U)����y���~��W���׿���*�?� �xǮ/t�����h|��#��^��o������__��#��#x���[]�~ly���>��'��	��ס��cH\��-�}��7o~��{���>����aIݢ����t��xﻮ�w�qwK��{<߻1��wW��{e����Z��#�zD_����}H���n�I`�:��l�a�;��@\��� �ݻ\�����滫K��nL�>p&���dm�.+�\Z��>����Y������X�����<���>Mh���D<8�D�Ҵ������߼�f�d}�qNn��7�ߛ7��o]'��o�Ϛ�}��oVZ��y���9ٳtW�����m��c�yӭɠ�x?����2g�ipI���zK�B��6��d��Ɋ׬�X{�d�uױ%�3���%q߻^/ɜ�]��͙�>�h�y�g�d��_�9�q�w����s�l%�S_�j׎h���K^[9��9����n�-�ۻ^'��^�Y�[/����lV�d���msކ��כ3�d�u�sO�]/��d�|wk������6+w��h�rS;٬��#�>��f���e����a�ٷ�6�m����Fv��6Z �������7��,Mv��N��	��ITJ��p�xiM3�E�ĕݕh�+�߉+��f�+�C���J0hP�'ȕB[�R4̋A���0O�)������D< &F_��E���L�.��T����dc��q�?�������w�uɝ������	~��0/jԋt3ڣl�嶌�y��F��,�-�h�����;�""FkF��<=�4�XT� .���N�ތ�yw<��s�2�o�0�
����d���$*���iC�9�l��iC����n�<#
[mZ3����|�b����12]bs���0:��_�y��kg���L�I����ͨ�M�3r�Έj;�K���3��L��$6I�%�~ek{M8�.�0�/F��Q�k�߆n�����V�C�M|��^~����e���ZSg���m��8���7B�����6�2��rʘ���ʨ���B\�v��K>�-�ć]�h�h���c�&RD�D��'����oJ3���]��CEo:�_�Z�ב{�f��F&P�Eߐu㏮)�&�0���0�	⻗���m�S7ry�#�%��n��>C�}�@�(�DF�<=��oD�� 2���FF�4"�&�N��O�7�N�>��g�mN��3�L_2��}�H.�4
Fg]?�\���}D��,��0ڬ������BxS�����#��DO�;�1�$Dވ�3<k���陘x�����n����M�w�HD"�����2�c&��On�h���&i�ٵ���&�	9vhd$NsF�tٯ�	k$�|���Im'�ק��ˌ�y�����)Z�&W�aB�M^:B�=!�9��|�P������3�M�6m\!ׂ��8m�F<N�]K�&��z��t�0����C�
�7��od猿���8!�E>l�X�Rm'>���3�?�"�M��v��;hB�����d���Ih�4�0F�9�Rތ[�Y<�6$�����T������v�����QN��3��G�=ל��~8ڷqG+b0�����fꛮ${��7�_��7�_�!~umh�I��!
�ߨ'螿i�ohT�'LC�	�9374qf;3&�$[A��$m;7V��;-P�Ӳ*2N��/� ���&�Q��/�A�;��Q�3��{+��ݩ��a�ʘ���}/��O����f��h�Tێ"�dOw�\2���g,���{��F��f�;/��(C��;�z�� �Qv�l���?�#U��eF���ݨ��?��X^T�L���Y�m-�ӽ�(���\J���.�4">G=�t9���
�q��C�фڂyF$k�� m3�dK=Vj���I"?Q�$J���9��L��ߺ��)����j�Z�4G1��ZT!i��^-iN�r��Ki�<��J�=�Fo�>Տ&�QO�	D=!�7��Ѹl1�%S%h��8���K)�v��Ƹ��o�������AiU��L����B#�N6A��r�3���L��_��~|gO��T;�ٞ�<-NX��z�|��$�R3D��<�-��<�2h��w�	����!7�ОG5�J����*��g�U]kJ؝��r�;}e儸u$�v�S�4����q$SVئ[{bb܎z���M��	�8���q;����ia��;:���NM�ӝ��~rUM�2j�_f#�v��պ�F��$�+���)�w�]�&F�M� �)�$��6������̨��9q*��4�t+�=#v��f
Ra��y>!͎,�4;�Ʉ�;�fC�;M�51�N�3�N���򼫇��6'�jy�
��w��i��$n��K�h=AUp4��28�3�4�{I�g��јAO�QA�۩�2e�W�ћ�_��T�~�f����ϕ��%������w�x:$n3D� NR�Iu�׻c�O�N}�N��d�NC3VG��PU��(N�uV��`�Wj�0:Ve�N�a��ɵr��:zd��w��ޜ���_('�����K�����eS���*0'V#G���6,�JvC�b�<T'G�]���/����e\N�a��<��B�r�F�m$�i�a���VaU�ilF����Ivf���sC���,4"̗����σΈ�i�='�NwE�3N�om�әY���v��/�t�G�q:2���53����������"�i��yL��-̌
�xf�N�`����G�,!�_3!u����ed���+��:��9�tW���4��VCGRQ!�f���y��4���9�:'�uF|NۇΈ�i�������fVȸ}e��d��e�V&�Qǝj�3�4�d�N7�af�NB��%�8��9���J3b�(�ӟ��x�y'#v�+<�hΈ����+u����$$]��wf�N�7#v�M2b'i�I �3�N1cuuT�	>Z�d���g4O� �y�Pf������;m�D���w4�"�glq�� �ޙx�Kj�L�#� ek�ʬ�����y��wZ��x�ل%f������̨�N��K��ygf�O�<K�j�>��4#|�/Ym�6��x���܉�Ds�,�\j�V�֌��x �.k%�3������h�'m\��rG�{㲩�Z�}������x�����
#�p�mȂ������',1Khgj]гT
���rVO�#4��	��p�z.L�����w��~KF�toCD��j�;����%����e��~��#���{'NZւX��<2IA���,-��V��%)���������ڊ��w>&ӄ[PE��	9���d;z����i�`�vԶ�Ă�%G�Ny�%I�z�D5�Ht����y���v�扶����<�F�������_'E�y!�{��w_���6tP�V;/�xr�dF�ti����U�Qc������uaOsMVs�[�`�j�t����n՜�j�4��z���D_���=q%�$���Ò�;I��;�S�D<�]&�������
.��r���Y�Ԭl�K�����!�?��ga�YB[%�wڤ���)� ��Fӫ�F�}���-��i�p���oz�d���S��}�qez������,�+���|�^=��<	����,�˕=��Č��R �U_yeDO{1ei�uxeϏ�w3EOwK�"EO�ܭY}��\�g�WF��'�ۂ+{��y>#z�ZfO`�;�X���W}˱�;->ãGCã�Csk��)�C��������"o=x��l7�Z��,9K����z�I�Z�a��kX+��ϣ�09"�����|dF�t�IWF��m^�v]Q�@[�d����)9P>9j�3rak��վ�z�|E�5cw���5aw�t��gi<��,u�Qd�HţY'K�ꦐ���i�f*���D2z`�{m=Y���;�	��Rۏ>|    �5G5�$����G��;�6z��9�*��f❾���f`VyG6A�e�Qݺv�֤�ǚ�w������N��5�w�K̕��QWF`ee��=���8W�+*�,��f=�Z���CYrS��m��[�CY�J��tՋ+�Ҋ����0Q�d����&�m��)�H�����.�[F�t�O�u��cU�H�����;[F�t�+�|�6��i=a�Z�&L���ѽd�<�u��v��w�sS�֋����On,S����:}�d�Z݃�&ϋ���N2��;]�zC�wf}��Ȗ�;������������t�l+�܌�J+��	œ��x��h�T���⊕�Q�]g>JxF���%7����$</����C&�Q��9dC�Z���)u����*��W�s�{ɍ�i�n[yZ+����]Vse����vCiZ�m4��(aiZ�9��٢ʞ?o&AO�H�سY�'w��Y��r���I��P��v�H�m;�=[�����T�زǳ�;���홀�?r�$��{I���y	mg�k��Ć�MǬĲ:�Ε:���ԕL��_-Y��Ў�u�3=�"L�
z]�At�\ʪ�xa�i	�jH��Yu���/[�����x�����-��������6*W��DNTO���:�fYZ��BF�t��-�ggt��Ў�gG*��=��tϋK��UrY�y�e�%�@���ߺz���=�޽Cّ���܊�(O�7��Z�	%G��)|�gUy���}H�uI�Q�s5��Io��ZV�N���=����Ym�������ynh�R�3��?E䵖��ݪƳ31O�/�x�ˇ���䊞Go����iuû�<���,kNCU������{���_��i�+��,�t<���et��y�pG:-�ٓX���Y��n.Ď��:3!�e��I4;�h8�r��������Hϣ��=�e�����b��<��	{P�}#{P�}#�ɣ���z�``���'��b�=����I����z�;�,_�K%홬�?,Y���jQ�d=Zv������"ꉓ���4�P֖懌����zd�,k�Kg��ӥ����o}�G���a5y�4�Mکa���4� �G�|�����vV���	�ɣ���"����o��Y)�f���=��s��H���D�����9z�=�p'˧]l��[�hM�wf���{��f���Xu�)|d��5	�	*ܙk+�y��mR �E>iۄě�v�&í_�9E#�G�P?��]�p'ߠ��NHV�M$J���
��Hǧ:+�pCj�� Y�y���֝:���[�$���ѦHnJ�D]^���[���zF
%�5K�J�����+	G����Y1Cs|*�䣩��xi*��C��{���ё�KVdB M���;s{p];�����
w�y��0�p'Ť��F�I��q�i�����Ϳ�(������?0�HnB�}f�J;t�y��D�
G���(,>�=�.��ݱ�6NJ���c����
9Ǭ�X#�L$ԥE+�I�p'�h���0�;u2�O�.��b�2��̾���B�b�qG�ȥ2:��s�R�ܩ�4����[U*�~�u�(bLx{��K6�ٳ�]֮�z��B�����j;����ЯpGqR�N՘
�N�J�9xȊ ���K�������R��|��^�H�0
��T��>��sX��I��NJn����9:C�߈GF)�3�40J)G5Z'��.�Q�d=d�c�̾
gE��ߋ�X���
	�QJɸf/�+��c_�*����}*:�(hP����Br�nB;m�dx�)J2{�+�jՅ�pt�&C"�QL�Y^Y��������w�#-g�J�U��Q&�b�I�N�5�&���1��X��� �:���2�*_�W%*�
G{�h-���U$���)��SS��E��H߀*T�g\R2*���b/����I0��M���3�pD�+"32)�(�w�}w�z+��r�4mՎ�p$�ֽ���GǗ��B1�P�Yx)����)S#E���W�'���nE��b�$I�L�2Тu���O�*)��Yo�W8*Z���U8YX�6I��0Yrd��$8R����:f�R��4f�R��Q�!�#�(��jR�w���L��_��L��_?F�Q�_L�}w�r�`��xtũ^��P�CbrR�(%	����D3&�iύ�F�G0VI�AB����Q1��I$�#V���Q.E��	���!#S*�7�V
8ʩ��(Ym"�W���ުNT�di���J
�+�R��H����ȄJ�;*ɐ���O+���_�ar�IwT|+�۩z;���,G��6k#*D!���4�:E�Xc�ka4��,�1�2i�F�V$�#iR��C.�4tL�L!>��EF��M��쐚�aP��C��!5��]$8�f�M5#����ŷ��
��edvT���s�ï� �2Ã=3}Gc5��$�L�M�_s�,�M�a|����bC�maV�:>yU��$�OEB͑L���gtR�d�����Sٳd�T�.Y��Q�<IC;+b�>�&Zw
:�I�\��6E��&u����}�'(���\��v�y���-��d5��LqA���,�M^�JZW8�ʫL���jU:��d����Dg�:��e�1��{�Qy}0��Hz!�C;��X$Ez�lY_RS)ӆ���AK�L��>o��
�;��↳�yE,қ��[�Ux�]w��0��dIM�;�"Eg,�CA��ǜ��H}ҩ0InEO�Œ:=���iW����̒��n��D��.3	���}%'%A�������
_G�g�R_Y���%	���J�:{�^~b���i��%��Ne	o�K�P�gatRՌ��J�!�^�DJݲ}�y5#���)#�28�Jx��a�{�����^����_����>��"��8):�N��KrVX�[��*4�n���t�e<uR�ؤb�m_�N��
w�$U�u)S�lR�FCT����&��=�V�W�~�V�Y�[4���˱�e���X��c���U�tE�SH��;J��@J���&�O�[����˨ZE��"8��j��X�[�-b����N��Qp�^�&`bu��y�F�2��X��.x׭�a`��R�Ih�e�
w}�p�=�
GCT�*fG�x��&V3;�֕۔U��_�NL�$C"AR�	�b��LR��P�[�;�sx��}ߔ���*8*� +�2��3�*��$G�b�1�g\R?OhbO��O�"��?OL���dlһ'����E�d�2%R�����i1��I�&��Iao$v{�G��=L��HDU�"�jѺ��2)ZGs��$饄�@�uf}nbB¤���0I�QH����Ayn"J&/�m��ܒ�Eyn����SK����l6�<�>�?yyn�%E�H�������}g¤h�b��Fyn�&���A�m
��d/܄��xϨ��2�u�6eTR��2*)Y��j���z[-��}.�1(��Hm���u����DJ����"�Y�mY���{D&,����-RL V�
GC�uff咊��rG�Bg��B������r:3&i�J���/�e����$=��N�kfb$}'zr-"���&�#� wހ�p���X<��r�(*�n�Y��ԟ g�#Z�vHs��֟��,�-�TtB8R9(�YnM2Yb[Q��'��{�9���Y�嵩�b�е�\,���X��;�CW�E���rI�ݭ䙙=ʦ�D���G�o�[[��Ŵ��$��,���U͙")�;R$���B�ƲE�gŒ���s�%%]A��p�Lx|]����ߠ��mnmg&H
��d1{l��I3��C���ɫ�w����pT�PvG��`�&�~�A}�s��ߎ���EW2.)����5��LRߙ,):�F���dI1mdIn�BÒ��2��w^I�ED{�%�I�ɒ4R��۲�x��%���lhQ����y#;�çZ��9&�G�,�-�Y!V)k�*%gx&Q��PѤ��!V)��X��To��#:_É�|A�$uf�X����L��t���ZI������ZXv�,8zPh�[$��J�ӧˀvI�<���� Fi����d�R��Z��ۋW-i�I��1����̾�ZI���    ���[�5�����j%�[�3KF)%��I��V��[�-e��(%y5�����%&���%Ir�֙�J:4��5+$3N)�VtR��xsp�)eR�I�b�"iR,��XR���*�dE���DϺŴʊpk2H�&=ܦF���%KoK&$D'�äI�\F'�S=:iɪ&�)�ū��$tR�XЋnڅ/(�������:�U�dU���I1,�t�UR}���d��I"�:;����W�:��t���
�,˭����I������pI��NrY�,��M��6?vU^Ѥ�=覑گ��n�X��:��pG���Ig˩bU�>tޒ�-[W�[�*��h���*���GT��0)��4�gST{R��I�4壼��E�r[��ò#�^#I�}�r*TI�Y3֨�{�L�t�G������n�GW�EZ��謬6�&8Z?�b�J��rSVDi�]���\�f����o�ȣĐ�<������cʛ���*p��O���5�!%�ȓ!��3��fE���[�ъ8��e�f(:c����)sy^1��iH3�:�%���0ҡ�ȫ�H�̦ `�l�w�.��dH��d�d:B2$��k�%�)Kf�o5V�j�,�^m�ݽ��k��ֿ�\YR�bF:���%_�m�g�0�/�0�F��Ӷ���C�q�"��2d�t�7��HL,�M}G�Q���F��,�
#�D� �!��0zh��p�AF=�>��&~dͨ��|߀���\DŐF
�X��ID
���̶"���&��l��To���g�d�C���
�e��a��)�G�ք.�(�5���!���i�g�:��uD%E��K#enbE�^���%�ŗZۮ��0Jj��=٦O���
ng6Td[�ƈ�h����dH�K��eDR�}�PR�}GCU}G/�i�ن�"s�S�X��Qp+�bCZ$-�ې��!�1���[�-� %��$�aې�����6F')�� G�j�IMJ��dȌN�,�^-Vh�:��N�9I���n��?�l��X��I����$�o2�eYm���H�w$=�I�,��/q�Xq$�&ᓲ
#[&AJ�,#���6�צ�ͪ$ф�^���s���+�mΟ9�殊
�f|R2^��mF�3��P^[؅�i�cB�X��m1��J��y4���$Q��ؙ,�.U��J��&B��u8Z'C5� Uڞn��2B�Z�2B)Y�Qj[Km��.ɖ�IJNY^��-#������H�LR����iF͈�dFe���Y��d�۱0jIn��v� '��ç"�P30*�}��7V�zI���IO��1�R�N��3�Hicŷ5�/C�͒VV/)>�R����6�iϨ�>鶳zIEp�3�)��=�j��n?}�~�Yz��+���,>���T��BI7��������]��
�J��ћmp{F$=�ˎ�L�n�zwTn�`utI��0BI�3BI�^n����m�Y��d0�2I��B);��^��	��Ohڕi<Fi�ܖ�{wD(Of�>)�g���L�Ɉ����M�(�m�>��7VVd[��lSg�.)�֋�;�%E߭��w������j=÷g4R�$�g4R_O�g¤d�Cmaw�H�YF[��R�3�H�ɋH
C"at�R����?�틥��������{���G�{�$�-]P")�i��u��v0%b��y�I�����n��jԡ:�b�w���[�Aw�LҘN�I�FfO�,}{g��i�@R�&S'�鯝=�&۠�H1L�:):����T��=�����}�Jm�()YX~��rF%�FE�b��TIɡ�E҂�QG�(E���;�o�W�*I�����oL�4	�l{+�����	�6HG�軣
�p�ܞU8:���l�����TۮpGZ���ٖa,�#YR����N�7�Q�m�qLv��W�*]��2�2���*#ż�X$�e�)�G2T#~G�����H�����Q	ɥ�:˨3}Y�]�]P�"�D�垌=�R���AUxv����x炭BW�T�o,�M���H���
�K��A�X��#*�3/+��#1Rq��GcV�d9��l�xg,��b�*��W��_\�N��
w�\U�S���Q=P�;S#�uVf[1��H�j��d�V8����<�V�hxZ���՘U�Sì���A�w�!�|�qH���
wJ2W8zU����]���%w�:5X*�y���
w��*iA_�ʶ|�^lS8")6�������{$2$��L��;��C	�I��̤H���ΤH�;+�-C�,���3j����Kњ��>���oVc�+��p4T[V��
G��Ip��p�rz�;��+�I]��%��S�kȤI�#��H%M�#���p�pk2R�����I�S��%���z{�-����Yp�l3dڤ��u�v��Ɓi��g}0S(��[�း�SL��I��EC��E�d�R�H��A����ڶ�)��i���Eg���
G#U�D�nZ,Vl;����W3j)��7Yƪ�T�N��
w
LV8b!�u�UMy�[:|*b!4{�D������jnː�	7E$����R(U8ѝE �$�"�G�-���t;X�������:+�p�WR��'��V��
���C�-%sd��ֿ�P��çz{%qK��e�J'u�[��Հ�8}**Z�N7�P)��L��1E f/��v���x[�;��q�h��%���mǄ��I�s�x[���S9��>��d�V8:�ȫ���8�LI��h�>�> �R�}Y��B���ݑL�����^�TVvg�R�	Z�3h��:3"^I�Ǒɔ6�-��V�[�;�+��[�['�1Kv��cV<�=2�'��.�G��s�Ȕ�o�(���1zB�1Iw�?��O�SR�g�R�4f�R��Y���`L�4O�@+ʩ�^᤾á�C8���4��$��4�v�B)i�$�4�LY�$u��I2dA7�2d!^�"626)ZG��7����.UG�M36�)\�j�U���L�;9���d��?)�,�-��]�0dR���UQ٤Xe�d�&;�&�3H�1ÔJ�����+��#�h��X8b�4��|��ԄMJ��L���X>����ɤJ�HVǬ`R�uD�"Э�I��ްYP���D)ك#�Rt�/Q�V��p�i}��S&R�2�DJ
�&��rD"�s�t[����?����6��I�)�e26)��&lRvM0ftR�[wA�&jT�;��DJ�;)�K�HI}gl�잱IY߳L㧫{�ƺJY�$md�tRv��Jq�9��ؤ���TYnD#*Ô�M�Oz�%������%��W�Ǳ��h%H�%�A�EpAYo�%(=nL�gV}{�y��<�
G�^EnV4��QF"�e��InM�%!��۶b��p��F�H�pt3.K�2ܣ�V]���hR�\Xn�+��Cڤ��?�V5I�A�$]Z��[��Ԁ�pK�R26�/�/��L��M��Dl��/��W2�L*L�$;22I�FV�;LV�
��R˄Ria�x�Zgioj�U�֧�W��U��:�*22)�:dҤ$f��!�n�� �jxdҤ>�ZP�yU�Y���꟱�gDR�9-����.}��V�mo���~>]�2���݂TIaV[���oW8b�3Nu�
G%<�2���j�i�`Ioլx��[��~�HaIo�;��U��&C2u��ʒޢu���T�<@Ɋ(�K!�����m����Ie���3:I!c��V�λn�BK�&�o�˝Mz)SV;���/S&5�ĸ�"��E>����$M���\:���A��o�c}�4��q�S�y��sn��W8ib�����Oͨ���ŔQI}BvB��cX��"f2*)�;�!iez�n��
'L��Ib�4�L�rR����wt7p��Yp��N�#��!�|ԉ��8��*�<&ibL�Fb�p��q�-&iB����U��[�=�
G��r��b&`�$��[,�9�h�����CinښN�=��%��P�[�{�0Ine%���}.�Y�)�#��S����&�G�QĲ���h����&V9I�j�߮���d�~Kn��[GӉ�H�/�*I^B4ҡ3�0���2;+���TI�;��b�h�Cg�We&K����-Y������h�    �lw����e&E�')M�:җ2�H�=��aR$�U�t[�V`�	=�;{�ئ�b�m2d"E��Y��<�+�'�<�ythݒ9L{�և]�a�08z�@��e��oԿ��o���oԿ���n�^�7��.f/�mFϷ�a��2g�Q?g���
GLC��2��U���#eY��3錤H�O�*��H�$�i��%����2L��/�
oό>��Yq�]pt��@�ѡ��1���h�8gB��v����7s���l9�3��/s�3�(��2��Ϯ�}4[ϸU���b�[[ߙ	��wF�M}!RF��L��O��G��7���
���F��f|"z�::ci@g�@��3�H�A�QL�8RLL��A�kE����2ə4�[��s�ΖiVx[vgő4{�>z�Sp�4h~A��cO��GͼG���[U�g$C���+�=����:0���!��L�� ����o��j6��
I�F�FR6��)�|*�x��g��_���7����C��O�F*b�p���Q��P�)�H�if%���H��+�yOFj_-2{*��zɭ��^In��>g6�I��XEWVz{ܒ�.����W5E.�P�<�d���A�d����^"h��,H��!�0!�,8:�l�[B�%+�ݿ�[�/�eG�%#��<�Ha+�b�r�$D�CŶ�2�ԧ��$:cQ�K&D�Ӳ"�W�t�#�J|�����1IK&DJ�"ŧ"&)��1I���⥴-����9��G�֭�����T�2ڢuV)�$G<V��p�:T|�7��6M��ڶf�,�-�"�I�#��ԧ&C�!�I�:[�2˜��63:�.H�$Nqa︅-iْ�I��х�IZi2:)��35R_j�x�-�F�'GZ�;nѺ7��"I1����EU�#9R����SQ���}:)9.�M
��MzZ�&٠�٤l�R�bFbl���%�.�DR��
nG��lR/�w�aϸi��*$-(�-�1#��*���I�V=�%!�2gA%�b������3�n�Vp[nݭ��܎�FVp�������a��ʚ�I}jk�r���+c���Iuyum�f�����Iu�X�����g��oE�cu����22I�F��mX�*)Z��QWF&��H��dYmG�2
D&K�!YV�b�e�m�w�2g�K㒾�*[�V/�meJ$���G�����B���AJ��*ڻ"%�.��칶�3(�_!�)��U�V�\[�ݺe[��U�NɌ�xJ�%?Z��HF�k1(���+{�M��dHZ��<�"�ѣ�Z����)�eQ��fQ��[����LrԿ�YYm��H3+z�AQ���XE�b�GQDߒ�r��KQ�"��Uώ֑K_� ��;�^6f�ݐjȳ���GH��ֳ�G�?!BוL�a��&��H�p���W+qb̈́F�K��ϖ�o��F+��S�rG}�ۚqC����^YΚ+�-�3rHvG��E����e�^ͪ��~v�f�g"&�+��{�!�����R�֌z�A���FѪ�T��/u�͠%�?�m�R�n(cM���(�YpD�E��=ˆFs|*���[�ύ	��3�[��2�6T�Hcn�=w��	�dH�ZGU�w��r����ѻ'�o	'��ٰ�7H)�Yk�H�>��yE�7�0�Y�#y�)��2h�*XX�#��)
C� ��>��\5�vC��l��`���ƞ`�����$F�HV�(�h��M$��xfw�,����j���7=)��|`���
�����r��X�>���FZ�@}`�N[���7��y��ȫr�L�3�L�Z�u���B��Og��|#}C�|!5&�e��ī����B��\�W�!^��}!^=�������O]�WՙyU��F�W����ꊼ�#�jaZ�X՞s���޽�"� �v{�H~�J���<�nȥ�ri���:��%`���Ʃ`#=�;2�~_�������ͽ;�{��d�-�G.+"��4:c-���ZP����~C�t����Ӏ��7:cm���z��m�~C�Z���h{@s�&����C�F���C�ȣ
���苵���ht��"�#�8�>uD��>u�6����HѺ��њ}������Rs�����:^��/���M�śxYM�+��t/hލ�W�/޴[�b*3")�t�&^�$��iGLҡ���t�<�"&�`w�E�O�v����H������#&���t�3&InBL��-��I�!o����1I�;c�dH�I��t�{*c��&`�$�L��	8�Ĉ��{�$D$��P���};�p�}�C���HG5>����ȧ
���)c��w�$Z��_�I�74P2�J���t���U�J�w���wg󋨤J;9�F�=�QI��[���QI;���q\Zn�J��`�KE;so�;�
7���v|Z��0�p羭jE;�i���[�G>�g�T�΂Z���L�/�R�J+�YO+��#U�7L��aLR�>�ɴ��K_�H
���F$�8	ȧw�� ��xe4�Z'4��.����G�m4���U��#U8��,�7��i������H$�|"��,���")�Љ���vx�
w����v+��U8�seGF!���ܜ���T�ƅLE;TC�{[#F �=�2)㭣�T��P��ux�{Ւ"U�7R�$71)Rґ8T�7R-)R�{;^� ɐL�p��pϫ+�E�YR�;"�
w���QHa�B�po�"
)F��po�(�
7.�*M=��I�@R�w�B�½}R#��@e���%G�poQ��Hnyu@�n���H�֭��`ɑ*���#�;2�
��:Xr�20i��*�F:tƢ��F�th�� �$�­��I�%I�p�URߑ$)쎘��w�$Z��*�$E I�+�����Ő�V�EH�!��0D'�έx�[���#��K�O��nɒ*�[T'��*��*I�TI�/%���so�e�R��s��(�Q�� QR�QJ�ֽ��8��[�ԁqJw�P+�b�)Ŭ�8����)�S�ֽ��8�`+��½�j��U8�D��U�IRx�Ұ:�m#����P��a�R�1J�֕�pg�^���@b|�z���V�½az�����$Ec��C=�ZlҰ�߹�NT,5R�;YPn�IKm�ֽ-�nm��t����4X�me����qI���SG&H
�t��?8��/�.����%:*�
���8�p�"��L�$� � ��F#�dH+��܊
��1#�gb$y�#��C
�5�C�֭c��8�茵�G `Qxr��PHѸG!��B������в7H}G���*�;}���h����G���H�}�$I#�$ɎL��/'���ɑF���{e�Lne�U���,�M���h�p�ݍ�OF�QO�42�H��x��Jf�po�2-�<�x�茷9�H#㍢3�jp����ȴHj}%�Ay	Gr�G��#ot0���e�Q�-�hD5����8RxYU�*�;��\6})�e�Oux�q#Ⲱ��R�(R�[��'D�Ifd�Q�~NƇz2�ѓ!��i��������i��[���Ps�n]��B���1�pG�.L�U�­Ŵx�l�i�0��x�Q�������T�hZ4n�d
+�$C2�H���"U���dV���Z�ي'A*L���VԂ�0{�H���h���B�em-���H
_F"E���x$Ra$���H��{k*�k��-~�j#U�|�	�ugZXe��Po���i&"��H�"� �:��A��-֡xym�*�]��޷0R�~.m�zLRaL�z��"Ɍ���zDRa$͎8���m��po=]��+�$�ZE�*ܺc+�H�ƽ=#�d���U���[��H��v�^�l���0)��A��C�ə�(�h��U�½1JJk�N�aR4n񂅔�>�-���T�0)��,�����ɏ&Ti�:�N^&ۄ8$9iBҡ3��hb�l��18y,�䩐&O�4y�&�"-�[gӉD
�5�N^I�i0ğ� �+�C��pg=�<	�4:s��QH�G!M�4y%�&F!Ɏ�BҤQ�I�c��q�d:�4��[�TȂf$�]���H    �{u�&�BR�=i�+�s5�l<'S�ğaCo���"M^
�Ċ"�.L��O�裉���u�~E{K�L�M ^Q��#�&O�4yE��弬kX��GѶu�6-�de�*"M,{-��0y�&� �d�Ԯpoǋأ�ʢ�VK�2y�k���T/m�*"M�?��JjW��N^���ɐ����61H����atϡ�?R�"�H�鉐&�m�
�ΥL���"	l��X�k�� MVA�
�|:��ڻ���;{��آ3֕��dH���Wg�m�
�(�٣�fF!�u�u�
�&�٣�f�<����� ͈A:��9�+�=3I�a�Z�j!��y��PF!E�VF��8��/�8[؅����8�(�QHaG�B�ֽٗU�֧z2���e�Y)$� �!E�=�z�l3�!�SQu�@[Ҳ�HѸ�S��&3Z<�l��V�����x$u�+�43R�-�a��g�pk�;{��f&C�6�ASR#�a2{<��x�YpK�={2��Ȑ�[������0�X{�� �L��pD���"C:�=�zD�L�f;4�f<Ҍx�C��4{�l3���{	m3���OeL���F䂁��ʘ$��W
i��H3�"ɩ���Zgm�T"F
;��}��i�f�E�ѭ��*�;˰��at�ş=1��QI�Wi��j�-�i!o�)`F$��[s�´H���0]<"i�2�F$ɧ�i4���+��0")�n�O��xE�O������^A��+��xj��+��xT��ɑ� �¸����U&GR�!.),�qI�WV{��j/Ź�Y<*i��"-�9�.�I���po�zz��UE�a�}'�dG�P�B��h[�_�퓘&I�3M��>��o�=�zm��IZ�&)B�+����H�4P���+��xő�%i�y�-�*i�TI��Ӷx��VI�VI�al�"�%���^R۲Z'�MZ<6i!Im�ƽ�/#��:#��S&K���H��ٶX��ū��xd���#E�-�a�Ȥ�&-��v4��Xe�h�a��<��GZ�0)Z��&Lj�I�vI�Wie¤Epk��z�m+&E��yf�^i[Y�mu��V�OZYn[��Wnm�VF(m�[������5��^���{�m�*$�^���{�m���{�me�$MH�hk��2>IN���V�B��UHZ=>ie|�B�=��{��L��J$�b	W����e����z��^������3�쥹��Km+�'��RR�󳔨���8e|R�����IѺU{e�^i[���.�VV#i���z��{�mEin2;#���#m+#��%��^��4^���>����
���WKo�zIn��H���I��F#��I�:�r���I��嶒W�d&M�K=6iE��}���r�V�FҊtI�P/�me\�|*m�]�J�+z�-zb1�+c����� �ue�J$m��1i�Rno�_h{	jqH��ܶy�v�N��ye��H��m�?R�=�h��6&H�֭Et�2�6����e�m�y�m�lS0ARt��6�����G�<�h�I�G m^r�f�Ѷy�m����y�m,�-���@�أ�c��B�+dEVI�3�(Z��R&G�љ)Zw��ڼ��j:�=�21���icb$}��m��v���{�y��7����G��m^����G�09Rt�Ƀ�X���7�2�(���%-�j8��R#m�H�v�^���c�6�ۦY�G�E�o�>�P�r�6&G
;Z���ɑ6O��Yu�7�F� ��jۼ͓ܶ#m�ic�mwrP�;��������U�f|�7NqЍ�J�D�I�6�Hژ&I�bLRtƛ��bI�N�߽�ݣ�v�Jڽ'�v&I�O�ȇ�<�=7*��L�p�x�Y�$��+��3:IvatR��"�wF'Eg������N��X�ߝ�I��#��*z�-�n-��HN��,�-�b���H�٢/�KY�$M�igd�"��I�ϧ�L��c�m�k=�Y�$M�^����I��H���RO��3-���nۑ��֑f�����IYܽ�ݓ"��RR��M�L�$� B)�䥷�L�}�F�G(���3BI�{�m;�#��*KpS�y	n;y����Iޛm;�#ɎL�����n���{�m;���uo�e	n
F)�!���(����b^��e���\R�F)ɩ�R��Y�m� ���0�P�dI;+�poUe|�,�
&ɫ��m;{�M��{)n�G'�V���v3.�+�YS+ܙ~+ܙ~+�Q=T8����cj�;��_��`�V����nW���V8!�qG�R���[�����L�;74�\�M7F&�2��m�,��̼��U��U�N�p�<S��P�WYr���b�T�d���j%U�#�p�Z��η��'��I��n,�M��IaF�&��Vf[�{>e�m�o��2�*��#U�sC3�,:�Z��;Vr[�{k*b�b��I�9�b�*�+��B������S��]�TK�T��5z�9�1IѺ�9L7�$�.�6�½��b�*ܡ+�[OW@��O+��#Y�mӍI�T�TR�רmd�V��R�G�pϧ,�-Zw�fӍ��Ɏ,�-Z7jV���2Y���dI�'��½#*+�f�f���%U�CV�s�Z�W�K
��Ձ��͂�<�M`G�T��@�$�X/�U���<2i`�$Yƪ�]���w`dR���'�n�`)�*�"�V(I�adRt�:�V��
wx�
��i��K�#�`ޮpo�Z��*ܛ~=2i`ڤh�s�G&L���&`�M�$fJ�p�ƭ½	��u�p�:X�n�U��
wt,���$�n�ޮpo�d߮p�|�w�*�� �4 >)F�������*���:�­;��QJ��X�
�f`�)�
��5�U-i,yR�{c�*�]��4 R���A���v��40R)��m�,uR�{C��J2�U�½s�f9UL��X��`��*ܑ=����mY�$��Ju�po�2NIf�8��qJ��T��&��(�Ep�f�R�*��֡��z:Z�nn]��M����c�F�Q=Fi���1J�k��<):c����[�[s��ɓFO�42FI}g��dO�42FIc�1J�k�;Z��*��*b��qk�42FI�{��xg��5���������U7��-�adtRX�:̌V��4z��*�T���k�U�7�z�Ѫ�]�H������426I��u����I#�u�P�ؤ��I
�&��-��M��&�2�l��Bn��#��v�{��S'��4Z��+ܢ}��f��(��R��
��H�H�O="id���S�aDDR�RD$�����S�#ɧ�"E��=�Ȓ��M��n�\j%�U�7J�8I��$7ٝ%�)��I�y1I�֝,�
���1I#�r�O��I�S'F%m�[2���I�˫����N*V�
��,��I-ĊU9��]~A�nѶ�c\�־�x�n�QI
G�J*V٤
���ţ�
'��J
�5�/ӭ0*)>պp+�J:���:�����p�.�I
��b)Vݤ
�T,��I2�G&F&��(�L*�Lҧ22I}���ho�z\R�¸$���t+�4�Ld�
=�����pW�7�zTR���nةh4�F�ފjUM�
�%Ɏ˳g�^"�U��­��j&E��.�QI��J*^�[�TI���e���{dRAdR|*#�4k02)�N�[�Ȥb�L�poA��pW��T�fR�[�3��I�/٭0>)Z�Ψ�OR�y|Ra|��ΔI
�LҜ��I��Irz�-�9uܛ��In9ubt�*�u����I�U��JXmq�c��K���ĴI7�=�26I��UN��6)>�i�dH�P�����ߺ<�_��B���7/��{`��䱂��~�#/��(�>�J��"o=�J�@��b�7���tޛh}2{3���i^S�4���0*4�u><��޴�{*ĳl�yV[F_^�)�o�� �Fd��4�d�U���QΝаռ6�ΝȰcN�	�i"�ܜ�'�Y�~Z�@�6�����|�z?��̆�yf�6�g�Vޚɰ����sϜ���،ޓ�6��MɊ����bN�Ym#�ӵ���.l���6�����p�te�Vͯȱ��X�cc_��A�_�g	+�����h+Ykc��l���L�����ؘUg66f:���nh�� ٘_�c��xc�qt�y6�7wQ;���    �97�g��y7����H�̻�d��Z�#��,���T���Ƽ�
�f�Qxo��7��Yx4x�;�r;߼m�|c�݄gc7��x9k`�U���܁9W�;�%w���^6x�vS���Ixӽ�ޖjf�TL�35�#���؛*�Fob�G��*�y��h�t-#�bhӵ���P�̔���c��	���\�]�$y7z��{��n�9W�i�W���Ah��%wb�V���o�}ӷ����&t
8���9���$��FN�C�̨�MHM�k!5����suO6�h�j��_�v����]�$������]؆J��T��y7�G�̿�����7��u������XS?���Tt�6F"��g�r���Q1����\�7��5E3	���7l^����m,�\C�Jq#��f͍��aI�W})��S���H�ٜ,�@�*����h��g�P���w�;�Y��@~j~ S�>va�����QxDO-�{���frHO�[o��7t�O�<r����FO��=uh�"�NE�3v*b�S��N����R��lj�s���)m0&�:|/��/TN��3�F�ȿ.�uO�@�J�	�S
O�P��
��;��UwAʩC�K��)��7lb�k!A�Й�o��P:��)*M����Ѳ��Fn4�Fn���]E���ff�ό�q�ܙ,��p.��Rp�HϪX��oc�fUؒ��b��)���b����Ѕ���S
O?�0�*��1T�^(�
�9tEu0�93C���TT>����xW�ˊf��#��T$��s=�y�dTK��H.�F S� S��2U2)c���.���Z���`O�V�� �*-G;Zz��PL��edա;��$�HV) Yxsz�dU�ߛ�WFW��322�zy5�T�ͻ�]��j�U���f7���B���l+��4��LN��d5�T��W�PN���V�w��+�������*MͫIW�����X������s����تSP���~+b��;��ҙw�l�b��N��%��w!]�{���U�1AU�C��
�S3$�m���=!a%�@�*��d�+d�d������^o_����:Ŝ;���5a���B3�o5��V�YE�V��
)��{���(��LL�j]��F���*�>�TE0@�*zo]�X��]�İV[&a�B�J�A�*9�UѺ�eFtաy��~�tU���������ew�.�׍8W����{\�j2U�� �cٞJÆ� �7H��q���]y���[!Q%�C�J_ˈ���QƇDU��KZ!Q��!HT��ܠ�j��Rm7r*�r6�S���&���{��RU�̽m�oPY��@�*���A�J����{�w�T�*����1��D�=���U�g���L�j�ڪh߻G����U�O[�AmU�ّH�骛���Aq���W�{|���h��Wm��R���C���Y�A�
���i�bDU�U�j�4��-��­PX���*K� `$U|-��S�&M��e�6FS�5��JaS�o��&M�A�*�c��T�g�e�Gel���X�<U��HHY
��sَ*�g+���T�.,O%�@�J����so���RU���TViv�T��Ϩ��L ��c& nPV%{B�J�1eU�U�W�+S�eª�HX�kG��h�*ѻ��u�-�y��
�/�n��ێXȀ��r���TEx����T��ޜ�C5�,�U�wg$U��xb��TѾWMa7�S��<� �w���$�n�v�<�I������fy�& *��J�hN��>�N�RW̑�)�*��0�)Y[�J��3��;�9��U;L��w���s��D��`�Ly�荧��Y]*��.Utߜ���T;�QiĚ����N�}4�R�`�����<�>��T����7V�RT�%������!ExOl�3%U�*��?lKx���gB@j8�df�����b��Sa˅��
|X�*�^�������*��ow����x���)�o�O�a�t}/L��!?�g�Ut��������_���h6�T����2����Mrj��Ttߓc�PJ%����O�31��
K�S�B�6PK�`�I�sхZ*Y�L��Eu�'�ڽ���s�F᭛���2�+�*�_�̽���D�����U�53W<�U�7^����v��0�n:w@�!�
RT�Ƶ�;݊7}uT����}��J�a:�C����_�ȵ�$ro��o�To]�W��a�o��څ�$ro]T�EAV<��e�FUN��Qƴ��*�"�*��b�7�@Uţʁ�%z�/B����xKW񖌪⭴���H�����o����o��V�%��x�>U�[Wo��PF�q.t+�����H�U��I&�E��D��-����U�A�*��:�V��]��R�G�*��/d�4sBU�o^��
�93C�J�	UT7���j�T�?,N��gDU�=��⭴��7'gHTi�&��c�@�*��<��?Y&�E�V���'�t�X�J��R�xo�3��c�b�O�����RU��a�g�*�x6��\��\�ު;xu�+��R)���jRT�>�Q�<��{���T��N�����R�x��y�$��:�Q�t/�R)�`u�����x� dś��U1a��f+����^���)��K\����� 3��?�wae�0�U"c S��+S��^)��wr�p���ͥf�ipyo��^��<@�J�����ʩd}(�R0{��U��e W���Ta}6xoU띇m�d~��z�{��U,PS�k^XL=��R�U��VPS%{6��� W�[����n�UɻPQ%oA�*�o�T��~P��1@�J��\���*�FX�J����菹o�aO��Q�;�aζ��\HV�}HVi����i���*���4�x������� _�p���f��z�o����_�z���_�}��7����7o^��������}�ͫ��ͫ}�������W~<^�q����ʏ�+?^��x����ʏ�?�D�p%+6\���J�W"l�aÕ�D�p%��+6^���J��W"l�a��D�x%��+6^��r%�ʕ+W"�\��r%�ʕ+W"�\��r%�ʕ��D�t%¦+6]���J�MW"l�aӕ��D�t%��+6_���J��W"l�a���D�|%��+6_���J�-W"l�a˕[�D�r%+�\���J�-W"l�a�[�D�z%��+�^���J��W"l�a�ۮD�v%¶+�]���J�mW"l�aەۮD�v%��+�_���J��W"l�a��ۯD�~%��+�_��r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8�r��/W8��
�?]���+��t�ӟ�p��N���OW8��
�?]���+��t�ӟ�p��N���OW8��
�?]���+��t�ӟ�p��N���OW8��
�?]���+��t�ӟ�p��N���OW8��
�?]���+���s�_�����Wo~����w?��߿���]�߯?���޿z��������ۿ���o[KC�ZKc�ZK��ZK���?������o?���Gd~	�	2�����?�����~xD��E��E�!�E���3�I�<C���3􉏟�S��9��E[����.��eN�wі/sB����޿{��?�O�#�)<u��>�7o��ۿ|���a���O�_}��������s��>u9�}��iX�ߧ����}L��it�ߧ�1�r�>��������?���?����:��׏���~ Y  ��~��u}zX�޽����oFΑ_m�l����f��n�l2������n�l����V��n�l������m8����/5��{���R#/�����/5��{���R#/�����/5��{���R#/�o���/5��{�����o�����}����#�dt�'�~��Dp@������?���Ǻs�Ϸ�^����7'{�������\��W�|?��h�7�����˫�R��w�_��o�������N���N��q������o�x��>x���G������4vz�t;e��NI��SN�i씲0�/|>��S��i�q��# �0��ƾ��/�>����/��^�߼��?���?�����:!������zl�$���N��h*���:�|����w�:�z����w�:�x���xw�:��߾����0h^����~���N������(��z�G'Q���I��ti���T�G'����I���9qv�����DD~��ҏ>'"�n��?���8�s�c��?�s;}�g�N����&���o������O�v��	��ݟ�O<�	��ɟ�M���D}�7�{~�o�7������o�7�^J���o�7�J���o���z���߳˘O�ϮN>���=���o���Z���߳K�O��(�O���O����O����O�Ϩ�O�������w?��~��zFy8�������S�4qJ~�7qJy�7qJt�7qJo�7qJ�7qJ�7qJ�5��1Ԥ��ѹ�45o�rt.��y��s9��ϛ���9�|����<��ϛ����yף�.>o�zt�S��M\��3"�4q=:ψ�7o|������~� ��o���_��������~l�l��8�́&��w���-h�l�8��&�������#h�tG���?���~����݃�\�/�󇿾���p����k�vzڰZ;=�X���T��N�1Vk����s���ڹ��i�\m���E���m��E��Cn��E��9�n��E��9o��E��9�o��E���=����wVk_t,��?X�}ѱ �h�־�X Y8Nk_t,�ߙX�}ѱp~�b��E���]�����<Vk_t,��Y�}ѱp~�d��E���ݔ����ZVk_t,�߉Y�}ѱp~�f��E���]�����xVk_t,��Z�}ѱp~h��E���ݣ�����Vk���O?�9Ч$��)��}J�?A���OЧ���)7�}J�?A������������y��V���������HSF	��ҍ���X�n�6-W�?	��͟����O�j�'���!r���1u���Ax��_vԞݰ^m���g7�W��%G���o��O����t�      �   �  x����o�0ǟ���*-@~ /�(U��"B�������l����� ���k%%��w���0}X��<=����p/7��FS4���Pr�.��0�f�ш�ݠH.s�k�G^����
��Z��?�	}9������د�`ߦbX���F2Hw�j���r�����H�A��(dW��e��l�ȷ�q��F�5����܈�\C�[J��N�KY�R3<IH��1E'��.̥WF,U�=��
�7Fs�q�������֭��	ܸV�)z����W�r�jp�rR��.��n8E��l�X�-khc�A�D�A���k�hc3�M-��0�����W�q�?Ԋ�8��jH�����(���Q,ދ�<��X{��j_��8���"Z#�v�W���T���9a�Skq5aj�\I'�H	�sXɨ�n�F3��T�fK�c6~���l��O��ۈ���0�jfL$����5��KLQ>y#�IfX[3�1�3m�6�U��x`�r:O���P�i�q��q�mI���eT����f�a ���G{�M�EiQ��@ʶ��e&�´q^� ���,�j83����a��t�Y����p���ar�ҥ�k�*��C���+�ɒ�z2Y~�����J�I�f��{��2N�+��2����5�`�k|�L�tD�ae��/Y�U@'
�Ty�FF��[�ڑM7Z���]
E�����Fǎ/�����N���j�      �   $   x�3��I�L����D\F�!�)��
x���qqq mT�      �   �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU      �   c   x�mͱ�0�ڙ"9�H�S�f�9��&Xr���L؉��{` �$Ǭ�b�/�@8�&���8�,T��G*Y�X�z6�7�ӘI�mud�B7��3�      �   �   x�m�;!E�ڬ"��6��v@3�T4���4�Jt>�~&�z|D�����O�M�n����&������;F�`g�9��8u��xi)�&�k_��[��٪]��¿�����y'm��M	�����d6��j�ب=��Q`*��C_z��      �   e  x����n�0E����d!	}�K\�A'������M��li�Jy�B�1s�X�^OhQθL���$ޛE�B|��( ��y_*���
^��|↽�r�6-�}A-J1������A� 18<И]��NYe����f,~�%�T�Ɂ��&��M9aE���04��ΠK��>�Y�C_Y4��0�%^��ChS3����q��q��^�����Wi�|�*�H�Z�wef#'F����;�w�k�qTR_�\_Z�?���Q�IM�e=o�bjִ��Q�Ƥ�]����G��roa;g�^���j�_q��nĥMѴ�r�������)�:u��E\���D<��h1브)�1uo�u�cI�~6SZقK��iS����?G����)�<u�&�8�lƅI�0�z�l�������c�\@�S4���t���ؼ��(� P��CX��@)�9��ӄ%� .#׶4���+p<�?P)��H�_[���/�U{�f��^L��@a�fl�̼���d=8�����t�fXB�i�G�ܽ�n�t�Il�9��"gw��,�%�c���/�y��+��(�e!^���<���(���v��(��      �   W  x���ߎ� ���S�=�ۺw���A�f���s���d�I&�]��a���N�b���x����Z<�ZIU~��Q��y����S�v���/��9N��	��>R���e�j�M�y't�(Ec��˾��H��ɐ71Y�Y�E��Δ�.6�tX���y�C��'Yc�#��a�X��18��X�8U���w��%�yH�.����cB~;�?D�F�w��8��X�%M^婌&Y������M3�d�h��g�UƗ,x]��y���h��Sm�tGEy�V�#�8�;���&)QLuTE����ކ��)b�ѵ6�5<SP��q��S��������lm��0���/��zoS���bBJ�4O��v�*����P��D�v) �)�c��#�`�9��s���$ 0Ձ�=_�L{tA���'���h%z�(�ÚJ�L{4PD�Ԙ��;�d
�55uq$�tH����g?D3-�%ո9o;<fY3��71���d���G�O�eA��hR�W�Lqt%ڝbUҕ����LkLA��b�4F��L9e�ʘ��Z��,�0u1�FC�ǝ�b��ջܷ���)�1�Y�Kv�a���s�\�QD�      �     x����n�:��5O��?L��a�)��:v���1(0�����C;���ʹ]>H�Hj�&��]��f�v ��?��������RF�_����o����\׹˞�0�����w*kn�q�f�ؿ%�FR��^�1{�����[f�Ȝy��t��W;�ŏ*uK�7�r�����=˿�2�u\�[��^g�W��6�D��/ƨƄ�
�n�T�`��C�u��u��Q�_` ��/?g?�A���'d��>�����?o������Po�Q�����:|�	�7T�պDc?���^�P�VZ�_?��4����ʼ�����@��6�����,q�A��1��.���$�ss��Y�R�$=�TH��g��K��5��nI/� -\(��%N����Iۨ�r_�u�>uq�7Q�����fĆk3�ߺ��|��p#	�O�A\lnnӨ`_��-����_��}%ȍe�h�%e:�c�$��<��G
,Ȏ-̥��&dA}vC�{ C֙[;L1�X"+Q�?�!/~�aAzl�Y�]2�W����[\�i�Y��$�CCy|b��"�L-ŚbjT��!C\�N��>}��]�S�}Jtm)PQ�W^�d�06HO���~����D�P��kR������Ц� �)j�I��;])A	�S4�9�]��H��p��Ȫ�qZ�<�j
E��q,�X^��[
�A
��J�vμ>�aAx\�I�>V9d�9���>�n��Ǖ�`��WP��8�=�=>$����oSԀ��&�7�����@v��|�c �S�Y��z�s	2Tr��	*���?��O	�S��K2��J���ɶb^%�HMY�y��mL@jJ-��v>J����7�^#� De#�J#d��*7~����y�4�\[ݧ��x�
d��|�
$����ﲛ�v��� d�*~\�x�ʝj/ݩ1HU��xӪ��ӣ���,?D���E"[E�<�D�jb
��Z���k��u�ɘ�m�@�jJ�mM�1�����ѮA�jk���r��j��صA�TiM&��a�������qRUWf���Qg�6�;M�Y�ʾ>���n�m��1�� M��J�8>Q#{�y�װ���7+�Ҿ�6 F���3�@~��w����l@�H�4���HM���Q��Tf_��I�bΉ���(݁n`#1��(�Qm#��.�����ӡ����T�I�.9��P*�MV����>����.E���I��3ٔIy��w�+@�K2����J�W;�~�b�B̷�>�mQ1����v�YL�i)���'���̹���u���D��u�`?�x+sR�B��M6�����ˆ�l*��eRmY?W���(�TF�!�P �
��uO,;�Jv�9�P�1��r�6ǇPC���_�퐋`���rZ�Jϋzۤ�섢W�
��&���KX��7�{x����B�'5���s �|��>ݶAFY�J�w7��	E���NÄ�ō�1Z�*� '�o��ި	N��K7&���5�ɲ��}�h'
u����;Kw�N�HE��ۡlYw\!*Q�l����U��#�Qά$���.��P_�l�����Pc�l����&C�*�������Z�TP��R �r���<�P��#OO{)�&����W���5ʩp�;��F�*J�JK'	��F
Ū��F�T
�^9�1T��aN��,�P;{�!��
Q����ZƆ�1ꟓ������!�Q����G�^HP'���\n�����N.t��~x�樕Nn�K�pb�D�tre8P�OS�z��]}.�3�G��Fsz,S��rU��E��Pg�J��G.E�u*9Lo���$?|���N��y�ӳ���RzM�u��QD5�[�5r ���T�:y��~ ���27����A��6���<�:�1��<��6p���l�z�T��{3���T���'9
_ũ�)�P�ԝ=0���E�4_�M�)5㩊]u�i�*P'�*�d�.
�ߩ��Ӷd�{�J7��֢���T5ڷ㿶�C����~����;�d���t�8���N5��%	Qnj+	i����Pӝj���츶���;�.L�=�w�S��覆{�&��Nu�������j�R¾Ҹ��ԍ��T�nG�������n.{�X�}7j�SC��ıZP���v����/j�S��Q/-�g���@MxR�]����;��S�Η8b/��SSI4w��\��<5�+���!mP����U��@Mzj5f�G+�&ncQ���?Ou���!dHFmz�)����>M�V���t�}���9�F��&bԯ�0[�aԬ���ت� ϼ>�m���HHhČR��3���::8Q۞�:��,��Q��q�AF�\���xQn��P�|-m|dش'��sՁ����Z+�&OX���ot�F<��y�QԌg*��h'����q����QS��h���+.rԝg�
.����j�����N�Z�:j���g�($rP�Bw��m����,��&�C�{ս������O�D�`g�p��k3yw�㲅 ���e�^�M�οZ����q�u�=M�Ms�?t����
F�s���� ���l��������y��f�Ag[����K����
<���6jQ��I�R��yF�s�U��HUۥiB�Ҷr)��)���9[59��}o}e�>�"ߴ;˨w�m���˨s�o�>&G5JVaw��L��rJ[���:�\8�)k��=ÇJ�&%F�tֶ�o�1�sQɔ�>�1j����Ƿ��p�樑΅������ꟳS�`��Q뜝)oM��vKx�}Ύ%��E+��k�AҡX���h�\��OI��ҲG�rve4?o�F%J�v����꒳v���P4nm��Z��$L��i�%�̷�>�OⴠN9��'Vq��9���ǯY�t2�Q�J�ԧȆ�\I>��2�s�vy
��e��K�o�P/��*��P�I&��^d���~�����
       �   �   x�}�K�  �5����S�n�] -6|v��9D����j&yN�3b�}7΄�������b�58a�t�&�Ȯ��W��.��������?�6�&;���癬1�����pS���:\4{�S565��X�t ��W��6$�|��
:רj��R�.�mf      �   �   x�}�M�0�u{�^ �i)7�D�Bwlj0�X����
*}%��˼I���ܞ�����V�ls�L����JE2�4	2�Q��~ꊫ%u�R�DR��p���G
��:;���'h� �N�����wBh��|�;�>�2��Y���IN�C
���me-�Ȫ�+t
���������Bw@�MֶA�Pǜ����:      �   s   x�m�1
�0���^���Vk7��������b?d���� S�񎊪��cB*I�|I;���O�^����K%r�����HlB%�'"�w���D�����̨�O=r!rE%�3�mt�ݽ�L      �   g  x�}�]��  �g<X7��վ���Y�~vӤ�?ǎڦ݅�� 
�8#��`���[w�F��hp��z-X��fyd%eY�e-�h΍<W�/wSH�v*�C�F�ocWV��5�q 3r��)��4]fh�e�bu��vx�n8���?��l�{�8��!�ؼD7QFь�����ێڤ�!c߲[�򯳎�;!M��-=\��_����-א�4d�	yz��*(����-/\���q��R��A[��83��QNϒ��.�M�S�v�H�Ua�bmՎ���F���qb��j��(O�K�RT9P���6.���Q3}�zQ毩��D���ʾ��v��u���(�_	(��      �   �  x���ے�8�����v����N�-s,I�*���B�a����S������/X2�eZ��3]:�s��X�$K~w��8ϊ���L���G�����/�u���uf�}:�y�U�����_~/�� {z�(�|?���oڴZ�f�]V��qBL|��4f�_U|jlw�ͰJ
,��2m=��r�[J%.D�z�c�3��2/��4�&���$��:�����̼�H�jET���k�>6�
f��XNr�M��S_��C����g_�m��t�i��-Y�=�͵�dl#��f����2$����.�]�����;˨z��_�r^&ބO�~&ja0�,�Tx��T����Q.`b����#��ɶ��R�jR�U�8�!��`�3���a��;���('1��C��^]9���y[{�y�a�1�dlsYm'�'W��h@2�v�n��~Z�76 ���4ռ�r��nZ�}�r��WA�[d\�O���j��e7��[���;���xx�q��[�Q�l���ahkk�h8���[�+5�$�,��c[}0[l	;q��T�4v('Ͼ|��q#� ����F�Q�H�K���*�;N�����״�@`,�>┏�Jj83��ilN��3tv-s�s^$���:��䮱��)��)i5�%�a�9�q�%p����+��WN���_����ϱ��S�����p4D_��X�$��1�n��G���ͳ�X��5�/�g'+�,�r�й�>R�¥͹��`���]_�b��)��"���:��P0���`[�nc�)�E��
1o[��p%E�``��n
G�6�`��L7�+��"k�h2�o�M� �*�;i4|�+@�d1�d�
�e�����	�3U�N.ps��=@~h��0�d"��'166?�)���]��&ӆ� �����9�Ob��T!�k�{��v���i2HVj�p�u\��y83�JL y�K�F�\O�(f�<�����>���$3�T/�8&��R�`�Oh2{H ږ6:Pb���!C���)�j��c��ԡ��5�t�z�6[��&��b�&�/m�S_b�P�k2|(�3]� ��M~�Qy8�L��Xw����D�ݨ����3:m(	��Ώ��,2:J(���vX��2���'�b4��5^.��X{D��iA_�xr�s�:����N�q�n�#���:{�����.��f/8x'{����EspԴ�K�;�����d��>��y=E5F�L(Z \���e���Lf-�:L5��;��D�YB�����X��&����ԏEb�ɨ����!`�p�t�;j-4���}nwN��##B�A���l�q]`�ȈP0(�}[`��!�A�,����J�<���X���_��H�� K�cd�pR�W���1�dB)�7�����]��&SG���>�w2`������_�	��      �   �   x�3�4�44261�T1JT14P1/�prH��p����0)�/),O�q��
s�L7
r�O.L4I͏L,I6��H�J+K�L�H�-�IuHI-�K��j �1~dd`d�k`�kd�`hiejfeb�gnhfjf�i����� �i$�      �   m  x���An1EיS��l�N/{��`,航T���4S(EU�(�Xy����}���~���2<�WD�I՘j�T5���"��Ī���긻�������W�������	�A?�����f���%:%�+*��j�׫aw��s���H
yBԐ���}Fv��@ub� v�.�r�=����EgB�U�%�|�B�[*Ui��h�F:�m5�&� R�k��<��O��od��{�������|���h�>7��t^{,��g�g��h��cxȲA��&>F��G�}+!u�y�[�S�2c��asp���w��o]�ptw�\�MА�V���e��ccښ      �   /   x�3�t,N-���D\F�~�y���9R��SS2󰫈���� �f�     