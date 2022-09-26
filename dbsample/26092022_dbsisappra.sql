PGDMP                         z         
   dbsisappra    14.5    14.5 J   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25854 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    27445 
   auth_token    TABLE     �   CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pengguna character varying NOT NULL,
    token character varying NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.auth_token;
       public         heap    postgres    false            �            1259    27451    auth_token_id_seq    SEQUENCE     �   ALTER TABLE public.auth_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    27452    dashboard_kejadian    TABLE     �  CREATE TABLE public.dashboard_kejadian (
    id integer NOT NULL,
    nama character varying,
    lat character varying,
    long character varying,
    kota character varying,
    kecamatan character varying,
    kelurahan character varying,
    jenis_kejadian character varying,
    tanggal_awal_kejadian date,
    tanggal_akhir_kejadian date,
    jumlah_korban_jiwa integer,
    jumlah_korban_materiil integer,
    is_deleted integer
);
 &   DROP TABLE public.dashboard_kejadian;
       public         heap    postgres    false            �            1259    27457    dashboard_kepegawaian    TABLE     B  CREATE TABLE public.dashboard_kepegawaian (
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
       public         heap    postgres    false            �            1259    27463 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE     �   ALTER TABLE public.dashboard_kepegawaian ALTER COLUMN id_pegawai ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_kepegawaian_baru_id_pegawai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    27464 !   dashboard_penegakan_perda_perkada    TABLE     �   CREATE TABLE public.dashboard_penegakan_perda_perkada (
    id_perda integer NOT NULL,
    kasus_perda character varying,
    jenis_pelanggaran_perda character varying,
    tanggal_kasus date
);
 5   DROP TABLE public.dashboard_penegakan_perda_perkada;
       public         heap    postgres    false            �            1259    27469    dashboard_plotting_anggota    TABLE     M  CREATE TABLE public.dashboard_plotting_anggota (
    id integer NOT NULL,
    kota_kab character varying,
    kecamatan character varying,
    kelurahan character varying,
    lokasi character varying,
    long character varying,
    lat character varying,
    total_jaga_pagi integer,
    total_jaga_sore integer,
    total_jaga_malam integer,
    rawan_terhadap character varying,
    pic character varying,
    pic_contact character varying,
    jam_jaga_pagi timestamp without time zone,
    jam_jaga_sore timestamp without time zone,
    jam_jaga_malam timestamp without time zone
);
 .   DROP TABLE public.dashboard_plotting_anggota;
       public         heap    postgres    false            �            1259    27474    dashboard_titik_rawan    TABLE     @  CREATE TABLE public.dashboard_titik_rawan (
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
       public         heap    postgres    false            U           1259    35653    dashboard_titik_reklame_citata    TABLE     +  CREATE TABLE public.dashboard_titik_reklame_citata (
    id integer NOT NULL,
    produk character varying,
    nama_perusahaan character varying,
    pic character varying,
    tgl_sk_terbit date,
    tgl_exp date,
    masa_berlaku character varying,
    lokasi character varying,
    kota character varying,
    kecamatan character varying,
    kelurahan character varying,
    lat character varying,
    long character varying,
    ukuran character varying,
    ketinggian character varying,
    keterangan character varying,
    is_deleted integer
);
 2   DROP TABLE public.dashboard_titik_reklame_citata;
       public         heap    postgres    false            V           1259    35660     dashboard_titik_reklame_satpolpp    TABLE     !  CREATE TABLE public.dashboard_titik_reklame_satpolpp (
    id integer NOT NULL,
    produk character varying,
    pemilik_reklame character varying,
    konstruksi_reklame character varying,
    nrk character varying,
    nama character varying,
    tgl_pengecekan date,
    kawasan_kendali character varying,
    status character varying,
    keterangan character varying,
    lokasi character varying,
    lat character varying,
    long character varying,
    posisi character varying,
    ukuran character varying,
    is_deleted integer
);
 4   DROP TABLE public.dashboard_titik_reklame_satpolpp;
       public         heap    postgres    false            �            1259    27479    dashboard_tramtibum    TABLE     �   CREATE TABLE public.dashboard_tramtibum (
    id integer NOT NULL,
    kasus_tramtibum character varying,
    jenis_pelanggaran_perda_tramtibum character varying,
    kegiatan_tramtibum character varying,
    date integer
);
 '   DROP TABLE public.dashboard_tramtibum;
       public         heap    postgres    false            �            1259    27484    dashboard_wasdak_ppkm    TABLE     �   CREATE TABLE public.dashboard_wasdak_ppkm (
    id integer NOT NULL,
    tanggal_wasdak date,
    jenis_wasdak character varying
);
 )   DROP TABLE public.dashboard_wasdak_ppkm;
       public         heap    postgres    false            �            1259    27489    dashboard_wasdak_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.dashboard_wasdak_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_wasdak_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    27490    hirarki_kepegawaian    TABLE     �  CREATE TABLE public.hirarki_kepegawaian (
    id integer NOT NULL,
    no_pegawai character varying NOT NULL,
    level integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 '   DROP TABLE public.hirarki_kepegawaian;
       public         heap    postgres    false            �            1259    27497    hirarki_kepegawaian_bawahan    TABLE       CREATE TABLE public.hirarki_kepegawaian_bawahan (
    id integer NOT NULL,
    no_pegawai_atasan character varying NOT NULL,
    no_pegawai character varying NOT NULL,
    level integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_atasan integer NOT NULL
);
 /   DROP TABLE public.hirarki_kepegawaian_bawahan;
       public         heap    postgres    false            �            1259    27504 "   hirarki_kepegawaian_bawahan_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki_kepegawaian_bawahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_kepegawaian_bawahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    27505    hirarki_kepegawaian_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki_kepegawaian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_kepegawaian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    27506    jenis_sarana_prasarana    TABLE     �  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            �            1259    27512    kepegawaian_non_pns    TABLE       CREATE TABLE public.kepegawaian_non_pns (
    id integer NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    agama integer,
    nik character varying,
    no_kk character varying,
    status_perkawinan character varying,
    no_hp character varying,
    sesuai_ktp_alamat character varying,
    sesuai_ktp_rtrw character varying,
    sesuai_ktp_provinsi character varying,
    sesuai_ktp_kabkota character varying,
    sesuai_ktp_kecamatan character varying,
    sesuai_ktp_kelurahan character varying,
    domisili_alamat character varying,
    domisili_rtrw character varying,
    domisili_provinsi character varying,
    domisili_kabkota character varying,
    domisili_kecamatan character varying,
    domisili_kelurahan character varying,
    kepegawaian_nptt_npjlp character varying,
    kepegawaian_nip character varying,
    kepegawaian_golongan integer,
    kepegawaian_tmtpangkat date,
    kepegawaian_pendidikan_pada_sk integer,
    kepegawaian_jabatan integer,
    kepegawaian_eselon integer,
    kepegawaian_tempat_tugas character varying,
    kepegawaian_subbag_seksi_kecamatan character varying,
    kepegawaian_status_pegawai character varying,
    kepegawaian_no_rekening character varying,
    kepegawaian_no_karpeg character varying,
    kepegawaian_no_kasirkasur character varying,
    kepegawaian_no_taspen character varying,
    kepegawaian_npwp character varying,
    kepegawaian_no_bpjs_askes character varying,
    kepegawaian_tmt_cpns date,
    kepegawaian_sk_cpns character varying,
    kepegawaian_tmt_pns date,
    kepegawaian_tgl_sk_pns date,
    kepegawaian_sk_pns character varying,
    kepegawaian_no_sk_pangkat_terakhir character varying,
    kepegawaian_tgl_sk_pangkat_terakhir date,
    kepegawaian_sk_pangkat_terakhir character varying,
    kepegawaian_diklat_pol_pp_dasar character varying,
    kepegawaian_diklat_pol_pp_dasar_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_dasar_file_sertifikat character varying,
    kepegawaian_diklat_pol_pp_strutural character varying,
    kepegawaian_diklat_pol_pp_strutural_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_strutural_file_sertifikat character varying,
    kepegawaian_diklat_pol_pp_ppns character varying,
    kepegawaian_diklat_pol_pp_ppns_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_ppns_file_sertifikat character varying,
    kepegawaian_diklat_fungsional_pol_pp character varying,
    kepegawaian_diklat_fungsional_pol_pp_no_sertifikat character varying,
    kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat date,
    kepegawaian_diklat_fungsional_pol_pp_file_sertifikat character varying,
    foto character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    kepegawaian_pangkat integer,
    kepegawaian_kelurahan character varying,
    keterangan_pensiun character varying
);
 '   DROP TABLE public.kepegawaian_non_pns;
       public         heap    postgres    false            �            1259    27519    kepegawaian_non_pns_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    27520    kepegawaian_non_pns_keluarga    TABLE     I  CREATE TABLE public.kepegawaian_non_pns_keluarga (
    id integer NOT NULL,
    hubungan character varying NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 0   DROP TABLE public.kepegawaian_non_pns_keluarga;
       public         heap    postgres    false            �            1259    27527 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    27528    kepegawaian_non_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_non_pns_pendidikan (
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
 2   DROP TABLE public.kepegawaian_non_pns_pendidikan;
       public         heap    postgres    false            �            1259    27535 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    27536    kepegawaian_pns    TABLE       CREATE TABLE public.kepegawaian_pns (
    id integer NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    agama integer,
    nik character varying,
    no_kk character varying,
    status_perkawinan character varying,
    no_hp character varying,
    sesuai_ktp_alamat character varying,
    sesuai_ktp_rtrw character varying,
    sesuai_ktp_provinsi character varying,
    sesuai_ktp_kabkota character varying,
    sesuai_ktp_kecamatan character varying,
    sesuai_ktp_kelurahan character varying,
    domisili_alamat character varying,
    domisili_rtrw character varying,
    domisili_provinsi character varying,
    domisili_kabkota character varying,
    domisili_kecamatan character varying,
    domisili_kelurahan character varying,
    kepegawaian_nrk character varying,
    kepegawaian_nip character varying,
    kepegawaian_golongan integer,
    kepegawaian_tmtpangkat date,
    kepegawaian_pendidikan_pada_sk integer,
    kepegawaian_jabatan integer,
    kepegawaian_eselon integer,
    kepegawaian_tempat_tugas character varying,
    kepegawaian_subbag_seksi_kecamatan character varying,
    kepegawaian_status_pegawai character varying,
    kepegawaian_no_rekening character varying,
    kepegawaian_no_karpeg character varying,
    kepegawaian_no_kasirkasur character varying,
    kepegawaian_no_taspen character varying,
    kepegawaian_npwp character varying,
    kepegawaian_no_bpjs_askes character varying,
    kepegawaian_tmt_cpns date,
    kepegawaian_sk_cpns character varying,
    kepegawaian_tmt_pns date,
    kepegawaian_tgl_sk_pns date,
    kepegawaian_sk_pns character varying,
    kepegawaian_no_sk_pangkat_terakhir character varying,
    kepegawaian_tgl_sk_pangkat_terakhir date,
    kepegawaian_sk_pangkat_terakhir character varying,
    kepegawaian_diklat_pol_pp_dasar character varying,
    kepegawaian_diklat_pol_pp_dasar_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_dasar_file_sertifikat character varying,
    kepegawaian_diklat_pol_pp_strutural character varying,
    kepegawaian_diklat_pol_pp_strutural_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_strutural_file_sertifikat character varying,
    kepegawaian_diklat_pol_pp_ppns character varying,
    kepegawaian_diklat_pol_pp_ppns_no_sertifikat character varying,
    kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat date,
    kepegawaian_diklat_pol_pp_ppns_file_sertifikat character varying,
    kepegawaian_diklat_fungsional_pol_pp character varying,
    kepegawaian_diklat_fungsional_pol_pp_no_sertifikat character varying,
    kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat date,
    kepegawaian_diklat_fungsional_pol_pp_file_sertifikat character varying,
    foto character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    kepegawaian_pangkat integer,
    kepegawaian_kelurahan character varying,
    keterangan_pensiun character varying
);
 #   DROP TABLE public.kepegawaian_pns;
       public         heap    postgres    false            �            1259    27543    kepegawaian_pns_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    27544    kepegawaian_pns_keluarga    TABLE     E  CREATE TABLE public.kepegawaian_pns_keluarga (
    id integer NOT NULL,
    hubungan character varying NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    id_pegawai integer NOT NULL
);
 ,   DROP TABLE public.kepegawaian_pns_keluarga;
       public         heap    postgres    false            �            1259    27551    kepegawaian_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    27552    kepegawaian_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_pns_pendidikan (
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
       public         heap    postgres    false            �            1259    27559 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    27560    kondisi_sarana_prasarana    TABLE     �  CREATE TABLE public.kondisi_sarana_prasarana (
    id integer NOT NULL,
    kondisi_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 ,   DROP TABLE public.kondisi_sarana_prasarana;
       public         heap    postgres    false            �            1259    27566 
   kontak_pic    TABLE     �  CREATE TABLE public.kontak_pic (
    id integer NOT NULL,
    email character varying NOT NULL,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by integer,
    status_pic integer NOT NULL
);
    DROP TABLE public.kontak_pic;
       public         heap    postgres    false            �            1259    27573    kontak_pic_id_seq    SEQUENCE     �   ALTER TABLE public.kontak_pic ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kontak_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    27574    laporan_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan (
    id integer NOT NULL,
    pelaksana_bidang_wilayah character varying,
    tindak_lanjut character varying,
    administrasi character varying,
    peringatan character varying,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    penutupan_atau_penyegelan character varying,
    pencabutan_izin character varying,
    yang_lainnya character varying,
    denda character varying,
    keterangan text,
    penghalauan character varying,
    pembubaran character varying,
    pengusiran character varying,
    teguran_tertulis character varying,
    penyegelan character varying,
    penghentian_kegiatan character varying,
    pembongkaran character varying,
    ditertibkan character varying,
    bongkar_sendiri character varying,
    pemusnahan character varying,
    pecabutan_izin character varying,
    pembekuan_sementara_izin character varying,
    razia character varying,
    penjemputan character varying,
    penangkapan character varying,
    penyitaan character varying,
    pembersihan character varying,
    pencopotan_pelepasan_pencabutan character varying,
    penyidikan character varying,
    kerja_sosial character varying,
    denda_administratif character varying,
    terbit_izin character varying,
    dikembalikan character varying,
    belum_diterbitkan character varying,
    lain_lain character varying,
    tidak_ditemukan character varying,
    pengadilan_yustisi character varying,
    non_pengadilan character varying,
    penghentian_kegiatan_sementara_1x24jam character varying,
    penghentian_kegiatan_sementara_3x24jam character varying,
    penghentian_kegiatan_sementara_7x24jam character varying
);
 $   DROP TABLE public.laporan_kegiatan;
       public         heap    postgres    false            �            1259    27581    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    27582    laporan_kegiatan_jenis_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_kegiatan (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    nama character varying NOT NULL
);
 3   DROP TABLE public.laporan_kegiatan_jenis_kegiatan;
       public         heap    postgres    false            �            1259    27589 +   laporan_kegiatan_jenis_pelanggaran_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_pelanggaran_bangunan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 ?   DROP TABLE public.laporan_kegiatan_jenis_pelanggaran_bangunan;
       public         heap    postgres    false            �            1259    27596 #   laporan_kegiatan_jenis_penyelesaian    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_penyelesaian (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 7   DROP TABLE public.laporan_kegiatan_jenis_penyelesaian;
       public         heap    postgres    false            �            1259    27603 ,   laporan_kegiatan_pelanggaran_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    updated_by character varying,
    updated_at timestamp without time zone
);
 @   DROP TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol;
       public         heap    postgres    false            �            1259    27610 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    27611     laporan_kegiatan_penertiban_ppkm    TABLE     �  CREATE TABLE public.laporan_kegiatan_penertiban_ppkm (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by bit varying[],
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 4   DROP TABLE public.laporan_kegiatan_penertiban_ppkm;
       public         heap    postgres    false            �            1259    27618 '   laporan_kegiatan_penertiban_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan_penertiban_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penertiban_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    27619    laporan_kegiatan_penindakan    TABLE     �  CREATE TABLE public.laporan_kegiatan_penindakan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    created_at timestamp without time zone,
    updated_by character varying,
    updated_at timestamp without time zone
);
 /   DROP TABLE public.laporan_kegiatan_penindakan;
       public         heap    postgres    false            �            1259    27626 +   laporan_kegiatan_penindakan_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_penindakan_minuman_alkohol (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    updated_by character varying,
    updated_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_by character varying,
    deleted_at timestamp without time zone
);
 ?   DROP TABLE public.laporan_kegiatan_penindakan_minuman_alkohol;
       public         heap    postgres    false            �            1259    27633 2   laporan_kegiatan_penindakan_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_penindakan_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penindakan_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    27634 -   laporan_kegiatan_penyelesaian_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_minuman_alkohol (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 A   DROP TABLE public.laporan_kegiatan_penyelesaian_minuman_alkohol;
       public         heap    postgres    false            �            1259    27641 4   laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_penyelesaian_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    252            �            1259    27642 1   laporan_kegiatan_penyelesaian_penertiban_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_penertiban_bangunan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone,
    updated_by character varying,
    updated_at time without time zone
);
 E   DROP TABLE public.laporan_kegiatan_penyelesaian_penertiban_bangunan;
       public         heap    postgres    false            �            1259    27649 "   laporan_kegiatan_penyelesaian_ppkm    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_ppkm (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 6   DROP TABLE public.laporan_kegiatan_penyelesaian_ppkm;
       public         heap    postgres    false                        1259    27656 )   laporan_kegiatan_penyelesaian_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan_penyelesaian_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penyelesaian_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    255                       1259    27657    laporan_kegiatan_proses    TABLE     �  CREATE TABLE public.laporan_kegiatan_proses (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 +   DROP TABLE public.laporan_kegiatan_proses;
       public         heap    postgres    false                       1259    27664    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    bidang_wilayah character varying,
    jumlah_kejadian integer,
    banjir character varying,
    hewan_buas_dan_berbisa character varying,
    kebakaran character varying,
    kecelakaan character varying,
    pendampingan_kekerasan_pada_perempua_dan_anak character varying,
    kerusakan_konstruksi character varying,
    kriminalitas character varying,
    pembunuhan character varying,
    penemuan_mayat character varying,
    penyelamatan_orang character varying,
    pohon_tumbang character varying,
    tawuran character varying,
    terorisme character varying,
    unjuk_rasa character varying,
    keterangan character varying
);
 $   DROP TABLE public.laporan_kejadian;
       public         heap    postgres    false                       1259    27671 2   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak    TABLE     �  CREATE TABLE public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 H   DROP TABLE public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak";
       public         heap    postgres    false                       1259    27678    laporan_kejadian_banjir    TABLE     �  CREATE TABLE public.laporan_kejadian_banjir (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian timestamp without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    alamat_lengkap text,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer,
    ketinggian_air integer,
    jumlah_pengungsi integer,
    jumlah_pengungsi_per_kk integer,
    lokasi_penampungan character varying,
    lokasi_dapur_umum character varying,
    jenis_kejadian character varying
);
 +   DROP TABLE public.laporan_kejadian_banjir;
       public         heap    postgres    false                       1259    27685    laporan_kejadian_banjir_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_banjir ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_banjir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    260                       1259    27686    laporan_kejadian_dokumentasi    TABLE     �  CREATE TABLE public.laporan_kejadian_dokumentasi (
    id integer NOT NULL,
    id_laporan integer,
    dir_file character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying
);
 0   DROP TABLE public.laporan_kejadian_dokumentasi;
       public         heap    postgres    false                       1259    27693    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    258                       1259    27694    laporan_kejadian_jenis_bantuan    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_bantuan (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    nama character varying
);
 2   DROP TABLE public.laporan_kejadian_jenis_bantuan;
       public         heap    postgres    false            	           1259    27701 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    264            
           1259    27702    laporan_kejadian_jenis_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_kejadian (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 3   DROP TABLE public.laporan_kejadian_jenis_kejadian;
       public         heap    postgres    false                       1259    27709 &   laporan_kejadian_jenis_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    266                       1259    27710 +   laporan_kejadian_jenis_kekerasan_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_kekerasan_unjuk_rasa (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 ?   DROP TABLE public.laporan_kejadian_jenis_kekerasan_unjuk_rasa;
       public         heap    postgres    false                       1259    27717    laporan_kejadian_kebakaran    TABLE     �  CREATE TABLE public.laporan_kejadian_kebakaran (
    id integer NOT NULL,
    id_tanggal_kejadian date,
    id_waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    id_alamat_lengkap text,
    id_jenis_kejadian character varying,
    id_uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying
);
 .   DROP TABLE public.laporan_kejadian_kebakaran;
       public         heap    postgres    false                       1259    27724 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_kebakaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kebakaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    269                       1259    27725 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at time without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying NOT NULL,
    alamat_lengkap text,
    jenis_kegiatan character varying,
    uraian_kejadian text,
    jumla_personil_satpol_pp integer,
    jumlah_personil_instansi_lain integer
);
 F   DROP TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak;
       public         heap    postgres    false                       1259    27732 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    271                       1259    27733 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_dokumentasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    262                       1259    27734     laporan_kejadian_korban_material    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_material (
    id integer NOT NULL,
    id_laporan integer,
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
       public         heap    postgres    false                       1259    27741 '   laporan_kejadian_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    274                       1259    27742 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone
);
 P   DROP TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak;
       public         heap    postgres    false                       1259    27749 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    276                       1259    27750 ,   laporan_kejadian_sumber_informasi_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone[]
);
 @   DROP TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa;
       public         heap    postgres    false                       1259    27757 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    278                       1259    27758    laporan_kejadian_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal_kejadian date,
    waktu_kejadian time without time zone,
    id_kota character varying,
    id_kecamatan character varying NOT NULL,
    id_kelurahan character varying,
    alamat_lengkap text,
    jenis_kegiatan character varying,
    uraian_kejadian text,
    jumlah_personil_satpol_pp integer,
    jumlah_personil_instansi integer
);
 /   DROP TABLE public.laporan_kejadian_unjuk_rasa;
       public         heap    postgres    false                       1259    27765 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    280                       1259    27766 )   laporan_kejadian_unjuk_rasa_tindak_lanjut    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa_tindak_lanjut (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_by character varying,
    deleted_at timestamp without time zone,
    created_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by character varying,
    updated_at timestamp without time zone,
    jumlah_masa integer,
    tuntutan character varying,
    penanggung_jawab_unras character varying,
    jenis_bantuan_satpol_pp character varying,
    jenis_bantuan_instansii_terkait character varying,
    korban_jiwa character varying,
    jumlah_korban_pria integer,
    jumlah_korban_wanita integer
);
 =   DROP TABLE public.laporan_kejadian_unjuk_rasa_tindak_lanjut;
       public         heap    postgres    false                       1259    27773    laporan_pengawasan    TABLE     �  CREATE TABLE public.laporan_pengawasan (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying(15),
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    nrk integer,
    nama character varying,
    tgl_pengecekan date,
    share_location character varying,
    alamat character varying,
    lokasi_tiang character varying,
    kawasan_kendali character varying,
    status character varying,
    ukuran character varying,
    pemilik_reklame character varying,
    konstruksi_reklame character varying,
    konten_iklan character varying
);
 &   DROP TABLE public.laporan_pengawasan;
       public         heap    postgres    false                       1259    27780    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    283                       1259    27781    laporan_tamu_daerah    TABLE     �  CREATE TABLE public.laporan_tamu_daerah (
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
    updated_by character varying,
    id integer NOT NULL,
    pelaksanaan character varying
);
 '   DROP TABLE public.laporan_tamu_daerah;
       public         heap    postgres    false                       1259    27788    laporan_tamu_daerah_dok    TABLE     x  CREATE TABLE public.laporan_tamu_daerah_dok (
    id integer NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at date,
    updated_by character varying,
    dir_file character varying
);
 +   DROP TABLE public.laporan_tamu_daerah_dok;
       public         heap    postgres    false                       1259    27795    laporan_tamu_daerah_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_tamu_daerah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_tamu_daerah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285                        1259    27796    master_agama    TABLE     �  CREATE TABLE public.master_agama (
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
       public         heap    postgres    false            !           1259    27803    master_agama_id_seq    SEQUENCE     �   ALTER TABLE public.master_agama ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_agama_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    288            W           1259    35669    master_diklat    TABLE     �  CREATE TABLE public.master_diklat (
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
 !   DROP TABLE public.master_diklat;
       public         heap    postgres    false            X           1259    35676    master_diklat_id_seq    SEQUENCE     �   ALTER TABLE public.master_diklat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_diklat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    343            Q           1259    35636    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_eselon integer
);
 !   DROP TABLE public.master_eselon;
       public         heap    postgres    false            R           1259    35643    master_eselon_id_seq    SEQUENCE     �   ALTER TABLE public.master_eselon ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_eselon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    337            "           1259    27812    master_golongan    TABLE     �  CREATE TABLE public.master_golongan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_golongan integer
);
 #   DROP TABLE public.master_golongan;
       public         heap    postgres    false            #           1259    27819    master_golongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_golongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_golongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    290            $           1259    27820    master_jabatan    TABLE     �  CREATE TABLE public.master_jabatan (
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
       public         heap    postgres    false            %           1259    27827    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    292            &           1259    27828    master_jenis_bantuan    TABLE     �  CREATE TABLE public.master_jenis_bantuan (
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
 (   DROP TABLE public.master_jenis_bantuan;
       public         heap    postgres    false            '           1259    27835    master_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    294            (           1259    27836    master_jenis_kegiatan    TABLE     �  CREATE TABLE public.master_jenis_kegiatan (
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
 )   DROP TABLE public.master_jenis_kegiatan;
       public         heap    postgres    false            )           1259    27843    master_jenis_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    296            *           1259    27844    master_jenis_kejadian    TABLE     �  CREATE TABLE public.master_jenis_kejadian (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 )   DROP TABLE public.master_jenis_kejadian;
       public         heap    postgres    false            +           1259    27851    master_jenis_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    298            ,           1259    27852    master_jenis_kekerasan    TABLE     �  CREATE TABLE public.master_jenis_kekerasan (
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
 *   DROP TABLE public.master_jenis_kekerasan;
       public         heap    postgres    false            -           1259    27859    master_jenis_kekerasan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kekerasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kekerasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    300            .           1259    27860    master_jenis_korban_jiwa    TABLE     �  CREATE TABLE public.master_jenis_korban_jiwa (
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
 ,   DROP TABLE public.master_jenis_korban_jiwa;
       public         heap    postgres    false            /           1259    27867    master_jenis_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    302            0           1259    27868    master_jenis_korban_material    TABLE     �  CREATE TABLE public.master_jenis_korban_material (
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
 0   DROP TABLE public.master_jenis_korban_material;
       public         heap    postgres    false            1           1259    27875 #   master_jenis_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    304            S           1259    35644    master_jenis_pelanggaran    TABLE     �  CREATE TABLE public.master_jenis_pelanggaran (
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
       public         heap    postgres    false            T           1259    35651    master_jenis_pelanggaran_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pelanggaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pelanggaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    339            2           1259    27884    master_jenis_penertiban    TABLE     �  CREATE TABLE public.master_jenis_penertiban (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    kode character varying
);
 +   DROP TABLE public.master_jenis_penertiban;
       public         heap    postgres    false            3           1259    27891    master_jenis_penertiban_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penertiban ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penertiban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    306            4           1259    27892    master_jenis_penindakan    TABLE     �  CREATE TABLE public.master_jenis_penindakan (
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
 +   DROP TABLE public.master_jenis_penindakan;
       public         heap    postgres    false            5           1259    27899    master_jenis_penindakan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penindakan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penindakan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    308            6           1259    27900    master_jenis_penyelesaian    TABLE     �  CREATE TABLE public.master_jenis_penyelesaian (
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
 -   DROP TABLE public.master_jenis_penyelesaian;
       public         heap    postgres    false            7           1259    27907     master_jenis_penyelesaian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penyelesaian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penyelesaian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    310            8           1259    27908    master_jenis_perda_perkada    TABLE     �  CREATE TABLE public.master_jenis_perda_perkada (
    id integer NOT NULL,
    judul character varying NOT NULL,
    deskripsi character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 .   DROP TABLE public.master_jenis_perda_perkada;
       public         heap    postgres    false            9           1259    27915 !   master_jenis_perda_perkada_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_perda_perkada ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_perda_perkada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    312            :           1259    27916    master_jenis_pertolongan    TABLE     �  CREATE TABLE public.master_jenis_pertolongan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 ,   DROP TABLE public.master_jenis_pertolongan;
       public         heap    postgres    false            ;           1259    27923    master_jenis_pertolongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pertolongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pertolongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    314            <           1259    27924    master_kecamatan    TABLE     �  CREATE TABLE public.master_kecamatan (
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
    kode_kota character varying
);
 $   DROP TABLE public.master_kecamatan;
       public         heap    postgres    false            =           1259    27931    master_kecamatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kecamatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    316            >           1259    27932    master_kelurahan    TABLE     �  CREATE TABLE public.master_kelurahan (
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
       public         heap    postgres    false            ?           1259    27939    master_kelurahan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kelurahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    318            @           1259    27940    master_kota    TABLE     �  CREATE TABLE public.master_kota (
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
       public         heap    postgres    false            A           1259    27947    master_kota_id_seq    SEQUENCE     �   ALTER TABLE public.master_kota ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    320            B           1259    27948    master_pangkat    TABLE     �  CREATE TABLE public.master_pangkat (
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
       public         heap    postgres    false            C           1259    27955    master_pangkat_id_seq    SEQUENCE     �   ALTER TABLE public.master_pangkat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pangkat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    322            D           1259    27956    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
    id integer NOT NULL,
    nama character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    urutan_tingkat_pendidikan integer
);
 %   DROP TABLE public.master_pendidikan;
       public         heap    postgres    false            E           1259    27963    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    324            Y           1259    35677    master_skpd    TABLE     �  CREATE TABLE public.master_skpd (
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
    DROP TABLE public.master_skpd;
       public         heap    postgres    false            Z           1259    35684    master_skpd_id_seq    SEQUENCE     �   ALTER TABLE public.master_skpd ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_skpd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    345            F           1259    27964    master_sumber_informasi    TABLE     �  CREATE TABLE public.master_sumber_informasi (
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
 +   DROP TABLE public.master_sumber_informasi;
       public         heap    postgres    false            G           1259    27971    master_sumber_informasi_id_seq    SEQUENCE     �   ALTER TABLE public.master_sumber_informasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    326            H           1259    27972    master_tempat_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_pelaksanaan (
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
       public         heap    postgres    false            I           1259    27979     master_tempat_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    328            J           1259    27980    master_tempat_seksi_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_seksi_pelaksanaan (
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
       public         heap    postgres    false            K           1259    27987 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_seksi_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_seksi_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    330            L           1259    27988    pengguna    TABLE     K  CREATE TABLE public.pengguna (
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
       public         heap    postgres    false            M           1259    27996    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    332            N           1259    27997    sarana_prasarana    TABLE     C  CREATE TABLE public.sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana integer,
    status_sarana_prasarana integer,
    jumlah integer,
    kondisi integer,
    keterangan character varying,
    file_dokumentasi character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    sapras_date date
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false            O           1259    28004    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    334            P           1259    28005    status_sarana_prasarana    TABLE     �  CREATE TABLE public.status_sarana_prasarana (
    id integer NOT NULL,
    status_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    created_at timestamp without time zone,
    created_by character varying
);
 +   DROP TABLE public.status_sarana_prasarana;
       public         heap    postgres    false            Q          0    27445 
   auth_token 
   TABLE DATA           G   COPY public.auth_token (id, id_pengguna, token, create_at) FROM stdin;
    public          postgres    false    209   �J      S          0    27452    dashboard_kejadian 
   TABLE DATA           �   COPY public.dashboard_kejadian (id, nama, lat, long, kota, kecamatan, kelurahan, jenis_kejadian, tanggal_awal_kejadian, tanggal_akhir_kejadian, jumlah_korban_jiwa, jumlah_korban_materiil, is_deleted) FROM stdin;
    public          postgres    false    211   2S      T          0    27457    dashboard_kepegawaian 
   TABLE DATA           �   COPY public.dashboard_kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, usia, status_ppns, is_deleted) FROM stdin;
    public          postgres    false    212   ��      V          0    27464 !   dashboard_penegakan_perda_perkada 
   TABLE DATA           z   COPY public.dashboard_penegakan_perda_perkada (id_perda, kasus_perda, jenis_pelanggaran_perda, tanggal_kasus) FROM stdin;
    public          postgres    false    214   #�      W          0    27469    dashboard_plotting_anggota 
   TABLE DATA           �   COPY public.dashboard_plotting_anggota (id, kota_kab, kecamatan, kelurahan, lokasi, long, lat, total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam) FROM stdin;
    public          postgres    false    215   ��      X          0    27474    dashboard_titik_rawan 
   TABLE DATA           |   COPY public.dashboard_titik_rawan (id, lokasi, kota, kecamatan, kelurahan, lat, long, kategori, rawan_terhadap) FROM stdin;
    public          postgres    false    216   {�      �          0    35653    dashboard_titik_reklame_citata 
   TABLE DATA           �   COPY public.dashboard_titik_reklame_citata (id, produk, nama_perusahaan, pic, tgl_sk_terbit, tgl_exp, masa_berlaku, lokasi, kota, kecamatan, kelurahan, lat, long, ukuran, ketinggian, keterangan, is_deleted) FROM stdin;
    public          postgres    false    341   k      �          0    35660     dashboard_titik_reklame_satpolpp 
   TABLE DATA           �   COPY public.dashboard_titik_reklame_satpolpp (id, produk, pemilik_reklame, konstruksi_reklame, nrk, nama, tgl_pengecekan, kawasan_kendali, status, keterangan, lokasi, lat, long, posisi, ukuran, is_deleted) FROM stdin;
    public          postgres    false    342   �:      Y          0    27479    dashboard_tramtibum 
   TABLE DATA              COPY public.dashboard_tramtibum (id, kasus_tramtibum, jenis_pelanggaran_perda_tramtibum, kegiatan_tramtibum, date) FROM stdin;
    public          postgres    false    217   P      Z          0    27484    dashboard_wasdak_ppkm 
   TABLE DATA           Q   COPY public.dashboard_wasdak_ppkm (id, tanggal_wasdak, jenis_wasdak) FROM stdin;
    public          postgres    false    218   XQ      \          0    27490    hirarki_kepegawaian 
   TABLE DATA           �   COPY public.hirarki_kepegawaian (id, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    220   �Q      ]          0    27497    hirarki_kepegawaian_bawahan 
   TABLE DATA           �   COPY public.hirarki_kepegawaian_bawahan (id, no_pegawai_atasan, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_atasan) FROM stdin;
    public          postgres    false    221   #R      `          0    27506    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    224   uR      a          0    27512    kepegawaian_non_pns 
   TABLE DATA           O  COPY public.kepegawaian_non_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nptt_npjlp, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan, keterangan_pensiun) FROM stdin;
    public          postgres    false    225   [U      c          0    27520    kepegawaian_non_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    227   $G      e          0    27528    kepegawaian_non_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    229   AG      g          0    27536    kepegawaian_pns 
   TABLE DATA           D  COPY public.kepegawaian_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nrk, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan, keterangan_pensiun) FROM stdin;
    public          postgres    false    231   ^G      i          0    27544    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    233   ��      k          0    27552    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    235   �      m          0    27560    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    237   s�      n          0    27566 
   kontak_pic 
   TABLE DATA           �   COPY public.kontak_pic (id, email, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, status_pic) FROM stdin;
    public          postgres    false    238   ��      p          0    27574    laporan_kegiatan 
   TABLE DATA           <  COPY public.laporan_kegiatan (id, pelaksana_bidang_wilayah, tindak_lanjut, administrasi, peringatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, penutupan_atau_penyegelan, pencabutan_izin, yang_lainnya, denda, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pecabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam) FROM stdin;
    public          postgres    false    240   �      r          0    27582    laporan_kegiatan_jenis_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_kegiatan (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, nama) FROM stdin;
    public          postgres    false    242   ڿ      s          0    27589 +   laporan_kegiatan_jenis_pelanggaran_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_pelanggaran_bangunan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    243   ��      t          0    27596 #   laporan_kegiatan_jenis_penyelesaian 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_penyelesaian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    244   �      u          0    27603 ,   laporan_kegiatan_pelanggaran_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_pelanggaran_minuman_alkohol (id, nama, is_deleted, created_by, created_at, deleted_by, deleted_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    245   1�      w          0    27611     laporan_kegiatan_penertiban_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penertiban_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    247   N�      y          0    27619    laporan_kegiatan_penindakan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    249   k�      z          0    27626 +   laporan_kegiatan_penindakan_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan_minuman_alkohol (id, nama, is_deleted, updated_by, updated_at, created_by, created_at, deleted_by, deleted_at) FROM stdin;
    public          postgres    false    250   ��      |          0    27634 -   laporan_kegiatan_penyelesaian_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_minuman_alkohol (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    252   ��      ~          0    27642 1   laporan_kegiatan_penyelesaian_penertiban_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_penertiban_bangunan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    254   ��                0    27649 "   laporan_kegiatan_penyelesaian_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    255   ��      �          0    27657    laporan_kegiatan_proses 
   TABLE DATA           �   COPY public.laporan_kegiatan_proses (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    257   ��      �          0    27664    laporan_kejadian 
   TABLE DATA           �  COPY public.laporan_kejadian (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempua_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan) FROM stdin;
    public          postgres    false    258   �      �          0    27671 2   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    259   6�      �          0    27678    laporan_kejadian_banjir 
   TABLE DATA           �  COPY public.laporan_kejadian_banjir (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, ketinggian_air, jumlah_pengungsi, jumlah_pengungsi_per_kk, lokasi_penampungan, lokasi_dapur_umum, jenis_kejadian) FROM stdin;
    public          postgres    false    260   S�      �          0    27686    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    262   p�      �          0    27694    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nama) FROM stdin;
    public          postgres    false    264   ��      �          0    27702    laporan_kejadian_jenis_kejadian 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kejadian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    266   ��      �          0    27710 +   laporan_kejadian_jenis_kekerasan_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    268   ��      �          0    27717    laporan_kejadian_kebakaran 
   TABLE DATA           H  COPY public.laporan_kejadian_kebakaran (id, id_tanggal_kejadian, id_waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, id_alamat_lengkap, id_jenis_kejadian, id_uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    269   ��      �          0    27725 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak 
   TABLE DATA           U  COPY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumla_personil_satpol_pp, jumlah_personil_instansi_lain) FROM stdin;
    public          postgres    false    271   �      �          0    27734     laporan_kejadian_korban_material 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_material (id, id_laporan, id_korban, jumlah_korban, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    274   �      �          0    27742 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    276   ;�      �          0    27750 ,   laporan_kejadian_sumber_informasi_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    278   X�      �          0    27758    laporan_kejadian_unjuk_rasa 
   TABLE DATA           :  COPY public.laporan_kejadian_unjuk_rasa (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi) FROM stdin;
    public          postgres    false    280   u�      �          0    27766 )   laporan_kejadian_unjuk_rasa_tindak_lanjut 
   TABLE DATA           ;  COPY public.laporan_kejadian_unjuk_rasa_tindak_lanjut (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, jumlah_masa, tuntutan, penanggung_jawab_unras, jenis_bantuan_satpol_pp, jenis_bantuan_instansii_terkait, korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita) FROM stdin;
    public          postgres    false    282   ��      �          0    27773    laporan_pengawasan 
   TABLE DATA             COPY public.laporan_pengawasan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) FROM stdin;
    public          postgres    false    283   ��      �          0    27781    laporan_tamu_daerah 
   TABLE DATA           5  COPY public.laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id, pelaksanaan) FROM stdin;
    public          postgres    false    285   ��      �          0    27788    laporan_tamu_daerah_dok 
   TABLE DATA           �   COPY public.laporan_tamu_daerah_dok (id, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, dir_file) FROM stdin;
    public          postgres    false    286   �      �          0    27796    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    288   ,�      �          0    35669    master_diklat 
   TABLE DATA           �   COPY public.master_diklat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    343   ��      �          0    35636    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_eselon) FROM stdin;
    public          postgres    false    337   w�      �          0    27812    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_golongan) FROM stdin;
    public          postgres    false    290   ��      �          0    27820    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    292   ��      �          0    27828    master_jenis_bantuan 
   TABLE DATA           �   COPY public.master_jenis_bantuan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    294   0�      �          0    27836    master_jenis_kegiatan 
   TABLE DATA           �   COPY public.master_jenis_kegiatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    296   ��      �          0    27844    master_jenis_kejadian 
   TABLE DATA           �   COPY public.master_jenis_kejadian (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    298   ��      �          0    27852    master_jenis_kekerasan 
   TABLE DATA           �   COPY public.master_jenis_kekerasan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    300   Z�      �          0    27860    master_jenis_korban_jiwa 
   TABLE DATA           �   COPY public.master_jenis_korban_jiwa (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    302    �      �          0    27868    master_jenis_korban_material 
   TABLE DATA           �   COPY public.master_jenis_korban_material (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    304   ��      �          0    35644    master_jenis_pelanggaran 
   TABLE DATA           �   COPY public.master_jenis_pelanggaran (id, nama, kode_penertiban, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    339   ��      �          0    27884    master_jenis_penertiban 
   TABLE DATA           �   COPY public.master_jenis_penertiban (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode) FROM stdin;
    public          postgres    false    306   	�      �          0    27892    master_jenis_penindakan 
   TABLE DATA           �   COPY public.master_jenis_penindakan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    308   >�      �          0    27900    master_jenis_penyelesaian 
   TABLE DATA           �   COPY public.master_jenis_penyelesaian (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    310   ��      �          0    27908    master_jenis_perda_perkada 
   TABLE DATA           �   COPY public.master_jenis_perda_perkada (id, judul, deskripsi, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    312   ��      �          0    27916    master_jenis_pertolongan 
   TABLE DATA           �   COPY public.master_jenis_pertolongan (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    314   �      �          0    27924    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kota) FROM stdin;
    public          postgres    false    316   S�      �          0    27932    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kecamatan) FROM stdin;
    public          postgres    false    318   ��      �          0    27940    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    320    �      �          0    27948    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    322   ��      �          0    27956    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    324   ��      �          0    35677    master_skpd 
   TABLE DATA           �   COPY public.master_skpd (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    345   6�      �          0    27964    master_sumber_informasi 
   TABLE DATA           �   COPY public.master_sumber_informasi (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    326   ��      �          0    27972    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    328   ��      �          0    27980    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    330          �          0    27988    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    332   �      �          0    27997    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, file_dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date) FROM stdin;
    public          postgres    false    334   �      �          0    28005    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    336   �      �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 38, true);
          public          postgres    false    210            �           0    0 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.dashboard_kepegawaian_baru_id_pegawai_seq', 1, false);
          public          postgres    false    213            �           0    0    dashboard_wasdak_ppkm_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.dashboard_wasdak_ppkm_id_seq', 1, false);
          public          postgres    false    219            �           0    0 "   hirarki_kepegawaian_bawahan_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.hirarki_kepegawaian_bawahan_id_seq', 1, true);
          public          postgres    false    222            �           0    0    hirarki_kepegawaian_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.hirarki_kepegawaian_id_seq', 1, true);
          public          postgres    false    223            �           0    0    kepegawaian_non_pns_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.kepegawaian_non_pns_id_seq', 1, false);
          public          postgres    false    226            �           0    0 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.kepegawaian_non_pns_keluarga_id_seq', 1, false);
          public          postgres    false    228            �           0    0 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.kepegawaian_non_pns_pendidikan_id_seq', 1, false);
          public          postgres    false    230            �           0    0    kepegawaian_pns_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.kepegawaian_pns_id_seq', 1, false);
          public          postgres    false    232            �           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 3, true);
          public          postgres    false    234            �           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 2, true);
          public          postgres    false    236            �           0    0    kontak_pic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kontak_pic_id_seq', 5, true);
          public          postgres    false    239            �           0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    241            �           0    0 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    246            �           0    0 '   laporan_kegiatan_penertiban_ppkm_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kegiatan_penertiban_ppkm_id_seq', 1, false);
          public          postgres    false    248            �           0    0 2   laporan_kegiatan_penindakan_minuman_alkohol_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.laporan_kegiatan_penindakan_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    251            �           0    0 4   laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    253            �           0    0 )   laporan_kegiatan_penyelesaian_ppkm_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.laporan_kegiatan_penyelesaian_ppkm_id_seq', 1, false);
          public          postgres    false    256            �           0    0    laporan_kejadian_banjir_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.laporan_kejadian_banjir_id_seq', 1, false);
          public          postgres    false    261            �           0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    263            �           0    0 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_bantuan_id_seq', 1, false);
          public          postgres    false    265            �           0    0 &   laporan_kejadian_jenis_kejadian_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_kejadian_id_seq', 1, false);
          public          postgres    false    267            �           0    0 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.laporan_kejadian_kebakaran_id_seq', 1, false);
          public          postgres    false    270            �           0    0 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq', 1, false);
          public          postgres    false    272            �           0    0 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq', 1, false);
          public          postgres    false    273            �           0    0 '   laporan_kejadian_korban_material_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kejadian_korban_material_id_seq', 1, false);
          public          postgres    false    275            �           0    0 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_id_seq', 1, false);
          public          postgres    false    277            �           0    0 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    279            �           0    0 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.laporan_kejadian_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    281            �           0    0    laporan_pengawasan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, true);
          public          postgres    false    284            �           0    0    laporan_tamu_daerah_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.laporan_tamu_daerah_id_seq', 1, false);
          public          postgres    false    287                        0    0    master_agama_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_agama_id_seq', 6, true);
          public          postgres    false    289                       0    0    master_diklat_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_diklat_id_seq', 6, true);
          public          postgres    false    344                       0    0    master_eselon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_eselon_id_seq', 6, true);
          public          postgres    false    338                       0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 15, true);
          public          postgres    false    291                       0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 30, true);
          public          postgres    false    293                       0    0    master_jenis_bantuan_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.master_jenis_bantuan_id_seq', 6, true);
          public          postgres    false    295                       0    0    master_jenis_kegiatan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kegiatan_id_seq', 19, true);
          public          postgres    false    297                       0    0    master_jenis_kejadian_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kejadian_id_seq', 14, true);
          public          postgres    false    299                       0    0    master_jenis_kekerasan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kekerasan_id_seq', 5, true);
          public          postgres    false    301            	           0    0    master_jenis_korban_jiwa_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_korban_jiwa_id_seq', 7, true);
          public          postgres    false    303            
           0    0 #   master_jenis_korban_material_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.master_jenis_korban_material_id_seq', 7, true);
          public          postgres    false    305                       0    0    master_jenis_pelanggaran_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_pelanggaran_id_seq', 279, true);
          public          postgres    false    340                       0    0    master_jenis_penertiban_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_penertiban_id_seq', 18, true);
          public          postgres    false    307                       0    0    master_jenis_penindakan_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_jenis_penindakan_id_seq', 2, true);
          public          postgres    false    309                       0    0     master_jenis_penyelesaian_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_penyelesaian_id_seq', 1, false);
          public          postgres    false    311                       0    0 !   master_jenis_perda_perkada_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_perda_perkada_id_seq', 2, true);
          public          postgres    false    313                       0    0    master_jenis_pertolongan_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pertolongan_id_seq', 6, true);
          public          postgres    false    315                       0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 44, true);
          public          postgres    false    317                       0    0    master_kelurahan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 267, true);
          public          postgres    false    319                       0    0    master_kota_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.master_kota_id_seq', 6, true);
          public          postgres    false    321                       0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 15, true);
          public          postgres    false    323                       0    0    master_pendidikan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 9, true);
          public          postgres    false    325                       0    0    master_skpd_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_skpd_id_seq', 19, true);
          public          postgres    false    346                       0    0    master_sumber_informasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_sumber_informasi_id_seq', 4, true);
          public          postgres    false    327                       0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 13, true);
          public          postgres    false    329                       0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 87, true);
          public          postgres    false    331                       0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 7, true);
          public          postgres    false    333                       0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 28, true);
          public          postgres    false    335            c           2606    28012 *   dashboard_kejadian dashboard_kejadian_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dashboard_kejadian
    ADD CONSTRAINT dashboard_kejadian_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.dashboard_kejadian DROP CONSTRAINT dashboard_kejadian_pkey;
       public            postgres    false    211            e           2606    28014 3   dashboard_kepegawaian dashboard_kepegawaian_baru_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.dashboard_kepegawaian
    ADD CONSTRAINT dashboard_kepegawaian_baru_pk PRIMARY KEY (id_pegawai);
 ]   ALTER TABLE ONLY public.dashboard_kepegawaian DROP CONSTRAINT dashboard_kepegawaian_baru_pk;
       public            postgres    false    212            g           2606    28016 H   dashboard_penegakan_perda_perkada dashboard_penegakan_perda_perkada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada
    ADD CONSTRAINT dashboard_penegakan_perda_perkada_pkey PRIMARY KEY (id_perda);
 r   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada DROP CONSTRAINT dashboard_penegakan_perda_perkada_pkey;
       public            postgres    false    214            i           2606    28018 :   dashboard_plotting_anggota dashboard_plotting_anggota_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.dashboard_plotting_anggota
    ADD CONSTRAINT dashboard_plotting_anggota_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.dashboard_plotting_anggota DROP CONSTRAINT dashboard_plotting_anggota_pkey;
       public            postgres    false    215            k           2606    28020 0   dashboard_titik_rawan dashboard_titik_rawan_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_titik_rawan
    ADD CONSTRAINT dashboard_titik_rawan_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_titik_rawan DROP CONSTRAINT dashboard_titik_rawan_pkey;
       public            postgres    false    216            �           2606    35659 B   dashboard_titik_reklame_citata dashboard_titik_reklame_citata_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_titik_reklame_citata
    ADD CONSTRAINT dashboard_titik_reklame_citata_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.dashboard_titik_reklame_citata DROP CONSTRAINT dashboard_titik_reklame_citata_pkey;
       public            postgres    false    341            �           2606    35666 F   dashboard_titik_reklame_satpolpp dashboard_titik_reklame_satpolpp_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_titik_reklame_satpolpp
    ADD CONSTRAINT dashboard_titik_reklame_satpolpp_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.dashboard_titik_reklame_satpolpp DROP CONSTRAINT dashboard_titik_reklame_satpolpp_pkey;
       public            postgres    false    342            m           2606    28022 ,   dashboard_tramtibum dashboard_tramtibum_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dashboard_tramtibum
    ADD CONSTRAINT dashboard_tramtibum_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.dashboard_tramtibum DROP CONSTRAINT dashboard_tramtibum_pkey;
       public            postgres    false    217            o           2606    28024 0   dashboard_wasdak_ppkm dashboard_wasdak_ppkm_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_wasdak_ppkm
    ADD CONSTRAINT dashboard_wasdak_ppkm_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_wasdak_ppkm DROP CONSTRAINT dashboard_wasdak_ppkm_pkey;
       public            postgres    false    218            s           2606    28026 :   hirarki_kepegawaian_bawahan hirarki_kepegawaian_bawahan_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan
    ADD CONSTRAINT hirarki_kepegawaian_bawahan_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan DROP CONSTRAINT hirarki_kepegawaian_bawahan_pk;
       public            postgres    false    221            q           2606    28028 *   hirarki_kepegawaian hirarki_kepegawaian_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.hirarki_kepegawaian
    ADD CONSTRAINT hirarki_kepegawaian_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.hirarki_kepegawaian DROP CONSTRAINT hirarki_kepegawaian_pk;
       public            postgres    false    220            u           2606    28030 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    224            �           2606    28032 Y   laporan_kejadian_kekerasan_pada_perempuan_dan_anak kekerasan_pada_perempuan_dan_anak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak
    ADD CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey PRIMARY KEY (id_kelurahan);
 �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak DROP CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey;
       public            postgres    false    271            y           2606    28034 <   kepegawaian_non_pns_keluarga kepegawaian_non_pns_keluarga_pk 
   CONSTRAINT     z   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga
    ADD CONSTRAINT kepegawaian_non_pns_keluarga_pk PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga DROP CONSTRAINT kepegawaian_non_pns_keluarga_pk;
       public            postgres    false    227            {           2606    28036 @   kepegawaian_non_pns_pendidikan kepegawaian_non_pns_pendidikan_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan
    ADD CONSTRAINT kepegawaian_non_pns_pendidikan_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan DROP CONSTRAINT kepegawaian_non_pns_pendidikan_pk;
       public            postgres    false    229            w           2606    28038 *   kepegawaian_non_pns kepegawaian_non_pns_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.kepegawaian_non_pns
    ADD CONSTRAINT kepegawaian_non_pns_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.kepegawaian_non_pns DROP CONSTRAINT kepegawaian_non_pns_pk;
       public            postgres    false    225                       2606    28040 4   kepegawaian_pns_keluarga kepegawaian_pns_keluarga_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT kepegawaian_pns_keluarga_pk PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT kepegawaian_pns_keluarga_pk;
       public            postgres    false    233            �           2606    28042 8   kepegawaian_pns_pendidikan kepegawaian_pns_pendidikan_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT kepegawaian_pns_pendidikan_pk PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT kepegawaian_pns_pendidikan_pk;
       public            postgres    false    235            }           2606    28044 "   kepegawaian_pns kepegawaian_pns_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.kepegawaian_pns
    ADD CONSTRAINT kepegawaian_pns_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.kepegawaian_pns DROP CONSTRAINT kepegawaian_pns_pk;
       public            postgres    false    231            �           2606    28046 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    237            �           2606    28048 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    283            �           2606    28050 D   laporan_kegiatan_jenis_kegiatan laporan_kegiatan_jenis_kegiatan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan
    ADD CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan DROP CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey;
       public            postgres    false    242            �           2606    28052 \   laporan_kegiatan_jenis_pelanggaran_bangunan laporan_kegiatan_jenis_pelanggaran_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan
    ADD CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan DROP CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey;
       public            postgres    false    243            �           2606    28054 L   laporan_kegiatan_jenis_penyelesaian laporan_kegiatan_jenis_penyelesaian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian
    ADD CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian DROP CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey;
       public            postgres    false    244            �           2606    28056 ^   laporan_kegiatan_pelanggaran_minuman_alkohol laporan_kegiatan_pelanggaran_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey;
       public            postgres    false    245            �           2606    28058 F   laporan_kegiatan_penertiban_ppkm laporan_kegiatan_penertiban_ppkm_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penertiban_ppkm
    ADD CONSTRAINT laporan_kegiatan_penertiban_ppkm_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.laporan_kegiatan_penertiban_ppkm DROP CONSTRAINT laporan_kegiatan_penertiban_ppkm_pkey;
       public            postgres    false    247            �           2606    28060 \   laporan_kegiatan_penindakan_minuman_alkohol laporan_kegiatan_penindakan_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penindakan_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_penindakan_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penindakan_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_penindakan_minuman_alkohol_pkey;
       public            postgres    false    250            �           2606    28062 <   laporan_kegiatan_penindakan laporan_kegiatan_penindakan_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.laporan_kegiatan_penindakan
    ADD CONSTRAINT laporan_kegiatan_penindakan_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.laporan_kegiatan_penindakan DROP CONSTRAINT laporan_kegiatan_penindakan_pkey;
       public            postgres    false    249            �           2606    28064 `   laporan_kegiatan_penyelesaian_minuman_alkohol laporan_kegiatan_penyelesaian_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_penyelesaian_minuman_alkohol_pkey;
       public            postgres    false    252            �           2606    28066 h   laporan_kegiatan_penyelesaian_penertiban_bangunan laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan DROP CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey;
       public            postgres    false    254            �           2606    28068 J   laporan_kegiatan_penyelesaian_ppkm laporan_kegiatan_penyelesaian_ppkm_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_ppkm
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_ppkm_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_ppkm DROP CONSTRAINT laporan_kegiatan_penyelesaian_ppkm_pkey;
       public            postgres    false    255            �           2606    28070 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    240            �           2606    28072 4   laporan_kegiatan_proses laporan_kegiatan_proses_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_kegiatan_proses
    ADD CONSTRAINT laporan_kegiatan_proses_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_kegiatan_proses DROP CONSTRAINT laporan_kegiatan_proses_pkey;
       public            postgres    false    257            �           2606    28074 Y   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak laporan_kejadian_ jenis_kekerasan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak"
    ADD CONSTRAINT "laporan_kejadian_ jenis_kekerasan_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" DROP CONSTRAINT "laporan_kejadian_ jenis_kekerasan_pkey";
       public            postgres    false    259            �           2606    28076 4   laporan_kejadian_banjir laporan_kejadian_banjir_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_banjir
    ADD CONSTRAINT laporan_kejadian_banjir_pkey PRIMARY KEY (id_kecamatan);
 ^   ALTER TABLE ONLY public.laporan_kejadian_banjir DROP CONSTRAINT laporan_kejadian_banjir_pkey;
       public            postgres    false    260            �           2606    28078 B   laporan_kejadian_jenis_bantuan laporan_kejadian_jenis_bantuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan
    ADD CONSTRAINT laporan_kejadian_jenis_bantuan_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan DROP CONSTRAINT laporan_kejadian_jenis_bantuan_pkey;
       public            postgres    false    264            �           2606    28080 D   laporan_kejadian_jenis_kejadian laporan_kejadian_jenis_kejadian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kejadian
    ADD CONSTRAINT laporan_kejadian_jenis_kejadian_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kejadian_jenis_kejadian DROP CONSTRAINT laporan_kejadian_jenis_kejadian_pkey;
       public            postgres    false    266            �           2606    28082 \   laporan_kejadian_jenis_kekerasan_unjuk_rasa laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa DROP CONSTRAINT laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey;
       public            postgres    false    268            �           2606    28084 :   laporan_kejadian_kebakaran laporan_kejadian_kebakaran_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kebakaran
    ADD CONSTRAINT laporan_kejadian_kebakaran_pkey PRIMARY KEY (id_kecamatan);
 d   ALTER TABLE ONLY public.laporan_kejadian_kebakaran DROP CONSTRAINT laporan_kejadian_kebakaran_pkey;
       public            postgres    false    269            �           2606    28086 >   laporan_kejadian_dokumentasi laporan_kejadian_korban_jiwa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey;
       public            postgres    false    262            �           2606    28088 F   laporan_kejadian_korban_material laporan_kejadian_korban_material_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_korban_material
    ADD CONSTRAINT laporan_kejadian_korban_material_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.laporan_kejadian_korban_material DROP CONSTRAINT laporan_kejadian_korban_material_pkey;
       public            postgres    false    274            �           2606    28090 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    258            �           2606    28092 c   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak laporan_kejadian_sumber_informasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak
    ADD CONSTRAINT laporan_kejadian_sumber_informasi_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak DROP CONSTRAINT laporan_kejadian_sumber_informasi_pkey;
       public            postgres    false    276            �           2606    28094 M   laporan_kejadian_sumber_informasi_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey PRIMARY KEY (id);
 w   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey;
       public            postgres    false    278            �           2606    28096 =   laporan_kejadian_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey1 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1 PRIMARY KEY (id_kecamatan);
 g   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1;
       public            postgres    false    280            �           2606    28098 X   laporan_kejadian_unjuk_rasa_tindak_lanjut laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut DROP CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey;
       public            postgres    false    282            �           2606    28100 4   laporan_tamu_daerah_dok laporan_tamu_daerah_dok_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_tamu_daerah_dok
    ADD CONSTRAINT laporan_tamu_daerah_dok_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_tamu_daerah_dok DROP CONSTRAINT laporan_tamu_daerah_dok_pkey;
       public            postgres    false    286            �           2606    28102 ,   laporan_tamu_daerah laporan_tamu_daerah_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.laporan_tamu_daerah
    ADD CONSTRAINT laporan_tamu_daerah_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.laporan_tamu_daerah DROP CONSTRAINT laporan_tamu_daerah_pkey;
       public            postgres    false    285            �           2606    28104 &   sarana_prasarana sarana_prasarana_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sarana_prasarana
    ADD CONSTRAINT sarana_prasarana_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sarana_prasarana DROP CONSTRAINT sarana_prasarana_pkey;
       public            postgres    false    334            �           2606    28106 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    336            Q   c  x���ٮ�����O�^ BuP�*( (�$ĖN���O1wN�Zs�K����h�������L��]�d�4�3�a���(��ph2�_:o!m/e���fC�����uh�d5?{&n��ŗh/U��)}��`���*zB�U/�,ގ6p���/(A(HT��7����G��` ����폘8pS��>��6�V����^�l>����D��u����O0�G@D�D������8��%^^�C*4�*��y�������e=[�P��<�	F���`2�=��Uٹ��s���w�Y
����`���A5�ŁEN�R�� Ϧ��J�t�������9T�-F��� J"h+v;�A�
7^lֹ=(�����o.^b0��'w�k�<eb���m����BpR$�KT�:JJ�C0�)V����ߙ}��r0�HJO������ԃlA�R;@�|�߰ie*��[�����K�ܬ�`J�@c	(r�v��m��T����]$�z�5���h������v����8o���o0�7h���D�"�@�u	�h\-@9��k�&0���d�?����d\��g��=l��O0��@�B�z@�,�-��!�Vp�K/�|��m�'O{��Ʈ�t��N���j��?c����!�KXĐR
z tH-�Ջ�hJorf�� ˳��۩�J��Ё�"O�j`� C�'�3(�u����m6���B|���0�M'��x?�G#4(]OI'��{��X�IF�l"��Dz�3��"��L<:�L���	y�p����<<����;P=ת���
�MFdS@)�Yg�ߒ9Z��QSM9��Ng"��+�u���hjl�QěU}����e�$�y����,�Е��/�=��������L{�z����(�Sl��@�bn [�!�%���,����� �)$��&J�e���gm���0L�0W)��|�8f2]Z�溻~�nN<� 	� ��tAfT��/�>o��N޵X�A�A"�h�e�:]���}?	ܰ����1A��/ �BnM�uK��L7�����ذ��������Rks�¬�o��-�?d��&�
�_r'd\e��ʹj��������)���j`��o�yb��q��ؿ�7�p�V5�!=�#��jp����(���N��]�o�2�l��1��Φ1��c_��_d�����P�`�;��c�ܜ��-Qm�;��|���\G�R3���N�a�k�m�`�w'�$3�zuF��j���P]|�&7���8��,�`��ǡY�>=���$��7�"Sڽ Q��������M��\fnzu���T��]�8���wx� ,�l���C>��r?�[0L(°IWd�_H���:�H�+�v���ߍ|��+2�G^2���{��o��*C�%�v&�	��ϓ)wF��x�x�YZ3�&{�^�"U�m�[F�\Z�<X^��-^�eR^�EF��GX�HF�k���G�r��A���9��b�R�&G�'q��`�ӹ;s���j]���Li'm����T�iҎȠ��/�a�Z���b�<� -�2��k�\������}�祦�9�|���M�Έ�g��Ȑ�.>'���0p�~�bK��Ҙ�'3�D��.��F��#�)���b}��/� �*A�7�����]���r)��G{y�3�ѳ��d}u^�gT�}�cu8p��%&ʲ$�C9��Uc�]��ڵ�7�m�-����9�V+H�2�0�#�uՍ^�Η�:�w� �v֖�d�CY��Uc�Zո�����'R��eM!b�v:�x�*��'�R���L�.�L$�b�PG`q*nN��?̷F���ـ��l�rW�p�x;s Ҟ:������o2��tj_�Je>��<���~;o����/���,^�2U�ZJ�1���C3�)���0IB`�I�Uж7	&H�����Ȁ��L��ɉ����6������P;�����%���'�ak���Б�d��-�1���P���͌��Ta������Xꡰg�X�I�IRQ�e&s��<�%+��z@�ק�J+���U9Vj���&	z�������ޢ���/2���D���#p�����E�8J�����4�M�>��ȷc6����d��f:�oGow:Ҿ�A�{b�z�{��,٢h      S      x��}[�Gv�s�W������luM�X�F]� �/�5a˲8�4����YYUM��phX�Ȋ8��/��jx~z~^|||����?���C�O&����=�a���X���o����|���?�~������>�Κ]����W>t�����t�O�|�Ǘ�����R��Kz���.w�?�v���~��߾~��;\���a����Ww��ð������)��ϯ�պ��K�����/���պ��{�S��e�����/_��_��+���ۯ�~������|}|�������O�_��3|���#n�?��_���(�;T{��8lḜ1��×��W�?Ň�����/��׋����e--MwA�ŗ���r�`a�>��}����������*`%��V�N,U��rؾ¡Y�w��%�_.������~����{�x�������^l_��(��'!��@+O�.7��ҁ���8X:�-�
����y�ܷ�cVD��p����&p\�.��i��������ŷ�Pf6_���?��s��D'�3.:�/�O9���ֶ���Q�EgrӑH�;\Xt�y�]�7���N>�b8�lh�����
z������?�����������ۈ?/���bl:�����[;���o�|������|2h�l��v#j�:|�=�O�\m�^ѣ��Q\�#���ڙ�҈�n��a��ga����}v�;}��(�&����Yp�(���e��#��������e@P}�n���+�jE6zp���whY~:+�2X��M�dD����� 'z��Άx�.�1p�WenM��6�8�_پ$��ɁCxr�-<3��&'���&�xY�d퀗�%K�S�ۧ��أig��Q�:^�Ȳw���>�5�ސto�tf����	�j�у����3����g��������ˡ��RT�d��3���0��\e2�[�<L���`mGi�A�шY����#�;�ԛ����kJ��u	��X���ؙ�U~��gv &���{����\�(x��3� +��2,�K�]���#�x�FE�D����;	�D[_�%D	��h������S�<�շ�~�ׯ���G��_��������p8m_NG��{r�!5=˹K���ES���xW�~���w�P��3���p�(����|9������:�ծ�U�Of��ò��ʙ��Kxf r�������篏{��Jج���� ���mة����D��~��_ ��~����������GK���^��9�BA��g�x�ME;��x�+�&�Sq�����5��0����{�e�Ǹ�Zv���c��Qh;��N��r8�-@�@qhoӹ���HP�ߠo�+�㢒���P@��f�6�V(ʷ�]H�O>U����t���o��+&S�L1��G���ڈ%�@6i�}+.��D1a_�%�^�Z'*�6��	�LW`L����e\�)Y�e/0��U�w�;�_R�W�ù���%eu����?҅ۧ`@��&ٶ+��������������=&q���X咢чa�;,���D:�r3ݚ�)[�r��@<�+�+����E����D�Յt�D���J�"BV��K�6�O��H+he����������(W㞀��^4�8��9/��!�˟Y�"��'�;J%m�6��l4������T7�{��q���^j�;��O1]Sx&7P�����+�)�{�*�q��v	˙��j��G�5v^n?��D�wX����I�d�H$��r�S�Pd�<��K8w�w�S]߲ʗ�%]�saO�	4o@Ա(r�p'��E�sb8D.��9,_��I��u�o�(��0f�A������ %�L��q��pbf��*���|��[��qL.�$�}3�*j���I<ε0�Ur�!��ş�.�!���5�H�rߴ����|<����90`�^j:=n�q�+���g
���+�.�UAP��|��\A�|��F�Z�z��C&���]:%/W�Q f|�ݢ�/�&6Á����,:-2�aӹ��P��S�i8	�FƋ��z 1ay���xK�C��y�g��3rKq&�L�@��#�t����H�G���y93VJGAi��L\�۰_�e� V ׷&ܥ�A�'C?/�O��Z��-OQ� ]7j�{�����&�J��qp%ި��\-��5<$Ҫ(>�mqX�-/�n,����󜌾7�5t�I�٣�I�$���ܨ�x11��@��L�b&)KmgK&�J@�v��
�Q򯙟6]�2i�uq�Ѝ�c����c�����k�Jr%�:�K�����#$�h���}�,�!�[���K��[GaIT{Z-�b�`q�9Z׻�ۭ}5?�:Z�Hʐ�ڃљ�dh]Ȅ�%�麚�aƋ�L�.�8�dyHDyy��։O΄LO7�l�6�;��h����:�w�r�w��pٷ�^�괁\�A�i��v?�����Q�X�KQ ������~C��t��7�i�k��-.��Q���_�GhR��|�R�J���!�_/1c�Dp�wU?SܑEбT�m�$��ܾ���~���}���F!x�o9�T
Q��:����gѡ8�D�����iĐ�R�ߡ���J��a|���lRL�)%\�� '�Аq��w�~}��6�� 1���x�/��Ϫ���^����z{�)����l󈦵�P<�tS��{u�`y1��9]=��Њ���h,1�B�����w+�,> �>��+�ǀD����!C�����(;����Lb��~�FfTflҡ2���+8���9����v�e�@e����i��6fc����]w;��k�E�%���5+,S�O�B�8�>�%i���\���K��kGp˕�.�q��`��ݮ�k���q3�+��͉Jm�����h���N9�\���|��Fl��׷�N��#]&�QԼ#G������	��h�mZ���Tؕ�5�p���jC�x��ߺ�i��7�Q����}��;w�4,��}i�`���k���FLR��4��m��L���Xb��C����d��wF�9<Н#�����q*��⿙ �3��ޏ�VM�l$!�h$j�g�ҥ`�L ��Q�ʥZ�_����z �u�_*2�Eӄ����f��,�$�=[k�K�d�|�g[�L[����aМg먜�Y�A�����9N6�O�`���f�}��RLe�5O��t��7��%}]��u�i)�JT�Ui��1�0����@!v�K�[��7s�i]�j����U�_n���޹�H��R+5���Mx�N�
� �y�`!��> �M�nFZl%�#�����Uu���O���C�ʎ{�Q��Um�Փܿ�X�m'�~G9?��o'cյTԳ�x)y��4��K��S]诉�X�+�,����Rs�3��_;�y�^�e���^�S��3	2XO>/�A�-�TUd��eI�\�\r4_r4����\b��`��!�}����b�i!~����~���*ˢ�&�%��(ڋ28�c�:�q�rϮ	�8��ԵY*Ud��li�|�����{W�H+]�Up_�7O`�U����Iݖ�<��X�Հ��;�ɲ��*��t��M
��o�H��$I�R��Vt������@�5� ��t���]�8���HKuI3IR����PR����I��ƚ7���(U��������@�z吚�|Z��2A'�	fU�]C����}�fc/v,�
���ʰQ$�
,���-��v����"�Q�U�cU����p`���Al
3X���)�پ\o#��ؼG��M$K�}�s���*-���c*����~�#tT�p3n��y�Ju��q+�i4�����b����@5��kV=ɐ/��a�gńmN���R���~���\�*�r{�I�((�V�r���T(�u�皝'�y��o��7P�j��_ӈs8�dw,�Z=����_�և��8�07p�U�Q�4�Tp��	���q�)��&����n�)5�:�~(6݃�������    o�܂F�
�ؤv���wn6-��|r�n7v���h��!����Up�q|� �(�C�հ~��g����.wf]�����s@MY������iŉ-Ya����0�~��3�g�L�t���G¹�+aŷ65��KO��`v�F�>at?  r}�Vt۬@;��N�r{��7���#���E����P�p�S�z]�zGꘛ��@��Ha��+�z�1u�H�뇮��5�w,uPc�BG��E-����M�o3�2��$��;ƛ�7[,�������W>�u��bK>�K��^O,B�"�k#�݆P��]����ɀ��2][m��{����&z�/{�R+5ޫPJ�v��;���D���Y��^.�C@���@w���UxGz)�N��a=Z�%(�)^Jqf���WX�8��N@r����
�O�.^�!Zָ����kU�� fT�Pl�� ��7�]�A��t���"{�j��.�E	6B3KE񾉀j4wtv����:-N��d�;���٨��Y��A��P�6y�|	>;K�w)ό'��\�wO;ڠ��Rn�rn�cE�u�W�Z����ac|pX|>�N�9v=�oδ\M�+ԫGm��&H�~<�	�*���+I�I���Ԍ�
J�Ch��G��}H����R���a��A��4�V��*v�ڍ��ޅ�Q�ٜ|�X��×�հ����}���E])^EuX�3���*)��L����&,`j&Kٖ��ݔZ�fq��X퓘߮��l�q)�aA.���z��,f�nlV�i���_f�7#tm��x]��Fzw�X͕ji��AE����G�Ȑ�[��>���K��5�qu��Cdӧ��ŝj�2���Q������u������)��č|�*�r
�ٕG?��$4��W�&�n[#��Z��v|�:
�W^��^|dB7���G����(�f�l�U���M���ct�BJ�@�����5-隮]�jiL�
,\y��ڈ�B�6�[Kcq���R��44_��Ò�\���;pe��j(�4j߽��dJ��h=ڦ����qͣ��9�L��?/�������'מ����-'3�|b������N4�|b�Y��I���N�0��$���X�G{���O>�.��i�Vy!%��2��?��Cg���K��UNPŸVl3|9��;��{&1�ڝ�i�B����V�^X�Zκ`�և�g��A0�FQn���3�	��+��/���m���{�:��iX/8���1�A�&b�t�*�*�����2�'��7Ύ���s�B�R�U	(3��{;�?p��AFxצ�hcp+*	�r���g���$�.ש8qG�QT��Β�.}0R0�hJc�FA:J��RF�q���w���A���n"��B�HH
���#��fXӰ�e0�Za��{kyЋ�dE��f���i�6`#����TV�4��M�~Ut�&r�.�*s�~��ܣ�s]�9N�+��T'�B�)z�����<\n��u޵��u��$�;��6�G�^��+8G��z���$'�����$ʯ{�_�\���*A�0�d��,�v�#x�GS���i���}~�o��жZ)�M�7��|=�[C�g9��&��Q��9nC�gk�J�C
�(�Ф R2��;�!�r��E�!�J5��Yn���~E��`~�LŇh,�(�CZ�a�^*9�`4w� R���	�M��ѓ+�J��6��_N���:H-�m|w�OU}U�ɣr	����˼z�%ŋr�ZK0X�@m��w|*��a�|��;�[e�eʈ�:�}٭����amp �9%2M��Rk!�`��U��3��Ł�-d��k&fSƪK�d��YE�A�:�<�q�!��u/B97��+��^V�d/�'��!CSV����WW��������ND�-+����O��,���o�4�7zn��S�y�?�*[�#�e�*����;���D"�5��{XuL2�w+���V��+co�$�ɬ&=7-������LlB��&��.8�3��Kc e�B�)�U��z8�7�tU�n ���[S�G^N��V���+�*G�0�H���X�1�>ƥmߌ.`x��j���BIk��q�E�pEL���~����e`s5�w%'�f�w$��@d(x���p��O2c�}-~�w��V��,7�K��<("<"�um�pka��[NcZ��/>�HL3AA�g�&N檘�#]��iA�m4�껞ݗ�w$�U�TY#�,]�c�a/7a��OM0�h�����9�V���؊�;Ӯ]3k�D�BG�b��>{9r�prT����V���+`e���W4lp؁Z�hO{]��JIT�"$�
;�<J��&�ƭ��>�BOw���>�;ĥ!���"��d�p��q����E��Ys���@��ħ���Nl&� ��4�:~#H���fY���Rs�Y\�[���sVW=G�Ғ�"+�q)�E-}����b�rE����Y �nv�� �t���L���Fp`o]�o�5%JH4�?����T����B��^�I�;�O��*�A�8Ť[�D�
�sx<Q�+�K��y)��B!V]�]��Z���=�"r���F]�T�F�Y�[�@���WR��F�t�!v���J�p]��`����MΊ=�<�=��'�"���v~ٽ~�$��ᒋ7Q�u�R�!�aݘ�",F�GV���6�[s�>U�,�Z��X�^�Z�����5u���B�Y�^�%�,�}�#M���o�R+���������g�LUA��)���r
�L�@"[�]����3Xҷ��*����;�AJ1S�!���*��u�8,W���9r�/�`�Ĳ�Q,�'��t֦�8�q����b'1H��U�O;	�Тb�~��'v1zQ�9�@7V��j�nm"IR�ɇ�X�B !�^�J�ol̴�sM"ՙzgE�w���f`FT �bd����Zʤ��
��/�'�]�3��>o�զ/0�v����e��ݻ��U�Sy$��Q�\��e�/4�	���CJ5�t^_E�7`'V���4��̷��8���,��B8!���P�>�H���KrG�H���]��`��\�CT1�P��u��6��˃�\��
�z~^����|���q��@i�r<���ކ�MD9t��j+ͬ�iyT9(��4Q <I؀�1��m��ys��2�Zb�r�A�P�z@�ޣAS\��)%���P��5BJ�y�D�X��"�5�fF��IH���ddJ�P��5����kHja�`�WD�a��Ӕ�����\��0D��aI����x"WΗ�g� ��ê	�f��lAxa�q�Ƶ�p#B�㎭0�L5!6�`���f�z�b�n�5;?���Ű5��\P�ϒj`��&U�es����s�Ze�$gc9�G�g�z�c����@��(����'.8�C�k�kk�DjT)��qEv��^���yN��Dɨ���%�*L�]� c�)CD/z���1Bp���\��B;
�G0p�*U�X��DH�*���vQܫS!S���WO߇�s �YF�,�f�FI�F�ą}n�К<n|̓�"$=+�eS�V����ޑ* Î4R�(�e���,�e�P|T�SdFU�d:�0���Et>�T�O&5I5.�׊�	!��1Y^s�S��]h2�4H��ʑ_�+�4��^ �����w=R�*�nqЯKip�O��b��2:����ƚ�*z3���peg)@�1�&��2�V7�?H����qc����>�y�L�憚�Qʈ�43�+��GF�x�N���;#�,��#>�������t�d].�x<���>($��E��#[&em�sL��`�PB0z�*��y��+��-�o�@�aHSZ\�Ā��^v��)�����}���I �d��e�6ϻ��{��x6�n�S�*F�b~��W�&[� 쑩!�@�o�F����U�2݀�zd���~h�}g��E��wV�۬���2f��� �~}{��B���.;�    ��i��$]�`o���rE��8HE��䇙l2�u�T��X�'Q�QjA���F)ث�A��T�����.��HMH�L7`��s����_@�
��`�yK�v�~�H/��7�ݞ���X�跻�_�Y����/p�ɵQt`}HHn��a�n�� >����e����<��h���%�Qb���(��78��a�&��3�8�g���K)�)���rZs�Mj,uXIA�F����?;Hv��-�>�&w`e?w��%U`W&`q]UCXv3����˘�8�3
ܢ.,����Si��Ԙ��X��'t\g�V��{�F2�����k��2*&�,���]��DKp����F;��J�N6��B�K��C�U��91"��X��NQ]��u�Z���ч�*����%�����!�⢤��q�}�HYs{wc�Ȇ)~.�L��3GK+��|z���th���߻&�H�f+����Pr*oƭV�X�H�ol�z{@_�Q��$��+O�B�0���KW��J8�GyV�t;𻧤��i�8�w�������4gjZ��~�֏y��.7)@C�$�_c';�zed�l$|s������ʠ�])�����g��q_GfΛ��0��Ff�ErM��`*㛱�Ih=NJga|��2�@���kĩ`;��%�Yl�G�=��B��s�N�[���WF>�,���V��ߍϵP)��2n�vL�ܡ�&�4t]����{)�*?������Z��]��K�x�T$�z_g]��;�D�H��h��Î%�(	��/��*dku"���>���q��<b?�>C?�l�A�ݵ�	(����S�	�*8����t���%�~}&r��u\���݌=��֔S���oV?��b��I�p	b����D�h��)�W����3�&�%�HN�u�N9ͯIя=��-�B���H���Dh�� �|�i���#�;e ;	1=�`\��qof^��q���"�R�~�m��a;��5�J�o�u�ل�P/MsK,�
�·�y²{�2��6C��g����K�;W����~�@Ѽ�Ix|���)0`�)�Ό�{F\4�MW?q+��Q!Pd�!^��q��kb��	�K{��3�)�|���G�(cӚ&�h9�^�ޓ��	˂����F���4%W
�g��vB��3ZN�_���{��t�'7JwƼ��OߋD�%"|���@�ͻ�����V�S���)]����\�@�&t�|t��*�6K��O�<�)̭G����/h �Q�)�k�N!^�RkAc�,�$L3Od���k%T�XKq^����1�h�s�RB$^PB�^�.5��ެG�9�	��PS�������D�}��w�0�$"�7�!פGABPE�i��b�Q����˙��A�a����O9Ev��"�3Ԇ�խ+��^z�J����NA^��J�
�����)����"���H}�Yd[��RVFU���� �. I}	jy�[b
����FN��Ga�p~�.�/�[:��HOM��aO��h�l�B'��<������	�`��6E����ڏ��>�z^q*�%��7�Ot��$��9�U"̞{ϥs/�+N]��(E�7��˞��E��	�0x1����
�fϨ�R���H�+	$U�����xˈX:/��fz�h�^M1\����e S�a{���m���&I(�ʒ@�H��|�%k>}�d�-��4j��8���Ʒ$������DO�bk�1r���D��/��7.�z�q��"L=�;�یV-��$6N;�L��ʳ����u0e�q/#vM��՗Y��"]`������N�t��m*�IɈ�xu���S,��#�-2����%Ӝ�h���H�J�z/�>�-����gù�c�=���v�N�;�ʆ�!�&���R�
gi݋�S*.�[�a��6p�[�}��f��m�M{#�E�]�;�/����;�3ﰝ��b�u㞽auS���	�9�T�E6��m��T��ڐw"9#��D.�"��^��d�	 �ǳQ�u�^n�N`zF�2$v�C�^v�{Q&���N�^�O�,o<R�_���}q|�8sS�_���4��9����Ԍ��2�[�^ׁ�g����/J ����$)���wF$8��z�!����w��9`c�;y>�7e&�������w�����
C,�����\���!��l�
hњ���K�v���@�~�"qw^�B¥_ �˴���M���3"Š����)��m���y8�"�r��<;�ڏ�ÑYhɬ$�iN��#��d�aMcEs!��K�$�3U�a�����i��O�|��*w�ED
�~O����7�)�6����1��E��np\:yif�5eg�;
�Ȍ�%{�@.�����@���+̐`OF�~3�
�ʵ����AyIDzj}?W�m &�Q������[��������������~�v5��	��;z.6`�4�6Yq���� :��ݫ`��h����4���0���iq�����O�u�LUG�*^m��kC:ͨ��^O+���ia�1{�`�z�MU__������Ki�G�2���|�<En�3;��ˬ�~G��]�W���h$�iT�}f�q���[(K�/p��Ι�<�v��"��rnp�R(��m���+GD�;�ͬ�6#F��}��|A��<��M�!�ۼA��@�w��r'��J���^3j������0�
	 Z������m!��Ve�	�`�G:�d����l8L<��P���w���jT��H+��c����5�����%k�ƿ�@9Ew�ң�����]{��^�K?�{�<����y�	"|���^�!5�Q�3���ezb5|�0��{��/����|W^t_��v�Q��!�fn��SH�R�i�C~���ב�i�\�Y�O���b<*� �G�B�E���^D��]�٣�rh��a���W����2M{f�P��3�v�$`@�#�պ�C��oYt�g��W�ƻh',`�Q�!̰�]�B%�x>�+ �w*�V��0�v��~+��
 �V_��vZtO�Ux��+v��R�G�`Z_��hu<��sE��&��HH�(I��<٫<Uh���v0�C��IL]p���
l�>/�4������J_�YX!�
�-<�#�ۮ �t�q��2��F&�To`����>�'!2�	�H�+�Lv)7鎻vX?vUf$�>��<۸��K�M���1�<�/+�o¸���ŭ��n��3h6Hd�t�$���3�F1`=
�y����"^?Omi�B�{��<(��6.7e&xQEITDd�M��D��%���͔��i����=��i��aɍG��y��Ea#]��&��Zw{��G21b/� |��$�x��&�>BhB�.f���Њ)�΅W@��i��"|沍�y�F	�I�Q1A��N�hƙ�<�6&^�R���r�Σa�<%��C����p�O�c�+#�VP�+`)*J�.c�?"��ʙ���� �
Xe�B]�_�.a#t�X���$F�`o?��H�
]�
�A���w3��?�tS��̅x[ ��f3!��+>g�8��PI�Pa*�O�G0��`��.ӀND�&��#�����<����n��� �6E���<���-�����"�]���"̝ԫ�f�y�Ǝ�TAH����=�lF*"?z@R_2ې@���*O�ȑ
s �C!g���ڠ������U��Ǩ�2�69Oş]�D4ĝ��	j��I.� �b�.w)ev�P�W�g^잾YTM�0A�L!hc���>.�գ��{[��&U� $�V8Z��r8=�����U���=��촡7M��+��\�K�/�S
W�>�C8�<x�/�"�.�r�O����1j�n�>��� ����zz��FIh,K����"�t�"�hk(�����@E+
Z`��Wz���q�#Q��D���fy�f��*z�kz�)+{� ����Ŝ�Ԡ�*TU�H��.N�D~�� w�'�2����� �5i��$����^<����ޙ������c�`,�Z(�/;������� K  >�D����XPq��+?�6��;%g�Hk�5���!�Q�C���~4U���d	����w��D�	�WP��T2�o�j��'o�6(8���~�'ۜ>"
[��^���t�l��##�[j3�}�����{�	S'e*B_��x���]��Pj_Nk�An��6�[/(%Xcս��g�._�.A�8Q|����ul�c�a��c�����&���X8�7�S0��%;��#��O�mFh��d�6;Şa�=˚�U��h�+��:�D�)j��A��f0�$�`П�&;��"Ԏ<%�	����~Ц����_l�@� -��Ç���A�F�(��6>��6Z�H�q��;�j��S�<�
�a޾Ў-���G^��^����;0xU!A��ޱz��:;������=H�\�4O�MR>l�%���ȇy��$W� �K�|<!q@Lh�ns�?C���#x9|�֛���/f��ɐ�9�6)
��h;m	(�ظ�hC� t(.4_��������AB��%��2��>�3���V�ԉ9�����&�|�S��P�j񠢈�=."��i�/�������&:�l�ێ��"����"H���z�1ag=-(0AJt�d�o��qXb"�Y��=gxӗ	� ���C�ڐw,�gF�*C�6R��X�j�L`̽Wb��b���J)�Ns�ғ�7�j���̴�M�|����>>��
��M��X"(�Ű��Z�\ׁj�_�;o�ia@qA�TS��zܞ6��Cd�q���~�b4P�����,��/��݂�������U�Z�l�F�e��2��q�.>yw���:QU���ѽ��^v�em��d����	��=�"�h~���*�Z�_���a�q�d�z`L����;�������>4�ι����'&ɪ��p��K�	���X@S����C5Kճ�8Hqh��b��p HhR|WݣJV���l�έ2�т�~���'ۚ4�?�ΒTv<S�d������K�zQ��� ��X=P~��+`�����uv#У�^�|o����yϷ�M>{1�C��Ȓ��yI��/���?G����P�Ė�>/1��T���j�9�~a�'=t>#����,W�ߎ�c�ɥ[6�����W��vx^�l;�9��\��x�ގ�U� W�H����?�#m��(��k�	�1�e�c����z1x�9�$|�f�)�P�W��ۂg1��9}L53��`��נ{�k�tv�0��v����N�uH?���?��	C����1��o�}2���cه�'��)�°�P�fV���i�TxL���%<T@������RÊ�G�j'ό�e|vҷU��V�` �׷��;I[�zv�p�������L.g�4�-GÜ2AyʾO�� x(}xm6�Z�<:�o%*�!�fǺI�*��`ߪ[=`��C����G�����^�8#ޚ���01(*���{�����tX����mX���N,_a�g�]�+,�
���~�R6,7�sO_��M�o�[NNc�+~z�[}X��T�ʏ�k����]����c"}s��	�0���ȸ�R%��L�$�	�h��k4&��;���t�_�	�;���ի�X�ktAi�����;G��F���_V��&o%�)$g8�C�J����cv\�' B!6���J�)/�+�=��A��b��P���d>}&�@�(�]�i6���TS
��b}ZQ�p�0"w�u��6�尪��I̭��x�ϻ�˰a�v�j���-}/.�礂lt�Sn���n׆6�� Ҧ�O	�ߧ�~������V      T      x���͒%Ǒ�ט��d6&����es@3a�!�jV�4��"�I����u�xVux�w:�`��Q��'�{_��ݷ_�y����~���?���߽~�_���W��������������W�?���o���?TD������W_��#����w_�_}5-���#0 C�|�Mmlz�U)����y���~��W���׿���*�?� �xǮ/t�����h|��#��^��o������__��#��#x���[]�~ly���>��'��	��ס��cH\��-�}��7o~��{���>����aIݢ����t��xﻮ�w�qwK��{<߻1��wW��{e����Z��#�zD_����}H���n�I`�:��l�a�;��@\��� �ݻ\�����滫K��nL�>p&���dm�.+�\Z��>����Y������X�����<���>Mh���D<8�D�Ҵ������߼�f�d}�qNn��7�ߛ7��o]'��o�Ϛ�}��oVZ��y���9ٳtW�����m��c�yӭɠ�x?����2g�ipI���zK�B��6��d��Ɋ׬�X{�d�uױ%�3���%q߻^/ɜ�]��͙�>�h�y�g�d��_�9�q�w����s�l%�S_�j׎h���K^[9��9����n�-�ۻ^'��^�Y�[/����lV�d���msކ��כ3�d�u�sO�]/��d�|wk������6+w��h�rS;٬��#�>��f���e����a�ٷ�6�m����Fv��6Z �������7��,Mv��N��	��ITJ��p�xiM3�E�ĕݕh�+�߉+��f�+�C���J0hP�'ȕB[�R4̋A���0O�)������D< &F_��E���L�.��T����dc��q�?�������w�uɝ������	~��0/jԋt3ڣl�嶌�y��F��,�-�h�����;�""FkF��<=�4�XT� .���N�ތ�yw<��s�2�o�0�
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
�?]���+���s�_�����Wo~����w?��߿���]�߯?���޿z��������ۿ���o[KC�ZKc�ZK��ZK���?������o?���Gd~	�	2�����?�����~xD��E��E�!�E���3�I�<C���3􉏟�S��9��E[����.��eN�wі/sB����޿{��?�O�#�)<u��>�7o��ۿ|���a���O�_}��������s��>u9�}��iX�ߧ����}L��it�ߧ�1�r�>��������?���?����:��׏���~ Y  ��~��u}zX�޽����oFΑ_m�l����f��n�l2������n�l����V��n�l������m8����/5��{���R#/�����/5��{���R#/�����/5��{���R#/�o���/5��{�����o�����}����#�dt�'�~��Dp@������?���Ǻs�Ϸ�^����7'{�������\��W�|?��h�7�����˫�R��w�_��o�������N���N��q������o�x��>x���G������4vz�t;e��NI��SN�i씲0�/|>��S��i�q��# �0��ƾ��/�>����/��^�߼��?���?�����:!������zl�$���N��h*���:�|����w�:�z����w�:�x���xw�:��߾����0h^����~���N������(��z�G'Q���I��ti���T�G'����I���9qv�����DD~��ҏ>'"�n��?���8�s�c��?�s;}�g�N����&���o������O�v��	��ݟ�O<�	��ɟ�M���D}�7�{~�o�7������o�7�^J���o�7�J���o���z���߳˘O�ϮN>���=���o���Z���߳K�O��(�O���O����O����O�Ϩ�O�������w?��~��zFy8�������S�4qJ~�7qJy�7qJt�7qJo�7qJ�7qJ�7qJ�5��1Ԥ��ѹ�45o�rt.��y��s9��ϛ���9�|����<��ϛ����yף�.>o�zt�S��M\��3"�4q=:ψ�7o|������~� ��o���_��������~l�l��8�́&��w���-h�l�8��&�������#h�tG���?���~����݃�\�/�󇿾���p����k�vzڰZ;=�X���T��N�1Vk����s���ڹ��i�\m���E���m��E��Cn��E��9�n��E��9o��E��9�o��E���=����wVk_t,��?X�}ѱ �h�־�X Y8Nk_t,�ߙX�}ѱp~�b��E���]�����<Vk_t,��Y�}ѱp~�d��E���ݔ����ZVk_t,�߉Y�}ѱp~�f��E���]�����xVk_t,��Z�}ѱp~h��E���ݣ�����Vk���O?�9Ч$��)��}J�?A���OЧ���)7�}J�?A������������y��V���������HSF	��ҍ���X�n�6-W�?	��͟����O�j�'���!r���1u���Ax��_vԞݰ^m���g7�W��%G���o��O����t�      V   �   x�}�A�0��5=� 3b�[WFcbݹy�F0����_0Uvlg��]��A瞘4��HJ�2m|ht�]6��E)��f 3���=�������'3��kx��,g��o�h0�81^N�EO�����o�S����Nk���+���P�      W   �  x����n�0���S�O"��[�C�v����,��I�`�ۏV�:�r$PMA�>R�������b�(^s�To�����;���S_��֙����P���/�_o�L��O�S�7�2Ǟ����s9t�g��-5�l�n��b=쮋��Z	�\���2Q���\� ���Yg�0iU�_\>�+q��-	��F��+7�*|T��uN�s)�{ɉ�@�hg�Z�e^��bq�0j�|��^�W:lh�]}��C߼���M�`�«�w`c4ގ��:�5�RQy�i]x�GQ4��nG`p|��q��x'`L�������%��=�UVt�������E}��(�=���L��M��$h1��4�5a�*�4	&F�.:�'D@Zg3�-���z؋���IzX�&lsC����Lz~���/��ʩ      X      x��]ے#�m}��
~�]y�|,�n6/� Y������%�ZE�v����uj��,o��H$n@�/o���\~���/����o�����?]��U���	���}�ڼ|���������?}���7X��/���s�����_�������������_?��9���������m�/�J��˩�������8�/��VEUiカ������6j��*���r���H���}�t��7��������yM{O�ֿ�����nv��n�g�_�s���/�C��a�<�Ħd�O��D�Z[gMebR_v����_�t���n���^7��^?��[\�%a�×��~�-����o��GM4R�?���ن�B�V��_��~�����������S:<��b��I�w��~9�-�`�!���u��a��q8����p�l���Na�
�<�1����t<3�4�		E���^҈ĳ���C�n�AfD�(�=%��=�8\_�W�����5�y�$Ԍ��.ϓ*ŧ�'���������M8�MZ�H�?~��������_�X:�'��M!z���V_n�3��Uu¹;\���p?
l�U`Crڱ��:�������۪
��ޛȊ��D���h6���`���Ӄ�͹���~���{��y���ZkI����q<���u�MXy9=華*��/l��Z%���0�N$�ˡ�ӳ��[��J;?G��S�A�\�5I���m�6�'�(��==x�٠�u� �?]�n�ksz�K��3�]�� ����L�Q����1i/m�u��0������^P�%ܾr��(�G��*5��*�����qN�u'v����$5��*4����������o��_�ɴw�:���G���=�F����H)T���N_����~��}��{bIǺ�8{J�S�����,������Ӑ�z��� yk���qe��5f�x�v)05)T�7d쒒�kq3��E�����W����9S�w�f#������x�	Z�Ysֳڂ�Ҹ��(��Xs�UmAE��Q^��ê��X���XpBj҈�|��*���X��j�^b���j�����N o5>��w�J��_!'�V/)��	|��k��Wk
��g�{X��N���;Ѡ8gG�D�Q_�Ǒs �j�@�x�4�Xv��=PN�7c�V���%��7a������� _�(h�If:}ַ�ڒ.�߫Y-st⌎����G/����nҌ���+[�6 l2������ޓq����2u���o���NL�惡������<����QR[+�]N;�י�H����Ⱥxt��|~2���p����$@�X:h�3���E(��g�s4�+��j�x���=��9��O6��P, �X�B��7��\�bcd�?R�"v�;T�O��ExpC�/��H����η
�E��V�wҸus����u �tj��}���í=�p� p�,/����$�G�Ŷ��� ��u�a-BL6����(f��o50V��΁(#	���-���n�R4�U������t���8��XQ��Xx%�vSŧ_|(*�E�g���0�A	��4�97'�H�F��ާ���Y��qG�iޝE�����g^��lH��]�����O���)>?Xn*���D3���4�-6(Z>�T3^��M$.e&bR���^����]��f��PT*(�8�-g)I��H���g0W̡hU��`���ӏ{�6�%@07gh�`W�,DP��	ǫ���8��#��A�x�:)=^���b��+�ۂp)K�G�)V�����Z��nˌ����.7V�q>?��k�8�Ra��jr�u��v�9;�{j��^)���dւ.�}9��h[��>���6b�d/�ν7'؉tCp��wZ��G�	��@/Z�=b�d*��ױ5'���JeQo`d c���k9a��� �Uūe��;g�q��=(�*dSn�"/�����J�v�i���=fi����9��<���R�B4A�_vl\F	|�޾;C�����Y̀�t
�����oK���^٬��ȋW5ɕ�ۓ���M�JѯVn��N~�Mnn�+o �M��mޣ�1{K ��=L���=]7?�R��D��	W
<�B���!o��4m��F��m�K�������h7��a����lUu�.�}}�!���Z�B���7�J��<@�n�-Ia��U��S�)�8Tђ�WQ͟ �D@
X��j��O8�ī`yJ�������N����$�B%� j�[���u�$G������l�@�8Gq��F��1��G� &�X=[0��b:���x��kH�FΊn9;�����G�X�nCD�N:����z�	W/3Ԡ	�ܕ��6{Ue6{eF���%Y~}��s;\ygO�֧�Ka"-�~ތ<,0�k�����o���5B�2A1_����|IlP�HT�$%n���~$�ES�S�_0"s�E;J�޲կH���gp��$:9>��H��u�C�f� R����?�5CЖ���I���� k;����1��%����Lo �yƁJ���w��;оZ(W]���~��CRl�J���Os�|�	R�WbF�d�5�ay�>���+"P9�𹣩�H�֛���f~`���騂`,
dui���Y�iOp�����܅|:�J&u�uJ"�I�oVc�B��U&�j�"7�¼�>�b�+U�+����9��3�*1�� YSj�@ý�h��Ȃi-謫`�Оބ��ZR-H��qx,�Ӗ|X��7��ށ
���j��Hnd;����SvG��S�^�c	���x��/&Ք�^k�!yY��O ��a��( �P;զ�pw�(.��(�=��W���kT��v�/J�5$�I��AU���v�Y��x WU#���	���0**���Z�=k&�d_@c`���h\�޷8�B6�U�a�73#VбB@~��G
�3Ui}JK��z�F��:pB��6U`2�mH�E���4Vj├�~��2v��جPZ���� :�¦�Z�@biQʪ\!�Ξѩˤ;j��(�#�<�.qң}c�o�_���鮀̗�%&�d4Q�B��Ϟe�`�9:;GX�w7z�hi����;�K��dݕ�[�u>ɳ=t,�F����J����va��䱹!+��p�J��ْ�ɪ�l��DW�����@i��s닳�E�-%��9�)�H�w����dkH�C��0�eQ=�vر��o�@H�G��y�v�^��}{P��iΓR�@���2�������_�6�ܵ�9�6&�T�w����|xi�k�X;��(�^�(p��601C��3Z�x�,:���c��J�QYӼ@-�|�@�<����I�Yp?�䄭׊y�AMh�O�cѓ&J6���P���	"�<h@p5����śh^Vー;����"���~?�KFC9��5XL2ұ����o���R֘w�A���}!p��߿�Bǭ���Ja��e�@#+=�?�=��u�?XC�2�d&P�}Ąԣ�u��Zg��<����+�*^�<Q�}/*��4�R���.���.РP�?:F<]9R�Җ<�t1).!0U�[{��;l�C��9�m�I3�5�J�p��(��E{@����b�}, _(5_-�	;�F� ��ؗ~=���d|]
��)3���5���
�΂����J̣)��ay��*d�3V8V*�M}�����.f.�
�ŕ�`�2�J�طK�*]l��Ò��MY��t9����I]I��p��|0�ž�d��V�u�L:d7!��Ѓk?�'�*�ߺ�r)�T��U�u��72�Ɨ��x=>�w����p�YP�NjaR�M,H�� 4���&K��'�mvL]�����i<���KO����3����?U ZڤL"U�<��Ѵs#��"n(�L|RF�pZ�ќk���b��+�G��.X� ۈ�b�R~�b|2]�4�/���M2]�@��i���"��Ic���ESH��^�ͮ'D��H$Wq��D��p�QD㍻��xt5��l~HZ՛�+;k�(���     ʀm3��>�,�N(�֪/`��UУ�QzN�i��ҹu'[܇��u���������U������Z[���x�hWy��k��R��[�V�P����e���ܬ�`��h��)����ۯ\� ��Db�5�j�*T�a%!Xs?���4��V J�];�21�&:f�euX�Q� �]j)��:���p���q���\�%W�XK��m�Z�EnX�e@�t�/��0{�Eb�ÑW�����/{O���8T��Z%G���7���B`	|� x:a��hx�$ϛb��-�;�/�jW�%c7��Q��$��K��>L���\Sl�{�GTt��
�^�U2k�ZaV����Y����g�s&�|Ԗw3���+��e-� ��i&�����
� �,b&D���+wW��{�T�c���͔+�栅+���_��Q>��B%�.�^D�e N|�O0�4�r��h^>��($����i�~�f�P��!��������E�<��я��]Y���x���(�G��C�J�=�ռ5�q7|6`�;[��� 2=��\��;(A�<淔u�>s��^��t$/ʅY�@p�L�A������Z�����- �e�6a:��ж/��ˊ�]K�F��#�j�)Q�'Zl��z�{ઽ�R>
�����"��EA�.����,/�V׫�uj��t-�[��7s�z,J���9X�Y��.����|:���}0B>e�Y3���Bƿ����2�+�ԂC�w)VC����ы.�ӭ�~���3��U|�.�ӭ�`�F�l�"O|�G��V�a���Pcb����8��⌂o�����̀k�����u�`��b�B��������x=��@��`4�(y��lz���P��lEd��,����lI[J���t?؀1�=؄aき�1�v#-;y(=�t�A�+��)�^9�/݉[�A����3`�X�)�ƨ�T�:���'��l)�]On�Ɋ�cg�)i�٦�:_t�`�!rs&�M�^�UlT~6n6{��p�E��1P@�2��4p�H�*��b������5u�mg�b�r^}׏?<�,�2��"�.p�wb��e>[�C?CJ�ǭ��L;gÜ!qp��X�<-7n�I�̴k�w��9_f�� ���r3T"xE�諅?V0&�� 2b���t,��3ir�",�����|#Cзi�n8���ٴ�Z&�[��'e�l�u)*ott�b��R���O�E��L�#_D�3A�:��{�(�Ҿ��X݆Ѝ�+��������Ƕ9�v�G�'@�RX�5�cr��H��[xF�p�^�BI�a�81�!�J�VGE���z+�vtoU�XG8�=)�9�E�.}[�5�&M4ZGF��iEB<�=�=,xg%��MX�z�kB\���E���g���v�+��Q��	M��4|E0v��U�BpN�F���=7{�z��QB���w�����&^T֦4�9�7>��G�%���i��b֜)0���I,u@��S�E<Ɵ��Wc����J|T��n�=�]��!�h5���X�!s�@���h�6����=y�H�/Y���k/��
�aq�L��l�
����z��� u����$�*ݛ�as��|vG�,(
���e�@�k7�����y������Q�е/&�n<��"}�q�FL�ZD��gH��jv�T�9���R�+a}�f�LW�L�D|Z>_e'd$�J�5����E͐)X�o��f֊�:��ޣE�|8�g�6+��L�j#���|Y5aF5`� ���x(ӨɄ���M���79F��譭R�y�b�k�*a@�) l�Y+���]�*�ɜ3��4����)#�!�)�⻶�"y	�q&#؀Y���*8�����z��m�� ���A]@�����rT��(%i
�t���w�uھ/�`��N����Z$��?H�+��ࠄ�F���.�(|��@���MI3bJ�փ�˅q%ʄ�G�(L2w�5�'DY|aC� �!���("+�V����(tҚ���_jX1:�9^���Miǒ��p~S7Sf����lp��YhX��r|�h
��J�`��w���_1�2~<3�/�5�xld�ОLX�Y���g1!g��L��\ g������1}����R^��%`sJ��������~O�Qꭣ5{��TpO$x,�R�Ǔ�� Q����ͤ���~��2�n��j��~^-fb�1���>�3�)�m30��&��:*�Ş��#�ҧU)J�rgÄȚuT��6ǐ�F��S�ς�� Դ;�a�:!�(_�S��;x�%������]/8��{}��?������0�>{�+xՄ��5)�ݰ��(�չ����W��E:NЙ`������2^|N�J�5,ݎ~�%cP�~z>���>�QCzL��!�\���q����x�s���.VB�%N���N��%�z���!�ZuY V�}�6x��X��^��jX�O($ZT� ��������X��S�c���ⴷ.�s��P��.�k�,t~�=��S8q�.��h@!�cr'���')R{��o��&�9���2w�Z��6��
+�N7"&�Tb�|���. �5�7��ꪜA��_��.�6� 1�bo�2<�i� ��~Ԉa��rY)}-��xe�q�a[�4*��N�� �����(�Ah'!��� Y��}O����x[�-~��Ra
�vsNMi��5�"ϥy0
Ö��;�H���)�����_�<�-�����+�G�;��Y"������Se��L0�v�ļ��H�ּ��5"#-��a����[���WNr�P<��p<U,H���Fx�����y��nm�T���h�	/
��W�/��:R
t�An���#*ٗ�A*��,��i�w�'���k1���P��^��~o
DC�$��XoX���1f*}fj�)�a�P�6�}-Bs�_�
W-���j��o�j���=�f_k0=��׼7���V3���@RX�s�V�t�Ϧ�p�ް�0x���Y΂]�ix'�=0�g-/��@��?� Z�Ie���@g���=�QL�1�I�8	�+Ov�#קj���8@�|͊Fq���Z��v4��ϱtWE��᥾�k@��V��M�i�ILqlٚ;x0R�čb�F
ĕ���^�:o&���t��|a���z�̰
�O�C��!4�5&Tja���9|nn��R���[����O(�����<��h�=�`��(*���xg3֘*'?_,z���
q`A�xK�q���Z����"S:����r[�p؎2�H�Y�*�#p��l���	��0�"�$5X����h���m]�_��l�����S�����޸훢�+� <�hO�h� ����h��T����8c'DV�b�J��X��<��_udVx�����l��J�/�>���M�4M!��q(SR�WW�*�16��H��s*�O�1��n�������[I̼"���>l�gE�$��v2����M�>'94�L�zBg]���ݘ))o��{�.�C���l��=	[(0wBK�-�Ծ�ZT)��f���w?F��w�?V��� 9����)��,�G��?���j�~|9=T�|6�� A4m��{��N�M�+��؋�(9��/�J`��1���eR�y� �Z��V��;�uYNe�_e�&|�;B}>�����
�KU���pۣP`0��ԕ���Gz��*����@d�{O�r�FF�E#�U��%99��2,x�2(H�V�z*��	��o���"1�Gz嬞��a�<�{��fR��F��4���%������d`"lΘ��Vs�OP��$�
��4��
C5m��.�k�Z��T��%UG��.� Ue��w����t78cW��)�|zHe��0*n�tXi��	�|��t�{)14�f�Da� ��'�p�:m�2&�� �>Q���b�,�bm(�ŵf�$`��D;���eUsi^Y]ᘞ�ɛg�P&�R\-D(�*p��� �  ���Lu�Ō@M��R�.��.� �`��,�I��O��W�����bx7>���*SZ1�.��w�O�k���qI5����"lʑ>�0^c����r��u~X��M�p`�Kd�+r�/���7X"[�d�Y�5� P%��@����Gia�\��Z7^)R�����a��ZP�@&�х�5*��X�Xz��P'��3XG���}���^_��5��0��tP̃U�M��ʬ���zP�ߕ�a��XڌJ���Xl�uU�7};�L}f�+�Ҁ�Z�/��a��諢��.F�17�)�r�_�Ɍ���#�.������X��qN��r�ENU����Y�a�I<Z>����.;$�Β׶ Z#f	2����r ��8���� q�S��A����)3&~ѱ�kx}�>;a�疶���~����Mr�M�/�Z�㾹��9p�N�pK��`���E��Z9�`"~8lΆ�����^��7-(�͇���c&�X���f|i�K�-X�u��Ү�??��������.�����o^Vh�)��S�L�4��7�W�A���`g͇�@Z���J��D%�B/���$f �~�����*_gH#��\�t8�� Xl���%$
�5�n8?:F��ѿ78�l��	[�-�Y�+���u(�J���u�O��iĺjGEj4�p~+qNf����h��m���&O�XkjoR3�W�.��N{b]btX09
�+���o�w/G>Y���AvP�{�{]�ݑ����c
�8�K��[�}�O��mT$%1���6%��,�#�n~�!?9���O�J)K.�C�F.KF�2�pjQ�e�uk����d���48�a�Pcĕ	�<�6�DL�M�i�w~�!D/4a�DW�1	�z��cçZ1x�n��=��
��9����ݙ���/�����^ߛQ�,����G�ڞ�l�޶Ďq?�+�[`���(_�Z��\0g�M}\S�.a��∷9B�
�E���ǇN2�P�� I&J�0Z��\A�N��" wf�q"�I�IQ��ת���.��{ ���%�H�9�3R�T�}��OV�lw@�+�;��`#eR��+���hcA�F�������3��T8����Ԓ���K~�2u������/r}���7��v
8�\0����c{�e��[��w@�&a�����Ӓzn�B�=U.��K�)(X���\�5��SU0�7���W"q�w�uY���_��Z�F�����ׯ_�h�1�      �      x��\�r�Ȳ}��
>��P�G�e�6�v�㼔A6
�G�=�ן���� �sN���=3�쬼���R�x�ʯ�H&��xj�6=��˷45l��WVxe;��m]1�e����}aě�ھ�ծ���e���X�Ն�?z������~ڏ�>0����s�(�cƕ���G�k��{�a���<��qZ���x���qOn��k�n_mw�۲����/��^Y��%ͣ_��1�yw�wz�gZ�a� �^_���lɋޜoJ�i`��g;���]'�C#�}����Y���8�x�Ҵ0�y��ɳq��yo�/��x[�����>�wҾ�Y�<��;��ݏ�O��w��Ҋ����gۛ��7\Ve�n�#��`^�����P�yf�v�����:s�[��a�����}ZU�ވK�ݥ�6�I�-?V?� �i��{����~�V�߲�֑a���xƕ�L۵ɤ+���\�u��y��F��qd��]ٛ�[N��6�Òb�iÆ�)�r���=����~��� �l�&�<��خ�*�������}Ǵ"?r�ٮX�cD�����?�~�,zw��{Vlk#-ve[�㓽�~񛲪R�z�۪�L?a#|�|���g�<�̵L滶�)�u$LP����p46�:-z^U2?�!�Q��#�a<�>3�H>�`�n�G���������T腑Y�i�� Y��ա�;�Y(����:^��[Un{���5=�uLXǚD�D���g�i^�ao̷[�\��n�m[����#ӱ�0��z>,��r �ܳ'�j�-���8�cc��ּw��*�W��<��{�� P&�)7���u�Ƌ�*ϹHZ�A$�#���5�<����q�)[��뽷(W+�*&3��w�Xڪi���x���<���
�%/�����W��گ
�YN���P�2;
ų�]	�7�-\Lg��ӗ
�J�M)#l��d=	�1O�q����&C���E�mOm�4E8�2i�2ӱ#7�˳wrL6�d��G�ų1)�\î�*Si����js��n���WT��*/�7�t;49�^e���6����T�I����"=`�eãL��{n�S����g���E��7ݢ��L�H ������Y��k�n7�o��^�4ǣ�ϻ��ii�O�9�E����-O_�UHa0_�s<�,}����rYq���t�X�6�'_�o�Ǿ�ɣ�u�J�O�(l=�w�l�*pL?�]�Y��Q5���b8�G#���\#�Q��ǆ�B;�C�K��j�4�F��1_���Q>���Z%�1]������1�	�T��3Y����`:{0n�CQP�}�E$$�*�u]��r#�K�r�\o_���I��%҆��i2�2]�>��f��l��D��D�=�G�x1�N�h�,�����R��ޚ�����4�Xg�����7���N�~/Ԗ0p������X������%ܚ?̆��~��L�����Y�����2�4Mn�~e���,'X�J��.k��·	cX���'����wY$C�O�0\L�}��[o�J<-�U���0�~��{���y��(�5] SԾ+7D��-���=*JF���Q�,����"E㤚Vi�zBΒ�FG�� -�� �K�2AKY��ӈ��)>0���� �� ,�~�U��S$F�g*sN�ʶk�����(+Q��c�,w�����:���9ߟX'<p�"�u\��t\�q<�9���\g��CMǿ����y�ܡ���������!t��P~�҆%��\T�l���>>���Q�X��D�Cmi��#��������k���Y�����E%�׈�j��S�k�7E&<q��⍜w���E��v��!���Â�\�u��=}MQH�����}�7u%qES,��׾[ ��6�ATOuc��:+;��g2Ƿ<
`ӳ"[26I0�|�I����l�Ǹ�v?$���ʇl/�i��e�2� %�+J�t�)	�>�E�=䟼�NiY��D�\T70Y�Le�"��/��� /��~��� t{�,��a���5za���u��	^��5߽V�_�RQȡ��wH���3m�Y��M�z�@���~<z�?_��k����^'��Qf�NW��jя�"��c^@`�JU�CBض��ĝ�	�n>�N�{d�E�w�U�2֘譲*S�j0�z��HPa4�Q�\�g Dv��e�߼d��O2qϳ�Ӑ�,
,�f��tȖ�c�8BN9��ⷔ ŗ�)(4v�M����C��}���g��~At�G�#0Z8�fR�2�tTØ��"���W�Z9�y���2�<	G=����2�[":{��R"�<�^�h��HV2 ��C��ώ��X�E8��YG2�ŷ�Ĉ���W����+�sMřzx��s<Г	B�0C���g��������4�7��l�n� �6m~��0J~weIC�[0��L�c����j��@��+�F�F�d�_���eyZ]�-;4�s=�=�~i9-�w���Fy���I��4��7鶙Z�H�ij0�*�;(�i��+�@:(��CW�����.1�@����I�k832��*��P.��6-4ySf��M"'���r����P��?�ӊFIڃG?�d,�=���N๮+h�������.� �.�GF�Z�,uر�}�o�f�V��Bt�Q�϶�9Q�p	w@~� �����F2If����y�wS���	5�X�msjm*�fY���_e)0KXZ�x���� Er��5*�Ȋ@����\�8�[16)k�k���eM��R�۴U�W�����?�kz�i���V�ˑ�jN5��A2��g ���:ԣD��j�&�ϭ�w�����@�:�ݣ>w��Y0 ��(0��Ern۝���C�s��0~��%���&c̒��ڨ<�5�z�#��p�с�QNк"�!��Fb\(îO��S���M4��BZ�u���%���ԓk���Rޢ2�F� �]����y���!-��!D�K�)�������@ɪޯ��7�t��MQ�|_�(j��T��\�����x�s\N �"�ذ�!�<?d>k��#�v��y1K�	OUT����}��s
�������A�T}�_�D��4z8jy�wMC��;���7�Y�
�=��]�N�JZԡ'�!��-�9`1� ǜ��9ZA��>�Z�n�����i���hē���o�	�"���ie5����ݔϥx� |S�}��q��>�pm���l����j�]Oo'��E�����d�9����9)p��ț�� �M���ډա��H=s�г���g^䆭!�i�hΑL�7���*�,
��4N�mo�0��W�!��7��.��)�X * "@��&`^ 8Ք�S��\*�� �sB�����e�����I*ː;��z���+�s���>W�t,��C�A�ZNş��� 8 ��E#�md/�!Y�g�hZ9��y��}�i�(���q>�B�rL��˿0 wU��315F��
V��K1G��[��8Iy���5���U�=���e�ޱ�
MǏԒU��
$W�xT�R���d���~Zdh�u��&��-"���N�W|#�L��V��p�5�c h."A� 	�GZ�}�)~1Kƴy�K}��`�Y��(��QGNlB��n�&��v��A��@����L+C��R�i{�yr�|���\k��x�c<�����7Q�95ɕ���X�͎�_�q�"%��MO���q�avp�
�� �"�k���R��t1�����v�i������"�-
��q�ӕL�S1ΛV���dJ�f��
�-�@-�G�D�`���=X��(�� !�ծ�65ot�X+_��oUۘ��������,똰�*׉"׈����"��y�^ZMog�{#^��A���Vr�5���u����*�{M3��
��⫲c��~f�o�y��Q`�.�:zr�1���; �1�U=�E��h
�O��[R�\���d�n�˖�]ǆ��}��ՓQ�Z���|�������,�Y���= e��_k�}������z�B��K�V�i��c!�    C9�|�Š�����5^t������C���vٳ<���5 �%��;2�hFQ����ӥ.�s̥.f3���q�KCxO-/��O��U1֋e�R����{R���I�	
֥��VvFQ�M8�n 7*~W&����L'�<*�ꍅ+'��O�:u{�{�z�ҥ�i���X�
$h 9h��3W}�#���h/H��F1w�(��
�[�Nj9�_�4��J� 
�֭�?��R��;G����lq;)܁�}m{�PR+W����@���N�a��'���B����55⑎��>-͋���|��K�1���>�"K����{=l��Y=�kL��꣼�z<�+1��������#[ ;n��#ە�{f�F]?��F_4�����c�z�g7
�`�X�5��V�Z����r�9�'�Q='���j�g:�X��`Y�	��	��,X���{D U��z3�X��O����1�� ��!�}�+��f4���l6h^�g�#z�P�i�m��܆P�̮���jQ[<Ɖg|�fRA��K��S2�$UwM�����Ay�
B����?"��4{[�
ڴ'����F;�B?�㲮�U��f:[$����n  ���jD��fٍ�*��z��ԩ�Q-�y;-�Az"��z^wFDm�|87F���ҵ��ͅ��m�����������y��9vHzU�r���@���qN:.c�g��뉯��5�*$1�i/,h2ߢa}��$��V�c���M�Cv��'4�0�5�K�6�c�y2'CC0�C��U㲁Q��n*�t�����_'*��b�;!~�A�V�,���.�lU��xf̳���|��.����Ůq�/��`{F?XwI{N�"� 6��QY��"pԨ�0ꦢμ8H�)Z���Rb5����s5ՎW�\�ߎ4=G Q'%eR/������=��_�]w�W�����V({>I.֤�#`/o�&�F]ѡ�9���:�L)_w�*�ީ�M��3������5���,i-s����LQ-Vl�K��꧹��t=g�F;�lA: d�ך��Z�T"s{�$��H�&�l��r��Z���پ�)�bU�Ҟ�LD�F ���:�_���Z��x��L'���E�(zj�hi��#-&�_�2Pc�n���eX�����9�Ѕ���0��4=�ݔJ�]o�fF��y6ԻzBהS�Ͷ���̵I�e���P��}	<O{l������&I��~I�]�,$1�&��
%��<@���u�T����稇����\���G�͂�6�ʨ�d�57���蚃����J+�jz�хV�+�5���#3��u���XO� e ) UQd�7!R�-j���@�OT�o;/�9ϊ���/[3���h�\���&K�N��z`�1#?�@_��Z!iD/v�P6�[�f�	��� 1�(-L�w����2[�Pƃ�nqI��H�E4@�u�PwoB�)���(�e�
v�������T���xC[8���ڥ�9��:4J	H��x; fQk4p�8�����ؘP�o��*3)��'�M�x��6f!�/�-�9=mANx-��L�-��S-�a6����$DOhx�����֞�{�ҧ��=�����D'm��E�E�F�7����<�u.T�"/�9m�Z���ǋ5��-�}�m������[u�]V�)T@�@,��?<3D�J�PͣF��(�4<n!�%q(u�b�Ҧ@�۬K_�,��ħ=�@^x�0�'�	HES�����riBJ�q����ї�-�����\���6E�jML�q깝�	Y�SlRт��6�F�?��W�bZ"�h�O��!���y@VH�Ly!'+k��N�=ǵ|��c�I�Y�X�5 ��LDu�;q�<����{a3e���k32��-J����;2�T�sl�,ځ: C��Z�I���j$5��Ά�*Q�e��ۋ��F&𱺴i��������J�X;�)�9��1�EKyQ�B��-�=���n)��yL��0l��oi#BR兵����SN�����s}�$�-���H/�,<�vb�j ��E2�^'S#�We2Y�i���96=�W�i� '"������x=�H�����>!?���D�~i$��qL���A~��C�P1��G@���3�����6=��m�<��(n�N�@���"Og�=b�����]��Z���&(W�Ȼ�|���|���*L���9���|��z`��"�������Q1 _Jy+B��m��M�����nX���^�C7����2 �����怤ʞ\.�9Q5 ���8��t-���ƌ�|n)� ��H�ߔ��,�w~���3#;}��Y�@�޳
�S�x'���z3�����fF�B��6����>=U��G*t�ZN��3����{AD��1k�����≖i������n��>��Ӗ���Q��G��3d�M���2]�\SɎ{4KO��y�ƿ�� �7_���+��M�n�]W٧H٭\P���m���wf��F_��*GƿTRѕg�M5vu�ע��_����>������J1fE)[�p�w�9gVs�1�m���__����L�Zc�~��G��1�lJ�h�>Z�Ќ�!��z@����Vv���`4��nė��`jx����6[ﻴzy��o�]UR��,��SFfļ�
3i�"T���v�Y�5�0�\�9H�(W�Z�M[k|7��0o�0��u��9%hQ��p)3H��\��+���v2Jd�T�=ɸ���|Wz↥�L�rӌT��t%�H���V�PZ�N[�r�I�e��ո%�x8�7�� �:i��nb�<��/�}��4/iṾ��Z ���K7��o�kK�e疔Y�M�X~4�|���j���om������ Ik�]����R�� t,�=�Pi*�Q)�B5 H��[��_p�<���L֕��Zr�����!�r�Z��"D�(@�>�j��vC;s��i$#j���=-�fi�i��u(�whvش��t����%�H5��~��@>��븂� D��T����8Y$��QZ�Z�o@��{8j�{T��-���u���Ϳ;u?zs@���G-���g�����G=���yL;���"�uYKkl�BW+�݂Gh�e�
ĲT������l�k�m���kZt�~�2�+bY
��T�/���S�n��ܡ�,���U��I�[�e�A�����i�^Cu~O���׆��L_K�l���s^\���p�$m(�I��3,r	�Q���h��tB�)�Y��$[��\W.���W����z$�W��ڟ�B�,�P��A��xQxY������q���<줭�����֢��M�;�����[�Oz���G�,�e�<��A���.Kk���63���R��,�
q���{��!�@Ϯ簐}��`L5�?���i+�⒋�~�:���5S��kq3���z__z�E@G34:
v]�UB7���e5��<�cLv���?��>��7q��?��ޏZ���ZZ��#���]=�������o��=����c�B�D�w:P�m����vzk�!�����5!~�g~-B��%��fC�B7��Gm��.!���tm�v��ݶ�,���h+B�+�n�����t��,4<=���R�B���t~H�C����>ʎA{�f\k���?�'�ěּ�hXSs�����':<�C����$Ph:��G���	��Z|�=�N��tT���V�X�qh�6�JSb/�|{�e��e��򃴦+YT�o{���7�xB�/Q_9�W��E�D�-K�+���F��`�C2�Lt˳,2�GP<�V�_�$1�����H�W�)��l3rV�6����;R�YE������`�����;2-�������'e�<��t���J��=�4Յ��5k�N>��%�[�q�v���KA-͕�
��ҡ������o���q14z�OɐL)�җ%v5N�I�%QX}���9�q�6�/��K���t�|3��~@�X��bK��8��$�T��PyW��	�� r  Q�����7�L߿t|+Hwg4T���ӥ�t}M��il�if���E<��Vy�>S��(�����Wڦ}�*�:�ʊq���jP#,f~��B�L�{�쎝٢x˄>�E��F�\gB���:�%�_�66c/�G������ �Q�;T�=���zj�~�接w9� ;���U~ �����vԭ{}�-|O����6�/��,j&�-�������s�Q=&���&(=+�"���\�'��#�����̾�EF$}
]����Y��r�����-�i8���\�J�V�_�u?�g�~[$K���x�O��k�Ȍt~��i�>e�i�,vae��a��?�$s��Q��ŷ��o�����O�[�\@����$�\���f��C��F >����G��X��_�Y���c�z,ܢ-� 9�H��6u���:����q6%�)��i��-�I�L��*�5�F�z�x���-�Au5s$-:��]�,�U��F�]�բ;)9�C���x��t��r1�#������ڭ���W%���IHψ��v�{b���&"ϩ��^Y߀����9��`�"k�U#0�9!�Y{`�H��ЂNH�].��H��>X��6ϊ��'�L_�Ϧ�����JX������wҾl��I �t����{��%���x���pOj8��@Fu|��Q���xq�?ύ�r'�P�Z�=��P�^r�EX��j�����ߋ�諌��o�t��,����4'0MoQ��[��<=ZW���,�a|>�n�� ����3Q�%U�F�4zp����r}v��P���yDY��R�����$���՚}��7USg�L����Kot:#	�Ћ�H���Cs�֍ԉ��e��?��dER�      �      x��Z]s�ȶ}���݇kT��x cŀ��I��������#�x|~�]�Ւ`b;�jj�L2�b���cwk�1oR�ݟDQ�ֻ�_�LS<GW5��<�S=�_Us�MZ�]S?g{~5J����FK%ɘ���Xu�K�=/^��t�~���-��?�M��ȫ�h���j�JO�?���,ꬸb��x��Y:3�6t�aK?��W3G�\�����*M6����l�7��J�V5�=OS5���<�IZ�ؗ��W�%;H��X��"=�Çp7MU<6y>��E�s���,�������~�̮��+��{��4�Q�qU�mn�`��Y n�1 ��%֋(	#�5Pk`l]������5�N�K&��Y�5�U�F~�CU�?�o0-����O���1�WL3[�\Oc��h��ZP����ŗ��m���؟G��g8��?�0��g_�/�������8��:-��/����8��fvms�=n�+��g�lzH�SќF�	<�k�̳_�5��n)����ƚ�)��k�΂U��ٴ������`�p-X$��z|cG3��VM����~��=dU�?d��@�Gk����~�B@��J���gMu�ǫQX�q4��h���:���:�m�pum�p�0� �%�y�.�0қhF��::N�sUCV<VF��-+FIS��u�+�$Tj��5���;f��"�G�.i*T9.��XV)���!{����i(�gh��L]���g�F�|���bG6��m��ްy���;�k���Z4����AA�|?J�y�=Sq}�z{�i_�I\�5���:��U���<�Jg��ʞN���7���tE5m�Ę���:��l��Ț*�m�?���=�b�+���٪M���ˮ�㣲���}6Z5/?r��0�k|�2�<-��r�r�=��5+^D�,�&�3^ ����k8 �{����i�h�[�Ç�`<�)T�M��w�拨E��4.�����g�i��G^�tB��@^���y��g#�_�O��x�����]4��*�n3����c����v�F��kj[��v$��ӈ~ <}_�#�}��/|2���hݜ*.km�U�ݦ'~�x�y���xó<�K��*�ӡcT}l[
4H3<���*6��d18%#jr�E�#z�1?I�q��I=Ru�b>���X�x^ʙ�ƺ��L.yq�j-�������oҿ��L��nَ�4�Qt��o���#Z�m�#�.�c���_�S�g�FlUo�O���~�V�=�|�ŀ:��"�j���沚.�e4l�K�5U�`aB� ۘ�O3$�h�	�o�c�
���i��L�c�rJ��CE<�eY�^�c
Q�LHYUY�����'�fW�P���TO����8��խ@Jb�uj�:�t�*Lڣ�>hG�4���9��5����M��W��J�I�A�e�ޥ��H� ��5-И��U
WhD؋�8iV�v�F�&X��l2�o�@����dao�ۿ��P�?��%c�Y����M
�2�����b 
�)B��e��������wJ7���>��!�Ҍںu�s�3/�v�ќ��#�����}^���U/�ʁ�lŀs�]�8j �I�w+p�� ԑ@o��%�F�� &A=�$�s��io�ı��u�'�V�#�ം�l����{�z�Y�Ӫ�`&�u4���%���ng:�ٽ��*���B(y��n�3�����J�	�����S�Է���$������+�i+�	���C�źW�#�<�@�~��V;������H�2�e��,���E��C�7�4
_�������:u8Tt,~�ڙH�VL�T��PYC��m���,����v {���ŏ�>ڠz@�!/q8�Sֺ\�t�+j��yM-ڝ�&�u�e�C���t����a�!����&A��GH�Bt��v��Q|���8���+��Wh|�d1��(bTe)l|��p���(Fi���%qஂ���nƚ��D-�K*����[��nuK6�:�L!J���]m%����)PL�Jr�\��IE����'��YD������o��dZ����ŭ�H1����<.��t;�vu�:醴���&
c�F:ZI�S�R��.�VRh�Vn�BO�=�S�W�z�N��тS�Y���d�(�K-�f@7Uq]��(7PJ�	��� ^p=0�<H�!\In��5����Bd�CI=�"5)�� ?'*
�)&�� t�ߣ��)���`c(�p�:�.E׊��$�� ��I��%�c�W2=���(a�E�ڂ�t}�R�qʫ}]�u���Խ�m�-���������:d�S�q<�f�d~x�n��N�M��V�?��Ҫ�˩�Yyk����c�K�2iP��Y�=�n�9sL^	��t�z�t<������-k&�V�L�H�&� ��f�4B���/.����N%�!����|�O��BsBpx�"%�z���<R�B��A�Z`�X�Х%�,h���n'Y3_�sv�6�L��?�#���;X�ȋ�pF��"���w�c����y���~!�`Ze(~�$+{�b�Y���d�SXt�����`�G��������.�HB��8�.�����:�Ǧ>�e	� ��(ҺN�,�^�u��	�-�x�τm��͔*��k�%�U��piB&��W:P5Z����w�,W9�{@��ep��c^�Вg�-)&خB{
����L��_wQ����:N�U�¯�h�vr��4?tY�<=�;�b�[գX�'՛�E�j��޴,Ps�b�:��9<	��O��@9����PgD�M����0�F�f���Ձ����C�{p��ض�U91��Aܤ��t�M~��BA�?^1�a���1D����6��ٷ�T��������d���#��z���+�oؿ荘�6l	M� ����Ʋ'Z$�cI,a q�`m$M״Y���?PLd[�D�e�pG��C��Č��7�D��h^e���M�gG��7�9�����Ç��D��`5��X[�M���F��6�梢D��L]S���51ީLޞ������=A���F�T`�iԨz*�Hwi�=���3ڏ*p4&��������|.���A�"��`R�,��>���%+�3��!����|~,"��2�딜�)����m�2{�J��:V��hR3�y-�YmӶ�t��{�Ov,��A�q"�jr���h�YZ?gb�A��~�����5�)����/U\,�ƺ��Ю $��;��H�"8=^�k^4�X,ޅ��8M�.��-NM�B��?ɼ�"@~i���z��IU��v�Ł�%�e9�E a%�i��{�Hm;�ct���m����?��NW���Ev�ʬj_^y5���AC�:���8Π
��]2�Y��T/]6] �Һzף��y]�1퇦�yEa�.����3`sD�E�t���v���������m�`�ڀw�@[��~#z�FO��Ehݹ���1� ��؟�~E�$њZ/��E8��f���V�+LP�K���(N�cw���v�pƵ��	\����EJ+�v����U�B��h��b�hU��$E�]��ݶ%ᢕ����4Ѫ�O��*+�Jzb'��m���}�'����fX�ۍ�زIɉ�ǚ�)&zpV!mcvq�L)Y� X�Y�V�:�a�C�����Y]�5>B,�e���+�)�"�b}���K���-�yz}���'zL��q���F�L�!7��6�b�yF��Nl� �*���C�+�Z���2��6x�Z�8fDm�M5G�[��l������aU��(��;�	����l���,�l���� �`��fr�e�s���#�h�����|;7�6���Rܳ�;���F{�Y��683����/�][:e���ݬٲؓ0Z�w�,�q��lik\U�?��t�M�'n굣\������ԡ[��oO�>�bq���~jN�]TO�<t,�Xu,*��[���S��!��S#��0��G�lr���.�4{l�Լ�2�Ə�L)�s��Z�zN?�\�4G�\��i�A3-TY�e%0�����aj�rIX�1��q2�;KG s  ���&����z���%&<FE�y��U�KY %x�a��n����,�N�x�o�L�\\m1���#�@�7�YӆB�MA���ڨ���0d�b�����(>��T��+2�6�z�ن؀hB�����%��!3x��*�K�e3��T�D��u]��Sy:�u�
��u'L��1m8t4)�������b����huZ�#\,�)!X�72.��P72��.���7�W>��;T�L!�4�)T�a���d�n�h�qd�m�o�iҿM����A�T&K�zm��#63g����^f����}F+�axn�J�*L6�mA����=��F�f����e,aT��6�s,�`��3$�2�|�i�����k�!1󓱉�|UϜ��>t;ZL��Ƀ��Hs�JA��0:�I��^��N��d�Щ�hJW�b�Z~#�GX�f� ��iޤ�6eX��?��Mܮ�^E=-�<T{�ؖk1�G��{)�{��=;�d7	6�ƞ���?�Y4�k�����w���A7B1��t��t����q),1�q�*�G��s]�>Œ�k$U��t7]~O#�@)F ������M�7ֽ�N�.Ej�g��4�S~q���bx��vD@ �h;�	a�;r���-X $*��4Z�� n��F��=Ex	������b�ʸk�P�C�ʊ�)T[�����M{��1�Z^|م��h%&=\��p�����:�܃|�N刮d�ײ�� ��R�>�{H�/�fi�s�VG�g���7��6i14+�-*F�KS��pM�C��Ct�H�y�,�������,Ϯ���OX��Ż:�%�(ր��EstG�wv���K�c�&א�6��qQ��g6Z�vT���&[���W�C��O۔w�n�4u�u1D��%�|�����mM�F3�	M�,�H�t��;�%�����4�2q�
>G��Z:�>�FP������|�.��ҷ�����zo>l�\7��-'���Vֳ5���}����Ϸ�-͇ڦ��û8H'�B��(�G�L+�r�KjwOEwb��*�_�2���e֟��G�z�*߿������L����L�l#������Q��Þ��N���ۘ�N��O�8���J ��S�:d�O�O@���Y������C��=������2�_D�!0ٝ.���v���uk�Y��Ka���B��A�vbۣ��l��_`����Gy���+8p���j��ڰ붥�悵��s���G���h�w+ C�����G��+��K�z��Df��l��oca�S<��� *SF�	z4��%�S���G_�c��x$�ʀ�{�C��Yޗ!�b��~�O��S����7X{�	tpmS�����.��F�_�_���aZy      Y   �   x�m����0D��W�P�m?aW�!�#��ִ�ĩ�F���eY�.�'����E�Ü/J3&��M+nX�A�ۯb�:�v�j�Ô����V�2Ҟed=���*:����~���)��l��x��%'#�ɐX5/F�gt�f#X�i�)~pb�Ԝ���d���<�P
Nr���"Y�=g6�4Aݫk�&�!&��UY�wHWk�      Z   o   x�3�4202�50�54��N-*�-�K��2�
��q���$�(�'f$*�$�)�$f��U&rCU��r�e'���!�ô�&���2 ��Z@�Ӂ�1z\\\ J.%0      \   <   x�3�44�05��4�4���!###]K]##CC+S#+K=CS3KS��?�=... SSC      ]   B   x�3�44�05� R&�Ɯ���1~ dd`d�k`�kd�`hhejlel�giiinbU D�\1z\\\ ���      `   �  x���Mo�0��̯бÀ9�G>.���$��ۥ&QͲ�Ir��׏NR`(��zDR/_�#(k�n�A��(��X�%60���W��hw¡ae�Jؽ�a�f��x�2��h���r��Vl%�p�b�P�?Sw|�Q�TN���ƻ����D��z�,�b���� 8y�^l
�>p�n����gP�[���LW�����)�-œ�/gPh�p#9��t}�J���[�>���)��Gv�Վ(e�@�r�c�ELa��q'":��x�r��I*t߱�aŭP����7h�&.Zq��lqk�ߥ�R�ڽG�pmz�h���Rz����&� �(�k�. ��ލ��i�gfp��@:�PQ�eJ�#&C�(�A�KF�7-yNl�Đ��P��F�#�ʣu�	%)��갖��.��ֲ��dt�F�1�n>�h���ɋN�a����\E�)
86��B�↭��vk��Q��!T���9�3��2���*ګfO�T�ٱ�n��PVK�e���ɱZ�d/E�<��4�%�N��Մ斶Ҹ��J<��
:�5͠���X��]=�$��SXG�~r�i���ֺ暞�QI�����'R�=�_�!,:cř�#�s�
�.$��?��|��k��c�n�W�~et��֊F�e��I�xM.�ϫ��c�*y��4�ư�-C��&P�N�� ���%	��w��_~ٌ>�Ǎ&;{�?�/ O      a      x���v�Ȳ-�[�)�\]p�	�A�%Tn�X�%���U_}O""SW�ZH�C���vwP]82�s���r�1�6�~��PԮi~k��TM�(��Y���u�-�u�aα����}�u�����C���KF�-�����5��f���kZ[i)���bVj�lw��WdO��r�ť=�e<x���Қ�۱,WY,��������55�[��MW����-�7����_�2���x}�����m�ߚ�7�yj�	X��8����f�ƿ��Ɯ%k�*s�Y�������p��NEtd��j�/#���7�_����� ��m-����!�޴n�Օ�q�{��5;ߚ�oj�İ�a�o|��l��{�sK���3؃���^9��eV4Z�2w�g9`���.�io�Xu���X�К�Y���5�oZG���4�鿇�p�lo������j������-����-�ƫ/0̑��
��� ������3h�����=�k���e}8��`f����Y�΢z4-��������NNc���Ф=��*��T��Μ�C�]��	G�����Hߺc�o�Oȅ'��n�$Le⍧��k��ч�mB�{�@T�i<��߻遀��@l<�G���o�y�����`}�>�c�e��r����O?ow0A/��GO��sk�ڊ��{��k�������-v�7���Gs�O�����Zv�;x
��G"w�/�� ~���/�{G3���=@�ݕ�@08p����ͧ�>�Q ��-���;~��X���˘V`��	M�,�U������5��!��#^gr�3��|�}7ܶ�=�?��E��+~ w��x	�d{��a��f)�A�he��`�ƞ�w�!���?0�2k6�2b��w�M�?e���s�,�x��C~�Іsh���y�h�W�2����R����UU���2��?���q��ZWZ^>�P������]W[�k�mCx�m�4X��og��Et�����s9���3���R̆�U&���!�)�i���ц��`�p��G���瓆�\׹�Q!���*.yt �S�.J����L�)�%���^�9�޼v����`���̬A�Υ�����������ͦ+�������n�����k����7JUY��և��^��o��_$.���/����TU����{�[Ȧ��(^zQ�v����i�𤬨�❃8{O�Jk'����eg�m�zx4HOd<�Z/uL!��֬o3�o��E��5��Q@Le�9hjY�Gk?b#��/n�8���n�_#nl6�_�zۜ~��sh�$�`������1�\bbyX����#��H��v8��f/�l���tY��6����zj(��=dC�=���!�� �.�����<Ř��8!�z�����`<�4��+e��-��?����e���c���?��1[�Y�n�u���y��R����&C�S0�5i\�XRI%���#����?!m��͎Y��p:YX/�lX;�w�c��x��3�Ƭ����~C�`l�/����w�~��vd��2��x���M����jHΖ��boڃo�XO��!�b�gr `���w�x KH�~�����[�oQ<zJ_���!�JAO�o2gC�_�K�A���ld� F
�#��[g&T�z��mǌs1E�믩�J�}��|�������nM~e�2��=˩]ޯi�5��`2y�r�f�.���X��k(Y�iS-I���gy��-K"/���O��31����8Ngi"�xu�Ծi�c����!:���߰!��d�]�P�L
���f�:7�§�-��|RsQ�ϤTrY�$��r�Π~@C�i*�^�|bC�"���翂!���i��slX��cD�����ӹ�Ԓ�xϦ��x e�r@��Z���+T�5��̫ͬ��۝�%~�W��h)�=�{̵����/U��9&��-8���}��g�2Mуt��lŐс5��r��k��ߘ A�e�I��W�bK3(����/�z��7�� rU�����a�7!Dμ'���� �"�!Jܑ8�K�_*��S[A����e>��#�����;4��E�C��W�\0c��.3�7q�9Fϑ����6$c��to��K{T;Sw0�|d[�����gF�h�)�J`Y�F�A�;�9V���������މēg�7��J��,����vc\��X8���J���e�=�A���Ύ��i�Ǟ�o2�~��;�U�� �~�]x�c��S-��Ǹ��S킫�T��\Ι�T�$��=H�C������8*��g�6ju��N[����ݯпG�_�������d9�˧�*�����!�/|���p����:�}6	G윽b6�ݛ�l6;_�𜔸l>�8�殂����"�\�	&g�M��}�+?N�-@N:9)�vև��~E��A��7apc�#Di��m����i���C�}C�s��6�0�"i�x����V��ҭd<�
��l���A��<�����l9�� ���+G���oɐ$ý�}cNp�Jv�#`�����z�jV����?v�;�(Ķ9XZ�r\Z�|�u�C�zO6&���`��E4���+��+�M#>5���M�G���其.�g�!���Ô�G���Ρ�;�Z�e����� ��i�7��ގ�c�<���y���*5�К�l�vV7�G�9�6f�Ě���M;����^��gbv���I;?6�2��,za����g���ʚbC��.�����o~��r�^��͏�Q�Xإ<p?ΡU�M�C���	Z�4��a��u���Ο�[������Y
�%s"������pƢw8��������O��Mj�I��<�|B��[�Χ���p���=p����2(�	���fН:Խ�E�����yu�����������T^�iw�<��K*U��N�i4��`6{a�v���߀Aa�c�5 �t@>ڿ˯��������@����2�5��#���?*�G)L���eЛ�����Ƶ;U�(=�o��295��yP(؇8���<�V�_Z�u�;��x"�b�6XQ��&N䞪�R��7�MA�b��({���߷
�C8���̓�$X�>0po|��h�员�]oRd~z��Qú�ЕG�Z�E��1�j;����+c��7UZ`��o|�s [�户"�[��sh!�oa�֗��饲��(C���6�\l̅r�U�����f盿�#D6Z��.߷�8���E�
�6��]�~�n)���>x����q��m'�3�-��L��	)�=.�7!�����mk�5�~4~����*h��?����We?k2��O�lo*��[�c�<�$�y�ݭ�}�"8O�:w��ҳXA~�zL5�n{o��u�tdF��`e^:���)	����MhBæ��ڷ�e�i�)�L�c����8=�-���G�Z�T
���Ǚ��lD,B�J'��5��D�~ٹ�����|fg��a�^���Mr�5�����(��GL��|���÷���ZK��w?nk4yn�?��a�!:Goq^��4h�^2�O�hڹ؇��j!۸���Z�ֈ�u%]E40�6�@�����ozSYH�Gx��j��3)���fp*���<+�pg�mӱ~4D{3垛R�T���`C��`ׯ�h5��nMX��=y4"|(�xO�l�����?ց����|���Y
Ig|Qf����<�a4������H3(q���/1\r�p���kp�,�e`,�5P�J�SbS�CK�F*�c�\q�#?�8��$GM���^��ֻn5���[K����M�"�8td�
��m!������ ��_[t�n�;�XR|��}�&�%L3/b	C{�JZo���2��|da1��{N�rn�A'��bi�w؎�f*G���6�w����rN�t��|Z-���Ay?*���o���O��z%�~�e���(���m^{إ<�W싶L���� EcT�!Og�/>rt��O E��c�D��'�o�G�D?A�������K[���o�㴹��;μ����֔N��    86��J�^C�����|{Z~�_*�^|<Wa-��xt����	��Ƌ�~q(�$Q�P���ڕ�ҳ��2�i2�EO5u=��4$�$@��SBY�ч�X�X��Sb�>�_��.ƙ��T�$E��_o�����9s�R�m�L� 1�������DK"�܍4hW{���Tq�o���|���F˴�Z�D��h)�ܐ�-Z<E��Sa�	� �:x��)�G�]��▤,K���&��bh�O�|1�é���6�;|��������1�O>Y˓���;1�\�O
G������_��r�f�����e&�I�Rl����	L���������;��j��*D{��,&g=����N&<LSV��˹�8U91�sQ�]��f&�F��-�Rp��f����aW�����eN�tw����_�m!���F�YM�s�䉿����l��훥R�[�0Me�C���|��J���������欈�v�b:o���}��,9�^�6�΢$Hq^�`]f���ă6���{?و8����>���
��ba�����U�H'�"u���x�B�I�&��8�]��t�SlMO�7�tQ	�"]���r�u��\1�4��Dvd,v�=wfRC�}$dL�r��f�)��<]ű��E2/��0�s��i����^�{�b��Ԅ_�)v������y�J]����4�4�.���ý��W1�hS�����} �\�C�K�E4'V�C��V�A�刻%��FR�T;C�
\�)�q��-�..|[*� ʰg~ท���$�p/��z��g���W�*]��^y�H�~��=��^wh��x:�L��hD���f��<{�fnU�����?��7(lS��lJ��Z�����sA`���i�����|Z�v�G�#��͞��e�l�,P���ԑ���T�c}��g�Qm��R�M]N)��n��R�p�F���m��͈c4�ơ��E�����ߑ�b�������	q��iP(��P�pOx��B^����xO�^E��6N�T��om��J��K��n�65)R�D\�5|^�//�l�z�v�ڈ�&�F��M�@�3����n��L"��Ex���fc�s%�{��,�H����Ɖ=s�i�θI�P���}D?I:م2���Q�����k
mw1״�>RKy�����Q7D��貑�;�F(O�P�]�m���oD<��TH:cv�]�=C8�FHu�rY$��;fuh��UP#���z������2&vT�αx����v?ݘF���}����.UW|�+�����߇�&�~�Qc�+���5G�?��	l_|����+�4���c`ۇ��<s4�G랶����(([04��G�َ�\G�Q�C��g��s�>��/���SPF�w	��>�OD�����S�K�^��#���C��֔zH�*F�1�ﯞa�x����M��̈́�)߃@�a"���"��	�R�S�F�<fH�Գ�7�����碦CҍX�ȏ���IB-M���*�;����\�Ym3+���\��"jl���/=�RW~�ubϦ5�I���/��\l6,m%��c �ҝ��*���C�cCt�$o,��h�r*J7�P�B����v�P
�\N�$O�����l��9L%qJ���?�G�)U����~8�7�أe�9-fl8�5�p� I^��b��p�����/����Z�[*=-���?�E�y�.~Y�_��� w^���R�Z2:�hp��D@,q�)�t��t�P�*D��|�Me9z#�l?YBN �l�j�߉I��G�GLz���>Kc��|�,���Ճ���߷D_����������Qqd�ك1�q鉔J�nf?������$m�W(pn"B�.����M3����N�+�v��xW�o�oo�F�؞��2xi|�6H��v&�W8���A�[ҟ�r�vu����o���s����װ�&������o�� ��	���cFQ�����='���	�ȃN����C�
�P�W� ��<g�f��H����'7�iO�E�R��qB�(�1�t+���L>
a%8l�8 �g9Dqg��chu�7N]�g��(=⊇bB�yU���p���y��!q�-�� ����#Ҥ���!&>!x��wv�h�}_�6�X�a�S�����=!�M�ǥ5y��o�`C;��}���)��B`E�ðh_��j�d�R�6�\��4���`�����k���a�+jȚ?t�I���P�70�,���p�5bl-��O�
]�����^��Z�l�y�ԵS
�\�A���DC�ߨ��}�֔	u�A�C->���+�n!Л	�*����;X,�Xh�"5n��Z�1.��
$�۬�}.> ���v�I*����j!l�^;�&ӄ���	p��':R=�hC�ۊI��+?�$� �QBQ���n�j�J�D�)�7Ĝ!�w)���K�����\N��-�2,N�>Y��+�d[=oaAu�?��`�M,��X���2��6�ݹ�yj9(��zA��N�ѕjy�r���C���;�V4�i&#ʪzX�>����(ˤx��!�b]8�����x2��x�z�3g����&�gkw羡�S]�&�_�����Yt�&Q��@�!�׫�u�I����
�� ����� �;�P��_�<�������G�M��x�l�U�z$�]�����T�<�r>��ҳ��r=��^��xJ{
�BOXJ�%��͝�i��Z���`w�v34�ن��ye��m���	���?k￢ 1F����B��g�)�2{\zU�na��B2��wDWd�/c-�,�Ԥ�|F,/�a��Q�f�>��F���8@���]��)���)�މ M)��m�+j[-H7�ጾ�M� ��h✊z4IaT���0	z�՞		=�"0�3:�����+wj� 	|B�#�gK���d .�"��iIY+�R�g�-i�+˶�F_���}��3R�X�?�c,�!�ҍ�_#2�p<�yAiJ;׻P1���aFu�B���D�\A ��v,�d�2]^��&p�����D�:�H9����~�&�䜯�U��]f�PNW�xUH� �\�TC~�c$#.�JG9}�G��v|��J�.���`�c�]�hm�^r?��[�ۭ"/z;MTH��?�����,�-��v��7�yGo����ٛ*�d�TNA��R����3IW��Fo�ZJ�Q���1Zg�/�.�4{(��X�-IRIP�ʧc�����rZ�7�,��&����s�� dj䶔Yy�Hފ1���T�_�� �Ò]�T�zC	*$�c����%�C"���?$����"�j�L&��G���	���^������̩5]��c-�ڝBG���h�v~��i4=�;����h%� T�i ����=,��� ��>���7�2�:e��^
s���c)c�v!��]�DK�3����h:��oT3�lV�8�5��K���w��l^�=wHy��;ѽ�+ؐ��~5jM�)jh�-�<�R�D��C!�|�� jB���w�)��T�SP\c��U@	�� �o��޸�Lo�S�	����W_���p�^m�ؘ{���!˪.��fO#�Vkjw8q-��#G�����'�Ţ�vp�3���f'�kRi���_��Rc�/�&g�2C��4w�b�O��0=�����]���Mmj����Bſ�������
�]ce(=økOi|�2��&�yr��<�p�ho�ݦ�VY1�����w��d��\o`&;��l���Ğ���%�5����B2#�����xG�Ƕ�t��A�mB@8��֝iA�Z'D�(��U�F֐�٣S����KЯn�hQ�j4�w��G���T�U(T��3��Fd*��t��eh-&�vB�kw5��S��S���r"�7&C�j^>,��gi)Z�{0V�^��x�tp��H�_�r�c�.9��m!���;T�:�4y�����x>w�rY˹�<��"��v�0��5�j�|t9��ӊ�.h�Vm2_RY�Dg �bRf�64S�"Z��Q�q3�5�r�\o�0&e�    ��� N��T�����!lz�sO���W��Sg�=3�S�?^��+��{B�d�k����9��	j�A�v爛v��� ��'�G��{LK���zpN�P���8�-���1���c���`M��GqUiWףД)��gk�ń�tNU�:'9+{��r[�n���f��$
+��v����wa��P�7y� ����`dʸ�t�q\�3t�C� ����5���$W�5x,�Tƙ\�?�> �A�+��҇�b��uSB)3�i�ѡ���RE��<'R�8�C�-Q!U��e��i��n�>f�j�������.�����,�\4����1۪ś������d���o��c���98,mёey+�*ꎖ�)�'�2,�,S�$��g���S��D$��S"29Fq�j�لx6�`@ޙX�x<�M�Le?��潍4�]D���O��� $�m��sl	� g�nDd��������*Kv�i�J�%�B֩_��w�4�E��/��<��n��X���!����2f6��G�M�s����Ew��RU��|;oʋǅ�Pd��x_.FR���0'�TK,��3���q$T�V<�..Ʉ��[�j4���[�ԆZ�k};���XGb�Wl8���U/�#w���ŭդD�y�8�v%"��LK����2l����	��.� #��|%\1����LPI�-Nܩ�T��N�D9�".lʔ�o_:P54p��d���/��T���-�UI�u�n�n�	r�g�f��r�tW��v˩'�U�j�J���lw��zNd2�oy�}!^3�C-K��F��
���襜�rq���S=b�������y�!vfv��` K�>�ȆRxy�F���,F���B��^�c��Li��2i������q�s�� , ��Hϰ㙾�Wc�lʈ���Qx����J���rTS�3��~�.m��3�!�%��� �Dq4��5Kc"@������oEkZ,���1H�K������Y�F[ˏ<'پ���`�� ��'���'��F;�ghp�W�g�2�O�rY5q�ۙ���Ʃ�#��c�"�j�Ι��sh��V�A���h��{ҍ�x�0L+GNRNQ������۹���FW��{Aa�-��A�d��Hn����k�'U���F�Z}����.���Z"'*�+~{B���P�����2N)�Z��[�����}������R���ᨿ�u��4;J_�A�A���9�Z�bq8�I^��ӑ��邩�I{nml�F�� �qZ����ts��������-MY��9�v5��/ƶ`��Vud$�b8�Gb���Px��m���W��}�|��ৎ��R��Li�����-�yx��E&����O��U���	�ߠ�7�e���\i�B�����(��N�F(�������r��7�3�j��ܭ�w����s�0�=�)��������	k'��f�rO��rWJ�׸-�2R�eS�т��IN���gcR�3����l���
+�rR�74k��O�)����-e�rӃIc<XZ��`/��|�� �y�J�B�V���	"�V��8	"�L�ç�[��{K�T���C��RnG&�=Kz����U"�ckb�ΠvJtj�� Ut�1�KZ8�>��uÓ�g4�wļ�*�������L�	�i
�t���I���x��Y��Rݵ�WUmTM�Qv��׈��B�%�'�(���}��3S�->=�|��'����S�,�쥧Pjy[SUWH
��̆� %{�}0(�?EC/��3�q<��$��#�v'Úv���r�u!��P�w�cj2خ�����[�8\z,�j��,��`Z�52SS��{��.���v����b�+�����\�ɢW���nb�J�r�z��J�����<$�Ncp�!� ��mW�v�Y�w����Z��9&s�qFҰ�j��e�P�/��S�4�2��dp't9�+�3;�*��i)�-�?��l�{�c����o��G�</���c	/?��f�c`p�8�Ƀ����$�~E�a#T�|E����u���#�7M"�A� ���ꥸ�gH�c�I!�.�l��=!,�ʴ�0�ƥ�Q�{C��`?z�f�����}��Fp&.��-JU0N�(�6C�5�5�\5r�s��Q�)�(��jޙ�'���OK_�Sй�;Ab�>n:W��w�*�q�k^���U�9B�g�����]��ƙ��X�&D\Xq���?�V̷��~j\٭�*��㹉iJ����w�b>���O�9���%#�K���A�s��|���kx5;�d�x0�س�U��Q[U��e�Lv�JB΂f��-8L���n"KR�u���m�,���c�ΗE�5�e�i��A�d),Cr�p)d@�ݿ�Gz*-���x3���%E��l���Ys��8�-	�g�L�-زG��?q-cM�fd�����xn�o��t(���"!gE��W��l����#ҐL���9qARm�K-i�څ��C:i�eG�g���D*lH�F;��R��2���G��<J施�'=�L��ؙڼ����ͧ�c�l-Q�)wAJ{���ݛ�e��6�����҂v��� ���]������� �_��������b��^W�a؃���UZ��~ߚ����Y.:7����m��L5��D�јg��-�#�� �=*�u' W+P���,$�����������;J6O4;�I4�WI{9��"�(�]�P�=�1�_[ti'O�
�*��0K���G��j�Վ�G0 <Џv1�jʂÓ���(3<����	�(�f8}{>!�?F�/=�
��ۨ�;	�Z,�G��.y_��v�c����^��6;��V�Z�Ě�����48�᧿���/j�%��xBSw��*5�	n������S�&$�r�����b�Nq>"[~��8����
E]�aTT�\۴�NCǃ��]�h�ھ}�����{Q����<:�>�����=ڨj���~ue��.%��j��O��"���8���tX�̯$�g2�-��*d7Z�Y���ѩ\�Pl"fy������|���"� ��,B�	f�;3�>[��5��R����2����t,��  y�FU�`,Q'���#
���S�Y-�;Z���C�,�U��x�T=�%�	�u�H�M��5�O�s]l9���d>���w	N����l�YC.�|�I�͐�t�
髡���J!��G�LcV��4oh�׺g��~pd}P�����h _z
_T���QD=���[4N՚\�<��k�x��o�KvEXaJԻ����4��8_�����?
��c'��Q+���4�����;BR�rT�r%���A�t��̚y��:}�s��8	\s�a�⼙�`PK0fD���U�)��+��2F��(c�$�d�̭*N��x(��kh/1��	�<���-qt㕨x�/�_�tܯ5�R9��Ѯt5+��ސA��� �!bbv�Yfwv�&����r��;������jpU�Fo������&�L�r$�Rg~F��5T�ȕ��4u-ˊ���\E����!p��ָA�5�>\6�f����<��]��>�*.3�&�ؿ��<e�~ua���mn�ƸX����U���'k� ���$.�O� �d�-?b̜F���u"�%�J�O��S������L�V+I/߂D|פ�N�>��2�Xdʄ���7%6���Sc3(�փzk��s��N��Kz��S5[�/&?��0Kݶ��U��O  U�a�K��U��Á?v�4)T
T�W�x��3�(��Jz8�R��a�ŵ�ބT�F>���0P�lʪ6/ _^kW��-�A�2���z�X�:�x��4�l�]�q���) ��2S����S�S�X>y�$8<Vj�jW�M����T!ٔ	C�L��^�C�ߖ4&��Bn ѕ���=�����-k�"RMև.�	��s��TBt#� 8TZ��J�UR�=�`.;F���x�U��y��o0�	9!�|�t��	�9'�}ǿЏ߾�,*,4dG6�)������H���h@�E���C�&f�d���7�L�D�؞�/l1    +�� yS�|��~�*B����ɚ0i|�X���x���
ս���/<�
4�9�Ԛ(�����0�	��q&�;�!�&��&Ur���-����;N#�R��| �m�����Ɩr�E�a-��w{GBu$?�L�%�+�s��M��pX�T�v}C�i(��w�mf4�v�Q�$�хá�)�*����Ǘ����+h+��ŞW��Õ*�:�����ĸ���fubmx&.��я��-YA(B><,!=0��?.c	Mf�*�k'
�('ˇ�!�>*���lJ�a7��ך�2�fK����rgƹfS��io�0g�h��sx��8��}R�R������roT����
�u�5ۊ뽀]XSI�\��?��x�MxHƦ��u�l������Pw���+B��xo������9Qc~B�3%nᄮ�Դt��}�hC�+��Kkȱ����omW+�ݑ���|�qq%���$��*�@=o|W��FP�Y�%U����"�L
�1iIK.f��� &���'cdcr]��@s�c'^�ăr�T�{c�%jA+e���`�%z���;��̡�l��iqcpw��/u�n��=ޚ�fi��8�$�d������b �"g�S���>�θ�Z?���k�?�?�&"�g�G�+I sj��*���	L'�f�ᬮS��It��
kvpS�|c��\�h_
LM�م���%�Cl�b��J}��sZ��o���_z_�����b����bR�bnѢ�|;	P�zŬ��9�s)�$YQ���d��y��@ؔ�[5TG�TC�p�j[FLC���q9����I���:��z�u�R��m���,��d�Cԗ�b�?Elߛ���x��1"����ǰ���TA`��p�����<� >pO�/$�d�F�<�=\�Z�w{�������D��}�1�R�Iܷ��l]��k�7�6��%h�����n�A��HO�?~�]Ʒޑђ 	BLR��iq��(27�W��Us���hj�$��Μͼ�|��Зь��ҙFl6g�&�Ӟ�4ޕ�`j;񈾴��#���Z�ƗV�Ԯ�L�9v!D}�%;toؿ���}�&Tax�'��g�_f�[�*������]�Y��T���9K�arKB�3Χtd�iiӚ�J�la���n��T�m��5�%=�ʵIaLז	6�>v�@����>R'�%E ��k�$�_����X�ms��O�%KM��l�Hƃ�7�<d}8v��E��[ɱ��|4����Q��;
^Қ��ɛ-Q�&�J��D�.Z#g������pҤ�$fD�wb��P��T�*l2fJ:��0Th�3G�]�(wNs�UF��yv9q�`�̨s\Gu	��N�c@$�u|e�M<�S/๘�C4��J��!��
�S7PRC�rm�Og�,�Jr��:�KM9$=�?ѩ����T���D��?b�
����;��Q��Ͳ �'D��=J[��!7���T���x��?e����}EFy�	\ه�i���B]
{A-��Ȉf֒�>����mJ���#�š��M�EL�Qi^TE�vZ���<�gJ9���3<Dp��d����x
�,�?��G��w8ʁ
�i���J�>|�2��^wh��,!d',!�nO&X%O���i2��ڽڅ���{/0b�iZ�����K��rzܷ㋺
܎d�^oT�k"z�3�r�1SC�}߄�S �˕�9��WB��*8��YZ�����ǩ[q�K�3���w�Lm�.Q+�8tH������i8�e�̩�Ɯ9�n��#��B�����0�M93!��a���
ַ	�l�ڭ6��R��(�kPk�����&KY�)��##{�5�~1�45��$=y��wt%�[�o).�#l�XS�N7��\ו�=�/>%B�į�讟��ѯLp"�z|z+.�[o���_F5��[p�2�Ǩ��<yc\z�\����7U"��٘%�v,֐��e���p����Ý�c���c(�h{K�_��L�#�|^ߎ���dm]2��P�	�����Sd6�
݄����
��Iu|��r�	�'ӗ�I�TMc۠�%D���T�c��M ��f���~��dIC8�p_	v-S��r=���������~��k���1�P�7%T�p>L`�h��v?ᶸ��1��:���F�u��\73��T��w���)<$/��)�^W�����u�A�Z���(�c7����S���I��U���7�hT4�"������X?h�&��p�F�G�4�+Ȭ8s�M.��.��U'�,'j{C|�фreI�Q|�5�f�</r�������|�����F5ґP����N`�(u���;���!��-����\J��o�HF3T�Yަ��N��E�Զ�Ϙ�D`UΎ	S�.U`��HY�i|9��U�8���B���,�܉=M�e�Z������3n��w�w��C��(�3��sa�m�mx8�Q'�
^�ZNۡ��@|۞=����ۭ5tb؀gz:Q��f���pH��l�V,��v��d�r��X���&�4�PP�rQ�����H:p�d��?#�.5�����LՃY�KX���1������Ķ'��X���v�7џ9�v%S*�?]'X����M��c�zF�
���������Lx���3����W�ӌ6������t��^���pvN���5?>y��,��֟~
7���㉥'�&ѥ%p������ >����Y�g�߾�bN�,�����-�[7�m�%�����+'-yk�ښ�jdL�4t�-���G�&���q8�'bt\?��Q��Q�C��!���RۗJ�o��j*�m��y�:�jN�a�̇�yDCU�U�p�y�����`\ �L�����O���5ݴ�����������s�$9�!�q�Ey��4:|^�F�	7�Uo+͋.Ӝ�r���)K����5�'�)��>-[S��ϿY�a��TG�4���n#U֋�O�Xl^���X��N3��V&��A�Rk�ʓ�. a ��A����z|�K��hO&��o�E9~�XȊ3�#@59+�D���[�-Ndӓ�5u]�%�|���˄�he�*#�O$�P��]NZ��f�ϘFJ=��9�J/�!��>����^%t�;Xz����]j�ji�J'�$P��'F��'\��gxd���2�jw�0�����n��c�8c����m�i���p_�6�%�7�<o�M���iF������b�2�+zHA�H�gFjL�.t�E�\�\V�)�Z���p�gϙͧž]�\���a���Y�C~\p��<5;�w|d��72�5�@*����

&�?juy_��z��%Y�e\GW���C𓬻�1U�����y�o
�"�AEH���3�������΢�f*j��u;3I;3��"M��xO/~��r
��}B�/X$},��K���`6�����g�C�P���*��Axq���ɛ�K+�/���)-�xG� �cD��;����� A��^Vr9��|<�$v4�����`i�Қ��$4�}Ԣ�ޑu����2U�#Ц8���3d�|.�Ծ80M�	SO�%��mIM�Z���"�?X�� T�1���ޚ�R{'W+l�,��4ل�0Bi��w�^@�@��Ί͸��jmPf^�x�tX�6Ke����a��%�o�H���&g��y�����B=��8������B&�	xN���U�ϔ���m��>�g��v�ZN:��5�$چ!R~��2Me�3��؄�!_Tu�|Y)'�*��}����P�I�iD�����t[�&��1sG������I2LaR�h-pr��b�I��ʃ��rBw77�4;\{6->Y�򄁱�9����!�Й�w	�nn�e�qm>��������ʹ�Z����gWy,^x4�A,�}eNhS(�|=��e���WBs}�E-'Lx;+�&�NJ���{����ޔC�� ���[�I�����FV\z��un![j�80A�1�FytK��x�f<�w��P�L�$��G�!|
w�� �b ��Ӡ)X �`b!��aP��    H᱐č�x������5Y��2����F��xmڧ(�*U�n&Uj��`jC�8�lXP��T:#�A����+�A�p��zJl�u!s��h��Z_�0'�v?]�aΠ7���W`��('¦�Q��\����v�Y6U�	l���d+��݆�����J�B��*�5X�w���-������j�Y�9���q�4���|f��<�p2|�r�lS6���� �����Kۈ�FU�L�\%!yF��
�nhjE�p�"p)�U��诮<����Hq����h�DZ���r�j��{���RMe��&��s��O���$X�>�����ߥ���l�����B�O#�_�]l���\=B��RǊKэ��.��u�z���ʳ5z�F���a$�	$��#�Z��%1���'�Y>f��Ϯc�V��	�P�k����R�>�N����hH��_�y$�-r8�{B�������t��|���ia�V��*�6�V4�ᴡ9�>���� ��[x�M�|�Â~��:�����[$P�^⨙��H��b�WЧ��fCGS�xu���g�S(}'Z��C�^i�G�:?��JY!&3ǻL.�TU��M��p��r6�Rxu����8���X�x��gd7��~6�#�x �Y>w�U�I_�+��X,�y�E��^�z�1�u�������3��4������ԑT�>
ǵ����03�|��g����$��r� ���<�R<
=���a�%JrA�@�������_��~�ׯ�(\� \���� ��\S �Ap�'�_	��D��Ͱ�� &ts�)Տ7�9c?=6�^14Q��0*��P�m+��>�0��8�Wf>r���8��%�n"S���k� ��A�O�iOLL'���N���?e9���G{��,����R��3���$��8*�a����K}�ťGpU�Sg�NW��`���x�aY�0��������ѹ�SW-'�wcGݦ"��~�t�z��o?wp�1�w!W�'b������NQ˩���|��*}�yI��I)�����p,ɲ�42G	qacJ)�*��dB{���rlA4�ϝ�=��s�y�j�A��R�g��n��Q����P���5��$2��d�:�l.	���3:ow'Bo��KC�:��ҠQ�z6��Qr/��lÌF�ݤ�?�x4�2J{����쫝�U�m���F�/nĬ	�\��U��
K��BB�
�������En��O��a.j�D7Ol����� J!ng�ۅ*;$���~�ъ��y�Zě�b�'^�ױe�c�a���;,�uQ���R��>�ǎԻ~�/<��jB��$L�{���)�Q�i	���pv��vĕ����N��ȗ�P+F��ԟw�D�.�?�K�[�{�`�i7��m�����Z,s[�M��K֎]�,��ܝƀVpH���� sC�z� @�D�8����y���3R�q�#6�3}Q4q��(3�.�[���e�����(u�r����9�v���0B�Q�g	�6iL�+2�*K�+G�-D<�G���+�U����AA7h	�G�L��b�`�	���X:,*��iN�LD��U�E��<1���&�)�MuA��������6֒9�/��) g�$�䧭��4��"�MU�"=�� ,e�Jlv�	�Iy_��cQ�K��c�<��\Q�"��H��rj� �75e4wr ����<ܛO�~_)���Bc�SN�O��\���R��Qr�ޢ���	�$��R�g�:��ZN�u��Pȿ�4�՟�,����o��e����R�se?�L3 �]5f[o�k�]V�殠Gs��%{����MNo�YZo��s�̦��Vʅ�R�TJP�{@6#\P+�Y��T�#�����������1mU2 ����J,���HR~��C�5M���|kUl�UOP3DNV)�V����<�YӼ�b�����}����Ɖ���SD�:Ý��^��mr��b=�E�{yy*�|�ָ�$������us_�W2����I� J�R�'s�'�Ĩ!���Ja�,U�J�Tov R�h=#��$]��R��z�8�Ͼ^�&U�jw��U��u�sQ��<'$�r��a��+?V[���&��d�}��5��s�R�G-��zsj?�ڤu�gہj�?���oZ1�� �s��!���	cnZ��.�Sb�U]����4�O'�#�>�=g섚���I��/%+��[gʯ2SV~A"����Y�ƃ�7�<Jv���H�j����QaPߑas��K�r�H�����k�3xt�^9��i��������bQ�-��4��VXXE��x�q�n죃H3sl��]�
�ۖc�֝7�������#��G9@%�����N-.�O��,������~�M�˩���c�s�3K���~$E�"�<rF�m���21a1U�����c�0OQS��s��p���j��-rǙ��6?6�1
��E�pgfK���E�qo};�u6����Ve��7���B P��a������<!��P˸Rm�\������ZfNKK�R�.;YL�挮���L:�)�6�p���T|l~��k���5�8��hu�����R�M	����	gۡ��M�*T˽�7��`r��Rri(f���XOQy(����z��̹�ĈogYFךʋ7�\�⁃�M�	�"�y���ԝ��s��i0K��� ��*�~q�a]S95䡏�ӷ<�P瘀D��g�ɖ�����A�kw�*YqviEp3�gM������X��)
i4�'�J .C��MH,ͻ����wq'e@W�Ah<��'v�be��^���H��B*g���R�H��hs9Rt���1���o�xD�`1������Fņ ]�,�
<��Ԇo$�hLE�I,cӨ{zS�iK�En~U@E{��Z��jb]>����J���B�2/V�.<����C��V�,�s���&�;s�I:bD����f��{�ыt�t�o��I�ܞ�M�M�i�QF;����DڴV�C6����D�m�{����N�t�&�o�t�G�NõG�	|�a��ܭc�(u�SP�����%����U����O꬀��o�S�N�d�*1��<YSڛI;t:�)ά��0l���[ǣJՠ�D�d�"�h&���G�*��/:2ЄbFb����,ͻp����v��4:w�&%1�k	�}��ڼ#�����U5�K�>2���e�BF��б�B�֫%8~]�>�(s�)�6U)�'��Xkf����������wy��������;�+�FPfQF��\Ng�8*�����X�A���u]Ulu��>��fE��&ǒ�\p�R���@� �"�����1��؊��pLՋ|�8�R��n'8��`��\8�@�Ap����E�7�|�����7.���v�'P��k(e��_���$x�Z�%���ֵ |�o�:���4��h \�v[A)�r�չ���Ş}^�������h���k�'i�48Z%X��y0Ht�����x���ܶ|�xl��o��͵}~���L�pt��e�V>���Z��aM]'�:>�S�5����QIf�76!S��0�{f����M�FfQ)Ll�&�D�7������H�:��`�^H-�}�L�=��菓#QzH#`;s6��($�^����Le:@Ek��g��2��tg7����H�Z�\$�(,HEO.-!�)B��ʫ���fn����~��o�~a���'9��vMԗ�2���x�@�g!d�
٬VE�8���M�s��pz[����5v��}N�"|���Y��Tq�R�|(r���{-�{BN��'jF�*#���˽��n��&������φC��3�~Ƃ(�DW��k$�zuG�iO�����d�="��_�����R��(t,�U�3�����g�
��Z�����ϟ�0��b=ŔQw��I.h��H=b��>-���q�xp�^���}��8fL�!ؤ��d�uC������8vF0~��=xh~P�@�*�F3Gc�����&.�����)��rv�����M�v���3��K��<���y��}�v3Y�� ����`��    ��{2�{�/�,�y��K��*���ac�
��f�)K�ƟP�$ވU�e�8_m�KU/��$S-��˼�"��ŝ�c������,�<r�p�ޖ
��耑���!3�x�W�ךG�ڸPOq�c�r($���ܵrR�Y&��z��;���dfȯ�+�Lp�G)��\�HC̴��
*f��x5'�8������1]�d�3o��,�ma��-����j��v�i�����V���[F[��b?�X�7����h?M��ٟ��Fp�ւF[���onM=lj��{�g�-.�o�7C�X�;Q:�߫�$� �Hul�VN��V�.7/p�V���)�ř�W?�8�Jz�G�O�OЍ5����{��y��!���bRfM��X��Bպv�������μ���HxQ�i�z�����_6O���l.(��[`��\*ۃb�.ǅ�@��l��-�[�����B5������"�j�	.��'��;���כ���o�%3�I���4��v�2M���PM?�3^KtAK"b� ��5ڄI?�̮�8hc���PD�E�"��s���S5So6.=�
��ۙ^�4e�<�l�we)�4"z���W��V��h]�ǐ��6��ʩߐ$�����g�)�X;�Ū�ǽ��0a3�G�b�U�]9.��Ru�MYe���OгF�w���v�
���m��8r�(ƷbO������r:�5
�w�����@�[-ű���O\�?�@<Q�ۄ�F�aV��%�}��$��w��VNb���?�
;�o�۬�=���&ፒ�LL8y��hg�y�l78�>���1�["���	0��R�M&)�u�`���l=��n���Zb�T�T�Y�ԁ)H;���x��1\G�\���E�1����a��֔qx-��l��%��G���O��)��;�:w� ��=!�*��r
߷��i�ēcT�(y@�7Y���Ȗls"H��aD</��Y�țc�c\3活�SJ+'�}c��lB�u_��=�X�C����O��'����Qj�� k
�o��/��/�cd�>��)�Ԝ�����*�R)��h^\��~ȓ��?p�}�5�Pp�;F6�?��B�h�w)͗��*3Q�J�\�a�P�q��)������8dO�M����B���	�o��"�o�^���y�����x�Y�J�Z��l6u%�é��s�P�Yt�c������f��� ��҆f9q�[Ӛ�MC�Lo�/R*/"p�̇	��v��L�;x1	��������zl����͖�2q�`!o��U��ud�u��"*;��w	-�Jx��[����o������9&N��6'�E=����A �tY���(<
u]܏�\\&��o��U�}�*�b�[�f[Y�ވ�}u��+��ppJn���RVx�n�Žw�y�_3s���߬>��D�n��0�d�޸�t*��ߐ����)�K�A��n�6ƣ��V�*�P��*�*/�Xo��\z2<ݗ#�1�
\��E�;�f�7;�sr�(u�a]Pcy^Q���j��&˫�W2-�<Uj�3�O�{��I��$�̑Ջ��vb���'ݢX9~7VbO��H�4��IX��B�*��p0��g�vo�<�c���"�?�<�r�S5ﴲ��1r��>��W�ݎGj#�|�YQ�u�[�N��[��g�f�\p�>�<6C8x�/2�v������?Z�����eW
DG��8WuC�+'cSk��%�Z�[������b����A��Y"ɔ�?�P��3�e����l9��Ǳ�n)X�͘3w�Q>��k3r��"�c�8�����)��|�n����ؔ��Z�#��ƅ���[`�ɲ�g��;T}C"Q��VD��:O����G���-PU;�].��ı}@��w��C >V�AЌ?	���X������ ��"[Q�[QA� �vy�����er�z��Ɨ�Rk��1��?i�B�1j�8s$�?VK���6V�T9D_W��
���[mw��RUȩt�tژa9�N4�=��^� '���M������H�!��h�4p��	u�
P�\qۥ-�FX[�� ����)���p��H�4��ǩ����YW}�'U�[E@m��ʮ�,_p�|���q���8������g��Z_v���q��b�؟3(G�l�3$V��/5�{u��uic� Z��O�>Ԣ%.y�J2~�df��S�c�p%w9f����4�J�*��:��:��4�%-Y�l��{Q<��ޘ�:�~ER�ڗ�r�؜��RP[J��\�'l6-\d)&:K$T�nB���+ͺ��M�욑�J���1��3��A�t��aV��(#�1\�a�cM���_�T�Y�C�
U����f4�:�>��TZ��ӺMX_i��5�%�&O,�)m�����Y�m�l^�ռF^�KM^�x�!�Z�#P���\b�T����+��؈M��;��Z1r�kE����jZ�Z�K/�u�
T�w�����C�w@�Nyq����p��|���������"��O�p����#"�9�/�����!��7mB�t�l��A��`���a�5��ݦ��I��ұ�|?N�&��������'�N] #;^���e}P��!1㮪����Sx.�����1�z���!׫��Ug1�?V8ؼFǫF�散���뮦���w�Ko��v�����L�n=�m� �#i���'z���(�e�C��o��h���y�F^]�xWO�k�,�U���յ3��a���l6H�ͺYj��c� �~*��j�W���
�b���5<C�/�� ��˗�X�M ���K�Tp�|��@���DӲ�u�IS���M�?����"6+�A�ޅ�{�_��9B�N��q��d�Yd$�B ��:ņkBJ�m�V)��R��M�y���8�����<e�-
���S^��Ʉ��J^�]��0+Ao���!�,��xdO�]�ޭ��J@0r#�(�"��\,�E���i�hd"Frݏe�Uh�Su;ʋ���m�y�NF�p�eJR#[vP&�E�XaV�(3�{ZX}���q���U��o�_</��ɱNsV�F���ۏ����8�Ώz̭V7������K�ki�R��dOϚaȪ��x5IO�N퉝״dE .��T�K�6�bW[3���.��}�E"|(G��p���pK4f8_��J%�7��l4Ux6^�%s������SQ��L˻�6$G'��Y۟���h&�W�L<�΍3�ߴ�h�y�:t���ٜvb}�7��I+۝�w �	еpNZ�J�VD����¥��5���FSW�E�@�T�*����;�y�	2��E�W%��6�0����D�Xu�����R�_+[��`���R���Y��-����Ӄ\�}c��k���_�=ɪ�UN��C�?�����-��i]sl����PL�^仦�Q�5%Z,��g;sڕ�X�+W���6��2�'�F�P�I�yG�9�c���/�F��h��	��%�W�_jہ6 i���5��G�B����Z�G?��"x�x���k���;2?'M5����;��̅/��H����@�D���3���,3"�.'!Z	C�L���S`e{	��sK�=��6�����em{��j��
���P[]fw�\��vzF��X$�����^��g�zi��Í�3��G��ǹoRA���M�*�wt���4�����*ro,�vQ;�qa�S�[�i���f�
q/�^�{Fs�.��fL��g��p�����?���K�R����a0]�[�_أڝ	�5�|j��c[��IW��2�z�����c,��Gĝ88>R}Dܹr9�����*��Goj��2���������j܊G�A�0#M�A��o�E�b�q.�`�\�H_O��j"L<Z�mō^��[���M!�݃��8Gi�$�	ɛe��/�F��23�Y.nKB�Yz&*`�^������ě\�Z���{��Pe�ɟ���y�RL/�"I��Q*�8�᪱�W�o|,0��V�)�*�mO�'��
;�7x[xg�������\���b'S�o���O�M!��q��9=��%�a�$b�?��Z��T] �    �*nlkՀ�x��j�P��j�F#X��%	%�i����q�p���z�}�ɴ0eu~%H`�I�`�Y���[@8j[y���幊9��x��֔�ȤA9�"1E�1xpJ�C�M�ck�!���T&� Z�49ΝK����륖Y��G/��X�Y��	�T��k��E�ǅбO�rz���ҳ(��ތ���v��<�����?�������F4���Xq�nҳ�}�+���+3��b����vޟ+�hKF
ߢuҡ�Г�n��������):�9Lb��{�q~�A9\D��.�`i���jA#>>����y�д�j@Q����'ǣ�/���|'OA�]��6P5M�fz\��d�[^���>T�k6
?��Z�%+".��u����[���tH�g6s�sga'n_�⌬+�B��6_�������릪�7X8'�ۙ�껌�v��ܕe���͋�R������X�}j�Q�.?/�ϔ؜4���胣 2m�TS��M��D�����/��&��l�������9A11*���v)����c߱"� �[��p�1�����k�jk
>�Le)�'�Ft�M0�<�$_$/�}�z��7ρ�G���Ы�.ؖ��\j�,ee��3��u��t&2DF,a��y�ƣ��}Z�~���T��~W�k+��>�Qf�^o^UvMQX��0�/^4�I�Vd��[���;[��dtN?.�F�H��N��f��Xz$rU����,578����w&]�ѳ����"~�K�'q�" a��"�L4K�.������Ў?̷(�ف'�'��ƥ��	���X���bii�CE�i��~�ܝ�������F�"(\H;�/�ߪ4UЛzַ�1�Up^�x*>&]�{1Cl��i+oO�D��w�Y=��B�C��/ܿgŅKT˺*IR���=��ǉ��x�z�3g��(��)�l�C#�4�f3�M�R�l�Jj##1-N�������w?����Ia��qH�ׯw:on�G:��P�=%T]&����ǻ��Ixlw�
���.�b����'����aC7�����+{�盧��`ޓ7b���b(�� �dfz=�'� Ӿ�Y=�j�߃1�'�Hl���SZ��r*��,��қz���\5pNh��/���⠱�'�$A�& G)1�yA�������j�e�[�ڙ�Q����~@��n�c�Ħ�ȭ��N��R���e:�sO�C5�.��N�&���	���k!Ḃ	��MtU2��zѸ�����;�1w>8y�Q�)�:�M1j��R�Y(R�s���^U<Ԙ��лP>�CR��;n�>� m�a���nI�����ڽ�I;Q&oE�Of�P�>ZU%������JfmMei�!{aC�eP]b��fZ�C��_w�UZ�&-'��HV�H��2�O���
�L7��1T�!a����oѐ�n�~"��G`Ϸtq�ڗ '����5��Bݾl�#�V2+��	i���&(a�H�n�֙�¾���1�-���;�����xw��.3є.}^��⡑v�W]膮��Bܭ=����@qv.
�����k�h13�b7���y���B�z�U�k�������%�O��Eg��''3���	\K۶�^9i�$+o���v/~�g)��k� L7DVa��9^FH�/�;���Ї�b��a�˫gq���F6�������y���fK�|S��Hr�/W�H^>��o��=9�Wg(Ԓ��)/��ZwA�E2��u��"�J$A�\x.W�k2�U���D[y8�=������."��)����.���p��qop��%��)���Ѯ�ϩ/���(V�L���夀�?%h6� �������צ��|KF��k� ߺ.Kp/�Ck
��~'�U�rxё(C��G1$�J�o(�	e��L�c3�,8�X�%�/X���K��nH��h5�5\�+89fZM&�I��oAVa��:�^�c:��0������_Q��h�b�v�9K�w��.�ln��D�R��C��۳�\d椢AR�c�s:���+��dN��� g���z=kX��OK�X��5�������A��9�c��&ǆ*��/�ܧj�1$�!��lN��C�9�~����m-=���41snF�J�nf��U���0���Q�u	������^io�v�I-��jr�2��s$ǫI�
��hv�h��~���Nr̙��&�z�F>M�Z���Ws�س�U��v��8�t���0<��� 4�\�wʷ��0�` 1�k��ޤ;qeK�_��M\	$�Pldڒ ]�u'rZ�M�T��߿�wD�#ȃ o-�oժ{��Ƀ#���)ʻ����V�:��M+9-�Ls��*Ӥr�m�Oiɛ2
�W��Z�+Y��Ǡ7ۖ�t��`ڇ2SGL��'��z����BP$�H$=A"I�����߹��t���L��揝�`��
NQ@�l9�����}�[r��P��8O'DR�,E�i_Iԩ������OB�.�2"jE˓�<�u�.�Ҩ�д��@�i����H[��[�v�;g���t��͆yu�6�M�W~�3D~��2�BW�atv��������>���{��.Ѳ��Y�I�& �l��P���S����,A����U��Y��.UM�-¶-]C�����N?�M:f�>$��wy��c3�{��a0��H��\]���e*��z?J����^���3-����]��a���,:�@ޅ���CN ۆ��H�)ߊt ,V�����s��*ѩ��-t
<��|��['�7�u
&G��[��"@M����H�2�V�T�[7���|ȓG�>�N}���� �x���l`��~1W<����G�u��O�*s �3�A�[��65Ͻ�1����{ߟ��m�n�V�sT$��,$ח5t>�5x��y&f�����e�3[�"��r
ז���8�HW[�ŤJ��k�Je�\
版�ݝ�[^�.���]�]�2ϥ=� 7��� �@����@�1e��p��7�l��$ �b��J���tN�o!�'�+;j	��=��G�ȕvQ�<���فm��=u#�=�������;��h8%�I����7&U{!,&s�8_�-��6-�����MN}э�Z�RԨ�LY8w�iS̉T@�Ln�8	w�p��V���esJw�4m�闩�ג���Q��F�����&�T!��r�n7a��K��|y�i�2<p�@с�{���6������r�/��_P�'Q�u��(��U�
t ��;jM�$�y�j��x0��,�Pq 	��$'r�ŸPJ��e^P<�8D0�{�zs�м�W�R��zK�ozWI���CL٫ԙ�����+&3�_S]�d��ni�3���1�d���ɘl��O��ԝm��������/g�^܃�8C�N�s��Z�e�`�[,��tF�l�"�z�ϛL �`<v���e#��.$A�-�����܍Q$C_���!��������a�[�X�}&\�)�rD�y�\wYVZ�m�F��ֆ�;�?�_)t���y�� -;��ע<�X�FoֵP(>A���85l���y�u�&\�S�/=(F}�ɭ<��h(�>B�ޮ�����	A�|:�7�y�y����5�3�"����=�m�4R�Й�P��~C6�K^v.S���ʌ��S4�^�mӺ9�+�(K��I�U��;�s�*���4�T�-ǚ����k���7X�Vw����5z�L���-��G�p����.��%;��W����dQ4w&��q>�&/�0!]J�	���mJ[y	[���U��F��G��2z/����$��3C��M�x��)�:��zÆ.�}�C6lkٮ���܆������b�fGJK��â�v�cK��v� y�ru�&`)�w�_ų��@���f�	�s�^l(�8�'T)',�*->�	YJ�N�Z�]Yl�y������W�(9z�QT9��Ш:H~��~.M\OZ7�!wS�A�|�Vץj=�i4;Bc���B_�=CVN��9����SC�a�˲;gH�(>���    ��[�h#�[=�@6z/�8{h�\�G���Lǯ5�~t�����t,Mh�Im�D��;ٮ��1�KCFN�gl��p�o���l�\
�]�Xak��x3���%@x�o�
�7o����:����2����#1��8A��oH|%Xognŵ�����u:��[pR4����I1�oQ��������^�|�*�Z��S��9����,�Q:�pL�?q+������>uZ���gD�Hq�:�Xkg3�mj�?���v�ښ0��(DI� �9񓋼�[�� ��y�~ܼE%m�˙�Cc��Z������zŞ�ME�1.P��ʅΉ��I����X����Ҋ�LQ��\L]��l8�&
��q��2�c~�<�%�e�E��d1�+�������H���+�Z'�b��!:�K@/�0~��jtT/\�~����K�?��|iBb������CU6�q��%u���\��8�H�3��l+!�CaX�b��� C�i�K��ʔhݯN��d�A�P�B#����w�������ď?KB�n#�Y�%4�r��u��uS��p�O�$�9�5�:0t�e:��ۂ�~#��3�P���R$�ʏ�<��l>�����ڣ3��7{F���yp�a|^(<J(9���9� �F��8��g�>JD�����X�Je�`�W
����v�6ϣ�N����P�)ԖK8s�!�y�C�n�#�����O�K�60��F&�K:��'C�X� �Z9�n&BP�ʸ!�t����=����tP˗�*[�Z_J&�:w��%�1���9��jU�t��f���:GMT��|
6A�wRt���T(��|��((��gLJ�!y@Dlєۤ@�Qb?�ɜ�V��v�{���7z(��ǭ�I��?A����f����=�n�z=�yJ��_�~�=�7hN��\^x�? ':]���P���v9����fKs��C�|R�9Qg)6M���.:��O���ﺹ���NJ�R���/�R;�=CM���o���,{nڭ��4I�J��z
voAʛ�
�T2�qY"����y����ܼ�ݼH��V�f������=�3�q�Sq}5O�ݥ�6Fd��.^RL/����8��ణY�$�v9Oʺt�Mx��)M�!|/�����K��R�V^�\IB����n�<J6��7�i���W��� Lx���D@A��|��3�x<J�!:Q
Y&��L�_��`H�E2�l���3�A��els�&	c���/��=-�����ȇtY�sч��oA�x��7���'��\�XD,�
!�T�j6�6�6���̌�����9�ϣg8K����C�`�����$�����EV��5~�`�.g[Y��	���a�@;�e������d�u��v�A�!�qV+�{,ԯRm��<����YA�DSG��>��O����)��5����o�c"[�F�`]Ξ����s�������냲gH`g��cdP'��� ,�-����"sy���2��2�]T����->�m��L�bp���n$߱�ZX!�1�B(��o�A𙳧�r.�u[�և�
W���9��h�V�qh-8[�FֱM���#_e��.gvX#P.Uo9|�j���*p����'�%5x�lR|4]w�%1��ʌ�m\E����	7*]:.�*LpOH����[��cN"����x����"�cv����HgmWS���݋>Bx{Q���nk�04�_>E.XsJ%h��5ߟi�d�D��F}�xG���F�`�v�җ��k%�bB�k�ߜ����+��q�K}g�o�
���6���[x��O��+^*�/>�����W���JXo��eRK��1��ZJ�5�
�pv��ֈ��̬�]�!�q��9��n�&�&���;tz˾�����Ֆ=���G�y��v�3ߦ��.��3�ҝ���TXͽ�4����j���R~��8/7�'F�:�g�� �px�|����%x�4�s{��˹i��'��!�CdH�8,�Q�ۢ.�����͇_t"�at��ƚ Y�� ��}|��_���������4�g ~Z��;V�̄Ņ�f�0��H0�m�������$/��koaB��.�d�,���8��K�J$���Ѷ���T��|r���-��	�9�8D�8�ja�je�fR��(g~S��g���
y��1a&k�T���	䢦����!�ְB�3\�a���������Y��_Q�5/��C�I��x��ʵ��隰	�;�����q��<�V�73*ȼma���<*���e��@��5�I�����J��~ x`�B;���ݗ+�7�?������c(O���-�;�>% � ��0hp�0J�J��\��C�SB�ac��RQ�(�ȪL%����i���)�a>��l�(T]�=�0$�������D�1�>~�
l��nsslOsI��R�v���t4o6u�l�\8K��婠J+Vؕi�{����F���6��:���lYLq�e�n�S��V�g�۞.*�<����L�?�;��#N�����2?�]yd�4(��2f4��$���G�^��@q�ꖋ�W)!��<¯Y�K���,��}(��ɥ@!_2���wJ�tE��D�aگ�U�F�,s�KZ~o�c�̫����p���ٽ�r��bV��8;D{X?�o��n(|�ћI��pTD�a���^�
����.a3�ݹ�_����e@N���I+�P�oEe~��#�o�M��䏾�W�>ki��
S�v�T�Z�Kr�;,�<��3i�V&|��TRӆ�BI��{	��q����[�D��8�8\,�.�U��.u����Ո@ߝ;�y�"��āJ���I�a�k�n�';��΃�+��AE�H S�/��Rv�r�p596[f2�,�A�qJ�^$�\�=A���	��Ms2�ʳeȪ}����>Ϋ��Us�HΪ���2T���5�'�Uq*5"GJ\B_�݄�y1xXQl��]�MPH�G�I�i�d�彊v. ���!H�m"B������³fȕ]o�������3e����}�����qd]��?J>g1G��
r����To���*���CD���ߘ���{E�TnQ|�8�~�ވ`fGpDP.��\A�I_�����2x�vS�$�g8��0j�<�Q\F��6?��A��D���OO�p(�ɀz�ҏ�2��ʡ�<�؝N*���u����D��y��:y'n@
�*���	iD�MY�Ldޒ¹K~��>WS��]���f�l���mqԳV�f�9u${�و���1C�l^ @���܆g>�����3w�2cχ�3��T�pd�Ŀ�THD�B�?�>�Ծ�×F�"ѳ�	�NQU�L� �x�̩e���m�p#�v��+}a�8��&}�\�Ӭ��E��8k��	EQ���'_k�k�� ^U�y
֕(��2���!�������vB8+�0��=D��0�Y�B���+sVҲ>�{9�&+gW����dV�ʠm����α'���<1��ƻ�h����R�+�@5%.����<�ٶ5�7]b��d�`��0�⶛WXDt�|��
�~I_�~�C���d��Z������hg9wG�[�S"��=�����Rkυr�y�C	���\衍~�Vr�z�2SB�����nH�Ν�0�ܖR�h}�9�.IA���Ƽ�J��Np0�}�a�;��õ���K
Oa���P~'��^2��J%�ŀpGcH��;fSHN��bv���J�E��Х~�W��Byf���A[c2��-�iP)��d�[>>\շ�sF�F5M][,{����ݙ~G8��7�R�QQ��P��&�mZ���>`�?�&|���`GQ�"rT9g�:蚦����=6�����n�"nA��[|J���]�S/~!����)����y�Җ�L���7[�����j���pŧ�+ʌ���&o{r(�䞉����>�_/��>k4��u%<(a��(B])G1��O���(��%��J��f�Y�m\3m4�Ԉm�\���2�N47D��������M;�����    �<;k�`���My��&Ku+�F��{d�K�L7��y����{�K��pWC�a��Dxɽ���eqĎcFw;q)�,�!�����<��~9W�ڑf̎6�6ۗ�ǩ�$U;�R/����z��-��gv5o�C���R[`�t���]�D�I6���=5� ��~\�(M�Vbn��u� �}��L$�	_t��d���acJ�0�J}�k�&]8}��a��sK�r&�u±Y����;��{r��8��S]���^�1jߦҢ�;�LU�j��/"���G҉ef��F�a�kZ��?;�=��b�¸��ZԀ*�d�}[m�P�˭	HM�eul�g���BE)��FVK�9$�pFn�R�\*3��1e��W�1;W͵*�ƴH)��BB��6h���u��iÏ�A�U�����Y�qؕn�q
��-�I��SP��oLx����T5V'n�eJq!��<�>MS�':���,�y�����W�k0�m�Z8�^��"AI���e��^QaG�{k�z篠�r�8G�T�B.I1Ԓ�����+�����_�ll٤l<,h� �S=Ւ�K!�5���j�F���!{f3
����p��SM%X�F���	�h�$�����ʺ����7�I�.< ��n�9 ]Re\�ЁU¢'�猸B�}S�R�����W'���ݍRe]M�	�ɑ(���z:�yG�t���'Y>��`PAG��9z�@��E�����,Hk�m]�:�o�%�K�����T4�Q�f�/N|��ԸKR�����Fk4�8�%�Iͅ�rn���4��^j��±;�0�uȑ�CX�$|�1��
�s���� �����+5��"**U�҈[��0�5��/і�Y��Ĕ
 �nn�Y�lG*�F���e�M�8� w!��0L�T��Y�^Ju��ϐ�T�	�v[+�:,"Ш�����w��3��Q`���u��ۮ����T�F��'B��$��Yr>Q�@pX;I��Y���Y��l[`[�qs�����>���W�H�+�1�������=���E��E�R��%7 ܼ����A[���W�T�#ٴmx����R��C���!I�'4
>㏿�C-�KZ'���ќ^�&��k}<jӪ+e�F��#>H26<�6����U�Q�Y�Pp0�)�ʭrW n]�ޝC�0�4N!�)���#��P�N�,! ��Pż��v��NS�PI����v��
�)��]=	~����Fu��o��}�9�L�#���vϲ^�SM�>ڭ/7c���l�2��2�,#	ǉ'���큦����JEq���?v���;����$��V�`���ʃ��m��y�g����i��<ĩ��T78.����^�n��HG/����K��:-̓_�Mgsg��eӅKnZ��vO�ϔ|��u�7��!_����[I �p�_YT���a�G���7��yt���<�
�j���y�ޞ��zY�t��P�������7q���H�&~�h"����>�=�QC�+DBק0Ѫ�B��,�[�v��<r0@�Pw2��^q~c��ک�\�I�6m)���UħeI��:�f9��:uH;��S�<U'�J�p�T��U�T���W5�'�:<��[�7�q��q���B�!$d��h����%EϤ�O���}��:o<p%�9\1�q�\�,gF\�Id��͝�x���9�LӐQL�yP��}h��n��H�יW8�v�<�>;�~������a����ס��Pd�>p�Pr�a�����_Jl�7o�膳.(t˙׉��յ�`�bЃ��,1
ʛ��MS1��'8�bt����1��U��bY�Z�R�Ot>�op��I�����!f^<)�m�p��a��Sf�"'�khC���S��"R�)��o��	� ��״��;��Jץ��E �t��OP�.��p��V���j�P��>��L�KIsG|D�:�g�L��wG�5��8����8j����-<��8CA1�{��"��2�ΰd�����:b@��c��@���:n]S{L}ĵ;=��=v'�$�h�D�:�y�t�v�
�+DKY�}-.[/eE�R�D*��9��3w�P��=�OZAo�.%cG�Hx�`���,��To�,�q��l鳩3wK(&�Z�ϷPDp�Cߋ����6�p|^���>����Gm�-�]����J�ƹ�uC�>����y�룴߳�s��W����#�&�d�w�<�o��M��trlP{z����|'f��W0��h�~���p:ep���D�Θ��sw�+0Y����ܚHh���i�ԿK�i�h8s.檴4o����>�v��`H���(XG{Q�wTgB�T�k"7����Cnd]K�+����b?c����I�����I;�Nj/� �ю��R7i��E�̗��f�u��U�U�謦���=����-R��}&jQ����#��G1i0ڇ���M[��pK��Q��v������b�ih��6s)$�;�%�RG�@�E�5�$�}bǭDg�ǀ� �7���r(��R��l����P��4���`��oQ�b�j"�'z��-���c���{�9�`!����c���uޤ����E��b�K��,�g�����q\���p6�r�u��,��n�=s����G�W����V�\�s#O/��`/�l��'�RTܻs�E1��uك�0�P�[z��1�c�w�Ӄo�xY�ւS��<y]0���3e�C%Λ��1�6�C$��}FB1R5S��|��7CQ0|1j��I�A.�2��w'\��Y�E�L��-+���_V�2U.�_Ei5md�zϐm/�Ps�;~�''C~�'8���̶pu	�y�{�f��� \U���nM5�7����Mf���Pⶕ�A����C���͟���[7	Liޔة\[��jv�Z/���t�M`�W�!��*�w�P �����8E�*=�R.2�+<��H�[kDW����ܡ;�,��qW�G'�x'T��| mZ�0������C�U	�<����O>�ny$2?9�g����w��i���6�����'^4�P^�b�HV���Wp��e����Ƭ������0e��
�'$����~L	��S���ʭ�!d������[�[����2.x�<��ٙ�?�y����M�e}�����t��f�3x�Ph��^�7{�*��o:�\��w��y� ҂�eOĔ�����8!�6i��1�)�o7?�1�b�,�Q�����!�ʻ�&�@�%��cP�]05ϝ�9%�}�H��Pg��9ޤ�7��0��<�$e�.��$�ԭ��c]�M�V�p�n	�����;;/�T�=n]�>��c��w�T��~:�����1�eX�OΔ=5���)ױ�g	�V4V����
0L���ф��t:�{^Zu20)�v�Q���,4k�w	���k�(,�C��g��%�y%�n �$(�������Dtw2ϼȻ�F+�Ր���{���fO3m�E��D�8��'����B�ˁ�P(��Y�hzA�y���,�"���EsM�"�-��^�.W�Mb�gV"�a��H�y�ߣW)˟����r�.d^��J��ܸ�����	��/��GPVbJ�X��CLU�>8+(�w���*&����;7;��wnw�P����o7���!�v�.NơLܸ�l�j�udNKyc���̨�7�1���a��+�ʵ��rn�5��ZFK�D�X���C�3D���v-�-�D��Gi���@t�����s����Wv���0j��>�}��˼�=�I���j���jAo����ye�Pe�(��ҷ��j�wD]C��֩{�R$�Y��*� ]V��PD�X`X��I�Y�W�6Ҏ���S��uN��c��):��J�߲"Q�I�3���Q9��y,�5�g�$M%�(_󓆢�$r�|��w��l�n���y��ا�uD�Ļ�wѿ��|���t1�A4B\�g�mA>��z�g�Ҝ{g��υp������z�8�����7Q"(�Mu��� ��1(Qtr"/~<w�K`�6���    ����Y��FFW���
����E��u���p�H����ȷ����Y���FB	V�����<�T�5!K�����,��6Af�,$�g?�_s��54u���u��ρ��G����u��L�D�K��p�t��R,�<���mZR���+����O�w"Y��9�I̕l�j3b�VK[8��ԣ#�'U�s�E��k���Y�?��(�54!����匸k��l����RBL
��6�l�R�JW-���e�3쮏L��25"��/�̞\�(���^���c�������Ÿ�+�.?�5F��j[�DL�?���&��ڜ���U�
��-Ks�7��]��S��)U�^� N��.�GC�&Nz�f�f��Y搯�A;5�)���?/t��(���c��{a�m{^N��P�R"�LK��3�&�k�a�pדy��X����b���?��+�5��4�����R���v:�)�^�
>���4o��d޵	�����s%��<�k�Qmu��(ĭ!�iS8U�T��{�~O�P���}�y�	A���R]�sw᫚S[�&����ab~�e+�X��;���@R:D!�I#�$���
bd�B
��;i�ܦ��\gT���c�=2u�"KW��c\fLzF�M��,�lq�4�V
�΃�2��{9M��	�/U/g|\'�d�8T�����I���y�!��8��(�E�� S!]oU�F��[���ǻ,�Xw�?�vxʙ�ւ$�ni���P �y����l#Iu��_�dV&�0���y��,�i�������[���C���w�٠|�'u�ae�1 �G=��u��B	���RΙ�6IL�������H�B�����3�!F."�[�LƼĄ�������ţ;�;�a���>�ZՕ><�T�[�=����ɷr��L���j�*Զ�!*��p���8��+�zDw�:�a9_�p��'�FFл�%�,�4��>�ȹ�j;�%��4���|9v���������[I4���t����A%u�XqF=6y�w1-��d"�%����$�'BKҌ)|�^v@�n�
W��,\$�u���1�Wr��N�1�{��F��ڗj%פ�2���Z*��*�m�w�h�~��v�k�_��agZ?���mr�q���;o��y��1T�(�1X��\�Q���b�'$n�=Z���ٽ#���`?Hki�@�=�Ϩ�@��:�X�߶N���=�j��ѣ���_��R)��o�	9��8!�b��q���F�Q�:�?����f���jV{�Y�!��m�K���s{ꚩ)��h�'fޤ���{Ă��φ�6�U�������6oԠ����$�?B��Hr�?��ц��FYb��|P�Cr�i��:V\:��h��)�!�^Up͝�����r6�UGe弗!qN	>�wȎ~�zϫ��Wf�7vly�j_��D�A�_�܂�]x"��b2��C!C�I7D�!�~!�_H�a�
7���[�!bD~E�|�xn3Re|ޕ2�`+��-��ݻ^�Y"�r��g����F��G�{���,�I�u]��YfG�K�=��K<'�U�w�{A�����l���f��q�d�7�_-u5ߙ/�N�{N��v
s#אk+pM�;xJ����P�d�or�s�0**"~�-����<��\�I�+�|/Z�=�(\��8��#�_\�3�q��o�#'n���iY���'��j��t�1� �I*�-� Ł�1�*d�=q�G�Oq�n�@{E�|�nI���|h9}\�IG�>w#J%<�A{[�������[� �>b��c	��.��(�(L�a�Ï��rƧE��`2��e�\�������</�弐jZ���~�;��;���t��0?p�{Ix?�a��%��8�s�����
;V[��e-�O8�@6�C����Hu�1���^��ҿbb������nj��TY	��
��K��*N�KE�ƺ�H�T��E�:U|[7%�ZKe2[ﶍE@c�G$kv
ω��8�N�C�UQ���p��-5�-�}hLp�_!P��Q����Y����5�L�s&��M~Q9��Cy���Ⱥ��`�}��,rD+d�$%I�)����s������~E�<���ƊM�"֘�i�nC�s<&LN/�Z�i��LϹ���������!�m�3��\�j�IcB�M�X�U�r^($�V�[���.�E�R���(�	���Q]�*h�5�`�6п�j��2A�S�ú-���ßz�%�>.9��i�f�����)���3;��2z4����h����rw�y[� �r���U·�.�C�Ф��]�
~�b�M�%$��y�[���m���e�oz$��BV<����*gE[������҇K�{@uP6�L�??G��Ѱ<�%t?�A�Ib��%~-�a�Y*3�/�ۚ3���Jv�����%�aD$�Y��������,S��s)���mj�
����yv��x|�r�Q1��3��Qf�z����Mc|e@�m%��.�$wK��&��z(c?�c+5��b{M����-X��cV�!l��.��?��A*k�2��������[�Z��H�����.�.�܋l ��V\ֈ3��0�v#��h��Л=�Z?\��U;2��N=MT�$���n��R$�~x� �y�2l.�*�[?Ue���$G��NT�F�6����(����J�(>�̼{s�豜El� ���z��ij�'��\�W��f��:����Ƽ ��'AwpP�{c1�t�h���r=�����CJ�`���E��BQ��;{��@�^��	M�wV(�b��e_����\(*_���j[[p���~��aə�B�v4|׹�l>��G[x��DO�R��D����V~��%�P�*�DesC�s����!89R�E�sa���e�$=���0�OM%gn��&��NE}�t͑G�dQ�_0Uyi/8�́��ó.��0Bwh��ҏ���ߏ��箿�.���N[�/��Ą'j�9C�b�!�y	~˂A-�F+�
P���7,�71<�hxL9T�2�����p���ww��\��)b�a�Q�Ы���j��4fG��^��/woܶ9�5��q�H����Qi}<yXa�e��<T�:Wo�M��d����kW��k,�C��k�tӺzK/橝|cǂ*���JDqĥR[V�0iy��>;)�>�����"��Ut]L7:��ԫі.T���I3�Kul�a�-3t�E�0\�H�8~�qځI�J⚇]���3��	���!�&j/yG>�	�8�"x]G�h�!�`c����#cbޔm����y�DNvq^��Hu��B��ԊC�T�ltIKUk���f�����a�:/��u�;�]�M�Fi�a�#�DI?�u4����竚�t�����{�o8���"O�0y{.��Ҟ$z�BkY*�R�T ���i��W9?�|+t4X Ԋ�]J6�o����U̍����h4��xԓ�w����}���[�pp��;�^��fH���-���q*���2L���r�����w����r�W�N���,i��FRb�"�Φ͆����PcT����v��Ѓ���J<(A��&Bz(��䬈�>�r�S<�ͼ��Fa����WԽ��c��"(U�A+�{�����0ݗ�l�ح�	hk������>��M��
t��њ�ytZg�����<�	w��`6������46&|ؑꭿ��JdS/EjD+���OL[yު�����2C��Ջ�UP��.d	ypX&��v-.�D�8A�S�!��e+��}���N�(����,4d�&��M��sCJM��1���w�f����f�S
~�y��k'�L��{�Ak���M�>���L�r~�u���v������� �\���������Pb�Rz�]��nW�H.l;e�Ot�f3i�q+����I��f��jD���a���ځ�J󪪡�ד�`3��Н�3W����L&�ɕ�%��Y@��GQ�������l���X�t���@�y��.Z�א�U���bٗr>    �I�L�¼HZYE �ih��7����!����M��q:�,P�0�0]��Ԥ��b��eÎ�n�V��%YP9��z���f+�LL��n��1� �J�Z�"3���ñV����N��,�S�U�Ef��2�نdb�2F�����r�~ʒb~b�%�����HJ9~�?xLU�pm�TL����Mv����r�����8���+�4�i�)����\Oh��]�k%ɬr��K���4�q+�sl7�g/��@���)P')��k�a��^�xe��-�	,yV��u�ME��6�<��Lq��xå��1�Ƈx[�
�3��6�1�q��l��n[�F�[Zؿ6(�1����/\�
d^ ϭ,�nv��1jfe�#�H�*�B�%�+�h$�	�QӸ/6��LjHO�)��,yN�F̷�q�h�U�����t��G5���L��$�Ba4Ҵ9w��Qv������r��ǁy�L�4Z�y������� �b��.�Ǿ#T�<���J�cyCN�;�,����t�r��b�ِ���/*\�u��͏`#^J�X�Ѱ�@}�����K�j�2�2�m�P�e�)[�2�X9c�zX��l
����6����JJ��G���/�!M�Y��#R`^l��ʍUzt�n|Ae����}�ò�%^�rXi���f���*�#;$�qM�u�p��Q����9W���\�v��ލ�s]݆�4F��N@�)��[�A� A��3���xFv�ᷜ]r}�
l��&:���w�o��y�k�e�M�=GL������X{>�D5؛d�߄�ŋ�q!���Yo]�m�����|	�C��d+�q��B�g�]2Z�$.���+���Ц������K���*>���aU���zG{r�O�$���jS�bЬ�nfK)�r�ߋU�6�>�Q[�j.w	ϓ�UkH%W�Л�3����쯊���f����9���sn=Au� kvd拃%����S�؍Ip�`���b���$-2t͛�������6�����?��W��b4���p�	�I]l��ĵ�E���x����:����%n�ʌ�֨R�@�3t�-��[D�PWH1������ۛW��BB�|���R�I�)�1��^T�u���� .�e��gp��9$����(�P�28l�b�7�r;{�E��'�K��\��9m]h��!J4(oC���#<]?�q���ٍ~?i|���o愆�|d�AW�˙���?�gU������#w��#��&1�aG�/��xp��?�Gي�B��s�W�9�y�^j&�ot8��<LLa��2��!�NNt�>��p�K�����r��5knXF����˹�>�}���P9<Æ̱s
��b%N�è�d�,K1�5V��WAN6y)��+�I��Aj�;��>�v�S�}�dj6��?�\���t0���g�����D�e*�ۚ��]m1������/0��P�����f��"b$���h�@��*E���w��^�[�p�N����6,p���u�~��
�̶XBTs^,��~Z�kKh%?~�pQ��ۍܝ�E��*��{����Kf[2��sQK�f�"�6�<�κ�����F	B��0����n���H��h�}Me��Orzgk��sj�|�eh�3���/�p�g�R���ͦ�%`X�������9I	�[�(ΐ�ӟ.�����ѫ��?�sUE�Y���)����)N&�**s���9d2�퉗�����I����+\ۭ�����]�b���y�nw!����Q�m��-�ea�y�����'/s��ÿ6G	,c�����>*'�^� ���>x��[�²�#����)��*�˿�G��j����`���H��o)�UhC<+� Iu �$��R�E�X%-T�Z@�7d�Q�yx�'0TQz)[����=���	* �b1�D��tQ���H1*���!��w�[v��G��L�V�����r�D]���:����n0^���"����FXR����V�Un�:�b�#����P}�u�����2�wy�ßtCP�y�[��ע	x�$?�U�_�H�jSȒऺ���%�`P��)_�%;�Ҥ2I	�&%��C�����)d!�?u���M��s�/�<�<�j�ՙ��S�{T��:��Y篭�o�u���޻�G7�J�h�H����E�Z,�����>��[�.*�r~�u!��m2��9��T���˨���� �6����O��2z�v9c�8���v7t\��:�'x$�~+'��I��	R?��sk���Ă�	'�
�.&����4�s7�*��*�"�m�;l��3���P��IMe�O?�a�Uź)[A	��Oڅ�d�sw�*��9dw�JZ�mSÎ���+�ӼS���7n�ˬd�i��G����]�u7��q�4���F�vۢ=�we���>�H煲`%���]�$r"�౥/���U��_��ж5U��4w�=��q�Q�/R�9g��1�.����{s�m�$� �Be�}&$/do(�����3��U���ۀ�>��;e��a��X���Æ��w ��=�i$�g�@14_T������chߝ�����=�ɢ���_P��?�74Ȝ/�t"�҂DF���d� ��{Ie�oJ]Q֟F���췻�b7��	}�h��� ��1�kl�&��ҁ���S�!1��|� /�杔�2=�R�T?"��<�m6��3^����=J���8Z1�;�A��㨝b!2ļ3���閶�u>���U�yI��]����o/���z���k��0��n�kJ��M�`A-"��(�}d�!v�����1�Ep#W�φ�*��/�Hk����N�-�d��4ӛb$�^���"�gRN�]���^����nO�W����Y{V,g�^>��*��}k�4�!D���ݽ�ԼQ,�T���[Ïw|wt+�]p �a>���]TW��Ux�f�)��ts���s�qQ�P*�hE�F����̓��$��>1�o%j�Ԩ)d��F-Ӧ	��gd��sWh���b�<lL�W쟢�f;iz��u�%�����<��y�����*�S~lo�2Pbu�7�z�a��]#�&nK�����MNb�"f�]΋�N�n��=#T�_��w����D}�U:�k�\�ZD��!�C�~�b�f I��qbl�?�*d��f��yԺ�i��[���r6��Pq6�ڽ��9�;� QS�P�${<�@Ɇ)m[�,-A��塠F:��%��c�����|�q�N\RsԦ#e5��;vG�ɽsF~�aO?e�s��q�[�@�CBq�j���K�o���@�O쫮��Uf�i���y������"�aC����1?���bl��K�G��\ל;w�p�g�d�`��u�*�G Y)�O�@�xS��X-���q׫�pt����K��P�f3��N���cK�.~ű�;���7g��� ��Pp�S�~��龋>�v�YF�憳[�<a�y[����L\���2�}�M��(��h�;����p�y�����5�����YФ��S�W6IC[�-Ή����m9�Ѭ=P��-V[{p���8`\��A�'F��cR�TB��&�?�.�y#�i~�A�C&�s^�p>1��&S�c��\��(�ւ�=��C�e[��m�y��8P�u
�[�������ÐU���"���h�D�,K�C̆3�ˆ�(��1���<n�E���&`�����ۏ2�#�捜e�C�l~c9��+-m�ᨈ�x�w�xV";1�#~�=�ޖ�F��{v&��s|�{x�2$I�k��4����C�68�게�xj`�шoR��rk���hM�=���� ��-p�-��xËa��T6f���W���TM'�z�qٗʂUf���ZԞ]�eF3&����=B���vb,��-&Ȉ�.��o
��� H|��gfW�t�ɸ������
w����I���锢�}b�1yx���^ny�8H�o�����m��?��g�F���]�R��:��m]#d:    k��zK�71n݆���F�i��0Xw�g�����;)�x��ϝ�*ۀ�q�pyW�ǹ�r\��Oɋ'���j+��=�9˵[����)S�	3�g�d��Ha�]`�-�����P8���)G^���6�u�<��-kK-.x�5܅{+I~��P�2�N�RJ�7��h���Horu��R�Y�kr���icʨ:�%��r)�pYlU����y75g��ԟ��ҟ.�cg��VaoIa'%#�ǳx^cP�Ս>�o�m" ������ s���j�m�?Gn�ӥ�rw4^�X܊k_WIWK~��^�§%���$�*�T������\����P;�ÌM���[8J�/2P�.�C��$K	F�6�.5'T"F۽�
b鿕kR����3�����rp_N
�>�Q4 �b�m�W�H3�̰k��r>s�2�����3�WEL��
Y��ꊀ<n�w��J��0��j�|��g���y�C�ziȼ:��Un:M�1{V(,���r������!���\�Լ�����p���~d�7�p��|��:���&�j��>Ḷ��A��R�'M�����M@99_l5|�	�6�Vk�_�"YW�,Vy��iigy�F�'�&��V"ii�9	^��6�8��#_v\�r��{�o��C�XW�7����fl�¢.�|5g��Vn�!�:��Z��(���L�@���<܉D	�P��.�>�rL��V�q�|i�S��fw��,�&�AJ��`��S�h��(#�]Y����ċ0�a����݆�R�J��:���z���_�8��#�I� �n.���	���U��3�r����s3�r�~G��3v�o��m
�qI�V?1[lI�2K�\�u�����W�T:�v4�,�<SR�M߂��#�)�#��[1Ek㆜�[H]�k��Z����0Ѥ.��%�h��,��@L���ƣ<�+���C9��:��nvb��1}?�"�j�
ĩ)+��3�-]V���\_�l�h���_�� �P�fS��g{�T�C��vH�W�c��y�]�+z�����n^����b�z�-�S�Q� �Y�q�����F�����K�-"�' ���C�?DJ�� �$�����.�X��F���\I��n+�wz^���B��R�q�J6������A�̛��-RU��ے��
�c��m�+�r�79s��Ҝ���t����D��Yެ�8�bI����m�R�)o�U��z��\��N3Y�kׄ��>r�7��3�>##�%@|��{�*�c�U�oW�zb�P�sc�8���$
���_�p;_��ݵH'�pw����i�a�� �=����1�� _t������:R�yH{�03�B��X��}���,��K\1k�Hu�{x~ң����Fϙ>�!q��6$Sz��"d��<������t��V|S��\�˨A��j�p-����i���SB�q#j�r�x��>LG$@ i/��e�!�j�H�I�*�z��W��9�ׄ�A�'���v����1(��Y��,аW_]c$gsM��xD�5�ެ���� {�\L��;M]���t�������]������;��m�FɈ���u���A�e�I��b#�|~���韎�^��n�?��ʧ��Ň�q���ۤ�۽r�˹^�o�i=wG��s0�59�Q>!�	Ea7r��m��br�Yx2[:w.��&Y�4ۨgvO>�p�gEqKՄ}6�ʟXm�	��d�׸�߹�|Uڳ@!�VnyMm๨��|*���MZ@�����p[v<��*lv��Hn�=���ьƛ-f#H:�L��q�{��7wጫ�+����1��+���To�@cɆAv���]�h����%- F,�V��7�����&���l��9A9�����D�"��A��������x�O��S�Ȭ��{����AG�w�!����&�k�:�r�ѣ����%�����݈�����깕��v z\N0�=��h��x�Jɩ���
!���������#��q����\s��D܅J�5y��)E?�W�����K�Kn#!I_����W�{���^~*c ���y�F�:!=k��7��(�$�і +g�!��L�}b���MA����(U�B¯��X�K���p�X8���G%�Zoy���EA��۔���R���S��Ez:�N|%��`�2�@�g�tNe��
���l�߉l�Q��|Z�H�sdU-�e�A[C����XV!�>c$��J-��h�Y %��_�^t��x�费�쏝�`�J"��3Z�(K��>1nsV���g��B�Zl��E{6_A��*�R
.��>U�y��m��;�w.�
f�A؈@�@����.^ǯB�n^����P���,�t�[�W�t\<y�|&1�����K��> f5��\O��5�=���������f։��F(J��q�z;e]�L�Km�ʸ8u������;ڽ��ykW����K����#S���6���.�T����Ozθ(mo�tS��u#,�8�NgE
�s��sa�s�Fj6�hj����������ؕ{c" �t�9���p��p�Ԭs����al����N|}Ȏ�k�h�bԮ?qܢ�T[)��l���E{�5BVM�i9�!��+�=�K,�r��l�޲r��	����>Z�@�$VqGR��2]�>r዇�y��	.��`��oݱ)�e&	�l�j�_,d�)g�T�&��]�����T[�q.�$?�D�1���V7Gઙg�:k��ڲw��6�a�|F��t����t�lMl�]�/����|���
p5	7?hr"�r�&F&;E���zj�����A���	����.`���y��Χ��	�L��Ծ�EO���ٻ!v��g��u��}eR��E�x�d9�͑i�)~9���{Į ��VGI�qg��4�Ű�H���F�h�g+�%Vu�ot��v� ���W��S����'��R������f����; ����}�Q{�`��:5`�c��M8�bG��;���WՏ��t)��@ɣ�~��*�#>�4��Q���k�7q{H�?W-��2�*��8�>:�[E�F���財�w����2|�6S���'�o�	���~6o�B2a�:�.���b������(����}1n����r`��R�*�s4�#���_)�[���f��-��+hW7�f/�����+s��~�������?��7lZH����iP[�"v�(�/X�w�*|��x���(�g���H��m(q��Z��0��M��s7�JfR��_-t�z�����n6D,NG.��YP����:��f����-��搢�� �0�P{(DEw|��x����//�UN[_B 
�(ї�_z�9+2hP�Z-�Jff�Jdrt��Y2 ����A9��D���.|��;[����;�a�+�P
K��]�1#;�/�§�lpی×�#y�5�s�G�e��	�珕�E��iد<�m#�_��y��9ΐ<$s\>d�E� �e�&1���ٺ�m�U���m��zK���E-�p���.������,�Pb�rM!�����8w���xr��#�;�<���G��J��.^�$fG��;n��`�&�"�yz$������|kV�G�$�:��.U�Fx�-��E�H�pϾ�w�OǛM���U-�D ����>�5��ޣ�4;%A�N��p5K���7� �ۛU�	�6�"����E(�s�8SU%$~��LG�Ȣ���K�����#�{0}PM�P��u���&9t�*�O]���hހ�F%���Y��r�z��d�T[7�"ܽ��si��6��D_VY�I1.�\O�j�XtDP/������ �Tvt��Oܟ�A[��mGG�5�-�,�O+=p68+HE�q7�����\����y�T!Q߯�&t5IU�h'!p���1�	�"�I?4��������z1��un��W�똨A�;GtJR�<a��_�6�0�G׿����"�K�E�R�]�Ɯ&פ<�|�U�>�s�3a^I�L;���vNr�Bޕ���O&�ɌWs��s�asO?    ��X��m�}��W�*�
O�!�M�IA�>Q'����?�Z~Wyt����l\��z�?c��X���.f4���%��P��8+/w��8c�~9��U��u��)�,����1]O&�'z��{���N�x؅��O��>��ł�#�����4���w87�Wۍ��*���_��]���Y1^8P�������;J�������~�����NA��,�!/_1�)�U{sU���;t��1�3$˅Ƞ�f?�{
]����&����P��Ѫ��H(F|��`�.�I����@�Լk		Bډ)�x[������k�Εvh��,C�1_zO3��>�
���)k�s*����az��Y2�	��;���X��3����4\�oJ���Z�H]}#.�:�ʘS�\t�/�1�t�YL��bv��F�[A�D�M��7��o��
ƲV��x��#Fk8Y�_����w��`�N\�v�8Ω��04��b.���;H��sIJːL�v���4	��z)���cЏ��s�q�ʗJNk���7�T�>o�a�f�L�5KHac��A����a�c&��ݼ6���"bHe:�>��D$����>:woJ�H������]Toc�r������0�cɇ3�w��o#K�>�8�6�I(~�{����2*����t+A�Ć��lZ��T(HQ�x��~q����Y��F�9_%�w<��ѐ�F����[��q�.f��6���3~g�δ��Q	r����#��GǸPB`$irD@�����q��_�qV]a}
恇�*���v���5� �-{{� ��E��48�Ip���ATk��v�s�1��H�<�� 2UVH�TX&��{+���7���M���'�7>�߀�Z�U����D��Q�*l��65YQ!w��77�}1��[�3�8�d�U.�\gd6w�UnlX��ʟ��.��yB�LZ���D�H��䩨)UC��}�&�`\�������S���c/1��Ʉ�:��eCTk��l����k޹��wn�[L�q1���s�D�Z*�{jA�}�?��,��-��	1����o8��	�j@���q���ΪGz��~�w̞�p&�w{=g�/,��V4f��!��Ek�FK-D�p6�)$��e��~�S�rjI��;g���hk���7�=z�O{����_	��$@�ǯ]"0���Yx�=����6(��������&�i�F9N4Yq��o^�O(gIV�U�4�����&�O�%,WIh���}�ƫ��P��×�0=�~0F|���\ս�t�,\�G"�U[~[ �p���\,�t����R8��y��2A�;�Sa��ٖ|��U���VPvG��܏o�<8Z��%�E
o�ͱ���
RZQ���)v�Vr�#��C��S �swѹ	�ʞ�<n�?�2+�C]M��f'���\�|H���|�xs�d�	.Ǿτ�T���<��R}��t�v�i
6A�����։���>^d�?���`�r>(����P�t��\��WU����9��h�J�Ln��u�:$�ݜ>B擙�H���*�M��*:�6'�2��5�5��o�z&�K�q�Ȑns�?������Ց���k,�x����n�����[α�X�!19�����=jl=�����s�	����R0zC�^�c�Mg��s\��Ex{>��g#�!�y�������y�B��5/�&8����r+�ք���p��̪z����MNF��`�H���KGp�)f�.z�B"�q�|K�n9S��Jb�L��2��9�U�Շ*�m�K�%ZNA&�u���}��~��C����χ�XY����V�Ļ��U;R*�=ޑŠ7�J�ci�^B���|� �Me�����p����
�h$��|��I;���M\v�	$�C~v��D�T#�B�����ۭ��-�Κ��`K�pr��;���-�W�>F��0���X�V[���5�(6��;������M���@_��e|� rt���f�tz����iVPQ��,�������J�z��W[����$v˙���	�6����]�Tp�`E��p�PS��Rw��`/�VO �R(s�\<���u�wu�<�Ϧ�����)X�̐~Hp��BMS���Qt�OD�3u�r|�c�w�8���E���E�;��(�Oi&f96�}��)p���=��(3-�S�sݫ�����������4��-*i��<��3Y�)Iګ�E��\z������F����S�Y��s����$��W�=��}�Unl(�h}���]���9(� �ڎ+k�G��ભ�>��>�'����!�t�����L��p��Ry`�����VS*r���#�/�[���Nݛ ?6N.1�i��?�j���v-�3ɮp�v�Q��V���`rn������%x���OJ�IOӭv�:��*���7��Nay)��e�z�T��~ �c �3�+���y�p�X,ǳa޷�$9��l#A�>|��aLӂ���T;���i/��m����C'�v4o��a���PIxp�5r�^ciiB�}؃V� %A��Bt����������p�c�]V�Yp�<
^2{s�|iw�n��������G�)�)����M�v���v�����(a�T��(�}���|6�?���s��˪`�m�J����i�����H�CH���s!k����xGdN�/a�^���%��H�s^��8wTU��[B�:��wb4�/�(M
I����9x�-Q�Wnk��i�΋NPW(���&bv~PL���q9��1�p�����r&���*���"����@��g���n����e?����C��7a�=� ѡ��}J G����+/�'UU�����9}�}����'&�O( 7?0?�ޒLs�	kd}�H�_��'��(=�#�IҪ��W5gAɄ�k�r1�#��"�DRq���ƉS������=Ά��9X��i2u���-��#�A��AF�u-���d�I�������Y�lvUn�ls��|@�Y��o��<&�Gۣ�L���t��x�ݢ�����@=ڻ��(��2]�Ǹ�?��K�ќ�c+�7�a�+ZE�\����[�R�3��Up����<�r��X|e��8n�1��A'g�����`���_���#���}OU���s��*����z���D��1�N�=
���:,c�iݦ=�#��+ٺ�|6k#ȆP��\�hLzO��8���$��ڷ�u�vsC)�|	��[�K�&�Ī��I�gwx�Oh9u�P�D?���m��ϯ�|�-'��J<�_{y�z�و-L�xX��h��Ӂʢ	�CҎ����x^7,�H˩��YJ{�,�u��0nĶF3���*��^�V�B낃['�omE�w@�z6�c.D�r���;PuPV����	�$�"���ăJ�BC)�t��l!Oϟ\o�F�a�FP|q��� �T�('���Fgu��g��X4�j���.ڳ�
��k6��E�89�y����d}��3AF��9B��
9n�����]x���m�K"�~L���� ��] ������U#��jTuuK�gcw���qЏ��UV��B�6q�o����*�Z����a}����hYk�0Q��GѰ���N=f���p}��@We����Bj<Hk���=���0�E����6C�;X��s�H|��_�}�>������ە�{�w�8A�Bʰ��\C��?���϶��C��ʻ�p��W1A��X���5w�������2�.� ّ�`*.���y�Jk��>��6@���=a�9����w���X�b�9�Vϑ��M��r.ju��T�������;�v�������J�`�;;�?������5�H>B.��F��-�j,U��h���{f><Q� .R��i2/x}��t�~!�7<?C��D�yD�
H�cp�6�[Z�]�,�-��Ue1D�@H�#��]lBAl~޾�.���И�~�o�!�L�;7d������E�&ǟ�9&�a��ݎ��_*�H3,�/�C1Z�Y���Sg���<�    T�c	�� �!�=�w�_���(����ݹcLB*�x� �� ��|�[-�OR���2���Je�
��?�Ø�e�����[4��ќ^y�y�{�*�.�A�x�r������1K�,�.s���X�s��a��	۬��0�E(Z@���A�n���h� �Y�A?�,j�-����D��j�N��:^���>��t|T�b�iǇ����5���E3r������|��h'�`��^���"�����<,\x�S�{��$ʌ��_a2Pne������s��A)�F�&9�U�Yeπ�=8cw��]��1�%^G	�[h!�A]n�u�8SN$<�_�8U�I����ƹ�P
^Q3
"��Nұ��z����v��� Ī%2�ԗYy�_�sZ�J��/�g�U�jk��M��`�>QK�p~�S��1��_O��Gs�_W�V6��p��|���p�p��r��c�b2/�xo��-��*ǳL��k����2рH��K��+�����N��1�׫أkY��ߍ��s�����\W%O��h��p ������ɻy�|2�p4p��i�	@-[{^z����͹_r�'�Tr�x�_���]:-�y<��� �t1o����jɜŐ-����Y��,v����ad����kB%I~��@�3��w!�&1����5<6ޑǎR�	��>\�oY�d#ރ�!��罘!2��W�oV<9j7���߇ �N�E�nK)��(i�v۵P���u+��vV�so~D��r{��ܭ��>�Qƕ<���:m�{b`�V;�4�>��e�&B<#,|��s��8��\w��u����fmmC���K��ͨ6ӿ�x��1����w�xwH��4�G�
,�gY�sC��\�A�O�+/��M�Hܔ?��B��(��G�������c���#��B=��|�z	�ȕۯ�����q�[m���C�$d&��mD̚e�*�� Gո9�`�\��~��v'�*��O����>�z&���t�/�����Ԣ)-ub_5Ѭ.�m��(n0�?j��'�2ςnwS{�Гɫ�gF�������W���-m��ߗ��Q+5|��$Ť�-��*�p��a%	�y�+>����3�rF�5�6����".���kɉ�C{��Dva���z�J�5x���pct���	�A�%H���7rZ���kg��������3"tr!����{U��f�eψ��1��=@�C.$��!�	^I�҅��x�r$Q�mO���V�����c���α��<m����'Eض*��5G�l�O��hZC�e����G�^.���/\�"�^T
^��B�i��l8E.3z3�	�	�>�O֥xb����z�$'��ERL�JeXմ��a��R"Y��ï�!x�2�
C�`m�s��!���W���Vq����6����J�b}s�����Ղݍ��D�@�����W$}���Hl:�~�z�M�9+�}@��gw*����SSܜ�������d��� ��C�`���=��'���y+(_Ů��v�(�? �����r�זٶR�o{�h��̻�/�q@k��H	�G���ǀ����%Bŉ#*�
��]�]0��a	:�Xd1�$�=�mm�t�%��:P+GJZ�$�$�}]�^���3�e�z�����$ލ��������c�#� \��K���9��x�WNv��<QV#�� i��~�s*����!���Rފ������- ���D�������U�\���U� C�4��Y���y{ONfC��I�qQ��@�Gp^���é��^A0�BΊᴖh�أ3Xp�5��ӓ!U��������GV��d��-�Uj9�8�1Օx7E��˕���J?�~�SU_Z�b���B�UI&�:��_���nj�ï!~Z��a���/���n�B�N���|�y���������b� �»��$���|lg��2?��@.(Q�`����p�8q\�6�xÙ��&����ޅ[�4e,߅ө�|�℃���7��}A��l�S��]��E�d��R$r��&am�x��-1�;��_���mj��j8`������+#�P���.�H����V���[���Q8pAEq`\��3F��Un��Թ��OBĖٻ_��x���g�104ˤ�L���;y*�o��[1���/�6����XƁZ NG�n�V2O�Kr�7�#/�c�{*�Z�MW�m�g���o=E��L��r�c������F��s�N���d��b_��X�vG�!&�� t�eJ��͘K�(��nk@���?��^�u7�FP7d���R��qT�O՘��-����Q���s���%^��Y�>Վ���ZIW_����[��{g��A�3�J�z�u��}0�!	f��?��\���R����f�qRꑦC!_�h��m��e#��b��cq]�ߜ����c��t��36��5��	\� K�����p�C�| S
��Ơ%(�x��1.9��od�%ћp��]�L��&x�L_��jqQ2"D�}t�5b���r��+n[�Y�15�A�� Iwa�>AՁ��R+G1^�࿄�1g�я���ܸ��W���{oi�ɂ9�#��Ɖ��mN�=:���L��'^�b�6�	$����u���b2'���|�H�ri}�q��NK{X#�t�`DEy6��.r˔'�X/���,�?"ݾ���Mv��W��K�8�\�W~E1��y��[O���W.�����u�����B�^}����uz���'a���R�����3�$�����?:��AI	��A�맅.� �_�S��.����4��6�#!A�iO�M���Ǘ7�<� ��z�@�ĻK<i�dM�)|� ��C1ӍO��i��g�L��à�=-7M�5!��Tg�F���4�e�
�?���S���|tB��Э�^��p*�p��Y�&j���9P���/or�������C���4��d�Z�@k�Ez˘�;��+[J+����nY�E�jMB��=v�>F;d�x̐zq��o�o����0J0zE��b����S;������C�\���,V�й���)�m8���~�����|%�4 2�g�c1'���6�7��ސ c�r	uAo�����;��^{���B�	]�$��ɶ�=R�mS#��t���Ԥ��J���-ml��}�A��P�P�;�:� I�^�6f�����Ֆ�
�c�X<�z��mk�����g���i^����1N�\����M��Y�y��eC�Yq���VN� ��H���SȔ)	
�g�GO���GȉR�@�:}�4�k����j�5Ҍ�]����(�ן�6���O�cR��h+��"�wiX0��'u{�r��0{�W(2uO�	��)
�O��'	=�ؔ�2�j�ezM�u��S6��J �����H��$+Z�.���K���S}�:1�!Q=��(8���\�w�n���=]ss�������"Lf��^�8?SJ|/M�X$V���|ѭ螡y��~=���z:���.���;)��|4F�P�ɡQ��QT*�k��I}Z�6h�h����<.f8�����m�濇�k<{��5Ť{�f?,��Ŕ��%Ċ��������4n��PZ��.|��������y��p�x���=�RE�5���H`	�� ����K�g�U�;p6l]>�Jm7w/k�����X�Ɩ���^(^��6�9�&i���˄��S��Z�y��+2�z���+��oʷ�U��_����`W۟�h%����T��D�汍~J�{ӈ]1�lٕ��F?e��A%q�%�3w�_���]�Zϓ����n�X���#���O�.>T4�]�+����Y�̿�|S��F�K �x�5�E��y��GG����z)z7(p�i�oP��8�����(`A��3{�҈��n������t\^B��@��i��=.�+9����#d�c�L|�ʹ4]Hpr������ո~7rC0�>�����>\��Iߖ�>�}+� �g�!    ۄZ���<��!��l_��EYP%Z�4�R����cS��a��}��u�F�&vᬊL�EGU`uSs�_-E���	��/!$0��Z�8��6��'�3O��|���O:
r=&���8�㹭<�r*�ֺ&����D�mg�.t�-L}�l�	�O�G)��5,�&�#�WLu��b��2������r�Ɔ6n��ʗ�g��_SR^ǭO��
?]�Ѡs:�
�!��9�b^Eu9�)�����q�ә��x���������E�+��`G�L��ͦ�(r�ӧ�}7��)��A�R*�������D�����S`��O�������X�B����8���>=���K�d�_�_A`"���w�)����D�@���L�Q#��>,��X����o��'w(h/׹�{�V������R�����٤���h�mc��C�+�D�R�S�.��ԛD�d����(������'�b��x�	A�7�e7���O���um��L��2:�3)��P�����b^["z7}�z��Ϩֈ;
.���ѹ��v+]��3�V*E���L���z�83����3��}ZO�q^'�:�)����6퓦���L^�$`����N�W.9�R�����RPG)�����p9^�
_$�'>߸�����[H��Mg�k���&s�jA�Wع��:�Y���t\���q�bj/x��[jx��X#%�]�� �)
o>K����7�7���]N5�z6;t\�^-\��A)�t�r�	�)�` !J+5��`OT�q"+E�R_�Ŀ�J�
�5H���PEZ����F3��5��(�����%F?���K�3���E��޵����A���Dr���X���s�\ފ��	?m��L�×��(S@���a�{�4�����˽N�"j�kh�A錙��c��șÅ.�7'��1�c{KBY�G���@��뵈�븳�Pㅻ��9[��� ��k�|T���'�1N�VD�˷ǆ���7&����.��qγ��dbu���q�lF�z�a8�jy���3��-��I[�S���0/b�����ń�wT��S�LO`M�q�g��ː�eG��t��G�#=�LJ5_�!�4t�4Xb���v������lh�uJ�Ӽ�^c�\pN6�I�p9�S1�|�q�����͵�f�� 3��3^���G�X���c-�B.��iYUٗ�&�(��9���$���g�\E�k�P���������PK�Ƌ�>�NO�gz��K��$k�8�*�Y�4Ԁ�w��^b�ƠE;{�>��	���ٿ�xң[t
�m��|� YZ�/�J�K�J�����Mݺ͟�Q.�P����dЯT����������:]T��s�Z���H� �1 c�á
@�%�Ԓ�?��ݢ��5J��M �+_�-Q4Ҟ?��%�|) w��̙�9u,�7�L.���uVX�{�C�jz3��U��I�m�* �A�ɱwy�.)ʉ�^O����-�f�e���C�ca��j>���k	6>s��"��U�8*�T��=�M(0j8�4zڌy6B-ؽ�:^~�o(	;���Y�_|���[�k
��%��f~��S{icw��\�g;�I|�Cᤡ�5�M�BVa��n�~~����<�{�~=��uZ�Q׳� ���Er8K�R���(�[|֋�������?s�UNJ6��kw���G\�;�H=)FJs����	K[�L ��t���l	b�dxK�J&�s�r��W7�5M�~�M퉇��l�AyFQ|��y�����KiE�9����8.H���8,)>0]Ofvn���ܯ��BM���kj�/vJ�@�� ��It���SNR1n�Cd���rj�B�#K����Q��N�S���1���X��l��"X@�S���{Q_E�lk6=��Q���N1��oB��4�"7��G�':������������s�
� E���Ul iлPL�ł���ُTӪ�3�ʂ(:�6��p�&ȉ���Y���)�ľ��|�Z>���A`R�_��v/��xul��B�C"I?��sI&�4�r�ED����jw=m�$��'D�D�-*��,�������'%��^N��z��u�n��\�����u�8�d|�饼���i#�(;%t�:&\�2�qM똖�9�շ���^w
B)橍?)�Oq�4��&z�b3t��sdꥎ���e���@VEN@$IX���65����R��+����#x(!�Ɨғ[�౺�"� Xo7��W���:�g�*�z�a����>Lmcƛ����Ԏ�X��k�wOX!�T����MDE3ۚ7�k�*-KH���
�&E�~�F��� ��Sz�Z�%��Cι8_�2�Y'�{���B��I�x��'r���&� �E�^Ͼ���Z�
�y��]�q�]���FI:�XJ���g�\�TX�CF��5�!>�ʑf�{O�B�������q���;�Ks���F�(�?�~���$��]xXz�?��� ���>K�%<��`xy& Fy~:�"��}V�w����1C���.�#�W,�M��	�+��*ϟIGP��ws)l���j�Ȃ�p+�i��lj� ��GjA�<6�1�I��8��p)!���s��-qF'Q�X_(|K�Fkw=f��������=��F��e�GU����_z8ڂ���܂0;I����k-�y��wݒzM�������o��ͬ�#�
��8n�hW2|��1�݉��LE����b���|q%-�pssY(�'W��&�jx�6k0,�'6�#�p�IA!0�A�����BE2p�-��S
�\:Y0I�6:�����X�T�m޻������-���	t�kb�)��4�r	�G:�RS諢ui��J�}����"���BB����a	������3�ɉ�L� oDTb���~��T��]NI.[ڃᬦ�S��iq���� �D?���/w]��዇�?����Q��W＿�ˮ{g h@�;7��Wj�� ��v=D�m����v��q����m��}z	��.x�-��?a�̓QTdW��#7���b�3�Gv��ۅ%�rG�_���g����m�ɿP��F���'<���~`���Sx�f��x;��p�5F�����v6��Q�5r��RJ���#�6�9���	�%W��o^o�;A:9��"���g�����L ~X��p�EK߶����yO<_ȫ�"�r� NF<��RLK��o��ԲPrK�'5�k"i�^vU�D�(�3wuؽ��u����8V�82 Y�������u�S�9�5�O8#R��lF�T��.��'DQ����|�6��m�B>��AM����-���kc�X�G\^��,�^�3[^_��d_���L��<�m%��k��X"���	�4��.T���x7��+uX�Z�
��?���e������L�2�T���5����
w�l�1��3������
���c�rh�����KZ�l�����ݹL�z9�+l��ڣ=r ~���>o?U��A���[������3I] c$侬��9j�C�"�J�J��"�d(I*���I-��P���6�TMJ���2c�9XVB WF�-�0���Ho��E^�4s��#���:��j�캸��T�eL�?߉C�u��fz�`&����֍��/p� ;��?r��0z1
@С���RHX�1�F�1�ꙃ��c
�OMZ��.?|!.�i�'p��Υ��T����������a�ij��! >�`�k�eRo��m�d w�&�c>Ml��$���/�.�:�����*��;�V6��y��FEE������/��D�FJ��|�0��*��O�	g�����=#'/��@�*c���
F����[�w�5��	6�<j4��k�Ke�A9���"�� ��s�{��p��[���"��{����ࠊ��.1����t�U7����?��Ld�a�\�WcԴ�Xf@�[�	���Ğ��4;���䔯G߂�SD_7�w����m�9C������p/Me{��w2�vĒOrw1�    �������m��!������e���	>>�td�G&5�A��x�y�^NY�� _���
�E���R�E�δ�8��u���F��[0�h;9Ǒd���H/'�s=G��\��]���BM�n��"�(8ß\� �vXX�����!���G�fv�T��L��<��Y�����5_8��<�1��dDb��J����D�r ��`����o~�h�<��*�#�%�L0�P?x��q	�jFC�I��nf�0��%?��;�ϑ�O b�O�G�<�R���@vu:��CL����x9of����}	�y��,bU�Ye^L��y�W���V5KvgB�<$'�U��ɻ*�;>o~�G��:k������;
���m�gx ;^'�D|9�*�T��Q��Y��=�w��!���n�+)�e�	!d�oX�\S�s�= I�����x��>�]j�%o�B�����d��`봿;C/Ӧ0htY��U����,,�?��W������_P~��X�ͮP�L�-D�����J���w�����d�։�P����ô-Y��6^��픦�pVՄ��r�]���\����:�^5qԦ�܋��_���e��M�oz�ť�$�m_��p5��nG,P��[�m����X(�6�||�'
���}��C�Gg��ڥ����le9�Z��3�$X�D��^Ǝ�z?]�wR���L���H1Kv� ��u6O�g�����b��=�q������S�*�mM!�ͧʂN���yٵ.U_ѵ�55��Ֆ��P= �DW΅�X�V*�A9 ��]�2&.�{�0qQG	���M��c$���.^_�g���[�����&2��$�g�\�0[L��ހ���_����}���M�w�s�̧����$��֗��rg��GLmf���f&E']̀=F�`H^�[��VHBr	��v�D�V_gbi�B廓P6�+9A�w9�LFYMT(^��W0&͕2L��$�S����M��i[�
�?'�]Ȓ��S<�	MMKIN�}������[dEjXr��+-��|!��& �Sn4B�B���#�A`�nͳ���l�Q*ͻ��T��3Z(ZF�gW�^�tD�ч̢MJ�^�oػH�'�7^���������]|s�`W<kao�?Y���.�d0f��Z.�`w��l�l��V�.A�������F�>?	?K� �$Ҩ��4��Y���l9�|s�a�rM�hz=��=q쥓�`oQ'Q=[*��,�z�N
/+}�I�]K��������	���^��!�S����5�ȝ	�.�̱��M\5!�i�t�D�%<R�A֕����O��~Fcs8�7��ҴleX/ںT�xM�6����8��n�����乑�J"��p�|hX(��_�
�>��,0���!�`Ȗt4�?,����{'v��W�9�/F�.%.��Sc�qa$�F]Cv�3�ޞs���/���g�<Q����TB�ַ���״�]�!�Edx"3�q�� �!X�Ř�ܜ̼�d����Eާ����Ӗ���\�� ߉�j7���[��j�������fT��{[�b�v�f8����|�� ���i+�0�9uRGj4�l=_��
V�&��'R)��Sg0t�ut��dJ��������t��t��ڋf���w�̗�0"�8
��(�=�R�����s�"V,�n����k/#䆛�}��Io+�v���7@{�,����5��$����g��_�c��
,�� IW���Q�TM���
�&%��Y-�#d�9�<��Sؗ�"E�!���п՛$��bI�y�/
�������:���k?D�V�O3���cc�`H�)��"�T�/�!8����2��g6��ɲ����g�S}�y��Gv%]��4��AJ���K��)JK�t���5�|u����ȣ[��4��	hej�ʒ����λ��C�1�u͙P�a�@/�. 1Z8�h��|3��]Ęz?��H���W}CgK{��Ok������ۻ�\K?z��}&���[���6ɠ)_@�q�a(~V�TJ k<�@e��5�+��^��B����Q/�k���A�K(ti!��~|�c�[	M�9X!�
-|x�Џ� 1<�Q�����md��!��k��Y�|Vu��D���5ֿ�ԑ�-��u�%�C%��ubAW���=�N{`�t��ؔl*�g#�o��J�?0r]36�n����=�6jT�2؆`;���V��`:@py�'��R�QN{��RP�����_<%�� �ʆ�ԝ�0ĪV�!�Ϧ��k��p��h^��z}C���|�I�E.� έ��7����m�L��J܊��^i˵���0��=[x���G��Oܓ�$/��g�����#M����y�k��7��ϡ�����˯������H��0��B&���Psm�'<����Q����R����� $��"D��� �Xd
"���$~�FH�8��|�:�@�@!�s��
�s��r��Ԋ!6� L��J�N�^���)������f㵭U�.
��O*�:�F�J�T��?v�WDa�o�،��N~Ө<�1�V.��D��x�9]lΛ���))��)�Z� ;[O�p���P��sS8���a� Rlw<c�w�b"���h�yN�ؐ�� �:Əb����h�H9�|�AL`&�
�r���hp��"?�G�F9��kJq������q2D״�����?�����f�Y�Vr1w�)�EP������G9�kK{{��|c"JT�?�{ju�T˃s�p� )����Y.z�$
�.��M��`0�l�)�B�rN��Drg۸�z� ���䯤O�]+Yy�E��>W�ƕ�)�����ÉLW���Cl]�W��u�M)�Rqx�f4��gb�6;'g�I�9R>rܡ���8��q��м�|8��b.�p���#���'>��->�U���p�h�鉘H�W�=\ �%��aqQ�s�5Um3�Lk�*-�7ݳ�1���"@���ș����[��;�ཕ]�cўj��H��7���Qvdc��2g�']��f6�o����]���T�>��E�i8aߜ�=���P�v�8�I�G��ѩ�=���pAj�PG��ir$�����D�/)	9�$?��8�h�9�V�H�'t�6߉���34O�K6�c�D��a��۟�����sZ��9�%� FU��z�A̎���bm!�r�ލ��c�d��!
5�Phj�
07)>O�R��=�K$@����j8�fl�w�fv��e���?��3r�G�>��&��H�����>��*�Q�� �.��}��,�j��Lv�y/��!{@\����Z�ߍ��l�r�Z�kVb�%�naq�)r1�MUl�,-�tW��ׄf7�9<g^=��ޝi�J��5��ƣ����[�V�
�:!F�6n���MTq������|�,4�2�����b��y��f>g|#�,߱j�ƲH���rj�W�Y�6�W��m�������Y��l��b�	�Z��,dJ,ld�E���
ʶG�b:���*J!�6�V��ؾ�b��v�����"ˤ��g�C���������	�[eb7!���ɒ����¡�x|FL[��#/*h�C��:^zp�gb%�����,��UT�7�kpr`���H'�rϊ�GF�;)�7���^9�ϫ�[�6��N&����>��7�T�0�M�f�C�vz����_���w_Jhu4{���Tc��3N �W`���w�?��;1l�/�� ���0K:7�[U���3��Z�1u�֎1��#�~\���zBp�{O����..w����Bf5���m�M��`f6���'�;ׁ�#]�=�L�⯊*V���չ�V��}ڤX���':�B�D�; ,s�+��ML����9�f��t��pN�Wq��"W�����_��e�I���AE���dE�T���'�Ȋ��h��w
�6t�?�@���<����*<p�C,?� �
d���@6V�qj��ZZ�v��1s{>@jz�x�sx����2x�|�j~5�J�-�qn�0��|&ެ��sJ��ַ4�'xɁ�֭    ���%�%!n׵s�O�i�J�����c==NK{�(��v�[���F�Re��s$�Kw?E���_$��s��m!���y��!��D/N_x��`ť��v����Ds� �B�����|	�ݟdy��w�O��G�2ߺE�ԥ�`	�I�zY�T�;t�9BKF���yx�Ę!�z�Ձ���7�*U_����\g�a�{T�w\\ (�_բ3�J��ҩ�G��o��Z_p���A5�\�h�@ ��C��?T">��jM�)k�L~J��߰������MM��e{t�H�pG��'���y��l��z̐R�\�ũg��xd��N���#��P9QqSv�!�~��o��
6�e���>NP.��VD���'IB?��J�n�,�Ϩ<
E�|�'k��R���h��鐄�r~J?���)��)��_��z�A�N�u��x<����gK�:�� �5<(���etp��P'ޓ/�
%h�Z�+���! {Ԕz%܀�_/�M	E"�U�e��s��E�oi���1o��l	�Ҭ��.�E����3ik�o~%]�c��mz���r�m��X��K����>��� �c��@���Xpg���c�`������@���{��%uP���������e�6�į��;S��+B��;��0q�b4��m���g���T� �ѮY��f��[ A�P݂�Gng)`��[���m䘓	������%`�t ��1���ˇ|����c��?�vtH�����.��5�� �E��O�𶏷�T\�",א}���-A�O��ح��i���'rb� *@�~&ʹ2dN*m�/'���{ڣ���%s{��@bx"^}�Wbr�bZ��o������7�~�$�8������{��6_�lxO�	��q��`p� ��z���!�7��t]O8����4���Prty��� �2~ۙ�/�9�+�ѵ������u^N/V?A<-���7ǹ����Uo�$�
>���*.K�������a�'l@~Pؽ3��Hp�E��i�NtT����N�r���FB��O�D��1�pS:�$;�NIa-�B�-_U�;�lo�pZG�->�h_��ߺ�Pt�)�<�+�;{���̩u��W��[��Ɠ��=dS�W*p8�Sa���`��ƛ��]ܤ��,��lh���p'`
�D���3�(��$������}ַG�0��ᑴp�Q�uH�\��X�GX.����NIX7i&&]{Jʻ���x��0=��-1��JU/g�Q�iH͇������ӡǐ`�΍hU{K.h��:��	�R�=M����^�A�FGQ
0%���;mf�D�;��a�3��ƚ7��ont�v�r���oDD�(�wYz�����2� �+��W3�,gL%��;���a-�IWmw�fN�������<�!��I����-�*�D�qS� ��%Gx���@�V�V��������ǵ���#�3C��>Zr��Z����-������(��g�k2Et������ �ޯ��
�6Y`QBg�,B�N�e9��o㕻�X�k�W�ꚜ�h���k�x��m���
|'��_a�4d|�YJ�̄~�$(�לw ���N������l�;<Ա��tT��� �R���B�F��3s�b�~s�w/��}UX���=:��i�!�/�O䤹��.���������~����,F�e$�m��{Ǜ�����g��U�{���D,��	wǐ����s*5����a8�H���cׂG3�����"�r5�P�aKH��]� ��,��ƽ���  ,�J�d9L���[���[ڰ���a��l�1F��!NMt1�{�kr*��&t�_�.FCt�H���\�t��+����a�mc-�-T�e5���ې�O;�߹��h��X�������z�k.p��~��$&gbT��!���?�Ԯ�r��m&Y���>���"�?��
�����p�F�͖T�����U�3�jP@B4�$���t1V�j�,$�/��R���i#�'��g���r�r����;$Z��2��E�i� '�!���3�]�_R�\��ۇ�4���¿�+���W�37�){�0Y�����!9p���u6�����C4 &?Y3���f��՗��X=y����n����t/<FVXlq��en��sb��Ih�L����Y'��ц/8�-�UT�}�cJ
8Q+4�<��GW��Ol��qس5�9����	�1P���Oآg�d���k+�tV-�O�"~��es��[���C>4E��F��C)v�k�-�����xH�M�����i
^J��ܣ8��f�T�O�{
_��AX��������j^����L��8r�y�ZjR�9�q���ӡB|��YM�ֻ_��f���l=�����<�Yp4�LlR�j�N_�3a�������f9���#���Ӣ�-u0���������{qR�C�������F� R���,�x}UC�^G��J"p�@�չR?څ)0&dMC.��c�$ ���-.?��L���L������jh�.����tS������r ����w3��c5�쮡�^U�Ԭ&m]�͹�m�M����vyJ��	��Hl�}ǎ^(�Ǥ0~�V�.:�Ju��|�a���l>�r�/�
�;wU�o:�̖T4F�Z�j��[�&�w�9�q�2l��J��8���[2�iqI�,��a����w�X��FZ����K%�WTr��4�}��8׹6T�_r9|3�>�G�:�jU{�gT!��L����)��p
�~��;�6���'/��x.�]�J�� �M��x��'�»_�W4uŦ՗k�M�>n&�ѩ'��� �����ѧ�W���T��h�ր
��zz��ON=��ę�܍���#���_�O6������ҩs�Y���.,�u���<,�r���9�+9�!+��%E�n�֭l�	B7X��З.Y�2UR�_Эtb"�B���5ڧ��S�Ot�]ٲ��U΀y�M/9�{ٙ�i���v�g�łh2W��]l�0�����A�V�3����z�,��#��z�2�n慤�q�=?�)�ʿ±���i�����P�:���R	��W�#�.�'q����bJ�˛F��������bn���#���}9���l����~}A��h�T�iސ��bT�YN���?���ܑ�yRɞ%N��R_:���*f�����g�,�L/J��Ir_O
Y��x��)�Ƌ�p�Tmo� ��(!�-62�|���)=�E1���v���T�+g�@jN�"�
���'v���!ڲ�!6�~J$:!j9��Q9J�>)a��]vvt-���������F5�%@�h���G�b�(�����M���Dkd�}뗪������#r�@�/
���	���eo���9"���ۜ��L�Q����?����?jk����{"b��Al�#�Е��5��#d �WL-�D�|ꦼڹ��.A�ai���ֈ��ڸ�;�8���_b���
������'�����9�#��پ�Ùv.5������YLjh殶\������_�_��C?!	=�E|�o���	J�YA��1h)��	��#D��C���ϧ�2�Ia_Z��q����{ۛ�c�;������P`D�9��} M,�s�g@9��; ����`?a	�!����#&����!LZZ$��p�T1�',D]��j��.T���| ��Q��9zE��<�e�G���C��j�R8An]\:B,'}}}i'T��8]H��<(�Ķ�	�k�{�?RKW*0���J�$[�YN��Jؚ��g����C���m���,{1�d��A���6��Cf�9:��[�b�W|x�?����wo��8����L%��/�P��'2[OVNqҨ�J��m\4�x0:[b�m4Z̫�i*_O��}�9�b�n�]=E���	1�D4�����޵/�d�==T??T\��}��d�P��\�-����d��A�f/#W�%�z/��L�&��*�R����    �_b�����Tɇ��#��
YN9I���q��zu4r��x'c{������1)}U�Id��vb����pJZ��~�h)�V?|ȇh=��~�YN&��R���T��i�rŐFP�˙��w�"(��w��Jȃ!�Ǡ�PA�N�Vwz �>D�p�&�v���J㾜��ML]C�Q�����r��@h�m��̓&����.�H����5�Q���{��O�A��s���Gc�z3�MF��/�m}��V���6���j����F�aTR�Q�{eO4���9�
����G��������d��h��KT���iZ�`H24ɏW�5�n�i@�y!Ie�@�G§U�s���w�N�{��諢8Uj��ɯ�Bt`�&D�=�>t{��<��֧*�v���bݳwjߜo� m���[]@�LY�6�ƚ����&�y��N�R��tZ8Z�eK�lk���	�{���$��@���/`Y�3X
.���E���*A�B9����K(�g�+ez��o��������/�x�i�����ݢ��K�����䳂"�� ����X��� ҳ���V?�U$�?�7v�&�H���3P��g�D�z��&�f/!���cJC��>b�T�h�o�&LS�Q�h��y3������V� ��=��|�M�f��q�x���I���8���!��El0�]�0=d�Cw]C��k��u����� �_,��&4� C(��>y��%%�Ӝ�9z�����f9Q׫c�1,C�2m��o���֩��ﱠ�l�^?�����;r��О+����\�̸\���jh{S����9�����3������yj7I�*Rt����U���uò�0sg�{�9%�>��ȃ�����?	�c�)�^U�o���x1{b(��-C��������zB3��ĺLob$�i�N���������^r�U��_(����h�Y:c�N/@�o���Y���0�i�R���|᲌_�9��L�A�T����xk��ʱ!TtB�h�oX�{�R�C[�������:��d�I�X�H�_�������.n����]����8���?[��w2��
�G���W��X���F�d1+6z8'�z����3|��e��3����C��#�=��d�^�+��/���I@֚����&����pv/�K�lKu�d�N�~���vMa�����F�ς�'�c�6g��Q��IZ��l�����P�~>��8�?�l&�i�X���u:<�|�M����)'�(��ۖ�-�V6��NsB����-$|�C5{\����3���$�aǣi,����Xc3����1-/'bvJ��4�o�ڽk�'H <_�D�Zq�[K�Ý/Iظ$m�+*�$cb�Զ�ΗEK�,�%����m?��R��^�����&d��}6���b�`����C�,N���p�D�)�3����[-������N!�f>�� 3��bN���st��9�,E��R�,c�հ?�!Ug����v���u/�0]�C��p���zЖ��m�}�x�N�8>��3m\Uͫ֐�VGs��`8p⥣��|�r�8�}��	�L�:���"�t��NE򤺷�[�9�Z��������i��W)W҉/:�>o�Mpo����3z9Qͫ����:e�'6�^@����|�s�v:����7�aE/ӭ̭+����Cť��X��������k�z�x�v���D���?��P&*c�R9�U���:��=�<;b�y��q+����.eҋ��+*oۆ6���x���E�v���S���"@}��}^�"�;T-`TTc����4���kX@l��6Jg�رT_�1���ti-S�g��6�?z��V�^c*�wL��c��]1��?�]
S(��2\���ڴX��-��X}]O�,SE����Մ]�ܥlCi�|��(|�z����m$����<��C��>o�'iZ�M��_�?��}�.w�<s���C���t���54v[l�I�_�yy�����h�NZ "z�񗘣�Ɛ�3�Pټ���h�Tm��
=��gsxB�j픢+.?�'vA�B��d�}F�K��;��3�:[���^�]�{{�=���=�!�A���m��(�@�P*3O��|VG�Y���I���De������#�wq���h��&W�����7�l�����g�'�~�#�����i���-�N��:!��>h�o�C�	����桜#r�Z��T�!�s��ʓ=�$�Op�M��Qy�F���l�f��i���N���Ny��B����R��p:�B�d�:�g�bO��J{FǄ��>R�+����U���ep�|"���I'd��!�{��E��1��c}�?q|u<�JUV�$1it,m@2�����4/�i�I;E��hPC �?j#�����ILv��P�	qmҀ��F�Q���jl�o>�,^�ٜ�V9����⡆if�%������۷���L&��`��W����s���_e�mk�Z�$��g�-�:�g=�����XBk�x�����"�i�#$�l^�Ժ)�tk5+�Թ���h�R��}BԒL�λ�7�
q����WT)�8���|�&��$%V������P��t��N	��qK�A!���P���6d�r經N�zr'%�)q0;�'z-P>7B[儸��G�4�	��q&�1���P�r���r3�w!�-CB��"�U	��xH(H���� ڡ����� ���r׸��5̊���,�i��;ӂS�~��W��A�=@���p�L��rJ�W8���w����wr
}��y2a�I�������B}�pY�T����wM��� ����)�Pߡ��Z)���O��U��V�"��5�u(�!�_��lJ<�\̉D�/��,�vz�V�$�-��U�ה�;�6�Y����aO�jnC�¹h�Z����7Dʷ�Ej=��W��������Q�s#+axT=�9����3����ښ�`O��0[��p���Ԛ6*��h����3l�b�J�1�c��6
�4h���C����?z���.<��?�p#���P�j����tiw���1m<�g-��S�ψ甩ֿ�sC�P�,���.{]��$ح�Ӟ��-P�C�ϸ�G��Ņ҅�'��g:c
IZly��O�#F�rM	����R5��4�p�H��Z�7�3��E�Ml���5�X���o�g���+�����q)�+6_j��Ү�R�>o8?�]IX��(���r�<f��zV�C�5ᐆK���r�+�n��-x%qNJ�'�D�OКJ^_]����3<���zisr���+�r*1�L�3�EQ�À�n��r�S\�������!�K$Ww��;e��L�v+�	Ms{_Q5�34o?�|��k$�2�U��[q�_~!�3�U��k˅�b�.��R�T�N��T�`z;�N�"����E��_�����k�t���
�]�ӲF���i�ג�FFT-�on+U~�֙�SIIm��W�d�g%P����^�AW*���T��J������\V9��kl5�Z�i��GM�Y������P�&��A�|���9�az��H���gRb�������w��X���bl�5]��Ew{�Lg磨8���)�y��l��OhT�_�ύR>�"���}�^Gsk���"Ϧ�׹�j�HD �ځ@�Ż/��2��>�m�Q�]Y�S���w����pck��3;vJj�⢌.x���2�-#IMhe���zApMyiO��Ϟ"�����7�*S��h�)�TO�����#y-9\('{MM%�<u�]���k��7'�,�s���h鲞��2lm=����S�G'1�N��b���ؓh�߱�C���&i�]�~)[W����Z��L�\E�F���D���B�n�$��|_��ޢ��rV9Y�k��M3^����<E�>��3!��ZQ
�أ�BK������ߥ+)�wVi�~90�لu�O�������w���%;$S�r�����c�>TeX_N|�
kW
S�޹��a�lcF��A�U�    �cQ���p�d�|?�<�W�#���ik��ɰ�B��hwo\��I{�e#�5�.�&��;��w����d�ǰ�}�����Ji�J����͎�%Ӝ9L�;i��W #��߅/�B�E�$��p�m��+*���������3�DI��X2�]�yD�-�_�f��s@%�(F���Qv����'��K����1��W`6{q�u��oOs�EC�;9��sO��ı�����	A,'�xm6כ�q�\g���f�3� �,�m_<sRL�m&��v��������[�jJ���%��L]�b�{$6��bi��M���S�ux�=BM��s��*c� ��s���04!g|t����lFg�$Quq�
���m�Zs�3�����I�y?2U�b��7a��!/��eV9���)����dF -�~m����NM���͢�-汆=�|؈�םh�X2���g�^��T��N�ܬ����LcMݒc���"w2���A@�'��h��/A��@����ߟ���:����w��q�yl��cg5��k�X�R��d�C���5��S#Wl���m�]�_>~ʶ�u�{O����_!w�Q�%���g+c���;�g�@s��4ː��Up'LUx��9���b�K���Y5M���!'{J�Z'��h��G�3������c|a����������<p�S��-�[��١N[qj_B@��\�L[>����KϚ����搆%�c7]��O���U�k(��ީ�w���APҽT\E�� ��$o���B�Mΐ��d�����rƔ8��vŉF]��g��`��h����{xL�lO�S�4$�xGR���g٠YU޳�v65��"�=�j�E?8l�O��"]n�5&	U\�)��Ku�ۧ1֐rq�O@xj�X�jhcKNQ�GtO�۷sٶ�J�G�l=C�x�<�/��N��З7�_\Ē�\tQ�;l�0�\t��Y�TF�r�|����m�p�>q-"1�P��h��=�F9۫
�mm�^�QnqfO��9��h��P��_�o����^/@j�Q�,@.F]*�j�KUL|�zMϣ�ი�=1F�w��w���v��Y��4�ƺm�Л�L�f[`,��-'2�j�S���g!Um���̴	Z���i[��Yq{�t�TN7��2�\��w<����L��>G[�*�#�i��<j����l�-�vJe�פdk�M�[L�q��j�(��e(C���Ѷ9oB��&x�p>򆨈�kL�	1eS�v�g���fa�:�6��������A��LS�χ��!#Q�q�M�1��4�� �<�-�7��9bqʧ7��i0Z`��ێ��Й��KTU�ta�4�����aj��I��b��𡎊a��a��0��?�5�d��O!����^?�V��wj9�3M��d9�6mE�EX�-�n��	E��O�7w&g�1�c�P.ߐ�L3�ֲ�i����)r|�,4�}��$*�Ω�����i�4��A����GQ%>أ���y+�p��e@��g������z�%=���<b���г�Z��yO���t�P�~
}��������By��p/=I9?��|	���P�Eʦ����l���s5���l���h���t���೷�C�b����UU��Ɖ��k!?,R]��F������9��g��d�h��=9�@�b>k� 
��~+a���8�����q���^P�]Q+��i�Ԟ!�:i�e�����K�%�r;u�h�D�ad��ͅ�Q�T�:�����3��͟�)��e��*�NE,��N�oU�}��^��K�_��֓�ԙ�R�{�1:Bp�7��Z�����a<�E1��x���@��K����y��Y%uY�{���aL�s��
.�diX�F��{D|��e�L��.H�Uv����U5�,S��1����*

�O�7����l�����P)Õ;��{�:��͢xR��3O�TQ����@ai��)m8�bl���c	*�	�	�e���=�gU�9!7&��)�s��"z?z	/tQ��8�A-��a�k��ZPe��EN�B��II�(8�>93j�����	�w �"D�%友�r��T���'A��j^/��>5��?i�q�̎< *0ڼэo�5���3�������ɚ .��E�EG�6(�M���ʄ5ÙV!e�}M@��՜�1�c(��؋)v���Y�>5��z��p�)8�9&�SkJI�=nZ���#$$�e��$��O���f�;cȔ�O�Ba����3���c�N��ˡo	�|i
/a��QLp���{sY|('^�WL�Z�a[M�K����|Q�����L(u�?�O<$���5�]�HC�c@�+Q@(�����"�׵N9[�6c���ܞ��z�����u^,U�D��.1���f�fl�L���ō���=CC���ꋲe;F��=܆��arWe��N����E)DX�L��H&�8�tJ��WW�Lm�	�Q�$/ ����&�ҩ���N��TNt��j�\�	ʍ����`��Us#�^����V�
<󖰑�N��E2�9~m����5_δ��:���C|�[Æ_~���#�֗�i-���#�e/:!(�ײL���E�|Fߑ0�2���&�&�G�������c�t�R��2w�l�g���P�d�t�K*5O��4��'�b����8�y@���T���76����9RF��aj���/���I�rr���J��j������Yd��
��c���#
�1x��ޭ v����k�Yyh�*'S~UݾV��Z�\G2����!|�d�g&6:�;�Y@��J]*����K駀B:��`l0q؛$(:�\JU�W��h75��O�-L�a��p��9!"��eR��j�A\��A��[Q���g�k�ʿ©�ksOF61�F�N�^EB�ǅ%���ʔ<Hcg$[���UN���PmCC��b�0N�e1{6`��3Ӹ��D]�FS�e�	�)��l�vm�<=�.���b:�	E 5�����"K%bg�i�B8�.d/�B�|d�q��O(�K��n�S-��j�m����M8�S6b+!��fp\�k������d3�"�8:����a(���*�h^�邍�A-Q�햆{��Hrm���J�`R� �d�W��~��H�m=���x?.�|���R�uA�}E��6α�$��2�b"����\��%���o����H�V9!��;���� �Mx[�IP�����瞅�̰���&����O�s�#zF(~�G�'QN��yW�����k�%�d���JV���鶂F�od���s����1c σ����nT�Vo����gY��V9Q���k��qK����k��۫�b�h� �G�k8���l��'�P/P��%R����`���gZ�Ҹ����4yh.�~�YFc �Ę1.���N�[Nv��zfC�HRRS MG��{�ˁ"�g���h>����`|-�T�|U������'H�9�г�gS%�M(�Q���]�3z+�����4rE�Ǻ^p3a�����s^F?�-J�Y�n�a�^���K���6O Y�;�� ��6�1��^��8ْs	���`���́��i�t譐�Y%�Y��`���39I��O�^~Tf���/(z���i�]��̢9BqęZN�����Qy��~�*�T����0��X��	��!��$�9����s�ߙb�
�+Zȵ�T\-Ǝ���<GＹ`� S9���W?M�m�Z�`�)��QUOB�γpUb����6"�|��lv:�V��&��y̖bo�?���B�b!3x�:l���[�]rq���D���!�M������⌾l�cXv��e\P�^m ����di�0�s'ko���Ry�<Q�n�����O�eL�I-F��;�~�	?� �D<������풂�(U���u���H"~?�W$�A��⹖��[�-���;mz�	����n�X�{pƗ��65{�m1�2���Gٔ1s��[13 �3;1�̙,z����3�:���ykN���:�K��|	(0�{���.����R�)���#��T��_u�54�4{�fln�E6�    �4�o2imr"��������#�!E�o�K�q�5��\b�B��ݥ¬Ԁ��A���zJ���C�|je���Wb�a8�Rv;a*W�_#I�|z*�8�.�y]Q%׵ғ�4C��3���/p�����S|�[���FO��`��`J$���F/��+D�g`�D/�֢~՛�m��y`;(�tΪ9z�e�#����3����=}v�lVl���}5�{[#���`r�%�4���2L$ҔU���P�k�u;$>�d��}Z�2@��k�iJ�7cR�����Ԭ��|��ź�c3�5�jO�ʪ�eCxg)��D�d�B��=ӾHˈ\���2��6N���'�o�0��$H��{@�[���#̔p�i�o��_�̰�i��6q&�'hK{��I�Z'���µ�>�O�2ғ4�:Ke����8睅u0�2�^R���m�l�?zm��@�a8�M�.m
6�%AŗaU���*^�34պ��\�g,�u+�2�d�oF��@#�hP<ƽ�39`���O��&N���=S�Μ���^c��m$(��kGȻ���e����ʊ�����
-�2ڋuNd�P��Rγ�u����=��� ҳ)� �"��&盐��Ǒ0z��5���FK���$̓��r�\m�
�c�-d��W�U؁7"6h�]�
��U����,���(6����m/R���kD�9��6�܈v:qM>�wJi�T)}u����q��glK�3L&lJ��d��a�a�X�8r쑒f9$���09�c�S�@/��N����y�r�ImOI6<�ľ�o��<�jߚ\"���SU"�eU⏬�DFJj�#ټ��c�2U�y���^
o�pT$��\p�?��8K���o}�)�_��-�R�*K������Hr�I̔%g'����[�
�+���:/ް��H<��/��H�xaL�$GP��H����q�V*)j]��Vk���]�-&���U�R͖G�юv"��$��Z>S�j�K����.�a�Eb�R ���lX �/��v{�#�
Y�&��z��ާH�b&E�J`�[��+j�O����:��i.ޞRG��6!q��E��H��ŦGF���B�/Wڹ�ZMm�s8��=:���s!��xژ�S\.���c�n�� ٥�p�4��wx�;�7Y#3Yg��;�Jվ��}����ڴj���I���'�;_`�9WT�j�3�ƈQ�/��Z����Q�[�_���>w�)�TF�{���2�]��N�-p:�bW�v�#�y5q��T������},--z4fn�\�@�ԷU�
�.�ң���`پ�#�$��^����O�,�5�	s���3M���o�M�<�R�[g6,
��'z��d�����iR�>��Q�"�;��StH�F�$R�tr���j&�̳WK$�[���������y'�|�ѵ+��ז���>�I�)V�/bIN�ӥ�S��C�v��"�V�� l�
�H���vE��Z�[Y���0Y'���L�I���?����_���V1�:���jnnD����jSآ�����Ȁ�����v��vhk�����������8����*/k[�+v�m[[zK��9AN�r�;�p�Ro4��'KF��.���gAJ�Iv�]���&X�����y���y~��:�6���g�LQ����>�l���l��L��Gu�Tz&��<��;�l�[O�srDÖ����#Z.�ń!��h1�������8�*�r5�D]�v�qg����:z����6�P6I�`���ड़�"�z��l�gڿ� ���Q���fkoeO�Ak��y4j�"� �d~�|.��i
�d�"�]�f���R��p��#�{>�����5<��!'X,�j_�IQ�t�[g���癿s���
��-COx����Mqr������%@lA�{�F�ż�����d���Jz@-�s�_���֝;�H�?D�C
:e<	����	�(	N��	��Of/��:i�)Z���j��#��g(v�<�/IUg�s��k�ǟ;׽V
��.�SH�\B�+Qr����}�d�=7����
�>$�}�]��`<�Ω�i8�� ,�pC	���K:mx��tC3��&�5(��i!�ś�Sҳ~$���C�3CQ{}� ����Ë���O��kQg�8��|�u�&6��D�!z�R"����w*.c��ْ�ǵ��������k��S�JER2z����;or����C��^����yg���9�Ʀr�2	�2�vdi2g	3K���ʪ?9�m�~�uRI��ߡ�zZh��%:ƻf�⚋������i���&L v�V0�R��,d��N���e��,(co�f8+��0��)1m��2�	�DG�7�d�H�%���Ҟn���΀-���z��]L��P/2����!�u�1TWx~����W�%�mo��S_��������z�[�V��(L�;DS��%����gNE�]N��[��
/����MEw��Ku��v��fH�NN�-Ӑd7��S*����:��\wb�n��<�*L��h_�4���̉�cL(����:�U%����-+�p�i�*m�?�
K�g
��>�$Dg�ŗ���L��fǴO��I%De�8 B.7��Ģ7	��5�����=���A�ҒF��nK#l�y�G��*x��\Y/���H7�	���q7)s�{_g{ՔN�I=}N[���N������m�v�6��3�8�xͼ���r�ӫ�a�;��h�=G����}
q8����ZGA2�w�E���[�l̍�@V�`��"���ꊼR����d��Π�͵���z�?C9���RC�w�;�r�����X����=H5��
�����F���A���7��VWy52,ww�+	\^�|�*AKf|W������箧�E^㸭���������iU�Pv���,�C��_�jv��¯m5�����q��H���Wق@�T�����Z�zp.R�Ǭ6w���ur��O�T�}�7K����S��Q�{Bx}W�H��wA�E�B�u�f�����o���rD��P%"��z��Ub����,��`�r���)�-�}����d��w6�D*�C%�J��/���L�����+0�&��P+�=��w!*�%%����./�LY��V���2��ODA,էK����.K�
�1D\ϓe!��j������b�M��bb@]�����~�-z�yߊ�D5��9���OI�nV�	�>����b���9�p�!��AUb�!�W��o珇Ψc��_�(oң4��򊄣'��g(��R����F��Y[��Μ��� �����j��<\����ۦ����'n�3�K��v����ðXb�����o�3z�2�ݛ�3H��J6�1.�a%�p��A'Z�a�����[C��%�q�d�� VW{XC���I���֛��Q�K��j₣��������rf.��{ �>'m�O��M�o=� JU������a���Y]K|���Ĵg~�A��a�RȜ�7��F`[�ע�gS��M��֕�s�͊�����[���|9r^Z�1���۞�_7B���~5��=�	ѓ�GXh���v�T�����,�h{^d3���և��5�������<P���[.��6=���䄾�Em���ȿ�������[8q��Nn�oPf�&��!�Y��ţC�VB-��3*k�j��F��L�K1qo��mpc�D#�}��w�PcL��2l-1& �@σ�EgQ�"����ߝ�l���
���-�E��(�}�L֍�[��j1��C�y�ԫ�B�U���	��� �,�u���d�����G�����x�V*=!x���7^%�?���V0�F�K�3���?D���ބ��b0Dt^�����n��א=�"Y�.��P)�+'�ɦ��h{�M�B��o���b����C���^'Y�rK�	�d�=:���T���rTYCX���=nk@���r���8]ԝy@��2�hCwXú���	�S��<Y�~j`��DY׸LNf���E�6��C�=uqJ|�G�Dr�([=    �|�l�P�uNH*C�~&
16r�M��a0�&�إ��v9���k}��W�#�Lh�}��7N�(��1ce�6�۪|��;Rm���W��W��U�p>��h���6ێ��2�Q ԡ�F,�P�,{�
�����ZKl͗/���Jd�K{0��SL�jcu=Bv|\lt�6'��(x>���1Em^tD�5��y�#��٫�#2�z��.�z��@f�a�f�W���y盽"|����mKH�r�R~i�sz��-��x��v��3XW�����,rA-mw��쾿���GQ��T��0��	mFN�EH���`oY�	���,��e'���گʵ��hq�vs�Ӧ�]�������`G��yo��6����-�6��}�[R�H�k�U�3�Bː�hH�޿��DD&H�L�%�g@Nwuٖd�HD��[�bp*q1�O6O�uFX1q���\譓x
�eQm���Ɛu�5���4G%�����UXH�fuPU���ߝY��
�eI��6峻�_�!��{Gi�H�~Ǔ�U����O�̎b�g왕�I�vwM�Y	Qw�#5_'O�
�{à�]z�_���f��I��%�yO��}��]��,�4�,���tI�"��8�"��2�P;I����Z5��/���S��BNf��^��>[I/���qF�U�-"���0`ٲNwv6�7������<�R�q���;��܃-U?Y>�H0e�p�u��s�8�U����Ōgi!���䏫x�oT���5{f|�ߐ���7��:�-6��l��+$`�o-�C�9���h��N?�LQ�jJ ��x��|:��,B}�w��L:��i���gk퇐	}(����b�F���Xz��%w0��U��&�'Ǿ�fc5G=g;`���L98b�]�)�Zb��~�}<�7{����׳[o2ܣ7��Z�O�f�}�Ñew�xi�X��ʓ�$_|	9�=�U���(�G"�P�m����VfZ�U�e�`��yڷ�,휸�� @����-BQ������d�q�F�+zF�L��@�^�x� )�N9��`8��VVsh�v�|��o%O�̼%��Z���y�]S\�=͌���о��<���ԥG����o���Ujg$7T�:0��ZUu�
����9���w|C��s�f{�s�Q���KT���-���5�ߪ ���=�Ӽq��jL8޹�����$w£� ��6I���Rd ���	�*�yR=�^�z֡M�1��p��ƽ���v��p�&y��m� (�Є��f|4�"b�7�+���ل^�(�/h��}�x�*Z
��b^���J}��_��w�dv���-�Ê!��6=ոos����ݻ���c�P�h6��w�������aqo<���I� �]myl_K�LlU����,�����j��iv����=5������OC�iaz�=@�$KFI9�HD<G�콣�����$�{��P�c,�G<:���{{7��)��("BfY�R|]��&wT�v���z���F<�|��+��A��^�*G��뻳���E^�X}�k->l�Uf�8��p���M�o衄|�i)j�/Y֞fyQ�>@Z�#��w���N؅b~A��me�t>�����|��<�-��*�j�g���'��Z��F���}�C��*A�W������&0���]��Zc,_�B���b�R9}ڼ�U�H^��q`��*я�3�C�P� %:m�37��Z�!�rW�B��U�rO�Rg�_�n [C�;>��hOH�[����Kg"<4|�.D�p�T�5��Ӽ"/��P��ǧ�?���,Fݲ��h�׺����rE���B�R�i勬����i����;v��(�;���#��LT�*��v�!7w��HS4�3xjxT3��dp���B�2�bV�y�j�l���-�ޟ_Y���s4�V|_���)z���H8�-���U���&E����r|����e�L�i\��RQ�P�$�(�N� ���L�kw�>
����v���t]V�U@"���p�I�9���-����4����������iv�R��2�/�@C��O�����Y?�/H�8�ƺ]x%,��<&�;	�wZ|�A$Z*��Ӈ }2�g�!��)*q��� �@4�xe��lظ����Q�rD)Cx�&$@)���=�$}��T��"��s�X�4e$V��U�P^G���F���?�utĹS)�@�u�NP�T��xb�`�v'�OJ���4���o�&|��Ǹ;���4OʲlVC�G7��}��Y{oCoS}ȵ�#�"�3�Y���(���<�n���D%�UHI(]JՑs5��?؟-�ji�5���rwMP�+��Cb�����N��e���&{N��R�D�[J���j-���'���hG��'�:5�C�p���#��|�@����d��Ll���,���8s2h��8"M�m������+/����V`(d'[h(��D���%4���[�P#�7��3zc��~���\Gwq��Y�w�p�u���X� ^E�"��g���Ed�⬊��3
/�lE�����Sgu�I���T�g�D�@�3�� _��sH�J	_,�4��`��a�M�Ε{���v=hzs7m4Ymh�L���ʭ(%۳�nXt��l�/�k�*�D+M1���i~Od�?��d��n�[x;Ǽ;>�3�8��~�|N��N�h@�("�c���vW���h��]�e�C��=\zo�yGtsi�\H��Y���pِ��uS>���4��9�5z&��u�RfH���@<�h�[���cDV�$uc�84�{`j%�@�Z
��:{&)2�א��W���
������ˢ�b�wj}�_#�؁w���h��Dm�!<m�;Rҏ�� >��\&��뗄 �-7t�L��Ȯ<#,t��'(��݃��^����O��8�(K�UA<�e�,W�1`�>Ӄ��g~w���n�r�S|�v��}��S�ts�,��1?9�8�����ak#>�!�8�3$'�#�V�]����|�m0�5N?�DX�U�Վ{bƪG=n�{�hwa?
�	߸6W	�T�|YY�8ݶ�[,i!���Q�CwC�$Ni�O�@1Jl>X&�򧯐>�e&����æ!��5��-w�������[�.�¨����A8��d��=�W��}v+�C�!j'��
��BS�DN�ύ�^�j��i�lW�C�*��I�4�y8Ү�Ʃ4ܛ�V �2��Ӌ������?@muh~�C-ΞW�:�-��rD��N�M��!@o7�uh�w�9J	pQ�Be��9����f�? ֐�G�2�&}KŠ�%A^�n߲�/Z}q��/*
�1�:�h�wnќ����רݳ>�҃���-
�y�� =h���Í+L 0�ux�i?���Y�#����u�iɗ�Ov̭�4� Y�U�A��'����$gE-fdgm�r�&��O��Sӗ�4�䋺�MԚ�cT�t�q��d+�\��/�#�$.��ԯ0yM׫�0VB�?/\���O�n�:!5p k�|��Z���T�S{7p��1�ㄏv��Y��*z�y�^Jed:ڴ�~�᷂։�CI��|��Q�Iv���B�cJ�c!�f%����t���+��+�9�4�x�ޝ$������%�,�� �x|qa�a���JM�ӡ>�?�Nsӽ$B�?�P��o�~m_	�4�H�"d�w3��ٲ�#PuԚc�Vy-�ޝY�z�<t]�JA��p�ۺ�%��6�}\�_ۊ5֡��XtW������i����i놼�P��Cp��n��T���<n���v$*�з!�dh���_mN*yj��4�k���|�g��i��_��C��A�.��6���
�C�%X:�^{��:�Ky��d�����{q��܍��d:��{�T�Z�d/�Z'o��tvu�@ȗ֘8*F�O4�;�i�j̆�q�T|
�@Ǐ���̵"�n(����f[�F���DҾF����z�I�ä�f�@5�T÷8�}�?q�H���:X�(g��_���    ���B������r�7ER����C�AѺ�w�<��8�u��\��֢�2�]+@��8����b��i�ZT%Ak��F;��Ζ��j�t�yM_N�B1��ǅ�c�o�"7�S9b<�ل���:w//ۆ.�u��l�FzB�P���K���3&z^=C�FO�,�$p���Nޱ�j�b��E��4��p��4�4���s�)�~��b�m�q�e�ߠ����+�?�����?Oe�|-/��~o��#2�#x 6H?��*�~${f?��,f�rؑV;��K��hՁ��:�g(J�-M��;zqm�e<���i`�}ޑ>CM���h��z�h�^�#��p�zA_W.��g͠L�0\��?�pwd]�Q({����q�'|���$v�@��O̕Z���-��툶]	�������BL���Њ,c�J6Ǡ��|\W9:�u�ٸ?�?ª@���¢�W}����&�Q�J�8�=�'GU��R_���c���t<�I(��d�DիLMFY��K��\�����&��ڝv������=R/�$�]g�7��H�d�\1�Z�\I��
Qg�5��K=Q�&K���h�A��[���������P�\�^h;JH�M^Ϟ��!c���,�A�5ov��5w&�.�Bv��^��� ��dˏlÌ�.®����{º�sV�J	����2�I�K��ڎ�������hQ�s/��@��L�ݙ��XZ71H��'�\g��g
�`��=�g�v�����je��T��a��|�Y�B/5X��v��Dј�����ST���(D�K�lܔ^~uWq����d��sn{Z{,VF��}ИuĿ'�t�f}.�Uw�e��W�D_[�fZ}i�z��ë �U��zƝ�y�Qx���m���ہl�����k��G��suC�3v���'���T��z���?Qs�
���wj;���0z��D|2�'u�����M�����`BUT&Q�#P��i��w��"��$��1�CK���-��'�[ˢ����ch|���?��0T����ڵ`�D?I�d谵�ȗ��rÀ�_����h%F �y�(x��u�B@^�u�A:�STJMhQ���t0���@�Ut�K�gBN3�8��ci��n�t�;*�p|CTg4�yN�&��$��w��z�g�|RW��͛�����[��Ca�PU��ԯ|�z]gɎ,(
����M-���i8�7-
qG{w�޾(���pcMǣ.�x��Z��������ڇ�vb*���NA��/���9��w12�˝i@��7�6�UًO>�3a2r�>y6`LF7|*�^��v���a�I���_��vN�����\����L���aD�p�~JP�����O�5d��CʑT�K�ߍf]g�I��쓚^�-�7���q|-
�>�/�{�tI�פ(K�#�5����噽Kjt.���h���i}�������w�������eBʉ����S��ӌ�/�_pU�����u����C�D�!�
���bJ�Ґ� �NۆNJ��-\�
um��Jl��A����gs6<��,gW�zt(�ÇpϽJ�N��:4���m��s�(��Q���������F*9��p����\ٮ�A�Q�6
{H�xu*����@|�|.�D��%������7E-.Oco
����na�-��6�ȥLr��s���I���)�K���frb���OM�|"��ښZ.��F��x��7��U�j��s�0�}�;���E>O7$�wv�Y�w���|�S*!Ք���Z}ESw�������q�B�J��l]�Ԕv��U@��\CCo�A����Y�s�_�uN*r/H��u��x�<���k�V�|M�ݎ�����_���t|���5Η���/��q�k��vQ�������`�j(�����'�!�>
I�)��{_"��u�^���<���"����n1υ�*��aU%�Piv�����(A	����ʑ聼�'��9�p�l�B'o�W� 08'� .���	t/ܳ(1��Ci� �)�",��$�{~|	�x����o�������q��+�����|Iΐ[Yŭ\@ !��t1�������&���Za���o���ރZ�ksg�/�����n�CǪ����
�:���N
%���Ν��
跏O�'զ��y�~����î�p�4�B���##����:����/�$�CG���Η����U��L�&�[9�*�\y�8C��Ri#cBlne�Z$)��m��D���㌠�'��&��Y�.��a9�~�8϶�
���)���71Eu��)�%�h�����Ge��1V�7�P�߰��C���m�gkq�s�xA��.�y�j�*��`ϒI҂�"O��G�ro�@��P^�\����t�Wy��!>#m�(l�.�a`�<�Y��P)ik�5Z;��6=c��2�6{ƽ�m�,�c,���pz�R�W�<\�I�l�x��c[9��V�@�[R��&���w�#�[S�[�Y+C��$ݠl =�=C�O,|�t�4M�����&{�cu4:�u����5�Iro����~7�@���nަ/�h�N<�i�qO��#�4/Ⱦ��~�}!�eA����7��i	a6j�eb���>��l��ѻ���'��w�)��i<�6������n� 2Ǜ�-�mʣ!{[����Nm	]�;B������t݃�x�-V���u�����)�6.����f��:?��8z�]R������˝?�5�9?0�/�4���`b�/�x�Y-_�_\�I���a��1��\����7�I�������¯�!�Dd��g�q����S�ĳ8���]����Լ@����?H{�:����j[�L���:�������~�|�>�VsT́�7ݜ��KE5�3�m��xo^<��OBLy�~OgӰZ	�8S?��p���8d]wtݪ~���㟩�]gO�8Ɵ�2�|������E��U)忡�Ѽ���^�=�6|�P�M�r�XB�R��c��0�F�-� 1#�u_��d�H?�J��l��X��Q�F�O`�o:~u�̚Y���vˣ�؊��I��vLÒF��G�z�@�ܗ ���|E��t���J$�z��32�����N�#j^�]��a+�pX.(��)�ɢ����چ�����{��۔Dkӂ}���awl��p�a���x�;���r�}�Q��	��E�,��JV�0�RU��r]բ���k�.|�qߖ�R:U6HW�%���_�������i���|�}�^�޴�sѷ���~ӣ}kx��B���n��OAH8z����O�[.e����0_/3)��,��n��Vu�~*�N�\�^z�]kC?Knt��W��#���c���W{��B���s�R5y���6�@ɯy�5�!��[h���.��N\-�iDf�!.VY��}�pcV����+��� ��q�Ty�]|��Ǐ�S��^�O����꽐�F�8�A�����O�b�!'9|<�j܉�?{V��-O����ci��`��(6䲑��97O%P>�a�����\�Ɩ�*C�H���9���*��{t6{��@5
�
b+^��0G�QB�(1,"�/ggo�P�]|��bZ6�M�p��~���-e���)I)b��������1��l?Hn5'�xxQ��#\4n�Be��p)>�%(�3��/A�W{��c��b�l�|�g
C
�'?EY��,���3x�W�}/>�\����,lo�-��8�ڜ�2�	�z���6%G�X�Yd��I%su�Q��.t��L�Ѿ5��l��ȳ��tݢ]�� [���)�8�,J��L����#�D!�������.M�^+�^c����'7HZ��%�V	�_x�!�j��<��L슋���ӗ�!KQ�E�Icm��_��9�E�؜r��]�^Vs�ߘ�w�>g�똎����oh�@$m%��-�] +դd2d,��2%�y�� {j]k�׋}ƅ
{ȱ��.��ڌbﯚ�#���Z�6dpݰ&K�    ���������S�v(į0ޖu~r����0����LV���f��7H%\S'pąs�N5�;��7EI2L>pV�<g�����x�6��pT]F{ͦ�Bň)�`2���a��[��Մ��2h4�0��e>2����\z�)U�T�M
�/�"C��䏳��*�������;q8e�p�M��>`e���_��j���b�f�?8�����2��W��o�	�nW��tuO�㳟���������^e�h����:x!���nH&A���ղ���뛫����vgr���reQ�0b����(%$].�k��X���3s�߯]�#&���h�q���:
�C�C���T�cZ���A�ʳ%3őD�)ۏW4NT8�Lo\��5t�S�p����E��Xk�9E \L�Us��s�,�5{���L��\����ZX��H�#�&��tewe�	(<�2�o��:b~o?��������j��(����<}c�7�j�V��	z��d�QX�����ƨ�Z;�e�����HE�'I.�\Q���(��L!7m`��R'����Q�r�m	 �$ļҬE�����I��H�m�)��i���w�����w"�����=����!�H'���ϰ�]�%��z��� �
t�h�y�I}�g�W��q�������Y���݅}$��h6�{�0���fL�9�G,D'��-�,����"���Q���԰<�
�$�M�(�����,q�8`�q4�N`\*!qI�0*#���-����/�o!a<!���ͅ���~.ޓ�
#���!���q4�����lJ"Þ�k ��ME��J���- �@�K[%[�'��c5��w��Y }3'��E I>��'�k��x�
�Ph�ηT��V벗,�>=���t�`�?��#˓��d��ܧ ��5͌z �i�3l^��<ʊ([��K��Pl�R�� v�T�������g��}�aDB�R�,�&}���Tx-L��j�h ih6�/�pT�aE��0	���'������3�e��L������&<ȇr�^����79���2߰^�������i�4|"q��I���>��gN�u�3�������C��xp{�t;p�`>n�0��"8D�ug����������ut��
�g���ڎ���8��X�ش3�𩰶����P|Y��M��v��3�Ó#6���D%�6�����U�+���?C1Ơ��$}F5(�-n^�g�"	�݆�7�`ſK��O�sv���Vi���H��#|�V�X�2���{;|�����~ӂ7�ﵐuQ��^E�[�L�uiH�J9�������_~Q���_aә�X̧�'�*�#����M|��&̅'���|�B�A=Q	��&<b�R���i�
R�X�n���v�{x�������x��5Tw�����[ŬQJI�ͼm8��{>��J�W��ˤ�ȟfQ�B�|�Ҵ�P���j�YT=|I���Ŵ�j���l
/rާ�4�y��E&�!�]@ឦ�w��#<�m�YB�o�pk(�2,��}W�Rx�����< y�G���[��iV��z��]ꅥ��&��$�So�o��s_��=g�Ѩ3`�o�
�������?Z0����~���@|R��p�p�@WtJW�@�v���qFPIb�M�_H땳4�I=P3��ʀ�<7����������	\���D�ҵi�3n�#t6��C�`�s0�,�����4�0��'�7�m�C�i� �WnC�y+�'ܭ���v��-e��5���-�`'֚�d�l!2ܯ� :H{˦X�R��#c+�]�a�Մ��8���Zk�Z:R��C��4_#�z)�_��,��oR�v	���Tر]G��5����N+�(&��-h������p]sJ�5��8���2��ny��ꤟ�����uF�hL8����r��=��9^^7���NsT�0��[�-���B���a�Gc�h�u�|���b����I��]���=
�B��_H�b+��o\0��lh�fm�7A�w���R���+g$pV](ۤŢ �R,�d�$����X��d�l/s����x*.�Ňۗv��/����V�(6]g�|I�um��;�R��?��A
Lz��A{�N�͕�t�@�L�1��"L��ʋ����er-co	^���u��%`�ݬK�:]���E*��Ն��9%������6շ.݉����syA�|��hrL�݁���G(��~kU�Ih�»�ل�j�?r��=�ឰգ��sGx���J��V�ML̶�u�n�c�q7��l�H�	�+�/�h�C��v� ))7�?�_v+�\��H��ݓ����?�����|D��a��lO�)JBq���W"^� 1�3����!�����L8���j~���:1b[�jC�4
K�$ e)���E���͖/y�`�9������n���_���<��[� �sO�R�O��o�`��8)Å}g{+[)G'r��Y�q�H�*Z,�u��n`����*�:cx��x�z�Y��F�<GQbJt(��7l��EW���:��j��P%��v�I]���s�x\��{�k�p�!P`�wW8G����X���Lb�qs���릆j����j��kQ�Ә�?��O>��G+IU�PJ�j�)�������T6f������.�虔�0�"H�����e�d*|a'�F<`b1�?y��i�2�~�Qdb��2ko�4]��v��Ч¬�j�j����ߋf?�X4��������zY�̄l#��&�i�i�`�ʾ�q���=c��j��1N���42G�pw�})��HDݥ�Zo��po���=�l��Fp./�q�k>����톬�$�*��i,�%���t�0�$�t�:[/��~�饰��埑~<�r�Մ�Ң���L�qO�#*uR��ҕ.�_-/����d��:"-��%r=������FyX11��s8��C�W�(�P!�l׀��;y��؏�f������w�Q�F�����'�T�kb��OÝ��0yI%��C���*1�K6N�ي4��A*����pK����1=�,���3��Kz����#\��O?ǀ����*��s1�@��*��'�G�["w����
!�<_Vn�K�<��g4h���<�qL�l[cȪ�F޺D/�Ԭ�� Q�RZ��!����U§Օ�+U|�q��X��PS���|�l��Qa�ĔN���u�.��P�7��:��Է�-�V��T�`�	�����(�N-�RG�!8X�R�QO�.y�?����/�x��䔣[�a�d���?@���4��͝�=�f���۝Q�磊KM�L.F�i��N�ԤA4&�cA�,��RA������D㪃v �R HhH�9\�%j�\�\>�b��'��l_�������Y/
wZz�a������w���(�&n�a��d֊�8*9�k��E�����((4ݣ��LF5���ÏK�.����ouDP�����d�Z��l��W�^�9J��ʔS;����lN~'�����A_�.��ӯM�<�F���;Z{� o����q�]�����VA:]���Zq�np��_-SZi1�z�D=�vb�D���Y͍��Y���i�����<Y"|��&mq����)<;r�x��b�ۙ47ܞւ�u0�Ϧ��Ue�q|v����Q����F��F�)�-1����]ۭ�'on�}m�HDĲ~oF{N�����Y;ݐ��qÓ��`�#�J��O�v��V�C\C���q�:����}�����2�yg�a�����]9�G
�?b��i}�p
h%q�@�B׻���ZO���2j?��2{�Z",
�4F���� I�Y1n��5]����.�O�<�'0���w�G�!Z��Bp���No����+��#�d�����u���(yMO��uLݶj���fS{�ь�{څpB�#�ו��VK�KD\��VR�3�����4��oXeȩ���~��6����4���XhzQ�i4{+�A����z����{u�pW�4x�'�� L�    �Ȝ�$��l%�Q��5B�������xq����A)������Q�H�S�O���b�A�b��v�(3>($ƫF[�1�F���z<1�*�z"�E���w|U�j��igD��]���������O+Ҟ��yF�u߬��hx�=H��G֟E��qLdq�Fޔ��G�EA�J>r�8���nY�
Ɔ��ș�qq�	���B Lu��bD�]џ��O�Dҍsp�����r���ĘZ��oS(��u�jC��^gIK��;2�Ӌ:�S�vF�N#�����Ƈ�\Uֆ(�YAO�8]H�ْ�t:��m��^�X'��o�T�'WrI�%+���q��Nn�,`nZ�w[��K�иV�	c�C��v��,"[�Y;����<���+�7U��c9��I]Ӄ�3}BU��@xR�3��s��R�COڽ��U���D�I)���tH���삶��n�G���U3@}�=Ɵ�Ǘ"����6�����R�B�ߒV������*_�����u�c6��Jr��>yd������W��t����E�>j�1����:ɦ�S��>M��T)y\E�]Mjg�O6�t��[e!��Բ��U�}�0E��N� ��I�|%/�s� �q���*�Q��X��bY����G��I��
;+�g�>,�q�N�����4k��=��A��A�r�a��u��j���[��7m�K�zH��h-gB������@ma������yV�{�8_~�k6��t�r� D�6�	"��4�um�ϯ6򁮵�Vb���#��V�OI�TXl��ҩ��!�C-AWW)����Ym��S%���`�È5��Y������>��c�%puB���,r����M����JX"��S�6C�k�5=g�e;W�����x�T��?�ǽ����^�p��d��M�m��$ݷ��n�QÛ�p�u���h��4>��ؐ�Pq��u�g5�;U^Ǝ�z�&i	�hA�zb���?ɝ\�VGSt�8ӕ�4����5�I|Ľ�g�N
��PX��t���l	_'�����%�i`��'�WT�N*�<�V���G�h��U��1�������-��ڪB������ǅw@��}z�~Ϸ�+��A��8��Q'f=tU�+m�ʳC.�8��M^��ɀ&�ټY��F�ǺbtL��(�a�Fhn�.�,}���J����L®W8����EV�3
��B
󾘩A� �j���2Y�@�Gh��{���Q7�Z�x�O5
�s�N����	
�y�Zc�j�&q�&�
N	�a]1p&�N�B0���a�ԣLJ4=8���_��/,���{B��'H�؎~��p�~��X��ҽ=>4?UR�n$;���Ț��Q"�TTǶ�s���_/&���N���GU�p����jR��)\I{�3T4�F�Q���?�4�^$op�J��n���l�m�wq��7��[�g؇��:��}�U�6��[�D&�J���~>�F���ހ�ၷ4�SY6�Gc��ν��n�sZC����"%埶�v�L͵����v���?�`Щ""�^RÓ�ɟ$c�d�GZ\�%�~�2_��p�z�Ԇ���n���`���8B�A�c��<'�0�ڧ�ny(+P�_���Hp/��B��	3'0�k�{\-~�8�nzh��~��$kR�����y�l���e��p����=Y�CN:A��aÃ���Q;8l��g����M�?���#��ĝ��K�A�rC B�n�g-+g�����r�<��h@,����.�9��1Fa`�@���O�:i��j�,9�&�������9H'p��+��@�;�(,<�{cx${0�@�kDmZ��R���1$��z�[7�B����p�W��6�(���G��޸Kv%Jb��%�c�'���M���ȫ<��߷�W)����%�?[\N�3bR(P�*�
��q�x�q���|� ��AgO��0T��R�چr�z��B�1����/��z ����*�~x�{�6����K�z���a���ǐ>����S�(y�'J���{�ݓak��c�Cr����:��#{�Q������y0A4��a"G���B$��S�AX�zYtIB&���u�LVr)����'7Yd
�f�K��/�M� �j��(@��/PXr��_s�w5o��}m�&մ6NhB�J�%$��F�#�t�p�7�|3rH6ɺ�H{��u����A��}���<�S�q<�T� q��$��%D���u&�����!b��s:#WG���o,��3|�OD	��8D���;�V���qї�ΘihƐˍ	���~�<�Z�h��ey4��|���j��I2��_��%XI{&����x�uϒῄ���6K��	ݗ)�Tj��Ş���'0T����<�+`���CiS�u�G<hF��ZF{��ε���	�Rr�Ҩ��C8gl��348�бް�߻��3�p�|<��2�{����O��?�K}����o�!s޵���}��x4�� �ɟ��H�q$�4��-H�r�H(�����nߠ��J�n����w�A=�H�mE�����q�T$�佨�j�GP
�Tz��EuI�zJ��t���!���zD�CR)=�6�x�W�?�X��%�I��.뢜$�AϋDj�����a
�#)��,S���EaS��5�)s�V�|:�N}`=�pf#��e9�x��68%/q��%Jݠ��7B�,�Y�D�8�@��ߪ������Ӧ��T�@��|�{�)�H%
'���K(7Yt9�'�C���#5젯2ھ6��X�>qV�m$ޤ+����3ɚ�'p�&Ag�����?s�?=8APO���$�"O�A;L'�0h�O�*�m��?x������s'�yj� VP�7��([�&r�@����w�^���j����B$1�&�ۓ�szqn��s
N���z� ���:@�C�:����+�#�eo!ǟ>�׺��;Y��$�Y�����6�I'
G]����Z;[��!�hڷBX�����Y��@�%�e"/�!�.�S����^k���h[�(�wFlЉ��Ji����SCM�o'+6]	-&Ɨ6V�p�������J.��Y���������G��h���!�o98��c��RҺE˄c��<
܅|�q�B/�����z<�Ɔ���v�l��%-�Z�1��Y� ���7� �WܚX���nl�]��3DS��!�
��8����Fa�݋w��&�����E����ޙ�uFړ�w����v�����{������_�T0(o���{?�W����6���BOyq�f�{��<���m�C��j*�\�o�����E��d�$ζy\j�T�c�שa�Y�ϺB�}�<g�R���u�}�bZY�IԘ4k��;�q�c][u����ҫ�%O�J�+QT�x�W�T��@�W>QC���9�mp�)Z�j�«�tK��q���J��?⢔j����?����$ɞ�W��m	�Eʸ���-����\�<�a�����! F�9�a�W��mKk�V�fS1�jS��|����y
����)��9���2�|�}�וb/l[・pD4<R
���K+��0!%V����q�(~�/�P���#��ÑkYy���q��ki�����K-�ٮF�c�8T�S��H���d��`��C�����	�"z��u<rL�P1�=fms���Fޤ�N��Dls��|)�]��C��|ˤ�P���ߖYo<����Z���;4�=TT{|"a׵��\gH1���0$G��Q[S���m�~������a'�[�{*nL]P�{~�4O}6�0�U�eP��p}&�P�X~����vt��;L�/����@O-�My�t��:]�z�+h�����K4;�mfHz�P� ��~��f���R��(��_<ض��#g4uH�ڔGC�O��R�^^�&�Ui��w����O�dLj:��~�Y�+ˬ�\�mK{�)��l����Ɉ|���Ħ+����$�E*�%�^�r�ݚ��M=v�!��x?�    �	K�`ӕ�e�¸3 `�Ww���u��GNY�QT���G�qe��$���[^1!�C�v"��-��kϸ\ӨW465��ֆ�ҁB]zӲ�l�gѬ��l�,e�(W�*���<��E���&�G���~8ިWjm�9إ�x<}31H[㇊?0� ԐC(Qp P�ޘ� ��3h�)�R<_����W����C
�	�ӻ�O.|���bT�m?�ra�&�}[�7x2b���D�K�6�~��'Ф(R�P����=o�w/%�&	����1ơ��$}]A�Id�y�"�}욕0�U��'���Q����v?F��Y4��?�.a��԰MQi����/i�H�JϺkh�9��S�Q.�npZ�2%̆���"n������k��f-t�cnj#>�����<|�|2rF��BP��c�Z�9�ߵ~�>V���
ҵO��{�t���wq롏�-�����q&ɍ{�9�xD[մ��G��0,fhN�|yY��n�F����6V4�h��1ۏbq�� }��(�ᔣ3J�Q�[�����s�~��h���+�4�=��%V�j^
O�6��*������g�7��h�Q�"~��B�Np7p�z-V����[J�c������3�!D��6�0�X����sǹ��it���x2������:��8�����ڙ�~���j����^f�X�M����&��I�t�l�����R��M�9T�V�	Dؖa7�	��W;�SNxM�cs��j��,f�7� MIGCQ�l3�NDÄ������:���h{��'?�o���#��7�Q��w3J��	���`��'�����T�[���h�1E�*�/oXя�|�1jNq߷�|R4�맿Ra
T��#F�Գ nn��]�Ȼ�Q�X��� ���uk�$jxү|ǁ�,(�4�S��z ��>K##&����oɻ�:��̯^Q�Ai.�`�r��S#�k�k�}fp�o�������������!e]��lG�A7%tk�k>O��ղ67�6J�e��Wa�&	+°	�.����K��:��.!��VL�� G�䈳]�o;�	|%V�^#�j��3bC!����(+��P{p�.��k�A�I�JN���7��/t:,��$��c�tI���	����������KY�.?2�S�9`��E��/��Iρ����w|u����5k�x�&��{t�P��PD?y���$Y�@[_CG�,אW�@�����#гˡ����#��o�]1>�zZ������w�#g�>|�i��������uZ����v�d���j����OO���	1GhQ��:;7��]o�����蚀]��L�@N�P{ֲ�Z�/ڔA��G�g��e�I9[��w��n���7/ܞ�;�xy1zq8l�cx��b�L
�:�h5>����Y�2���T��G�BN��"%����fO���S�.��O(]|眚�R�Y���t|+;=G5�%�*�yA��k�TwL�ZTw'0�66� ^�ngԅ�����T�~}X+��,˷d!
hB����g�Z�:�7�1�v�pDr��qI�����U-vSB֗bw|ÿJ%)�A����.M"�f�����*E�>-RI/�&�)tx�{?@���p��������'�+!+ʪE��)�7����%9���v�^P���Lu�?�4`�W	v�=$�X��o���xSm�#��3��}v;n�i�M��/D���j���z����i�7�)��T�a��xvW�s�1�Gg)�����#�7ɨ6�1�ke�FG<�b,gp��#�*�5�Zܧ��@���l㋤ﬡ�e�<е"�F(��
l!J��@53:�Һ���M�Q���j�6�hWtC�D1����T�')���-���{�3�;T�:�����L{, �5��狧tM�ai�P �����$��j|`j�H�8봑�ʠ�lqm�>���Y�T���+Ri�МfK����w{����Դ�kt�-~�)��p�i���f&�������s�2��47����m8Ᏻ&�����:p����A��s�Qm������AfC�H�_%7��8J���;o��Gx/;���H�я�%��}����sH��{�4撢��+B�c�镘;��h�vG�*�,(�qΈ�����v������&쁧�fHB�$�Ea�O�Qü���T���O��!��]�!��0����4��p��v_���I��}}s�"�B���=C�)�%�Ve�#;#ގw���D��0da��]R�3:6�%������fs�_,k۶�Z5�=����n^��Lj(����B�.�U�OM=������킈a�m����M�H9Mֻ����Y�#�֑o�S���Z!y/�J�A��X!�%,�x|U�8�����1t�J�E�-��O~���ԭ��n�05t���ͦHq��M�#k�I�Ƴ-t��E��-��"��L��9��}u��nH㑅-H>�d�Y��9�b؏�mސ,*:n���osCv��m:�s�l򲞉M��>��vLFLd�����H��ݓv�W�E>m�pL�R����K��K(�	��@�
�҃h�#p�� ���C�W2~�$s�@��Qv���o/A����+�6���� îW5<��#��t��˛:邖�T�C�+�x������λ/z�O�,���<5/,���C\���g|Z}�n`*zzp�}1F���:�+Z\������ע�㈔ ��x
����@�
���JN�;dm*s<�u���k�*�@�SE�A�^�N^
�S�V�P
����߰�����ʟ�.�N�����a�29�̡���	 �n%��� 39��R�!6�������b�;�#����e������y	�fi�%�ľ
���쓀��oS{wCF�b��B��=�s)�ydu7�"y%l����1nӗt]kr�C�%������x{0��:�TlA��<&�+��6�Z3�&��ƷS>�5d�~�3zR6�>9����S�=�^�	��� '�G��r?�wIAw4��� �q4�w�%���jGe���I�7��*�4	Q-�K85�S�.or�](ʉL��/�*���!���]�-����J̧��M&L�S��np�I���=F*#�=0�B�8�|��r�Ӝ�б���X�א�wͫ-e|mZ�F�͆h6��j���v����7�F~$�b;����3N?�Zuz�9p�� L���ð\����F�����9[
[��,W�kM"�#�}ȶ��?�6���d��!:�O�p��{#�l��AN��3&\$%Y���Ѫ�)�������F߻��`hHz'FY�z��1٬;LǕ&����J1�!$���EEe�?��ݷu�N��Ϣ�(��c�:�=���V�"�+L�D+5��6NK��5+<��pd���[�ͬay׋�N�3�9k? �g}&1^ G�5�|�nhvC؃|�{5�Y�/�9�!��< �_kP��G`k�N=� �!F��r�p)���B�_Ӑ̓�`��u�D-������7�eE���0�C���߇�h|�Gt;��v�T������W�|�Q�d䉀V+�k�׋70�w�e��Y+M�Qيե�^ey��aی�&Br^y�
���g��<�|Ƿ�a�� <)��w��bٷ��	���'h��&�R�wi����n{��2}2D��s���|���
�`Q���W -�W�g�jk�/���Fz��pt�=��3������l;]C�G��ō��+�-���lBV���X��]��k�C�6�1@��B͐�wl0��	G��A�@�W���cKhJV/?��+ �e�g�N���+s�4��E�����%����Q�Yz����?L5k'�+A"������u�(�ܚs�����65�렽��v��QFYЎ���p�iNJ5.��u�@�s������","G����h
�XP��Y�F��ˊ;ؚ���Fۆh���|��٪b�m�4�/�i�:�'肢})�g�#��A��#Y�t�}�i�&��Q���ҼM��k=ٮϦa]R�1)}Y�W"�C=��[��R��1�    '��(4�	��V�z�^=���nl�=�qe��� <+�[������?h��/S�[}�1��Y�X�Ge��o6���l��0�i�m7T�I��:���%�	cOu���s?�|�V����Fye���EV)�8�x��ݙF����Ձy�O�e��ֵh|���P%�g��A�4	��O�D~�t�nn����7�Q8����ֳ��0��IQ;�X��
���Oi~�wuϾ�3oj<~��h#9����<\�o���H�Se�x�1�_���փs4�1X��G6@-Ib��VV�d�I2���z�S�,�����0����Z5g[VP���>��� ᴉ�G����M��3jc1�8��ۍx7�Ѵ���GL~�HXB��8[$sH��r+�M{� 1z��%�N�JP�A���M�ɔ94�D�DzT��zI�ϕ�3�Z�H����e�Y��:b=�
[A�������hJ�&I�d��s�B��ۏ������r5�>�� ����.T�2��89>P�#z�4���������|ڙ�T���W4��΁ !�H̗:~��5�,ߩ�84<�T�]�V�C);��l�eC�)nj�U��&#��/˽�`���ބ �)��VQ�����H��)O!/a��������;Q���&p�%YE��Zj�~������d�J�&L����^'B�i8���hCNd���'�J�2ݬ������;�J!�(�"xO�'�w)Z\q��Q��՛B7Y��w�����l�C�-�fj�LP��8�l��e��ieۥ�V0��MZ�8_@�w��5�A��d<B��*�������a��/��{�N��Kv�4���
���BZ[�bH����&%�v��j���ܮ�Ǉ~�V��X�$��<@+݉�Uqzj�9�B����&��z':/ւ7�8�ޡ�.���#�*������>��J�H9�bj����r��,�����0�fƨ���,�[T�B���#�0f�=h�lB���[�����$�W����{Z'����R�3ܵ�B�eHr?}JO�Q]2�⳵f@��ջeg�1��v3�XPC���=�#��g�v�,f�$��d̠�{��z�}=��f�> ���@8dT��H�3鴃9J���ڳ�L��ﵘ�0��W���	<�{�W�Zpd�B>��W�kp۪�q�bv=�j�C��,u|P�ș^0��^z��H�v���^^w�aֿD���/0!�8��J-���8vp���Ԅ�4o?*2:F�>F+]�*���fߺ/̠�Դ�:5L��^�&�-0�5S���.��з[n�Hd)h4EɅ<��P��	+�O�M��?��;����4;ܶ�s�c<�8n!G�p�5�<�,�$�b�������-�ʖ�
�/�n�wl��_�_�v� p���q�~&�����JzP�D�=, ��ZMZ�4�wo)Z:T1��ߵ�7g=�z��.������C~��區�+��ɿY�}#��b_�77�fIN�o��i���γ����r=����X�{m�x����~�IM��L9I�U#�����G^:����#�n��lS�������u�IK��O��:ш�q,ޛj
�j�����7�9��&�>�,�����\���sjN8��@k�C3�8��YX>���n�hY�(P�?�^F�o���� ��z����K��8bs�{"�8a8��C�tq���$�Zs�gȕ�o��`g��h֍xo��!?NM6��h�,u�F6��'j�{׼�soj1Ƴ�m�4�~��ٌ
�����]�J�m�d���t�y��_�Nh���,����g�!������S�����

�ξ��l��EJ�iԜ�4w_��T�^ԙ�m��V��?�C�6�|�.H��~�K38ى������П����k������x���
�@���z�Pɯ_�����������0ss}˺Ri8e(�
+��0#��B�ꪝ��+��� ����l	vg�s����/(����{���@,�#��-[&�nx�I�W���y�����~=�x���᷌I���a�<�m�`�)�\���BD-L��ѻ�jMך˝����l���tz0�O�d#{(�9q���j�/@^��y����6�!�5���
]%��K�Y�/ؖ˅	��$����z �����oO���,�ŝQy6�yNE��d���e&rL����������N�����3(��r�&�|�H�O�����j����ix�wn1����d�{ nU;kV�u�_��)��>?�|�Wt[{��π �Q8�{��!���9�拧��K,�f��Q�]ӿb�5��&�uP�e���+9= �5�Xdr4i��f�|��m�ԻBr�n叴���x>���zE�Q#�l��}�0�XJs!hY��c�/끂k�=��/��A���3� ��A;�%��������5{_kwF�G�	�'g��ѱW��Tz��W��~{֩��h��=�χ�1+2��H��8����[�`��)ݰ�2����%Ia$o�x }���?l��6�]J"�,2K����M�ӓ���q��m���{�h@<��(U��|�u����T�w��ǑZ��5��V��I�+���7��/
�N��4L8�*t����/���&䬹C�@��D��w�S��^���j�^uLb�8}�/p��+���!��2c�x��%��U`���n�5��Mט�I�%N��oV"�;{�����i�����>[�=�=�AcBt��,�F�<\��;��v����+�8�^�gi<ZhmY#�MN�yv>�m�-� �Z�V���7;��J-��ֺ%V���5,�1_��x�j�������G`f(��l�b|L�At
]�I����c�������>w�}��P��Q��0��<��T�3-�
BQ���rߘMH�ti�|����?�j
|����zǆ�ݮ{�L%\$�A����I�K4�]˫����hPC��t+sF�0*�S�L�a��Z�	ވ�%g���Ts�o��R����ݖb��Pcp[�l��r_Ҡ�X���ɘW�E��164��0���o��Q#���2ȦR7��[�_�BV =�Q$��{�����8���2a�u�I?�$*��v�޼�ٱ���p���p���>c�C{X5�K�y?��J��.����|���ڧ�'v��G��F�(�?�{��:NP|7dB��Ԙt��]g����P��ÂOA��5��I�!8s\�7����q��� 
�N��cͷ�]�";8�>}BKԴK7@knVg[m�׉]tO0Q�:��w*yܡ]�QN�������/ֺ�{���@�Π���`R~�Ն�&c��:�Ս2T�+R�q��@v��3���.��s�*�/Y�H�kJ�Gu�Kt�]�h�3�pu	s��� ¿��|��^�^��4���l���ӕjq��cWt������B�Ӛ���P�k����]�l��cS�g���&�lHݼ�F�,��z�[�oh�MmJ�����l|;�?�
�3R'P��~�,�߸�H�W*��u�(� ��WoKk?B��Ɀ�P�*ݣ�o�'P�AZ]Fx�?O��麦[��Kٍ�44�Bg�=�,lE� �ju��+4�O��%$�Oź��n?���}t���ՏUo���;�x�����Zϓ_ɻlB5v����'c�=���3<
f� T*��{�ZS.ϭW�7Z�'0\-��҃>b�{[�q�
�G��<��0��� &�tR1/����b�\�lR`x�%y=��Y���G�b&�:[~d��t���!��Lҍ��72��j��3�����v�q�v�i����F���fK`�Η�F,j��b���h��u�m��Ћ��C�O����Yǫ�C	fl��oYG����9�}��Ե���{
��
'�%b����}MA���d�НQ;��#�����i��E��0��r1r��p]��c�K0�e���Ő\�����I�#�G�[:��,�J�=[�k3©�G�:�k�&���A�4�:r�:�9�:=ݠ��(�֏^)��� `��'p���B���    ���=�u����(�N�u8��Z?}��r;P��2�E�D�R���B�F؇"��˿����@�J��v'
��5������*�,��O�e��Ʊ^g!"��#t�+85�}���)ך�\M�:���h�1�#�X(r�J��ҏ��8��*cV�Gk�:ox-�iS��f�~1�Pq�{�PB�1���S��RI2u�����W7�!�r_k��!��8��,�$��o(�(��QI���
�QD��;6AP�k�����M��`�|�i/�E��'����{���&e�D��]� -����;\�5�j��u�STԯ�Ǭ��rN��0�(-��T���?X�U1�
%*t��{,�l����5���΀!�z��pĻ\���|�
r�am
W�m�p���N��N���(�ڗx�d�q�����i�7���ڏ�GȢ�t4&:�0yI�z�^����jLa'�K���%��1o0������~�.|����&I&S�sD+�m!8�o���|�W�j������q)�f��T���lqM��u�T�v�z
M�����V"TWk{C�>(�M���}�o���ص���۸BC�,�4��F<�n_��Z��+e�Aј�KSm�R�x=��G��Z��9 uG����#�U�'\�M�l�FX�:��xxR5�Gc��kѸ���_�1�)��ZoW��B��{����@C�.#�9��6�N�<Zo���5�[�v�,*�jK�鞄��bt���h���~P���J�P,�h��8%e�/�"�a�"~5Z�+��b�����y4D�yh�=̗�9*v}���BU�mwF��5�0����"�ow%�l@�:L������0�����O�k"�I���2�u$�|�EKh&�S �[�N�$߼So{ėvg��	-����;�=N�x7��n���pS-��Z��"�O�� ���
�%�,?���G�Ap��K�ؼz��&��A��j
#<�,o ����� �� �_y�u#��2mn�]����{�>��)��,,�|�V���=�9�#û��NH^�9wa%�>�q)輲A�KR�T����A��t�c�k}ڊ�{r������q|]��i49�A�!�_�l���i��%E<(".2:G�~c�M�{��C�a���Y���"�sBqr�]`��bضn�Ŕ��o��pt�W��V�n��4:ef`�����.�����>v�C�U��u~r���k9�g *f�����e������4�H��
8���az[<�Nc:�.|���݄�]�O�'�c��<�4� {�VIr8��H޷�+�d4���ǅ�O���ywf��yqs�e�{!l紭�e=K���]�g�,z䬇�����e`[����oC�Y&�>�_f�;��%7xD��Lx��}"���;�I#�ˊ��E'�IT����*Pb�D��^�M�{�n��*U����E|���ד���ǧ	&]VС��8��*�Q�Ȉl��r�������W�0���m�S�<j�p�<���'�j-��ǣp��T��г}m�cO�sŃ�w+?�v�M��_Ok�#	2,IN6ΖPZ��1y`����{Y��=b� ��J1�N�6���h���(C�N����'�C�Ћq�ՙ���J��:����G��Ý\P}I!���������G�p��D�CN�or��\���$hV�������p����ŗ
7�?��s��m��o��G���Q��4��p_x���Uvu��%�
�\����u����{�]C㭰Æ��@.X)�\�340ҭs��:)�0j�{�aG����Gbj�N;ĕJ�y����"���_9����kX�^�#���ǌ�ċ꽱�G�c%v�~@�,")G�������n�xʶV'������݆�W�c�i+�U����L*;�� 	���5y��<g��[�*�n4�be܁��fQ#�	��^�!��V�eBq��T�2ea��LO��=d�8��C)�H����
].?�>'��g�����軒]��R�dѪ�@�_h�3pm�K0�m?Vc���7���E����d�v`�oy_��6�d�����3�TؗyK�������/P�-��&�����ɈH L�D&]D}�n�M�\TD"2���'�Ci^y^o`5��X��$�e?R6w΃�ݤ�ݽ�?d�$ O���q՜�R��仄�@*�	fa6��k����-Y�����a�o����Q�˃#:�U��J�3�V���?
�%���h�ﺅm���ާ����Q8�;m:��Pn������	%x�9K�ޯ,�h���ot�,����qM=TZ���Pj�{�7�{Wum�<U��t��t���}z���F���&�+���~�۶zM�M�\W�GQ�sM�=eZW �f��6������������(й�&B6�Aʹ�P� �x�j#���{[��cs�I�Jؙ�?f_�GC2�����V���<Ewh�}Ͽ�`	'Q ��H~�����y��7�
Ka�f�L (�4�G�&o�P=�M~�3�[�OHX�e%@0i��m���r�R�9��b�a�������Bw�a��g��m|��q�\��قĺ��v2l
�l�v\��.�s�ns��WN��������mq�������Z��gŀ-fMc�����;���q�Da\�ԡ(�����X�^��#<��B��
\�-7��C��'�c>����tn�������| !����zr�fX�
/�8✂������ҋxy� ��NC W+(<Vz�����S��i��\T%�W��\����ǲ���No���m���c胾�����K^W̼?�������:gr<��6wksC�+a���^vi��L�;'����b�9����6���2LS�0�C��	:udtpM�>��>��K�s��{2h�~�-ai�E�0���`6������8��~�y=hG�Qk�[��dL�vu����>x�;4�P�N�B_ӄ����>\��?Z%�Ll]���*�ޞ.��X@Or�6�2���G"��B��/K��EX@��Vg��PL��\c��8�$�����=�8T+$GDD���q��k�ӹ�\�]k�zpvi��ш�e���ĦDz�>�D�`�z[���ng�!� �`G�j�T��v�T@;��d���ɨ�3�t���6]�l�ž��r� ܶ}�P�M�Ƭ4�z������c�'�+[�:��9��<Ԙ�t��y���q!��j�#�o��tŏ��TLi;��b����aAdߡ`f�D�����������]P��z�Dm�P�x1��'�|��gUng,�GK�*����'ͭk<S�v�<�/Ҳ��B��0۵|xw����rO�-|d��1���+�����Qx�4<G�P�qi�a6��r��柯3\�7�y�k7�[	&��p�Z��5�K:5��nY��������?$�G[�'��I�iR����r��z��V*�-�犞��d�xN_��~f��N�D3��!�|^!�n�)��/��9򂦚	J�>tZ�1y�Ѡ�^q�r�tI�Umc�mC���BC����$�t�d$��%:��7|�=	1_�xXl�׋�������ws'��+�M�?ma{���r�r��m�L����w�es�}���wyq6e�x�q&��	�2�bǬ��c��f&��^��m�/���XgR˜��~c^���
m��U�$R��j6��,�J�����r�A�I9k@�^�@�S�{%"��9�\uWow�j�¾VP�0�:L�xQq������Z���6�O�H_Dr���I@��#�5�t6���i<���2DO�T*Ǜ��re&S\�HV��Ks�m�=:�v��� �����YY�F�)Ο|����ҙNR��v���$p/��:��W��j�8яy�r�6�k���]��%Yo^�k�����LLl����-˖�@j�Gi���D0�C�&��;A^���wfbV��Z���a���!Rt�-7��Z,ׯ�� 3��L?��w��k�@+B�B���,���F,��_�!->jlrO�Fcf�p>��    wt;���4��4�1�Y�~<�;r1��!3{��*cx[���Ά�T%��Y�A:θ�?���	wEv�p�;L(e��ze.68�{Σ��)�k
 �~�$3�+�^�/��ݰ:z��p�S}}w`�����p2�)�ݑJ�t8�,ǫ�/t�]��t��ƕ�#����{y^����b�;^�[T���]�W.'��mK0�;!�LY�6BF�A�N�Y����q%=X<o~�<� nw��}K�3A*��p��S����^���\-Vg'��CT�d�Z�q��z�P�=BK� Df�Ie�o��x�W �)0Pm�c.>��؛VcO���yG�P��2ߤ�	�0D�%�X/8��Q�s�Þ��RmUKk�Q��Y @SJ}��aNm���%yQ�>Nvɖ`�ۀ�$�xͰok�%Ub��0n�g�ԦX���;(��iq���f/ϗ�{1���]���61�^��Ӆ�7�w�3)H3�Aht1S�]qG	%�b�s��$��t9J�Z��SL��M�r�։�� n�x�#Y�]lC�̲���PK�ێ�OX�%A�`շ*�c�{
�2
�V#	�u(P,]�yVg�kJV�,��3���q��L�8��!h5�E�%=���*|�V֍�LXBڧ݊������ZB���_�Z����� ~K_%��X�jlx�H$��?w#D7t����s��]L4�$/� 24Y�v��r�1��X��m�w7��l^���#Nt�w�t�=^'���6��Z<C
��x�"n��xۼ~ a�M��OY|���h�x#"1_������s�{��W�߸l���_��?�h�Φ`��jz�!�H�������'��8@�vv�N���m����,A�WR��x�sV����~�4�KDm��5V�E1��O%#`u���mn�S���8�l;_-�M�q.%�*;m�vS��ا܌`l�*Q�k������b��jK�-�Z]��&�$_���S� #�ZfФ�Q9�-�>�Ϊ�mzr��u60+4��0ló���k���Wވ�g*D@�T �ƾF7�fq��fY�{Yfd<��ρ���(��T�O�s�ώWY�X�����A.a��&;2]����H�E�rܦ.�27�
��	Po�Q�WtpN��`�����7�x���-f%)t(W�-��ߩ����'/oͫ�eI�85n�����h�` �I4� zZ��`�V0f��+��5L�of&��U�n�H�0!]=�%��=(V���+v�f\��k������,Jk��-%�z��Ã%�!� �I��B���h���%���,@�l��B	g�?S/���ٕ"���S�������qA#�݇.�IH�=5���B�w��M�u���vF>�>ӦzxA�&W,�\��\�4E��^]*�xO�6���)V$��p��I{���;�y��CK�����O��˄ӭ:�%��|���=o�j�u_�#��[N��V�ǡ�=gV�!�Lr��_QαLJ�N�`�J��O�"��[J��WЙ����klUN�&\S`���A�Fa��s���T�7��!�Z粄���!2�_vq�-�������$��&���L[����-Q�\v\(JHY���ͷ�+ٓ0�Ma�����j����e�Q��V�y�糣����&֢-��qN��b\���&\aQ��Œ�%�,{��ҳ1�9)a�:7�L����/c�V�-8��5YQ�砇�#�� {6�cyM��6��ly[�'$���ߧ3�~�HsJ	K�i�*8�Bf�یt��K�v.�����5g� Nɤ�ɣ��픞8���"�4�=�\����t��o�"�t����=�^�9y�F>@��$=�#I��*5KoZ,k�3��,���h�q����\jm�� :_(�����ٯ��'d�� ���O�T��p�SӖ���X�r߹�Lyğ$gI��刢M1��Qs��ޕ�Jr�W�O�G!p�H�&��)_��?R��#
#M�6ڋ�^HȽ�Xn�iC�?sN���i���M[n��&��#����r�`�,����
�*��E ��|��6�����-�����YQ铿�ؗ��P:a��;d���Q����D��վ�YDR��.fmv�'2�DP޼ ɼaG�0D��jP! �"���,��	�P������Ĳy���s��T4�H���@��^��ܰ3,%�g>�F��i���׬2��̙��YZ/]gcN)ƳSt���o�{��d솽a+a��l\Źh"�1�4��K�e4���!K�c��%�U7l|G��1$��ң?f��Ҋ��ʂm�v�1Mw���*�!��x.��9W�,��_B�x�N�+P�f��@�IC&�Έ������LvYR����b�'�ʝq�P�����;�!A-"��!p\ԑ��b��3�)�ҙ���^�&�	�+�ԑ{v;���[����������/_bz[=���Lo��1���K:�_	�C���r���s��*!W�X��vVĹ-;kJ4�Y*:dߵ���~��X4]�~��{_,�s$��!���Ŭ:�&�^y��h[��`��J8���G����3\�٣e�-^%9�۝a o�V����6�)�mY�P>w8�}���)��}����f�x�l7Y��
H���]�����B��^�W3sK{�v΃�ܖ'L`Zƍ	��<sԊ��!/r@�"~�;2N�O��G�7�5�w\n߯_�gd���؟����|[5��κ-�[��D�� Y:��Q��S�8i�y��.�I+aEWF+@nyh�ú�lN��Ӧd�6�m���ܱ���O�+��Gu���������V劉*v�Dz/w�e9�}U�����	:����=!��5�3��`�m���1fܰK_y��p!VϾ]�bږ&�����2�A�'9���)�?�؍�ӁS��z@I�pı��{��;�H���մg�Tޢ;<�2G�1�h��ǫM�M�姌�ڜ�����YEq�x���QQ�M�n�}b��{����u�������-�7���5?�8* �v>���6��d�.�d�9�4��E�$�6��np]��g�N�O��MH�����
�������G�($9��t~G���kv����8a��l � ���F�~��-z�P���G&y���6�b���(� ��^^�D�7C˕�r��re�{@�Y[{��S�]�BDItV�e�	�¾e�oĉ����FI��$$U�9�r��(�n�Ve��q�޼$�$k	Y"!�B��dt۽��7xch��Mƕi���y��[�!�����JXğ�S�X�ykޑ0
�ٲ��l�x�Ȣ��M:[�"�uZ�Y]�(��٭�	`�8n̨=S��y���4�e��}����J�9�HX���8qb�J_��g���Cl}��:�eI��=�a��l��Q�(�ҡ*Ϲ.�����z/!\f��v��-Y����
���}����B����d�@���xE�"��b�V��`�r�l�?����6���j�d0���#���D�ϕ��� (�G�\Z�$���t����	�,nX�쪧����{�l��߿#t���L���e��X�v��-:�Phؙ�^4��Z��c��e���6�Le����|�����A�5��{�d�L���� ^�~�Dvp�3�L��"��n�'O�ghu&ٯ.��-�����{�j�9���-\Rk�5���Ӱ��U���`�q��ε�v��-��Vzt��	����e$�)�A�d��<���x��_���Y�MM2��6�t8������n����W9=ײ��k�/��M�<y�����|����g�vf�5��daF;���|������Ui����Ů�\W6멭+
um?
�>A��z�'�s���dIT�g3�B�.]nY�l�����T�� b�tiX&<���1�,p�&���%���;�#�<�ض���(e�QľhP\��]9�$Z'����L�6F�	���{�0M˴$�C=X��A����]��{*�����~a&�k�Z6s4�z#�ӽ�    ձ����	�PV͆�(��E{���N�(����,��SƗA8\0�+�,�����z���S���9(�DC��O�U�۳P	d�HB�W����o-<��`�X?/��t˪�0�����Z�#U����C.
�9V�:ī�}��c�z��_u;������-��J�~��,��?�4�3B�J�>�}d�%Ok|����W��_�M��T�s D��# �O�F1
�����a�1ط�p��:cV��Q�ܖ\%�Lg>%~U�� �'򽗻��L�}���x�7��N����<ޖ�=�]���pN� q��Nk�B�.� (ZK��~�np!=ێ��7�e66�0C)�N+�e�;kW京SCprf̎��z�I��PU���D6�� Ǔl�Oi�"`Nk��TM��>Yz�(v��I"�W�AXߑ�@6����]��kձm��$�!��Uw��UD��"<*��i�c܂`9R �`Ɲ\;h�t��#X�rl����-[�\���$��E؀�q�&�I���]�b�cΐ�'l��@,���~�s,���<����T uw��p>Z�M��<m2d� o+�i���!3�%}�a�υ�5w%]cWm��j�I��	�	��t�KMNe\D�����U������&��M�,�����T���Кj�6h��a��F���-��},��b`�͸�26�Vl�"��"���Mu������G��H��Se�`)ffw��D[A�o�w��d �H���'Y��/b�0P̦Y�q���-˳ϓ�-��b��3Ǝ�:�"��U�a+���w��x��g��f�aVN�/� �:��S���!�~�����J�&�`��M���wm��{*1��t<n��,N�'S:�����r!��Q	Bb�O ��zGT�&C.������*]���:ن+9����5T���*6��HI?��;��^���H���E���i�<�,iT5��(��W��25w8)	��/X�G��?���eg�]pA�0�ϛ�3�n��)Eܖ�e�!�vځ_��@��~|��%������n��#6��������Y�^�X�����O���:3���XQ�K��z�<�˙-�X���M�+�r����{M(�Þ�Ff:�-	(��������f)�N4����A�+a�L�$�<���Z,���ͤ�4�T?�B��!y���u��[� �)���P/<����%/qY�j����x�Ǧ�q��v|��O��%�%��P,���ܤ\p�?����q������y��?������*��QPe���]�~b��ꄴw�/y�f�.)g�����Ó<�u�h=eߍsA��WP�m�t/5�%U��b?&zK���9�����#o�������ȇ6$�
�Z|$xTG����Q5�k����^�r,�KKCp��0Ato�¾ �Q���_��:,d]in��t(f�������08��X�������H?�l.��ƒ���G`9�@��2�0D�s�U�0g�uN�Ι',y:˱��~k�L��G�G4�|%��7٪������X��`ѝ���������4o�4t��5|Ycq$��\�݃F��b�':�?J�2{ ��[��8W8�cH�������=޵\X��V< @����g�����A�--Sۻљ�ɶ���G��G�E�e���ZZL�so|W�&���Im���d·�N>��a�OJh��d�/-����UZ���o.�G0���k����G蓡?jM�=e�����:��?BL޾2�k��ޮ@@j[�;��8K(��4�Ա��Щ3?{KI���Ï\��_��r�� ��)c��/ϒe�G��bsNpO�[l�`>.���bh�|��?���ނ�uM]LF^@h�<���?ö��KHl��])�C	�tԙ���M*S�]}d!�I���;���[�C����+�6�Ծ���䪝�*�)���f����8n\͓-u75��ζ�A[��W6��[����9G �5��(\Ǆ1�>^@���f���{�8�S��_�m�(�(#��
i��r��L�5yN����D���l
��_3����T��~pz��˘���c5Ww��6�Nh�'�_7H6aY�^ aS(��}���Hl�J�9� ���B�s��C��Tۢ1��*�pxB��~Ye�-�V�^p�\�
A ?��Q|^�3dY]kl{SU�}�6�a���쌽2�1sўj���6�w�?'��v%�0U��J���5��M�~'�2v�n��E"�4��K����\�>�^��ᨪc��i&�-�XG���h���A�46u)�V��.Y-ǹ�PZbR�g�#�kmiC	&�QgHZ�`xD��Q�����7���\�p������< �/Rk�
���Q���*6rD!}�Q��63L�Aa��e��K����dp���-�����ݫ����V�Y>�s�����G�����p�:�=b�� ����r���Ɋ����B �d��a:^�Bb�L��`�g@��Ѷl�<i��Z[�QpB�'
���+��AUt�N�WG��=�� �[h�i�ܰL�°��*M�����!����`F?�_̕�ݢO�����r])���8{?S�c�8Lŋ�	�I��>'��@i� �Z;����4
&�T�8��p�����o#��`�L�Y��8�[�&��Sg�[*p3�����������Hs��+�H�`����j�.�,Miw�s�oi��.ƞbnEp� ��c�i��2�q_�6���`{�J�>� M�l>9,P��AkV��L�/11TLe\����8����(�/"H�������{�n�H��Bt�.�Z���8�#|Fp=1]>��9�<��'9����Me2�� >T���eQ��K�luM㩌����7/�cA�]�Qk�[J0i�r���igHft4�Z�a9�A'�g+�r�ʃr.'����@{Qs���de�j�[	�A8���L�~��${]eT��-�r�ɢP?�����-�2.�8�Q:Yj�3K'���K�2 �Oln����V(o��Z&ϋ�bwAB���$yP���
ש?���}��d\��1���9�@��%�	9$���K	�3U�>���;�e6��{J/
g>�}:�Ւ�)#/�U��*^�@c���W蘞!�(��-���M����Va��ghsߡL2�']�T8�C�F�@�|�~t��R%s�[� 3o4�2|�T��E$���\�⣬�LP._�졷�]	���FCV�r����v[+~bZT~������d��
+�R���f�-x�8���;�I�G��#�q�3���RIʟN�n\�:�m�܂̬�ܥA n!����0�ͨZ������ب[0����'C���0��W��g��Xd1�����h���ɹm+�H�w�,�����wL�~ W�5��/�H�U;� R�]���?��;�K��$��ha�������2&t��|��h=̆�l��n�o�$�Q�&?.$>�0"t�H5d?Q���b��\��p3�je�x�c.��w=m��(�k2��i�#�A�jm"�H�����+�5ҋ��l�i0oˡ�4�C��3G�A��{�5�&?@# ��_��Qbyf�ٹM�D������>��|"�_�w��y�?ʾ��So:NsE���Ag��"�H�gIڋ��fG�_�-gn��Y�f($:Үpe����
�A����O�`e[�"4>�hA��:�9����ŻK��d"d�TiĪ�R��:A�y%�;&���!������LV}-P�M���Jc��lyK�o��<H3�Z'����v���h�CZD�8A�{������v���� �D�4l��ɷQ~��[U�]�]��|xL/�4?�߷tY2�:��Q��`N�IXT��
*�$t��t���t�숹b2UM��,�'M�^g��J�G��x��P��I~�<��LX'�j���&K ˲zY5�o:�5�I�l�d�=:��#������ ��8�6�B�TY��mZ���    im-�
��+?��W��q>���pҳ��9yN^1�Ym���p����6MG�ɢ�ה���M��N@�w��#riQ\A��הsy����iH�%#sK�e_�9���� skα�t�s�l�_( ��������BS+ ��"��_��X�4���5��Y����SyXl�N���=��p?A�δ8��\�m8ױ�-�͎��><�a'$�]P۷E71��������H�yJ�sA��f�/�=�i)��|�l�bA��hX\�%B}N˾O��,*	r��b���y�,��Hq�h��5���׿vA�vr~p��R��������6�6�E�`x���]�����2��?����ɞ��#{����'9�~��$�5,���L��9C�x%��{a|��Yև.[�p-�s_s��{N=����A�F���[���c�{���Z��b��w����L�c�2d�ݚ��Sf�Ɉ��aT$q!Bu��XLl������1W� 0��3������k�>잪ti�UO��_A�#�*�1�gS���-,�B!�h���n�wQCٕ^��qw�Ӕ�O����뇄��Q�T~�sa�S�����������⨤��Ⱦf��<Y�N�]�C����dD#�-iU�_����_
:�����P �>r(�%�]ҵo�bd���( I��6E�\B��Y����#a�l�b�B"�Gb�pzc�
_ �+��$��6�EF�uJ�,\�Ay�-�/X�#�Q�U��S,�DvՂ�@+*�ExX�
z
Y��l����U��T�n��z���r�N�X��]��~*���c�=�f�T@��
�j�9�=Giwp�Ų`Z���,.��GzHb͜�-�J�x�<�۔e�h����S����v�{���΢�|q��m"D�� O�&(�q&r��pT7��B{Ѹ���%t����x�d�F2��'�����Mn:���m�m�2r2�>i?�������v!�k�W������p�FI����[�~O��#mx<mzM��� �4t��п�wܐ�W�޳Y��6{�NyP�-'�E��Ò�ܾ�k����
�Pd�'f�+��k�� ^�Я��ZM�ꮉ��F[�PXR9��(��/�ŧ��_������;J�A��u��@w`+םq]YQ��[���<���Ƽ�h��D��Ta��d� +?\u�Ķ�fO�u�R�s��}�a��z�����?pˍ�%��*� ��d��nu��Ï���8��x����j�ZV��M-�Yk���'u���UG����0����Vl���@��R��(��Lf���{J���2dy_��W	�/?�6%����J+^�HW�%h��4L~�;��_2���Z/0����r񜾜+_k�F����SZ�GC�?H��6M>M�d�l������s�q=g!�Z+}I���?��}���%�-�9R{Oh��@���pW�L��Y���5͟7,��>t���Дϳ�3��BB[�6d�&��-���I^ֶ�Pr���~���Տu��X���c�R<3Y�lEV{�
3�d}v��1|G8���g�I��B�jB�l����7������G>�few`���G1h)��K�Ԫ|P;bQ�i$��.+WP�ʔ}w �v ��o'�$c?r����ʳ�C����n�_4����f/W,�|��K_�����-��f�OD�D'p;H�b�h���-Y����V�@��d��TrD�H%�2��8�x�K�ґLPϢ�tb���d����w�F�_i�&��TZ"R�A�Om-7���~��⪦^��k�����2�|�	JNȗJ��S�6�^,�U� (����z���t �i.��Β�>�9u�vg@+CEW�E��"@$��D����:A�+!Pc��%��lw��5�C0s�R��`��x�S������[�ï�Is���s�<DC���	l�O���ZA���پ�xB8&���k�f����-�v�&��6����C�f4��h�а��Bk�xe1坄ϼ�4��K]���њ�W�)x��w/�B L����39�nf}3X����B��7�)|y����E���M����d�^��Xy�p�7�q�_t����v��j@۝1���W��ّgy�.�wUvv��XP�� ��l����2�G��}��	�=٫�/�2k�B���n��༊E��.��T���(:�a8�=l��_
��$�S�P���,�|cA	��w�4�$�Te򵶻�LY�h�<j���*D������K���F��n�n�Å���)�5y��J�����pぺj'���q`�� �d$�#���fm.���2 s��U��\���4]�)�=������YsJo��7xi��S����D
�yuw�C����+D3�.¨ڝ�c����ª�!��#��{P\!v�;�nB3��U�5K`��'����?q�G�<e��*ݖ��=�,���J�(�^�c�t�.I?}~�3.�|��,����!`�4Ϛ�ޖ�%��;�퀏S8��th~�ȎD��J�raQ��,�M\x�6��}���8fkg�W����?�����BAꀒ>��:��:��n�.wV@���UoQ��f�A�k�y��
�3�m��5�n���|>�U��.�kq"u7 �?����'�D50�r�at�=ksSF�.�׻,�Y�$Ed��q="��BZ��:z��٥kI��Z��Q����oM'Jk�xZ�x��~�s���}M^�<�bAP�T����MtB��Q�y�=�>�.Ę�$8�l
J܉���>���hP->���y'�a��yAT�l��'�S��δ����q#]�oΘ���j�z�;dr��H]b�kۖ'u����{vk�+�Ll=�t.�w��@n�@a$[�%��-%�����t5�r���p7ft$#sBVD�'$����s�1'��M�'����{�:]�o��A6���\Wڝ	�î?&��]^2N4��q��<}E�s�x�S8���^R67]C*9���P�@�C�݆9X��	m���ҿ���D�0[�7>�1[�{Z� �+W�G�W�M�8�8�řֹ��`F(��ӛc,c� �'�<��X�X�L.�q��K;-�� 9��i�(�-��3�M�����R55�<�����"T�'5d��M�����s��o�+]�M��:>\d���i.���@��b9g�k���~s�p�z�� V�-��	)=��\��C�t�H��������'c� t`�Σ�4ł���;)v�߃a.tf��b�-�"9)�����v�dM���ΐN)�Ⱆ��)��烎Z���r��`ƿ�B5\ b�O���~G ��g����990�^��S��)ܚ',5o�)����d�+�J`���v�8�Y��}�g���a��I�j�\&Z{�k��	 �?o�!���R�z��<��'���f!9v��RF�t`�^�{�~�� ��z��K����P�7�]A��	��c��O�~*/
���bKF)�.6�tGT��8ԕ���3׵n�ˆ�/��g�` ����8{[� �����3�ro����c:�Ƞ?��2_���=ORb�daG(��')�es�T��V�X���p8�+�+��l�"��P�����2:�M���gf�ڋ]�	��y0Ǻ��A���;��w>r�-�8�s�a�2!a"��>�B]��=�z�{�����3n��lw���f�D��Զ�!ޜ%���d�&4�a�>pQ���tY?����k�v~�����~�34�Z���pV�C��b㷰��&fŨ\~�j��`���x
m��A�c_����`��q� ��-+���w�]l��4]�٪rߧ�'���þpg\�ٜ:����Lg��0�������̃��t��P��}�bV}L'C2��%/X���Z�����o@�W�c���22H��$Δ�/��֜�/9�ټ�a乚\~TSk��gѠ� �Ɖ5�K~F�rm��7����.RhF�x�U�]X��@i�4�7�e�    }�K�=��f҉� NWЩ�_� i�U�����;s�*��E�n^�ū�t�C���tϊCS���n�O&pm�|��}��т��Ø�@��x[l�q�Y��f�r	hMk)��22��)W �׋w ��_w���2 +�5�q���~��9���߬���2���m䢝��Gt<��Ѯ�Q�[�F���1�O_c�~$���i�J���Sv@��-E>��q��Ȱ�(�ޅh�@�4o�Y�.�>ܵ����^��Ns�0���rIP1�1�Z�55�{ =��>d�*��;�����&k�٧k�ւU�8�q�e��@t�-��K[S*���l{JTo`�5��hĲvo����o�m�>����q��G����_�ǔr.�Q53]��Vg�;�F��(�kH�x����V��c�S��������&wm��Q\u\�n�:��)(�A��tw+U�P�n���^({��3(�z�$&7w!���r��dWn�z�_�<PV%� �vRo��>'d�.��O|��7[Rؕ��Q�/W9KM��z��%C^�J8�֋����/}��:���9��+��Fߐ����2���oۚ¼�7����Ã#���9��p}��+'�$�<]����,���d\5��@9�L7�m���\���	�BR/r�߰O�����?�t�Q���'<w[��z�wØ���{&���`�^~�=s/h,7r����u��W->."{e���y/7������G�V8Hw�*�m7/�%K�ޡQ���
[�t�[��6wa¢?�y�՞�y�g܎�,vl���=��R9�����Ak���+"M�����U�	��
~����%�d���i�N:;�����lu��\1O�ۅ]�R��O,^ ���� �$,^�I��)�h�)?� ��7q�. ���h�zb��^���P���e/�/��FԺ��O�'&'��ʃs�+<S8ߎ�Z*��Hw��W`�4��xN���Ժa��Ⅾ&&����D�Sƕ(w��[�n*���O����~J9J��Ȑ�Zx������g*c�z��V�Z��0[�C���`��[�Ȍ�%-�QA�\�F~��m+mV��Y���1�i+�|�3|�����@���-$��t�~�g����GG(�.GXo�;�l�U�g�O�r��4y�3g�:Ɯ�)�[jm���Ԭ�1˻�*����|�4(2�?�yZ�"_��tZ���J>�-������cqX��{x��lO��̥3��_A]
XgɆ~�}���//G�'�*񊥒��������k�V�#?��I��t\�0sO����� �J�6�jr��X�z��0C�?"tHFQo\��4�(Vt���;�Ib�+W�DY'�]��t��9���X���2�Ȟ�
c橭�Y����hz�x�^5�a7��ʍ��mpS����G
�ԁ��Dε�V�F����$�'�`vp��1Y��qDM����Pfx9f�\N�'�@ڃ��k��hr���RK�=����?�s��ܺz�V��:�m��3��"��B�v$�$�8E��h���N�tp���jr-����9�c�����i���ow9���i�4�����v�#7����]eD�I8����=��L!�`�l��>'��P�r*�(ɽ6���̽'x��鸪J�ZG��Q��@6���'�?��2��{/�Նh�{�ͅ�lt���'�t��l��7�00x��T�2��޳?R��ETGYr5Y�n��j�?dQ����*��@�ͩ��
�J��Ȼ�=�l������r���㖕�kEC?N�WưC���R�:����6oI;ݲx�ߓ��T�����e.��>Kn�Q0���2�_ �zȂ<?�|,NdK�F�f9Rum�Mn*Щ'�GUAMLʴF�Qlv�#VX�)�T�wj���j&_F8�~b��r9&����� �;�j�����/,��g_��!�)�]UA�ե��X� M��P��Ҝւ�DG��5���)���1��.���x��b����`R�C$o���(�����t������� m�O�Et*f��9�0����e���:oH/����6Ycq�
�'�󯳔�|뫆�o���*���a���"�h��o��K���p�
ܸ� �� =Ær�R(sA)v	B�4UGon��)02i�jL�p�9�cXlf'�s����K;�,�UI��:�]��������|Ǫ��R���LP ���g.��]A�ͳ��-дí��&�Hr�*�=�HB\�y��%�#_1��LLe��I�9�m4���JؙF0�}��J��@II9�;A��l�
������=ކB�c�.m���A�3��av~��m�u�ܱbY�k�X��\�����M�V�$�Ǵ��r`����9<��臀5!�6u����鏹Zs{���/֛�����$�`~������cf	$�=:.���y �t�˱�#W��|E��l�>��R��Ce_Dͧ˄&��9����>D!6ծv�6zK��%��u�h�@�A��R�d�c$Q]ު��~��������t;-ް$#$\!!�L7���A�bivS,|�WdN$&���J��o��J��Y �^Ы7<9tk��)3:���p@�Q��b��s������d��@ͼO��'�5���xw��-U�#���oCW^��wG�-&�=�)t�f�_ǡk��%'�QSsk
h��/��h>�F�λp�4�Wo�G1p���=3�J�h���#���8���?��t�=��)C�U]�)��s�$�曗%lq��]Oq5�����WVz��XX�$��r�u���R�v@3Rˌ�ɰ�/��x��o�u㴿C���Bq����Hۛ̀�L�AJ ���(�d'@9�w��-�Wli��HK���_�L�S����v��Jfa�D'��G�4[������hT ��hJg�q�%h�ш9!�~+*-�����VC?���[�����2�uD,�e���Oi��w�`�PHs�`�8
+u��=� 2�.>E�yv�t��_��l���3�sVK��)4�G��3i5�q[����1���7X�Tz�x��$�C/|��	���;Cx��>� @nqZ
��v ��>(>U��w�E�G�c��=S�{j��f��C4�Bݯ�̞(ef?U�;3S:��$�(�3���%ȟ�Ï8GSm��5�Um�SA��yY8�@��c7�0~J��s�%O���BSM����J@Y�s��2�O���:��
�e�.���k����|�@n}îqR�w�F���OW�y:L�f1���_0i�tET��BL�r=�0�g����?_y�~Q����*��j���=��<
�n�3!�	��x�S<�����׽v�Y�O�������B�o�`g�P�V�<�{]Ѡ]�w���iL�K��D�v������h6,��%���7�\M�p�#Wa_�������7��QX	|&0�/���Ŭ\��պJo�"�Y�-d�h�������A#�xWCU�~��[�P�^=tSU�8�)YpT������n�P�[T@�T�_�������RwSS�ۀ�7�ի�8��<L`B�C0�A�#�~���d����׼�ԕQ�E��h��"?�?���=��%\�o��Ln@��<�&��KM�~!��+�#�埸��T�!��#S�찇�#�&�tow��W�+�:� s��5O�.�Ej��,�!� �acX�D��`o�՞|��������Y8���ѐ �*�h�*0U �v�?���U����L�̿�����á?���}�)]GO�i�4�oV���U1�¶>�r�c�/u��X����d�Gu��=N���P���:�A��I�Q5�0�;�,��M�W��7w�~]�Ϩ8o�3�>Z��T��5yF���)�h@�U"qK�m}G�0�*�~�-N9V�_�*M�6�U:d�H�^nnX8x9��z�ܸ]x�d��2�v���d,�.����Z}��n�8ހ�G#�@Xv_鉻N�I(��h��
��@Ph�B��   >�X÷Ґ� ����_��AT4�v�� �8R[���M�s����m� @�������i����E����VX�1�K��g���)$N�;n���Iӏ^����?�!oY�m����(�I�B�ե82�Ұ_��Մ2��g��-��p-'~�Q3�L�v����#Q2怐J'X�'z�4��*�+:��4!�F������`R�W���ɦ��q�r���>Z�a��!��-[��a�;��p�o�1�0y��p3w���VK�,�iў��)���~�څ�y�o��o�9��8      c      x������ � �      e      x������ � �      g      x��[w�8�-���+�v^�2���FG�M�:H�=\c?��Čm)K�:���7> ��\1��Y4R�ץ:]�%O�n��8M>%Kt��t#,8��g������|�c�a�~���B�bߧ�g�����7?����NW�N�Y�Mf�W~���p������}��g��~���WH���������,��7�:N��$n��(��=b�^�#�~���P��c,ѓ��O��A���=!?�k�Q��r��V�C'��7B�	1����� �B������=��Ӎ<�����	p�5��&3��.����d��(K�|�<�J(D$��fw �0���)~D�/�B2�ψ��(��Br{��V�t"?�f�z�t+�d�,>��ÛM����*����?��5LC$�L�Nt6��Y�����o$�;�\А���$�J����(��U����"C���%�>ś�xyݸׂ�i������L���G8��	&�*�u0����5$9���#�y'I�H���,��䓨~��M�Iy"��:a9|GH�א��"����m��!���W�e,��ǈ�@�m�աzu��8���#G!��F���<�^�͐��?,/��*OT�<�����B0��cIof:2�' �׀�H-��V���t��h������@0�S�i�K��a2:7�;�P��!F����E<K�����u��S�HK$1G�:���{_Hb�U$	��X���t�m�ػXm6�xCTFn�ᐫ<�Ȍ�f� e��IC����į�5��t���O��2���7�%�MR�"A��M�>�N(Et���V:2�����K��2��o��)��&��<Q�G\�y�	����&~G%�߀���q�e�]�(���������1��T;T_ ��u��p��;'CP0N�G����8I%�Ӭ	)�?C槖�r�Zh��DS�#ߪ��G,3��J����<��Da����#RƖx��2)0��<�+N��{����̋8噔�"�$�/���A�����:���Iݮ�<�QH�)��\���;� ��w	�����o�����-�Jn�S��D:j��W)��9~5z_ bt/��g���ԓ��|�x�%��b-?x}�}˔҇�gn�_��sY���Sf6�&W	��J5$C�����ȗ�U�aԻ��9�>��߷s/]}Jf^<�f�L���6=�����\]�@�g�b�3ʉi�����S��������"^,≷�/.���Ih��V�(ϦL!�_IJ}6�_���;f(�FYN�Y�t���vw��6X�C�	)�?5�z!Y,��.��ѡ��t��yi�}�1�h4��W3s�}]�з��#���Vfؔ����\��5� ��t���[�.Tۛ[����P�	�R��T�3�zo�Eh��O�|�.d	�)�8���i��6P�T���L���	4f2���e^����,:�����x���6��0����|�U����3/�F��c�����\�PT!fL����P���)���)����3�+,��Y��$�Z�s��*���)'R�*�?U/�OǌA�v>������S�����.!��)2�����O���E��e�}J6��f�m{��q�2@� 
��)��U�6�=@3fڬ.�T����l��.�7�����|����`h�P�hrCc��p�ۆC�kR�cI���7�}�*�ζ�ăīv1�����TC�1u~��1j�8�\��%ԌIl�Lc<d�0&�dN��������n�\$y7�,^^��rz���)�5j����ݢ�	�+�;���T�4�X�/[ͧ�� �tR�!�|��VR!�9fѻ�K&���j.?h��"�y�ʇ*��OI����S�ސ�(���l����,�.��ty>+s.b��rj.�	䩆g����"��8Y�s�Z2i�AXN�2�b�~
�XT|�>��F�d*�8ikE���g��2V&����0�G��I���I�{C-@���|��>m�sON�,cȗ�).�e�^�){��2Dqz��k�l�w���f�
�q��w��3t�`/�n5>[��RS@F��/��H��ٯ��Sl�7���<Y�ʀ���Fl�k�E���^�-��X%V��a�O�T^Ǐ+��ϓm�I
�WX�-#ua\��_�6�v��W �Q(������w:�Y�o.t�\ʈ��V�t�,����D��XI���o�x`�Z���@�j`+?s
;d�G��.�峆u�D��hd��G������A��nٵ,�b@��eM�9�NxK���0g�ղ�?zۍ�z(��m�ɂԠ��r�I�]h�m���H�^���t9I��->d��e� ��ltHo��P�:9�6q#0��e8��.�z
}�Y��2YN����>6�e�H��K6h���ԓva&W�:�!�\Fzr�	�Ke
SE�!��'0�~���$���=�w<�������t.���[��%�v��(�];��`\��=�*a��/�]�)�QA��l������`�b���)>���Y5�rO�ֺ-W�|Ͷ�����!_��r�4��y!"�Wί&M��ex#HYen��e�i����`C�f��\�;��@򷐏.TU׭�<��.k*��d���N�c[�/���w:ˠS
*"�v|	���O��]���s�--Ԅ���2�������~G��7��#���T>����� ��ΧjE�tG"h�Z3]"���b�c?vF"��<�dA�K�����.�Y蛡m�ݞ�י"Y�+ʨQ�u�,�q��������t�� �M 4�A;�f�:�8���@̒����ԓ@�Ă�8V�E�z�j<H��*�P��r5[y��:�,�_5�n�Y��E��iޑz񏺉#C���l�������x�d�Wo�C��B/��!�rK�_���{D9h2f��]��U
�99K��^bE��Td��������	e�����S`�{�֢;�)����c��Z� 
�)�Fm�}�'�L���s.��&_W�{�SD&�~h����d�V:���ߖ�ԓ�m|��͒��}*���|q�J����1���,%0ը�-YY��ʗS-Y����,�k`�G�>�y��E�o�Y�5�%�|7�,0�s�BS�$�r�A��[o7 g��:
;z��v�)"��%5k������&W0�_�H-�z�d"���<^��*�ڣ ����Yp�1"T�dtp���XA����t#�L`b�}"��v���>)��}������%�;eۋ9䎳-`Y�}����f�+xܨ¼����!�#���
��z�F��	���(���	4�1ዐ��׫�����߄j���5���%M��2�x3�a&Al����X�~N���Ǫ�~���6�9t ��q�-$�s-����YdC6�XĈ���f�A�����?�]�. ��Ӥ�ʕ,��X�ʠcY�r�>o��CH$��}L��٪���Z#'4㞖��J8����C;V�d��`|��6�Ldz�W�}6��&����$�[0���ۍw�e�7M��}'��J,gY�����1�U#����v% %S�M!��Cv�Y`����|W���CȐ�t+]t�ӕ�P�&j�bkn�B3f�B](M�q��L��Њe�3H�nŖŝ{IM�b�;�3�fy�B�#��<��lY�rR���b�*d�H��V!�B�{􄏴��l��SE��ȏ9���h��A:d�&	u�!��R�4W\A�LVwӍg�X�d�=͠��C&~Di�~
Lt�X��#�X$��evxkL}iO�FAd�=�*)�x$cE���j�2��X��7\O^��ѾV���. ��Pn�(�.7�mVg��,�U�����t��jك*���Ƞ�K��ݫMD]�UK���y�Pg�%ͳ�������E�y2���W� �6�LrΧ�*��}�kiP��oj�H������H-:ĝ�� F���q@�H_aQ2���ש�X�b��ϕ)j����4�L������؞2V:�.����m����=�Z1�����J�٤t��� ��$|�    &����a��W=f��I���@u�����m)�L� t/&���ʒ�m��e����5�J�/��!u�R���o/�u��´$��U:�\�pL��O�z��?���o��-����,�o�$�W�ם�mHa&���*c�������v��;r��6{�2���*Y��W�*�C�V�i��.��N�eCay�C�8���-�zĎ��Q��s�h�����R
s2@�B�b:o�2����=�J ��[�r��T����L7Ԫ�5S0��K}��Ff�B�����z��
���Z����I�"}����l�U�т����vnmh���i�����GBr*��[��4ɚ,BȤ0���޴��T򖤾��# R��˶R�n.P�c�uȠ�@�cH�w���;�\0�eݼ�L���-"��;�~��:ZC���� ��8���^š�}�d7�!C��l&}2���y&�x�*�\��� �,r�nHaN�e�(���+p@�����������¹0f2��-2}w�}�ˋ���K�?�{�<���`�cf&�ey';X�t���ɛ��no
t$ksEV���Ad��iݥ��%�C�Y�m�D���"�L����u���3D��uJY:�Z(�1C��}��a�([N4[mJ����mcJH��,��G��)kZ�j�\�1��m���kWU�%-�@�F1|)Kj�z�;pe=]^{���ڱ�c�d�m�;�:�0�d�Xm��pV�k\ 2��,??��zϋ/���͒�vn��fy��3훾Y^�^; ���l�eҖ��
޶����-��+�OLz��?%7=n �uZo!�De؛x���^�\�g�r�%��4抨$츆�[����K���a鶾�u2If�/��8�$����l���o���hTlg��0��y�l��\E�@FF6�RJ�*hf���������tq&�d|�-�+�V����W�Ur��Z)����p���O(�\ �2����S�p
Z����,��d�@�^\��_n�����Vz>����!5$Mӿڋ�M��RG^]�2��$�&�1�(z�]0#���W�QP%��w�\C�q5ܳ�!��ٵͱ �
�t@��;���������ʤ�����қ�g�+O[�u�A �>�:��!�܌�2�k��1���L��q� G��Ғe��6���JS��o�{�D�� �S�d]��7�����ic��+�m-/�Id���O�ErG���F~�y�q|����޼��B��P��/yx9&Cj�u�QB���Ki�Z��F��"F�EѰ�M��i��r4�^%PG%1�O���͇�(0<7���'�b���7��a��w�l���ԳM�FuB7�xoh��]�}i7؎��b��ȹ<�1h{}X��A|�M�sP�I�O��L��=�-�!+!���-w���XbcZ�d��i�����Do:��Usy,�R�]CI`lC�I[�C&��2�<�2�Ԯ�>p,�V�R~M�A�ƒ���"���T~��|�//�p�`�Ӄ��n9Gj�=�˄@�8BE��j����؞mA�S	������A��j��]^�ZI�����C�J���#ch;������!Zl/��#Am	­����ٳ���p�F{dhA�^�e(M?xW+���N�=�f��_����!�j l\%�D�A���\�}zǶ�^�����Өt��ST
L&�~��3��l� �J��:N/W�d~w[]��9���2���vVj�`�P�.�'�NXCB�Dt	���)����D�4�}�x���.;u��%�tr ����9�������l��.72j._� �$g�/���������։d�z�`}�f�x�V�x�Fρ�/�zC�<��72�y�/%��^U&�Ǔ��{2`�N7#<� �&���۹<��8Yv����a�/�WTR����玁+�|�)o�U�ɯ���ľ��\�>����v9m �,� �"N�5�0�4;��9U�J���B���:�m]��d6����01do� EM�؛+����Ɵf0(�~��46�����D��k�(\��mZvb}���^9RچmS��Z=��c��Wk���b��_����2U%����U�i�k�NN#��i���f�l����F�5m��FJ�6�
��i��5���ۀ�m��_�a�4��R��v}5�e����W3/]�%]]0a���kQ+�R���i�1��X-3����s�������jRi%�I���zqu�	~�}�4�M��̶�tݻ:�Z�����0�A#>��HS�&F�uhS�}k������֤o��`��P��T~P��'I�+�k�5Y�p]��W���:��*kc��p��g�M�#�G�_��f\wd��鐟B��Z��`��ĸ��y�E�i��nx�?O�H:u"l���9��P�9���^�=�*@Gz^�~Y���e�\��n��V��QBt�A!���Ur��`�Bqz�R"b�U�{����m>%��G��ڰ��PI����l֠� �|��j.��}�J�<���x��y<78�x�qnڿ���n8E�����,M���%y-�
t[������'T{O>��q�I�'�F�,?�����9�{}�r�2W�Ж*,�+Ԭk��d��m���+E�d���`�.e�,ϳ��m��,���D�V��*���x����Jef�*�y�1^y80/��V����Qi�(s�th�M���țL�l��i�(R���
���O��>j< ݵ7eh���o.��<����5Y�-��JM����t����Q�A�;IVW�Y2�z�BCHn<T���[�J�k`����֪QS���4�eF�=��AXI�T��oS�8�+5�s�_�dW�ًu�񶠫�/�"9ۦ�oK��t
������};�Po�ko�|� ;.]M.��P��!-9r,$\�nW�|�f�iUw;���}S��O�yu&�l��ﻉ|t�=K�Ck��,��8d��C���v�l���2���Ceۋi:���b:��K�up�� Q)7*^4yz�+�C~)�^�$�*~��H+5��n�7���|�۠��/�O�LC��r�[���ə�VHؘ��sG��[ɕk/ۮK7��@(S�{MK�2g������_�,�%"�a�^x�%M��:�.��_����~-��Q�Y��Q����ؐ<1����+������E�,�qgQ:"��C�4=������oD~#Z�V��M��@�߈嘄�H921�	fz{J��Qs�������!��=��b`*-7���d[f��F�*`�Ɂ��;V�+ڛ��O�w�Y>:�n6�$�J;W�Zb���	�Ԝ�%�V��������|E�Q�]��g�s���+��6����J�܈��i�-��K"2)�$J�?���������"�����z� 
uJ ԈR�X����?_ҫ_Uu�,ɮV�m�MU�i������e�I�,�w������
�&Y�m���Jޤi�gq���t�HhH���Ow����׿��ɿWޥ���XV\ Y �d�7_�W�%!,�X@Ҍi�W�8��D��Q����~S%�'���l�5���JU	��:t�
/1B~ʡ[�zx4��{��8Zj�l{o�C�Hq�|K�@h��f���Y�np����^����l'I�(�6��"�L�9�q?P��������o��M�P�+٠E*���l�OS0��>6H�!_���k/]���
��7���� ���Q���!���x��r��!Ч8��,4/�-� Z]gUuˣ����$���5՜���xe�x�&s�*y�����ɪ��%`pJ6�������K�G�aM'�N@o�J���D�e�R`����F���p�����u�����Q����;�M�d�[Y��Q�"O2Ҥ+������R-�����2N�VJ����,�L�!�;��|1��,^d�yo�Z?a%�+�~O'V�/�5/��w��I��X.��d��2�Sko{ꇥ�i�]��'�������d��[���%"*��0P�.Ĉ�    ���?������2�o���A���|5�zY"����r��|up�,L�K�>��9���$j�$h��U��ŽZ����j��W���/Wg�ә��d��Yİ��&I y���VFL�X?�j�..�:�+���K�8��Y�,�=������j����%n,`e%�e�:�uayQ/��R%b8��jfV",�Zf�!az%R`A�������G��O'2��8�K&�V��J`�����QwW�-��m��Ys�CF�aY�=���'1�!K���O^P�V����5˯V��A �{\l�V�D�$Z�2,䉭Q	y�U�9`C�d���o����������⦢�Dy�_����5H�$k�֞��C��X?�X����c9�+)��呒#;�9��ʯۓe����c��D�뭶]����
�L�S?c��Q%�^�,���	�]$s�l�pKoK}�)O���6��.
Z�������@g�h>��&Q����" �I�5̖k�L�aN�2s�Le�U��Ѝ��=Vek�1Q�\�����hB��^�@���]�����b@0������_�x��qҪ8b�Q�o�iC�zt��!�L~���v���H������B�� }�!��7����
�UډK��Bl���O��A@x�f�6���3D���B~�Eӏ>���,J�-s���muQ���)ׂ	+ָ�:8��X��K\#���)	=�Ww�����E���*� e�S�B��cR�Tp�㡸	gT[,�O����ff.я`���G��q��ړR���b���j�s*�Ou�D4�_�p��pڦ�J��6����N�����F��N�T[W�}_#7A�jֺ��i�m���z���V�,���(��6�:�r�?�����/�R3����e2����Vf�~Z���ydA�QUT�t���E����S��,Á�N5Y�!���ӼY��P�����B���P�T���Q����{B����y�e�b5I[�P^� ;�0��?����c-B�i�{��~J�:��)e��U�K���� �	���$���b�N@�a�z�a�>����jJ�&���{V��8�N����b�J�Y�@�#��z1�O}�R��Z�Q5�s�@S�zF5i[�#N[�#�2�m|�_���q�]$0Zݴ�(�/o�k��q�k�G���J4���W����Hdp���aK����o�1���� �QŬ�U�c���U|q�ͦ��6V4�u*���v��ٖ�\K�U�J��&�!��F�40�z諐e=mZ�.��
8)w�Es�
�kV%z�곚U����aC�^ ��DCƁJ5���i�)BeO�F�z;׶����v���t  ��^��W�S-�M��l{�����!e�����ɞ����������,{�D���p��_X^p�pP������S<�_���$�f�Z5�l�J�k�Ʋ����R!Q���2Fg��GWz��O մ��^�D�Օng�(N�=q�I�.�Y��VE�[i˴��j�*Ȱ�R�P�ٱM��'�ݞy��*����*��)�xg��L�-K�e��^�� -��73Δk�_Z�8��D����hX��Q�
`���������w�Ct�\%�h����S;X�R:+X�?���l�5�h��O���w��$�d�ɷ׻�N.bo�N�k��!����YH|�CP����S3�9�dҫv2�OӴ)�X5h������O&�5��_�m��3�J��T~DȌQ��������#+��4���"%�赭2� �l��h݋'�d�d�T�8��Y�Z"����|t�
?���|ws{�������뿼l�!���1F�(�-��<<�N8,@�ц�DW	1R���	��4���J_�Y����e��+�
/>����C��Lo��I�(0��Wkq�O����ѧۧ�g/;=�ǧC!!m9�
Ő�4�z�[ȷ��3�=@�;��8����?�����\#��r���-�8��A7z9�'E������j+vVi [�r����� �}ھƀC �?�|W��J۵lx+y�H��j��)��!�n�����O��}'��,���� �^^`c8�%C���ص���@ �����jVѦ����]����:�|��r}ȏ�O����V����BƩ�]�R�QH\q�����
ovz�r��ه͇u��>`)�D�eGD�b��B_��-��;�n���4Uw����L��v�]�b����$�q�Q�� o{bC�X���2���7�1�����r�7��s�e�y�����R�T�-ڥ �1��v�-9�_f�⯧�,��dE�{���N	5�U��z�U��V\G���^�w
2AWŏ�^�]�cQ>�LV�fZ��ĸT���H�s��F���IF��b�d�p��\-�`܅*3���P`������[hb�]r�N��u��ޟ>w���>�qx1^�Z��6UG܇5D�c�zk��֞n�k��t�R�^��24�Qx�r��cZ�9r����x�@1`�܃����Ѣ���q'+��/���Ei[���1�auR9�p����1�����C~E�]��EB��$+/�6;�qc��|��Fٸ��F���a���m��C�Iy�}y�B��I��mF]���]T#��_d6�}�f������j^HDT��UM[B�2�6�e���ގ�=�'��@��P_yqW�ſ҉5�/�|]���/���!��B�A�����9�.�KQ��{��Q�g�zD�|E�kPλqC���2�0;<��I��o�.h)sK]H&5��Pٿ����?�!J����Y�|R삍��[l��n+f*B,Jjx5���.�������)b��n����]q|�w*�ͦ 6W	��	1p�M�W�]2���np�(��zɡ��o���_Z�%Bm��E���`��h�}!��-0���� ߂�7�e�6�����/P���_^����:T��`�iuPq)h2�� ��G������sq�U<D�LfZ�Q�ђf%�ؾ��n`�(�������[~Wt
/�:��I�D����p�����D��7�^,�Σ
C][���F� �M�ݗ�C�"]�.��˲85�ľ/�Cn��H�/���g��y�tȁ��$#�,�促�mҢ p�WY�V��7#.�"'�f����RH �����;Ʒ�!B�:���<Uq<�����tqV�dG�>��X*���w�k%��D�= �����sͩ���'�0؏�6>dZ�,��Z�������e�z<��i�J���I��D��Sۍ�P5������/��:�hT2��jZ�H��aģ@��I<rN����Ѕ3RŪeO�qK*nQ����b�*�T�iv^\�r���z�*t؇ʿ�����ߧ���ٛ���~�)�����Y *�X��4�IP	��/�}�����X���?��f���8�%�<Ɋ�����i��;���6.2�e:��N�3@�� o4��ٱo/��)ӑX�X��Վ�O�,AＩ��o_����)�O[U��g�]W�z*�E.��'HA��w���,�ٜ��l�)%�_��vXY)yײ͛!��y��Ɔ�uw_�H�9��'�Txg���v�{�R�����[��ſ��iw��L��@�B����_u��͕l� �,���zk������F{�Uo�x�iج�)�y긅��x��W��l�϶�����W��'�]}����/�Nb�ep����~�n��&�>�A������>��u 	ʞ�?�d��u���P��:LuJ}ױ�袸ɟ�'/�����0�����[�4�C4@�}!+��M!�o��E7��u��BN7���}KB����i'��s�Z���̊��}[7��dH��L@��v*/�f�5):
�혐/&�u��h��C�+}�OmQ�X�u#�v�%F����y�c�F�^��w�������ׅ�,�}�%�����'�w�:��o<���֩'Sc{��7���h#3���$���6I�=k�q��$�Ǎ
���S��t/���Ϋ�o�eד����d�Bﻀ    R�C�B�&>�]����$M�V��-S;��A���3�C�R�(����o
�m�u���/������A��>
�g��� ���`?^|�9?xi񧬏�
�_a,Z��׋"as��!����C�>&��l��
w�G� �{��� ��{@����<��1��䈽��:�0�ۍ���c�r��`���C��{0b�!� W	�0f�{�3���h����!c��R���4V4����'j�����LƢ�9R�՘�X���֙�}5&.�K��xR��%X^�m��u��[丼�ac��P�RF6������)��=Z���ަe��W�"M�`�2�N�O�`@���t��*�H�q_�s&��>V/9�;(E���6�M��4;�7j�.Aj��O�>����$��_�?��&k��ԛ5�S�Sz��x��[�ǃ�o�o3[����l*�M� ��quP7��w��X�3���T�B_�����s&kZ��Od$h�D^��uN�wf���bu��M������gH�DR�V�k���Jw�͊c�Xj�Jay��`����7�I<Z�v�����X/�F���D�g�rQVI��F��9$�,%��}*�Mj�˙�!ɛ�WO�����>����ӡ�l{�LVD�� �ʓ(qH��ۇ�����	�bK(1��
���[ ��eH�$��AI%�_�7�=��P"h4�� -u˶�r"�"�j��Xn���HA�|w���b+К���4Y�{����[�z_ї�����밆��<��ҪϵX�i.ٮȱ@R�\�;��M1���!~h2��[��p*��&�D�ʠ�7)klƽU��]�hʡ4�v�9d����9��!�s�]氚�� �?�(�*��8�Q�BC��wd��8�%�=:��'�J�1�u�k[W��[X��.绯_ow_A�n��>&�ac��1]��a��lޛh:�(F�ۇ��\|��������*KRTپ��������k�h�wv����Φ�0���xq&?���$�S���a��w��f�/�]HU�ò&�?eJ>z)J�Gov:�T��%4�^�%�����^67ڋ]3⟑?�zy�	^-��� ��Z���`(��،�M���o�O�����5���o���B7 d�x��7�]g{=p�m�	��yɸ�% 9�N�ym4�5m%�x�*#�V�_=�p>e��}����şE�UM��u7(��=�57;:=`gb	�=��$���r0N(S�_\Q`�RX�~C���F;���|ݰ���%��5��Ԓc ��6~��vJ��<��+0EpݘB��2������~��$� �߁��:�Ea�p�8��(�j��[�W�H
����5�Qt��������WP�T�|�2@��yqS@�Y��'�@�H����'�:�a�.�_��)�8�r/�j�Q	\���B� ��d���d� 5��c�N�s����ޏb�]�'�q6�����;�S�h-{	�Bf�ϵ���u�8��G3B��.W�z?:[�D��	K_M-Q�s�% ���wz�.��a��tw�v|e�|2�`a�U����������E��j�Z��n��"@��+@	�o��4~ 1Z����3~M5�������P��`\-����)T�n��Ӄw���V�,����̬��:I�sO![֛�2	�����i��Y�\��&c�p-�n2�7����@&;����wK`:M�O�P��f"�ŎZ~�n^�4�v�xy��U�����Z��a-����gPd(;��r��r��ޥ`z����0j,�;� G������*�8J	��CE����vh�`�^�?>���>XDBݙm����!��H�d���*���>"��肹^��ݶ�����绡�����vV�"a[����I���b7jMA5)��1���=++���#��l;�϶�rA�ڋ4p��9lzT&]8�Yy��n�H�� S�ۣ��jP���-�m�߉ЍE������(n@Iu���j�"?}�:65 �m׊9ע�ʧ�z$��~�P(9��L1?�8���R��T����+�7������cK5���������eg�$����Ff�p���Nͭl�A�Y�v�1��l����M
����.<��}G#�m��e)�C��Ţ�K��32���S��ցsI�K����\�ƹ�35?�B>����;;���YǺ��'C�ihx������G�����n�������7Ѓ����g��Q�7JV�Nl.w����Ż��&�E<���lwZe�#J=*�1��mJ���  ��?�5�M��8�!/�Z���0�˞cwu�)��Ur�3��:S$�þM��g�z��B��r�]=�_g�h�*�{>�t����=�@Sd�α�����u�����[�����m����o)�+C�ȵ;�Fo�]�c2ڏ��`��X��H�f�(8��~=ݩ|G5r7�s����,�^����l��,!lrǜ9���yȟO���a���*����R�U��u����Ə�@��o*Q�1�bͧ�f5�!����Nc�vV�	޾�N��@�����}��7�H�T[���i=`�~�<�Հ���r�Pb49?x���O^V<O����_���B�z]�A+O{�YFqj�#���a!�Z� \Z��Yl�g�U|�M�x������q�Uq�����#�P��ɼ��yQX�d�3l�ԠR��w �>�u���t*��ڳ�EA�[l\y6rÜ�z��m/sԐ��Z�yY~���K�*
���Q�h4܈˘��F��t�T�@k!A_㵕.�`�����Yj�s�"��Ӻ����qUS��^u��]沬�n���R$ʺ2��i�/������#Xs���l���jK*P'_G]K���r���j���'����f�}6w2"�J-��Cq���l*:F i��)#֫��įr���59�p��f;������v���2A�^��1R�ϐz�YOC�m�威%�a��G&TYi�0�S�f����nj����o���QЦ=�[�4�3j[p�6Ӣ;�t	� M�7�^�jk���zK�1L��������2D�-���=��a��4�b�{ ��1�J��y��WW����]tKEH-�bg
�N`�Hs5�g�o�(,�z<��dpF�=(���=(%0j(#��c���Ekń���0�d�K �8�����5� �v��#�:���5�H�y���D�@$�(Zq��G��u�E��=�dČ��\k-!7.��ؿ���!���/��ty>+�X� �o����~��5�D�,����!��JBQ���{"5'F@7�G�2�Mw�d�XC���W������gI��0@��x���F�zL6�.|�ϡ,l��`b��(K���R�؞"(Í�<�ŧZ��/3��]�|�=��.SP�Y��/V�՗�ȡ5�\�6<td`��Z=Dp�s#���2j#�1-t["�
��[�
E���lW}�����Z��B�+q��j0��J��{Meu�kG�6���n(��Ɛ4u����ɫM12�i��M�{5&����%�r�����}Ũ��"���Fo��Z/�����lG��f�YÉ(��j����'��	�-���=-�v#�>U�W�����Q�`��?��t�F:ϝm
��ۛ��D ��E8q��FC`lH4�u~z �����P���t��������Xoܫ��F�Ԫ�B� eF�N>��5�(���dX�#��?�����v�trA���M�!��2���{��i #����b������g�-��0fA%�������5�Q�*�l��♦�Z�j�Y���l�IƘq|E���6[�����Z�ܺ�N��%�:�s���(˿�3�u.�=;��N0�a���p�q$h�����W�)��� /&0�R�+��F��n�P��ʫ}sȿ����jc��i`Aß1L��%S+g:��I+@P��	p�Dg0��η�4��^��EiB0U���x�:|�C�8=�FT�TF�Ȫ�	5Q��J��>�DY�e$���[^<�;��.��դR��F]    �b�N�Z,*'@�Ffʹ�m����"�^������3����_tj����kC��MDב�j������6���!�Pd�]�b�lo�d�kb�=;]�-���6ٿq2߸�3b����^�v[<�H!i;���z:Y$���FWF�$C_�l��G/�v�����?�xR<����6u����5x���3���
�Υ/�D�Wԝ˦��c'� h�
y0���SC8�V�ѿ3m�r�y�2鈑�(�|��G�,�v:hϧ�3��Z֊0T?�C?j˞��3h��r���`�tg�Y��VۥԞL"��:�9��|WҢt����)�H�Ky>�fP��>�212H�gST{�#	�<��2���)����}��I���e}�#c(/	RG�썥��(y�=ྵ}�#�Ofm,�h)��(�{Fh#2B���f'd{�f�/碨�����#�Q(�H¾�z�^�����Dr�xvOe�3��JK<�N�l�F�ER�-������;�����HDh-L{� Z���N0��:b<1�(��cqh*D@����(8tU��}F�:�����H��ʆ�-�4xD8��<�FW�GB���7��A7��2=O�ͷ�We�hv��I�Ѧ��."�l���"�����zXF�����,��^"X�18"�+������ٻ����ɏZJ��JZ�b �X$�Ƌ�+5[nPo�01��X}S��l�fP�vP�
I@�z�9Z쵬��thӅ�r�`��%�e�X���ή�K�1B�����x�_n�ж��eO��jm��US��{�.a)�����.�f�u}(s=���E�5��^ /���~'-��d�����Օ�12ҕa_��1ʞ�;u_X��z���+��A�0�Ո�$hyRj��k�ΰ����Z/�؏�h��͖G�c-Ɩ�����oo�@�a�ΘBK�ɐ�ơ��c
j0^�=~ϟ
�H=�lCkg�u���^	��P/��,��L����[�
��LV�� ��pgn;�'��]|�r�e9B�K�3���#�����c��Wa�Ӕd�@)5@��r��舁�P|��]����޻h�妸���\n4W.�<g_I�6����'��>[-��U���B9��;R��~#�tu�(-��"�C��ս��2ʛ1�2W��1���/�탷��B���,��x�ʒ�V���_�*+U!pC���W3"��K'����n �0$U���iH�ÍG���[�iVR��,$��YI�[�M�}�"��1�O���}���NKm~�eLH�aa�<7&���݈l����]���/���hפ|�a,�@�q�ǌkf�����h#Cc&�ԦMV$�F��ƷaS��+6�M��Q�S����n��ChW��5��d�	�d�P�E.W���0���a�D��,c�Ll䇎�Ls\K���a̵�H��z�/l:���vj�и�x� �BQ�*e0ʚ|)�$z-����f�w�����,�B=�>)�5]HjE�����cGLMyXۚh��n�=��_���������SX��;��'Z<q2]��J��)cu��N"c�JP�	Y���Y޸?N<� ���v��̲#kf��⇸ί�^~�|0�9<�W8�� ��>rؖS?�hݣen�Ǒ�/og�̞�b�:�f��U�_���ó�궹�s�2Y^�P_c�(���8
�����O��
HQؚ��&EUf��Aq�(��OSP�����wy���>�֧�Cޓ����r�Fګ�ɖ\={ٚqB*-_���ASAX��<���#�,����G����[~�Ц;������пQ?E�Z�_�8$5Yw���~W��&���i���cjǕ�E&�H�ZPp� M��?K[Y7�jQ��8b(�0�e����xd�h 1T͈4�XpZ���۴��V%�a��>��Z��d�9td[<���*�"c-0E*2�:�9r?Y��D:�.��so�L�s�U,�X`���a��g1�.@:g��÷}D��i?�D��A�A}���8 "�.:(;����,X{�$0.ǔ��S���1,���n�M`�WD�}.)��H��P$r� �(>���s^|�gA�gK�c\��=�)w�I�c��L�/N�b�x��C���[�GB/ʪ��k�g9ta�_F�;�4&��X�gI�()�V)9c��r�� �.�:׎Ɛ�P�<�3���[/f�$r� ���Ahɗۢ����3�	b��Z
�N��tt��AX�L$��)�q�A�|�'�9����	��<��5Dĭ��:���u@�dG�S�-?(rlGO��%2A�n�4{��Y�C(
P�|n�r�d-�$�G�� �-R�[m��}����΋�?ˣ���e�;���c��ꍊ�S�7r�m� ���ȗoz�!�m�x�f���QmM_��cB��l7�\�]��G�^ؚv Q��=4f=eXC��v�,�7G�v�N�y �P�<�o.�oEi�;y��:ݭ�:P$	�Z�B��ɔ�./;�.v�e��������F���oP���"5y�_�JgP�Ȁ���K&�@���?��;����>u� ���hP��c.+k��XDA���s JV���y.;���v=m��Ү/)d��n.q��?�������$�(�����d8PA�E띀1B�|�,���C�Έ�Ϣ���:����� Q�����&�ֺ[F�TUf>����=�>�6�e��λTt���6�6�d�
ݭh������b%\t��顳���Ek�eFF����<ً�0���M�96���f�Ga'�=�"�_���{I���uuht�#�d������(���/V2t�CTV3������X��AQ`���������P�Zˊblv���z_�(t��0�o�9�5�V����c����"��8���$C�N����YSe��~n��������r�ϋ?��f���^�0��`���0���7�s��9R@��N�J� ��Dsw�����ŏ���Y�Y4�� J��L�BSR�҂�$P^��o������[����R��W8��Cy,�:� 5`�Z؂�Ps�a���=��cmR��}Ri�'���p�o��&��j����&+inj9�%E��]��N��&��f���C~#�lH8�:�R�yo�G�,�����W�絻B�ہW�j�9��S��V���V�l�=�l����k��o;ũ�ݚ�,h�M�Nj��>������q���i8M5����r;O��&Nk5\�Z��
Lt.�+�f���e�c'g��3�$���b����\1B�o��k'�{	$`��.j	$L^�pC�>���Z���DX�1eȩ�|�q}�㓌9^�} o�?�ۯyO*�[gJ���H	�:S�/�/8�+F���gvzj9�j�Rl]br�阃1m$�CIPv��SU�K8�L_�i����30R��}~�3(zE�m3�Ö�)�T3�E+�B�Ƞ&�~z�/�<t����Pn��^�Mr�Mw72�^j�)4�'Q���p򇪬�M���;Y�����0�f�K�Tj&d uh�(r m�b��'{cg�q��A#K&2j#���'��)���n�΃8�ecD}Z�A8tL�.��;�֐��W�!�%i��ʛ�iM;����6�����Z���,��̯���֌Ҍ��U$}�#!�Q����Shb����＋��s?���[�<䡙��J��A��!4	�e!Y����^�����L�^0OrHY �����[��̐ڮ��d�����dր�0Bw�F!��h��J�wI��i(�vI��i�՝A�����l�H�v�y������R8�"Cۣ��0�#{�R��ץO@�C�չ�?ߜ<E^�W��BT�]@E^=�u����{���d���;��Y�� ��2��!� |#YT��5��s�Ň�:KeǍ�w���jw�Z�����ƌ!��Gt8=z��PM��?����#�E�����Z�O�q\w1�}7�0�(�݁��]��j�lLA5[X    (���L;y<	���@��SZCM,�R�=�G��)�g���\>�]��w��Nϧ����g���`�2�H��q���z�w�n�z�*��#4��q�-�����q���4�P����)�o�����g\2,c�44��kJy���3Pr�]�Nz��1�V��Z<�F�N�;ĕ)tZ�t:j��Y��.-�v�ҵ�t[��C��G�x�=
{���J`D��z����ZI�8i�ճ�C[�2
XL�X�"�ڤ \�6���A����,��{1��f_0�S)K�4(Ľ"�I�����i������FMLXo��޽Q���Dv�k.�9�S7�����,7ʹ@/���n�B��'J�\���@1�QC���ͳ���X�/Ր�V:��[���@@����B�K/f���C��ֱ��g��KU�Z��j�5�櫔_0s�t��|�����.��l�]W�fhd6�Z�Ρ�����
��a���٤4T	� �8���Q��#�ޙb|>=�g�ήuBD"R��6�m.�⑐����K���Ǽ�i,���C��D�ҩ�?.o�9x:ǖH����9u�Z���.���߻Bx��h="ܘ��A��,�o�M�)d�u'�8�����a��,�W���N�w�]·��0�i������C��Y�P� Aoڷ�6��V�( .cy�P��Q�tܞA�"b���mGA@���ዤt�^L�������sy$g�I�&��N�cxDI�uo�@oK*��*���o#�����Ϧ�MVU�c�hˉ1C�1�)ں��Q�����7�1H�í�����'5?��A�Χ0	R�7�З�6�s_���!��
u�� �e�Q���aJ��6��9Wƃ,���������dhHa0y����{h�_oq�J�<�܈�F2Q#7���:�M��7�h�q�w'��ŷ	B+Ak�#\��#w�?����������������'H�����$�l��������0�|Vn��Ň�hG1E1�u��QD��<���(Cc�� ��V(��t������Mr1>XC��^ g�i�
F�
��tؾ�,���4�J�VY�Y#|�x��xh�N����l�(��q�:���c����Y4�P�$V?�J�ꮂ5|���v1�g��!]VA~�$췎�BRVB��ћ䦼<<��\����ܼ��]��Mơ姸�������rz���w��۾��1d�ˈ�E�L}����;�&F1̄�E~���	�ѱ�|ʁ�1�r�l+��Ȟ�-B�M��l�P1aG&hz������ľ/"!� ;aaF�rU��{��{S]J�0E���)�>�>��	�r2�v`2�C��r*�ݾ�S`h�:����o�/�T���e� ��(`T��$��o�?Gm�t��F�������2_�2-#���Y����mP�U*���[�>�9@z�͆<B(��G�&Gq�t��}�{~`k'c	�F5T4����|��B5Bj��=��@d�|!��HW������#GRhyqo�?���R����Po-ɵ����I�J��L��^��D�{%=�{��m34�T�d�8*{J6�G�(FJ���o?B��Wj���P2��a,�t�^֝�����:y
tm�S���<��+�#����3�����鴗,���
.�Q�X&-)�lF.�l�P�]s5f�X�(+~jsc��D�S@��L�C���}�������b��1,d��A����%=鄑#���v��ܞ�腴����?�m-QA4�W�n�Z�E1r@9���-�}٭9�,$Ɵ��5gI����c@�	Rw��u�ζ{�}e�¡CW3g�y���FO�=��)��&a�)z��6�������=%O�;>�w]6��ŭ$
� �z-���Y��F�)�W]�������j�P)�}UCvf�"�ȑ$hQ|y�JM�o�	��"��n��ԕ7�_�J
�<��l�՛�v�����]9�r*�ym ��3�:�����{��ۙ�l;�϶���q���Y�q6��m�[4D��w}��U���IU�>K����Tj��$4�#}Pa+����k��Ae(��?M���w��R�c���qi��ȡ�����>��1����������)X�~
���J�� �/d�����Q�QzIiɨuۛo�۸ȋ�r3!��
t~�i!4�1��V�Ch�̭��0V�9nT��;�o���� ������:��+W.��O&�����J��'�6��h1�h��=�\s�>��$� �7@ӝ�H���X�M����(e�gv0�q��p3�՝n.2W�hq�p_oon�e����Ƌr䥫��[N╩)��s�t�#h����7vZ���� �w�߽��,�-϶���,�h�Yk�l�!c:[�e�=�lG��t��t��́�V�ތ�"4�ڌ򿇳=Za�sx(vy���,M��O�Z�ݰ45�'��F�h��hz*����Ƚ&�^�|j����%++4q�U�A�B_��P�Ė�=Z4#�rqv:�z�Z��ZV�XT	le�R�����m#c�8
%����ܶ�R��@�M�����CP�;�O�2N_���s-3����4�����:�!V���MѦ��@��� �]5Yt��(b(�z� �,�����@��<`EF׻�Cy��Ő��~��K�JH$Χ����*��,��Q�5��� [�u�� ������Bls2Tco�h�pa���j��o�
ze���1\�YV����@d�P�E����, ��\#�ӧ�\s�����Ő�������k�6�*�g^H�UX�c�� ��ʏ��m�����8��!�3X�8�=��:���|e��]6pfϩ�Z�AU7k�"7 dP�����O ,���mQ`����p�.�h�ۨ}�E�|W@V3��m�=Q�T�%�^���jA���lG $(-v�wU܀�+�d�WKo����h�a�z`��Z��b�G=.�#XRt��X&�{X�?��+��:6�"��-�6��?��h������ ]揷G/�6ķ��)�G�M|�=ߦZ�~��r�%(3�3���G��fj�h�%���;[bC�u������+Gd�
����n(<��?��_J��'3��t]��L�h��ϛE��)����ێݡ�J��	�A��A��7�g�^_�Eh��rP�.��K�A�U�n�#���Fpu$��݆��)P|s�?��K`r'f�`m��r'v�~sа>=��y�q���j��q�Y��^�C%F!dd6y�����ײ��N���E*wb�o6'(�=�w4Y��DA ��zF(�ѭ�7�[�I�a'���BՌG�N'y-T=X��(�+�-꿞ζˏӥא�7Mq�	�eSN$��T�w���xᗫ�8�3ݎ��7����j� ���2̘����qT�o#�6*ϘQdh������۾N��̴�[f�\5�X +�����"�J���p_<6��;X{��P�\w'L�2r+J�1t�H-{�驸o9@re�m�^h�B�`�^HzY�;H
4�_�������Wƅ0�!M��a��#1�Q���?��Nl��W���n�ҁ�1C(��er_t�@b�-�E�/h���!A�������s�6�#������;.��"���0�-=f8)���f@	��-�"u�>�����ꮏ����^rw��t��S�f��j��GXmz����Ym�:��l[?c�1D��[~�)A*�m�>~ĹOt*΁))��r�U��Z�c����_s�z�߁�n��y:��}��.(���P��1��Q��]��(aY�[6��ʡ�>CǁV���f��G����i��]��?:�XY�L��Z�@R /���@X�7�ƃD�X���pST�o`�r�`
�ퟏ�7������&�O�f?�
�R`���G��'�B5�U�I��w�A��(˟n�r�x��`��[��ty ��盻HR���!Od~�)��Ά�jq{na&&�_����3����i��>?v�q�S��7h�c�
�c�1��RJYEv�����ڼa�(�4�j�    ���dhz(n�O���L#=eK	J驠T��yٰ�1�)��F����-0&԰�:�p�pc0˩����?��H�x����;�F4�N�q}(Q|����Qh~��Ë�m=bM��(aƐ� �����ҭD��~iE����]� xL��!��ǌ$��g��͇h�ˬ���X�������]��� [ '��Q�� ��#m�p����:�^�!��m}%�)�nu��({�����^�¾ġ��Q[�Ms2�md�8�J_����u��Ԉ�F�߶pC�`'�=��>\��tz6�)�ۻ�PRo��m��7�x�$7����R����^5j����̭JF&# l���͋��ݬ��F��J��`5�hQ�ٕz�N������p���Jraӿ�i�>\^���_�����e�c�W��m�j��̢�X��Z��T#�y-1���sy˿�-~�Zdic�d����,m�ځ��c�����R�����Jν�<kb�6,⡶��w��4t�t6f9�}�g:([@�1Єi�#����0C�1����%�y3H4O�z�Z�A>��4bRk�P�/�.{���.�mM!@�&���s��-��2�KrI�&��Q�^4	W���m�$.̜��H9ϑ�z�n��z�؀m]D8��:V$*�%w�w]�:��~�dt5`�L�ja̸7�vظ��{C����Rtv��C�/�!��\(��jUz9Xz�H_/�?�Q�����_��m�qM��[�nn�s���
),Z�!��R��f�V�-Ŗ���� �rդA�YĮ��������@�?|�}a�C��85c��ګ�;ɘ?0b�<��Av�^��͘�fz�%����9l7<�'d�K�f�i2W?s�V?.(B�ti��@��U��d�������@j,��}7�V�_�ߣ
F0�ʋ���&U������d|�R�9ͦI���	�ڥ��oo�zp%Q�P�h?]�P���l�Ե	IV��Vzr��nQ�yk�F/zmO��3F��	������L��ՋIl̙H�(��70�
Q��b�y�T���aw��b;��yDt����qo�h���-�Qj�[1��L|�U�J�p�� ���*Wԏ��D�|���.ɦs��==��<wU�j�;Y�s��+���>A+Qz�~ěb����1�f�U��>�F�wM��
M�5\���.��l�K�*)�B:�b����XU�T��`[�V/=E�oB:[�������	ڹu�.)�7Է6QY����0��0l�,����d���sn��a��['�?},����'E��)|`�R�k�t�Lt�"�COU�LV�¸���eK�x�s�ekE�u��G��O�M���^�ʁ�����	� ӷ��x���ϑ����l�,�$K?�놊��-���W���DS���q����h���Y�j4���Qf�jX���>�6w��� ������~�� {���-��.l�NK�փk���E]/Q<G��!�����Kk��%�cF)��k|�0�L��%ҹ��I�(�V�n�|��Wjcl0�ϢW���hU����I։���3����$���e�˗�E���(Dɧ�*���v��^�wsg��ڵ�n [I'ou� ���Ϫ�H�`_,�$����`L]��P��Wa�o`,��:�i��"�p���L���6O[k�#�����5�T�
�^%�)
n7�Ԅ�sצB0�]|�鼑*�%g����Z׎�|����c/���
���6V�f�$�����m�럽j,�ߦȐ��������,6���Ym�g��/�R4��������<�����|��<KnL<�!�8߿�4Vn���C��9���l�N�}��L$M�;琅޸�Rymi���W�t�~�b���]�U��M2��������0��p������0L�j���5z�wm���l������$߫7c�^�����\'���]z��q/ �ؼ3�"�����~ͻf;?���@�"I_�o��MU��Lifz6�"�� U��l:VE�K��Gcp5����t�i�fF:N!XU��|"�:�ap�:��3^ �4�oP���T�e�d��ɲg;��0���JZ���o����(tc�Yf�a�d���F��xHUC��X�ǎ��TX�؄��24��.Y������جfY��bY�*S�Y�$##}�
^��q���>�ˑz���B�VY�jv;��j��gKr��r]�JU��o�X�R����o�[���k�n���Űf������vL��x�bR}������U��"�6K·U�ur]sX÷2*}�U����V1c����i�-��ڣ����#��)��Qx =)��A�q[4k�Ͻ���i�Ng� �$�Mg1n"4�U�t�T��䩶	Ͳ�*�o\������l��U���� �P�[0�ީ.U�e��9�VAޡ�q����Y�0,m�S�Ϊu�4��ƪ ����wi��m�t�r0�S�T�*�M`��Q�A�!�M�O�} gt3M���p��M��{`6�����,���0��5MU=p�,g뛅u�b�Yd��U��}���
�Mv�M��;K'�nEf�,U��ˎ%���$h����U�� �5����V�U��̲ ��s:�1��A�F�獠7�p�!��X�&��r���.�iP�TQX?[Z~�Th�j�*�m�߈�[��U��>Y�@�ھK�iu�rinuZ�9�U���Q������2�+D?��i��A u��R�A m8���$ރJ�j�Ϫ~��n�A�٤X�g��ڕ�&����S�6o��/?B�RM�\�]*K���� ̺�Ư1�2}���1J��d|V�i6&	ܦ]�" M�$7�E֒&ѫ��2�V�igZEIYd�̴-Q��=�r��Xr�>�d��Kk�~�z�b�ʮ���.�\��u�[R�� ��T�,5da��.�/�;O�ɪsr��)x���8�`�h2˒�X�@�	.pz��~�iU�(Nbi<��Q*���f��ChE�`��7�f\ +0roOy��� 02����0�O'F�t�J���L�ꔦ���6-$�^[LF��*@sX� ��8�WR���[�z���fYK�a��ȯ�r�k~Ue,ޢ��K�S�
�ԝ*Q�`Zh��U��-L���X t�R2�Pш��|�CD#u2��M��Lgٺ�j��`��X�_?m�U�AU��#�?�K�TU�v
�B/�8�R���U����ڂ�?@�7[�J��d�6<�O�:���>M���5߰�05]SM���.�Oɶ�E��Yd4�0�b-�W���櫾t�H֤D9g]�&8�d��̆I�~
,b��&]�,�Q��G����Xې_[����=[5t�~�����e�~ࠩ���v�4�#1�R=ӻ����ә�u7���G���%�^3�Ϲ^3Q��v)�^����WyKs,:z	Jn�<Ȋ|���ݛ0��w��hD̄Y;�ۍ�/PRu���z+z�n��VZ�Ncm��F±/F
BX�ٯMf�{4�xw�s��u|��|5M��[���U1O��i�p��3_�G&�#}R�öx� 2��*|�7(�t@�,��0҆.��=�͓<Y�����c]�;�#ź���֞ݙ�8zZm��E^|n�B?ӎv��F�ۉ�8�������R�,���O��,���v��q`$��7q �%�V�����U��ľ�� DC��� �P^i����D��i�����%7�f�օj�w3�(ɒ�'��&pb�`��&�I���F�*Ay_���!D�KI�x+/���ǽ�8^��c��xۈ�в�4ۨG�����n��}�H�m:`���YۄV�z�E������&�ug<X�'G�<���P����\&|���Kq2��%�	5u���dj�Z�`��䙣G�+-_�Tl2P��d΍�=2�����}� B��R!7酪K�����4���[f�^ڣGQ�Ɏik�D�X�[�FFg��n�׊ O�T�L��>KUmϳ����9{���Lo���c���e�E|���%��    (�}�Y�y�%A� �dʔ������Q��lj��4�����~ I�n��y���nI6L�¹��bI
����B�X5�]*� *:c15T�6=��&�O@�h�����5�L��p����MD�Y8��^qS�o�3z �f��߫�㟳���{)��KN�4sH�y���ݯ�ͬ��c���G�;N���X%�}�#w�I���<�Q+<���x�ߗB�D���
�B��-f���+m�o�I}�v7��̓I:Ig궜N�U����ɑi'&����T�ui��3I�6YΪ���vTF5�v�C��vߪf��離���d��f�g<�������5�H�ȚR�ʫ��곧�<B�[N���b����C��?uK�l< iq\%y�Ǒ"ss�v-}�0oS���6�vX�i�C"�Kn{T&�]��i�l�]��-�~���c�I)�h:�n���G��ή�8����z;�T��>1R�}G�d��<�I)FPK[����{�(r�m�i�N�d��H���;�3��l`�&J�Y�v�D��6���2���@"�g���J�p�M�ؑ(��iK�� ��(hU
T�G�h�X���~��q��#=M�����z8P��m������bd�0��S��wM2�+M�8c����,�=����t9��ģ!�\
U�w�T�{)*�d��v^ԝ�¢�&m�O�r��C��S���4�g:>��~�Wd�FA����ܙ,�Da�u��?ٱ�r&c����$Y�|F@��kg����V?������U�]/�6����� Lxk���x�r�J��	���n�
ZQ �����z�W�M
M�5)��"��������z.Q��Z���FbW��K��?���v`�L��ry�Q9@�p��WW2X�5^4�Ͳ%���������4�ꩶ�TF�����J��BR����f���CI��5F���	B	I�N+��sS�X؃H��<��]G"E���veH���R&��9;�J� Fh��@����BFh5�����Z��	?����O`�f�K�k���g�;�, 6��"��La��b)S�z�
��A�ެ6]E;�)��<V���#�<�:@�+9J����!�4�k�*)+m�sv���u�%���xC���&g�x
t[���3�x���Ezb�f}M���a�h��~O���p@�&��*�I�G��O�Ƌb��إUL�.| �	�Ϣ��Jk3��s����mq��?�^Lw��dY�����x�����n��n0b8���	&��I{]��Hݒz��Ѹ��5���X.�|mf�]�$���0I�������t\L-���:��[][��)���G��\�������2F�́�6 �=�%���M�KG���}N�=�2��ō���qk�!{ϷO(r4�Mg�`�� չ�G�܀=���s��ٕQ�w`#�Rحò�}�?��9�٠�t�&��^����o&� 
�Q�&�9����̀(��R2�a!J�i���M?�A�Ǚ�N[A�+M�����[�t��n�<�B��o�@��ܮ��p,ힻ�(@��v�ש��(�mt��&H
%���Z��~���O8Rt7[.��
����V3���չ�Y���Υ�b!�P���UMr�nW#tMNh�]Mm �)�1���\]��lW$�4�A�� x�K(/��(k���7N�A&�^�Cڢ�&[�df\�O���E�
cg��vT(�>��Um�:�d����R&��T���IB-?w�ph�z;ӆq�d�ى��/ҚY�\�K�~�eڏ��y�\USZ=�P]va~ݐ<D�D���&��7���l%\���:J��v�S�) �h���E`���.jtC#f1��CC���s�*���0[�G�wߖa������1z��.v#�����&Q�P3-��ݷe�k�*u y+#� ��C�y��:<6>��
KO�@OŐC���M�����c?�2�߱a��:dpZB6l�u��h1��|��M{�h�ޝ{rF��2d��lW������g��E��a�qH=+Υ%�#��Q��|������a�>��t�~�q��9��-��kD��S�y>�O��LP��?iKL�У!g6��	C ��MN�wX�P�c�7��W�58���4+r�'��Q���t�cX��5l\PA��l ?��j�(4���Y�l��M��z�8/�j|��^Fزڌ��r�?ث�GP�m���[�`anã[�7$P>�Ȓ5��$i�PB�#�uU���@l�������w�^�=P�|�[�i���蚒N�Ս>AɪE�j!�7�puV�����4�Q��ÝZF$G��6�J�w*�]��ĘUwe�#hGC�~���O�� �<^^?N�S����ȱ�����p��?��Ք��;�x,�*Yma�͒���F�D�����K�(�?��Z���(Q�H���1!v����]F������r��/e��/��
%g4�-��R��QKnv�I�X�V����C�or)��S�O��[F9}���X��?�6�0�TH��w�Rb�b|�@Ru(����&!��?1���������?������N�)��3M:���Ck�7����Q~��P��'�w�)5-n��;FC���&C���JЗ��z�P�Y{����jg�%�z{N`�����bG݂�G`9��<��`{._^�=�Z��Ƴ�Oc�����O��X=�U���G��|,\�v����;�: FT���d��P�������uz�!LmF����S��;�R���	���գ&ga4:q�ӐӦr� ����T���|.����S�)]$ˍ���f�:��аE�%/��W=�/ .A��ק�Kpw8���Cc�jL�C7SwJmbV�P��R����!H���}J�ɧd���/�!*u����l�H� ���D4B�Rզ�������t��nH]��2������(��Ù�5F��S�t��+�_�;�GU�m�߬�̙4��a���2�/�����v>��ǲ���A��y�0�iF-�p�S�1d��~��Q�7�DD��)�Z��>��K�h2C��L�v�߂Uyy*�e�x<=:��Z��X�cJ���Ø��I��2j��.r��+a7rPȞ�O
��������zR��b3O��M�񻻨D�M�1���y{��ժ�Mz�?�Az.�w�~�W��_��<��r�@�
�q�9�R�T9�\_~�*���'�3i"il���e���{o�P��?�OO��|:<tRaِ�(��p�ٌZ?S�+`JQ�Gh������Gug�0 /�h�mB�p���1U�����^���6:u7B�{mt�����R8F���w�F��$K��:]Yr�{k�Ci�w�mM�x�_ O���*���i�Yo�������n_z��ߣ'�����F9J�\^����t}�:�Ǽ�G��������GUTs��?�G�\>���hO1(�X}����DWn`���$ѧ��A��i�~�}a��{,�j��>"u�_-�����{>=�������-F��X��9�����fB�#��� a�����s�����hKf�������Ey��S��elR#�L�Z��`K9~<U�t~,��tj�Y6����<����6#h�!�?|RՌ�����g�;�8y¢�Ůq`}"����(����}�����r�c���d3A��I�0��dYg��]��y����G����/��m��V��}l�z��f���)G��E�O�SC��:l�=1BD&�M=Ma������
��!�T>�7���7�h�+UDfM
�h�z���l��;m��#XApl1>T%J�<Yw��b- q~�plc��7̨�- 5����Y�֎W骪�#����Y#�$[�ӫW��,�q�U�y^M�.]$���H�P�����f@|%��K�>�|]^�G;����h�����F�*W�M�Mt�
#�4(>R�3nUCTl+[�l���{�XxD���f�a�$�����"O�t�m&����s�Cb\��&��3��ݑ%4{�}����!X]��z�Y�U@���ܞ)l����4�����&�h��6__    ��>�G�8�^�+
�:K��f&BK����HhԐ�|�U�|����e���z���Ji�هy�dXS��h�Ǎ�DY���i��&����:���������4j$�����$[���.?�1[���CY�yv���CC*���U��+���2v��918�0n�9b�?��({���M�� ��ݐ�.�P-����И7/�gpRUxf�¬4_v���JDT�����iǍc�����li�z���yƌ�2�w=>"��/=F�zx�E����4ȑ��p#���]D����(���tU�@�5(><�ȫ��9���k�,� �ju*lA��Z�*Y�?$U��Tד����r4���1�Puzc��1�L��$s`ɵ]�_w�D�Xݴo��B�5�q��V���x����9?��Z���� }��w�hbuI��h��픉;)sjL�"�Va�п�IЪXB���&碌rj/L���bi�����R
�Vc��ǿ�I���tx-������xB�dR�Տ=IvE�&�j}�Ydb�u3Y͉����3TU�No�x�z�|�΋�̸��X�!nG����MgS��y�ذů$��ͪ�o%+�ޠ��ɐ���d���-�5w]1j<V�P�fdwl��L��������������P�%����J�MB����
�d�m�$3%v�b�҄O�����\���aи��Up��k�G8�3�q��Zϐ��7�L�D�T�J���M%՚A���3�gp��B��׋tGo�q��m�^J� �E�eC8�Q�	�dC8�]{%�3o����Gr<���@�ə
���Q�~�U��u�s7v]�Tm�}ܤ����=ϐ�P�}V?���i���tI�uiN��[�å-�3F�4_��H��tU�qɘ��$Z��1N�vM��7[�h�ܐ��TUS�	�m����b%��|�:�|�0���Hxh�ZމX�~0E�Y�~g݉�F�΁��<� �7��y{�~G����,�5�d�6ﮬ<��G�u�{�N��B
X�M�6Έ����Xb��Ǯ4ͯכcu&��#H�Z��Z�f5����ޚ��ڃ�J��	n���~�8A�z��6�%��#v7Ed��f���͍���RU �SuR�Yڭ7��G�9\!3I�Y WϺ��h�ֳE�~��gu�t��tW�ߤGv��l%�!��l�2nlc�����l�7�L?%A��&�k3�t�8��ݵy�g'�!�lkL�M.��5Jbk��K�5ڸa�(���.�n��q��?J�G�ɐ6��|��i�.�O�|�y��/�l��8cf��IM��Uuy��K��%K=�쮂�2�z�v&��/���b�@}�jiK�h:1��R�4��w»�h��� �&I���d���.m�H�F�:V[��d�Bj�-�UH���,���?�?J�+)�4��S��xw�FE@}�95��$K��L�
2e��Y�а>0��9�����(���zs�f�}�!���hrn�u6X���P�c�R?���Z�����$�(����H[J��`
�VE��l�\�+x�9����M�
�y���_9GY�/�%�mg�qU��Is_Vo��c!�M���@{uc��|Z�5S.t-:!V8�ML��u(��v����O&t�z�6ZuB��<�}DR�N��z>�uzv~z��=����8�A�����a�x� I���<���4��U����)P�Za�����ڔ��I�t7��Aai�H�ڈ�v���\l�܎�?,�e܈R���`���+[h:�mg�D�h��o;�R�t�I�y6�^]����*��l�����1�]��bs�~�e��C�I�*C���5w��yFڐ'`������mֵ�M��&S�Tg|x2��z�E�ܨ��m*���%�dq��u]z�۩o�r��b>Sx�c^�f -�0K"c �!o�=;�9���Atc�g��;cZ��c�c�}����朳`������~3ˬөI#rN��G�!(^gix��Cd��m�S�p0����b��`aԢ����s��-�d�Ϟ唻���Y�)�/a��T�_�e�gO���&+�-�<���4���'�NG�3U�3� gF�P������Y��=Y�UU�S�Twi��!L��+c��q��G��)��c��F��o����YR�3��[�M�d����2F0��j.m�s�U��ڃ��:��ڃ|����!e(Kn�e̋]r�,�Պ�t�Y�T_��[|ȅn�����-~�0o��r4�2P?MC�J�i�6�cՋR�`"���?��z@J|�T�O�L�����ni팈��(�\5Q�P�cҸH[�*�/ ��,�y�j�|��������O���\!I��OI=%�N`>��~-#�
ll�����jL[AV��J��N5�:��Ţ02=�����ӄ�;��P�;�C�k<	��f�J��%��W1}�:�O`��?���c���)J�H���s�\n�h:�n�-&ݥ��d��F6RY���8�&�7�~����}g�:�H�el�̪=3���Q�`��<Ux�hӻ;�Q s´ ^�N�@6��z��vA�%��;���L�9p�Z�S�ܸ2t"j��q�"���P^b�Q��7Yw��Š����W��]�>n�9�vA�GS�~��#�2n�h+�hE�l�6z,U�tS䪢�ؖ�+�%�Whd�$:�0j��{��S�����N�� y�r�P�_����C���Zשo�~�yޭ�9q�;qF�arJ�R4�?�e���$Y�Cu>�k�ΨY�R{^���F�#ES=gN�]�5H�,��DT��-��5�������A��7� OV�l	��ܰ��k����4����+^{Qə=�1�'����T��I����[=�u�D��O�A	J%��[Uh�����o��/�U�[������C��6]��<���`�.Sx��<���I:{��b��I��P���8�@�ӑ�]�v^t�V���p�"��*�(������y=)4J�]7+M� ��+M���#J���z�~�d[�_��|Fg�b$�9�XKL=j���<�F����k���3���¸��W�%�g�����[n�F]�����Ҫ�p���/���i��l��)�ɐs�F��2䚄��`=��ޥ���c�M�r����>�l.�4��i�~X��Nƣ�ɓ�ft���t��`!ke��.�^S��S?/v:b
��݉�THSH�V!%t�T?S>R(G�;4ȋ-p��I�F�F�4521S��"�Sr���g-�s��rYrZ��-��뽈�J�9�gi�R����y\"(1㒈��%�?KQ�U0i�SKu��LhjK[�ϭ ����3�)�(O��WI��*Y6��a�-�r���h�敂q[dw�lv���<@%f�c��o�����WmS�X��n���^N�V�c�F�Dh�+W,�x� ��4�W�Ql�l�$�J`۰�񌻏����(�������]�R�9���£�]*y_{F���W= P��;���#@��:�ד���NL@�$�M8��g3r����܀�$���I�܎�{T<����7)�������5n�gP׎N�Ҭ7��*����E�tL�H�v��@W��B)a3����$��U!t�(d�$�� ca���c�IƉkK�;=m۽ ���W����w�w��n��|����u#t}�?�l���),��_3��%����q�u�|�Q�l���Smk������&�h*W=W�`f�lr�kE���F(�*tڬ�m�c&����ujT;��W��w�RW⚹�S�ԫ֓9�y$��Y��x1'��+����7��]92���'�����rF�����*/��\̳���b�K���^�[�-�fYFRG���x7&*��Aɐ�^x�A�����À9��z�`J���/����֛�&���{M�q��1������2�8qe�ORE�l�{�F�6ʃQ3�g5���c�_b9�)�M=��g;� ��i#�( n�
ܨ��?t~?RP	�m��0O�?�gO��< �O��`�ڎM�@j�H�(���`wI��B��,oW��:�\��E�!�O    �P#m��uN��k֘�=�Oް��7��Xo���PgC��:�B3��e�:8�f�x�x��\��SH����n�D܁�L�>���ſ�A�<�vW"F���#��Z�rl��/Њ20z�Jx��;A�c��Wo�h�H��6N#ER5M����1���R�E�cr���:&nS3H�A�Y�Y�| �0H��3j�	c�:��%p�)���3��;H��3��2�I����\��]������B ��Ϋ�s��v[GDNG!1�:Ҋ�W�� ���J!�e�~�y�� k%�h0a\� u:n�>��i�hFhz�~�e_���wg� �Q*Ѱ!�\�����$�6k���^�ɠdr�$�,��S�F	7K%���.#��!pd��%�muF��,�Į��P�R0�!q���i��A�+��f,�y�V��iA���l�D�[�t�
��e2�U�AɊL�6����xm<�`?R4����[���+�L�Cb�*q�i�76I"D�f�����g�ihc�y��KKk�U~��n��b3;���Xx&��Q�l���FQE2�Ha�H�$�����x8(̆����v�M��;E�;Yv��Y�;�.���p"-���xF(��Ť�rRK�q�6�X �@l������$��O{߹p_n21�f�I��k��^�h:# �8�ƦM�@���+~�X�{�]�K���-v^©޽�%a���ߚ�H��<�ݞ��O�����]��C�'��.X~J��_�bt(�B��e��q��_h�ϯ!�ԬV�J�,6�����^,?���M@p�dL���F)���6�5/@ם�*&�_�q�L���*�W�X�/�������Hb4���?0e.� K�I�F�j�Y6�@�����f�B@U���$洪ê����3j��E�K}������y[�Tj��`Y�>�=�<v�B��c�[�e�#2ҧ�/����ݖ�Qh�Lm�u�"�����
�)X9t��� ��CcEZ
%���^=�@r�@]��}�V���ڄ��0�j����<1�'u����a�(֩ՀMw��8���]�ן���r����L1X�a��5�)�Bh�J������&.y��ĥ.���]�R�뢝刵O�/�B��B���z܅�_M��<Y�+�)�f�M�o�ݧM���~�\�c��Ы_%�2]C<�M��-ho����۾3R����������NS��Pݫ�t�P�2ijt���H�D�F�J�_x�~���6S���_�2_W��ĴI#$���U��6RLc��zX�!.cA+�-�\[��'C�6�o�D!���:�)��LG��G
#�W�X�,{� MLuI�412  �l��%M �0���~�*Pr������9X�~�C�X���o�n��`�[��2�@�:�Z=UL��T`�ya�^uq��>O�Nh���������	-�?[��=q��%��ݓP�������S����Ï��И��!	q�4rL퐤Y���[}n�OHb������`v9����t,�E�;���2b�~��؉����OD	Z]����/��U�Q��r��TUm���݈a�hZޗ�/A~��\�'�Rc재Bb)��nE;9u���!��z|~���ӕK���KRZ��k�W�c_�������r���<c2N�:�7na�e߹�َD����yy>�P>[%-#F��a-C��#�q������y"9�J>�<Kn��^�I�C�5	�U��5�Q(�<����-���9Qbl�Jj��j_�H��Q�������ꍴ%�3�[230�Q1�o5�<��w���/�'���O��;����ךh?8$�+1�%�o�Q�7������w(I��l�o������鱄�{}9=5i�N�t[\{�0m�_O�����7NU�}<��������!��
~R}]�q���2wZ���l��n�D�",Խ�$/m�@���f�Ў��a�n.GuE�m�ˎ��h,����&ې��H����˷`Q>�Z5S9S��[�:�ؖA�S"G%G��|��|�<=��I2�'GҰ��I��b�?���o�F|X��/��NQ�iFH��׭
���\��O�} Q'�tZ�XH ����2�&����$��#��[UM>]�;�Aي1�c���v+��}5�	I�z��ß��p_�(_����G�݁��p�`���-���C�J��<~/������S�C�$�ko������ٌм|�W�j����G���w����D��a��">��5bDcP^�:d��\zcc�A¸���
L��#� �`�xz:��k�� b��k�l(��;b$9��p>����
���52@�N��#-��$ÌK�����{��w���1���!����{�|K�</��S�._�<)�}�C[;��H�W��
J��(D�?���Q�X��ތ�7g!o2t��~F�!F����� 1*{o�<VUyc��V3#�Q�:�$>�j�����!�����\R!	�h���N��(F&E���\]��s�&骊&  �q��bM@h�؈��WIEhR>�aXk�·ӱ��1+�22_yˬ�����[FF����#A�~�9���_�L
�>Đ)���;8��L9��x�t�X�	D��{���%��M���\ݒ�Z�=>�d'��#FR���_'uG��g���ri?�ع"g�e>�7�;�6b %��|�������������F@a9^$�%/���P�wR�4���!�1ƙ�$�]��/�����TokV>��G\n��W��t5�&Z���v�f��>���O#Ɛ����^;?�����F�+፩��ϗ���g_O�Dݒ��y��4Eș�ǈ��^3�&�7�1�J_��h�6�α����l�F�^��P^zM�IQvΨ�@6E����xb�H���f�K� A�*����9R���і�3�z{ޭ^�&�O�!�����<K�ݑ�0��ђDm�th���I��9#�Q�d:�a6���·�Z"j,I:��5�}N�Y�Um���y~��zp�,��_X� ��xQd!����d��n�
�%�juN�6�%��.�4}���6^+�|�#��u�Z�CؽD��0�c�c����JV�e�hK���u7^�بy�.R��1�'6j��W��0bLUۣ�T��X�A��];��Xe��UE���h W+G� �ЬH��}�6��A����EC�TJ��|�Z�,#�opGg��u�意Ӣ��'
�=�fL�}2|��!� �y��F�=D��5u���UegO�I��d2-���M�i������(Da�(��!k�#��B�z�~\�p� +�T�מ-�>b(%
�E���7�ń���8D�`[�w���<D�۞�62���4؃�=�ζ�EM�t��ڢ	��M�$���	S�~���vq���a4�OQee�!/ͻS�/]Vf#�����7xt�����U��D2��ujNdL���G%U'2]��{�&6�]��Ф�!��.ljc?�3���,��>�MH��Z+ ��8���yG�c���u���M���c����sj��G^�5��֪�i� R�q�.(z �����z��C��,�|MO���٥w)���&��n�L�A��<gF��p{,�?��vp1���In�|@���Im��8e�X5�eW7<�-��Op��g���Z�{�	��m�oX�����S$E���즘yq�&;(�k�d=Nw^�E�h$���Y��^���\N��_5ږӱ���T����z�C��ϪJ�Ӎ*�թ�-ֻd�v����e�$k䷚
�pIV%G�2ͯw>>AK��f�`��F�A7�F���FF���jd�Xa��G���"Gy�H&Ū���ۇ�����lh��v?"F��6�a2Ls�] �8�r4nL~k����	�P��`z��d�øxy��m-h]���l��9��Fg.8J:�K�����q��v?�M�Z^�ߡ(K��,�m
��j�dw�.�b��	�w�1�-�
? U�� �Q�(���=|��v�(�B���(�
��N8���x��!�����]������lL�U���ݳ^ƻI�rua    4�u�e�u]a��%A�:�����<��e:��r	Y�vt���E�q�C,��{]�K�V�\��� �,g�M	s��)i�����f�
u6�Ϫ�L���z�J����Y�&x��REuu(��]�����ḙŷv}1F%U��{���t@�@���u��u��UmPݕ���w*1�@v�P���W�v�����ͬRs�2���OS�@����2J������X
��J#�`���o�D��T*P�Õ�~���fisd��+s47��jfpT�Tt�^�{٤���Z:-w�J��&���ڌ+u�h�v��suB@�M2�΋�F���*2����s u];s�&kE��1�D�Շ������ZO�<� L'wpH8�ጭ'���IՓ��?�N��]
��-xGd��Yo*�w�<�6��\=IG$�8U�C��N�	JV���n��.�Q�f�D�;k'!�AkXmaE��,�~�a�Ihk�ƻW�W�CA�Ѽuuuި��6���M�f�=�v<p��J��T����T�
M5e�9�Z����(aV͇�|m=}�U4I��&�**��k0&������B���6���{�\���i[��oC8����`��|�T}j�_��:)˯��o����djhU#�ϴf�5�K!�uta� �`&�����#����=�ުk^�ky2Bd1�~?w��K�_�m�8 �����}G4����z�2�Mn�=��w���/Aɗˋ6.3������u��А�G�so�$��:�����Y;3������*�쇨�,�Q��~�����+��;ƌf�)gu0��>�qh$(������$5�C�w�_yf���������}��D$O�[�S����3��2W���}>������g�P��aT�V8���n�i1^R�ITg����+@u祾0!�;WK���W�jI�3i:�ANQc�P�������<�\S�׆����9SL}ۚ�ٜ�����ʔhR���:�Ð=\��#Ŗ�����3�G��eV��=#R��G΋K*��1��ť�8b�B8@�����d;wWW�֎'l�6���L���_��&1����T�����բдD��i�6,�
U�>��D�vV���u�0�����|��j�HF(��I2���&X�93���6�܏��Ip��v�(&�}�:�z]�nGG=)�Aa\	~I�=d�9f ��p�/g�J���s;��^}׍�"l�2���G�7=ܫ"�����8�б5)[�?��Q�O�f�!��1�)�*�+�.?N=���ٙ���h{��zե�_�TM���͒1&��eeXm-X3U�r�Q���#�ʇ�n�W4�Ո�63��j�c��Ѿ�?���(�uL�Ԥ=3-�%�36�C���T�C-*�9f<	�˧�s��-�E��Wk���E�!}��HQ�rz�4���P{���8ffd�S��!Ę1c�#i�Lˣt���Z��X�Ek��7Ľ46+��r,Ϫ
ZL���g@�%&0n-!�0�۷bM����v�8��Iĭ/H�T�.t��#Gۇ׳:����l�'��IL�,�YP��<����aoА5�gĮm^�*�����e%V3su�\1ƅ%"��]���OH�{�c%�J���nanL%x��-B�F��=?Q���!X\^�5�h9[mg�`2˓�<��5,�+���ĚNd1�
OK�������f��}���n�����IhL���S�%��h�ƌi����z� �5��-�>���l��������3��r�( �fR�&�IcR*�;M���a��?�J�m�Ab�ή�T���|�v��{��hs�����?��/�
�Ȱ���p'��������*�W����&f�Cbk���C,c���=�����VcƓæ�|~.�&��/� �X�V��,��^��oP
�� 18���T<H��W�F�C�ي
i�J�q�җ2H��O����a�nMlE7(�[�6I� ^��A��{���8���� ���y�Ͻh�r���MeK����c�Q�&�D)D��}a9�C��������m���)&�RPvyy���y�hD�W��1C� ��ҴQ���F�t�Q1.,�U���9�^�e���sw�n�K�;��Z��e[���7�A�vFmɹ�<���1�L3b��ቯg���|����2X�/������tk!龪�LZ��lV�����r�<�y�{����-�n��Ɲ/N&B��`m�];�y]\
T�߂k�c:�����ؒe@��@�zei�����)���������� �U_9��#]����E16�{�e`(�~�X�V�㟗�z�A4%Ι�)	7Tרah�L3�̀�L���e���X9>��?������L�+�Wx4��<{+5�/�aW�(&ph�K�ߨ�/����aMO�C�+�χ�C/��;?>�Ǧ�k0i���y��Gh_���2��+��cce����>��p<t����v>�������i{��`%�?���:·���}[���q6i����h2����β���d�r���M����'d¹%ܛ[J���SB(��s��0*�^!è�,WE�M������Z��e������+0�__;�^�'9��T�n�)�����>^�6�mo4rl%�eip�����nQxHاz�u�/�6��<���,ﶗ7�<T�6K��Mח�����2��\"���7,q�̒N�Eot<`/��>��޼P�����,K�����N�9��4촙 ��9E�]lӥ�;�\�r�w�1����}��t:���{�
�ei�Nz!����\I����j����I��7.7�1�T�"� @3Lr�"�W�aR�k����wh2��f�Ո!kY�YѪ�M�p��q���c~�d=�*u���Ql7l�%��=�J�t��b	y��D���4& z`�A��X�&�~��󸡅�e����fR,�J�/Oɣ�]o�L���Ǎ��:�M'A^�;t��_��{�ꅛzݍ�^E{��9��-J�iw^+[�H0�>�U����q�HT�~gB����]N��w��FN�?"�v�HR��4��M׫���.	�zM�q��@B� ��blUW��l��+��;���i�5\��j�O@cu[f��
���Y+P8/�y����o�jc��c��y\͋,����ڜE���R@܈>�i�`r4y8��<��x9_�_� ��ve�d��UGuuD���l֪�\�p��>P�u9�I,��w�Qg�1��=r@%J&�bd�\U��l���@�;�SuD�K��sv������S��I,2���:�Lݍ�ʙ"+#Z�L���b��y6Q�`���9�G�$:��G�h	�wXw|9��6��.���;D�㔥Yr��t�s�W<rD)҃�VMo���s��,N$��>��NVd=-�}.sv?�v�.k��h�7Dc�,�`U�~ڭ��7q�Qm�����2�!ou܀2�M��ͮ������M�Xuo�o����Y	*yM��"�]��}����M�:� ���(�'Y��FA��K��7o�\�T ?�8�_hy�j�4_&��s���m���L�Н�h���p�����o��G�6�}�>��vZ�T�����#d#�uI��H�h�t�ciuZ��|���ICR?D;ձ�$��|~�N�&�)[[8\i��]gR������T�P�&���[�^s\R��1$��iD�'���[��{�y�����X�u��PJ�0�X��}�!�aߣ�o��7h}�ܥ����^� &4�'Ǽ���{�LU��{2['� ��]����fČ�1�C�����\#G��u��U��<̇�x>�f�d�b�˴GT�l3W'}J�Ů23:��`^D�cCa��Zv��9�-�Ͽ�k�?*g�'��)����y��T���_�K�D}�P��K#�ʓ�׼2�k*Ox��K�M��I
�n�*$A8z�2��� �|�{>���I��n�y �|�[��=ϒ��UG��I�E&���'y_nb`թ�lڮܙ��3�&�&T��Pm������"n�u2��	    �:���t&�z�I���R��������G�>��A;L��l��~����d�*�jOi���栂����=��tUd������e:���p��:`��l<���5�	���8�	��Su0UNA�~��A��7P΋I0InRuxUŜE�������������*�w��ؐKbC
� �N���L�Oh
�/�7P;a'`À)5�8��U��KH����W��wy6���ݑt�g*BjH�2��d2�M�1rbo�TOr����x_>+�z�n!�^!���Ȧ��W�$u^D�)�/P1Z�$O��\�HG���e�0������zĤ���w�^aIP~�z8O֛��I����FV������l������"�u�ڑ%Ls�՝��e�Ⱥ�����j�` �f+yx]FhRޟ/&B�.���.]���|�b�<��Y���@~=��ڵ�������:[���U(S�'���T�;F�%�S��(�_ �v���t�#��k8i�:2��O�i�*��d:��|,[z�h�Ν��VG�%��զPr��<C���	®��*�+d�f3&X�3��l2x� �ͯ1�J~�)��r�o���)4���Pז�z�( i�R�쪥�O���o���A^~)�J��L� OV`2��p��	J�<.6�:�f�a�6�Ɩ����޲ýN��n�|�0)��R��԰�	�_Pb��oߝڝ�|JMv�-�Wr�U9o?�Z�ѳU�Q��G]t��<�G�n��k�Vp��(��]�a>I!��~�bY�o�D��7��p�oEMm5����w�F����/��z��O/�3��V���c��MCPTR��2��ǟ{��c,�����1��u=ql�!/SPU�+� ���O�}��)C���/|<w��C�\�=]aU���M������=�u]�y���Ѥ|��L�/��So%/�e�8����<���)�OokaU1 |U��Y������l������^�`�NP�O	Ӧß����1���/=K��s�f��O	�u�1��!*�(�+P�%��B�Q�����B��߮F̅.������!m4��A�Q~P%T�Ψ��_Q��(O�=������Xgy`㐺q
m/u$�~�
;���I�w3W�75g�^���z�����
��'������'=~�C�/,#4-�ϐ�����dA�{qD�t�b���ʩ�_y���S�$ǿ.��wu�s�j&#�,ĕJ�j�쐽������|0��|9[��>���/&�����z����0m�ϋa^7��1����V�J�ևR}���M*��KZF�,�e�VFSyj"��~a*���I���·�k'W���2(��H�eț��^A�(�}]�e��9�b}:u�Qe��v~����˹||�5]+X&z��4��DU�IڙG�L���/ep{y:�G��S��j�}bg�ܽ��^$X,յ��f7~�J���Wy��U�C�5��7��f�n��i�����w�3f�*�։I8�R��U�g?"����yy��W,ԫ�0D�6tm�9�ւM![+�l>�׈2t��T�Q����C��rx:����X�V)r�Tg��D��TU��Q���vS�z�N����iS��84�[
iS��������=�jv�d��,�eZ�R�n<�Dlk�&?���+���O���+�۬7�f�1��Ayh��0��C��v�J����eޗ_/��+%m��<d����+(q�6A9����_Pb4{�%~��Xv������ h��h��x��(A����>�����k����u����L��^,�S�����ɨ�ѕ �R��j��
����X���$�C0#�-_�3(<Uk�.�Yλ��"�/��:,	ʦ�Mi��,-f��z7��i������҉��bU�F�p����WU�ߟ�%�
J��$>��*͍Y���J?yl|�@rSK?ɕ��=ꛟd���׃�_!�|�\�!@����e����|�+3���Je�!�h���1����9X���㗆�Kk.�#uW�r��Ն�=�џa�>^χ�1�>��յL��U⿈����ǡ �➼���1��·`{><��ײ�h�CД:��!�m*$q�~��_�Nq���� 0,�jA\��p<"V#�n���b c�}�v���F�
����Ms�;5hWG���;�j�7�%�*U�v��g���V��]sΉ�g\�q�V��%~�n�~Bt���
4;��6��Mn3���a֡�Uູ{�~���'D8����G��ԑ�
�ydˢ�1V`V��+��!r���E��mU�[�n�o�oE�{�*C�?���2��"R����5&u�F(�l�B\9�}8��.�h�=<L��q�{x̆LsBXZ]^��h��*���vm&���:P�*Q^Y��.vu=������� ��¯Uq���\�m�+��l=նs&sܝ[ȵ�d�7��p�
�'D�nʭ���8����6��}��WՅ�j⁖�,�D�5Y�/a&Z/���X�o$�z�/�Ѵw�Bg�+t����y�3c	�I[a��hyv����Xy��՚��p�Բ"䭐�_��jB����mj�t�WLĚ3g�k��vb��2H~\������U;����V���:���M�/s�r�>?<ݗAv���C��������'����രdq,���P��� k�܄���|��,[��i�D�a�V��n���}9��b�;+᎝��pGF��M����Ny�c�O�yݕO�Vh,C�r�3C�q�}z����.De�b%�g?_�������X:sZ�n�\�
n��5����x�/V/���2X��˧��ͻ�71;��|��$�� dI��\�������S���$s�}	��jI�I7�5��S��КwQ�~�)k�:�� �]�N�Ϙ�K"����Z���V�#��tU�R`Ӹ�'�J�Md�k$�[�����*K�춳E��ַ�k�QgY7�E粆T�"�2������u9�
H�-a<H��j����n��<ѿ��D��������Ѫ�W�|��7
5��rt�pc��rt�ҕ�;ہ�I�4������)@��p����|���j{�	L���.bBk��u�?�J0���|><�\[%|���UĭY�Tږ�/(F�oߔ�u��V=Iy��YijRឝ*"]���T�QkB؏��[�S���(��u��Zr��qE�Q-\�z�������I=C�h�z�tR����- ��@R��� /��گ�U��B�JN��'�?HF�]y-����Y�]�*��G�"�0�зS�]���cx��n�PYc��v3Cb!���+�&@d,��G��ך�t��Qs�;T��ffo�T�M��)��%���I�c�yd��@�֊9�4����S@(�ED���O_\��C���u\��X�Kk$$����)� T��_`X�7/ɤX�����]�D58�OQ]mߔ�7)�[�?�خ�`Bd�c�f�C&��h��hO2�ţ���'01Zi;a0]#�U�N������t���(�׏v?�Y�#-12���kB�?R��/��ج7b�vFuZ��	e�d|-���H�}>���+!�V�J�7W#7zH�b;2E
c�+O����\>�7��jK�ǧ{¡�~�����*,����S`�Ld�봒8���}���<lU���H���,ƀt�Ë�R���f��c�N�	i��,ƭ��o�A��TXV��E{�����U��Sbh|�*��e�����Q�����!+.?<�qz:��M�d�և��9y�	ʌ}h�p�]P�9���:��*?<����L��� �X�S���Ψ�m����l�-���?��Z)����#q�qaJN�]r�%�"���ｫ8�]��h�.���,���R49}?����T�漣��G�6D�_#�u\{����ݘ�ztqFv��?��幽�����r@^�jV��^��������?��q*��Z�����TS1a������
,�N/�{MkS�����o�����'�-� �����i�)����u�&�͐�_;Gw�K    �-�F�Y��>��4l��{�� ���p���R��ɂ\�`��7dA�s ��β?����į��cK�_g�s&������9<@]gn��T������I��mO!(��~m@!(ZFY�����]�H�_�X�-q��$[duG/��B��Yo�	;�zk�l�k�W�1iE���<��U��n�Kb��.͙W	
n�S0i��Ӎ��9��̼2O�ó�P���/��q�3F������[k�sI�hD����m�d7&��ͣ͛��洽ג�@�����d周3�P���}(��Vow��!���9J�����|-�+�A�ӳu�)y�㡘T��P����W6	��Dm��&�I@s6BPZ���R�S��-,�t�Y�$�����iWz�S,����ݑ���Q�T���&��*h��p椋W{�����'>�i��Ջx�$7E�i=`
,��zZ�)p����Iz�%F�{�g��~�>�z�{��o�
���N�0iT����z�*��R�Ǎ*Afkq9�s�z�M�ݭ��x�Sk�XM��P�'E����Q�s;!�r�8�RZ)
n�e?��70#�?B��~�:S7�LZg&l
xoߙ`�O:���˗�1P/�k��g���nl&;�Ch�L
S�cKs�X�W��^A��my0{gzH��"Ƣ�T��-���FG^ɑz֏�� +��+ko�j�U��6>��\�s��b�NaJ�����������I;���:b�Z�X�VԸ6��Z088^�gX����\>^�]5@ [����rL�I�C=Q��)X������S<�[,qLMM���}FUq�_�Z�t���0�<S�g�"ᨷ�|��j�H�~�<���T�9`�U^�q{��Z#������#tp��/#BB�HeոA�д|:����yv"u��koM��������I6�����,�U]��#���M��K�B8p?���'�4��ܢǱݱaҴ��;t���h�������GT�)3��v3Bc����ÔJ���@�����52Ѥ�D3�Q�$i)V"�q��VM��|�q�R�>o�N��ƈV�<M]���;y�F��(;�뫹-O���zz��e����C�ꖌ��P8�u4nH1J���Y��
tWՊ���
"^�^�azu<	Z4����Us�ؙU�T�h-��0n4���M��9�x��d�
�0i�T��3B����2X����o����%+��L�@��0b�bt28E������ ���󡻹0��M!i��!�Y�[Hz�U*�+}�k�É�zu�r�	�^��k�#Gӗ�@�c�W�m���o���Uc�[�����Dz7�e��LO�c'*7$� &�X�m����!�L	Js0ۤ �Hww-UfZ2�lܵ�p!ը��!����������1�6�}�:�	u4��$�
�z}��rE߶w�_;q6%�X�&uIu^�I���t��;����Z��8�pB%���D�V��@k�qcJѪ|y}8��rxDۙ��o�<Mֵ�4Zi'�����Q�m{\�&)XO�/;�$�"S?xӾ�!�@ƘN��܊+���z����^A�S^^�_��!&�ι������$�o@Y�������\��mU���Xbl/WsCv�Fd�Z�OI�j�����)�����r�ҷx�x �&6�X��a�kٲ�2��+h��/��w����v�8�&:�[pv&�� �ː)mٖ�%Y;�s�úDSbE;������u�`hDw�ʪ\�����|�Ar���P<�Z����j�v6�Ͳ�մjM�Lo�
�H݈�{/Tyo)�-�H�KSu��*���ɭl�sZ���~"�R;Xץ�B���X��'`�,U=jMa�ې��i�JC��i0���t�9�/����z:��!k�?�x�?�q�M'��5���b����LU��w�R�_��c���-{�z2�z#c�í१^p�X�h������r�S�	�k�WZ�] 5[�	�O`&h���Oص�W~�,1]�v�Mx:���'��\P�2hL�%��o^�0���ѫ.��挾�z*/�&C����5�9�6΃�XX�#����(r��6?ޟ$k���	SV�������FS�3���]�\g��z�ڒK��ĮBA��3�:+�͐�
Q����w����t�'��Ī�q��$|����v������ǰ��'��&��Ǳ�zQ�;!u��I�
��B}�Rg@�)�e����
o��F��{�1h4#�t|;�����i:��f����]<"̾C���˩=4�1z,r�e�j~=_�3كi#>8�M�;+4�F0��չ�z��\�GX�B����O��o�OHR4��τ��֐�ڸT�5�m��9Z��<2t�����b}��(��̞�䫕�Þ^|����GY|��Op���<7Od�m'�͏���I7��	�>�)ԣ�#�|}�mK䎦�5���=���E������c�E�-��mb5�ՙ�
#��QH[������[��tͲ��[9�!��
2x���4��_��k���٥�s8C�*+�f�>ʉ�>h4#4��,�m&�R���$c٦��H���1�֨.�5� ��/Xcp|��m��87Xh���i�4о��A��h�A�-��c�Q/r'��J�W�u��'ӫ�c�*�Ӊǡ.�]��<�;�v��R�)�In����U�����'��¡�U��'�i��l�!u2g�tܧ�c��Ld�k�ē$6pj�|����;h89J�Y^�a�~3���_���t�z���Y�ݎ�'0�IK^w�z���n�u��T$���R��I��V�{фi̬�A{��D�R���ϣ���V�R��|a�#��bM=�{�Ƞ�$e���Y��ũ#�vg2jwg�e�1u�����䐋~�8y�װ:U�HR1�<�3��2����1�IլCߡ�Ύ	0>�^7��._r�0M���L��O���~R��8�K��a�2��eFx��I0�%<g���\g�?ÿ��x�ֻ]��tPV2;�k~;�п�잽D ��AN���}�}�CQ&#G5�y��`nÑφrй�G^��O��y-�׳b������o�q{Z��N����QB��Jz\q�ۍ<d]Ҋ��z(/iE�n=��N�3�n�*� 5���i���5�:9��jb
��(�- ��Y;�%oT)M���J`<3B��O=�2�O���@g�^�\0�¢��M�i_8h�#W�Y��jCX�T�*#cBu��c.�dO�xbV���ڲ�44�>R��ҌjbLd�~ҌBի�]�?A�7�,���uA�1DkL�*(+�)���/W���V����2�[3���R3RHR'S&^��M��Y~�ϝ�:�Q
�6|6���"����<��������v}��J)�A,��;dU�cĐ��DLs��K	�tf���1��!�w]N��HKt�e�>� ��]߭�WUm隆�j!c�wc��|�-#���2������k��b�聵Y]�+�z���-���Uu:��ռ����$Mn&A����UD��:��c�H
�Cw��~xw=����T�7!}�Kf�~�rUO���9~��*2�"�a!��!�4T���L�[��\�*^�G���F[Pb�$-{��e�����鿗���M�жÆa��f���4�@�wPȠѴ�����L�Y��^b'�N�U���}c$�X�Rr�jy�����8�%�sY[mP�U�I��,���T����`v<��{�W"lb'o$��hʻ{cȑ�;G�U�x܇̨*�������/fLP�˂t�g;�i]�7��K\�{¹N�0PO�8��{�P�sj����|��n�N;@H#t�ٟ����x�Χ�׹�A}�h}��#nD��~��\p�'Gu���U������g�y�fP���qn{�6t��zCD,1�9`���ݩ_�&�s�z��]��!��0,4�y���F=�]�_h�����5Xn��	uc��w����������:�d>g���Jg��{���zdz
cm���u�gH/,�B���!��<�P��|<��I��    ���db�O��4ݘ�3�w�_�
���������8��;
̬�[É0���&!�Q]�O�,2��'
�F��7�Xw�`Lf��M�>��%��!��Pzx�b(�i�]ΌM$t�81�����'=�1�S���o��B�)�B!�ߘc�@j�7�p�Z�Q��X9�M�kX�0� z�W`^P	=Ӓ��l+��e��+�rϙٞ����lR��P�����N��8U��-�ᛉ�UFob���dM#��N�ڥ9Hw�<��a��.�����`	/���)��R��˭�3��ē��{�15OcrbTх��/(����5x����箶���1`�?��a��`�|��Y.0lTU�XjX�%S��ۄ�4l�'B}$Fz\,�Ϭ366l�6��:���PO?4��l�̹tr�8�Mk��q��[�@�$����4��`��M��i��W-h�QW]���I��͜d�F�n� 5:R#��J�(5F��I5I�=:|�<G��C:[�O��#lb�4#1CeQl�IC|u���,����-�SO��t�a3�ee5�k�o�xB)���`2.J�v�H�$,����%��#�P��.v����v��z���("�b��w0y������k�#.ҫ���+)�J
7nxϯ�@��-xK4�%�-�3���%�q���Ƒ�`�,wi=cw:M�z�����^����΁C��$��J��<��x�v���g�E�$u>I#`��8����V����V졻`�3����~�8Fh��g	ϛ<��sg{u��{���,z���m��j������_ʗ��D>1�J$�pS\��!M��M�ٷ�B�d�b
��@��{���	�@�C�W�O�ԗL STo1t}i��I_-��Qd�+�u�H����T��k���?�>�:�}�/�ሾ���t���}
v��+l��2_�/(��|*E/��3R��n"� ��a�ɭ�n�L�O��hN�PjR��"w�\�וT�E�knl�A��o����y�	�����D�	�JA.bb� ��Q�^�׸j�dq
��I�dxRA��M�g���뗓G�^�w�͋]�앸�"6FĪ���ݖH�=�}��1J��g�*�`��[zu��	�Y�G�P*V��i(�u���T�	��/VA��YJ�k�j�M��8�=n^�mp[�a|/Om+>���yv���sX�k/�cAe(��s��
�;k�cm��ED��{=H��Ա\Opٗ+=/�>4�
�:�z�a�5������T�Q�9�7�V|*���vmڹWC9�qݴS����ܾ��i�^γX?GT=G�2� ��}�'��ԋ���!&�5u�@���Faк-���GT5H�C��m�7����'7�`g��	��nF7x=��5��2���L�����-/5�>����O��.yڮ퐠��i��]�}�Sd���S�%�s>�(�=. z��⒅�G����&�N�Q�|J����&}@�t4��&Ӓ�ɜ�<�\̐7Y��i��c����4�2]�y9@X�*���t�8��j�u�����"Ä�1]��\~��c�`r��2X��_f�@&�^UEe ����b����>^L��j1R��M�{[!��)��h��<��4�����?XR��Ə��2X-�ҙ����k:HWw�@�J�
`�yΑ�N!9\wF$�:��r2�AS�A#��h>�_қ�ttI�t}�1��O':�L#"��:��OX4����>H�VWQWΤ&���i����dd	�7Cɸa�j�>Fø�0&^����||���?���m<\�5���6�Ԍ�a�T�.I���kЈ&�&/V3�[��n�v��P���E'QY�G)�P��:�	H��������S�M!Н����S`�Q���UL�nƋ�`9~�tq��p�fb��`�	ջ��j�Ac��rr����̮���m�C
v��x��N�E�+g���1'�T.��b���MW��k�;|1KQ��s��Lk���ˆ�#�U�T�>Y~M�/#գ�G���Ag�T�H�3��6ԅ�#|�G���g_T����f2RP>6bI`��x���I����>?G�Yަӥ:���]�:�:'2����EӼ�&qI�}��t1���s6J�`��x�5��pǁ�z�tᙨֲbv�6
��AC��j�Z,қɴ�ߩbE�G�`��3�$�X��xژu�c��������N�ݿ�<�m"u�(�y_�ᠱ�h��&�t5�;�@�*�g���P�X����hQ���7�����M��x��S�e�������_B=Mr%ѨO'6궸A�I�ƕ����$���W��&m/�;vE�sd�k�$�w�>h4UW4YNf�z����;�_-Q@�霯�ݶ�K������p���f������\rg]V�mZh����E�w�οܤz47P�<�w�Bb�n�Fb�0�f}m�)A㻹�賧y�T(���B�X��uY�O��6h(#ծC���M��p�a(�����B���nX�O�26�$u���b��i,�v�{h�C��g�)��(A��Yz�W���C��`��$�+j0�[�L����t<M�@z��[���{�V1:IQ���dH���/M����r��$Ě�ĭ�˖z����A���l�p��WC�Jr��3�wnS�J ���]Ϳ�m�>��&8�ê�1��B�{O�!c������~��`gISǱ��'��&V�n(g�w����K�MJ.�IOq$h����C�c=�=8�dV�{��~ڃF1B���$H��<�-0/;r�z�7�	����q�%F2P����xGqC�1��m5m��TUA����7����.2J@u1�k��|1�(�B�݅�&��o��\7�A�I��\ϊ���=����%M"TI=S�'C������T�]���3O�&����L����83h$�Bp��O@}1K�V��t��V���N}՝R���2�ƚ����h����{sE���<��xP���j~���:3��t��Fs�xX[�1��c�Z��v�@��LfC�}8��:��3u*�V|Ԫ}I�`�7<	�ʷ@�9t��b丛P%�9��&�n�R���o�6�:��C�p'��k��e$����k_���J��w-��2�O��F�+\gNQ�5�V��c��r�r�������^���th�QS���+��AU�ג��xZ_��(ՙ`�"�.�Q��m����Y�5<�zK$$C�<�Q�ٴFk��=�B���������C�����8��+/Ulx��F�뢍16�꩎;��A�/P��[.�Ru�����B55v:I�7����$�Iɫ.5��;�c0���mE�5�{[;6�SBZ��0��9�,��oNg�w���ܭj��.��8�e�^j�|���zG71`4
��q?�]_��D
�ڕhe|[IHqR53����E3BO�����w����o���2l�ͼa��c41X�b�R��`�9��� $X8��86-5�W�p��͠7(B�i�c�L`�4�G��:�L������^Nyv���-��|9Y�b�0�R*�$1�)�0��+�#C#����`Z�gꡮ���F�ٸ�&�������e����z�巎㲉Ir���D��>�QT��gGR bfP|\]��H�3}'�D}��b�/F�]��ӽKy��7�}m݌���n�������L����*v{�^(����Kbi��=,������]��+A�����������;����}�����ɯ�U��o���U���z[j����,Wu�ܩ���4�����Gʄ�Y��?X���d��T��H�x��Km�o2��}#Nˌ���w�`��h����Xg�j%����"q��3H�9\"q{���-�W������������Z��q&}��!�Y�w���ܽ=E�o��0F�Z\sro�m�Aa�՞����#�MU6�'��F��?OTe���2�;�����5\ζ ����Y�� N����n_��8c��U}�j�-�]�J��.NI    X�|Ѿ��E�h�ĹU���9�aF44G��UQ��Y>�� #����.H?e�4���}���(UI�-S�<<�1z��9|��t�`T@���%�jm0c���dI_��b�T)c��6��ח�R�f� ��6�B�ҽ:��P��g�:]���2���^��>V�5�Q_��`ad�w�?Ú%})N�쇬�M�v�Q�՛LJۙ�J���_�"jӛ&y7V�]�J-���"m$�y��cMF@p���&�۵ց�XF��/��H����h$�;�q���Y��_��_$r4������0"Q����Jj�@bt+�rW��C�SB�}e�H�)!��f�~9A�a�g��3�(�M�bY��h��ѾY�1B��C���5�9k�sj�BQ�}9�1�C�*%J��Mj�|{�93���*����3��@֛�a�F�K�#�v���|:^Lf���~e影�%ZwŀA��ϋnu�t��-;�)�O3�����7��[�.Ps�����I\h9����Q����,����3P]���[G�LUr�`:U4���5��]�{o>���#� ��.�I�%n.��sC���������Q��.v;��|c��G�i�a\;��݄�"l^6����7;�r����9�~�	'F�� Qo����I��Nf�	?���X���[d��Q��t�v�M�H�ǭ�c��4���f�F(��q̗�E�h�&����:{E��"�2�^T�S&Ħ�4T�����`�L�;Z}s�Y�`t�!���jAѭ< 1ςu���ǎ�;��+,M�W�@���:)���f��V��m�s��d�c���F��1w$�~'9��;8����Rn�{=	��:XN�٣v�0�7��",4�7�4ҧ��+���]��~<���|ܣ��~,ǋ�M�����O�rLYdx�\=B���NS(�L�m`������ҳqgWkU�s;�]��D�۾K�z���0G���N�=��V�@��$)�b�*��z$�ꒅ�i�"��9�{��U����to�c��\\��]5��D���@���o~<HL=	w��'@x�ΞV�ti�<�d"2[�X��"�u���/���Ѣ8ic��$؝ZO9!V��w��]�D=:?��n0Ù��p�3�b3�j�e(�/B�k�/Ձ�������6!g<��wᆺ��*��d��� �0��Y�L�N$(e�2�q������vn-��M'�56:��XBq��F� ��Pt�Pr��lN������;4�Е�#`�h���N�/�3~!*��g��s�������(�	C���hxI�
K��zЃ����9S�C�m,i�/����Y@�	l���s����11x/?8sBK?83�/�����+�͋]��{��%�L�rvu�x��j�~����3B��Ar+�;Q�2���X�6.��G3F�M��׽�a��v_=a�6NeW0��	���J�~��NY~���|�g�U�	��5wP���u�� կq7M��.2��Μ�dXg$���]\s�dh���m�C���輫��a�&���1 �٦	�QQ]u�[0Q��W�&�P���>k{{�����blh�
K�}�z<�@w`�PO�h��>n�v���+��¬�h�0�G��8dg,�۽��� IF�nN�!3�|�F{�s7pH���֛�fӴ��'�G�)j5�����u��'��(N���(�EI��IJ%�����C���y������	W����L-c�����R	!5�[�V}y�=3���	}�3O� )����G21�@�,x��[vn�t�*��<6neUsL\Q�"�UMPv΂�<e�WQ}F���uU�q��b�aJ��=
ʅ�ʷ�y.a�����X���3q'�;��.�������g�3���Y�IF��R���)��q+�S���Y�z@��&U�����2��pR�Ǳ%i&�	k��㜘a���q�Rl�Eֱ�4n.�8<�ͥ6���0Z�3�	���Mdg��{���$1�w�0#���(A�"��z����-rXőU���N�����ье����6�4O|��P�fKZ�!���Q����j1��͏N�vo2AE�7��Fz��#�	z:�AҟM�yH�L���}�PY��l�Zf&�����N��4Ͼ�����j�#�̏���j��w�� ;㔝��z�~�)�v	�������:|�y�,v��|aM�5�՚(fh���]����
�<�Xx�;_�4��ǮTN��q�a8.7D0E�Z`R5˰�C��ڠ}�tB�A�\sR뾝Rx~�m�<<�1FK����c!���o��e�۲�����vQz���:���|<O�#���A��'}�"(����g����}{i��\��������>�^����32�|{���=���;���e��Lg���ٟ��T����s,��:?�]���.��ǂ�<�]���5RL�+��Lռ���8K}�v4�X:��=nΛC�U�!��s�*���rs�^�D�1��2+z���s6�ϰ ��m&rVO��`Y��!3�#4=a䡇���T5B�x�:�ەFCcjľ
DR����j&!J5�fy�m�h��^��v^L�C'(�,�6B'X�,�������������o�wm��$^���֙D�����2�����L8R��s�6���E��Z獷��b3��hsx��g�_8M�*�`�Y:M��Ws&�I��d~-"pV_%�ߌ	(ۛ�K�3�3I�v�[+�j �I�X;�R*����z��P��2s��t'���w��9��őqaDX��ld��u6z��Vs��v�=&����M�I/��p�p6����:���=�~f����%���)Ѝ<�Cp%Oms���E)l�L�u-L�;�M��a���Ox͡p_��'x��9�!v��1�y*0H��B2�3ǔ���|�,�/�r���5��j��s��Auҵ󐘅�,��*��uSA>j�1\ 	Zf�g2ؼ%�h�0��Vk؝���5\s�/��A2B������|/ߴ�^v����7ƥT'�9���8IN<�I߾64��7F�E��7���zfG�R�ի8��E1\�=S{P��+U�m��A�«��\�@�:c�8�y̏��|6��,&vZ�3Y�X�{�Lfü��\� ��R�8K�@[<-�L�ġO���ė�� ���蜵�m���]R�I��Ku������(����GndUŽ�I!���8��Ƴ��B�je��d����u;��K�#UK�e�S�ݗ/u��q�8b������ Ά�QAh.5t��QLz/$�!A���,}� �eЎ{�v�Ȋpc�S1z��e����,��o��t�x��ZnA�(��YX�u��s�ݨ�%���]-�W��F�G��#k#�̰}�Vd��	;��T��;Gu��,Sƺ�������E��8R4����h9�Ӆ1o���q5�c��K9�V�cb?�=�8�őUB����iosL�L�$,)y����`���(�Ȇ��N*�D!��2���|��`� 
�؜ϙC�X7_͟��齝W����}I����H��>b�x�P]�ݿ�`&�j�����s� f@Y�X�������&{�����RF�,w��'���ђ^�l}=b�%Z�)������61���%��S��'G�Ҵ�tp�.�z�3-o�tU��G�'���+�+���F��*?N�,����=��lu?	V�VN�m[C�D&���mkC:.�+7��pAM�%�n��g'�o�Q��9�&OG��ÅQU���^�7�k�o"i�1]o9�Z���3�"�C�3\$��ȝEb��g�p�-19|$k�p�;�|�(rm������ڰ���#5J����[-Э*~ԭ��C���B�K��)1���1M��67}���R����2�J�(����C����t�5��%x oA�pOǏ�y��s5EDJ^UI���m���`�h���Z/(�s���M	�0��D%�/~���z*ފ$���d�n5�̮��#���5��,n����,���c�� ����$w�!]L�O]?4�9,    &�M��9�^�g쀱�)}���V��cċKiS������=;���.�8���p�"���_�1zw�[����}�D�����=�p^�%T���i��`��W)��Fr��欐>�7�š�=�4�]��O�/!�"[C<d[VW�y�K�������ۋl��0��v��Q���M�1��[����+�m~�����jn�����Dc���5�h�mӂ��2򐠛�l���b��Q}%�S\A���*�	��=�'���^�]3���a���5����J�WW�N���`{!�E1!�NHF46�$F���H&��M��/A�u����	�c�O���D���w��U�Ic������N���vN��_��BJ�tu�~�Qgۅ�XK���mW��J��b��2�=Η����j�u޴	"���B�381Qpm:��j;�����j������:0�hy������,`z֐�uU_�@)�r���Op6��j��]w��	�1�{רA"�䨫��s)�V�J����~����)X�7x�mXؿ�k�ȈN�e��Zq�0��w?.Z.��қvM	=��qd1I�07�c|�/z!Q�Mf�Ѥ�zk\s�l��D�K���������]���ač�܅Ч�b�~_�p9~�@�z�P!�\�h�j҉T�S�K�Y�-�.�	����7�i���@\�E�D���Bܽ��!E���~�8X{9{!��65,g��m��s�3\Z݂o������Ƴ���ʎ!�����W�P�fZ�E#��i�:\$U'3��.�e��xbc^��W)��Qx�fd��:��\��~��<\,J��w��������]��X�y��b�l��b� #@tZl_�T��b�T�qr��vl�	b��J�
b4Ms�s�B��)R}T?�"x�_���O�Z��q5@M9��)֍��9����jr�l���B����^�$�R�}i����]��O�����U7u�[��Hpd�jL]���Io��p��UY�;|-�L�7�q%K"��joH���Z��������p1L����N"�+�ӎ�#9�O��$Ӧ���0J�^�1��ŚE՛.0\8)�=�?��1�M��dV�˸�
,�i�3����dh���,��ZH�`�Z�\n�6k���+��rs����[�6��6�]��,�6�!��J��`כ)��AZ���4���82�i���8j���a*�4�T�����]�<&�k��#��L|�m�*��|}���k{�@��]5�װ�j�wt4�>�A��뤕��=j�i��51XXTMa��b.����Ru���yq�/�z\BMǘ4j�[;\ ct;�Q?����i5����=�T�S	;خ��7�:A���|/��j� |�.}�8�z���]Gq�1�5{��֛#I!N1�Wu#T�:�b��(�@�� z$C�����Y�I�f �v���K�%i�Hn��Nge�ϭ��q�~���&]L:VI��q{Lt�8������g�@W��,����S�@Rև�L����a<WN����R�s�v|��'���>tz�N����u+o�$k�n�a���C��������X}ͥ	>vϬ
��Q`ި#���K$A���[�g��~o���c��Ցyo��E����$D�d0��J-s�H�VBG� ��XwR�����Ղ�#$c�9<�L�X��l|m}�]	�Jmh���g���;C����'��s���LKv)u���"���Kjd׸��/�ȃ����L�4r��P팠�ea�R�=���C��d�q�^�E~�{��C�l�.F$B;�Pu���4	_��y%��IW�:�������T�������׫���.*Ͷ��Xy�P9�Jf��
JR��[�A��n�@�4��sN��$�� M��R�H���:�oy���u�Ʊ�)��cf��1���v���yJ��-\��2���6��sߍ�!Y�w���zF�H}):v��b���/�4/�rkY>6Z%0�ѕ<�Y���synN�D/;X�ϙ"�a��|��:�	��A�s>v���{��C�@��$�l#՟�su3`)���2�5��T������(0��P��|fz�mO9��%�km.Xl�h	�I|���!���]y���<�����-��q�� )�
ɓYtL����# �j����-.�4D�.T�x:`h񴚦K���b�5�o��W�H�0�o����8;�E���[#����%%�n8�������,#w�M�#k��MwF�۩��c�����=��	�S��v�YTF0�=��|Ξ��ꪲx��J�X��< �+�򬆤	mԳ��N?%$�-W�T�X&���bK ��L�JCt�[0���Z�߳�Va��o��Å�]��sU�x)��Mf��e���vCi��	�HaJs��YMv{R�%����d4Ƥ}%֟K�x���^nf�9���u��ڜ�M�����'=�(���O@a_��p�d!/l�xl69��o�*��XF�I�=������a�˟���j5�T��ȫb��6��b\����'��$h�N��E�<��Ԫѩvdp�n�tM(�.\ޞ�@�Ru92�߳N�(����¦Baek2+t��[V�@- A���KU�g�D{0tn6�p�������t.ڜ�ؒ�S�"�v�k;mR�2�HY0�M�n���q���Zp�^�o�G\"����Pi9SW]P`�y�c���{y�X�����U�S@��N�"��Αq��iGC��ڮ�&��u:D�u1�,^�.��7(2U�Eƍ��Ґ� �T�'��A%��7��g�F�j�yM5��ԩ����ک��3rH�ٽuv��Nnpe_�ľ4�@���_kNLR90�k�_V��rE�q,�s��Bz��_�:����i~~��J��=���J������>�1����4m����h�BS�c�[S�~��P�6ǭ�34����}ZYRv7Ҧ�@�'��K�e������m �J�ΐ�	7~�a԰��z'#F�f�ovA���_��l�^��s�h�=��]_��#�	���p�`r4��vY�$�L���M�u�}Ԟ1�ċ�ړz|�E�>��ٺa�Ny�'e:�x�6=^߈�00:)��ݝJ+h�W�:B�����y]삅zw�20��v�Yb�@Q��.;�<>�Du�پ��11��چ0��SAjKW������b�;ȐM�iPe�ɬ���mf��Z�Ԣ�v*ct�[�^���d��E����o�	ZNW
�Ѽ��!I�+S?,D���d�ͤrcI ���Q�J�#
�����8Ac [���9;igg�yՑu���73�'h}��a"�U�z��Mb���Օ�w�uf��?X-ӛt��R4z��`��q��!��E���q瘔9a�8'a$.r�Oh��e��NH}��ǋ�\)��t�Q}XBC�e.���v'��O8�NH�~���Ԛx:�Fu��bM<�ާ�a�}BQ��M�S�:��Np�[{p�p�n���H�"4Å���|-�Y�$��_=E�Q����f�Ԩuŉ�⮻F��IzRMߢ�+��}��b�d[(B�cg*,���4҆-����ey�(A�9ς���2�|�SS���3A���v��g�����[�A��v�U
�C�yB创�/'̐���F U���
��bD�+P�w��ݍU���Y0R��y�8�R�v5U�r���a� !�Q�#;fX2Ճ���.�WXt���#��K����{�w�����^��l<g���;�U��X��)W���q�w�/ة%�o7yV��j��|�,��i�n�g���ڼ��`�9T%|x����eR3��R�(t9Sab��Q�����!�/�7G7����:�S's��;V Ib�v�=+/�h�3&��h7���и��Ǆ��	��̔�ǀ�u�V�笄9�O��S,I�s�̩V��p���_h��2_�7�~�z�3X׎�$B�fP6��#�f��* �:u,�L���M}�Cd�4*��;��_㨴���Ǽ8��xTz���9��
��AXcb���BH�02����G������h���    ^��M�u@N*uy��n�w@����~��4�K��W~E7zhq~�)Zn�?��:�U�a���s��]����^kr�Ϲcz&Qm�5
��(<�F�an��~!ܙ�b�Gt�_��v�G�sؐ�%%�J�gz��@����Y 6�z��,��q�rձ�
o��(�k�e��/�@w��pl�K�^����$����;�[O�: �_vY�P�Z\���=#�0����y�_��A0X��ѶMI���#"�Kb�f���"�� &����� ϲ]�QpJu�YR�x�0'5͒�_��LT�x>p礊uӕ%�!�ƃ2ۈ�0�9�:@ǐT$s����1X�����i�"/]XN1�C%�#�=�)xd�z�iKA� ������
I���x6���c6@pkI�y�|���~�h�][pJCR��/������ �iy���ꔂC|���~R�dZf�.�+a�eu��X�~d��9�e�CpО����aU����OR@P�)V>i���`x�%G�RkQ�����Q&��	�!��*�.(��)ԝ_��[�Oczg��H�ΊA4s�?\Z���fOё�MG���&w˙�i��r�j��%��;H���xȥ~��/�G�����ΡQ4� �:6����;@��`G���WOQzm�#�kE׼B��
n$���+F,�����?���m�o>�����U+|@ic��UM{e�fE��k�����+jI�5���Q>S�M�S���&Z!�Ψ�e2X�ڕ'����8�:�R6uh�#;�U<�F��u��ph���d�=����jD��9��p;"��.�]-�_h24�f{�e��nWK�q'�0u�Mr{� B.�N�!Y۲�dk���˧�Nξp,��Щ����l��
�
�l�V�V
�z{p͈�?����k���1�뮏�C~�i���^#��A��&o����G4�j>OǋW*����@]w"޽OUk�����O����M��-� �L&y�I����T�׬��=�q���P����7�'��ڻ(�?������5VO~��ٺc��zPlu�t��QA�k���	�-�xfC]�cjQa),��^���cI�Ju�����c���g�9�ీ߽��ɐ����ğ��_%�;O�y��h
�y6]Ƚ.Fyi�p1ur�3�����3���.��;4E�}�?�N,��=F�۰��5㸙���O�
�?���ͭ���8t�T+l����Dt%�CT1J�D���z1��_�%�>��u��<��"L��{��S�*/���9�G�4������н�������ap�3`T7�|ɫs]���������SW�ѥ�/@a� �D�U�EH\�IT3�GO^H-%�+��<?��c�m�Z.�!l(���B0�t$��k�>�����lw�=��Iı��xy�$��Q�T���$S�����Y,��2�1��#D�����=S�m�!���r�8������L����.��PJ%�4g&a��x�L�2.�%n<�ρ�@��70w~=�/�iz3��T��>'5�Ts�O�?�4D�.۷fPI��,F�q�MJ����x�$F�l�����:]�}:5�\=M��z�EFF�c�Ie=^�9x&A������3�d'��#+ ��f�~f��\hϏ�CƋ{#0g�4]>�Q><�nA#�x<!L���@}T�tTBl�M�|j��f����B�O�m���ݦ*��v�QF,4�H�.}3�����Z'��:�vY��Y��o� �#�)f� lFbv�^�JUuz:d2G���F��Ũ�$=�"��F	ƕ��p��T��8�C���Mb���֕RՇ"�� ��BWj�[]wy�R����Z֪��*��<Plұ�:�& ��P�F��	Xϛ]v��:^|�)]������4W�@e�n¦/W�Y���T��$eXϡ�����-�cQ�i@��z�	�[^��u�I/���8�wF,�wT	����x�)��2�O���L4�z������������3�4�Fe�ܱ�'g�R���J:.5y+�_�X o�N�N��H�%y������㙠�b�u��t�3�L0���!ø��4�#��� J����yçNPݟ)�ą;^�yZ��Ǡ2u���^�{�=/���eʜ��`���\a�НTYO��`
�WAh�$�1�|��� ����o��"��s��'������4AⳠhy{:��8t�����5���ƈ���S����<1Nq�:,���;�����6�z�)�g�W��Y����K���H�\bVM�Me�Y�$6��#Iz�A���b��9N����L@;{��y�I�a7R�P��2)��xclN�2��-1lfץ�H��)��+�-	���	z�g�>�E��w�d0Q�T��r2{�y�l���@����Y�;��;E��,a����]b֘kb1�2�v'xw����]:
ͽ��i2�TydD���M��1mľ9�>��d�X�U�sO1V��j3'G��gQ�Z}W���{���g���>Ϥ,�x��<���~��x�[���-�_��Y�0���rB�n�;��W@bt����4�O�m)�c��e4�ub�w�w^�H�r'��s����ӔD��V'a%��.+K�`��}�
6֧�z�����]��vDT]I��N.T]��mu.�Մ��=K�k5$e7l�>���H����Y�$����Q��?��T 
��C>�A����]�%��G
�ws&���[��Uz�#98XNN{���5946��sLbK�S�Md����������u#}{67�Y8v����gR���t�ۃ��t���tu��ל�D��8�5o;v��x�_2�RWt?^}���ϼ�F���LV�j��X�}.�|®6ߏ��1��_\�,��l�(�i��$�,X�,��n���OW�G^��~��B7��@Rne�I��jJ\�W�Fh�V�s�Rl����9g����Y���{���EX��c?�1�A��f�>B�hGZ��@+��%g�o#�>�	*�m�,�!g26�t*¨6��c���ς$Eyxf�|/wR��t��(x|:j���:+Q\;�#l�5�(�	Q�F�贐{�_|0񿈫�����\�+�5vd�~4�*7�ڒh�D��_tF0�U%��9��P�*���Ӄe-�y���:�x�c�./����Шb[�YgK*jvf`66fFF�R����<����uq����0ce�ܗ�Ȧ�a|��.�u�n�:&��Y���l�O�N�;&T���:���fh�Մ�,VG���j�O,�ӹ+�Л�AG&6���:"��og�҃<���6۵�D���g,�������}O�T�%���G^td�wb��_���N����,�AW�c���a�9{�
Ց[f�㶒�W���'y�:�r��w^�Ra\�¸1[g�S��!��G�<��:��P��,k�;Ʀ�!����{#�t���.���8�g�CPمC�vWGJu��%P刢�1���=y�Cȶ��B�S׺�
�ҝ�Us~�p�ٵW'OU���d����ZF=$��D@9��'�������z~<����J�oy� P����Xoe[(����&82�AҲ�v2:�d�F�2s�]M��i�v�^��OlL��+i�eq4����!�'�2F7�Χ�j��s��16~<�)Gr�>�P����68i�H��I]��1��8�{h����u��|�E&4~1n�f8��H� ٨�Z�}�%_�L���Ezm��<rK*0�-�j���v4	�>b��T;�M�Ը���d��
*H{�n �$�*�ؠ���t�դ}
tJ_�SpW�~�&	-��>;�8�"�r�5�_��=�4AP�֝kg�>�G��Eu�I�!ݧ���q�[�$��A��w4E�nW��	�L�O)���a_��0�x���8�����%����鱟X�=��kq҃��^TU�rl��֔����2��._/8t����L9x&��A	�@MPzј��߽1M���_�r��9��[���_~�dk�&�H�6ڕ�T ��纇�q��&a�i�s�e�8C\a�/���:��͟%������ѕ|+��{\e�N    ͏�7���{�M�c�l����1�, ޱ��V����u�����ڑ���R��+vx9��WU��Oپ;D��BWN-�b���1D���X5T�i�g�Q�'�?�cM�M����>�n��&��V�/'�c�0��o��j,M��d>�Jwϛ�|T��X��~N�U�C�1��4��.�>"�08y. �y����6X���k� H,����3l8Q��n��,'ʜ�ޒ�O�t��(�m���J�o�C�čH�f�_L���f��A����hG�"�{��0ƨ�h�Ë��Gd�=˻� ���]�U�&�FF�L�K~��h��8�T��s�wYR\���6W"2&�ho�d�}
\��b�;n��UuV��KX�ۿ��%�n���$D�<�r��j�u�qU�S��]pj7!֗�) ��%��E+-2\r�i��<dĴ�v�Su�~
8U�Y|�P8}�����#SM��T���R���[�{��?��=~?^>��{	%b-lZM��I1�O�Zv8Hh��o�e���-x(Η��j
G%E�rNVp�������e���n�a� +u�����UHq�Y{�㹥��V��	ڪ�2;�6`9y���<9�\41.��r��8@&��WD /O,j��C���͂�\cZ�K�[��'�V�ZUr+�/�*�ZU'�[Qnc����J���2I������`2�>�f���"�D����j/pm���� ��k�LSBå�q-,�}m�?��̭���Dε*e�Ve��
�Aj[c�/��6�����'�>u򥰾�n�H�D��q�h�_�B��?��*���q��'�������S"��n�dV��ǵ���������*�ev.���M�M2��,U��02��>����V���
��z Ue� M�T�ߋ׬K��TW�aP��?Z�j�w�N��`r�(R�F�C����&�}:}X5�1�{��&��;&��}��m�H2��˳]����m�l����ńغ�i~p�I�KXn�����X�>�=�BcSF�|��J��F}�R��Oy�C��u��:��y��∘���� ��6H�@�B#)�jva���0
3n��r%�z(o0�h�IP�rв�O�rY.�����}�u�#)y���f��V�	�X�'��̄Т|a������ #�(�Y�MZ[�N���:��x��KkԠ��vH��F����k�t��� �V1����S'���8\(t'M��x��[sp��a�~d���T]�ͺi�݉��E��h��K`H�eJ����ȗ��?�ʗ�p��3������{�S��h���t���h�lNo.�{�և"���+yڬ�t�~�`<�L�T]=4��!7��������.�=��N��A�+u��x;EQu�ފ��b�Ct��y��]�IE�Ɖ	|m�g¾���q����*���	և����j�bH�Tn�K��{Ëm�I�Q����)a��cO
�pьP��* �S�����jj���nr���D+7my7��2�E2F#�g
G#,8�Eq&�L8�a	7�!d�լ��x��G�3AW2?�����/��ޏ�W�O9��Ca_�:��\R߼���"?��C`(�?��[k�a�an79����*w�[������i'���mepy�#G��P����dc��8)�&�'7:���'��P�'{���y��	wu���ziH!ܕ6V�}#I��I�yȳg�WB�}��j�k����j`qX�a�Yi{(Vw��T�rs�>�W�;��T<Uw0=x4�1M�_�aY�r�)����u��{R��f��:)7�mV1\ ���k��M�S!̨<��� o�^"�$?XgÁZ�N/ǉ��5T������R�+,�����+qLR��,
���l��%N�n����Y�D�CNL9���K#_ڐ�Rc�_n�Go3֨�\d��
�1���z�1/�d=�t.9m�oꖟ�ݦ���r�XJ��DoKJ�����f���xF������fl��$��6�R|5�W>��yzCEU�n�]OA����`nM6���[܌����Т�!�/>��:�n��R���y��ɬ�;����9��T��{�SoNb�ٟ�F�0[up��j�~3qs��c46���Z���ޒ��"�e�<kǘ��M���[ǘL5���q�i0ՠ!"�1�7G3A_��]��|"�3Q�Ř�=��f�')z����.P��Z�7����9����lG�����a3R/��	j����Z��Z��8���e�_�g���9�ݴ궊����=9U��\��<w�=�,����Ջ۲���{)4��T�M�"��Rӱ�������Cn�	c?'�ꔠ��'{��o���"�K&��o����DK�M��z#��|��(v�)Ô��l&戲�g����g ��g��|���%z��1(�B3���ɣg�b\�p8�6e�ɱ�id4��ȓ�&Y�����i/�]0��_����g4�1d0_'�w����eva�Œ^D6.4+(�]�k�4\)�3_g��E��4X���r��Vh$t�����Ɋ^�>n��Ζ�b2@TU�S����sw�>Vѭ�.rh!��jѣ�F]D�f�G�fݬF�+��r3����Մ�?!�,��E�n'͒�!�<XNFc��h�2Ӓ�(tuk��D��b��~�K�?��oa����[���p�ʒ���h�����R��z�s%��j�u�W3��a4�+]���:8�oU��Nc��<���p��&���I����A'�4�Cށ��w������W����f0a7��ݘ�c��AwG�������>�`��]-����WO���Fg�~������*����`dw(��<��p�b����х'�����z�+E�߂�������9�����xv}W*R��/8�Dh)����?�,�̲�ǚ�����;����l��R"Z)����oF0�֭�+���;�m+D�q0���-�`A�Q���dQ��_��~�.V�v���W�D0��a�ʜ�����R5��"?v�6I�]1U')W�����aĪ9�!_��1%gk�ke�c�`H+��4���)��	��C��S�&�΄UI��'j̄K�[��s��A�-Xl��A��v�L�j�Xd��X�X�x}�c4���"�I��v!�9����d� x� &�F�ޑ�9�L�"�ҽ0~7��[M�(S�zl6f�ے�g��+��<5a��{G�M��S0>��G����fSՂ��k�@,|���M��[��q��6u�����ys���(4����f2#�YC�L�#��(m+�2n�y�73*������GX,A&�� kb��",�#\���U6L��]��v
d~�ߌ�=B�����~��]p�ퟏ����'�r�ك���������UD�Y���ہG4XXa�#��v���d�wOJ��'��p��(x��8F��t�ۮ������81�5Q�R��`aL�s�����g�}�������@_6X�Y��s�T�5��Aش��*'t�Ox:HV&��Vb���dV-r��V����њ���`�;�}�hr4Ѳ	�;{�ix��0 %�$fBD @��C�����U��²�!,Z!�J��`�+ʨ�D�_W߻�B������x�~΅&R�=���A�>uT�d�z��	7����t��_�yv:�e&�r��`����b>{L��5�iENΌT�;A�Ii���1����%h���z��0�n��} L�q�٫q����mW�Nv΂ɺ��cBE�ؿ	���4���a�zt$U����O�n<���{T��KO(�f���^44V��j��(�n|��VB	��nɢ(��`��>�����[����ld����v>�	7�$EC�*����;�`��٫������㒅�o��H^F�MUq���/\	�1aiXPҡ���w��&��)�F�	�Xsmu�7�t��b׭N�I��x��q��5N��	��6����q��>�|�7R����ku�/R�`��8��+��a5�$��O$%h~܃M�    ��h�����e��Rn��&��9�`���T�޶��O���1H_��9'�Ք����:TǸ���O*i����$Q�tG�(��Ӧsh}I�3�&��ﲭtB���2±����=7��Iax:g90R�`V��r+������M%Ή��0��8����Z�I���S�L����bu7@`���>(��ҕd9���V��{h�4L��4R�/�%e������f��22ABj}4���CK���FI���k6��~T�U�eg��-lUd��X�@M�ƒ�hr8�C��]����'�l&�z܄�x��fR�FK?��S@12��`���媌�ӻ\�v(��	˚�q���Dgp�C�TC��9�o��N���wT�^A���5��E�]�;��јZ�a������2l,c��3` ���/�l��T�,{"ۡX��dٗ�,�wz�퇍h�N��L��ʼ5l\!"G8CA��"�5.�WpR���e_o~�r4�ǝu(,N��SBQ�P"C_���o1��%��m��� `�����#�4R�z/w���j��n�}5kg�c�Uӣ�77����B\ћ|9l���&[�4�2rع62�p9\�FI�)Ҡ��	�^T�6ҙ��jI�-iE��w�9F���,w��ow!(���]{oʇ�"19؆�~���!g�̋����4�a�	I=�����������V�=�4hl�Ö��e���1���c7m������RY#�����?d�*OmK=��ߛ�٫����������a#I����2���$hm�����"��ԌՋ��oL�>�'6����n��F�����N0{�=T��F�|{�K���ˋF?�`B����=gs����j|j�:�u6���)^�+�+t�MS}��m���M'�j�_�p�]��'����6u�ƀ����6�1�ח]`� �z��?�m��R*��$�A����NWp�.���hO�����ƕ��e�͈6����G�u>�_O3��s�Ц���*�{#Ĕ�/�ݩ�T�2]�Iu�.7�^ᘠ[�9H�^�Y�-7�ꮽ�*��!m�&�!��im0l<�*�O�vKi<�]{�8ƕ�r�.]�!�:���(7��h7hW*����8��ײt�N��y�P��롤4
K�kP޼��=n��`)���uHZ��<"ƣ11��8օ%���3d8աA�ӛ��-Z��>�=<���և������(V5�Y}5��V�^��󨣩w�K�_�h����C�ؼ��h}D˪&�n�Qq�M��[�݄}d�������r�y~�m�)����Y[��0�O�P�u�cU��Ë�NV�3�Ю�uՁ�x���!��u$��-��v5D�����6�O���]���*���d��ȳ�.�Y{��Ps�si|K���cI}�ܬ$�d���QA;��H�'@Mj+V��m$��I�*[YQƧ�ٓ(ƚg >�a�\��� p��o�7�9��x���vj���Xb�~�=+ͱY����x���}%��YI@0O�^h7<��JuV���-�ٶ�E��JO�	8R5�5(Y�����rmK�5��X�w�tB�>�4����k��F��>��SՁ�D1B#��� ��܎��N���&��fwb�����Bw�h��f6���^QBn�'u���L�����b�1y���"����X�6�\��^/�+}2�=���lk]�52pWJ\4#�z*���"�$�S��p�\)m).o�<]�U�0o�<��[� /2Ϟ�Y��,�(t|jh�b�������-$=zj���=��-;�f�p@cwu@�9�q�����0�$D���f��n+���������\��	тG��>��R���<����C�[C���qZ}N��rNJF`T�o�ޑ�Cڜ37�d�l�"ʠkR[� �t�!�p�t���b�q��z���Q;�u��?�w9d$!w����]w�m�\龌�F�DVt���N�#(�������ut��۝�o\sԉ$M���!I�������׻�JB� �ፕ���V�A1ڪ��^E%�zM�Q���#�+��ؒ��
�U`��V�7R��ũ�M�l�<�������,�͖��*]X-,ѩה7�ʘR���ǫ?�>�8��Xs}]�l,ַ�'n?x�juk��,��:��j~=_T�w���4���$��ʰw鐑$`&�&�i������YQM�6��_�(Bӣ��.��懮�k��$W���U]%!i<;I{��������XS�����~5��S�*µ}*��EUMY�*�콣�N��y�kԏ��tO�Z�5��%���Tz�5F`ͶnS��LJXuq�Ϲt��D�7/��� �˝%
ݍ�s;��{��X_�uϙ��Kp*�)�`��U��	���6��t�^鋭����ܫ��b��t+�Cw��ܝ.d��q��t���VE�V<��ϳ�����!2�8�}b�(�f����g��Vg�X������SW�+[	w�����7[����F�s?��M�r@�(U��n�`��t$��E�J��O����(L�[L(N���n��.~J ��*�ct(�L���L�сdd���))�h6l�e8�R��5ᲅ��A�hJ�������RM�-se�Ru�Nl*3u�(
��vj�UC�إf�yڦ�{5�����2&�������[�V�G�s{O6̘3�r�U;�9�j�9��Ee�X��L1�NEʇ�Sr{���{r���w��k2y�;��̝Lަ��f4���d�I��~�q�Q�g&h����J��՝+��D�@Mt'���ox�����K��so��N.ŀ��4<_��Ћ=�C�=B������6C�@�v�Ȉޖ��q���P��ßm#��^����W�fMs������S��p����ݱ?�L�	��kM�6��I�w�z�Ç����1�.�;׆O�xK;����/�L��������z�BȘ�Y�R5,�����P���j��L0��b������:�?=��%�:ڙz��#��~/n:3u62nzqόє$��o?"'e.�P��J�T<1�������Xd�Z�W~��n(��h����-�R�hX1ᨱ��Ų���Ç��2�S�s��A��t�'���"�˩������`5ō������f�|g�0B��{zL0���^G�:�H����:;��ߓ��#N�$j,����\a*[��]b|@2R��}G������O��s��P�v�_����l�_O���<��罀�H�n,�R���A�1����*�e��mQ!+H����x��D�q*���=���4��	������*7�y4�q:�Tvx��t����k�o(��-yϻ		�2<�Zr��<�z����N7��1�=��t�/x>>ݡ|㛡L����*�v�,�l���p��=�UMVH~�������փɬ�-���ҙ̚f�}�f���u��w�r$%�Y=�:eÑp��H������G�?ݟ~���ʳ.�p'�3Ϻ���В�scb����<��G����p�0M�F���W�w��qP ���25�y�֚i�%�LN���x��O���΋�צb��΋��ɻ*���t�6i��O>�#��Ge��D-xʵ��kE|2j83d�~8��Y��Sj��Iy[Q�y���R��}��S��)ݶ<p�˸�T�����㲉5�HE����I���j��]�)�� ?� ���*ȍ��nR�Hth�t��=���P��7L#�b���~����~��$)o[��=&"�9�eh�{�M���@1e���䂻��f>�}���P�b����\��9}���c�df|��J�rԉ	GkmpJ6�YkJ¸bn��K���3�y�������x8���`�:S���Dg�['f,9�??����1��K��ć��%tT�Ǆ� N����]�s�|	�5���>��ܜgN@� }s�OJ�>��?�Ш���Y�i��*���.�tk��mY$�Z��GN�HIn�_��.�(�u��M����V�&~@ZԌaT��������CyX��y�lȄ�}�K��    F99e�`�eʦ��P������ȃ��8w�y��LY�HX9:B���KIh��v���2�V���|8�Ra+L'ȗ��s�Ӥdy� (ڹ۽W�=}:��,����qe͚�Lԕ�V
5�@�p�������M��2��:�>t�h����1��O��]L0��_������j�1��,�H9J��{���$ÂG�

I2�u�I2�pC+�����4Ü(-����{?c3����������4�������?�p�u����/.����FT�3��H��G~�a��=�X�$��坕�S"�f�"�ӗwǏv[�􌘭֖��%��s��A�p�E��5�S]�b��u��k��e�׮*BP0� �n��,��5���P���~H
��&8bj��H
��T�D8 �s(9|�|�������b�w>V�ξ�ο��a<�婙�7k )�>��l ���&B�׻&�g\RO�sv�0�,'k��M�\��j�x«����ç����枍eU��N�FVե�L���MN�Ow��vy�1��*ʕ�"��U��P�����ܾ/w�� xa2�i�+�##�2#��O�o�Ϥ�-K����y�lƬ2����up���������g+�u��7E��&M
q���c��s��p��
��/�H)��/ͩM��d�4wgrB��QԤr�\8Q'���8$�bwqQ�J4,-ϲF�F�6ZcLDp�z|<}HPX�L�8��L�s�Rf��vh�4*c~V<x��q�;O_�l�\�P�F��n���*]٭�oEx�3c())1�������8$�Ë3�2�R�A��v�|���Y3�����ӷ��kv�}�
��Ҕg�"���CE����g���*]��w���d/�9C)��f]fS^�X9R�&�Rum��1�u��jɟ��)
h�J�g��io�JӮ��dӈ�)����'�*�W�� �%Tf�u� �k	$�n��9��>�����y���_^nk��,E�k�Ɇ�sFS�;��x�������*��;PQ��c)&�|�GCr��<~y�Ի}�P#8@c�~ls�GRw��ؠ������Gx�����m^�	�� ��� �^ �T�ƌ�DK�{k���eSB>0)������tb��ad(�;>~z �|Yԭf"��V}۝f��܎|�&��f"'���ZC}�8��FC���u��fo�����h("H�}��֛��Q�?*)Y�����SŌgf'�..��x���,���|d�D=�
��t�L���˺�e ]c�xJ�$�5.T��O��>�׹Ȼ6#cΓYPj��ht��"���)w��n�cw�S��j���4�R�p0������������g�r�$e�)]F+dC��
�v��_���1���~Ġ��J��uya�Z1In�ՠ���=i�jp��y�P©(���~�D��L�q[/�KŌ#u#�{'�|��Tj�!�2*Me�a0pm�Q�iW<��ɦ�=���l<�%X��9��_Z1O:��NNv��㟽��j�l���OD�X��z����A���׸d�o���ErX�.�5i� B%Q�po����k�\F&�<ǻ�[�C�s�~���2������L�u�q�Hz�DwƀJ���\?�|���a�9K���F��1�p�aI��+��}�O�N��7ix�.���w����Wf�s`�I���6�>�`C)��A���p5�D]G���6�/i>�Y�I��4���i��oy�
}���'�,��A�T�	̦�#1�u>���'@��~�	�q~����]3R�E�`�u��k�� �oG�y6��#~�9�~�7?O��.���J��SJ��?�nG�z����}r}|�;ݿ���2[�a�X�n��oQ�&'Di����p��sS�w1�<�mL)M�KGg�".u>���wc��C/�L3�X3f��p��\���d�k���6%Q�+2w�NR�'`�y*5y�������>�U'�yT�ɼ�ޚ aj-��i��C�����?�M�n�����9	��<ފ(C���vѹs���1NR�P���(a�䷧�O��<�T8� KS�:��1" )�B����"g�\�_��v��8���0VT�8kgkTFL��8Y>~�%���䶮��6_^�$�_�Y䇺*�gX�Wɦ���p�/��Q!mN�ԔR�+&<ɼ��S���_#쪶����C[��j�,��5�I��~���g4%>B����N��U��3|Q��=���*_�M���u��S��:��JS/x�#�ף#���l��&?5)�'4�UR
�Q�xǄ�'�LED0*R˛|7`��	�\o�|��elܞϻ����m�+�*�d�����0��@Cͅ'v�㬳�5.�����6�N�g�
�q�]�?c�d1��,�~�M���H��zl(xUzOn�������T�M�.v�nH{+#?���mhv�!4������B�Q���sh/�(z��a�AQ7��'��_�A��]�Ir�p�b����7uR�6�9�y���5|Q<��:��U�wṺ��]���a�&^�di}��������,ȶ^�Ų�lz�:���qŔ���4C�~.l3�W���\�28�Jw���]R�,%�/��
�$��r�lV��`��Cʍ�^E��hF��&X����Z�Up��Q���]��Sm�ö�X+���]����0�نQì�v��ϻL�S/׽�ԭ��ՕLze��+��:�l�Ĺ.�[��Ue~a'�N:J��e�K����&`U
'��;�����[�w�7�=���^��հF.%E����b��͉u!6ޔ�I]�K[�Mʟqs�Z�UC�\�݆c⺉fy:EXh2�<u�l���eN���7�r��w5�T���܎9�sՈ��r�+���|9�	`_:�6��.�ʳN{��5�Ю٣[�[(}�}zJ6-7�k��:��ٳd����P��{�~x��x_�.�d�u��>��k?.{��X��|��sY�Ep��C�YLwXcõ�Q�p��q�~�|0�aHNM4������h���39��`�_�P)$�lWŮk+��Yd��R���u�]�ґ��D��Nɢ^"�P�V{(�e��B'd�e��B�A���3��bJެެ���6/��ɶ>�����\�e} MR6l��>���ի�G2#����!��q��)|�&�l�%R?�4���3C�����mQ�ǽ��
 ޏu��-+����7F��
���M���zW��h���Ha����B�
?ٹ�Ȳ��6��U����jxƱ9j`%Y�tff�S��Y��F�3�m^�Ng�,���1��n�<�-��|W�n5�Y�߶�q4l�Ƥ����Wdv��в�K�ߍ��
^]�emc'�9V9xf�&��X��$���{����{43�pV��Z�|Z����P�CvX�fW&kxM��q!��3�¯U��m��u�M~8�d8��C�|���p�R�L�U|pRR�U�p=��L�L�$�Y��y8�Da�����e�ʯ�-�{���O��+T8�Ie�w�R�x.<(>89<�ny~	܌�8�78���8��'l^��̦9����?�ł2xu�q�����1�.FT3��� �d�W����6(�% �M�J,�>�Z��7������u�3���q�
T�Ж��+讗�O�f��$����:�	��E��Iwf߯p�i����
�`�̯�#G��V�XEp1����|��[	�sN����~In���)����UÕU�av�Լ�q�N�mc{�ٮ6EG��-}��'��;�d
�Cp�$4mNf�����qA*��H(�"�`ץy� ��J	'��:mEG&���II�[�C�.p"u h�P�[O�wOTF���ƺ'��g�?6D)�[xꓪ(WyI�>��=|��:e�2�T�x���������g�d����c�=���;h`fƭSl8
����Bܖ��ጩ��6��l��L�)��r����xEֺY�Ƈ)�'[����AU}Q�-E���;��P�:����H���q�"U��    ��^�g:�k�����`M��-����E_��\ԻC]>˒��:58X]�JOAUg�7���R����n/��<~�)��Y�M:��ȑ���_�Urؗ��,r;j��d>_֙K6�P$�kM�Ʉ��G-Җ��z o�!��l� =4_<V~h2r���'Wut?�
�<%�ލI��g6���:���&��z�gY�&�9��Q��S޹��X�GA�~d��&��脛�ZN)���e<�џJ��@4
���.'�-����\7%�^���FBStj�Q	��&_a���aJ^x�T�邕�an���ϧ������
]�r��^Ӷ��7������3;���"宆j>R��
���7J��t����N�<�+��.��<�,v��/"����I;��)����t"�_�	�*P�~�-9�ʆ��ku�[�d\Oѝ�$)@���3Y%��M���"�:�{7r�����٘m�8�+�D�vd���ࢿ�'P@�UN�.�?����������䤨�y�I��f��ֈ��(�L魙U�dc�S�*_���$���I�f�n�rV~��F�lÏ��O�֌4p�|��mi�e0Z�MkKã�R�|�J��A�t�BUc>58	C�=�v����q���t�ՆF�6k�������M��~��	���`}�:����Y":o�)\�W�&�LC����f��w�
��cq��S�z��r�ޓ��گ�ұ������e�3��W����Ŕ���~W�*�pk���Pѷ.�P�>����,��"�cz(�j�����fMY��-<M���\hd\�rRֈ*`�1�T���"�2�͢#��N�Y����G�KA��hn�uS�m~�ڴ��j�!�CfK�m�>N*�2�u����s�_WY�/��������²E���v�ɳ	Q�QI����� �n8\F�bf��;�1�j����� jߞ���	�]e�z���0C~C�%�d�P)��x�����H^������:���3���|��> �v�Qc�}�{t���*'����R���9Ù���Vo	�c�CdH�n��ʡI��������9���RlXR��U���NQu�lڹ��.Pu�uGll���u�+�+��+F��P�	Hr��L��,�bÓ�#�&�I����m��<�G֘�r�:��w��	0���:O.����b~�	W�c#4
���{׷���0*[c
盫�&軲�_��WvA丳�~Ap{���L�r�a:��h�^�����Sp	��a��z�����I���iI�d�� Ud��m[H��ΎBXs�O��6���S���R���-��d�:�G:)F)����n
�#�W\@�몼M�a��S�����"Ƴ���7��e��׏�*�s����eF���`��*�vosF�W��_����߫��b`؞���X���I��z�e@E��͢�;��'��Єr�wm�9����Y�bC���~Q�	�o�YN�p�pw5J��R�]��=��g��z���#~���I�pug�υi�N�Y��:^�MnӢ~�ޗ�^M�dY��ۭ�De�K9�NI,�#�ݶRioD��+kD�'Mi���!Wd�P^�%t�o��9;�\�3�㵭�
~��X4/|=�j�$[C�	���gܫ7L;ڄ�����z�4$_,�M�<��|����]�I�tc��wx��|�W�L-�؊
�+�6�0*�䜵4�.w;�W��d��-��*�ֻQ�%�G��C�dzЎ��3N�q�p���dW�����pA�j��d+��}=�B�����bY�ա��I8V
t�E!��+y�^���z �����t�UY��~^�>��nV�z�3�e��gݽ�(��j�V�,x���<c�kS�]#II�y����u^��ͮl�I�ͮ�#��S�N�i���RƆ���#o�|[T�g�;��=�Ɗإ�$<�*e�BS�$E��0a_���E�ɯ*4��Yx��dM��yZ<��}?����i����v`b�UB)�2�n��R��k��T)�|i_���^x�_��1��ԭ��v~g���A���F�\>��.�'�JmDDh��B[�6�;�#3�� �(�]1 !i]��c���I��M�7�q�	J��d��۞A��k���0������e���'G�e�:�N�M�z����3�j�ã�4#��r��i����v�̀ͤ3�0[�8i#��]I��s�ك�
Т'��2��j��D(g�Z2�,��S2�ȏ�����ʯ�Z!��C	sܫ�U'��ŽV���V���B6eȉ���9UwG-����|����̙S<m����Oì�^�:EsYw�{U`_����ow͙�\��8�i�����L���O�Pv�Ο��@�p��y�U�/����g�,w��]D�)^��5u�"ʳ&[G�z@9Ym���"(��\�n<�&i�nvzv����e�ŧ������m���lba�$�Ƌ��)�3y0q����eGs��}P�X�֝Ӎ�ēv�#'sjI���C~���M6�v��Oָ{)��M�����KM�{�^�/^�v��深��V����.� ��b1Ի�p�$c�vz7�gɠ���&��-�n�]A������"��R��(X�W��p���\_��'�ER��V�y���퍔u�D띢4\�C:	u|%���T��[t輪w�CR#�9_<��Ņ�.�a��z��	G+B��'.ޙ�RB5©�sF;Шό	MF�%%��j�'a4Yh�ixf��Mv����V�y�gd`r|�{��r�pY��q9YJـ��{R�_�7�}�Ka��{Lca�`D`�)�C���QQd2h�����
Em�u}H ���³i�j�/M�9�
�\���c*gL�Jbk�]�"w"�����}F'75AɃ�FE��=�2��2�-�'P9�W2O���Z�Ԥ�������̤�A��G��Z89��Ƈ�k���<�	�U)ܕ���v�>.��3�/c���v6���ل8v�2W�gm(&��Ś7��k���v��9�Z:'��Q�b�K�ؙ��1_��9�#�ۢ��͊e6I���ߥ�	Va�̯NN.q�9����`��~��5�&�C)��o�o����d��.�ӓb3C��	��^��_��Ū"M�Kp"���$5n՜�f3�f$�F���6Zpx�L�qHG/�[���I�k�EUz�w�P���Q�/}2��fZ��,����6;m$��_o2{��ϯo�C��/cj�N��Upn���l�Ҝ	7NYgi.�@�X�2k �.���������������o�1�H�����}e�mq�D8�o'hC�c�57�������]�����'n�9�2����f�Җe4_�%'WE^nW42D�lb��^" ��Re��T�+�������Ĩ�mU�E�D���q2_x��ee:��}!�u�(f�?�m�J(�$�`K%\%�bk)�M̃!(v\��E�
-�v"|��xn�Iĳ���T$�Up(��T���d?DUY�W��Q�S������L���rM����K��wy���{(����VG���ѾP;�#�#`&�=mÕ�4�Ӊ���m���h�ѳ9Be�<]AYd�m*W�e�E��CQ�ۿ-���M�[�y[���'p ��^�2�.@ ��4ߨyJ]žA]�v��`h��*={CM�\3Л�e��Geը����~y�<I��E�kLot��N$�5�1ONn���D{�EBh7	�QxÎ]��*��7���<&�O0'X���*'�Z�����y�׶n�:^��Ǿ,q�c������p�������f�6=�@�n����]k8�nre��	G_�]�C��Ÿr-�iݣh�[]��u9X�s�%
}���)}��-f�`ư��X�.�}�EI����`*��I�<�K�N��O��޼_)+L	���Syǚ�E}�C���Ŧ��v��Ya�'�}�_6��?�eh׬��bb���oLL�{���̱d�F�ꊘ)'�_��7��FY��v�w�BM�	�b�j�Ί1F�Z�K�V�e���(�w��V�e���    !��Z�eR˼.��2�0Á;SÀ%TJF��rt�5�&�2�l�A�e�#��*���o?>!m �uo?�IH��d���(��xv���y��<�ޜ�u2dSsj��rd�1���鄠��*W����y G#?���-���*1�'o���@'���P�t�2�zk)36���Uh�n��m=涇kW���Hu(]z�V�
H�����We~�,u��8
^q�-R�Y�;.)�)��������^u�"3g� ���婎#E�*�#��+�-n�+\�U͖�n��8O�}��ypl�i��P\xr����7�L����Lk0�� ��v�<]ۘIsimc��f�9��5w$3rX]����-��B��S	�������a��,��`wy:����E�1�� [�J:@��AAsGҪ����<PY���)�Sa�md/��L%j�G��E�ȫ���Ag�n�r�w�M�aS͜��A��A(�-)ã��M�P�)0s�l�ѳ�B|e�)"�Z��si2i7�6*���X#��,��>����P��&�d��>\�h2���9����ம����G��mg$��;3�,2�i,
�t/����s�ڝE�l�yD�!�v��G��P�MM�;��l����|]T݋\fSR��������'E;��gm7��/Ȱ�	^QH�r7���ʹ-. �c�`���1�J�SH��$��"��>W��W���B*L������5��0� dY�a�'����ԓ�:1�S͠�$����>��
V�K)����=�*�G��zsU���M~I��I�N�h����1��}��T��s��*?�N�Z^u;k*��7�)o*�q׊�-��5��.'�r��hvv�bj|�ܑ��\��� �9��2�t�֌���q��o�@
�F�y���yu��n2?!��x�x_����
��W���P
6n̤�뎥0\Eb��Q�)	\4�}[�h����i�*c�z^�u!t���2������v��?śu�ߌ۪(x,kо*�[�tp���`k�xj�W;��/q.<U�vk/q��ߙ�D~.�&�C�
���Q�� �Cn������C�R��r;(-��m��Ow'2z��ܡ�����`,1��d�$���܆pk��WtOg��bd��E��T��T���S��85�+xq�΋�NTR�ON�m���y(��{�ϧ��8���ͅM��#ߟ)Ⴈ��-|�+�F��Hn�]��?�>Re��S�4J��^�4�dpX�2­x3�N5�FD%fH���y}(�W|f�C�S���Yj�<�TN��;�

��ur��4\s; ik��M�J:5���Ⱥ�4�Q��>^���&,$������zWq��,�I����v ���Ȕ�F`i�=նp���N�n��m��i�y�t�Yb�����&L�	��M4�ɨ�����#��n�.��>@�z~wRg���^�i�V%�Hg��t�P)�H$�xj{�K��V���G��%�9�~[oW��)�n7�zˠO��7Z��&-�p�@���8a
-�7.�(���`��fF�Y�v<�`�Wg���G�i�5-юe�e?�Aۦ=�#����sGĦZ��K�.l/t�"ԁ��
f�1�mN�J� �m�N�}]�[oj��\K(4��~��LCC�p��ʹQ3$j��6���ɷ�u'<:<�FH�١����&%�l�78�~U�s�
�'�'r��,�Mǋ˨N�AZ\	?GGV�٤9��L�Q�����f��v�ȶ���s�.й͒�H��;�IN��+��X��:�٭���]\�N���d�3*�7�Ԙm7��79���1�2�C3�iKu�rzK�ƫ=�7fF�ܭ��Y��}s�'�j���/2�pK��ø�O����W���>�vQ�F� �I�2*4��X�9I�����W��|�H*�L���\iz")�1��Hu���>�3�Oo�V���_��b	��e&Kתl���bk�(�Ffa'��+C�q�B+�>�,ZI�~�i�I���.�+�:(��z4�	�F�*Q�HIYT�����H��qG��`H]�m�t�iV�3���d�����Lς�ñ�aL�3�yG�"'os�U����P;��W�Z)��Yg�3�"o�0
r(n����Q�����FԄ��+��c#j�ӈ�#�K0fd�KZ�n��)���q�����4�.�Mv����6f�8J(wV������	d�I/���ދ!3�"���v� �4��Й�F*�5i����SMg��&��M�����L�3B�Qn�*�X6q1S�l�i���/d)�c��N�y��')���0l��-�?��U"�Yq�}x�7H���L�(G�ݞ��/n{U�>�pK��x������f�"#oVׅ�G�=;��f��}㣜��L�aK:S9���x�Ż:���l������CI����n�2��0�u�9�l�{c�R2��X��&�X�o�W3N�'�cKk�{qSWW3�Qڼ�ˢ�6��z9��?3+�D�4cϲ#�O���މk�����j;\�S�XBv���O]��DK$�Mޖ��Q������))�w�p��
��0���!9�2��0"��ipX��F:���_�T)�<Qd))n���e?�Y���?y�r&su6e�\� ��E�Jd����$��ʓ��@���<4��hjC�����M�K��!ܽ��u����q烆E���A�$]�"�f?�zr�Hr��r���9�YU�aH�}
��L�k�?a�f�F��6�NYޣW��do��m�Y��/���}wf�{���zʼj�1� Z��U3EQ�7v���W�f��BQ�+&k�R�o:�(PT���K"o
8��ݹԡ��ve�/uh�m7.��P(���&;{e�`a���!=�}g}~�T�]�e]�E�����P_כ�T��/�eݐ�S��	��^ϒ��4�L��`�	*\�����X�Kܗ.��ҿ'e*w.i70�r�m^�,�j0Q̦�m�<<�YG��D���#-tu�`���)�PJi��J�cؤ�>�)�����nw������lF���.�Av���i��{��b����L�����;l,fs���}f�M�V�Ō�e>H��w"V� p�K*y�d��:F��,��ԑ�.�BH��5�ږFy�(�k��/�|Jx�P�kLW+��*獯��3�	�gu��r��5�P�|=ظ��li��h�ڗ���z6�,'��$:<�^��Jۥ��d��j��0t��7c(��r������������q�j?�����9�!�T��S�_0Rջ�<���poG�e��A'>�kZp�;˅X�d��.�W�i���ch����O5���K:��q�@
���%��o���=��J��O�� �C�'ʝӆA_*w~Sl�ݛz��a	�2�C�u����]��.V8��Zh�^��h��S�f�9B��,�^�|�3�����d�ٗ-q6�S	w�̠�C���/���@���yRa���F�2�]�aT�#X>>g$5�-_a����{��ڷO6���p5�6ڛ�IڦQɉ��9�i�N[o�fn�mL@L�e�Te΂鎬<Z(��Tn�X���r�[]��9Z�$>Zur��@Fs�d�#;ԇ����v�
�'�̨�'���f�=�|�DF�'�{�b]��h�z�2�`�7��Š�s�F�:�GtΈrRW(,/���o�ٮ�M~(.�nޖ�DQ(��~+���@S��
9�C����0���
��(�M���:~�f�0w�X�f٩�zC>A�˸���pΩ3�9#)��,w���x�y_"���A/�V�_%���¡�kJ��HUK�Jc~��ي㪮n��m�C�op<��a��7xӅ�W猦!p��Mr[o
G�d����L4�����xs��-��ܻY�V��'5s��i*ڰ]>U�6g )�W~�mq��9[FhG�x�&�cu��΄�(Qd>�#�L�/X$��Rn��:"�t"Mj� �R��28��D8k�2-��<��:ݛ����w����~*�B���n_�xc�IN's��Y�Ԭ]f��|
]�(γ��)=38|	�hSh�jI��    L	M��cFF�Ζ�Jԍ�D�l�vF�K�1��\zn�[��z�~�WŲ�x�@xz�ȩ���S�"�2�ǜ���"?����?�&d�;Y�:0�P�����J����-����]�t�.#�*�M�tݯfCj�Mh>��>֊T�]�ɵ�x�,�p��2Bx�%;{;�t��p�XB;2�Z�7Ŧ��lc���{L&3�_�gy.���"��c�Qq�����2��'�.��&�u�NM�3���u^.�(>	7ؿ?kx@����&�V[e6��-\��`t���v�%¹+�9�
�u�ZWk����0���o�;�ԧߪn�Vp �1T��[����
�FQ�:xY�$��h�~~I����s�R�h� �b����~���$��w.�}Q�[�MU_�<vFAvO�B�%��r)��>��B�=-~}�X��Z=n���f�>+WF�0a-ݬ���U},�y��E�>����U�3%�7:����FLЌX�{R�:χV���:A�4�[0��:�F%w|��m��y?���R��v�M��K�Zу��x��E��uh�|���kA] ������H�U��۪��1R&�h*i#��湍��$�xn!I�9�%���B�]9��N:����uO�T���T���o�X&����trʮL*��,�ߕ������Ԥ�w��l������3';��l�}Ҝ14ޛa��p\%�E���mm6#��\��r���Ԏ9����2���ʑ�3��$�Dvo�j�6��M�o�����K.}��j�")Z:���؆����"�}Z@�a���M�򐠖d�ght�b�������~�\����Y�&l��lP��Gd�g�F����;�p�\\��Cvs
��
N�Z;Ek��z4��&t9{���K��]SvK\�c\�mځ%�	G����O���n�8B<�K��ѨopT�����h-��ؠ;szd���G�9�؊pʢZ/pG���H*��#R�3���e殝-C}6��eC�C�ٳg���Mi5��lY���
�Gx����/c��]9n��;$g�	� �AhH���D��Y�I=���*�h���ʄk�8�I[+��L-"(�ǻ���`�Mh����8#0Jـ��䤪7yѿ��4�pq�e�LeG�3�q"�Q����	~�K�d��5|؍�����oߓ(�`�o��������Vc�nrB�F(�n�:�t��<��j�XJ�QiI�*�)O�hb{њ��ƕ�
�QC�#�s%U��l�f�"���ަ"���e����k��gp�ݘ��f$4k5����b�_�c�	������XÙ�6.�N��(�5��\Ç_��=��9�Ԣ.MM5!�M�ߴ�|�`R��=1\�Z�FB�ߖ-ohjB�a�$_,�M�ηŒ���9���>��R��O;���J="��-v���N��ad�	W�)#S��5U����M}S�b�����M����w"#]�˗�zF���m5N�:���]�U}3[JK�M�b��0!�❾�g�Pt�Pf�r�Uh���X���zO�o���g�$�^:��朏��!*�*�q�\%�b[�ވ�N�Åq��h�|�[w:� �]Q&7؍�/���:Jh�1S�=�ل�c&��(k�f3���lj��[��U�_8�:k��(|�U�㶿�D�EC�����~]��|S�V�?�:X���e�A��>ᴣ��TO�:��k���^�]�:.�3�u~�oͳ_w�&��f&%˛�r�<�o��.2X��^�.����b\���0FVu�Z�ּ(���/8�%o��0�T)�Rf)oG�L:�F8�h֠���@2Ѷ��a��nk�a'U�eD��*mN��MM��5��Ƕ�'�8n˅f��Pֶ�͑�Z�5������E^�<5�n��ɛ�wfWw񉔭.��/F>�i�Re�{X���yX�LE�Ӣ6����C��u�2ֹ�9�;GL��FM�n��dM���Mt�=g�ա�	� �S�����۶�w�=�d�O_��:?���]]כ����e��Q����6?8���|;�?9�?�,Q���R|�S�Y�@�R�
i�2�:FD�?`Z���(�+���U��_8��)�yw���x��j�cC��D�cC�G�FJvO���}��T�ߎ��OrlS�	��~��̎��Ч�E�6C�?�_O�'��:�iPQ/���L�Q^�ʊKh����<�%W����ql_�Q��/�3�����e�����]�Z~[Y?}�?%���Ϗ��9��Bxr��A�8S! 3�8�>?�7�v@���U��n	��V�J3������Q�{���\�[��GoP�u/4�;�R�/Wx�.@���n��q������,������~I���S����8b�mk%��J�̖�I�)���+贮V���t����_���X�_��z��0༿^a_6C�5�x��&aXH9��9͔΃�oӅGV����(P6�r�x||z����z0n	�8+;����������'������)�?���~$[VoJ�q/[h՛�C���o~g9Δ\���f+���yy4P:a{ŝ���n�(}y�ʌ�8���Ц�Ba����*�Oq��K��( �d{|��'�y{3�,�"T�̔��I�U�9�%y���cA�w�In��{od��7�W�`]i�����'�8�9O��?�v�8f��& 8��Z=Ǉ�q��(cg�x�c��`��f�X_e������*R>>&a&<)A��V����"�=�p�3��I��۠�)Nýa��O�)O[o��f~|Y��{���m�x��M���)v�K��0���8K����/�����Iu�������-��m��w���Ұ�Z�FHϻb+qi1��9,7�׮h��W��']��K�����o���X�f~�u���Ը:��z�fH��a����������Y�W8WIR�JP���_��xePr��=>����#^��nu���8��~�Z��#Et�r�h����>��^�_�|��,��b������;M�a��f��+�r��4#�=��~��9o���������p�-��9%��7n�n��ǅ*�]w���{�������Zã�Ex����;��΀|L[w��2�����4�p�	LH�L��.���-�Tȸ���������4 5�p�5p6�X:^cĆ%�!�uzt\����qB�tƕM��!j�������;�@��f׫ �q�D]�����w�k�f@߆�^���w�����!l��:��dy�6�r�;~x6dH����4kI��x��%#�璘�5�^�,�p$�]���3�M&u�H"���T�?��>�KY���c,YS��������U)����1�����`����`x�Τ�vRW�Q��^=�{�D�	�wpv�!�{�v1K�������p^��Bk�#ny2�㨎�Aw�t�A�H��xzB$��/8w�1���Rַ��[{�����So	�t��1N�I�u��Q|3^��!�Ǐߎ��$�A��ǆk�:*FY_�ԝhD��J�����)����^���rBl�1��[u��M�>�a}g�*Ф8�t���4�e�Q/�H�x@���
GF�����1����ݾt�� r������O���������uPS�`�x�u\η`YsygzT��@.��~�ͬ�%�ݜ[�/��w���sq�񠘑������Q�<>�.��.���,�(�,���n���TX6��Zzn��x��T����&�\AP#�lvÆ��m���l�k\�}����&�_x="�����8��y���n��S�7�2&4)�ޟ��>���t<UC�D?<�8U��~�σD��D�N��~��t?�)���j�jʎAU(��u�HI���~�<�γp�c�<;Ԏ��s��� ���y{���n0R�';4
��#���n��B	˯HN�p�͢�G1uY�p{�]�XL(
�zJ�o�@�~J=/�c��	�y�k�&�������i}���������T~�;}Fe��Ot.�����L�A�i7hk(��O{�W�;��!�H��pŞs�.�M���I| �  �^	���>��t�O����?��b�M�s��zV����j4Hjr8~;�k�T�};��r*�^E%^.�5�:���T��Q>Yo�SME�y�I����FS' �K����d}z�����43�\,fBY�j0��~��>�ěS�'���.+[�X"�nqL#Ƒ���߭:�'us4��7����y��EQ������$=є7-2k�zn/�x5fd�>�C�B>ɹ!�D�ֹ�=��	�h������s8�'.���"i�~�r����P�=�e"wa�2��2��s�˳�C���I�����o�_!jw=�+�Tf����$�ƌc
"�Ґ���0�;3I8�t���^��}%j�r���A��\�CKe/����,$�A���������?���iZ��w:���gb�"�������=�q:�����p�횱�n�bC�X4`rr�������1�z��	�F�;����^�wc��^L9�P��zf��
YB���3�h@������3ZRc����t4ގB��Q�4�����~�P�lFF�Lμ���h�&����v�X���RJI��o�Z�h"���<��Z�����Rc�x8>�~�4Xu���+�"�ՋiU$����i����C�
��&Б0T�%9.��A~��x|ףN��{�Qt
;���`��0��շZ���#Nk'�]z"���o&��������s�χ�A-4:Q�G���d*cF�7�N#�"�<w������8q�/���%����ǙB��p���N~� K�s~��}ȰdZ�>}��4R�&hE�u|Ԉ�������(���%7Ǐߠ��1t��tܙ��N�Sʩ�tG ��<t���~��<�����d��䕬���U���x�/��\>ݝ�����áe�s��g����/��v�O}���a� 3�b����.�=�fT@2����d��fGxN�B�W���2�����/�t4�6�q�s�KA��<�8v��V�"�������i�r��L���:�2�":�h����4����F���k8=����id����ez����#<fz����� "1������&��e�X��>^g���Ǭd\�$���.��U�S�+[��O�?Zڙ�� �|���x��c����~R��2�,��X�e��u�`j��|�SX���P����s����u��\��b� )���e@�m��kf�W�o�Ix��l?ܟ>A����%�w�$����Ӈ���������!��HR���Y�Ӽ�ߠJdʱ�S�[��Qr.|r�b�ru��"?`��/M��u��(�S����۔c���s���� ������)�ǯ�3$��{������.���h��x�K{%5�:�,M�"|���5��_�_�/p���o�_�_����8�����������_��_�n�Q�      i   r   x�3��L*��RN���Ģ�DN#]C��4���!###]K]CC#+#c+#s=KSss� 24�2�t�L� H&ZZZBM��j��������������)��1z\\\ ��%      k   [   x�3�4�tN-�L�442# �4202�54 "ΐ���l��̂�N��i "����R��D��������@������� �͹b���� T�      m   >   x�3��I�L��4���C ###]K]CS##+Ss+#K=3��gHfJb���b���� M�      n   I   x�3�,N,)��)(p�J�N,*I�K���L�4���C ###]]##C+S+SK=sSScc�BC�=... 1�2      p   �   x�Ő�
�@�뽧�����i#X�N�jzz���cb��u�ea�faf���w�M����3�>1(h�@HT�/�HQ���$��}Ce"�}E��:�
v���O�� ���K�#Dt�"�,����:��qڇ�3Cj�t�r
��f�Bi�5.��
e':V���̚��B�����      r      x������ � �      s      x������ � �      t      x������ � �      u      x������ � �      w      x������ � �      y      x������ � �      z      x������ � �      |      x������ � �      ~      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   3   x�3�4202�5��56P02�2��21�304312��"������ 
�      �      x������ � �      �      x������ � �      �   �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU      �   �   x����
�0��s���%I�8��F��b�a��?�6��0� ���	��O��&�e�ʺ� @l�=D-�-Q�z�0�Q��ؑ��DR�5޳��M�_��+Th�����b>��5s@Sa�N�������?��JG����i�*�l� �@p>Ƈ���$Rh�ۥܔ��	)�Nq      �   i   x�m�1�0�9~(J�H�PX��;��"y��J.�r�'T2�,w�g���N���NI#K�X`؂"���m-�����u�ۿS�΀A,�������5e      �   �   x�m�;�@�z|
.�~���PR��s�3��� ��v�dY�f�ry��z�^x�����e.1�秿�r;�6$
MĦ��l�iӏ��rｨ�$xF���ȳ�u�"t�b��E�*���t�&���.&�����6t�	���P�`Jԧډ	�K��T;1�}�O�/�_��s����3��h,X� �Zʏ      �   e  x����n�0E����d!	}�K\�A'������M��li�Jy�B�1s�X�^OhQθL���$ޛE�B|��( ��y_*���
^��|↽�r�6-�}A-J1������A� 18<И]��NYe����f,~�%�T�Ɂ��&��M9aE���04��ΠK��>�Y�C_Y4��0�%^��ChS3����q��q��^�����Wi�|�*�H�Z�wef#'F����;�w�k�qTR_�\_Z�?���Q�IM�e=o�bjִ��Q�Ƥ�]����G��roa;g�^���j�_q��nĥMѴ�r�������)�:u��E\���D<��h1브)�1uo�u�cI�~6SZقK��iS����?G����)�<u�&�8�lƅI�0�z�l�������c�\@�S4���t���ؼ��(� P��CX��@)�9��ӄ%� .#׶4���+p<�?P)��H�_[���/�U{�f��^L��@a�fl�̼���d=8�����t�fXB�i�G�ܽ�n�t�Il�9��"gw��,�%�c���/�y��+��(�e!^���<���(���v��(��      �   �   x�}�A� E�p
. ������Hj�`S[������&F�Y�b���c�a��U�jZ2Յ�0#��0 ;��,)�:��:����}�H9f.}?��X��j�s��o�  �&�**=WW�����fIL�tN|~Q���C��N�+��/eQ����F5�cy���q��_��=@:X�«�\���h/O�      �   �  x���Mn�0���S��Y��v�ӈv �$)�?G�LK�,���^U=#� �!U#,����E&�g��*�ԋ�_���i�n��V;/,~�(vk׶_buC�߶�{u�)����� }c��h���܎ט �Ę����2�k�T�5V5��Nx�Öi�0�����������v�2�;��B96Ú�!�����K���$��N��Ֆ^��ʰ@i�o�Pg4�؉%���j��	��H`4u�ʐ�i�"q���0��S�\I�|)]���k��RZ�);��ԥ��~��
�٩K����X�%��j�s�1u�qd�����V��	ӥ�W��OW���s�Ak���@�S�U�[i�>�m�8��m���a(w��R����2`.��X�]R]k�gR���ǘ��l��~�O��a�w��F����0��<�j�i��H�(x�h�lɀ��"�t��~,�S�6\9+ľ��x�Ǚ#Z�uz��_.�/�a�      �   Q  x���A�� E���@8�@v���APU��?�@*u�t$F���o����1Sjϵpq�1���1����'	���%G-���Eӱٍ4S��B���a+���rB	�A�$)�N�[,>?�V���r4���b�g��.%��f)�j�3���ί�\kv
4׃�НV{W�ts*]�%�-�9MG�pV���q�S�۴Q���AX�z�~w7%�s�ף���[m��
�:�klO��KQ釻9O[QX��_�Ps) � ٺ\��nُ_�
�鱬��螏�M�AH�+�U�c�\\┼;%�^��_~�r��s[��������>y�4.b�Y      �   �   x�u��
�0���)rl��M���m		A���9�#�C�83���[�Gy��PB�Wа�OHU���J����
�2�A0yH~�y���Zi&n�����r�F����,��l�C\��}Ii���cP5��݈M	!^8�      �   �   x�u�A�1��uz���%i�6�]��� �.~����+�B
Y��{	n�6�������9t��D<!�� ֳ����`}]�t^��9�1�E��n�E��'��D�.m-ZǦGf
��0�e{�D��}ѿrm��8��!&����U}i}�1sd�s�ojm=v'�����!���5����On      �   �   x�u��
�0��s�}��$M:�[dS��J����ϡ2q �wʏ?��Nzue��f�l�sD��t��h������.C�Y󥆱��!�p��`�az��Ɠ�z�Sd[F9�l�:��q�٭�:�m �nr:�bnCfW�:�k&0������Z�s�@�n�]��|fg���η�iGv���?UH      �      x��\�r�8Ҿ�<k�f�|  $sY��"�<��<�\�5�_@J��eg��f�8��>7Pɱ����v�Ǻ�Շ0�ې>և��|�����|��$K�w	�љַYu�t��LɊ��Ȝu���Lrl���L�n @���z?,(��+�KU�����NW�+
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
쓉���J:�Po�٭�6�⋉^W�0��`,,<%+�@�|�����L����9Lm�j�w �B��&7�o��B̎����o�!n6����k�EEh�pB�������P�ۏ�ۡ?��U��>=���p���S�>��Z�w���u����4z|[ ��+驲2V�;P3����!�� 6t5#��۠M��������M�mls�f���Mpz��f}m+>�q�~��#�%N�#��^�H���"�כNG���NR�뉀�ȳ�tL���P��31����t�	x�/�p��g��3�������޷}�F�ǅ��6��9����+7��|�������@�      �   %  x���ێ�0���S�rV�(�&�Y�4�P#��?�:@!ZMg��W�g������)��;4�m)t�8O��bz���i��#��|u�\�/w�P!*c+Y0�mi6��G 2����;�[:A{gO�=�D�vn׹Z3]pW�'8��o]m�*�b�@{�7�#=A7���*n�u*��z�7!M��u�R�WO��L8Bk�����>gR,�=n`��;(+)N��x�b
�c�f=[��Z(]dف�%=���0�T_��j+U^�?"�a�Vt�M�� �Pe�y%8�ƨ\�|��|b� ma��"L�8�Q����HOZ�����A��#�ȯ�b��?g�"d�;��!
��i����;Q�Z���I'�����fDbLN��%���_��8�I����L�l�7�3��:N��p\[��D|{�K��<NC�v��~�͋�c
=³	���������}��:�k����LY#�����`E��1�94h��?����-��°Rj�v�E�����ǒ�E�o�oPJ��~7^A�|1B�_��L�      �   S   x�3����S�,-.�,��4���!###]K]CCS+3+c=KscScNC�.CNM�ZL�LM�LMMM�!Z�b���� ���      �      x������ � �      �   �   x���=
�0����@�e�-�!B�v�"j������צ�й ��$ާ�9M>:�1H�p�������<'�&ϋgG�J\���)���ri�zV�<����ҺU}��4(��h�Z��
�N{������!oS�V��M�	�O�n�"ģ(.s<|�t�W`z���ck���MA�B��\Y      �   �   x���M��0F���@#�$�g���d�v���1a*U�!y�����6]�%*'�lE~�C��^�����B��F��z��a�v�1�T���tWs�nR��*Y�o�g>&��E�bO����?L}3�Q�,��u �`����Y�fQ3[���[HO��)�#�6�����Uؚ�,k{�J����$���z`�}8T���N|R-      �   |  x���[��0E��*���$�"�h0ȀZ-���1׆�F���$>"E��˧�Q����Qt�D)�Czt��[y|3J������<�ؐ*���>d�fʴ�E����1��)$�ܳ�)k��˜���S�g7Lԑ���$����S���m"�{�zJ�B���6�����:~P��5�G|�W�>�[�O�O�B�i��5�r�~�%%��+e�_�A-ξ��췖�~������n�V{�[0=M$[���@��m��(�¨�=�M�j�Ʊ{9��ޡJ=���L3�}Lt��,C;�'0����uӆ!�)t):���E7�paHZ����E�S���)��s4C<�F,�qK&��B�\[<5�%�f��!��B�e_<�:��7�"8����P���}�u�C�\�aJ��S�P�F3�|�������laJ� �n&�x���R�+&�y�ah���q�-��_ϐ$Xb�3��
cŴ�cJ�u�,�0|��/>����0��עK+_d��y�z�����q�v��u��3�z�1/�A����qUaK�ZG�g�eVaZ"�)��e�6ݰ}훶� �/8�B+&mv�7�\���-C�����Ԍ�w�0˰�.��E�(�L)      �   1  x��[ێ��}v���#l0���tP�@ �VK���q�|��gFZ��4�3gU��\�UE%^�6?�l��b�Ѝ������r�~���\gR���y���}�K#�L��L�falc[�n��3��a2O�Ż�n���n4����lC��Y͒]Ͳ[�ıJ|tϗLD+]��>�tb��4K��n��6/3e�}��^������4��������-7��8������7wj8Ud+��SF����3F��J'�[~*�%Jҟ9��p�(%��<�fq87Tɬ��'
w��䓩s0�ê�ɯ}�?����q>�������ƹ���/���qf�������[P��-ؿ�y��~�?-wr�ĳ��α���\o����q�.�k_���M7"3]��~��A8S
-��8�0_�T)j�ݖ���{nܿE�Oz0��	>n=�ɱ�2��o�s~3���]�3���nFG��FY�i=_���;�,�:�7�Ҝ}��p����Hy�g�u�����kN`4���~:0�(?��B��3�-��[����兺h�^\ǏԨ{	�(�у�0�V��B�޺%3T	ػ�Qr��qi_�� �ff=������١+�E��j�83t#Fs����խ�
t�73�%�{���6b��� � Ŷ����W8W�B|P��>z��
wuU�e�PdV��+M%�SZ�@��U%�y��k���*|��%�~��&����iR�t%8ly���9�:n'(�O^�������5�����IN��S�.�O���֧�+���Ss%8ݹNx{�ťn�m��h�W
�6��(ݺ�ea(	�K�ӟ7�A��u���c#Ȇ�Qf�A�A)DX%��|�G�C�C�R<��ϫ�QG2�:�n:���7��~�9�k�2R�m~������4���;���gq�4����ͥ�'KK-ò���-��V��ڭ�a-�� ����а@8j(��o��Z�#-s�9=Y���ĸ�s����D�wi�:���w���~tt�Xd �'���h`��/q���J��Y���n�A��,sM�d�0P]�и�eΞ~^}?���Ck���ҙ����/�+���q�*Rژ?�뇰�X\���E|�,�J��W>�������k��ĩ�u���/��t�DG��+�?�忤��5��<,k[O8�¡�+mMH���b��кKX,$�U�l��W����p%*�]k�F/X	d+������q,'��n1��XQ��������J<fJ����P[H�^8������[�|_��B|XPd�+W���%,(2X��>�WS��aUQ���J��"���O��9�� �f7�NOg �=�\�]�-�>�x��sHX]dx�#�- Q��̽*:�ӡ\IX_d�Yp�w�����ڰ����ktWV�GC㵟��X�$Ц�(�o���7�9Xkdp-8V���IQ�<Y��^<Aq�ɆfMy���x��v-}�z��ã���U%3�����l���� G�	���刹�!E�*$����,C2��B3Q�0`9�ԇ���%pH󼊂Fx��h�[r�k��	K��r���7X�d2X��3o���g��yV6��&�D�w��Sg �B�� r V:�B�~���0XT�T��,�{��l�#(��>�.���'��p��q�	˟�e|��HX�dʯ38dB b���3��������H�K���P��琰a���{v_��	d����pP	>�[���	�m�I�yp�뙌��iz[w΁MF+?��<6�MA�a�86S�R4�ʰ?$����X�w�3]`�5L��6�P0rЄ �4�G�T����Ѵ=|	f�V3�@��~%[��\��&0�����(x8���&Cyb��ZT�nX�d<�^�>����a���賕a��mT����<�`͓��Y�s�k�6�>m�=~FMk��.X��E��b��O�lQ�����˲opr�����^������<ɷ�gc�Gۈs����5���[������y���]��$�Fd��c��a_�בquRb���&�̉}� Ƣ7��Nr�Bh|�eN����=X�ν$�F��B&� :)V2�ߍxND��:��2Z�ͺ�Vt���<
��Fu�1q����Gu�Nw�Iܒ������$n�V��iƭ��F
�����<�>x��I
�&J&(�E���u��Fz�j�ڶ� ﴱ�&*N�����[Q?�Ƿ�)�y�C�vj[��:��xxK��.�;�n]� ��;�ly����ãd"��v�h�C����}P�J�aw��ID�ѳ�
HD��j��O
hJ��F�&ɥ��L[HN�\"©��ns�&E/�jPb:��q�z�oa����*��v��EC������|�p\��-��＆^7a���Ŭv'�o�*���%	<R���y�V��E�"�[�V��ESb�n!2aON�UĸƘ�g�n�����K]q7-aç8���s������9���o�$��6���G�J	ץ������K���t�iZ�~���N	�v(Ɠ�7=(��ȟT%��0�%M7�,�VqF�t��r E�H��g�Q^��>���.�wM��?r�Po���G���D	u7���}��rj��ʒ�.��W:%����ؚ����7X�/^��ǐTA��Ț�7���@�o4�����C�u�@�%&����(�z�D�5��|���%���M7��B3��'/y(h�}(�`�f�Iw4 ð��lBAH����hg")���ab~��H�byj�OM149�F������^�S����F��R%���4E����:����Az7~�4���7PC-p�vݯ>�@3���\̇[^PP�����.�ch�(�+D��DF�)�WN"�.��3��@�����c	4~���M_�,|9x�����a��#��~��TضW� >Z�P�S>:l�<ď�~:�<��ɋ/.n@���T�͞����	�s�(��S�F��B�-؏�B>���ц>l�\��#����?$ghv-���nuʊ_�0p6V����\.��àt      �   �   x�}�K�  �5����S�n�] -6|v��9D����j&yN�3b�}7΄�������b�58a�t�&�Ȯ��W��.��������?�6�&;���癬1�����pS���:\4{�S565��X�t ��W��6$�|��
:רj��R�.�mf      �   �   x�}�M�0�u{�^ 23���@�ݱ��c`A���+*�tj�]ߗy����=];���m����n��Qy�Q�)�0�ԕ�5u�ZpR��p���GĠ�:;0#4�6�t�Utj��Ͼ'�I���bׇTƨbV~>g�S����C�t��g����;�b�z燹����� ͛��Y�w
�����Ǵ�      �   }   x�m�;
A���^`��{��	�c��?�.(�NCe���c*�AZ�x�y˺���,R1��I� �Vڡo�VGF\�961c�j�c3��6;��b:ű��i��m�߆�lg���J�>L�      �   �  x�uT]o�0}���Z������2i�����/fɂpP>6���NB�*Y)
��{�Ϲ����	�)J�/��ϻ5Zm���r����n��  �۳�PB�=��)E��a�8<��/��QJ�Z��k�Z+�2��f��(�����P��[�SPE���DM,X�撗mU��?�<�)I�Ą��fB>N�ɏ]��2=�A�ՉE�#Obi2��r�>�����`���lIջ*{���s��5�T^�c�AY�%p���U[u� ��C��:*���>�$?s��BQ�[��5e�P�� A���$����-�vU�թ?�γ�q�0��t>���·���?Z��H�I�hL�����nn�F��}x���KN��nu������:}�M|6ysə��L�i����;gܝ}sR.K�3���P��rXG �3ŵ=��b/g��u���>o����M0��c	�T
�n���MQvn|�]g�e��I$�qD��s��]?v�n
x�$\eT�E 1�z�}겮�|��;}�C��[1��Ʉ��T��U������o��2�Y�M��V���=6���� �`���N}���[jS̇��i8��
�0�d�2D�/M~�A�!1pΣ���vlo'-�"��]���YnG|^�ڸ�iA�X�Ϝ2!1� m_���b�t۠�      �   �   x�u�K
� ൞�e�P�1�N� ���!���!�ì����4m���Z^���{;�Q۠�pD��������.����v��'t��e�JR�{-���!K#^�EM��:�G�7���#�)�t�1s      �   i  x�}�]��  �g<X7���}#��(%��I���vb�(|3��`����Zn���G�k�_��`v�`{�����eu.k�Esi�z~y�B2��SBX6�۲�m�Y�=��[e�@���<C����SLf��v�5��d+�ܣ�q�Xg��%��2�f��&�wp��z�&����ݜ��uPt�i�d!���
��]t�27_0x\BӐM&��R��LP�M�_����=��1������Oh�G9=K�[J|��s��2X��E*��
�;g0Q�hakj�,��'v8�F[y��]Җ�ʁr8E�ri�\i�"Ջ2M�l!���T�]\٭�^h�C��(�_6���      �   �  x���ے�8�����v����N�-s,I�*���B�a����S������/X2�eZ��3]:�s��X�$K~w��8ϊ���L���G�����/�u���uf�}:�y�U�����_~/�� {z�(�|?���oڴZ�f�]V��qBL|��4f�_U|jlw�ͰJ
,��2m=��r�[J%.D�z�c�3��2/��4�&���$��:�����̼�H�jET���k�>6�
f��XNr�M��S_��C����g_�m��t�i��-Y�=�͵�dl#��f����2$����.�]�����;˨z��_�r^&ބO�~&ja0�,�Tx��T����Q.`b����#��ɶ��R�jR�U�8�!��`�3���a��;���('1��C��^]9���y[{�y�a�1�dlsYm'�'W��h@2�v�n��~Z�76 ���4ռ�r��nZ�}�r��WA�[d\�O���j��e7��[���;���xx�q��[�Q�l���ahkk�h8���[�+5�$�,��c[}0[l	;q��T�4v('Ͼ|��q#� ����F�Q�H�K���*�;N�����״�@`,�>┏�Jj83��ilN��3tv-s�s^$���:��䮱��)��)i5�%�a�9�q�%p����+��WN���_����ϱ��S�����p4D_��X�$��1�n��G���ͳ�X��5�/�g'+�,�r�й�>R�¥͹��`���]_�b��)��"���:��P0���`[�nc�)�E��
1o[��p%E�``��n
G�6�`��L7�+��"k�h2�o�M� �*�;i4|�+@�d1�d�
�e�����	�3U�N.ps��=@~h��0�d"��'166?�)���]��&ӆ� �����9�Ob��T!�k�{��v���i2HVj�p�u\��y83�JL y�K�F�\O�(f�<�����>���$3�T/�8&��R�`�Oh2{H ږ6:Pb���!C���)�j��c��ԡ��5�t�z�6[��&��b�&�/m�S_b�P�k2|(�3]� ��M~�Qy8�L��Xw����D�ݨ����3:m(	��Ώ��,2:J(���vX��2���'�b4��5^.��X{D��iA_�xr�s�:����N�q�n�#���:{�����.��f/8x'{����EspԴ�K�;�����d��>��y=E5F�L(Z \���e���Lf-�:L5��;��D�YB�����X��&����ԏEb�ɨ����!`�p�t�;j-4���}nwN��##B�A���l�q]`�ȈP0(�}[`��!�A�,����J�<���X���_��H�� K�cd�pR�W���1�dB)�7�����]��&SG���>+�*��������C-��      �   �   x�}�Mo�@����+�`�\�a�"-��Z��̈́�[q$*���4�tלw}�H��.��2ꪺ�SL�x�ل_r{�.8���"�nୟw��p�+s*T���g�Sv����/lٞ�v��/� <OL�B�\��I!�0G�+�|8��&�Q-�����2�͎�|����i��{}���al�T�O�l+_b�4�ݿ�Q�k�4�RD��nk�q�0�Ff      �     x��T[��0��N�HKR�D�X� �&�5�&A�ܿ��%��lð���p�dP�>>���|��W��ȁ8���B���|�ڌ���"���u�'8�M�5�|����C7�y!)=;$[Lj�\H�q󫐏�h�Re�	Dz��XU2ҍ/\Z �(��O,���K�EU�.�^�	.U�5d�"��w�z�3�)���ʈ�74T��M3����Q�<���F��*mZ�B=�̾�\(K�Y4�8�PՒ�xƐ(�J�`Ѵ�5�_���M��'�*��s�7�`e��仒�F�J[��qܽ?0���� �ΘPc���u��MF+�\ܧ�3hM��Ӈ�Q�?r��6�8F�;yё	ʢƕ^rr$�q4�uz�NuY`�z�B�ث�vh���h����Nm��򂴛E-�3ʇ�g�lI�&�e·�~XMO�pv���8\ޞ0���pro�v���o��ֻ�0���z����
5HE�%1w�
P�h�����~�P!�      �   R   x�3�t,N-�4���C ###]K]CS##+S3+#S=KKc���_~�.1z���̍Az�9R��SS2������ 
�"�     