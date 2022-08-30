PGDMP                          z         	   dblaporan    14.5    14.5 1    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16397 	   dblaporan    DATABASE     l   CREATE DATABASE dblaporan WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dblaporan;
                postgres    false            �            1259    16398    laporan_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan (
    id integer NOT NULL,
    id_kota character varying(15),
    id_kelurahan character varying(15),
    id_kecamatan character varying(15),
    kegiatan text,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_by character varying,
    update_at timestamp without time zone,
    tanggal date
);
 $   DROP TABLE public.laporan_kegiatan;
       public         heap    postgres    false            �            1259    16405    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    16406    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
    id integer NOT NULL,
    tanggal_kejadian date,
    waktu_kejadian timestamp without time zone,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying,
    alamat_lengkap text,
    id_jenis_kejadian integer,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi_lain integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 $   DROP TABLE public.laporan_kejadian;
       public         heap    postgres    false            �            1259    16413    laporan_kejadian_dokumentasi    TABLE     �  CREATE TABLE public.laporan_kejadian_dokumentasi (
    id integer NOT NULL,
    id_laporan integer,
    dir_file character varying,
    created_at timestamp without time zone,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 0   DROP TABLE public.laporan_kejadian_dokumentasi;
       public         heap    postgres    false            �            1259    16419    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    16420    laporan_kejadian_jenis_bantuan    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_bantuan (
    id integer NOT NULL,
    id_laporan integer NOT NULL,
    id_bantuan_satpol integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    id_bantuan_instansi_terkait integer
);
 2   DROP TABLE public.laporan_kejadian_jenis_bantuan;
       public         heap    postgres    false            �            1259    16427 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16428    laporan_kejadian_korban_jiwa    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_jiwa (
    id integer NOT NULL,
    id_laporan integer NOT NULL,
    id_korban_jiwa integer,
    jumlah_korban_pria integer,
    jumlah_korban_wanita integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 0   DROP TABLE public.laporan_kejadian_korban_jiwa;
       public         heap    postgres    false            �            1259    16435 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_dokumentasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    16436 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16437     laporan_kejadian_korban_material    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_material (
    id integer NOT NULL,
    id_laporan integer NOT NULL,
    id_korban integer,
    jumlah_korban integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 4   DROP TABLE public.laporan_kejadian_korban_material;
       public         heap    postgres    false            �            1259    16444 '   laporan_kejadian_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16445    laporan_pengawasan    TABLE       CREATE TABLE public.laporan_pengawasan (
    id integer NOT NULL,
    tanggal_pelaporan date,
    id_kota integer,
    id_kecamatan integer,
    id_kelurahan integer,
    deskripsi text,
    id_jenis_pengawasan integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 &   DROP TABLE public.laporan_pengawasan;
       public         heap    postgres    false            �            1259    16452    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16453    laporan_ppns    TABLE     =  CREATE TABLE public.laporan_ppns (
    id integer NOT NULL,
    id_nama character varying,
    nip integer,
    golongan character varying,
    sekep_ppns character varying,
    tempat_tugas character varying,
    tahun_diklat timestamp without time zone,
    keterangan text,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
     DROP TABLE public.laporan_ppns;
       public         heap    postgres    false            �            1259    16460    laporan_ppns_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_ppns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_ppns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16461    laporan_tamu_daerah    TABLE     �  CREATE TABLE public.laporan_tamu_daerah (
    id integer NOT NULL,
    tanggal_kunjungan date,
    waktu_mulai_kunjungan timestamp without time zone,
    waktu_selesai_kunjungan timestamp without time zone,
    asal_instansi text,
    jml_pengunjung numeric,
    maksud_dan_tujuan text,
    pejabat_penerima_kunjungan text,
    tempat_kunjungan text,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 '   DROP TABLE public.laporan_tamu_daerah;
       public         heap    postgres    false            �            1259    16466    laporan_tamu_daerah_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_tamu_daerah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_tamu_daerah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            2          0    16398    laporan_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan (id, id_kota, id_kelurahan, id_kecamatan, kegiatan, is_deleted, deleted_by, deleted_at, created_by, created_at, update_by, update_at, tanggal) FROM stdin;
    public          postgres    false    209   �M       4          0    16406    laporan_kejadian 
   TABLE DATA           7  COPY public.laporan_kejadian (id, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, id_jenis_kejadian, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi_lain, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    211   `N       5          0    16413    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    212   }N       7          0    16420    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, id_laporan, id_bantuan_satpol, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, id_bantuan_instansi_terkait) FROM stdin;
    public          postgres    false    214   �N       9          0    16428    laporan_kejadian_korban_jiwa 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_jiwa (id, id_laporan, id_korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    216   �N       <          0    16437     laporan_kejadian_korban_material 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_material (id, id_laporan, id_korban, jumlah_korban, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    219   �N       >          0    16445    laporan_pengawasan 
   TABLE DATA           �   COPY public.laporan_pengawasan (id, tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    221   �N       @          0    16453    laporan_ppns 
   TABLE DATA           �   COPY public.laporan_ppns (id, id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    223   O       B          0    16461    laporan_tamu_daerah 
   TABLE DATA           (  COPY public.laporan_tamu_daerah (id, tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    225   +O       J           0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    210            K           0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    213            L           0    0 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_bantuan_id_seq', 1, false);
          public          postgres    false    215            M           0    0 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq', 1, false);
          public          postgres    false    217            N           0    0 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE SET     S   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq1', 1, false);
          public          postgres    false    218            O           0    0 '   laporan_kejadian_korban_material_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kejadian_korban_material_id_seq', 1, false);
          public          postgres    false    220            P           0    0    laporan_pengawasan_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, false);
          public          postgres    false    222            Q           0    0    laporan_ppns_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.laporan_ppns_id_seq', 1, false);
          public          postgres    false    224            R           0    0    laporan_tamu_daerah_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.laporan_tamu_daerah_id_seq', 1, false);
          public          postgres    false    226            �           2606    16468 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    221            �           2606    16470 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    209            �           2606    16472 B   laporan_kejadian_jenis_bantuan laporan_kejadian_jenis_bantuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan
    ADD CONSTRAINT laporan_kejadian_jenis_bantuan_pkey PRIMARY KEY (id_laporan);
 l   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan DROP CONSTRAINT laporan_kejadian_jenis_bantuan_pkey;
       public            postgres    false    214            �           2606    16474 >   laporan_kejadian_dokumentasi laporan_kejadian_korban_jiwa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey;
       public            postgres    false    212            �           2606    16476 ?   laporan_kejadian_korban_jiwa laporan_kejadian_korban_jiwa_pkey1 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey1 PRIMARY KEY (id_laporan);
 i   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey1;
       public            postgres    false    216            �           2606    16478 F   laporan_kejadian_korban_material laporan_kejadian_korban_material_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_korban_material
    ADD CONSTRAINT laporan_kejadian_korban_material_pkey PRIMARY KEY (id_laporan);
 p   ALTER TABLE ONLY public.laporan_kejadian_korban_material DROP CONSTRAINT laporan_kejadian_korban_material_pkey;
       public            postgres    false    219            �           2606    16480 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    211            �           2606    16489    laporan_ppns laporan_ppns_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.laporan_ppns
    ADD CONSTRAINT laporan_ppns_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.laporan_ppns DROP CONSTRAINT laporan_ppns_pkey;
       public            postgres    false    223            �           2606    16484 ,   laporan_tamu_daerah laporan_tamu_daerah_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.laporan_tamu_daerah
    ADD CONSTRAINT laporan_tamu_daerah_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.laporan_tamu_daerah DROP CONSTRAINT laporan_tamu_daerah_pkey;
       public            postgres    false    225            2   �   x�m���@Eם��fҖy�,ݘ��M1�(11��1���v��s˰������8�����r�Ln��5�}�m�d�-�vI.�3��ٮ�+�&֜���2� �㔊�Cmkʈ��\��/��	��f��>��]d����2��^����B�V'���R�Ư?�      4      x������ � �      5      x������ � �      7      x������ � �      9      x������ � �      <      x������ � �      >      x������ � �      @      x������ � �      B      x������ � �     