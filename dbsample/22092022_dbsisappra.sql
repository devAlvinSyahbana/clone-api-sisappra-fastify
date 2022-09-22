PGDMP         )                z         
   dbsisappra    14.5    14.5 B   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false            �            1259    27512    kepegawaian_non_pns    TABLE     �  CREATE TABLE public.kepegawaian_non_pns (
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
    kepegawaian_kelurahan character varying
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
            public          postgres    false    229            �            1259    27536    kepegawaian_pns    TABLE     �  CREATE TABLE public.kepegawaian_pns (
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
    kepegawaian_kelurahan character varying
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
            public          postgres    false    288            Q           1259    35636    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
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
            public          postgres    false    324            F           1259    27964    master_sumber_informasi    TABLE     �  CREATE TABLE public.master_sumber_informasi (
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
       public         heap    postgres    false            C          0    27445 
   auth_token 
   TABLE DATA           G   COPY public.auth_token (id, id_pengguna, token, create_at) FROM stdin;
    public          postgres    false    209   �>      E          0    27452    dashboard_kejadian 
   TABLE DATA           �   COPY public.dashboard_kejadian (id, nama, lat, long, kota, kecamatan, kelurahan, jenis_kejadian, tanggal_awal_kejadian, tanggal_akhir_kejadian, jumlah_korban_jiwa, jumlah_korban_materiil, is_deleted) FROM stdin;
    public          postgres    false    211   -G      F          0    27457    dashboard_kepegawaian 
   TABLE DATA           �   COPY public.dashboard_kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, usia, status_ppns, is_deleted) FROM stdin;
    public          postgres    false    212   �~      H          0    27464 !   dashboard_penegakan_perda_perkada 
   TABLE DATA           z   COPY public.dashboard_penegakan_perda_perkada (id_perda, kasus_perda, jenis_pelanggaran_perda, tanggal_kasus) FROM stdin;
    public          postgres    false    214   �      I          0    27469    dashboard_plotting_anggota 
   TABLE DATA           �   COPY public.dashboard_plotting_anggota (id, kota_kab, kecamatan, kelurahan, lokasi, long, lat, total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam) FROM stdin;
    public          postgres    false    215   ��      J          0    27474    dashboard_titik_rawan 
   TABLE DATA           |   COPY public.dashboard_titik_rawan (id, lokasi, kota, kecamatan, kelurahan, lat, long, kategori, rawan_terhadap) FROM stdin;
    public          postgres    false    216   v�      �          0    35653    dashboard_titik_reklame_citata 
   TABLE DATA           �   COPY public.dashboard_titik_reklame_citata (id, produk, nama_perusahaan, pic, tgl_sk_terbit, tgl_exp, masa_berlaku, lokasi, kota, kecamatan, kelurahan, lat, long, ukuran, ketinggian, keterangan, is_deleted) FROM stdin;
    public          postgres    false    341   f      �          0    35660     dashboard_titik_reklame_satpolpp 
   TABLE DATA           �   COPY public.dashboard_titik_reklame_satpolpp (id, produk, pemilik_reklame, konstruksi_reklame, nrk, nama, tgl_pengecekan, kawasan_kendali, status, keterangan, lokasi, lat, long, posisi, ukuran, is_deleted) FROM stdin;
    public          postgres    false    342   �.      K          0    27479    dashboard_tramtibum 
   TABLE DATA              COPY public.dashboard_tramtibum (id, kasus_tramtibum, jenis_pelanggaran_perda_tramtibum, kegiatan_tramtibum, date) FROM stdin;
    public          postgres    false    217   zD      L          0    27484    dashboard_wasdak_ppkm 
   TABLE DATA           Q   COPY public.dashboard_wasdak_ppkm (id, tanggal_wasdak, jenis_wasdak) FROM stdin;
    public          postgres    false    218   SE      N          0    27490    hirarki_kepegawaian 
   TABLE DATA           �   COPY public.hirarki_kepegawaian (id, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    220   �E      O          0    27497    hirarki_kepegawaian_bawahan 
   TABLE DATA           �   COPY public.hirarki_kepegawaian_bawahan (id, no_pegawai_atasan, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_atasan) FROM stdin;
    public          postgres    false    221   �E      R          0    27506    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    224   F      S          0    27512    kepegawaian_non_pns 
   TABLE DATA           ;  COPY public.kepegawaian_non_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nptt_npjlp, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan) FROM stdin;
    public          postgres    false    225   �H      U          0    27520    kepegawaian_non_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    227   9:      W          0    27528    kepegawaian_non_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    229   V:      Y          0    27536    kepegawaian_pns 
   TABLE DATA           0  COPY public.kepegawaian_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nrk, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan) FROM stdin;
    public          postgres    false    231   s:      [          0    27544    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    233   ,�      ]          0    27552    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    235   ��      _          0    27560    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    237   �      `          0    27566 
   kontak_pic 
   TABLE DATA           �   COPY public.kontak_pic (id, email, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, status_pic) FROM stdin;
    public          postgres    false    238   g�      b          0    27574    laporan_kegiatan 
   TABLE DATA           <  COPY public.laporan_kegiatan (id, pelaksana_bidang_wilayah, tindak_lanjut, administrasi, peringatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, penutupan_atau_penyegelan, pencabutan_izin, yang_lainnya, denda, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pecabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam) FROM stdin;
    public          postgres    false    240   ��      d          0    27582    laporan_kegiatan_jenis_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_kegiatan (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, nama) FROM stdin;
    public          postgres    false    242   ��      e          0    27589 +   laporan_kegiatan_jenis_pelanggaran_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_pelanggaran_bangunan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    243   ��      f          0    27596 #   laporan_kegiatan_jenis_penyelesaian 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_penyelesaian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    244   ��      g          0    27603 ,   laporan_kegiatan_pelanggaran_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_pelanggaran_minuman_alkohol (id, nama, is_deleted, created_by, created_at, deleted_by, deleted_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    245   ײ      i          0    27611     laporan_kegiatan_penertiban_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penertiban_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    247   ��      k          0    27619    laporan_kegiatan_penindakan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    249   �      l          0    27626 +   laporan_kegiatan_penindakan_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan_minuman_alkohol (id, nama, is_deleted, updated_by, updated_at, created_by, created_at, deleted_by, deleted_at) FROM stdin;
    public          postgres    false    250   .�      n          0    27634 -   laporan_kegiatan_penyelesaian_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_minuman_alkohol (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    252   K�      p          0    27642 1   laporan_kegiatan_penyelesaian_penertiban_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_penertiban_bangunan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    254   h�      q          0    27649 "   laporan_kegiatan_penyelesaian_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    255   ��      s          0    27657    laporan_kegiatan_proses 
   TABLE DATA           �   COPY public.laporan_kegiatan_proses (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    257   ��      t          0    27664    laporan_kejadian 
   TABLE DATA           �  COPY public.laporan_kejadian (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempua_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan) FROM stdin;
    public          postgres    false    258   ��      u          0    27671 2   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    259   ܳ      v          0    27678    laporan_kejadian_banjir 
   TABLE DATA           �  COPY public.laporan_kejadian_banjir (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, ketinggian_air, jumlah_pengungsi, jumlah_pengungsi_per_kk, lokasi_penampungan, lokasi_dapur_umum, jenis_kejadian) FROM stdin;
    public          postgres    false    260   ��      x          0    27686    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    262   �      z          0    27694    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nama) FROM stdin;
    public          postgres    false    264   3�      |          0    27702    laporan_kejadian_jenis_kejadian 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kejadian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    266   P�      ~          0    27710 +   laporan_kejadian_jenis_kekerasan_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    268   m�                0    27717    laporan_kejadian_kebakaran 
   TABLE DATA           H  COPY public.laporan_kejadian_kebakaran (id, id_tanggal_kejadian, id_waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, id_alamat_lengkap, id_jenis_kejadian, id_uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    269   ��      �          0    27725 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak 
   TABLE DATA           U  COPY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumla_personil_satpol_pp, jumlah_personil_instansi_lain) FROM stdin;
    public          postgres    false    271   ��      �          0    27734     laporan_kejadian_korban_material 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_material (id, id_laporan, id_korban, jumlah_korban, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    274   Ĵ      �          0    27742 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    276   �      �          0    27750 ,   laporan_kejadian_sumber_informasi_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    278   ��      �          0    27758    laporan_kejadian_unjuk_rasa 
   TABLE DATA           :  COPY public.laporan_kejadian_unjuk_rasa (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi) FROM stdin;
    public          postgres    false    280   �      �          0    27766 )   laporan_kejadian_unjuk_rasa_tindak_lanjut 
   TABLE DATA           ;  COPY public.laporan_kejadian_unjuk_rasa_tindak_lanjut (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, jumlah_masa, tuntutan, penanggung_jawab_unras, jenis_bantuan_satpol_pp, jenis_bantuan_instansii_terkait, korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita) FROM stdin;
    public          postgres    false    282   8�      �          0    27773    laporan_pengawasan 
   TABLE DATA             COPY public.laporan_pengawasan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) FROM stdin;
    public          postgres    false    283   U�      �          0    27781    laporan_tamu_daerah 
   TABLE DATA           5  COPY public.laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id, pelaksanaan) FROM stdin;
    public          postgres    false    285   ��      �          0    27788    laporan_tamu_daerah_dok 
   TABLE DATA           �   COPY public.laporan_tamu_daerah_dok (id, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, dir_file) FROM stdin;
    public          postgres    false    286   ��      �          0    27796    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    288   ҵ      �          0    35636    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_eselon) FROM stdin;
    public          postgres    false    337   e�      �          0    27812    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_golongan) FROM stdin;
    public          postgres    false    290   ޶      �          0    27820    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    292   ��      �          0    27828    master_jenis_bantuan 
   TABLE DATA           �   COPY public.master_jenis_bantuan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    294   �      �          0    27836    master_jenis_kegiatan 
   TABLE DATA           �   COPY public.master_jenis_kegiatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    296   �      �          0    27844    master_jenis_kejadian 
   TABLE DATA           �   COPY public.master_jenis_kejadian (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    298   �      �          0    27852    master_jenis_kekerasan 
   TABLE DATA           �   COPY public.master_jenis_kekerasan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    300   H�      �          0    27860    master_jenis_korban_jiwa 
   TABLE DATA           �   COPY public.master_jenis_korban_jiwa (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    302   �      �          0    27868    master_jenis_korban_material 
   TABLE DATA           �   COPY public.master_jenis_korban_material (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    304   ��      �          0    35644    master_jenis_pelanggaran 
   TABLE DATA           �   COPY public.master_jenis_pelanggaran (id, nama, kode_penertiban, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    339   w�      �          0    27884    master_jenis_penertiban 
   TABLE DATA           �   COPY public.master_jenis_penertiban (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode) FROM stdin;
    public          postgres    false    306   ��      �          0    27892    master_jenis_penindakan 
   TABLE DATA           �   COPY public.master_jenis_penindakan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    308   ,�      �          0    27900    master_jenis_penyelesaian 
   TABLE DATA           �   COPY public.master_jenis_penyelesaian (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    310   ��      �          0    27908    master_jenis_perda_perkada 
   TABLE DATA           �   COPY public.master_jenis_perda_perkada (id, judul, deskripsi, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    312   ��      �          0    27916    master_jenis_pertolongan 
   TABLE DATA           �   COPY public.master_jenis_pertolongan (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    314   m�      �          0    27924    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kota) FROM stdin;
    public          postgres    false    316   A�      �          0    27932    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kecamatan) FROM stdin;
    public          postgres    false    318   ��      �          0    27940    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    320   �      �          0    27948    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    322   ��      �          0    27956    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    324   ��      �          0    27964    master_sumber_informasi 
   TABLE DATA           �   COPY public.master_sumber_informasi (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    326   $�      �          0    27972    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    328   ��      �          0    27980    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    330   6�      �          0    27988    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    332   ��      �          0    27997    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, file_dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date) FROM stdin;
    public          postgres    false    334   ��      �          0    28005    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    336   ��      �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 37, true);
          public          postgres    false    210            �           0    0 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.dashboard_kepegawaian_baru_id_pegawai_seq', 1, false);
          public          postgres    false    213            �           0    0    dashboard_wasdak_ppkm_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.dashboard_wasdak_ppkm_id_seq', 1, false);
          public          postgres    false    219            �           0    0 "   hirarki_kepegawaian_bawahan_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.hirarki_kepegawaian_bawahan_id_seq', 1, false);
          public          postgres    false    222            �           0    0    hirarki_kepegawaian_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.hirarki_kepegawaian_id_seq', 1, false);
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
          public          postgres    false    287            �           0    0    master_agama_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_agama_id_seq', 6, true);
          public          postgres    false    289            �           0    0    master_eselon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_eselon_id_seq', 6, true);
          public          postgres    false    338            �           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 15, true);
          public          postgres    false    291            �           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 30, true);
          public          postgres    false    293            �           0    0    master_jenis_bantuan_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.master_jenis_bantuan_id_seq', 6, true);
          public          postgres    false    295            �           0    0    master_jenis_kegiatan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kegiatan_id_seq', 19, true);
          public          postgres    false    297            �           0    0    master_jenis_kejadian_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kejadian_id_seq', 14, true);
          public          postgres    false    299            �           0    0    master_jenis_kekerasan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kekerasan_id_seq', 5, true);
          public          postgres    false    301            �           0    0    master_jenis_korban_jiwa_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_korban_jiwa_id_seq', 7, true);
          public          postgres    false    303            �           0    0 #   master_jenis_korban_material_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.master_jenis_korban_material_id_seq', 7, true);
          public          postgres    false    305            �           0    0    master_jenis_pelanggaran_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_pelanggaran_id_seq', 279, true);
          public          postgres    false    340            �           0    0    master_jenis_penertiban_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_penertiban_id_seq', 18, true);
          public          postgres    false    307            �           0    0    master_jenis_penindakan_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_jenis_penindakan_id_seq', 2, true);
          public          postgres    false    309            �           0    0     master_jenis_penyelesaian_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_penyelesaian_id_seq', 1, false);
          public          postgres    false    311            �           0    0 !   master_jenis_perda_perkada_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_perda_perkada_id_seq', 2, true);
          public          postgres    false    313            �           0    0    master_jenis_pertolongan_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pertolongan_id_seq', 6, true);
          public          postgres    false    315            �           0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 44, true);
          public          postgres    false    317            �           0    0    master_kelurahan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 267, true);
          public          postgres    false    319                        0    0    master_kota_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.master_kota_id_seq', 6, true);
          public          postgres    false    321                       0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 15, true);
          public          postgres    false    323                       0    0    master_pendidikan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 9, true);
          public          postgres    false    325                       0    0    master_sumber_informasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_sumber_informasi_id_seq', 4, true);
          public          postgres    false    327                       0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 13, true);
          public          postgres    false    329                       0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 87, true);
          public          postgres    false    331                       0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 7, true);
          public          postgres    false    333                       0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 28, true);
          public          postgres    false    335            U           2606    28012 *   dashboard_kejadian dashboard_kejadian_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dashboard_kejadian
    ADD CONSTRAINT dashboard_kejadian_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.dashboard_kejadian DROP CONSTRAINT dashboard_kejadian_pkey;
       public            postgres    false    211            W           2606    28014 3   dashboard_kepegawaian dashboard_kepegawaian_baru_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.dashboard_kepegawaian
    ADD CONSTRAINT dashboard_kepegawaian_baru_pk PRIMARY KEY (id_pegawai);
 ]   ALTER TABLE ONLY public.dashboard_kepegawaian DROP CONSTRAINT dashboard_kepegawaian_baru_pk;
       public            postgres    false    212            Y           2606    28016 H   dashboard_penegakan_perda_perkada dashboard_penegakan_perda_perkada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada
    ADD CONSTRAINT dashboard_penegakan_perda_perkada_pkey PRIMARY KEY (id_perda);
 r   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada DROP CONSTRAINT dashboard_penegakan_perda_perkada_pkey;
       public            postgres    false    214            [           2606    28018 :   dashboard_plotting_anggota dashboard_plotting_anggota_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.dashboard_plotting_anggota
    ADD CONSTRAINT dashboard_plotting_anggota_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.dashboard_plotting_anggota DROP CONSTRAINT dashboard_plotting_anggota_pkey;
       public            postgres    false    215            ]           2606    28020 0   dashboard_titik_rawan dashboard_titik_rawan_pkey 
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
       public            postgres    false    342            _           2606    28022 ,   dashboard_tramtibum dashboard_tramtibum_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dashboard_tramtibum
    ADD CONSTRAINT dashboard_tramtibum_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.dashboard_tramtibum DROP CONSTRAINT dashboard_tramtibum_pkey;
       public            postgres    false    217            a           2606    28024 0   dashboard_wasdak_ppkm dashboard_wasdak_ppkm_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_wasdak_ppkm
    ADD CONSTRAINT dashboard_wasdak_ppkm_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_wasdak_ppkm DROP CONSTRAINT dashboard_wasdak_ppkm_pkey;
       public            postgres    false    218            e           2606    28026 :   hirarki_kepegawaian_bawahan hirarki_kepegawaian_bawahan_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan
    ADD CONSTRAINT hirarki_kepegawaian_bawahan_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan DROP CONSTRAINT hirarki_kepegawaian_bawahan_pk;
       public            postgres    false    221            c           2606    28028 *   hirarki_kepegawaian hirarki_kepegawaian_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.hirarki_kepegawaian
    ADD CONSTRAINT hirarki_kepegawaian_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.hirarki_kepegawaian DROP CONSTRAINT hirarki_kepegawaian_pk;
       public            postgres    false    220            g           2606    28030 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    224            �           2606    28032 Y   laporan_kejadian_kekerasan_pada_perempuan_dan_anak kekerasan_pada_perempuan_dan_anak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak
    ADD CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey PRIMARY KEY (id_kelurahan);
 �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak DROP CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey;
       public            postgres    false    271            k           2606    28034 <   kepegawaian_non_pns_keluarga kepegawaian_non_pns_keluarga_pk 
   CONSTRAINT     z   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga
    ADD CONSTRAINT kepegawaian_non_pns_keluarga_pk PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.kepegawaian_non_pns_keluarga DROP CONSTRAINT kepegawaian_non_pns_keluarga_pk;
       public            postgres    false    227            m           2606    28036 @   kepegawaian_non_pns_pendidikan kepegawaian_non_pns_pendidikan_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan
    ADD CONSTRAINT kepegawaian_non_pns_pendidikan_pk PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.kepegawaian_non_pns_pendidikan DROP CONSTRAINT kepegawaian_non_pns_pendidikan_pk;
       public            postgres    false    229            i           2606    28038 *   kepegawaian_non_pns kepegawaian_non_pns_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.kepegawaian_non_pns
    ADD CONSTRAINT kepegawaian_non_pns_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.kepegawaian_non_pns DROP CONSTRAINT kepegawaian_non_pns_pk;
       public            postgres    false    225            q           2606    28040 4   kepegawaian_pns_keluarga kepegawaian_pns_keluarga_pk 
   CONSTRAINT     r   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT kepegawaian_pns_keluarga_pk PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT kepegawaian_pns_keluarga_pk;
       public            postgres    false    233            s           2606    28042 8   kepegawaian_pns_pendidikan kepegawaian_pns_pendidikan_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT kepegawaian_pns_pendidikan_pk PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT kepegawaian_pns_pendidikan_pk;
       public            postgres    false    235            o           2606    28044 "   kepegawaian_pns kepegawaian_pns_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.kepegawaian_pns
    ADD CONSTRAINT kepegawaian_pns_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.kepegawaian_pns DROP CONSTRAINT kepegawaian_pns_pk;
       public            postgres    false    231            u           2606    28046 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    237            �           2606    28048 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    283            y           2606    28050 D   laporan_kegiatan_jenis_kegiatan laporan_kegiatan_jenis_kegiatan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan
    ADD CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan DROP CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey;
       public            postgres    false    242            {           2606    28052 \   laporan_kegiatan_jenis_pelanggaran_bangunan laporan_kegiatan_jenis_pelanggaran_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan
    ADD CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan DROP CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey;
       public            postgres    false    243            }           2606    28054 L   laporan_kegiatan_jenis_penyelesaian laporan_kegiatan_jenis_penyelesaian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian
    ADD CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian DROP CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey;
       public            postgres    false    244                       2606    28056 ^   laporan_kegiatan_pelanggaran_minuman_alkohol laporan_kegiatan_pelanggaran_minuman_alkohol_pkey 
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
       public            postgres    false    255            w           2606    28070 &   laporan_kegiatan laporan_kegiatan_pkey 
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
       public            postgres    false    336            C   &  x���ɮ���ǟW�o@BuP�L�V@1'!�4*��\�)����m�3$�&��yߵ ����HףMfg��:�2���tI?\��`�tZC�\ʢ��M�%Z���k��5Ѭu~�LX��9���V,��czX��
ߊE��g5S�x=\���&�aW�]H�����# P�,Ȅ��z;[����
���s,u�T�ΰ�o�ES8���|��`����$��A-�S=2a��s<?���[�4̜��V���Bcs(�霄����'�A&��Iwp{`fi�
Ne�s{x��G��Z1xot���A�)�80ɑ�T*?� ���P�6�l��X�ػ2�ƨ��f@N��]���ʋ�*���eT����K���v���6���L��=���$��a��4��[N�` &#)�r�����IЃ��)#�(w���U��1H=�ft.����'����\�y0
�u|:�����{
�@�:�-0�oj���)�Cw��q��8��Ux]�_gS���F⼮'3B��/Є��	E�k�V�Z�b@�gI`�)�H�'��31��v�|N]cs����G�`��� ��u��YP���C6)�z�������!֎�z'�Ui����.��x��G���� �X��R
: �HM�ыxo�/rbҘ�� ˳�l[��H���E�6l�@� C��y�Z�~N��&���y7ޅr�憝M����!��'�c��=GJ�}��&�0$�hM����%�v1�@���hL�G\�5�9vz�u���(�k�Y�x�&#��)��Ǭ5�o�l5d°>�u1�\�'�= w+�y��D_�(�W�jw�'���$�x�	��,�Ж��o������ֽ�kZ���]ɯcl�@�bn %[�%�!���,� ��l� �9�f�M�j�RN}�\K�)�`��A�t�K�ʶ�d27��es��nN<� u �#�A����o0�/���_���~	_A��Α�e�2�-��m;ܰ������� �o �BnM��K��L�����{_��u����/'**Ss�/ì����5�?d��&�2�?R+d\e��̹j�k�8)�K�[1��o�3��o'�w��(�\�_�}�~�C�QFx�@���"��6��<����Q�����'��-ڧ ����ǣa���������x؀,P	����͜����&��E�F>�ߏ�E���ΣJ��u��bPC��k����%�X���|����ʳ�_���`�ڏF��Zj��n��(-���iC����f/@� �<d�5�: V��%穛^�ӟ��pSW�8 ��T��32�fF|�v�����ϥ�0�@���D��I�q~H��37��m���)d$��`:wv����*C_"i:�����ɔZ#�7<f��L�f�5x͇���-כG�#�X�/��͞NUN31/�Ѧ� ��!�D��]�++��y:�?�J����A�̩�N]����J��:�!��I��&�Kځ�%2h���[gC�>����|�p�fEg�9�/��U@�]���\Ѯ1<����M�Έ e�g��Ȑ�,>'���0p�v�ds��∎�S\G��Ζ��|e{4����l���o� �*B�7�����Y���|���`c��G)j��b?w��8������`���D&H�(�A-9��U��]��ڕ��O]Z�k\���}uz.��yaJ����G<ߜ�?u�W� �f֖�$�A-Y��U��6ո������;���iN mbN7y�>�
�'G�RY�E&� Z&F��:�%097��^o���N5���.�����6@�Cj��޹��!#�N'���L��g Ԓ�o�o�m�]#7F�����'5E���s��{W����vۍ���q� ��M�	y6[�o2`��x|$��×�����߃���Uvzf�?�+�|Ϊ�z�$c<l��<y���f��x�?z*e��֙�K���>y�@C-�nY6R>�0�A*H��$N֒4dh5Pj��P��v���ɕW��]�=���FsQ�\oVI��5�)>A�;��N��_	�t<      E      x��}[�Gv�s�W������luM�X�F]� �/�5a˲8�4����YYUM��phX�Ȋ8��/��jx~z~^|||����?���C�O&����=�a���X���o����|���?�~������>�Κ]����W>t�����t�O�|�Ǘ�����R��Kz���.w�?�v���~��߾~��;\���a����Ww��ð������)��ϯ�պ��K�����/���պ��{�S��e�����/_��_��+���ۯ�~������|}|�������O�_��3|���#n�?��_���(�;T{��8lḜ1��×��W�?Ň�����/��׋����e--MwA�ŗ���r�`a�>��}����������*`%��V�N,U��rؾ¡Y�w��%�_.������~����{�x�������^l_��(��'!��@+O�.7��ҁ���8X:�-�
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
��b}ZQ�p�0"w�u��6�尪��I̭��x�ϻ�˰a�v�j���-}/.�礂lt�Sn���n׆6�� Ҧ�O	�ߧ�~������V      F      x���͒%Ǒ�ט��d6&����es@3a�!�jV�4��"�I����u�xVux�w:�`��Q��'�{_��ݷ_�y����~���?���߽~�_���W��������������W�?���o���?TD������W_��#����w_�_}5-���#0 C�|�Mmlz�U)����y���~��W���׿���*�?� �xǮ/t�����h|��#��^��o������__��#��#x���[]�~ly���>��'��	��ס��cH\��-�}��7o~��{���>����aIݢ����t��xﻮ�w�qwK��{<߻1��wW��{e����Z��#�zD_����}H���n�I`�:��l�a�;��@\��� �ݻ\�����滫K��nL�>p&���dm�.+�\Z��>����Y������X�����<���>Mh���D<8�D�Ҵ������߼�f�d}�qNn��7�ߛ7��o]'��o�Ϛ�}��oVZ��y���9ٳtW�����m��c�yӭɠ�x?����2g�ipI���zK�B��6��d��Ɋ׬�X{�d�uױ%�3���%q߻^/ɜ�]��͙�>�h�y�g�d��_�9�q�w����s�l%�S_�j׎h���K^[9��9����n�-�ۻ^'��^�Y�[/����lV�d���msކ��כ3�d�u�sO�]/��d�|wk������6+w��h�rS;٬��#�>��f���e����a�ٷ�6�m����Fv��6Z �������7��,Mv��N��	��ITJ��p�xiM3�E�ĕݕh�+�߉+��f�+�C���J0hP�'ȕB[�R4̋A���0O�)������D< &F_��E���L�.��T����dc��q�?�������w�uɝ������	~��0/jԋt3ڣl�嶌�y��F��,�-�h�����;�""FkF��<=�4�XT� .���N�ތ�yw<��s�2�o�0�
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
�?]���+���s�_�����Wo~����w?��߿���]�߯?���޿z��������ۿ���o[KC�ZKc�ZK��ZK���?������o?���Gd~	�	2�����?�����~xD��E��E�!�E���3�I�<C���3􉏟�S��9��E[����.��eN�wі/sB����޿{��?�O�#�)<u��>�7o��ۿ|���a���O�_}��������s��>u9�}��iX�ߧ����}L��it�ߧ�1�r�>��������?���?����:��׏���~ Y  ��~��u}zX�޽����oFΑ_m�l����f��n�l2������n�l����V��n�l������m8����/5��{���R#/�����/5��{���R#/�����/5��{���R#/�o���/5��{�����o�����}����#�dt�'�~��Dp@������?���Ǻs�Ϸ�^����7'{�������\��W�|?��h�7�����˫�R��w�_��o�������N���N��q������o�x��>x���G������4vz�t;e��NI��SN�i씲0�/|>��S��i�q��# �0��ƾ��/�>����/��^�߼��?���?�����:!������zl�$���N��h*���:�|����w�:�z����w�:�x���xw�:��߾����0h^����~���N������(��z�G'Q���I��ti���T�G'����I���9qv�����DD~��ҏ>'"�n��?���8�s�c��?�s;}�g�N����&���o������O�v��	��ݟ�O<�	��ɟ�M���D}�7�{~�o�7������o�7�^J���o�7�J���o���z���߳˘O�ϮN>���=���o���Z���߳K�O��(�O���O����O����O�Ϩ�O�������w?��~��zFy8�������S�4qJ~�7qJy�7qJt�7qJo�7qJ�7qJ�7qJ�5��1Ԥ��ѹ�45o�rt.��y��s9��ϛ���9�|����<��ϛ����yף�.>o�zt�S��M\��3"�4q=:ψ�7o|������~� ��o���_��������~l�l��8�́&��w���-h�l�8��&�������#h�tG���?���~����݃�\�/�󇿾���p����k�vzڰZ;=�X���T��N�1Vk����s���ڹ��i�\m���E���m��E��Cn��E��9�n��E��9o��E��9�o��E���=����wVk_t,��?X�}ѱ �h�־�X Y8Nk_t,�ߙX�}ѱp~�b��E���]�����<Vk_t,��Y�}ѱp~�d��E���ݔ����ZVk_t,�߉Y�}ѱp~�f��E���]�����xVk_t,��Z�}ѱp~h��E���ݣ�����Vk���O?�9Ч$��)��}J�?A���OЧ���)7�}J�?A������������y��V���������HSF	��ҍ���X�n�6-W�?	��͟����O�j�'���!r���1u���Ax��_vԞݰ^m���g7�W��%G���o��O����t�      H   �   x�}�A�0��5=� 3b�[WFcbݹy�F0����_0Uvlg��]��A瞘4��HJ�2m|ht�]6��E)��f 3���=�������'3��kx��,g��o�h0�81^N�EO�����o�S����Nk���+���P�      I   �  x����n�0���S�O"��[�C�v����,��I�`�ۏV�:�r$PMA�>R�������b�(^s�To�����;���S_��֙����P���/�_o�L��O�S�7�2Ǟ����s9t�g��-5�l�n��b=쮋��Z	�\���2Q���\� ���Yg�0iU�_\>�+q��-	��F��+7�*|T��uN�s)�{ɉ�@�hg�Z�e^��bq�0j�|��^�W:lh�]}��C߼���M�`�«�w`c4ގ��:�5�RQy�i]x�GQ4��nG`p|��q��x'`L�������%��=�UVt�������E}��(�=���L��M��$h1��4�5a�*�4	&F�.:�'D@Zg3�-���z؋���IzX�&lsC����Lz~���/��ʩ      J      x��]ے#�m}��
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
>G��Z:�>�FP������|�.��ҷ�����zo>l�\7��-'���Vֳ5���}����Ϸ�-͇ڦ��û8H'�B��(�G�L+�r�KjwOEwb��*�_�2���e֟��G�z�*߿������L����L�l#������Q��Þ��N���ۘ�N��O�8���J ��S�:d�O�O@���Y������C��=������2�_D�!0ٝ.���v���uk�Y��Ka���B��A�vbۣ��l��_`����Gy���+8p���j��ڰ붥�悵��s���G���h�w+ C�����G��+��K�z��Df��l��oca�S<��� *SF�	z4��%�S���G_�c��x$�ʀ�{�C��Yޗ!�b��~�O��S����7X{�	tpmS�����.��F�_�_���aZy      K   �   x�m����0D��W�P�m?aW�!�#��ִ�ĩ�F���eY�.�'����E�Ü/J3&��M+nX�A�ۯb�:�v�j�Ô����V�2Ҟed=���*:����~���)��l��x��%'#�ɐX5/F�gt�f#X�i�)~pb�Ԝ���d���<�P
Nr���"Y�=g6�4Aݫk�&�!&��UY�wHWk�      L   o   x�3�4202�50�54��N-*�-�K��2�
��q���$�(�'f$*�$�)�$f��U&rCU��r�e'���!�ô�&���2 ��Z@�Ӂ�1z\\\ J.%0      N      x������ � �      O      x������ � �      R   �  x���Mo�0��̯бÀ9�G>.���$��ۥ&QͲ�Ir��׏NR`(��zDR/_�#(k�n�A��(��X�%60���W��hw¡ae�Jؽ�a�f��x�2��h���r��Vl%�p�b�P�?Sw|�Q�TN���ƻ����D��z�,�b���� 8y�^l
�>p�n����gP�[���LW�����)�-œ�/gPh�p#9��t}�J���[�>���)��Gv�Վ(e�@�r�c�ELa��q'":��x�r��I*t߱�aŭP����7h�&.Zq��lqk�ߥ�R�ڽG�pmz�h���Rz����&� �(�k�. ��ލ��i�gfp��@:�PQ�eJ�#&C�(�A�KF�7-yNl�Đ��P��F�#�ʣu�	%)��갖��.��ֲ��dt�F�1�n>�h���ɋN�a����\E�)
86��B�↭��vk��Q��!T���9�3��2���*ګfO�T�ٱ�n��PVK�e���ɱZ�d/E�<��4�%�N��Մ斶Ҹ��J<��
:�5͠���X��]=�$��SXG�~r�i���ֺ暞�QI�����'R�=�_�!,:cř�#�s�
�.$��?��|��k��c�n�W�~et��֊F�e��I�xM.�ϫ��c�*y��4�ư�-C��&P�N�� ���%	��w��_~ٌ>�Ǎ&;{�?�/ O      S      x��}[w�Z���W��`tA@�	�A��I(>>�^�XEds� T�����޺�I!qz�Q��I�$d��u�kNU�Z�=fӆ�>w��5�oM�)EU�5K�yZ7��_���l�7[wl�˽�=���?d�{�ܯ����6�m����im����K�Y��=�ݥ_�=Ycˁ���s�����ZKk�l�z�\e�\��?����kjڷf目2���[��n6�_�2���x}������m�ߚ�7�yj�	���8����f�ƿ��Ɯ%k�*s�Y�ō����p��N
Dtd��j�o"7��7�_�L��� ��m-����!�޴V�Օ�q�K�V5;ߚ�oj�Ī�a�o|��l��{�s3���3؃���^91�e&4Z�2��g9`���.�io�X�2��X�К�Y㶿5�oZG���4�鿇�p�lצּ�����jm�����-����-����.�ʑ��
��/p������h�r��{=�k���e}8��`f����Y��Ny4-x�������N�b���О=0�*��T����C�]�o��s�D��1�o�1��g��c�v�?�q�2��S�~�5R����6�p9p��(����~�(�1t |�`��7<c����?0p�F��1ز�O����ď�7�;���ɸ�'k���rDm����	|��5���B�#����}꣛9��w~�� r����?��Hd*��a���W��eF�h�uF_X����������׽[�|��s����b�n���|D�Zm��]%՚����ʬ]�?��;�Y3K��;�E�!<�bO�%�>w�k����/�-\��x��Kp"ۃ�+xm�4Kym�B+{��'��lX�K��5X0��ѓY��
K�~l���c'��)�=�T�W03��y8B�͆��5ܣ�_�˜�fvKy�[�RTU��������p��Wj]i��C�Ӌ�o����\mqOmpW�p�e�`�&_�=����2���+#�r�,�ewM�u���L�W�C�R��<}�#_���͏Lc�5D�'o��s7�BҮ�u&\�� ���\��k�ٽS(EK�<9s�y�L�+����cϙY����
��:G���M��&'��ً���n�����Y���7JEQYv�����^��o��_�)���/����TU����{�[Ȧ��&^wQ�v��i������⍁8KO�J$(���e�m�zxH�c<�Z/����֬o3�o�͞C�z1��9@e�hjY�Gk?b#0�/��8���n�_#ni6�_�zۜ~��Ch�$�`������'1��abyX����#��H�ju2��f/�l���|tYd�6�����e��=�>�+���	���Z�lv�en1�=�ǵ����2��mtF�G ~iKj��F?�l}�;`�D]#�@�>�O�h̖a�9��@e�dC~�������J��oMC���T7��(,Z�=0|��OH�*G`�c����3֋7���]E�O::^v���1{�����1��qI�6���ł�]�����L�3���fx�V���=��ě��+:֓��A�0���Xl�P�N���t}�������C����;�@�l�$��&s6��u������F���x?Rxw,�:3kz׻7l&f|�)jYM�S2����'���^/u�h�+{���YN��{MS����ɋ�K*[tͥN�Z��_CQ
���cIr=���kY�x�;؎��}!-��qf8K��K���M;�i<���@X������&���zf���5�ֹ9>o�>8�S���	x ���bsx7�?p5�	�M�%,#���:	\ �=�����I�r`?��1�����}ͥv���{6��������Ԙ� Dap"� �[f^�f�,��t,�3<�zCKq�Y�c�m�,|j�.u�0�H'c �х���>��T��ڠC�c+��0��	%�m^�!��t�M,d��\xB�U���VT��@5��5�~!������騲�&u���p��� o�=�4,|����Q⅄�/5~���&�Jmei�
˗�l��k��whw+)9��ʯ��`����c�f��r���#?�˫'�pXG��ނח��^v�`N�����Y���όY��S(�����~�&\t��8�'��;�2<D���?�9&O2/��\�ԏ1@,��e�F�ZW�p�9/��=��Ɋ;��]�3ȏ=��dy|9�t��D?��~�]8�c�TS-��G���S����T��\z��Pj���=H�C����e4*��gL,�t���Z����ݯЏG{_����v��d9࿧�*�x�݊!s+|(��p���J:�}6	Gl��b��ݛ�l6;>����-�8f殂{���"�\�	�b�,�*�}��>N'�@�9�'�tևԾf���AB�7TZpW�#DT��j���i��C�}CGs��6�0 i� ����)U����a<�
 �l���A�:8�����l9�l ����+���o�@ ý�}cNp�Zu�#`�����z�jV���ۖ?v�;�����9 Y�r$��|��E�C�zO6教``�m54���+G�+�M#>��ǭM�����ᅆ.�F���������G�����;�9�e�����޸i�7�����s�<B���ڽ�)��К�l�^&7�G{5�	f�Ě.��M;��^��gb��9H;?��Z�s�,�`����gE�_UJM��S7��V�ێ7��l9J/��x��Ǖ�s�(�=���x�w�z��!�����b����[6z���O�*�X{��l�+Eݒ�vU��`��60�;�zl�p`��m�&uФ0�g�K>��٭y?�D�s�H���8dxQgUi闃m�pHL*[Ǣ�r�\��t�:����A~��JU�^*/��;y�Y����n$�4�J0���g�wjvS�N�@��1l�/: D���_�Ktu �����p��~�;�{���d�2��g�i�x�z���@X�W_X��7�<�l3���f�4#�-��m��J<��
Az�(/M�$�J�&�Z�=�[҆�����Py=z���[� �i���y�v�7� �h4P�����.)�?����[�o�ʣg-�{���A=�}������y�*-0���6��94,\pI$-{�9���0{�˴��R�������}(6f>9䂪�
]�[b����I ��x��/Ch+^y��_C���U3K���x<�r��8چ誓����Q�!w�Ԅ�wꛐ�|@�������??B��i+3n���g��r��5�bg�^�7{�-�it�������V�>Lі���;sr�Yh��=���Z7���O��:~.2c�q�	/��KAGb��m��F[y�&4naS�,�[��2�4�֔�^��1�\�{t�� p��G-������5!-�cRۚ�b���PIG\�b>����\�O�Ц��5��kft���#�Al>^Z��b}l�������w-�<ʟ� ������8��X���\/���
4�\���G�m\�8r�gk�z�څ��"�K� ���S��7��,$��ڿ#�V83ZT�y�Ƈe38�+J�]x1\D���\� ����rOL�ĩ��~��$z�kV*���c�&��_��- ���2���~��@��r�x�ط�,�}3��bKUf��0�O�q~e���|��Wp1�����@�hY�z�9��p@
��KA��I�K�>�4l��T/�'5򃈓�1�e��Ǩ��h�j���6�jX��tޠ�Z���BG֌@.���&�N`�./z��E'O���������Ǫ�ȸ4�"2.4v�����-C��GVl���j��0ob�.����~��j�rd�N=k�{��Ӻ+�kJn�<�բ5�T�K��I���[�wP
�!�����w�{��浰]ʱ|�ng�T�a?z��3�����C�k�'�9f��9|�����b��0o�|��޼�3Qn��M����A��D�oM�X~��_,��    4�T��[�xJh�������gsR��FG�x�Λ�񶈼'b�A eO��9��O]�$.=��j�:�>]tPS׃�0Jc0K�����!ı��+v}u
���$�m�c��5��bLhy@DKRy}�#H9˝3��T�P�����{>�a|�Kt�P�H�t�G�+N�M��6�x�G�!*�
�L��"]����v�9X�ų�.=Ɲ n�$�w垂}�i��Y�mIj�:`�9+�b��<�z��o�����Sܖ��P��?�Y��-߉������I84������� �e�0SWFV��2�.LBR�`��=d��G�QȽ�W���t���Ws1W���A1���HI��a2�X��RW�YNt�	����r�W�U1Q���.�l��B�e|�_
kn�v��=䘚-s�;��ۧ��
1�����a��&�-�a�p�q@Yj8o��2o���4�!���(�q�s�8���CR�":���թj�9����� �)�EꟂ��a��
ؔ�m�><~�)d9O�=)T�	��´n9��{�&>�m�����z\IfGq���/�X��m�o��HE�O�Am��.���b�i&���Wl����؅f�Hw�^�r��f����\�����}"���g��9��4@�vf�ý@i1pKj�d����s����̼�烙x�vSy@:�(�����_���³)۝���>�d.�!�%� ����!�G�Ҁ�rؒa��)1���U.Ô"�8Z��W�-�-�ֳ�?pd�9LT q��|=w�3����~��JM/��*�^?&��w�;�P�V<:&�U4��d
�a���B��$mL[Ǽ�������)uIG6�╫ 2��\�9ǿ�瘫��!�c�*V/��X��f��R0{6\h�tZ=�HQUg&�l�~��3��(���M�2)�y.�"��Ck9i��!\��y}�b3���wq6yvC�Z�6�w$�X��?�y� ^B���-T�t�H���_~��7�vS6fWQ���2���+����j�ʤ ���I
�1�x���K�Z*���6"����ќy<��u�+�ܶ[�)��x}z^�,H�Y��\	��A��z	>���rG�q�Μ�hZdnxS>��G�OFr�Fv�K�}��uLb�k3�:�9�]L+-����RNf��%���`+�gd�N���S��dWt6ۥr�[\�4����tϐ=�Q��\D�lǶ�Y:Ă'��T�?�C��e窬��|�U�j,��?A����OwY��>b�`��ԤK%�
�<���av�ȁK_mb��r���7���F|}q��	��y^H�_&'�X����O��Ѻ��;AT�=
T��.�d��e�V:��j��Dt��m��^	�����	�)z'�|��\e�"�[���6/���\��5Ӕ�G�RE�*������x��K�O̈́i)�b@��a�F����I�RR���D�0fHjԳj6Q����� B�lXQ�Ϥ�>IB�L������[����\�Xm3+��N[��"Rl�݆�/=�ReU~�tbϦusE���/��\�%,m%-�c����%��ʩ��CEC8�9"�����r�C�.������v���\v�$+K����S��9�$�E���?���)Uv���fvo�G�vs���O�+!��S��b��p������/��u��M�-��WC��Ob9m^�+�En��bߝl�Tŕ,N�"�J�{J��]A�ӽ
�PW�nSY�ވ=�O���G�Y���wbZ+Rϼ��Z�����Xo23Kc�9C5�#k��-�*v�io�0�#�$8WS
Ŏ�`l\z���X��(�`/���JXD����F\��%��m���4����Jr��D� ����ۛ��5����	^��6~Ɵ��Ǿ]�I�~g�o����$���Vݫdkڲ��\"ad��#,��d>*�|�&�� \B���PT^�ƺy�ٳE�sB�'��j�j�O�B�S�5.p3����)6�o�k���d���P@9�c��C�{�-�j�%�
ۥ��zB\C�
�)v�I�X�(��A��Z�D�3�"y!J�� `�8�m^���N���%.�Բ�A��JNݏ���-����$c.��i�C%���"�p�W��+�d�� ��~a�K�jS�qi�G�3�ۂb$�Тtr�%r�$)�_@%���)������"��x��+���*B�z��6���\s�2^#BC�:Yc�n9�[}��Tz}�����낡�@��_��9��`��+5Gk��t!��vʱ�k/�w�h�����њ�N�����C�h[��VQȼ�X��KX�������F';�6������ ��J��Շ���ZR!�-�`3� �)�&D�ew�7���I,$#���l+&bۯ�B���H<	�\6ݺͫ�%�=�늸�3���|�����'�6�gF���P&%:^Ur��L�tl���%T�ƃ�7�<Q9v��P��Y�^�����v �Yyg�;�V��a�ӌ�x����[�����_(��aٻ�b���,O��L�t�̿�30:���Pz�9��Μ��#�v�����Y�n�}OAo�o�|�#NH�f�!�2���TjA���W��,�.��\��9�kA@tH�ܽ��)+Q�ɗM�;�z:��~G�0��%+�	dH��<t�S5���
	8��|h��g���z|��0k����%d��dwK��_�)�S0=5��=���^�0�ن�ye�m���	�*=k￢@/������&��g�)�Rj\zUwj?P!���������KjR>����������|����| *��{�E̵���DD��鎧�������p@_pX���RT45N�0�$�)��N�m�=a<τ�N��
�w��ҕ; �tK��=!4�ٳ%��z�
���[֮$B�]�ճ�4���YM�-Qt:`��_,��1�����Ƌ��N��5̼�2e��]��`�0#�p��e*�_+�4�.�N�����t��b_h��I��'��I`�D��w�T��׈*ۮ.3('�y+��*�s�g.bj���1��L�s����#�n;>n%,�YB�^���ۮrL2b?�A�-���V�ݼ��(�t���c��xY���PS;ӫ���U��L-�W�MF�))��\p���\��ME��n9��:����O={��Y܊�q=�p��.:�vK�A� #���bHt���mI񨪉h�� ���6�Up[�G�<�PoETh|{)�|ɂu�a���V*#����1*�P	���q`�f��N4�5U�&��d�#[�Y�r����m��Ԛ.��ϱ�V�����,
�g;?�l�D����{��[�;��
^�ˎ��}�,Z񼉔٢)��R��`����2vl�M�O$H8U�遈��p�F�/H\��Q_#I����{O��5�s?�;�͉��p�l�b�T�h�~E�������(�"��G�<Nǡ�a��+;z�:���`ʡG5;U�ղ,�7�͓�Mq����7����&>�*��P~5�5>�G������W�?����g�(�o%�^'�u12rZ�?�z,�h��;�SM��nv�� ����U�)u��R�6r/3$�`Os�+6�TY� �S����	��Jާ���)w+����?+���p�u�K�ҳ0n���v��E)3�mB�	���S)s.��l���;��|W�J秶u&������M�io��0�_�*ou/$�����p^�GmdVl@7>��&cpM�i혶ī5:d:��N��j4v����B/�u]�Tu��D��W�پ+47�v��?e�7'���8�;z �@��=#,�����N��4Ո�J�'N9(Jc����ޒ���ux��DR���`,����R�Vxf^�i�)�g#�D��!���� ⷅ^���P��$����w���|��Ͳ�s�yoD���r%��wk�����*r�6�ӧ��3\>�
��d�����@p��|,ҭd��E|���
 �6��圹��G����A�qU    �ӝ�!�>��F��t+�"Qq>�j�ufL_���bWN������m]\�!�q��4��������AJ}Ob����;i1���V�8�qZX����1��#���`M蘲�pU�V�sД)��gk�E�?tNe:'�){�;l[Hd���^��$�(�v����V��P�6y�C��9���$ŸBt�Y\��2t�C��A�v���ǌR�5x,&Pƙ�Uh�#|���Ш�5N�F��iZ�;	��#fMF?VxBJ��7�Ȣ㤏ǷD������p�����u٘ݫ�vJ#�⋳|���
X��0n��O���ܪfLj�����ړ����[��e�Z砫��Ff�=:��;Z"G`��,�K�c�"��)��Ou; !�o"�?�A��Y�qfS�!�|��x�A ��Y�{,ɔ�`N%��.��u.v;U�po 9����α%k�|$}���!S��5D㦞gO�D��-'s+�mDjV�f��Q���޿�g��G��� Jc7��J�������`�%w\�ƥ���W�Y�ZT�?�EY�#/�B	����H�N�������$���2����/�MD��8Ϳp$�"d	��Tz�n�S�a����snmI)^��pG�P�h{��M��*WzV��}8�K�|Օ�Һ2m�n��V=��G'�8������0�Lb�1@�<�8'���b�1N�g�t>)S�qq=����;��Nq���[Pg�˯G%�ԁ̻m���1��s�q�˩�]�o�-�&|+���+}�.��1'�9����]d����OL��*��y^(�Y�cx�r:��9����}kv��B��ن�יم~���P��#b}�5T]�=��:~���2x�U�a2��p�J=Z���C+G�A����`";g�Bd[���)����G�j`�*joH�P5Le ��4�M��='O��@��t$߃�E�PJ��C�,������/��f�+�
��P /=�+�sj��m�>�dvꯂu��c�Κd&|F��u����![��kʿ>�˕]�d�odft��򇜪���J�Svd�R��zL���W?}�J^I7r���X�+H9m����B���-]e<�O�1���t2�E���T#���s�Y�T�3|Q�Rh��p���k������=���Ba>X���7��k��t!��:���)�"2{61t�������B�k�(=U1�.uZKU,.��1�k7qy}0]0U3i���� ށ�xē,�Ӂ��=��Ծ	�R��){<g؇�fwAA�쓕����T���HlUR,B�1i,��ʲ����d��q^�ϒin%�p��#s ���,Ȥ���hu��i��*�P9)�[s��B�gq�=�@�+�Y�u�}] E�ى��Dk9��U��\Nd�V>Z-��@ �5�n=سy�ԥ,G?�w��7��a�v"!�$"��l���r��J�����Z�B�l�=Z�e:inI]�`�l,B�c�[5�_�TQ\��bYUN4�V�Y����u�N6�����B{y0i�K��q��|֟�����P�\h�
���g�ku;�3���~{꿅Q���d+���C��W�v��M\�{\�a8�&v��%צ�H<	�B�����J�2<|F+�q��ۮ"J �{����07�� �6KN����O�F��~/�6kIQC�DYa��q�7y$0~,�耢�����7��?39�h�X��y���oe9]/=�R��jޘ��0@R��f6�Ă�r�����������/�x�������/������3zC!�펩I��ۣCm��p陔�f�g����iW�LM���'� ]>�Js�fu,/<�F|A�漒2��HSWb�hכ�U�?Ԧ؝�1X5pX#��9��|���[�J}�r��}5�N2;b$���WI�\F����߸��~Ks)#� /BǐSy��������u̖ҟ�l6�/=�U�Ϸf�#���鱄��I��10�y�X��F��a����������#)U�fķ�io��g9�� �U�Kq�ΐ���3B�V�!��z6Xڔi	$�K�R�V�"�~�&�G�
mĭI��'l��W��G;��`{`Q�m8�^	޹jrX�D��<S�)��]�3�L�t.�����߹��<b�=�#WC�w�*�q	k^�p�U�9B�g��J���V�[����X�&�WXdq���3�VLY�%Zj\ٌ�*w����h��T�Żl1����'�a��{ߒ�%I~��� �9�J��U��5���J�K< L��ԪY[��*^ϲO��D� '���ܠ�m�2���F:]�x�6a����~�k�hۚ�2��� ]{���!��T����߂G#=�6�Zfz��S��2�k�ue�,)������3*���l�#\31�y%rD�	�������87z���~:[L�n��"Ee��QT���Tl��?&�ص������ȵ}�����G��!���x�s�^y�o�C�n)D�Ij1ܣCOT%��^��ctH�Ɂ�(?/�����O���Z(6&����R�_��X�<�m*�A����"��AXfit�!d!�^AԹ"GMm���]��н��P�w�J�6����5e#�س\8n�!?�!�f�j�-(�6����? %
�G ��{(�K��<6@fV����AH�/�;ʣ����4�+�s�����b��0���*i'�-��q�����������īP��P�N±������Ytyl����}���s�h��, <�;O$���3X�S�� ��m�%��������s�0���*�� �Ųo~�`���7�L�Ug;&N�n�u��|��
F���M�YQW:J`I�b~�����ۢ>^2a��'TpW9�Rs��3�t4�oϝ������2�w?�%:��J�~��o�+Tn��Q٬r��f;�wEb�j�ݫ��o2G�D��;������:��h���;����[Cx�����+Qފ8g7؂��̸�Ӂs3����Ȟ�ϫ��h�f����kC����~�^���s��`��L��%�P2��̜�d�\�/��Je��ʨwZ���{l�s������t����X��L��`�GTqqY�6�(9��I�*�'RY���<z�K"���&�b��k<�.�Ѻ�E86VL��|�s ���7a�ِ�u\j�R3��`���!C�356
��v�t#i��8®u� s��X:����ٝ$��Ž��� n�����7 5,�h��5�<w������N_Ӗ,r��ȧwa/�_i�v �NWq�}�D�ǾG?#�#vO9�gf-^e�w�����`�J��7f�6��5� u���f��1P5f8�h�))ɯ��^L0�+��>��W(��e,~U�?�<sIǚ�ZU�{�P�W�^b�JC9bwn#\G["��ƛJ� _�zr�^k��r�[";�j
�Y'}��+����2���<��n�ĭS�#%���jv��˥��Pxވ����c�K<�H:�2���|Wkk���*�i�Z�X�=)��Jzew7�$�[֫k��k(}� l��N�T�xn�z�B�|�U f���mSQt>��-��_�� �q�r�.<���jNy�mA���I 6(�&��{yDF9�?w�D�J0�&����C;%eq�ȬV�"��RzפYM�>Aw�2V$��`���$v�� Sc3��փ�j��s��̶��Cz�S5[�ou��<֨�V��0�}��
 �t����v8���5b˿*P���}FE�T	��Q*S�)�{����4C[���ȇ��`�=?��N�����K^�JB��7��xd�SB/�X���MQ�
8��6Rf*�)2bDs��ʧǐ��JMO��,��JP{*�62a�����kpHP֒�CV�� ��]�~�������?���P���9!5��R��Jn���}��D�Y%��3��c�i���^5�؞�#�&����~�+A�q9���jb��w����K���Av�2�b,��Ih��Ō��`+PYawx%�u�GŐvxS�+Hဍ�����1��    ����g.��,>��� ���屆ތ��Y*���������}�cK���[O��0=g��m2��A�k���}�w�R���&�z1�����L�M|w6��(�|j�̿�38*�9eRZ�c]IJ�n
��Ñf�p��jjMC�Ϳ2������ �E+���N�P���V<�[��U[A��,�<���S���M��40%ƚ�&���i�3����~�nɪ>��1	�Q��A[�$�0�U�\�Ph,9y�<$	a�Q	8S*���4��7[��h���0N��"�N;��F�7�#荎 ��/V\ZD��g#�{�
,F����nP1��V\�<�zH��*���5�C�o�C2���/|�Ǔ�������/\0�*D&�4����z�"{)I�s@��%
��G�\A�[Z(���gD�j�Z�쎤��ȞÌ;����_�ɘW��kx׻�t�0�
�/��v�/�]R��I�Srŷ�u�q�E�9�X"���X���7�z&����[iP�Y)��,,�M��	\*th�EX��L�;~���=�KW���W���qeJSU�!}�%s�6Z�'K���8�z׾��w������1_��!��W��������	a��kz*��?'�H���Ud����N{���5;(���;=Z�u!us1y})0#��
���ݰ1��]+uUF�W��x��y�=~�a|�����IQ��E�o�I�$@y��V?��ԥ� ��@��r1�V��j�AR��}l�MNHS�#i��m9�����{'���?t ׵�k霈��vQ�Xҽm�6{���D~�h�7?����#<�?�1�#NS��y��W��M�=x#L{���FHH�P��w{��GU��[��v�� �!��!4�,1ۥ6�z�lMm+ؐdC1�'m�-K�g#���4x��	��n�λ���#_$!
�֢ڑ��̨Q�n������u%�����͝9�y)�sD/c������lκM6�����{��b'1��<�X�7�Z���z����U��ɣc3�.���#ğd��s���/d���
/���a������b�_%n���g���k6R՚��|<g��Jn}�ur���t,�+m<Ӗ'�˾W�gmTRX���.�gQM6)��2cޚnv��Gn·$�G�?x�V6��k�"��j�mN?r�QHE��j�<ƃ�7�<$]8v��y��[ə��p4���'�=��;�A����ɛ-Q3&�Z���a.:'�̻���	�p�$4$>�W�	�aO�T���*�f�6�a�-<h�G�Z�(�MDn��B�ǎ�k9K����H[\G$	ƾN�b@��{e�M<��/����c2zJE�!q�
�E7P4C�rz��\�,�8܌��:�9M9p<A��0ї�����٥��D���߸?b�Z����:� � ̲���gC���=�P��!�ס����x��?e���WoE�x�����1S�L!����^^~�Csg�b�9�|�$%��lL�c�����"&˨4��"~#�U��<�g�5��2&�<,p]�d����x�,?�*G�w,�� ˩��J�>|ݹ2��^wh��,a6'��nO&XO����3b���{���-Ժ^`�$���C�	��Xou��[9q�qA]��S�7*�#s� 8፩YԾo­�I�����`�+1Ƶ�c��u,-oa��������b%�[����Ov6h˧C�?"$���o�4�oD�^�ł���#��B[�������53�͉�a�2�
r�	\��q6��$�}��5(��n�l��
�])�0ǁ��胺f�ޗ���A������;z�-�����-J�^'"]O����Ԟⷞ-|V��+�ţ;��H}'x��8�(���	�J��jBƵw݆2��(6�<yc\J������7U�D�٘%iu,v�o�e��rZ����i��V�?�3(��z3�\��L�#u^ߎ����dw\2n�,�	��|�/�g��
͂�ѵ�6�-@?u\��r�	�'ӗ���T�b۠=�%������C�z� ]�f���~���DC8�p_	-ӈ�Z����P��ö��~��k��M.��7%,�p8L �hE 7ْn?�8O�1�ʚ���Fou��\7���z��w���)</��)k]W�����q%�:����\��5�ޔ�ۗ������U���7��Q��"������Xh���p�F�G���+��8G��0.��.��U��,'�z+\�ф�dI[K|�5�f�</	�A��'���|������ƅ@��N��(K���;��É��-�߹�PJu�o��E3T�Ԧ�L�E����Ϙ
D@UN3�Q�.%�g��HI�i
9ŐU�$�ͼ����� �܉=M+b�Z������3�g�w�w�B�Z�(�S��a�m�mx8�j�
b]��YN��`>|۞=���5[s5tb��Gy:��$�U�pл���S,��v��d�r�H����R�a((׸(b�izrv�#��t2���K[����i��R[�������+�~�Ԙ��LMpmMb�0\s���9�xć����c)������wjfv����zV�~�4�|X�q�.�����rD&�����4��2nfm>]	n�/�lI"�seF�`���Qr:#0���"EDu+$lbeƸti�۩@${#�#`}�	�{��wV���o��� �(��y�9mÍy�z�K�?�!��)/�K�f �	 �\z���H�I40y�ͻ�����w���w��P���P~�_�����ۀ'���wuS�Gވ�҃M�,�!9�iCIj��m�����,(������j�^�bg������ϴ�ԟ������s�!9� 	�q�E��(:|��F���3�1o+M0.�d�Z���)K��ݗ�5�g�)��,[��οY�a���MG����n#�����O�@l^��hHŻ���2��V&���:�ZKW�,|��1P������M���y'H<��@�dR(��[�#��e�8�9��W�)8�8�eP[�q��G6=#OP5gQAX��׸pFLx�V6�2b�De���oiV�j��h$�w��S@���������ޫ�avK����K��)-S�� �X���Db#���˺���{��e�7U�.��� &�߱
�}l|����w��L5�I�����u���Ƙ�ͼ	\��=����;�AL��nD��'��<H��Ņ�(�K�j9��*�[Ρ�9���ؐk�k���#��Q�c2�x�w߸O�f'�Ę�>E��f�C%rR�YA��`C�.��^��$��V���|Jy~�i�;���;^ ;��M�� @�4���|��]��Z���A��o�F�l6��e�igf/X��o�ŷ_L ��;�Bx�: �b�#]j�?���N�gE���j�ڍ�LUq�������O��^Z�.�*Mi�������<�ð0�8<q���U�L�ﲺʙ/���$���a?��^c��֤fǠ	�#���쎬C��>uJ.�o�"�΁9��L`��H�IL=�]�Jv5�?�0EJ|0�!��<�0�M�5ǐ�4�aV*�~M0�i��=�_�HJ��O)���{�8هjmPm]F�w�t�6Ke�7�ja��%�o��h�%g�����k��B��8g����>&��ygM��������}�U��>������ZNY�H�$ք!�g�k��1Me�3��o��!�u�|�(�* �}���vPˉ��i؅��53s[�&��1sG����P�I�IaO��,�m�}b�IV�����rjp�5X4;M{6��=Y��߰�i�
�!"řα�f77O�2�����0������WC�^�ܿ��<��</�����V�2߳���	�g�1�?'��PF_OQ�I���I�I�}SBd�A�h���3�����m����Sd
�ѯ�qr����r�KO��"M�s��������`��4����i~c7�	�O� JڣyP
Ѫ���K��w]�M��� ���B�_E$VL��{��f�s�o    �7(ebf�R�x�5zM$]�6D�ĨRUp�Q[WS�Ñ��gC�J��Ҟ2#��]���{��S..��۹F��^���Z�����Zs�y͌n(��*F9�2��v��"ܦ?�β�_�� 7ᏻ��6d*�l�ȗC�TP,��?�f�n)�7�GD�H��N����K�Q�F��3Cm��m�oọ�d����v?�=�̨ W(6��p
�FD4
�e��*������O�AS+nKErKif��ULz�$�n��D���oG� zʺl���>c����E�g��t5�t��V�:M5'�j��+f��.=�fۗ��8pݷ��M	��bk�8����b�7.V\�m|�����k�א{��U��ы��'�p�"��O ��ѿr�-	���H������1s��{v���}A8O�j[�T\D�������D��O����C�n����r�&��Z���s-�Km_N'�z�Uy�qP2�	���q�i�؟6�9'��sl��#��#��;Б�ӄ�sl���w��bb�#qۋ�_A��Fz	MYx�1T��Ҟ�_A��8��ګ�p4�
:
���o�z1u9�e�Φ�
p�X:zϬ7���ݖ�������D9o��wtł���<��y�����?��b|�㯢����mu���`��c������f����CP���Ϥ_���X�	V�%��J����Q]�-��^e�1�}<������@$i�ׂ�wZ
�J�$�,Hb�GV�W��$�{J�{�O�ׁ��Cp�#pU��wQUu+�:� ��#��Of��7�\�E�Z��}&�d�)��w�9�a?�3�^1�O�B��~o%ܶ��A2�F�Y���9O�i��Q֒�.7�䍩z���5@�D�[§´�%����L�����O_أ=F@ָ�R)��ތm�[��BA	�P`�a��E�O��R�_���V6��U�*�����r,���-!��0%:uk.f�U�����"P��H���<!��U^������eL�]Ȍ����!�N��K�r�u�5��J�Z����5J��st;�Fb�� -��=\藲ǻJ=3��mg��[���s�oϬ��a����1#�x����٪�+�jTG1�6��3w�r5����4�3YpN��K�k&��݉Z������΁�4/�d��3�B��3�0� �'7��Os�������!�jqU�_OꞮ��d1k�,�c�����'�oP�
7p��>md�k���'�a�vD���s�dd.�~)��n�P�b�c:�ُ2��sӫB�wC�
���
�2����13�^�h���� R|Qo}N�ב��������U}����lO�25=>�:-r���_�Ј�f5^>�	"mے�iŠq���֛�0���r	~�r[�>��Fn�M���[�en�Iq�6���ፃ�)�S������|`nj��5/m�KUo����Q����5s!��,b�9���>{�R�-#�m����;�R[��V-'�x#�nW�z#?1ep��T��b��b�a���	��B�����\�.�t���~$��(�u6�<^���[Q�`\N��6��/q�-ƂY~��$iM隨�
a���w��U��]~��HkH8��X%m]5r�)rPo��II,DN)��S���@LM�j��k�4X�V�\ �.�JUbED��S7���)��;��sg�'%��|2�x�J�� �j���}2N��N։Zl��R�X��>�P�*����I�7���nC���Z:V>���f�4aR2z���\���ˀ�k՘��u��wY����˥V�l)�� �5�=K��4��簙M��V�:�R?T���;6#<O+��Yj�T�"�6��ﬨ8��ӹ�%�Q����ꜱ+	��I~���5M���|�T��G�E3�I�3)A
��Ӻ<mC��;^53���M����������3��9�L�[�9mr��3_=/ǋryZ�|)ָ��P�����ʸ/�'�4���|*�֤l�˓!�|�wb�s��]��k���o��7;�f�;�'A�nOd�Mc�W��g_/�O�I�~�����*PϺ	>�(�d�_q9Dn/�Օk���ZUq�Z8��w����9^)����(�-y]m\��v����
���D�y�����<����F�A������r��7"���\�ך�!��r$KA����M��wz?��Q��d�3Ӣ�L�Uf�b�j,H[�r0��x��&�G��c��[��UM�ܞ=*L�;2-X}���B���}H?#q�s֎.݈+�{#}4UW���^,j�%e�F}��2J��H[�8��-�}te��1�(�O!f۲���톐��ۂ�7{��(ǖ$�|�%���b�.??����%�~�{9���s��f�o)��ُ$�Tdz��>Ψ����!��%���Z6?�����Ya�ut���+`PWME��8�t���f!T���s&�|�m�-���WD����4��D�HY����v3
6ٓ���J�~�h��#Bg�nHͱ1s}t�C�~�j�9�(-]���dG���j�R��(#$�r�TB�λjR��it��[�}�}���l∋N�Ց˷ǂDi�3�+��+'؛mr����P���dB��Y2�J)I���f�c1�D���G��"a�sі网5]k*/��sً~)7Z'�������1�S�{ϑ���,��"ڳ�����5wuM�`�r>�N���B�k�c��-�';��
7��į�U��eإ��m��5��J�b�>�(A�l��d���t6�4�2sl)�ō��\�!=�TNع���J��#��I���K�h�+#�����|܎�T�޾�>�t	��~Z� ��a�S-|0*PD�S߽��G��.U^�PM���!L��+M��U��qL�jQ�����i��*]W��ҺX�� ����V�y��΅�N{Sl�qV�/6kߛ����9/��$rxJ-6�)����DZ�zWM�٠���	���ݯx;�����6�}��%�k�����`�[ǈND��H*Q�ɹJ�h�EJ$oW���Y�A�?��*'D�Ryi��-��<YS�hI[o:v!�,��Xk���[�Gՠ�C�d�b�h�%�م�G� *���8Є��^��)�Ϭ��p����v��4:w�&�-�s��e��ڼ#H������Ke:2���Rc�B���б�B֫~o]{:�(s�)�6U)\'��Xkf��������d��wj�m���$�<���+��E�/��"�>.��K�}O|�EP��fJ���*��JsN��T�"^�_���-87�nc�/R}�#G�Hܘ�G�m�5��E��?�K���B7�uM�0<y.�U`� ��I���"��W���h��}�}	!���i�y����B�����:���x��_�-ȓ��[�N�Z$":��VP���[u�b�c��ױ8a���8$u�,L�Ӛ�=΄����=	�O�W%���4��/���M�������/��f�
g��Xxn�Sk�������r����;u�(�
���WvxW�B�$r��g������Ll�`���lrFDc��>S�O���e��2dȋ��38��89�����3g�>�6b�%�l���T���'�F�|�_��	�vF�Y ��3�e��EB��_�ri�PN�6�Ou�MTn�����`����>Ige�kb��6���lǀ�˛H��+$�Z���Ɲ7�3L[�V��l�>�������g�P�r���V_R���{H��H����x	58�v�[$ćIF|���te[�Z9�؛�'�]e9����g���UO������HP��8^�O�ĞD�z��n{D¦��9�gyO�^'ѶXF���Q��ݻ�6��f�YB��1�?�,HM�z����&ٓ\�0	=z
�[�}���[������N�?j�>�H���C(G�k���J�,�j��nl|`���t�����|T�!f
���e%M&�{�b���)��r�������v��H�Sl����<,��I��}I�v�V��}�.b�`��]�{2�{��l�y�K��*�    ��Y������)K�ƟP�j݈E��85m��J/5�$)-��˼�"+��}�c������ \�<rLo��ݖ*n�������!3���w�#��(��q�c�R$J��yеrҿY��z��:���dfHc�+j4p"E)�Y��:̴���f��x�&���� � �[�׆�Z�� �ma��-����j�,�u�i�)����W���[F���j=�X�%�����<M��[�аFp	��|F[햵��mM=lU���ާ�,n{o�7CV�)Q�߫�$� �Gud�VN��&�./p&���)�ę!W�@��a�F�O�Ѝ�0����������<��ǚz%�A�U�uj�^�!�%�b�y?W��.�t����Uqﳿl�Huq�[�؋���w�S���2M�}Z9�[I_[��z#�a#�.��=3�
(l?D��:\0�O6	w�;�7)��BK�u�p��e���..�e�ؗ�+�^~���~���*8F@Al�k�	�^љ��Ƃl	��O}>���>'C6�j��l\z��72�ni��y>Y��ʲ�iDDZ?�M�%ڦˑ��� �cSm���S���+��ϖS �vd�Nq�{j7a�f�z���$���(�5�rꩩ����1=� ?a�g=��(ϻ�n����ι�d0Q�E����_�͗�9�D�%RD��!��Z�c�����rn��@u��	�8��ì�CK����ߺw�v�VNo��d3�
�:�o¬�=���&!i��KPv��hd�y�l78+=B��1�+�x�	��R�M���E@\���l=��i�;+>bT�K���|)�:�عxH�\�R\�}���1c����~�"�)c�Z��?��Hp7�|��C7�6&��w8�u� Խ{��U��k崮o���BA$�"XiQ2�:j��6��|��=��OÈ�UT-.�2�6�ǸHd�w1��VN���b�لX�8�;��X����sm���O�/��=n�7?k
�k��/��/Sd�2ʣ!�`��B��*�2�0g^c�+f�S���o��5�Ip�;F6Ɍ�:��B�g�w)��P�*3�JV�G`�P����)��"��� d��M���B���	�k�t"�k�^���p���ӹx�X�J�S7�?6u%��P�d���Yt�cH�����^��y ���6e9��d�MC���n�R�,�A��x	��F3�L;u1��!����$���xl���͖�2q�Q!?��T��udv���"�8��w	��J���[�T��k����Me5&�(�&$7�����A`�tY�����(<
�Y\[�$[&���m��U�z�*dam[�f[Y�ވ�2u�Ł�*�p\I�����Ex�_��7�y_3si��߬>���C�g���dd޸�h*,�ߊk���)�J*ΙZ�ֶ�����*a*��*u"��������.=
�k�ژ]��آ��� ��{��9��g��ɐ��b���Q�s��VS������Vb�ƍc�bv��*���<I.���5r�Ĥ��{UO:A�Pp�n,H��A+�i�U3�ڮl�U8��`6�kϞ���y���������< �P����j�We)c�[��VM�0�G�F�-�޳��@����͛�����6!���>�5��w�2�pm��3���Y�z�]������礑�U=N���Ԛ.hñ�V�Lm(��d8��:�iT��w�e[ʢ��y�̺ץ���Zz��Q�[
�Z3��]{��1�B���IP2���A4:�GJ�/���F%�4�m���5�q�`8��S}�l���J�!��(By���;��[t��#���wHǧ��.AuA�؋>��"�t�!�+�hƟDbnom��V�vߎ;�Y��u���
ϭ���ZQ@d.���j�D��2��i��Í��zd�t�5\��%�a��JˣYv���f�RUT�WH�]�����Ŀq���>fH��L�Fϰ�?�	�s\���*�*NbH!�=�f�;��Bؑ��V�CiK9��~ �!�El�Ŭ'\�z�j�)��a�q*-{�,ŸjjUS�HGU�V�ڦ�+��'������'n>��ǉ������h\�X+!f��4
�0�U�� ��eS�K���X��2]����(����h�J^��НE�9���9H�]��$��*�gҺ�(��ͱ��<�EXHK��Dd�^Ϭİ6�uν������U�4.���:D�2��	�LWL�i��
������ħJS�!k˹fdtwA��p?�!�x8�ailT����tL�{��X�碷���`���B��yj���G��G��A0��jӴ���T'���FEL���s�x��w��Y�%�D�Z��W�0�Q��R{�*Ooi���5{7+z=��&<�܅2�"6bS"%,�
UqE�YQ:6y��*����[l�����������!��;�壼�H�g���7�m>���`l}�e~���8D�o��1k�q��T	Z�~��H����c��D�B��?w�R���ͺ�nS���\o��n�ѦQ�GJ����G��}������X�߿�(U�ފ�oWUlw�_�)<������<F������J��+l^��UB��	aM�sWS���;�7a��=��i&�y@`đ���J��z�;���!|�������мvE��Q����/O��*��͏��ڙ�C�<6$"`�,O��^�&?�$I�ǫ���R�q��f�������\X���Kv��R_F��"�=�y_�B�)@����|hZ�z�i`��<���GN�2ۼf�"��һP[����;�<�@d��;.{�)�L�\B��R��FM�>��Ԫ�>�Y���̦O�c��1ڽ�S�ܢ����D�| 6I0?H
 h�Ү�Y	Yx#F�Qc���#{
^��nG�OҠ��I;�V�pN&�b+j�5NCE#%��~,$�֕���Q^,���mc{t2��c��6���؋�r@l[���"�y�4���c��v@�nW!Z�~�4��:MO9���#��-8n*����Lnޫ��_�R��ڥ
��5�0U+k�R��·��;?�%�f	�?���D�K�W�Q���f���t��>�# d8�O�%�0�_z>����R6�*</֒���Fݼx���U{�����l�����]�J��(H��lz`4qL<E��Y��	dN��>��r>��v��9}�A*m�����A�R�p?�Pp���bf��>���k��'��JR��؃��;�p
�9zQa�U������>�7�:���>;/����J��2�����yVr��x�*5� �t�X��D�jQ�|I2�u���P��~�.tK��]�E�[x�wa��f/�P�;(�a�-7�J����X�7MS��%�T�ˤΎ����ict��O��{�����k��+g)�l*�B������L���Տ�H-���|�G<�����<�|��n�,�_�]檗OQ$�Sw $"r��O�iu�4�u��b��!B<&v�n>xҩ�������b�M��b�����_�2��;O�Ed�`[(�.3�^�7s#-��Q,Ҽq��z-��3�4?Y������ף����7�d�v�{�D��;�Cue�Tj�wJ���c��:��8��)���(�H�Z��4a��=�Az��W3&iHv'�gx���
ןEHĥ}�N�Wq��0�.�-L(�Q��g>��ұ���]FC_�<�Y`��1V�c�N
�>��\�-W��DCU�`��7����fl�Lkg��H�W!n��� �Dx���h��7��"�0n"�v�"u�!��P5��߶�F�iO�un���������{��i&�݂�Ͳ]��W�@I��,w��,���S���yß8�+<ʕ������L�1���"'"]W�[d�@�8J\�0\5�*���[�JvXZ���)~����SaC�6"m"�̚@�3��0U����O�OJ�	S����'S��_6'T����#�!A���wG��O�E�N��H(}��feϑ�+�U�)    I�!�pa`16�W;�����g����
�S�W��D�Uy��[*�=>�P�ʣ��-�U\0�1\Ń�����
&}�)����À�3ZglB,[#	���K����5�*���ܹ4��^)ƻ�^�� }��1[��5=�ُ��:W�v\�ަW��.=�R��mH�jW쬣��]��c�9�H�?k�"�y`��&-	����ڽ2O�%�ـP�l����2��d��-Z'�7	�h���������,Y�s��vX�맏�CH`��Pݯ�c����/�U�F�w�;߃�:��i�Ԁ�WUͻO%��;^��	�N��~\�K�E5M�.z\��d�Z^���>Ըk6
?�AZ��*�.�su���X���tH�g6s�sga'�^��ᴫ+��Ah�_��<�������잦0X'ԙ�滌u���ee���͋�QLۍ� ��X�}��Q#.?���ќ������c2]�T���M�������o�����c�������9!
1*�`��&(����\߱���"9��l����m��k\��Le)P#�%�M��<�d^�*�}����7�x�G�)��p�x�j���\j�/��d��e �"ѯLVW��WB�1�$(�����*�=$��i��I�)'��v��V�y}"��̚�޼�����z�j\H!_��h�3�{�P���/Kn�84ɨ~ -�}�l���R��R���<>��[�W�Yjp�F���@�ʣg���;���`/��I��\�O*�;��h�2]�	iW�&��4�S��%Nz��KO��r�zS�(#��'ܿ������h���z�I(;�_�o�� �%�3����JS�Y�]�n����B�R�0�R�Xb;Mkr{z�]�����rE*I�����-Q�$]8�����'�Wz�9��Μ����Ƥ���:���̚�,6�K��I)!�e|��c8����*c��i�dt:���'���g!IU��Y�_��W�C=���b��.6�>�;�����+<V3�$a��Bp������n(}�9�w��7Oo����'o6� �34&4D�C�̴(z�o0@�;ѳzP��c�O�/<�
��ǃ%f���hQ|�Y�=��7��5;�d��Ђ/^!Ft1VKU3cL�D��L �RF��J����c�M�l�є�w��3��tm�����x�ݎ��<_M?���m��N��R���J:.UO��1�.W�N��\�	,g�k!�ˇ�5AtU2��bᷣ����;�1w>8���N�����b��,����EW�*�J�k�](�)S�����8*�p��[���E4u�Ɔv�u�.���LⓙS��VU��u�:N�ZCFSYZc�U�2�fXz�-���Dq���z�Vp�d�_��.eg��C��9f�G���Q��,���!���-�؜S���OԢ����@&Nt����v�&��\�l�mc��J?�:������i����:����?�s������4c�D�c�S��y�� $���O�":\<ҮbЪeO���/胋�G���Ύ7�l�a��zM�(f��(�;���0/(,!��]�&�V�����a��d�rf!��|r2gnq��)������k�tI����{K���'y�2��V
zt+DFK���U]�Wd�b�sn��}��I  >,���R�zI�md��O��q7���ILm����<{$���kU������-ױ''n�SYRH�C"傜�U��#�p4����#Sq$���waM���\�ch+�g>���٘��E�"&e~=ܝ�����7�3��RU��p~q��:�U�35j��!
i8��1�[ާ|���� ���g����Ts�lɸ:y�0[�e��őzhM�E���]����2}����`�'T�$6c�Ȃ���N�~��9�L�VP�V3و�9���{�d�z�>��a�d
�����5:��h����~)����;��*V`Ǟ��z��Ra��O��D�1$��=[�FDf�)ڮ�'���1&��˼r�IH�>�`�pT� �׳�5��4ѯ`��Y�����)؉d�ў&6zlrl�{�@��}�����"���4�<Tw�W�t�r����8�aH/2�]$t �]�>\�Y��EU��X_.٠땖:nV�28e%�*3�>r���k Ie���f���']m>��^$GJ��ar��^��d��:�ze��=�Z5kU�Z�cM'��{P�³�;
���j�|��SM1�ôV�$�vZ�!���/)�i���Y p� 4�6eI%��E~�?���;me[����{;>	$ASld�[��8cw䘟#������;�*]�,�gH{� Y��T��\�KmB�3�_�wk��42����l[����i
=�1�ko��]�Aʎ�
A�"��A$�mb�?���U@�/!�dښ?v&�S@#8wC�r�5ӿ��-}�[rT����0��W,E�i_I��������OBI.�"GfE#�|0�M�.|ŨMдb/�@0[�*�?Xt��_�@�jw�b�������}m��}�s���F
�
ᾆ!0�y��3�[��Ӛ$�N�=n��@0ʒ<VD3��	Z�$P���S����+�$T�u�5X���.U2�*��-]CK���N?�ˍ[a�aEL��R�^w�]xTDN#�3�+�[���j'7�..M�uߩX��B��q|����<�AEWA���� �n��>� �m"����}H��b�y�yj��8w3�Rx��d�B�����/���y�uB�R8�`*�����=�h:�=��9��ڥJ�Zq*����C><J�ptj��|Hz(���Y�-���	Yq��׭�x�2���Un:܀Ӄ�bKmj�{7c�g�w�?�L��t˨=8� ��XE.�j�|k�%RJ��Ϙ7��*S�LEz��Ԣ-K!{�-
{�w�gI��8h�J\�\nǂ�z���[)���]��2�e#%���X}�@-�'�@�1e���UlXk�ZI���NB@�V��M�� �'�)j	���<f؇�Ȍ�a�<��ف:l����F�b����{��IKVG[����DV�p�N���b2g�+$^N�?i��[�(����-ۨq�cR��TE'��9U��j��)��'��+<Lo
U�¸�Ν�[pJ���Teq�@��Qr��G^T8R��֒�MXr���0[�a�	\�O4���~��@�{��g����R��䤶���C�JԀ���Ga���1]9���D�'��"�W�DB�;J)˵���E��sϝUl�b�7C"�P�ȉ�To1`M�*���p�(Q���v4�yŘ��k�f��	�-�q&T'<��z,�<1�-!�b@�H���b��v��S��^�r���G-�mDgA?7di��S��E��Kg���>�85�ƼI]�c�]��[��S$�׹���қ�ޞ�+���kUj6���A/�r��uc��ϸL�4�ǌ(�Ro�����.K@˙�ץ[a��p��B�'w �'�v��5��
ҋcO�a#j0
�ld�.\��c0J�����ͣi�0O��݁��E����<�C���G��U0h��/�{�M>�8�P#�a�Fz@�9?��p�#ʗF��9s���l\fw���e
Q!C �Uy�}�.�Њ�mZ7��э�it�Ud_5#�s=�j��N�^�r�����6�Q�j��N����w�AS���c4u��M�h���/a�Ǆy�ɛ�����;�9͎��Z̞Ԝ"R����?a�[�M*oa�z�^}�Q���P>~�xb�w��B��M�x���)q:��zÆ.m}�C�4�i�^����n������b�f���<���|���#�k;�=�'�Y4rSc�����j���Vr.�iq���g9G�2�^�=>���� �v�߄�a�-���,v�����~������#x��R9�:��:HB��.-NOZ�+n?��.�ƭ�K�wDӄu�6R=x�>,)7D�i���O�WT}����hߔ�9C�5��L��2޴ڄ[)�j��\YP�{��Q�%<�&    ��K�̄�Zc�G�_��J�҄�W���F(SK�~)����f�
��$Ldt)x~�y��M|���ɥ@�����L܁7û������~��η}�73.�ɒ��6b��f8�oG�!�{K:�k�D;s�u#�����g�[�R�1���I���x�:�Bf�����zo�V9��Z��:]m�)�}�wϤ���b��������>�p���H����~Z,GT+��)gQZ/w�nSs��\t��p�0Ԙ ���H J�L�i�\K����h�S��۷��;{9��"�uA:�[v�|��wjm*�H>!*+W9#�5'=�^)X�5�]J��3�jruj����(�Ɖ~�|����-?�%D���/�x?��/�?��/)��ْֆ:�mi)�ʋ<�ޢa���[�׿eLN�re�}�]w�.C��mk��d��`k_��^p[.�c�_��9����!j l"1�K��!�1�%xUce��uMr���'6o�ng�;H�p�(o֏�X�T���B�z���4��j[9��Pۺ	[y���95�q��hA��	��2��n�m���d�w��A �b|t)�Xe�{�o6x��]wm�љ|֛=#�g�<8�0:/%��tM�WМ`{,����u�3s�*���;`�+2��",�+�
��t;B��A�Z� 0�d�G�Nqbd��Ĩ�ڈ?p���ɭ���D9��zH�uI�z"P��.I!$9+���dB�'�q �wÐF,�C�zeL�_�}���ʩ��w�	/͝�x	��l<~����4�lW��V�K��Ig�֨ Q>� 1���(<R]*�^��[Q����S�p<��w�6���(��d�t�I9C�_�[��$��" k9�WU�W~���ժ̦�-`�{��%r���)Y�i���_m��)	�<��(�M�,s��]3�r����-�͖�<��#&2���s��MGNl��}x$ӛV'��u3��U�����_r�t�����i�P�ޒ�Y�ܤ��i������߂��0ئxT)�D4�w$�*�c��q�y��Z���&����t{(��R���j� �K	k�T'$���\^rM��Qv'&�qO���W�r���h^�p��)��!^/�J����%ڄ���*��$��=�DB���K��z�%Y���%o\��k7���՜��p��]D�>��|��Su|�2_C4j2H5���Ia���x��8g��;�k�ɚMR�bC�_,.{ZB���G"�MdA(��><Q"�Ę/�'�z3;]N}2��y�Q��QN��N�f.�����r1t������Y��-�*��;��	��J��A��Xg�k^d��^�Fo�!��\k5r0��=����/��^\ޒ���Ԫ�;H�-�GXYj��L�J��]�ޱ8iß�j����V}�%��l�S.�����{��޾G��r��Rѹ�{c��߹t�Vk�i�ƥ7�3䪳Qnu1��Ԙ��jK�).�HRŪ_��h���F;C5��|p�'���P�?������V[���C�@�����|9{Z�.�X��nk}��p��h�&��ci�B�(��fj��'�*��v9;��8d�p�z��3Ջ��S�)u|,-Q����a���x�Ѵ`�g/�k�U��m�*Fz5��M�E�qQ�Sa{B�|ߢ��V�-�~G{�wN���3)��C�#��]�Al�s��7'Fx~���b���<a�w�|,D.sJ�g��ߜi�d�Dz�F1�hO#��e1ghv���?bB��ߜ�Ӣ�+s�qG}g�o�A�Ɩ5>�c7wβg���.���9�wq��U������=*D�Ԣ_�a�f�`W���������Z.3�l�3Ṗ�;�]����[���	���޲�"�)�h�c+r,� "m<vn����i*�K���ǯ4io�,^Aso� �uoF�eUH �>�����KL�ֳ2H�48WyDTd`�O�%=������m�m��}tHY�=��G�Pն�}���GC>C�᧜K�c�1��W�7@�*q���)��h���#MX���-\��g�e���:Lb$bpn���"8"QX{�T���m�Z��-93&�"�h�:�r��7)����++��@V�_>�������=�T��
����W����I��(���r^��j)(�=~��p/<�K�f%UG �4�φx.&�B��|��l���1qtau,Q��������1��NmiTu[�h��4jM���]L��83��`�Ыu[�v�"I�R>$��c��T�#2�Is���D����~���B]�(��ݔ+'1$��ʀ�
1_(
����!��>��� ��0Pp`/J�J�Ḷc�S��aW���Q��(���<��ͷi���T�a>,�l��U]�;�"�������D�1��|�Jh�a
sStu���h)5_lk:�7�:c6\.�%���L�G)l�4ܿ`��~��M��S�\4�xG��G�@�����E�o�ͳ��MEu����i�̓�ˊq]�⤒K&<p���`O�T�'�妌M�-��z�Cz/xA87�f˅򫴅ak�Ǭ^	9$pP���&�1�$����@��;�s��!���0�Wyj�:P����$��7�'c��+����p���ٽ��r�m�akU-k8;�X<�o��n)d���H��p�C5`�?��V�9A�N$ös׾TmW�cˀ���R6XA���)"��a����S�"ZG���+t���R	j$$Mȹﰎ�6�$EX��K(���6�y%y$�:C ��ݷL� �]m\n�O�]���\�6w���;{�;w0��E�����,͢�uW��1`�3��H���5
���S(P����w)��v9�����-3�TN�wC\����8% /�y�fc���\���
�^��0dϾ���5g5��9Q��:����FKb�ҽ7���J%�/�nB��<,��u��.��!$���f�6�l���VD�������l�Q����*���rbכ�1�����FnnL�{>�ī�!� AY���zR&����6�i�E���e��g.���� 3F�4�?;�^^������x�� :�����!m�7���_*o����|��� ��N5�'Sى�r���?���\�;Ak�F�d J�w<d�CZ�#�L/��2�:��1v����m]�;p+Qt�o$�ֱ��µ��}��%�@�yOAV��ur�G�����^��mh�.�_z�g6tq|�(��bt��dN}��x6b=FV]��}���%���Ϧ}�$�����̳����)U����y�J�j�R(�G�W��R}��h�#:�4��i������?��!ϓZ��ݦ�3�є�j��W�S3���F�.�iZ֢Ǣ��b��b�?����/����o���<��1~E�m�)�|{�_��Y�z;&��l����nbά[������9k�ܞu��]x��Q�^h2�Zж��_�(oI�m�NL���5ܦi^�TՊ��Å:�W��6۶���K�Ꮭz�u�ڥ�n�
+�Ηo�A��2�/�̊P�}X����-W*�UZ\�lw�����#�-�)���YN����@
��P��!�s�ဪN]��<�Ѯ�j@&W@�eJh�X��4>�'�3��T�Y�L�KB��	�1��3����mY�N ��p���B� �*OX�W��&���W/�#Z���|��i�W9U�)��&K1�wreo[%�"�rh�>����|��:�ѹ��cA�b2��!�i�(H�d'[>&\Պ�sFU�5M][,{����ݙ~G����lR+?Q��sM�� &�mZ���>`�?�|�����`O��"�R9����ʚ����x=6���w�J�!�@��[|ب��V�ί�=ԂҊڡ�����Z��\�[�liPSg�,��u�Wk>t�Nf���Ǝ�����'�f�2�7"�,��s¬ˀ�kw4�t�ԃE�e�*���P�?Ym`��-+� �L�5*[�r��:I���F�_���gָu�e�����V�o��kҗ,�)/hח�ˑ6MK����M����p���H#�    ��JW��ʗ���%&��R�� u(r�z}g����PA����S�m�c�1�.L���ȗs�����h#,Q��F��_L�%�1��p�:�� =]�a,g�X�<��y38��B�����E�|��#���*j~
�=zbwA�i��T�O���/y�2�U�fuBV���qs�%:�*��Ɣ�Z�G&����g�H��B)<fg��=��7k�<�t�y�w�a��BIQ�S]��^�2�;�%��H�Q�jr�!]P��0a��w9��њ���ώ{�F;C�YW?7��|5
J�����;>��riҭbi�����E�OGQ/}-
���z��+��[���{(ږH6��I�l�������U��6'-��{�zQ����� �C��漟� <��o���m6N :�19	>
^5�~	�s�F�*�jC��L)�7���'i�D_�7��Y�q���p�e�R��˥�� �?%�M��<sͯ�>T���6T��ٛ���������AR��0�C����eYh9K�Z	[6	s23��Tϧ��RLƢ�Z$F[�a,�K�ډ4��\�xTG������BGz�(	�\�V�(�D�$��sR��K
��<]�<\�WU��'ؽ�@ �n_ c�r�\S'd��݊R�[���A$��z:�y�7Eᆷ�,��B{I���j�)��4 M�H�\�rޜu�ƶ�M��7��ӥ�/z!���3
Ɍ��))��wq�����p�.�>�\�/gә?����wH+���݀y�C&��'�W��C��+ �H<�Y��.�]���.Qi���ƪ\:�o�j�-�_�S��pg�['$��!���%�ޢ^F�JF숟(���8���w+z(x?�0�P@��^�.��w/�&j�����dXDmQC=���;�a�;K��Vz��]39��=��S���(^1��k�|�(���v��(���]��_V�߶4��>T㟻��
n�_�X�[a����۲���]����ޖ������9����GԽ��z���mÉ*N<,z�������OH��3
>����-g�YҴ�ќ^�&���u<�iӒ+��F��#:JF4q��_z�����,��+Δ�j-qW@c]�ޝS77�4Na������R/NJ۝4`?�پP�ļ��^}�NS�P���t�vҘ���=	~F����s��o��t�ÑTV#ǖ����Үإ�Jt�-l�ך�utm6w���$3�OD@1�ħ�aw����7���N�������RQC��|Y��i���	SeK��v�м�3^W���f"�fٌ_�KclU�H~X7� ��#?�&���?R���<��l:�;ct��.\2�Z̴;8�?��	'�I��`9�ل_�o��Qř��ŹK~e�_��ӆ59l6Z8�\Zq��}trp����q>�=�����*힪�;X�No�r��@=�$Z�D��t3�)J��rIW�oƶ�O�X�
y<���l]��K{�� �8��l<�{�a��"M'�m�6�����6_�!�{�.�{��dk����2%�sPR�t �bR\�s�s�|�Z^�C���p�+��n��<9�|w�{��D��_�9��K��J�BE�h���x�*s�Y�l��ٮYΜ��NW�;���[��s�4ӬPLuy��Mhd�n�8�י�V5~v�<~>;��|����߫�'㵭C,!s���,*q���c-������o����.(e˙�ֆU�յ�`��ʃ��,v�ɺg��Q>��n!8�bt㰏�1z�u��T�Y�b�Ot>mopA�I�����!�W<��m#w��aw��A�7�khC����eJ�1�":�)����;'S�z>�iᣯd�e�E��p������]>x��L��/4	�B�p�p2c�Q��ō���.�C�3�ў���A�ʌ�n[��Z6\�7wإ儂0Z ���n9ߑ�F��N舆?��F��-�q��j�uM�q0�z���8�؝�f�F���{�[H��Q���eWg~m"��Z\�]�u�eF�L/�3:gn��(z{n��y��=i�V�p�`)����{�Tl�,�q�_k鳩3wK(�ZRͷ��6G��7g+�d���y��&>������hJt98N������+%����`N�6D��%�z���y��f�B��7�V�gg�>��-����b��q%O�\l�3���v��{�p�K�y8ʜ2��~��Pl�3�v�ܝ�?YcW�rnM$������g*ܥZ�3W��9H`UW����n�4�x0���]l(�;�����J7�頔n�MK���ܚka�b�K�uI������4��ho�E�'�!z����m��`��-�Y���*��]��tS+W�YM]�<�rHf�;��}�L.��0p	�IG`�� d�y�ƭ�t��XKeM��q���E�D=���4��~��T���~�BP�:c=Y�?�X����������7���q(<�A�t��̝PYӞ�(���`��BnQ���j"Z�'���-�&��".��=�l�T��t���X�p:oR��J� S�:[�����b�X<��<�>����].���A�%@��mp`�¤�H�AS�"VrOG��tndS�e�伌�.Gظ�l7��=Q{�1]� �<�\���-=<m��������3^V-Y���;��S�n)�LIk��P�m�~8oi����Vx��<��Ի��^����P_ɓ�jr��D0��VsƹA�	�s�sQ��f�J�X,��%�L�+�=ZMɮ�3d�K��掟���ȳ���	N�< w�6ӍY]�\^wE�͔GU0�ʇ��}�`�f�i:�d6�i�>x[It��~/h���u\�wxۧ���M��7�Go*/����fW�	��{�Mg�{-�7ON�h��j�
%��լ-�Ft����b�)W�x�n�s4���қ�s��"�0����R�q[�:���s�.<B��� �ߣ=TkJ~ͧBt����<,m;����3:q@n�;��$3U�Y�]��T�C�A9L�k�Z�3�+����t��WV�������x��y��b[�\��8�D��)�u^�sAy��r�/Koi�^��\)��TW	�?x�>��ٙ࿟y���=	�}���ǆs��f�38v((FN�ћ=@)T�t�h�X�;w�<W�h��2��0��s>�4Nh�M~�Btn�r��acD��4fm���n��.��.PPI|��+���36����$.u6���M�Zc?o�g��*�e~��ܓ�p�4�����B��-!����K����
j��^Ю�sz��n�j��NG��`:f?���k�S��Ùr�f9o��d6��� �ԁ��]v�:�w��9E��V(���5��=��:)��Ti� �]�QND�3mew	V���i��,�CC�g��s�"��#�a �$I�����]s�μ��.��Ր��w���fO3m�孢X`�8A؞��)N�B�ʑ�Pt�QҀwA�yଦ4*"���E�I��-��V�.�v��W;V�ݽaU�H�x��W�l���Үk��^�����♐���_���S"0�X�eO f�|�5�{f���:"���G57{D�wn��P\m��o7���!r�.��c�XqUyPɚ�/ȓ��*���b�N�g�㣘H�a��)�ʵ��r�ua�ZFK�����h���v����q��w��òP] 6B>����Kq��+�͕�޴`U�ܾ���e�䝏[��4����4r7���˼�.��:�y�t�Z�s��;b�!����Z�E�_���1�--jL�^$�'�^�,g�\�D�HOz)3����GA��{������o�G!V��eS%���O9��:Pl,��g��2�i'_�N���Ұ�~����q����nbB�t���yß�c�r����Q@�N���ً7����s�[N<B@�Sc`�����
V�#چ�:�P���GgC>�{�#u��s׽T���������*�2��>�D�P�g./����ů�orw�d    H|��賚�|��S`��Z_���SL5y�>�R�렣Ϝak�a�6�Kq���C����æ3u���	�<�3G�r&g�Jd/���2З��s��Uc�eh}H`�K��Ԧ�=���]Ɋg�fJ�,W��+LN�Z-m��2�
K���1
��� ��Ӯx>��a�iSB�F�	�YRסA�jk˻�D�䆵mjǨe��T�ր�,g]]}�ejD_���=�0�Q'�'Ƶ���G|>>? /�]1�qTlH~"��([Ԍ|	���/�L���=s�����U��[��������euH`
��>{�Gx��H�'��q�Ț8�m�<��D�C^�'��������ß�F9��u�˕���^��r"w2w�WZ
��16x^W[v�;���P^0MN�n_P4�a�Ө��a�Z'����Zm� ���kՠ��2��E�����H�#���U�"{4\������s=袭���@5DYjj�&���Yy/8����in'N���T�_N<'����_ҩ�j7����([y��
/�q%!����L
�� ���S���/�"+g�\(c�Q�ض��`uJ����4ǸƘ�vې�L���ZdƭTS��d�7	r4"@�D1_*�]��6��6�`qB2�/�� ��Qw�����QܿQ�n>�5z&>�� ʮ����7ߏ�i:��`s��ޔ�>M�����G�����,�?�F�ʋ�~�m��E����?�+g[�|����S�:2o�C�R���v�٠��'u�aY���N<�����
1����Qί�)K���[��H�s���C�1a!f,��[ـżĚ��������ţ;�{�a��z=6 Օ�7<禔�[�k���ɷ2r�좌���h]jж�!�PLN��$��Jy�s��"X�W)� �����y���\��s^7ŏ���N��[�#:�f�b4�/����>A��}+� �ڛ�6q�=(���p�E^�3��hѪ����]ҹH�0�jp�j$��V/���/�1������ڼ��b�7�XH���˿���e�/͕_�R��:TKfS��F9=;C�?Mt���n��RHp;�{s�oB6-��6r����־��k>�B���*�ʹU�d��,�{B2y�e�c��+!}���6���vԱ���n-	o*����,_kӚ1mЃ06�>������=��"����J��	m�Cό��S4������-�ztn�Y��UaFכU-�1[�#a��8V8Ӏ�v�Z.���W�t&�]�MRQQ(G��a���ܧl�]e�Z_�L�l�&*&	�L�#�ꉔf���pnٰ�<�%�H�4o8�=*l��e�y�?7��RM��UU��OP�b�nj8�f�_rT)�Z�D���I�C��+�N^7$2՛����s��JP�eR�*���)���YXN�I{����']�O����[!���z�}]�o���Bxǯ�M�m1��qϻI��Ob�T����{��;K�<n���\%ZBj����#�����]�$ߺ.1�����������ŝ����h5f���qPl��6�]f�-����8@�TV�5/�����X��='O ;����u�b��O�n���	P ^����\�6�z�_l����?�=!s��
(��b:'JӇhK�8�p���KKp�1�z��dxč�{+�Z֟�*�L�1{5��Z�6]z���W��tK1LE�]g?YGO���S`�.�z���[һ1:��ZN�cһQ#��݅R�M= ٖ��?�wG59bw+H���/~��X'�������=�{����ۋ��V9;�<\�n0��Y�/n�rx�%��K9�e��)M���o��/n1���`�\z�I�/�����`���Ϭ�ܱ;������֦9(X���� ��}H?b��u�ғ���6��W<5�rΫu:馶�Aݔ֎h��8���XT�a���!�#�K��L��-S�n�T��5n�X��C�W�pB���ytr����� �+��gx�wԈ�1�1��2D��X�v/��Z�����3,0��0�$�y���0)k|���M }�Z�h���q#� m% �!)�Mi��u�Yk%�S,t��f�z�	V� W��DhH�s����/��|�g�3k-���sW55h�[Ͻ��#۔R*��f���}<욂6�K��#A�<G�_��L3�EN���Z4U�4�M�&�
��U��ʰ��������V#�%���b��m�L�|~މ��>���̖���\�r�%�.G"߇�`�d[�hX��p��h���~�=\A�m	F�˹B�V9k�Z��lC�*�w�:�|�57Uw�8���~�l�뷭f�U���� ����J��r�5�L�[H�-}�(���dCH���)Pa��iwv?�Z������?^G�6*CE�T����]�m�Oѡ$=��Ǡ�����O��!��4�ɏч4�H��)��yw�E��65��A��G�N�<;��l<.H�vT4��@e7���G�ڀ��a∗�`�/������E���ja1�Uٺ�B����*l%ΐ]웉�~�z�(��֓@���j�:d;�f=*��2V������[T�]H��������܈t���>\�a3��p���h��Л=�Z�	>D��v+��:��DI>�misI��)��1���j�ù4���l���.�8#*E��U�<:�*�d�,�)-a��tZ�/���E�r���������E����\��sA\!ĚJ�-j8�)�#��K`[[������}�Ė����G��yv��2���e�	D�!xcylE�[��w�ρ\���5�9
Px�"�ʾ�j��PԶ$]���::���������z3߅�0=׹Bk6�D��Tx��E��R��XA���Nw�%=N�*JC5;nC���ͫ7)�cn29�"�����k-�<N>���.6���g�?=5	�t
9�E^��T����1*�Ǻ�ܡ:K>r�Q�~/���]|E���ڞ���_�#�O���s�dS�C������Z��}�l��oX�ob l� �2��e�9�?޺�|�nw��\���#�a�a�������3�B�=�Q��voܶ9d*2���qI��Q�<yX^��e��<T�JVo�M��d��fg���^ۗA��Y��K�d]�����K�cA���x1_!?�R)@͏KRC��N�|�OĒ)4���>�*g�\����!*Gx%e	�r�>W����������"��K�=�8-�d�J���}��z��F�ָ�!W#�y�
�
��n�mx8��m�1��|N��0�9J���#��YSANCq^���s��A���C�T���
V�'%\�>m��F�5�E���U&��Y�P��������-�(ǰC�|�X�p���K�t�����{��7��"˒0y�-{<iCbQ�[,�C)#*�;BG�����u��9,E�,����p{���eBVW�|�b�q:
9D�_���}��_��k��;�W��fH���-��J[rJ���R4�ˮ�r�5�w���r�%�[�|P��z`EC)QoQg�f��{'��K&+*��#h��Q����f����I�A�V�P� -!�*"������OYS/覑S�a��m��،E��Jq^
��td�:L6�a �2v+w�ۚ��C����Vc,�@.LߧA��ӎn�z;���t�.;��w�|��\j6c������⛨+���5��޲BG7�����z+OJ},5�M^�ȒE�JlA�!�ɤjڮ�u�(�� rj(� Uى}h�(�9
��1�3�eL8�n��܍RS�L����x�����3T�� �n_����M�� V�-�</��ݡ<R���{m$s��@.41��D4,^=cѷ!}��j�YJ�/�a��ji���RJrD7N��h��q��d`n�9�E$D��>�����c^UT�V���7��l�j�Б�`$���TD�/3�E��X�r^��(�l���������
��]�	��+6��^�x�_�Dƍ�2݉�⫮�c7�7�P ��1$k~��[��66    ι�� JF[���z|�˚��đxl��_�$�)g�^�ֵ�l%�����%#.FU�1�JW$�4W<p�զ>�i�Awj��p�r&�5�S5ې:Q3h���^�^�O�9�W�c	�iv��RΞ�c�R9&���Q*�^�QY=$�ij��L9���b��������.�fW`-;���>E��Z�/���{���/�f�j���Mt\�{}� 2��_
�H�WCAXj5Y��\O����B�t띖�)u�_% S�ٰ�sGx���)�o���9F���r�ܨ%���|6�Z�7����m��hxA����wRf���]��KTx�p������Nl�;Fu��-�b�Xe�gː:�j��l�����!�7����DB=�3�"��'�Aּ|o)$����t��GUo�I�n
yBo+��Ѵ9��_M�����e"q9��b$�8�9�
<g^�6��75�0��������eѮ�R��f������R�wڤV2OH�:��*��\#:������%�h��l%*K��k<6���S�3x�)V��@J��
�t�?�_��*g�\[��C�ì����m#�����R��.��K��9>cZ�*���h{𰇲b��]�_�M؆\�y9v���k�mVr�h���(�	�:^#=�pA�M��s)��j.�pF������T���=�������m�V�;8��n��3�/����Ϥ8-�7��ӱ�΍�弃k�`�ݎU���'d��3�����e{��0��"}b�� %Vo�e~<�ƅ �r浵�t�u[s��;�%� 9^��l��C�1��h��@ldf)��%�A�&/�Lo�[�oxr/�"U?ΰ�U9���w�'��֤�+�T�v4 ���f:嗢%�z�X�Tk������r��,y�P�}T
1��p6��H����xh�h&��W������	��ik 3[,���w� ��VL�#��e ��I��k�5n���G}�L��]TMB���_�*���� ��Lp�MjL�m&n#��� ��-~�Cmh��#�n��Y� ��Cg��қ�y 
u|�����z��NH��XS�)�t4��rы��Ε�2�⁷��$�;�t���@C��
J�[��b�%n'
���
�$%������k���6DA e��=g��'ܞ�5���w𓦐)e�fF���4��j�a9�| ��C@vPb�b[?�;r��-�'6��^=�C-ο��8���5�*J3�/�2`���t+��2�Pv�0�E�ɬ�&2�ht2���^ ���~^�c-g$Z�~����C���{�3�Z�o���vc��P8�[��&9�f�a�4[Ð.R�&Z����l��u/P�C��h���.ؽ�N@��IF(�P؍Oo�(<r	���_m>W{���@]���}�s����~��y�Ǟ���K��mw�uH�7�1�@4V�H�r��M��U���r�ِ�&~������&�������C�=��K�U��U�)~�e�Go��
�v�����T:�@ٶO���MI�I�\|.�菎�_�ffC)�=W����]��D(�QC�W�"w�=�����T�׻�D�X�N�A�l��r��uܵ�q��;�	��LC����V�D����*s�1'.5x���)�w�K��r��y�)�G8T��o�[-Air���s�������	�#c��x9-J��Y\����Mk/m�ڒ<������	n�"|��Wh�e[d�C���wD]�E�u��������E<���rU�������CXN4��-j>y}�f(k6@�e�F-S�S
E�Q�	�|<N(��zl�C��"�޴qt�T�v]�SB��De�쩐�,UFԆ��B��yC����E@��
�Hxؒ�Z�Tӑ9*N$P��Y���vȣ�):�f@�O�EϷ�xH����ؚ�$���8� $0��Ĝ�8��%J�Lg�1d˛�p��|��xv�Ro0º�̵�X����n����1Ǟg���#��\��(�������{~�A=��Ih�!ڈ�^�uI6d�ܘ�X1�զ����;n�~��:8�Hu∄�1oP� �I*6�P���?���*��F�	�A��ʋM������9�~�Mi�F���K�y�-�[��/e����mB��;f���}��Q�	��:�z��S�e����K�1x� �Ee�]�������Mfr��~/ -���:�{x���a���bW4�-��n�����#��niwC��Q�3}�Ð�)9y�'�&P-�Dͭq�wc�B��k���l�6N���]��,*�ih������p��V_�'%�Q�Z�{B���{uS�ybf%\)������n�U�s��&���ۦ������¦�����o�I�Y���"���Hߏ����m�3�ь�U-���Er���-}>UΊN+@F�%�m�y�u<�-K^.!a�쯿@�mk�]6�i���c���ȡO$Vl�a�sz1 &9�7݌ۦI$>2QJ�z&�&d�'Fؕ�ﯳĮ����ڀK.��;e��mRs��X����Æ��w ���9�ӧ/�|,���-g�]+.k�о;�)���{����)����~�mnh9^"i�C��{<5����A����(�ߔ���?M�7�ow��.��-e_�.6�!Q�Q�Yc�ךMp=�Y��O�N��<&�Iª���$����
���iDW�Ԏm������e}���Q����&�0�y��RF�
� �]��J��'|B�Z�3�^m_W$3tîNS˹���h�X�"��5�u~]7�%��Q�GP���1j�)uc�-�zC��gpL㬑��g�}m�yy�e^m����]9�T�FsS]�d;�'XH���2W*�
��)`����k��[���,O�oe�����Rt�/���;��w���7��7�J!�*�zxk�ўo�nŨ	>Ƨ�=,�'�p\����*Ϸ����6%��\`2]z�3�������
(���y���W�O̖.[�0-5�GfW駢��eӄ��w�32�̸���L16&�+vE�e��42���@�d*���;Hg���Q;ôR�A����}
���R�]�?�<k�a�mi����Ɉy]D�˹r�FDʹ�g���q��n��z���P-tlJFim1J�AK��R>`3��ܥ/UT�	�hv4NV����F��O��Yfj,/C�ی�����.g�]Qd��ݻ^ߑõ�y��3��'y�!��2�^��� O	�.ꍳ>�]�H,V/��M~��8w.�-��m�����#���9#?gC��2�)�X\����F�y�PUP�wI�M�;����ӵ���5iE=8Op%�-l�A{�˾6t	�H��[T	<朿D�wTk�u͹s'��|FJ�ŅRVE!>��@H�B�H��b��ǒ��O���a���������h6����Y�<�����G��C�|s���m���I�4yJ��������gmo8����3�7{��L�č(!!I~;�L�LPR�pָ�kA���Gn�-\�N�m�y�}�\=�d��1{uޢ���_����L[�ԫ�b��g�
��ŗ��&H��(A\���$T�l������7"u�w2d'>���үoR%=V�������*"a-x�gS<i6D���F����T�p�ߢ�h�d��|Ҫ{^�F��.g�Y���|����L����6
� ��`������_�`��'�Za������Hq�y#Stܝ�o,�yy�ߣ�2�q�����*@(�a�s��p�+�_6�a񞝉��\_��Z��H�B��涐dqT�gU]�2�N��B���TK���.��Y_��=:H/ss�jK����"X=AJ!����������$"��I��]�J%�*���y��.�$�z��1�!��81ZW"chÏp�79�Njľ��3_+~w�3q�W��9wU��vS#V��m�N'O���w%B��6"|���-�4�D���0��ݖ��l>#�:7euj;֦�k����Y�ρ�[J��qC�&L^0r�N�sdm����7uβr    �;a�ϝ��]��W�|����	�r���OIu�Z��z'چ�{���-Q,���i�]�J���Q[��ָ��[ړ۟��@X�R|&Du5@���,(�ybp��;֖�W���j�:PH��K �Lk
�!{t{ϟ��[���&�+��:ڐ��MFyR���x�(�)�P�˂����'�Ԝ�9S�ZcK���a�}#uH�@Xy���Y�A!U7�L���w��z�}��_ ��:�*T����N�R��x�`�*�z]�-�+��z�K��[DW����&�v�w�/sc�I^oC��x36Y�n�	PRq����V�O�d`��n���݄H�hw�<,�S�Ĺ�N93�� �m)�w�$7���E�H�ro[��E֖�%l]k�g��c����� ���� �'�iP� ê+"�1�G����\YʢK���X��4�����:�_bW�M�4���Y!a�R��A�s�>�7�}0�2�P��?v¾���Q��ܔC���[�j��#m�ԟ����#����J5�T>�D7��d�����g?�i[o��{YBd]%dX�	A��-��;��pj��b[�z�)�$x��J�D���n�D������ܛ}s���nĢj����7c��Vt1G��9S~�Z���A��|�F��4�e�nfaJ$�Fӧ�����p_c�n���s���"�:�6�[��c.�61�QjA��^x��=7Y��|�}�t^�;�}�\� U�Ա4o�{��?t2|�7��ق���&a{/$�fZs���`��������|�s�+T�������*�(�e�r�U��pk�#J"]�ו60?�^��R�h��H�G n�>��6}ޣ�B��_ �	DŜ�~r���Z�� �������/�g���s�g(A#�L��O�>��3���[q]�$��ë͓�m�6L�8g�G;J�65��>��1����7e��i��-�l������Bj��l�x�t�a���v9حi�jr�v6�~B5�`�:����̏���;�B'̖�#؁��?���q�Δ���"�����K���'����Ct8�J|���Ģ���.�O���F���\={�n+6Dz^���\V�R)�pEH6�Í�y�A%����-�H��ےr�
�a��o�9*�c�79sw��v��bs���V���Y���8M1�õ�Om�RP)kZU�z�\��N�X��iׄ��>r�7��f6}Fr�K�p�7�ְU�¼c4߭���D<}O�!cS&���J2����Ej�+�BE��x[:��I[U���I�>t��%�W��[Hͳ!��a�}�md�z�u����Y�ٗ�F�%m�p+���F틞3}t=6B2EiH��6�-�->yBK�O��z����'��*TE��tWs����4:O��U��=�M�9J����0�� d�����VR�"�z$#*/����>��W��X��=��V��/�gdg9.��a�����H����.��6��3�Wg-�Mׁ��9|�$<w��6��	ٌ�;�i��)|{QywN�¤��E���uOS!˒U ���EE�l��H9o�?=cx�b[ah�l<f�=�[r��z���^���&Y�\��f�Ls�;b\��!H�Z�8�A>��n�zg����4��dnt�&\�O�Gj�i�Q9�|�����ږ��:�lp%=�԰֭�2�qA�sW��$g��>���ښ��sQ��.�%�Z��wt%d:�X��4<69^TD������.;�����ś-f#�/�Dn�r�{��7w�+�%����1�Ɋ�E�T�b]�Qu�����p��p��$6>#�w+�����K���r��t6�\��na���<�9���K�VG�>��l�;�ѿ���)���o�=Ά�W���y�+k���cg�j��kL��r��#+�����D��݅�4�����sv �y\N0�=D[�Y��h�(��ժ�=	!�b��������#ףq��)[s|���ЅH��ncŰ�)�<�W����K!In� IϨh����.z���F:yj_T����y���:�����7�T�PD%�g�-AN_?��� ����ϛ���;Q����L^G��2!�<�����r�p����"X���7;*���� ��mJO�� �S�!�.� =�1Ǿ�=�N3 ��3`:����e�E�����X�Н�0��]����NgY�����,��*��g�?t�@��wb5a=�{��k͉�u�HU�w`���3,P�C0nFk�B�q�'g���E���m�8������א"���S^�����:$U�+��m�;ҟ-��e�AH� I�_d���>�D�Bt��ھ4��0���d$js�[$��$<y�|Ƴ-�������f> /��\�9��4�=����z%��������_։�B����͐�nl&�%�Gel�:�<wj�5����q���ET��:���`Ƅ�d���/�u˹���wc��I�����#:�n�����,O�qN�k.Lr.���M�C>x����moLD\�@9��A��B\y"�\������X؆/���1t�Q���'���wj+��A�#��� �E����,�5��v��s��Q&�M���[VK�c`?b8!�`�#8�k�|'���C��G
���O.:��0o�����M�9��{6壶�d |���@1��a;��j� 2�)1�~>j���EJ䯶!%A��6����jtٹ�˨�����q�2��I@y����̌��������i�aj˧A�-o�PR����A�:��ďd���uQ���M���Ҝ^��#�E�<a��Y���I�:O���tv@��\�����@�z7�f���ܻ�دW揋}x�ց�!�S���?�ʗs�����@x� �YnP���z��h��"�B'Cq����XT�[с�����9#//	�t7#� N�j%�A�Y����;�����}�Q�8�e�:5'�B��F8�b)��ř9���֗e��t�K�@��B��{B���1kW�0���Ҵě�7$؟+P�Q�,��FLϭ�8"�X�'t���;���F[rKm4S����o�	N�A�4��q� ^}��.�vUh?���Y']�M5bܘÑ������1%,R��g���~�5�R��m��bgWH7��Ӂn*\j��W����J�:����%�U�nƴ�S����瓞����PE^P�����5z�ͱf��K�B�#�8l���DB0��Tnx���sw�J�Pu�X-�Lz���0D�M�'��S����%��u�U�L@�\�[z�Ə�E� F0�P�g���x��Q����//xU�T�Wc³$��K�_�<�5��
��d�ŬXU �O>��S�y��s����U�؅o����a���q/ܼyy������e<�N��"��� �.���%�����`�����Tg9������p��F��#�6���ʆ�^����b˧�p����$2پ=[P�}��G�����Yo	������\C��u�� �� �(�L�o��#7�]�/�E�i����å�c�vPə�G��ɉy�̈́���&�6O��B�U^��N|���I�_��ۥ����o��������7���r�٤���@���]�l���$�(�Cw�?��W�d���R�r��"��&]�ݻ�D m�f����둳t�!0�*��x;�?�$�ȲLT��<�23��m��IM M�r�RW�3�7`�Q<&<&�p�C����B�,���
O�-����\�����1mUVfR�
c4���,�EG��V��`��k�R*϶�%�]�}X���#Ɠh��i����1[��'�ݸv���`���yՔ ���t5� �|g/Ak��-�1���Bn���ab�V%�.����
���������1Q��w
�F�<a��_�/5���ג��ӛ":G�E�R5\m��&�Ϥ��|��K
'�9��0�%��O�H�&~��ʕ3ϫ��$F�Ɍ�lطs�@���|N���TXI���e�J��b�hS�{R��O�"���    W�i����:���4���`�՟1�?,��s��2C��e(�`�&��P��0u����Cn] �|�1��>t<m̥�����<x�g���s&�+��'��bsb�ȟ�A�O�	:5�E{��F��V��l��/^m�X��H(1��;P��<
/!a9�O�S��u�`��7���@$2EX�C^�&S��6檦ue�0�n��3�gH�s�@Wrr��g��M&����/�Ulɑ؋����~1��TЬS�9���4�+���#��Q���%n��+mê7�lc���fҪ|6��0�S��T?Ti7�z����g�V�16�k�9��w�g�����jCv#I�'�H�#�􍘉�L�'��|s�᷿n��	$1Y��ٽ��y[a�G�ji91�>�<�>�łn���Z�㍠���,z�;��?��e�p,����o;�\K&_�r-m��Oo��T)�2�D�I��@�_G��]�"�x}l�m���8w�K�u�Ӄ��o"���0T3 ^ɘ%d�V� d���q�g&��ݼ�2�{�"JH�7����䣸��!<wcJu>�3���p�]TlW�r4����M��'��ĒOZ���W�_B�YbQ�m��P{��n�
�etm�����2�:�1����4W���*��8�k�9�Cf�S��;��g<m}T����/F[ٕN�g���$'+[�Y�֟��w�ys��J���1�j������B��ѣ�G���f[��ę�~�XE��-(�*�L����K5en��lڥ�r�#R�x�-t�_'�Kf��'��)�]���y
�;A/j�����0L�?6X�V����%w`"����<��j�VRT�|R��&���bS[��E|�u�g���ż_LoQ?(e\��V4��r����O,T�凢<x@�1�ι�7OȌI/N�'9,�67y�iJ���G���W�?*s���ӂ�?&�Ll�§6&(֑�#�$�-8wYK�/���΅��s����b��+���s��iP��SW��3w�mc)l���
#�]��j�~¹X�N��r~����K<�;��J��;r�1{��L���zθ�[uS-�&�1D^c����Yh��p�E��t&��(v��)�e�W�w�hY���ּ��'ֈ[8��}[������L���W�@Q6lu������4�������EK�E����/7�\�7�o���͒[|��p�h��OJ%~V�-��}�v�!مP��哔���e~0�|����\�ԽҊ�,\�G��Z{[ jMa�=����t��ueJ80�v��2��+���J�lӺN�*�T%�$��Mc�X7u���ȐW�"U7yC��6��٥�(Py{���Ew8�����!��)�Ι+��tGe`w��9��ڞ�&`��l� �j�u6|C��o�w`2i��ῧBC����EFi�f�Zz�X���4ڿ�|s�9�K�D[g�=�#��Ӎ�{ӈQq���ds(Y�pc�r���uHG��2�uN4zl�(%wE�\|z<`��y��'S��\a��U�ʪDtmN�a4�j����_9�$�h)Ȑs��|��)��&��#A��ȎX���%ك��EZ���]�HC�*2(��;-�y�{Աz�{�	��s�]	�MC��8�p������&�ݸD"���|6��F�Ch���;��ݹ��^
�_����Z��ք����s����:�(P��AF��`�H*�Ğ��Ep\��]������N"�r�uŊa�L����9�U���:K�D'�΅QNV�p�w�|��\�!��;>�4�b�� zl�����WmG�����AoP1�C�҈T�����L#��'�d/�S���D�Xo��$�;��W~vlm1����ġ�$�h	t��*F� �����[���V���.��~H�7wv��[Ρ�6m�N'fu�;���v���(l�}�b��G{i�B��?�e�b��Y�Հe��j�;�1R�}r{��YN~C	o�2@~�l��c,l+���
_�U^B�-�V���mj}y��x�,����-���C�"W��`��V��R�'u�\���ꥰ����vu*9�Ϧ���n����MH'��K��)���(o�'����n9���qջn
<���E?ȓzDl�;��QO%�46�C��)0���=��(	-�>��J���������/w������o�T�nJ��:|�%�^�_�v궵�3qǨ��w�~���&IQ�5s�G(]_e��
�7�+_��1s�.�~�8E�K�ŕ�ӣ�JWp�VlL���?�h���|ax�����cc�� -�K�h8v|.mՔ�{� �yG���-:�I��M��%U��4�ݜR�U�����FT�xK���e�c�w"f�-59`�����-����qO'!�$�ӭv��9��*3��7��Nam)��5�z�?��~ ��c�3�����Y��XX,ǳa���$�l+��>|���Jӂe>��9��;/�Tm�*�jB��v4o��a����F8���Z��@�4!GU��>l@Kx�Կ�!��\ ��rT�J6�j�c�U���dPp~<
^Rs�|]��n�����Ҡ�G�)�'�����!͹�Ǧ����q���a��	Μ~����|6�_�����wT�a�{p��X%��8����}�e� ���sQhI���hǜ�2;¶��'��K$M1�M�n�8wT���[BR:�f�a4�/�(�	)����"v�-QbWk_�i���P?(����6dvv�K���9o9#º��p|ͱ��2$/��*m��<����QP��|��M������w'��J���;�A����C���f;^�I����mR[s�T��N.��OLF�P�m`6D}#��)�H�*��T�BQ��Gx'Q%��/�i� �	a��dF:^�"�������y\�'��OJ�*<��l�x�qUK� A"S��޲�/H���GOu��_��a%F�^X�>���X��U���5�O٠OLVF�|@���FU�|ս�h��qw�b��#E^���*B�K������!�S��GC�������_�:��_����r�*���ݬj�"ĕH*`�����+���qÏ ��	�8k�o��Z������{"jL����W�{�f�+��&��ƈ/u�n!<�;5�8���u���N�W�u�yP�C�Q&>���s�~1Ux;���Wl ��k��nxң]IU�Kx9�r>�u�� �d��+>���|B�ĩ3�
'��ۿ�bn-{v�o9a$���	�����Fla�}ú�F�n�TM�u�s�O<,�D��a�ZN�}̒���`e�ݥ��[#,e0������GuB:�:	~s*�¿���=�O.���_S�zQ��)��M��1��ݏ��+4Ԑ�Eg��5��0��fl��i����? M
�8��nr�8A1t����v[1QEۦ��q����!`��#�]����W��Y,�D�1,d6�z$U����f{�د�2O�MA�ۏ1^^�v�^Q��1���F\5¨� TW�46v�Pa�8��P�Tz�nc�K��_<�Wa�*{�;��-��ؓ���y�]4��D��fV����d������ʴ���~D�� r�!D{�#o*�Dɋc
I�!�*3�u���[�d�s��~9����FS��{�)6!��.�q�%��a������~ƶ�m���:�if���nrwй{p/��>�LA}pg��\:�?J����R��% �RP�/i�w�� ��7�2��	��	��g��7}�Ģ�>�y�z��" �s��H�h%Zg�(S�n���S5D�s�nI��+Ew1��\��6"{����#لɅ�nQ;�T��iTmX=Q���p�r<}����U2/x}7�$p�@�Nx~�H
��*�ߏ�1ܮޒR�b�n9��hx!���A���b�	�����wNL�R���}[WB��v�����[ޘh�d8m7ER[d|�^\e�RM�aQ�H>�5��Ec�8�4�h��v,�)�=$?�A�&�������Z�;w�YG�$_    ���?�6��*��5 �9����L���*��&���Wf��ش5�����E��9Uj�p�7�wP+����[A f1���5.Uxu)<�Ωr;����n���V����و]g�H
^��ݐ���W�yy���V9��:�u[M��9C�˻��'�����W>��P���G����h�ms	0�<ޤ ���=s�KU\�P`A2�<�9���T��P:i���*
���ΐ����ѧ�5�4���*��y����Cv�·g���h�pl���P�!2Ԫ��5���f��D'&5����A)pD�"{�DE�d��߅����:#QA�RK�5��.X�_�^Z���bz���3�*bl��G���| h�(t�7�ک��{�e_�i��U9sů�h�y���p�<�3�����r�,��HG؛d^�3<�'j�ZJ5SE�������W���u��B|m^���_a�-��ߌ	�^��[˂S7zf��C
���J
S��k��9b������f��x��V�uN����l�y�AhB��6������RH�#�~{�h���D�Xo��X����K�A��;�%sC�:���+��'���x�i�a��)9��k��٣Pΐ2�d��h/���
p`��/�R����a�a��*��.��c�b�zC48w��t��r*�nj�A�A��.�ٖR��M���w��8b-�V�"��R�(��1���A���p-B}�<*�Ult������6Pi�C�k����CX�5�h�q���1����Qp9�z4�ۆ�_�-�$��A�?�8���Mٻut8�����v3;�h�+<YY�sC~�\U��O��.�����pS�i��3�qG������(8��<le-f�L�C�u~z��"Wk�Z�7{��E�c�>��P1ȤU'��1/�)����aU#����q9�К���mXz(=RD��ueQv|D8r����r�8)���� SZcľj0YQK��I}!V0�j��[r��1���&T�t5'�T?�P/���n×ՠ�-m��ߗ��Q�t���K�G[-�S��P��>��'�uR+���O�s�21n�	��E$U�y��Mm�\��	9h���=�&�Z�~������[*?]%A#q�t�_�d���A˨�e�6�j�;�VO��h���jUr���i���g�ͶW�l�g����"N�)�X JŪ(���H�jR̸�7�-�emf��� "k�Z]�2��s�d�n㶽u~.-d����w�|�B�
6��.��u/����a!c��l6�"k�����s�����u)��'	C�?It����R�T59ޚ�S���B������I�~K�A 9m�s��!���V�FSS����9������JaM3�����Ղݍ��l�0������W$�蓈�d�~���M�9۪}0��p*���ZOS\k�����y�d��8 �Գ�`���9��'���V�y+�T��@`'H�? �&�첽�r��W�Ķ�l{�h�Hw��.�q�i��HH��pQ6: <��6i+�FK����Ʌ�w]��]0���xa	��H�0���-����T�9����HQ������}^�����F�����2w=G�ar�g�E����m���b�/	�`��y� j�|^<�+'�|]�����}�aYw�)Jc'c|��w����68/�z��<*3$czr�]��|������5���Pc��_�3�6	9n��7ć�$��_RG#m����L�<���K�2+�CW�Ib��`1������OCZ�	Tq��z��z2��W��2��m��WZ��ܳ�F�SKo\��n.�2�+Q�h�i�O�vII���#3��V���\��Fz���O��d�i��}8w�����kx��*fY/�
n� �5���ӛ7���A`�w!ް���K�`�t�ed��Ӹ���8��ï�.q���%$�3��|�M]�����BF��]�i����`���ce�e_�4�夳�b�m@�7Y9�y�Wۿ�I,Z/��uKL��5�W$]h��|����=#����P+���`�6c�|����V�?�^��}��/��o}�0f��1rq�2�����NK�~�����.����| 6���X�84J���II�T�r�݊�:��K9mß�O��@=���h$@�m���$��$ڎ�N�<չGR�^�̴�֠p����S��I��Q_F%���v��p��4x�ԉ��ߞn�Tl����h6º����c����w��R���o��ӟ��^�MX�Q�i�AJ�*I�E%�S]I��bz���� ''��^���t��f�S�P\�m5uL=�������w&��?C�Ed�wJwQ!��� a&�����ϵ��u����U�b�4�	��D�un�^�(��/T־s�����p �N�{t�SǞ�9�I
�G@X�I�y\�"b)J0.7-�g�;I�q�m� 9-	�����/��T:�����<U3�g�Q��G�d�#֪	p�1皻�6D��SC��<�^�&;���#DΟX����%���P��	��ύK�|��+�����,��=��Oa��i�ؖ�4ڣCi�48~�Ox�o @�y�HR��n/fl�K����L&�V��W&r봴�5�CW6@4�g#��"��X��z��I���� ��˸����d[����k��"��k	�mͳg�z
g�rp�߽��8D����x3X���#V�ɍ�&��:�����c �W��u��h�zE#�28͜��x��$TՋ�509:[�d�7x�lPFL+���p�PS;�o�y*��R'����w�x��ʑ�"\� �Z�C�ύO�i��g�L�0àE: 7M��q�����7K�@��-+S0��x��ܯ��Y,�n�6�Mm��#�+'��Z4yPK?��ρ�E��H y�ɧ�~	W�	](��Ӭ�Ik��>m���##&�D��l���z���!���roz�B�{<�9/�/C�	_�ٿ	?/�����u���9{"_N�Lnjgf{q]p-V��X1L9�Nf��d�y�x��-o{�F2���PH��MN|9��/�|f�y�5z��EI8�����,��q��S���G�&��O���m��L��%�6ep`T�W�up�mic�%���h������9�����n#&����w�W�^p���Һmm6�VC��*�U}��+���i��u�]�9}�I�C^z�Fٰ`V�ĭ��۸��hCp��^J� t?�BO���z^�2����g�^5��:�t��|��Yw�+��������i{�E���#���V��y���ܪ`��+������a����0�1�����ob��$'=�^ؔw.���\zM�u��S6�������'x{�$��w*���S�u��|��:a!t!'=��(�1��\4w��򕤓=]ss���������Ef��^]�&RB�.�S�g.���|��䞡y��~=����8��� �n~���;���|+3�P��� G��9T*�	T}Zd6���h逃�h,�3����������x� ��+�,�~X=�+&U�J`Q*��n�D�j� ��f�]�|:�~��^���{da���D�p�9�*[����G�D(H)�=���X��RB�yk�qذat��*�eܽ��VN��ڂk�.Nl�<�ڜf�������Y�8�lje'W�� ��Ĝ���)߮W�Q�vY���2ljFs�4���R�n��q����ġ7��ȶ�^�O��S�y��+	�,�������f��j�M�,�GT>s�C���}��6�Hpy����ܷ��a9e����s5
^�s��/bb��>:Ռ��K��A	;M�z��b��m?8��G�!o�IЂ��Y�u�儽�
���*�����*�BaRC8߄䜦�6|?![���%y:2X��dX� .H����_(��s!�I_{H�u�A�*�O���a�[i����Ç�
�7�|L���zW	e�K)�JQ�F�:ֳ�`���    ]�J4�խ�Nd�8t����4f	���O�J/|	!]It͚����1�44��wr�n�C�=�~�0��+)ѡ�������[�����p�%JP;�u�Soa�� >K�>�q49��an�w6�ٻbbSKjX�2��x���gP�L����5��q�&�d�J�����:.`r�P�����H*�~�h���;*�v��匢t_��G�=Lg
���4p6vqҢ�������g�;ǀ7�Bi"ON�J6�Hy�,��H�t�Zzi:�b=5���O< �4��sc\o_c��h3�� X����H�_$�HhT�~�WG�9����@���.:E2*`����ﺈ�z(��u&��-���[���I?E��:��nК����Qvz:��}�`@��i�v�F�)Z>W��N�*>��M��7���w'�nA4�����'��a���h�����e7��O����m$l����t<gڋg����T��ż�t�:n�
A_�/�QM5.�5����h	��y�V�#z��g8�S����v�+��/�a*]�/��tC`t��Sg��S�
��ԗ}�Dй��I�h=�g�;�ɨ/�r�	�M����{:j�f�S�p\wT� I�<������<��B���7�(!N���.6ٺT{i��f<��ԙ�j�`����x�1x����P#��i��B���MQZ� Y��F����g�rZ�W�v����j�:}�-���v*�hwq��Ъİ�W{=QgG9�GK|��R*U�M� �bvP7Ue���8�v�?NG�T,�(%�!�6^��I-q.�|�����[na_����/'{=��{G�l s[eRT�,P��i����k�'�
4F2p܌�&/~^�l:�Ծ��1�1k���#gW9���I��� r:�D���d��Ϸ~�>�Uh��5������W9[��C��nj�sT>��'�1��V�n�7����7&�|��(��e�3��clr���2o�fF�w�a8�zx�����-��q˨��ڎ0b�����ń�wTj���LͿ&t7�ֳ��eH�����\����|�w �Z���/��Q��@x�7��inͱ����m�ܨ7#�t���U/6���/�T�s;3���]�v���\�i��09��*-ԉ�z����bv���m�n�s�Q�/�.�7�	]&�~��XÄ:k��}DW�N~Z��\��!�vJ2�#L]��9�řOUy˚f�Է�%v�,-Z�S�pF�KHw�����Dcݢ#���ex��x����.��*a��C1�7���f�!�s\<-��z���^)�Ar�J�7�U��W�����1��H� 90$�c���L_��%�T^�>�B�ݢ{��F��M V_�-1	4��>��%n{�)>w��:˙�9�K���[F.���tV��W�b�j3�{�����m�2}�A>ɑwy�.I�˩^Iuً�-8��a���C�#��3a����9vr�Q�]zU�k��%u�:=m�<���v/;�7�L��p(�/>��֭юDxxC�zAs>i橽��gY?�ó��(����nܠ�x�&@�$`�SJ ���[�?_ہ:��޹_2s�Y�� @uB�Y����G"����"���̵h�B��3�R�V��}�v�8�}�`U�30P�ӓ*�4�:�����U`9�ˌMcK0��X�V<}����SJ��	�ij���{ljO<���;�x�����������x�^*�(:�i�EgqAZ5gaI���z2�3�/M���!
�7�Iu�/��E�#�E��r��Y,�"z&���S�%v��K�*��@j�S�����P�r�`�L��0��T��ܻ�)���M�����nF���+�7G��:	I�Bns�z�?�N8.'�xE�#L����\=�V��c�� ��w!(�ߦ$���&�L�euDt$L���M�V����m�3.���"r¾���1�<l�~b���{ɔ��_#������?�K� G��S~̻!���$jV�c�iC�^?!�6!�kQѫ�MIͻh��Q��)u�r��W�߮#m���������.��F�{��v���VK���XʫHU���H�#e�j�#-]s��oOٽ�����E̢<��N����$E������x6��g(�K�E%����������GR��K�mj���UT������8j�HO����[x����7\���i�R��+�lY&���0��1J2���=��:"����0>:��,�v�{��m�v'o.\��U:������L���������+<r�t���;K�Շ��p���B�N\�Jj�)��#����6��(�M4?23�^Ͼ����F�J�y�I�#�]������G��ф��+x)4.�~�Ud
�7�A|0�̈́<$E�r�^���YKE7P�Ӓ*}��'�*%7�����qW�X-w�aq�-�"�4&���}�HK84�������I��sYU�</��R�Y=��~t�����P~o\ً�4�o� ��7s��<5%ٿTg/���՚پ��w�V�SF_{��6ѽx��OY�N�dH�;ٟk��d�3��O/��R`t�{5E��tm�v�cfO��	X*�<�Y=l$gY
3TUs��ug�-(l��铓䗺��тoy;y�-�n�~��(�����¤�:����&�F�m.�/�m�W�� D��f���[�nt�?�� �����En.���D����A�N��f�%��F��̠�(T�K$J��o.$�V\>�5g_����<f���y��K&3Kձ�	/���M��n���"GH܌������%X�@JM���L��Ffb�	^�z����
��Kaj:�%T?Dw�nϬ&'2�/��E��)j��vQ�>v9��,�ki��:�<�:���:�"���is��hXlt|�v��N^<���6�׍J���]^[�;���݆Ql�R�ti=v+��#�n&gη��->Sn��hc�@�$����F�	[�g���^QM�xfp��̜�=�sՖ���&�����
��>󏇐�mopH����苠�5��>�l����U8�gn�Vhg����@�vS���f��ɼF�%XJ%��(a㔞�Dϛ�[r7�	��e�F��-Î�'2]��~��/XKEއ5>
�Yԭ�m��|����ĳ�����๯�E���6��p,�R!o$hg��"�Ñ�ۥ�8J��rblׅ�kX���<�9����0��Gğn�u�Ћ�΁�I�Ͻ��Wd>>��9'<$��?ON��C!�&qd���� ����Ἶ6ƍ�ą2�a!��<��t�@az9m��Ii�V�~���=˻��Ep��B�'��B��ۭ���-�R�T0�E+ɿ ���H9U���̥/KęaX7�^�l����P�ؙ��S�YD��;"�v m#�z/��|w*�O���0�};��]/�6vm��v[{�G�N�_�C�4̋�:�c��`�58~��{&��c�4�5{b�F?y"�	������('��KG�JS�;{R�u�6T�멍~T�����L���tf���U���u�����#�k$<;Fm�3m\��HF�Z�}���.�L9�pB��SE����dAm=���$��$�92t#i�\������\�5;�^4�����=>� r�m�Q�)�>��|!x���S�A*�(�_H1�:��<��C)'ɔgt�/��a��V�u��=s+O���~�ī�P�:�]�	>È���$�G+���<��āj�v:��R@P��Ղ�mx��*,�CQ�a]�7���3Q���*��Rt��J@x��z��c������`d��k�]���6P�sH�p+xD���\�&�GM$�F�|�l('�t=����}b�{�K�~%�q{����
��O������!t7]���ƍ8��;?�gإ8���u��:����sG���/�'�_d)mN+�<�kʷ`��֍l�]�^*�P�L��ia�9v��9�JS�����0��7Y���p��0˷�{��>NBіE�@\|@�Ⱦ�La�/*�*���uW���U��    :m5ȉt/��lvN���q8E��ل��`.1brN!��s��^Nn�J8�:]�d���儚�>��E�Op8�?� ��zj�/x���)v�ݏ0ɛ�1�P�ٟ��(.&���#0�|0��d���c����%���)����>'ɷ�3�r�|I]s�"�4f����������R}U�˓���e
Ē�@R��A��C�|���1�+�	�ș�S*?�.�ĮNG�r�
p�r/�ČB�E�v��g����K�K%wT�4虜gx��O��t�P7lcWp!��C�oZVOۻ���3�G���,��;�+���M�C0��O{�����n�<ė��L-ܾ@*�*|����{w1r���j����M6v��e�]q>n�՗t���7J��ڥf���
,4���/�+���	"L��3�R]�&��X�\����'�}���	|e�h��:�����n�����
����B,��/\�ժ���1�m��8�6Mf��olj�2m�5eI!��djE�c�GU ���[]Y�ns=8���t��ġ�/�dS~!��t9��5Ѭ���Ե}�
�u�m�@ao=�ݧ�L�b�o������=����tq)�f?�9 k�*���\��n��j�J!��W��)���U�^̘ԏ�!{w9�Q̃](4>#ʢ��L��^%����wl�ؽ=�9yg�ܝ��|2,����`��]�R��\�^S�9nV}���C�~@��\6�uo�&��`��.c�r�`
��������d�=f�:9���%u�{6!\й��G*m�P�`b�p������h��e"�y�/U1]�>@�Ц�2���D�5,I: <����ոS������I�HW�I��WV�VД�R�L�w��+q��ԇX'.��Ą��A
���P����+��$UR�簜t�b�4�p,C�bu�ket���d��	��`6��0f�i�0"���߸O��P�W8��HL>�4y��:�	�ڄT}��9h��;��&D-L5�֭y�����-Jet�5^�!*xF{>��������8�P�ft��&!�.y/�����/P����ҵ�Jm�.�9s0*�0�֟,X�ql23�^-S0:S~�f��j���?c�NԜU��ߟ��%'ytI`vt��u�BW�Y���j��
.���ݞ8��I���?���?�L���7夹�"7Ad�n��P���1����D`$m�p���KP�sdRm_hߪ�_l�>&^l�Б��4<uF�xw4�3Z���q�'h�(�z��Хr«1��ֈ��I:�4��G�̍$�P��͆+��:x?��T����e�y�����@V�H���a!5���;��륽�Y1Z�o)�]��vQ��v�me�ؽ����yƝw8>��3������q��C�i�ɤ9ii���[H'���e�;�8�A�@0i�19/�y�I%�	�Ƌ�N95�+��-����GN�ɖծ=������$R)�ϵn�m�ں�������ma��I�.���cV�^B�r���8Yy��Ğ�=�3��R�8���`�k��;�{�?�u\y�E�{����Ņ��[��z���7D�n.�%�a�[������s�"��n�c�E5i/�v�K��H�>b��}��!�o.b�.�G$��3�X�#�X6Nd� ��g.q����O ����a�����������Mb%Bw�Z�G��3�tr�&��4Ez�CHC8� �7I2��.s0_�����r��#��~��H����-!ZƦ�6��L�E��]_�CpLb�������l���.+���n�lN}�a���Ff%=�0��@Bʕ��Iܤ�;K�q��p��@qu���7�"[�U1�׍(]e�J����λ�����M�Pa�@��a(Z8�h��l���TĜy]��sE���UMceK{��Ok䌎��s���b�z���}&��[�k�K0��([%�q�adТ��+�u���Okl"�����Rn��������Bg�P��0)8B����
Ɣw
���B�Z����,b<�%__w�%;�zGC��;�<��"�"ʂ�Bʏ
�	a #]5���K�J ����f�Y*{Z�r�R��J]&�3�=���6����v. ���i����G�L���Dƨ���`��~R��|ɠ���}�m�[˩F9����6!RP΂t�� ]N��&<w���wXˆD����m���½;�y��i�{6���Cx���B�[�����nPq��7ڐ�n��IW�Ҷi��ah{��p���|����?H65��3��'���4�F��խɋۨ�>��b_/��e��V,Z�#�^̿'�
y�V�̵ş�L�v@�6D�n�K��bP�~(����a��_I<)$��5|����%|�J�`�P6�l�ae+T�	R3�iRm�("0�O���[w�M�D(N�*U����j��D�h|R���4#W6%*�챓�".h|Dķi�c�F偊�_��x5����CN�bs>���K��`O�w�E��z����ง�Ԟ3����KG�|7������vF��C�D=��I_�.ft��%��� <�Y�#X� 3��Uhw��D�":���8�4�	Q^M6����Tps���b����~���6����:��׸K�>����ٯ����(��xUnOs��`IDt
b�lKC--��hp�z��M�e�Y(�E��u�q��� Ɛ�?���������k�lwP� Xß�}�	`k�{Ǽ����s�r*~��h5u8�	!����r�,�K��V�\�I�%�(#،��@��f��$��)5�F�;�S���3�ۡ���'vR Š���}ėb�ć��'�
?���q->=�ꪽ�dӯ�%���7�/ou
�N���4u�"{�=�����vj�(���(���)��[����Xٴhq�?����T�:q� ��|���a�5P,s�L���lf�p�G���j1YLeT����\�����Y�Ӻ�Me]�Pj�k���mӁ��Ph!���~Oc �	\�4O%�{I�Ǚ���G�F�̑�J`�˷�6_U�"��4d�%�l�ON��B�?�ͻ�3�猍�sJ�9���.5s����ZA���N���#jd��}B�jN�&�USn<��Wx�7���hc^M���pn�0��/���t��,��?���2�G�,��&�jB�-�r:�WV�����1�,b�v+g!����<��b��`�ɷ�$�����7�|Y�櫖ꚕXz�Ǯ�[X~{�̋�8�{�,M@%��'�#��zϩw@���wg����eM�C!��x3�������
�����U�[��R�0"�@���}���Y�6R��S,�5��l�sV5³�է�m$"T�q�('Syɏej#{�X!q5�7�O9��� ~�ރ]�(Pq�+�B���>�?A���*�6{�\?bj!��40[a�h��"���8�kW|�N�!8� |�?D�ϨٱZ��0��T*X\D�,��Y�.�؊d��p��8���w8�Kl��u�~�	V�j�c�J�E�vS��&GomL�t���(`���QY�_�ҕӾ���js
~�O�z������_{��D�3 ��ov4�k'GD�9�~�К�{�%�VG���L,Y].� y�coX�x���w߉�Q��I���й�ܪJ�P�6������3�v��|���+��E������W@��tq���?���d]kk�6 �1��y��.��\#�w�t��!4�S݉�*AdX�f����[M�J�i�a�e��4�����f@�"+V�\�\ٟ����s�<��t������<e��(�*+'�7�'�
��T����"YƊ�T���A��
�1���m�
�}�����!xJ/2�Ux�<	��F����˒�o�c�JS��.��L��Z��|>�,�|�p���e�v�)��-<ӈ~�x����V��� � �j��	A����ҜG�x���[{V�}b��[������+d?y��+U�K{��5t4-���bN�#o�az�F)��Opdp�    ��;^�;�E���,���Z]�.�m�*���I������쟔���^�|�~X�UH������/�i�',������Q*��n�d1q��W�a�^��+U�5v�m����?�y��.�:�
��'Z�R��5a�Z]�u
 G�G5v�E��������P�V@�(���Xi��j�VJ��
'�9�.�,�����2�a��h
VFY�RQ����/�����njb�-�|#Uv��.� F���`�'��#j�\c�//[�P�#{�wjw8@9(��ñԙ��a�38��v;�D�	n�G�D�q�o�_�
 2�<ɿ�fV�u�ee��sP���$qFFb%��Y��ň�I-���ėA�$E��f�r$"[Lmt�wK.���.��y&��5�oBL���H�l��Y�a�
=�hY=�g*d��Y�G.��ԛ���Q���ByC|e�7%$|�V%V�%	��u3���{Ƽ���%�F��b���)2�Z�$C��'��N;6��&7qy����IA��K�$D(����Z�
�6��	�HD���8�����)�о�]�	������H�Ey��y���QN��z�.B�^�zi�3y�"f/�ʱ�� ��,F 
�VOX{�#~�p��K�R@�j�P}u����{-t�Ҕ�Hx#l����FN+�	�\)뚬�� fEQ�~��yȸ�e!)*�&�;�i��F'����G��XÏ)�-�i�����ў��IR����������|�����8�O��D��D����V�<I�������vO{t����"`��*�������>�W�K���-��7|��/�#�gZ^1��b�����k��i�?&q3��cP8'���P5�;J�c�N����Y�IV��2�/
��3������~>�v�Ǝ�=-���&���2*�z���E/t:��G�vJ]�y���&;x�,}������\M�	AnΠF�"����7�0�
� :�;H~��H-��t�9~�b�cj�!�t q.f	G-��-_�;�o�p�D�-8�,_��ߊ��s���"e+�;{��� ���S��[������{Ȧ|�S@h�E����`��ƻ��M\g��*G�lh���p'p�DG��P���i�?��="Ǆ���R�Σ�C�<��C"�Jd���5�+8���ru�.a�$��T���L�������V��❫D�r�U�n�y��ik�}?z���̤�P��䢴Xt��\�h&uԓl'x$��5=�S��y��N�y\	ޯ��f�;A���Z����<��a$Cp�t�枎����y�C q�p���=�i�@�&)�C�����z�Ք�ə�RIX�7|gX��Ն�G����e�&Ƹf�i(�cȦp-�u�JG8��I�T=�?&��^���������ߓ�!���q�:��E�􏂴�f�r�fq�6$k�wrg.%������Dݦfw�3H���멶g���K�0W6;�C'��is������J$��wuMN�P�D�r�5��2�	E��䯱>{ͱ>�4���=?E��kγ~��g����9u��<ہ��s�f!�x��%��f�(�D�ѻa�u�0��o.���D����5�Gg:}"A<$������"�Օ� ��_y'�t���n}$�s��Y�����.`���@W���T&��[�Y������1�z�;�J���Aa�.FX�1:��|ص์y�(夈�[�����|x8M���E�m/8| ��C����R1X��1���?���f�6�C��}�A�7[|,��i.M��������ɇ�����_?5�D��&S�g�J���RBw�Xpy�XM�6���6�]ю �wn#� ��&�#m���&8^��
\���_ �ɩգiH��e�F��f�IFn�-��0��p��O�O��/B$�b�%^���o�� �����L%��z:]�i��
y�"񄒤p����R���s9��4��y�0&�i����<�[Q�~|ȀlH�����U���"��!����w���&�w��̍�4��ׇ��ǵ��N��H?.C��.�" ��ɪ8�4����IG�����#��>+'�|�x�1��bӇ�,3蝂��=�	�Nx��&G�P�6|�0�6���&�+�Q\����q�A\����4x_{�$��1��@t%3O�]
�_|�=Ss�E�Z�X����V~$Q޽����P�y��E��)*���g�J� ^5oQbl�' E8@C"f�g�7%JSpN�d��Y�7����?��)|�n�`i�bnO�"h�y���1�sS���>�ˎI������/i�Մ�뻒�ki��q!��փ���LYq��,��Ħï�h�58��,���]��n����F �68I�=R����������Ǩ�&%1DP�?8�����������f9���:߉V�j�>��Ό��]��NB��1�:(>K��>���ڃ�ϴv�$4����ʱ�l�n��"[*�1L��Ȳ��8�����Y!����[dM���ڟf5��n��P��n���Ƕ;��Ou
�cįA7[u�����M�[��*�_�����S��|8x� ��""�n�0��:ٟ�0F
;Z:j�� ��s7�q�Zk��Jd������x��ziH��6���N�
�$��4�g	s��'�����h��N�q�m����i�z�}���%�}���S�pZNC�������)8���x��?�>y�dF{i�ᇠ,z��eRE�h<W�rx��+��V��h�@�VcS9�Nmfe��>�7�t݅��>�l�b-��|-���!���{~l��8}� �,�eL���޹��~�	5��v�,�'�M��̲���r�/��u�q[�{���_W��C���i�m[��&<�]��B_�dC�T��~5o҉@l�Es'�h-'@��Ի�������ְ�\6�1���ӪQBv�g�łH(W��]�0���/��AvV��/jޯ��m�Ҷ��N�IyM7�6���(Ξ�ݔj�_�\�h�4�u���iWh�W�D�@��=�QK|E�9��ŝ����ށQ�t�g���zp��ۼ��H��w_�m�4�j���.��]Е6�F2��=�7$��Pb�S������j1w���tg���ɗ53�TY9|5��/�Ћ�r��W��@Ns7^8�zʼ�b:##��t���b���5�(��s-JGrQP��:][����ʙ/����u_�"|r�V��t8m��;_?%X������Ҭ_���S�;;���V�a�q�GG���
�(�����#w1^�p��t}|�C&��h���o�R�ԕ�i�V|Dz�6�EnaW/�n��r�&8|�#¨�4�I���	�)/���JX�����L�[��Ǫ?J��>� ]�q����o��xz�,R�����n��~�*U�����6�PN�X�L��Ӊ�iK�%b��`����)�~��й�ƞ�4N¸<�8�ȥ�JY#�֔+:�I�l�Ֆk��~p����K�`�Jp��1�Qז�$qX�dnT%5�@����o��?��>$K�|n&��.�U��l!����=ּ��	S*�9�>�����8���}�~���	_����g���%��0J��@����$��PdIU�OáN� ��\f�J+���P������F-���{(Z�f�8��q�f�iK��q�$����e�P�Ût!XϳH&�e����.�z��p���T$NH�p���JIj$���5P#P��l����9���n��*{1Wd���ɎNkЬ?�����.�B��[��	��:��޽%�0�|���w,�Gj�tk@m��l=Y9����M�{�q�K0T��l�}��h1�6;,�1|%�4��q��܋�qzє��s�P��Vr�m�����T�|�_qù�~���ISXnXeV��I>����^z��t��s�^��(' |5'�=���f����8m!�,�������#ژ�
9M9����~�qH�z��p��m'c{��%���1.nUDEd�Į`�M    ��pD)&��~�'HL?|�~hY�Ķ�YN6��R���zT��iR�AH��'X�����[^�W�[nre����Z�sO(�x�@'C��81N�p���n���J#���U�@L]CBOR���7�2[B8h�l��ͣ$����)ZF������M���{��O�A�~�p]�Gc��1�FFگ/��m}ɏV��ն�j��j����F�^�Q'{eO4*��P8B���zGR���௮G������KT��+iZ�`H�-��W�5fn^g@��y!�LD@����s��9�D��1�؇Je�U�*u`)�W8�_!��o�Ҟ�:wJL9��EK�S�d�ONH�y�+���~3�2�V`2S�ͨc�o1�|��`v���c�TF!qN��10ۚ�(��z��Þ��=I#��?������6����'"U8����yGPN���R�p���JM�^�lܷ�3��d�^�#���M9%TUB:�[ԯ)iv��ڃۏ�QP�d��	 0�#�O��h��D���a'Y��? 堪q�1���kph�b�X�D�:"n�o���:�cwx;m�$}��v�ǟ�4�_!e�,���3>���Ӕ�cp�'���6�L����G_�D������iv:v���a���t�����5.���,�#�,0��oQG���[R8I�!	�In��:�.��24Q�^	�
�L�m�gx�ufS��Q	�F��ؓ뻕M?U�e�U�}g{u3����p��Ċ�5����3��k��t#i�It"t��l�U*��qò��rg��)R��O$�@bR�b��$����Dc�'��Z�j��=1��F ߋ��HMUvI�tB�^]&3ҾأSAe������y8��\y�\�W�0��6Zs������W�>F����D�&L�#^��w�!�_�,�W�1~�w��cc���<ڤ��ol��}O���7,ܽ�?)͡NLqv{fuE���D�$�����e��J���RVwO�S�.2�D�e��{���N��Pa��RF����;�ę,f�&��U�l�t�~��<�l����QyH�~Dl���B�i�Jx����T5y������d��:h}g��n��䜶T��|�wi�����k
�G��_����,(p�?�i^v*Ֆ��kH�0��,T 䂕��g+�/Ml�jUW��Q6��2>��С�9�][���[-�j{8� �D�&#�A���q��q���/̄�uw�&��F�w"��x�_�Գ�
��)�n^͐�ej��=� ��|��ykE�m~��w�$:�*���� X���z�_Н6;_�в������S��\�I]�z����N&�+!���a'�]�2�ej���[�d��݅������h:�l�r˹�� �@���>n�v5�yĈԈ�$0n�ğ�cX��g)v��d����a�(0[mx�����{9Q骞 �v�?�V�$�m����n��A�ߜiપW���:���Á�E糔BL�p���&'l2]�$E���̥:��j��o\y��[����W�.\o/��D^D%<H'��鼝x�;�c/m��˩M^�'[ׁ��8��rճ`N����M��0���r��|��K�2�����vSƖ��N�V���m�Oj�a7���dڣJ���,.����Bǧ��K��׃�o��b�����T��#�~�M2�n$�z��=/J���m��?�9.�{��O!B.��k�y�t�P��Pv�y�g��:���_k��6E�L�����c����Z���&�jN6�r����qB�c�K���u����PzB]�p��_�Цm�|l�F^:F
�z��(+��#8����uZ��c�G�=E�����wl|ڞ��&��n�V<�6���@�Vcl�W7��aߠk�8���T6�8��=�!Kn�,��h�;i^@�S="Z��^��NH#�"�$����#S�T�S6�*�Y�QS%sF#�<Ok��\��3+9�̈́���$���/�VH���/��(x	�^白b�][�wc|*ԘKvo��g�������-�6�o���W���2�$�`��g�C��{�8�X�mI�-��	�?N�.J3>���~��؈O;���?���&��w3��Ho�{З�Ŧmͳ�NS�o�t�ͭV������I������n��A�k)�SQ������'{�9q�m��M��/b�z=�Z��{��~��u�տ`{�ch�;��u�rqբ�I͟�i*se�Ɋ��gZ�b���BtFǄK�>R+%r��F���ep�|"�� ���%$��� nz��<������}by�� ��x�!�*��F{��Xڀt�9�
�@i^�A�ވ
�ѠzL?j#����w�Mv��P�azmRC��>�Q�ꠤjl�o>�dY��YZ�r�9���C�2�NKD��#��g�`q�R!��y�IL���9C T�g��b�*��{}���Ai;�W&@���q�z����{2��4���-;^}E��XuGH��B=uSz��jVb��m��ц$k��2�0%�o�wI*5�T��-/�jR�8��M2��먲�S���u�:]m�/��p�G�R<Ph^p�0a��ٿǹ�$Ӡ��I|J�����ΊÈ��V9=��sM=~����II�r�� U.T�8f�\��M��Ȭ�*'L}=��n3��	�zj�`	D�����ۚVUm��׺��9М=:��`�=�_�zk�-L4�
���3���r=�9�UN���f�]C��?�c�6B�P3����� ��F��6��l��P���FUV9��s�]g��,H�]�3#ij+4��X+�/��I=�J��j^���[�.��+��=���g)Hk�ZD��i'W`������KQ%\L9���u[PcM�d��6�Y+�mF�bJ��!4��/Bx�����G�u�����Y�£����T,u�W�n�okn�=-��dk��{md�ɞRxj�`(~:���nw��1��[�s�Ts�n�(Ӡ �#z���'^�p�d��p�-ط�[��)(��ӥU�%��Ǵ�������'�>&Z�f��Tp?ʺ���8�u��{�
`v�Mr����~Q�:�\}���Y �(Ǔ�d�ń>w���w����r=���ב��4�pVF�ٱ$�7�3�y�*5l���5�X���o�U���+��=��� %�+6�]b����\>o�>��\Ih�r&���r� f��zV��5ᄆK�5�ڸ+�n��-8#qHJ�&���=�D^_]����3<����\���{W��T"m�g|šn'�1��9�Ǯ����52�IC57CؕH���#�bʸ!����mF��\�ƾ���gh�~�����H�Ad��:�kj�V~!a2Z�XJ��˥�"4-��x�DN��D�`z;�y��E�ϊf�?���S��Bu���4�	O�nfj�m�v�8�Gp4Gڲ�dY�RKBS��J�9gu��T�����.��Y18�i����Е��*QR�bV��h����UN����H��6C�:pMSg�_�}����1�e���wy�3_�%�`�!�ܿ2�������^C��pn�2Úr������nw�{mѰ;�Y��(*�e���g
�C�z=]���cnR���s��k�;�i���\DJ�p�ǳiunCl/b}�U �m�֋���߂��ŅO}��pW��T,�k���u5ܢ8��қ��.�¢#9{��H*Zf�4�^��_M
���mǳ�H�;q��(�};�Fʴ%�/j����<^K��^M�Ȅ�M����C��u��E��|����z�\֛WK��77����a����V֩#��SWzr��wlp���G��qy���_���$��І�:�E*3Q�i��+����,Y�R�蝷Ӂ�Q6�b�*�tz�q�iF0}{����"��)��τg�>	8a��-��1@�3�O��t+Y%w���kf��?�'��.�_�~���KIv���'
##ML��P�i{9I�k�NM(==\;�~�b����ɣ�F�����sA+��mѻ�m��l^U���>��������@ޢA�۽q���Tl�O����ؑ��U&������g�    X� 3?�9���v���HE��D}Y�I���hOP��z�z|�n�]�� `YG��K��ږ���,�A��8�_	�RN��*"��՜GԩB.�i�O+�*C1ƍ�������$=n�_2M/'yM� �ً��_}{�A/(z����g$zr���<1��L�`9�«2��ĵg��x�of;�z�R*�j�3'��eL�-�ӹ�zH������*�T���ϯe�:TL�#����IP�] �-����#��%"�i���eP�Eշ�p:ן(�_}�gBz��L��ٌbI���t^�a�p����df�g��cX�.c�tŖ�o���^����R� �b`�f���g���7�n�;�uG`�6;}��1�D�	��FL��bC����'>�~&:	�`��&��!�b�jꖜy@v��j�:~�u���G�)
 ���ޗkٴ*d��"�[D>��z���45��bJKl��5af׌gHe,\��[[�5w�G��)�R��o,⡛��B�)�C%K\d��V��_�ѫw4�F	5殽i�m���0J���J'ip\4�S���+�U�zWC������
8�hp�g�3�y���ɦb�2|aS��@�u4�����8p�S�-�����NkjjB��̄�L�=����KO���b����q�R�c7Yn�x����5X��S���� (�U*.�tj�1p������F�� !������%GGeL]q<Qˋm@�Y=-�t8Z<.�M��eע��/�tdP��@�T�,%��^��ȦA�]d�FS������IT�����*��57�9s�Nx�	����t�'"���n����lDgd�};�U+/�}D7�Ƨg����%y���X��`�+Km�Ps��}�-���NJ�7�T.t����;����O��"�#	a����[�u����֖��ug�4KWC�g�nm$�U<�������I�?2厂ga}��t����.U�)��<���Oa���(���>��Ǹ]��lMs�%A0�mS���g"u��_�&n9���T����u;��j/�e��*�\$�mUgEM���Q9��i��OA�E�����f�k�|�Ji$H�%�*�^�4./�Zn9�S*��eW�lj�b��V�P�E�`.����f_4���9z���s��7DpZcb.�ȑr��<�I	��q�h�`�f� ���M�$���:��X錎lj�I���s����H+����t�хS>�a�hM��aU�py�]"4z�+ۦi`(��gC��P�P��<�����G#����HW���
��}
g����W��S���ij��x��H!��2�;*��o�v��J���48~���@�39�M��q�~�e2���0M5�N�J+od!�o�C&Q�WM5��u�L��9��ndf��*���������H�^w/j-<�E���ʋ�[�Y��~��C�v�f���=ُ���B�)d-���rr�n�V%EX�é��8��s�%��/�A�~����fGP#�)�9�n�ô
H��r{�>���E~?:��ުO`�}���VU׺昲r�T09u�Z����{����g���[��O�(y����C��N���L	˞�Dő�,Di���E����Z�<fO��l!�I�##�t�\��'وۉ��42��!N"��n.<�R��u!᭦v?�9P��n�0�؀��.��;=w�)�wUU��N�.az}�[O�z`�J�����Q�~Ś]Z���w�N>>����:����y��Y��W�{���aDBS@�HU$�4�=��>����A�50arOS�u�r���ӥ�L��M<��B#@�(�-�_d�n�����濇,Lɬ� ����opD@Ő\lh�y�*�$��K<M	��PB5���!x�1�'�ĚB�V�w�t�C�Z�\g`����O���Kx�g��s	~i1gCw]��ւ:��.2
:�JJ�DA}���F�L��=N O�����/����3~�J�Ʈ�����E��J�vѤf����0�;��TH�y�{���i��δ��|�b{�VG{t&kB�,�y�dsڠ <8mN)����MS�d���DaY]͹C��b��}�|�N���4j=S1��w������79e��1��|y)�Q@Lx\f(PM9��d���i��3��h��Ε�J��Í�q����^�Ȏ��6�Wp��XZo.�	崳����]��j��q��7�/rM==�	H�1���F�#��.�-JXFUA�^�~A���I���rX�ҵ�n����֫��_�0��b�R%��~FR�`�lҴ��j���XqQ�|��bhH��WJQ6b��>��ې�/L�Q���p�؀Dh��+��~��co�y4����*�Z�6���ߨ�U0P"�d�sV��T�u�=���R*��}=�[�������KO$t
ت![/\G��}�CU�yKPF��&aP���Q��=��7�uR�4~��9��bC�[�N^~��� �g�N_-})�#"e�!�E��|���EL{J��`�ҏ�S��C������΢�t����2S��j�'���`�0Y����^I��ц�&�����w�ܼ
Do�01�����h�aF���X��p��%ùYQ��*������=d@�i=u�j�,�$~m�W�?��>５׻��v��x��+�[�Ժ������Pkt���U0�Y��K}�r��E��R�I<�->�R���L�L�H���C)UG_[O���<�{\<-6&݇E�/�Φ@{�#¤:�Պ��h��������_����R	udR[�82:p l"����:	��gGz"/� c���9���V9������D�q�(�b�l���Mg�q�ぉ*@7��i���Pb�!����y�y�\P'��t���Y5t����<$�^�I�BN�.d/�6�|�c�َ�7(zG�^n�ﾞz�m�s��M8�R:D+�Dp��k������$�R!*ZO���o��΅��t�F��~��vK��p|��]��g%C�z��@��k�w?���.��w�{��56Dw�������&^g�K���3�l���qj�q�r�� m��泞�	�d�����EG{����-*sĘu���s�B�(f�YB�^b���'�1��<#�����c(�	~-����o�v�5�l�v�bS*���ZAa�����3����qb �����NS�Vo��F�gY��V9m����k��ny����k��۫�b�h� y?�;( h�(t���m��'����H^y0�M��3�\i�\O3w�<�71����"��	�Q'�-�+l��٣�+����ѵ��d��Z�F�Y �<���v�)�]���}};vC�O��s��GȦJ0���`rk���[��?��~��+�!��j�1cܽ���q.zQ'(n������zE��Zot,�?��� $�����6/ج�l�$u�L>�I�K(�g��g)Lz�Co�l9H�p7�-�:�":�ߜɁ ||���2C�~AY{��N�0*��\��ʴ�p�}�؅�k��	�_�Y�-;(��t�=��D!W7yA��c�;��rr�ײkA1�Z�ׁ�5x>��ށAsH�xw�^�$g�I��m�4FF�9��:ϼU9+�C�و@��2���7�����g�V�E���c�Cy�}<����aܚ�*w	}��r�rz�ʐ�ڬ����.�����?�e��Z���u:��͈��Jv���q�)�ẐJv#�f`���o�-c"+j1rK�/�O��N��F�U�|2���]���S�O�k���鑆B�r��%/�pG�-��9��-�+���&�щ���6��	�_�dT����o���r`�(Jg�K��� ���ى�\�d�+w
��f�$�.�tu�[����nO�\^"��K@��^o�u9X.J��Oɵ�)�rV��8���a^��+6cs�%������i�ө�/�}g���)�L��瘈
�	�@��£�od�.u
f��rMO���SZdDp�h�g)C�    �N�¹���S�r�z�l��#�ƙ�p8�Zʵ��8&�:
Ȝ�n���fc8��C�5�o�=���?��wl�	���gZ�T�]���K��Z���hf�%������9���x��.��Ϩ"����e�Y�Q����m��a�`�LY���DB/k-	oH�C����_Q��� �a�=�v�Pc_���l��EoF���]�٦Y	�S�aK�����f�k ��H�T�S,���RLωr�L"{��y�;��dO�e~�=�nO���_�\���)��K��2�w_GH(aD��ܪ׾"[`m��zMm�L�����o�
��(X�9}�>9�GO��,�tf�@���7�;�@ϵ$����͍ٕ{2�l~��7f�$��@�{]Z�k�S��oªX|�R��gh�V~��杞E,��}���Pxajy:��D��1ꀞɼ���]x�vdꋉ��p0v���cDfc@IH�88?��n/�@��eP>$$�/�6hY�QN��p#��3�k�=�]�������o��Ȃ��O�`��+CL��oB�F,��EL��7��J��5~-������ʱ3e�U���[����0�J�C,��;Hje�b�\��@A�+, 8l�?���^$JmUG��f8]l(.�E�d����V�b����=$G��O˖�g�ʔ�H���O�h��Yd�%�24>�^��H�������9���������=%}������c�}krM���MU}��U�����=(�	Gd��Q���T1���z)<��A�L�l�3��_����Z����e|m<t�O��=H$�,��Wj�.�#ɍ$1�t�h��&o�*��e��j�B�vb��S?GmS���җE�`8ޟ�>�㈬T
ԺHŬ� ���[L��ϻ��Q����I}ڝ� p�%F����/�\�����r-��	��o��?� ue?�.7x���39W�$'�TD��W ��=��!p3)NV�۪DQ�.�մ4��nO3�HN�O|���E��|�&Z�a��o� ���"#WZx�g��߁S�G��V�v����N3{���9����H��2oP
y�W����5R�q���3O�Tu��G?Hݎ�M� Y�����~��R�3�}�������(������k�������${��wp�3�aI@$2w�jpY����[_s"l��qs�4�;@�O�2��ɦRO+a��n��Fiѓ�Qq���2��0��Ru.�LW��H�����8#��$i���w�XH�gI�P�QÇ7���D?xoJe=����r�X`Np��0�	�&����5�lt�Zr5��@�|��M!���265�yh�����3�^-��mɖ��3#��0�y�֮D�_OvK7��&&�Xq��%98�N��M�g���nJ\WR�">�֞�4�JUn튒f�]�� 8��a��7�������?�4�O�_ߒ��V>w:���	�lk���v��m&�:��p�czd�c��pcke��=a��]Dȁ��;g9\�YNy�7^։nW���ى�����4�*rN�xk��Z��p�R�3B�JJ��.�ϧϜ�h5��V�T	w5@:Ko���D�숲U�$�O���f��L�����>O�z�����řF����.��	L=O#�
X%��x��zN�gؒ���?��|��0�0-��q7���B������̉c��"n�廨U7ٿl�%�����!^�	���3*��;���5�g���6[{+{��H>��WȣQcv��䷄̽��$�#+B��
���� u_O8��瓘�Y!^�cD�Q� ���*L��àk�:�僷?�����_ug��=�r����C��Tw��K �҂0����^m��?}I�'���M�q皾\}[r��~���ls�x�9�����0�	����e/v�:I@(�ҙ�lT��#��g(���<��Gg�O��k��:ӐV�X-X�S(��A�Jr��}�dp97�d����>��}�]��`<�Ω��j&��,��>1���9mx���>3��&'_5(��iU��[�Sº��IrƩg�g�����b�>8o=���+c��ע�C~*?��
�>I$$|N�ӫ�k����Sq5rfϖt8���o���m-���$��FO"t�Ż(@��y�����_�j��M1;4ΐ"6���qL�!���$�17�EY*�,U;��&�o�5C�[�5��������B��^N�h��T\pQ�Bz���#�����Ø��n��ضB���Ĳ�T܃�/�߂B����k���yRhLzi�U�Q}�'�8Y��.�G�+YR]��t+���EY�%��#g�`�b�xyy���|�j(S؍0��۳�i��_N�rM9}���R����^S� '��t�{���Tz������i �w�i�u�H�^�������4z�n}����Iɩ[Ee�_&�TW�ɨ�M ����k&��Va�3��[Ŧ��\gNlc�2g��ym�Wg�UmYQ�ROj�>P����V��R������$��9� �&�eZ�q�0;�X�n2*�%���p���g%�����ɝ|@�l����{�6(�g[!�G�[?��W�+׭���jd�H��$�=g�I��F���ګ&bOj�j����t��O�L m��(�Y�>ß?��7���he�/�3�J�d������Cp���H!�E ���(i�u�2y�^Dԙ��FT��2	v����L�H!�(6�LN���5����Ǎ1���+u3~W��:~X̊���S���&3�@5�\>�'�8t9��~q?�*�څ�.x%��K��^%TȌ����,z�����t��j��U�aQ3�Fs8����I�³�bqUZƽR-�$�v���VS{Z������$�Nl���G���?H�T���"�yD$s�P	�i��J��W�U�t��=�U���+��D��J+�bP��6��=��_�ӕ��] ��0.�+���(��v�>�����h�z�ݢ"�+�}�D}�d���J6��%��$�J����ҴL����G���"0��/ ���Pb�=��w�����_�Ӣ.��LYq������#��WJ1�,y�ME����1,ԟTɲ�Ti��+D�H��t1צA��9�nz���f�	���}oEJT�-� �N�IF�Φ��j7+�{�7Z�`1F,�$��=a��P&��Y����꘴��&���P�禼��؇��3��F��Ru���n���Gg���<����f5ލPW�^������m�Li�7���%�]�y�����O����Ab��7ۙ=m������"nM%���0c��3\���ްQ@�a�!�򒓸`LSc���=���q�8T���M��Ȼ�Dpj#q%�f����G
�X@��(���=�w������o����w
������]�0�W������ibt�<~�A�ea�GN���s#`)k��)�M�K��ʤ��fE(PM��VSÍ�7/��x���m����!Wȡo���K����#���X	�m�Y����CL�3</�w@��yC�Cq�De�Zf�����-�#E�_	nr�\ˢ��L������,�E�N�������������K)j�о�@�?�����y}�-�sBL\ǛqIܔ�2��n1�y��b�	�+ő�S2m�p�]t����;�iA�����f�9��IAO^6+ϡ��^�h�To���әc�3O�T.zS�b�S9��o�rv�HF]�@?�l�-m�/�j�q��"1����Lb����\���It�tFc���h����k�u[Ly�8�ĩ�Wm�ʪGY(�;�%�*�s��3��mO�	�V(���}=6_�17Y{�=[����;K�b	?�k�GG���WS1$P:*k�V�G]Ȏ����M_�'+�3O���$��`��V9��|q�qz��b�%�ЋFoK�Y�܌Kˤ�(���K�9���e�8�K$�k����!s:�N��S 1!����=mN�C.N�]:m����nv��qi7��T�����QBD��`�{�1�VeO��h)��,    ���p6���a��C[��XG���v���y���q�32�`��ʆ`��q���$�Ylh��w)��mT�\ڃᬆ��V���㚡��H�切(	��� �%C˴mx�#2�����OŖ]����F��u~p��2��K7S��Ԧ;���/u\�n[B@����K��977ק�O��_-���֮�dH����6�������?�����Tiy��MHr�+B�F_c��K��g9�/;�/'Z~=�-(�F�����6�� dDd���#Bttd;T@Zߒ�H�CH /F�4γ�Yj������6V�8(�fNv[��b���D�U�q�ߧ˧`���k����j+{}�L��i�Rj҅�חp��A\Z_J.-1��gD��-_��-��힦*�85�Z��>�ψ���w]�$]��d#����ݛ���$i�k�E���%cz�)�X i����Bː8�B}�w""$@&�	���.ے���ޡ���:���������1��6�Ő=�EV��n�o��B�[y�X�[�'y�5�ܺ~�W����j�p'3�9i�pp|���	�x�8-{�Z���غK��lJ�;�����\�/�9晕�f��to� ����OR3�Wʺ�n5���d�z&��ݲx��K�HM�
Rw�F�m�l^�g���I8��}�����bۋ\�BW��&Q>9T��/��,��N?�LQ&jJP��x��|:��,B����L:�di���gk퇐	U(v���'b����(XZ��%�/��Uf����'���d3�<=g;?��ޘ88b]�Zb~�~�}<�7{��t��so,'ۣ6��Z�O�f�t��Adt
wi3X0����$_|	I�=�\�rp$�Gj�P�=l�����V�Y%�T�P�%�x�Aٷ�유�޹�����3Qg�����ԦJ�F*(�L����^�-,Is3M�!|M���՟�z�A^}�[�S�F�,o�{��֥rDlה.tO3����k1'��6z�Q⛬�}�����%|�Զ�9U���}vu�E磻��8��ٞ��o��}��Ť�`��c-�*���s�?�.� 4/ń�%ۼ��/}c'<�����D%�pE�A[��;��BQI�=O�F�|KAE�^Y,x;�QxS�B|�A��=h��n�<z?_����<���3/d4�t�x־G`lℒn������F��p��;Z���F��ɋ@2�a���x�E_�jз��qj�]��J-g(<4����?�CH�pӰ�7tz�$]��ܮ�<�s%(%6���I#'4N�\~�|�H�4+�KZ���Dc���Y����`�0=�����[!�		3!�~���!�T��Zyͼ8}(ۇ1���[�B�����sJ3�vC�h�Y�f���^�@��mS���������g�+0���ڊ�eP����턦�<��f�iN����Z�[b>���=��0/;n*�%��mZ�J�K��Y'^΁�^�H���#��u�h��v�ǴPY+���l.�Ͼ[�%V�IA�����.S��e�A3�v�;���t�DW�������SdC���e�� ��(t��/V%�jҧ]-]���5������=��/D����nJ1L,��b,���T W�:���tV���B?�5�����w�t�!k�/!˰!"�}���u!O����2��Q��xIu~�2g=>Ŝ9�vf1ʃ��'�E���͗EM�"��V�����L+_d%(_.M��jO�1���B��1L����d~¥ԯ���I���Ev��	s �{���
�1<�$�#�NB��_L9�(x`��m�
����J/� ����7u�!x����|���jKE�xUr@�Il�p:��l�$o�:�KW��T�1��3��Ӽ1/k�����B�����8]�un�x#�%�d�Dn�'{�{�<�_������(<��O�Ԉ� a� �P*��P�f�����<��?ξ�n^��������Nr�t;ւ�~��!B���h�~g��h�����!ԩl6��}>v�ڑ#2��G����hYWwѓ���R$Ɨ2�b���'��Ȕ�X=dW��x����F�t׶	N�OU�mg8A�O)Q≭��ڝ��>)�[�f�#�5��)����������UM�݄���f���M}�!��� y��`�g-�/N�ifX2�軝Lg0u�]��t)T�����P`�$����P�����/t:��M �k�廮a�;e���	[���9]�J��tl)E�׫�P�W֤��u��݆o�p�8�����^��#��|�@�����C�Ll��,�:�8O2h��8}�������Ӽ/�A��V  d�ZP��xbP���d�����������ݯ_kS�X���8���,�Kp8ֺKb�\�kj�l�[�3����1v~jVEX�U�^����v񩳪��&lVڇ�N�M{���HA/i�9$3�D�N���I�j�$��r�O��x
��OF�z��;3:�64�S&��x�Vt�m�F7�G9�@����!=HS�zp����>��{�f֘�������#N��ĭ�.��9.矓7��!�.U�{���47s��8ieyAsj�Х_rw�Û��%Zb�?B֢�`\v]�wݔb���iN�Hi]��R���?�3��.`���F#ɫ�-��Y	�z���e�ΞI�)�����Xh�B�-�>&]�^��՝Z��WG�u�m���-�:�A/f�E/�̋������, �	���%!@�a�]=ӵ��+k�y*���r�T>{�׳n�c��:$-ʒ=�.U�C�$�n �4��h���]����ۺ\�_�]�<ed��<�*�@s�O�-Ns��5�c�ڈ�h�6�����1��R��}���^zL9>�ӏ,�m�4�㦞���Q��F8�]؏B��w��Tn�-խ^���G�-�J��;��a[���P=�S���L�/M�Á��֟I���+d�|�	�`�;� igy��w��_�}���4����ˇ�0jZ�=m�>#�>j��Ub$E����H�J	����'�r�P�-��S��Ը�1|mZ��]N�����IPJd�w��Iij7�4=�3$�ߧ�@A-�o3~�
��ጇZ�=���+[��<m)e�����N��E���"%�D)���� g�<݀@C��ʠ��#C��Df�x˲ng��9D���)ܿ�`�����E��Ͼ_#Ϛ� �m�JO�:�e(������7�G7�pP����E�z� �If��_���ϗ��_O�1��̨����em7��i��^��-�Y�����#ȝ�xd�?�MM���,�/�&6Q�P�`i��d+T:�l/j!	�-ў�8��>M׫݈U�?/���O��o�Z5m�j�|��Z����TCI{7p��1��莖�Y��]�J�y���^Dd:ڴ�~�y��d���C��|��Q�Iv 	�B�cJ`�?f��ĝ������wن�9���uR��$$������
�,�� �xpK���H���s��i:��{��^�ƁDH2��~?�����/G�nq�߻�o�lY��jͱ=�<����,<�z���-<���?w��m	�P�R�s�]/�f��K��nع�@e���h���4v}oڴuC�P(/	���U6�HHoI�^�	�9	������G�}�9������Tp����&P��A�w��#7��s�Pu"����_ZL�"�K;K�g��m~��ug�2;�J�;�^��V/��Ɲ�t,U��У4�PINP�N�ح��b/m#q�SL$ğhw�}�㐠��L`1	��iE��P���xͶr��{�`��^�?���������m�9bw�gR|��o��(v�|�>o�l��Q��J��H-�0f�E��o����o�\���j~��t��ly�[q��E�_;��Ea?d|�&�h-q'onC�/UsIL��J��R܌�c��q�-���N3^�    |���[Q�%�2��EJ�/�m�<��)�+��^^�-3\�B��,��
�p��ד�	��g��z���Y.�=��f��(�c���0�<�lG9P_��GOg
�m��2S��	P���*����A��;��WPz����z��4�*^%h����Ze�c�G�l�~,	
}G��~|ɫ�&���/	Z�Ugܛ�����r�\qT7�����U!.�񤃏�i!�5x;��,;����j���z��9�d��´��T|]I�� �5_2�m��H���f�G���#.U���%j���۽?W��KL�
�
����>t4�pK �
:?�����l�!#?���on���q��U<E)��E�%���)}�J ����E�+�O��N�h���64�8)�$xDcPZ[�B�
U����*��
$x�Y.���M�/���;�ヽ��{�:�����$�op]a~���a$mD)r����k��zɍ�)�v��Ѡ���<j�M�sI!�ۡ�X��xu������=Q�B��(�Q�'#^k���ck<�L�]8��.V�*��S1�!�p���G�a�n�`W�k��=a��9+o���S��y	��E�LmG�tg���F�����XG��b���L�q,��������q�3`�3�������#���X�u�
u*�Gj�ܰ�>� j���*�`��)�TK�	E��)
�c�Ԝ؊r�mJ���{��_;|2�W8�=�=�����>��:b�z��G�f�>�����25��+K��-�Nsp�(�:���%ۆ*��S��N�F�<�(눧߷v����v�� �eó�z�㡯i��DЋh�j�I%Ge�T�^�y��O,Y�R�"�yGi��d�*�Q�6���I}���;�!E�r��kC8�P��M�ڙF���(�N����Z������m-��^����A���Pb�P��6[#
k�g)��$�g�����^5ˍ���.�_)��15��J���gQ���a����.��샄 ��@�а���)�3[����:���"0^2D8s����e�,K��s˧����P1^�����s� J7e$�X��Wժ�?���}4���P`6m��ؚl�
󲇪6�{���t�%;��(kJ�7���z����4�oZ��!܍#x���5��\��k�>�7v��s&:,�Sھ�q�c�UM����_�<?`�Ű�Vp�e^��W%'>�(΀q]���q�}<�0��MK�����C��9z�#��.��W/������������8(����ų~ћ��������Ӹ_M�f�i$O�F��wc�E/V�J�g3�}R[����q��m�ע0�C��f���N�DCM�
�9B$�җ/�S�ٻ$�����9]~���m�ј��7���8q~g�!l 	!�[桜�d��;��:���b�� �.����۽X���H'�ُpP��g�����}~�����c-[��J�$�[��A�>G�s�l@]#�Ʈ.6�����ד}�2!uh�����E�)G�vᦲ��>))|T>r���K��]C�У@l��d9:�T�����[(n�`{3��^;��so�Z,�f�.-����e[��֑[�����$g��+����S�G/y��4�r�.�>�8ꉢ5�8r-�����qo6a���B&'8�`&���4j��|�n>H�/����r�	؏�T�����\Kz�F8�P؝A�����s�.�cJ�]� tp��q��� f��nݟ����ү�d:'ճ�"��:�t<��	�FD��Z+[�&�n[vxO���|{�jle��Kܥ������Y�_�c@%.�+~���Y��P& �v���t�$��!�}�����/x9N0�����9���"��KR��ê���R��S�EQmT뻿��y5O��sd�
]�o�����A0pNZ)\��ES�^�g�aak��PHAX �IU6,�x��*�� ��oη^��+��q܂��H#�~�$�ĭ$��.���w��?Jxt�|w���M2��4�Ʒ��io@�:���mO��n*a�@�"�����)}�A�<�Ưε#<��]��{�{E'@������/�Ie�etj���� ��;8�ͨl鯅��H�a�Ǥ���}k�5��ж�%���E=�J��<S��a�V����Vf}�F��Zhd݇���tP$�&��B���}�q������<w��� �!��t��V�R�{�v?�&f��71�?�r�����l�LB>FV��ޢ��w{�ٜ�z��u�gkq�7�`Ay�.�t�jV*��� ���Ђ��D�8E�co�@��%P�M�\~���skOWy��>#v~�f��$����,
�v�ԉ5U���mO��1�a�Κ=���6[��)���08=U���k{����h6`<�����GX+]����F�t�D��DHu����õ���3�j�n��Oj����_7��>����x����IO�\�n�GF��n�S�:	���Q�a���Ȥ�`C����%]}؉���:�iD�c���E�אY�¸/�X�t��"��i��.-�F �L�a���՟�!Bu�н�A�� �?��=�/�F�<~:ݍ��C�v�B�E�M�3dak�0>é]��zGH��r�ax��{����
�\�nY�s���;��fE�׵�얳A�G8G��K��t��zX�`q�g�����������'t����6������c>�7�>�z="Ҟ�V��o���x�d&;�ݨ�8%~�0]?C��������<�<��D^�ģ�E����y�)ڃpԁo��,�P۪QjX{D��&g�2���#�����H�����mX**��n�w��yÂ	-�xb�Cǘx:��բ���A��턔� Y躣�V�����L-�:{�d.��Ȗ��c����|.즯�$����=1����M��{��kZ�x�j�����٭���Y��3U�t����❘$�D�T��g�s_����r3j�h� �q���>�5����G�ߊ�]�����%Y���H��ia-A��������E'�H���g$&�Qiȝ(�Ӱ��q�V�{�\;Sē�O+Ż�g|A�)V�T�))���}��3b�ت��c�i��&ȋ���#��t:׋�U�NT�xI�6�^�亪��e���:]���0�-G: l�-�$2�N2�q����͙�]�snC�]����%!��I��Bo[ge�F�:��υ�)|��8��H��`)��H~\�,�;�a�^fR�Y:&ݐ׫��T�@������ֆ��,��#����G�<���	5��4y�ԝ�����j���#m|�T^��jhC�۷�'a�(���Z����4�[,����j!`8�.�ıCOT���AB91ܮ�2b��x#29�Y��"�k��!;�{!��^j|����-]�F�
CNi�ld���)����[�b�t�O��Z���#yk�e�ԟ'r &I�|$��E�i�a9��Ѝ-�T��hDN�ế�\nk��f4#�½2�X��h��7��b��JIL��ȷ��Y�5T�k�i��f�;����ňCӘ�e�IR<����f+-|]�N����ˉy^�k�9�L�,�r6�AZ�x	<�L`�@�3���$�X��X+[&�h�b��OQ&�&��l}�L��U��ˎ�w)g�8���AC�*©�T��o��ß�D�f�M��Q�s6ѸCR	J]v�}��G�+�p���#��0�l@s+]�h*����4}J?κK������`w|��"�>Hʱ|�"�������Ϙ�=hy���spƦȶU�tH��h�4���f$���e�F�Q@�eC�[�WRD�W�~�}�6��mw׫��\�7�wD���:��rA���Z$`D[�T�Š��q�4�����=� 1o�d4�kͬ�J�,��PI9�ټ�叫�&����8"^ޠ�oC��k��vg�����!�|@�>lׁ��ڂmiQ�'�,�{�C�mA��d�)�90�|���=s�[x>�T��3��q=Q ��G�sf��
�~�Q�~2�G�@e��N    z*4���:1ޗ�'��K~�YQ�w�V��"�}�#C���ν�}��$K�pФ���1�A�8kȭ���0�Z��S6	'����c-P7NiQ������IQ�,Vkf��
����^ ��Q��&_(���;�vpm+LW��;>��b)=�q>K��{��"b��g:������!a��]V�x[;p�lf���۝A�*���C9����B����L6�5cm�;����vM�(�+y��=>D��(��� ��
Si������&�2���=���]�8Q]���qmco������bu�c��~��L1E�Sͫ�s?̡wL��!C�/1dsQ%Z>ka����W�~����WRj�U�'��˸�Žkh��9���2���[ƪ�=8"������ބ�!u�ׄ��w2�(R|F���]]�M��NM�?W֜"���bZ(�YC�$~�x�� ��mY�gD�q��Bq����m	�\i�"�J��$Y~$ٶ���4ÿIU�Q�H��;��}d�瞀���W�l�����gXI*�Fm�����E�C�v�
�؆>������̢8i��y��- \����>2��|4�=m��N^3��l��#ƚ�|�nP3BF@Cè���r(,O��f*�!�i�l|0�C�tͪ���Eܵ)ܼHI5�)�.�<�[�O�:{������"�H�m\�=�v��8�D~?��b���QgSQ&Bm���K�<8l��~�V�t�"�B����e2xȤ��I88�߇�т�4�q@k��&)��(���-T팹Ր�%�7�D:�0�#<�O.���$�?���f��� ���!��p��i�S$Y�a+	c�oܺnMP�9c`.e����/��l���6�ȠTU��ߤO|�$
/���]% ��F]b�A��"�[è�ƃ"Ou����;}�+�A������t4ք ?4n�^T���&��2[����@4M6|Д���O�
z_����́�nx��wM��>x��m/�nnLÍ{���Y�g6`���q���0U�=*�����_�����1\�����ƌ+�Ϧ��O���7�
-8���"dOb��{���G��M{�&���Q}�ϭ\Y��@��)- &�3�.ъp�=ӄHhl�6���+�]RC|ʟ�󖷶J�����<�4��ZXPc9�8���-��K���M޵7��B�Equ6zA�7\h3-֥��+U���ܒ������Mg�/b1�N�J�L�z��P�����7�ښ0۝�#�}�Ag�V�WD���d8gYK]�1*�g�] �~���ם-���wB�^[0�	�O�P=�=���@oq�F�"QR6�:t��Ln4��
�*1]m�.s�"N�E�]��iJ�B�ۨ�gQS�%y>S0�6Ø�xPo�&�)��:�bVа�y��\nXJx �z��s\�~����%�U��������S�\��]��������� ���Z{7h%��eL��vs)˕b�,�#�O�}�V��_G�}-����G�΀�{���*��'
��s8�hXĺ/L�b�/O��I�����Y�]�]G�m��?��!��5I~!�V���{$�@���$�pnp�������,�	\�t�U��ҵi�3n�#4���C�.�s0�,v��Ԁ�~�0��'�7�d�CGi�`��kC�y+�'\����u��-e��5�퍄-�&���d�l!\��:H�z˦X�r`+�]���u���8j�Zk�Z������t[�"z)f[���,��kV^����ױ]G�xQ���N+��#��-�������X]m&�5��8����ڟ�cy�����ڵV��uF�hL�4����k��%�X8�V7���N�Q��߬9�-�]�B�W��gG#�h�u�|����bY�h�I��]��5
n�BA~��_Hb+D�o�3��lh_fm�7AYw�r�Ra�C��)g$"V]
�$� �R�+�W�p��\Q�Ε���r����x*6�e�ڗ���o��n�I� 6]g�|��uj��2�>M��?�T9
eIz�΁*{�N���t�@�L�1��"L�⎋���~q-o	����t��%@�b�K�:}����F��T�}����}�D��5ձ.]�����s�:�|�ihl@�݁��G���"jU%I(ݩb�����j�?r�T=�Þ�����s�w���J����Kƶ�u�n�c�q7��l�H��ћ/�B�C^����(��(�?�_v{'����8��ݓ$��4>�����M{>��!���K��)�?q���W"^�� �3��������Lб���}����:1�V�VC~4
K�$�d)��PEՊ��͖/y�� �9����n���_���<�c[� jsO��O��o�S�,�v��b�g{�[��&R��Y�T�H�'��u��n`����'�v:cx}���u�Y��Fw9GQMJp(��7쓐�V���z��j�"L%S����Z���qs�j\��{@�p�	��?޻�#̈��Plw��{&� �S�9н�uSC��	U�t�����g��ϟ��'@���"��xA(�O�� O�Z�W��3�K�U��J��V�@��[š��}���2Nrؽ�'h�01a�<�u���TyL�ߌ�21#C)��|�._W�8��S1�q�t�1���s��E��G,�������yi?�BQB�+wD ���4Ԓ�u�T�8�����Ce������pJړ�v�;�T�R��R���MC�����l6��� #8��8�՞|���vCV��i�YI0��օ}A�L��v��㜭�b����/f�gdO)�x���(l? /q���pJ��� :�e�����ׂʏ�!���̡��Fd����?��R���`�(�*�AP`g�J��J�A(���6��~'o�Ҥ3�~�־��N򋖳��u���j
{�����i��&/�D]y�>�U�dq����#[���HïÐ��
nIƜ�~�w�/��x�ٞ}F%y1��z<z������6z�AMBe�|(���6V�%�$��~K|���R��������o�����.�b���=�I��ak���g�k����PB�#bQ���cV>�c����R�y�/��=���k�*s���/��9*t������N�E���9L�������o�j�F��N���k��;j�64r���K�4'���w�+��U�~�+�k@�9'g�
�$_��X��ʡV�y~�:�D�1�������=kQ�M*�m1"A��p��$͖1���g�!�
�p���5$>$W��7��;B����oM�d2�l����=�gyf�*T�Ň��~�zQ��+l,-�+^�����,A(qOe���x�V���QI1\|�-j�g�S�D�@���f2����p\"[Y��=�#=��}�g��:���gC�B#�
}?FI���ʪR�*����lN!(��s��A�f�����I�<�l|��=��N܉ظ�+����w+H�nK�`;8I784诖)-��Ct9蔞W�b�N�v�z+���ޅ��,F���Bک.(
X(G�B7���V9|�^R1�-@kOk�7��}���x8fU	c��"�'p�!�)a�ῑ��|K����p�v�-�n_"� ��������823u�N7d����;z*�{:�m>�P��.>ԁ���9�~����hp�d54����0��^��r����1Vх4�C(4a8;���zW�X<]�I]��G�sP6��>�}�az�^������*F)14�d������swB�*sv4��AN(ċ1�q9�t���?�s�r��Ւz{S���5=͒�1u۪�Qjh�M�!�G3��i�A�b�NU_WRZ9&,!%Yf@I����wK��@��a]�FY��"������02�c�]D�G���]h�;�ђi�e[Q��i�d$R�%�����;)i��*�@�)Z�9{�ˈ���.T	,�k�2�����A7��Xf�@Iu�]�z�K���hQ8f|PuW熶
!P�	�xb�U��D�K���c��*��u    �:�Έ�{��huy�-�V��j	��!q�`�Yk��`{��ۏ�?�F��~ᜍ2�	c��m��|�pS
��KfݲjՆM�����K)��^�:W��Gx*-�f����5���'=��l�w�-�!Ԥq�0�ߣ����C�����,��wL`V��t�V�9쌦��k_�;6�3����L!�(���tS����%��tҩ��3��诓�O��*��ˏ�����vT5�s�8j�.���W�+7-续{�_�[\��ܰ��F�n;
�h��Łh�ҕuy�
(m�����
Cֱ��$Y�Ag�>���y�99kWq�*�P�ܡG�^���J4#""�����6�;~uRA?�Z�eSCnk�Hv����N��K}>T�}��Yw��
�$p��oI+}�N��u�����:�1Bd%�qo���.Ց^�p���a��a	���"�u�Q~�d��)�JI��n��3.?�&e����'�p����&DjE�ݢ�>yY	H�)��y�$�W�?��1׹�d�i�E
A&��B���xs����ϩ�}Frv��*'�4�?�O�Y��P?&�!�ɭ^Wp��֫-.E�g{#L�ֹ���p���r�3����@k	�v:?�-̟�Ճ�����G�f�\N�-j?45�� �\MV���:��Z��F�~�	�?��g���?U��V�,�X��"qw�Y^�u@˦�;���M~�P�8�sc�q�A
�C ?�Yw%��!���k���t�1�L/�%�<=�l3�����s�Y�s��>@��!����;�3zܛت]�`�W�@]��tn�f[��;���5�,^�Z��&?KCq��y5L9ܿVs�D���Q�jb��tH�'�mOQQS�ѓ�s�q4�@�3�,L�j_[C	�G\ϱx����Pd
-��@�Vo����M͵�_o���]`D��[�G:��Zml�7����[�7.ĪƬ;L��R�j�p$v�4
	>�[w��E#z�I�J���k:߶�uMu���G����w�:���I�:����,r6yYg�&���f�f��v�ZQ-�'ʝx|���C��c�<��E~?���wC1��^����M	�ϨԆ�%��bX݁��Q_{��,�W�4�!�Z�Y�q6
Gݸ��!��PH)�Y;yN޷�!��=*��!$�5�������?%ֆu��� �:�C7��z�,R()�����E�D[ s�B��N��	���:b;��
a���=b�+����T�պ��2}"���B��RQ��R[�Q���~�:te�:�G�w�A��G�>�0����P��I
e���;z���*�8��sz�s��ŵߔ�g�aރ�4��I�V9�,bo�ڗ��)�9
<���ݶ�zÛ&G���e���v�	��;�b�sL����i��~zv�j��.>��2׺VP���Z�G����A��^УH�N:"������e;�W����|UG��	��D�lG�Etg�r���v9F����\���j�&�% ��p��B��] �{���Q��FN`�W[�Z��qD��Ѕr��H�
Hi�3��:�H��h��wN���=Y�C9:A�`�#���Q;Pi�d����M,3���x���F�����X��~�&Pi�r4F��:�o$��}�f�R׮�
�c�j`�EpH4p��<m��h���Al�����?��pǻ>� O�!��a�"���7�籇]
T@D�����*��C�G�W�u�+�0X-�~��:h 0��N<}��ˍ;�$:r����U��>�GB�ߤQL:q���I��M[�q}�#�[�������:�%u ��QI���� ��W��@G���F<t��sC5�-5�m�笗�-d��H�h��]���kr������7k�*+ݠ�S)�ٻ��_�q��Sa.�G;Z:Ճ��~���o���"��?�;�����m�3�<���PA��ޖG�r�>&o�P�.$�,<��B��E+$�GO�|Y��(� ��:{�Y�M���j��d��2���(u�Hq T��-#����wWCu4*ѷTjCM�`w���YB���|;�\�x�w��8�+���nX�?����7x-Γ?K�Cv�
�g�K�{�[��
�Vg��
�z��_"0)?��qu���f�=�א�D��p���?��Dm�V��u��]���ڨ�U��W�@k�(�ʣa���-�-�U�'��>|i��$m�|
���M�=Kþ�7um8��$>�/�����ϋ=�G�`��Q�x.�|WL�"�=����$R��+$vx�n�۴*5*����i7�����Z�Fͽ'p�P׮G6hj��'�aa�wW��[�@�|<�`1�p����O��?�K�y����oϡS�UF���}��x4�� Ӡ��H�q�#00�*H�r	HYm䒱�Vߠ��J(na��uw�4��<�m�D ����q�T��dJ��M�|F�
ER�hf�E�F�DJ��t���!����z^=M��C�$=���B���?�dWt�%�F�-�L#T=ϋD���$���`
O�#)L|,S��aS��a�)c�J��n:�N�|Q=��bf#��e��x���1%?m�(J����7B�+�Y��8�@/�ߪz��O�Ӧ���~@Y��w�/���h���	�$�n��}�}�;yV�=������!y�&.��
یd�t%�o�~`Y�e�$Ll����g��'�)<6�iZ��=hx��FF��_�������x���I&�����251Ė���. zh�&:�]��<���=���K5�I���$E�ޜ^�����R����G3�m�f
�
�;l�vXH��*[h٧Oh6nC�E�N�y���k�t:jd�Mm҉�QW��g����;����M�7?��z�»;\�_�z��s����P���ך�53Ԗ6
��t�)�K�����D�Ps���ǊMWB;�����"뭍)+���B>�(�v=XF3�mc�D���t<k��'[ g��f���j��$x���m�d�����z�������w�x���)�q4ƭG5x�B�Kl�pN�0�#���1w��$%�tx�fW���f ����»;��i�n�Q��A���f����+VxQ��:yŁ��y�a��I�]��r;]$n�p��g�?���<d��l.��OuU�=�
U=(��Q�GZ��c����a����D���U��vez��9�Smש?����J�zV�ų��N&�Y����}g���@�~�����k\���ń����l�����SC��4����/P�O�P�kc�rCj�����pv)]�.�0cѵ������Z�;����jy��HJ#�5&r�wC�)2��-tK�p?p��慳)^��Q{ e�5�j��Z����T���F._sye�o��~cm;�ae�L�4!��u��	����.)%���9��
4bE�K�u��K8A`\%:ņ�}��#�F������p�Zre�w��cz�}Wh\�z<��
py��Q�<F���F9R&�"�3�%�'���� �Z�+�٭�QG��j��Ǭ�cN����DTR�T���L��/%˔s��"�o���y�8�2�͝z_�yx�F���D�O��#\������T���W$_k�:��\��0�p �N<�D{�wOEY�O��	�L���ւ��F�渊����4΢�
˯U	68؎��v�	����ͩE�)�<��T�+ڒ}�ӵ��P�����I�����9rU?϶��xہ�j����[�֝z��F�]S��h�c�I�~B���K�û*m���M7]�C{�u�Im�ԧ�6�z��c��rJ#Cmi8�b<��[����C��q�z�����O��+tݭ)P�ȸc��p���w����kC19龰Q�)�,�Ryug(N`\!j�q��5ZI�~�WZ|��(���T�	"�W�n�9�^{x�F�����w�6���Ҩ��fS>�f}ՙp�(�D�w8�    GI^(��I�0*j��?����:�x�^���`����q��`�!l�*N���W�� ���Ž1-A�4����O&uo�B���=�ʪ�O������wa��i5���z:��M��o�X��q�Ɨ�dl�*9N�I������{ނo]
�M��m�Z�C��I������)ȋ�v%O:�5+�����O��İ��wu�~�Fѳh4�р{]�%+�Z�����z��_�/���5�r��"r=:tC������0 �A��'N�I�۠��+?W���1�Z0���F|vi�'�v���0d䱋����^��\�&s�k�^}�H���g�3���:=��փ5X�����L���n6q{���i�ˏ�Z�aX�����"Ʒ�Z�j��6�m�_�Ѹ7�#���47A'�Q���FCԣ��6����Zm<�ц�[��-�XT�{�Kl�Ԩ��m����#ɟ�$�m"��4��E��
{ {������&?W#{��T�-J|�cC��ma4�����@��s��Ɠ~���d���C)u��!#���2��3��.�o�R�r���R�����M"���P�"�H�]�v$o��r�ƭ�-�m�-���vާ��ņz�0j�Y�xoPA��z����&��t�	G�s�su�,��]��t�F~�����G��n�CEz�f�d���پ߯'7�а�K�����[�0%�*w/oX���|�1j?qm�f�N4�맿R�S�}�����3�mh��]�Ȼ�Q����< ���tkc$juR��ÁP�/�Փ��zH҆>K#�"����`I��:w�l�^6�A	.�[�ʑM#�h�kqxfp���"��H����,A`]Ը�CH=7%Tk�b>ϯ�Ք64�vC�i��W��&)"�	�.-��l�Kh�:V�.����E�h| c��p�]�o;�	|UM�^���j��3bC!B��� ��� ��C9p�.��k�AGKH��.�7�/� ,y䜤s�c]t1Q��	����ʽ�����K�W�.?2�S�`��EK�/��Iρ���޷{]a���5k�x9&��{\�P�P�>y�3�$q���Z_��,����@������#"�ˡC����#��o�]1�=@i�������w�#+c�>|�9�������u�בD�vYd�P�j����OO���	�DhB��:;7��]o���ɡ��@F�K�@��P��-S_mJ�����m���<-P�`Ox�O�i�k�ǥs<�܌��8�ƃ1�j�z�Z&��Cl*��k,�|C��Pl�fA����FC��⳷�S���~���
�9�<lz&1���&ne5�F���Ces��G�r����h^�i�f=G�f��g�팺P��:�}�(��B�΂�d��,DYmf�Y�CZKe[G����.��H�|:.i����ڻ�en
���R�o��'��;�O1�t�I�鐗zQ��5�E�e�e�5��M}��UI��`������$��DY��8EƦ6��.��#�&���˓���W�ϲ����辇,�����tA�Ob�m1nd�"	]� �X�nG)4Ʋ���t�W�T-R�^O7�߁�l��=_�r8�q��,C?���,��A�ʐ�c��f"��(v�d��pZ����|.DsZ����|�h��m|���5���x��Bx�u'Q�,D��=����W#0�,H���O���hCv�7�NC�ٙL�y������R�!�vg*/��:OS��=$�ZOӎ��S�&��t?(�[���iz��~�I=0�[��E�u��ePD��6L�����N�[��.kh?���FI���T�pj��57����GqX#�4���C��JSO,]O���v�s	=8�t�uN��qCE/���ܣ�0~���O[�l%��@ȏ�P&���W)��'��/&ގ����^�ξ��Y�#�Bg����g����4i���ck���k%D�:��w!��H���%9N.���Z���}�T�\��<��0�&H���������͇�{KC�"�Bx��CL�av�O�V�u�4 ���נg�q_���T��PA�e���E&��m��oU]>�3��x��/(�ȶ�C�}�
E{ؠc3["A��~0J��m6��Ŋ�V�mˮU�����A��EN��:���)����DxK�a��iJ+]���.(��f:n<��,q���d��%����k�?���eА�¨��$ˏ�P�´�WU��.�i��A7�Dy�P��0��T��g��N������75��µ��ͦ�0��>�#�Oh��T�g�mQ�q湈8>aZq�mj��뿠�[��xdarN8,9P�2�CΟ��c�7$4�&�hȧ��ܐ����4q��b�:��%�sI���u�/�wDj����a1O�%>�T�x����:�;m��~���)=�����:�֣-P��<��*I\�j�)Y���/���n��p�^��1�zUO���j?�шK�ո�֠3.�J�:��wh�n�M?��P��d���>�f�B�iq!�?��>�ŧݵ�ʥ�ǽ��b�t[)9����N�^R�}-�<�H��;���p1G
��Hި����CV�2��Z���m�� ��$�T$�����p���Zs� �o����M	���� �4�����k�x�*#1�h*�(����Vbgj��K*չos���pkM':��߰="����E\�
�JIJ�א�iHfZB���H�>	Az1�6��q7daD���/!>o�s>�j�G�J7p5.�W����K�6}I׵V�Y�]L�-����쎷��Z SM��9�#�?��P]è5�il�mm|;�hAC։�'a�L1s'18ۓCd�?%����A)�rT$���`�����! `�a��?�1�<B�����f�'��,{��C]�/���N�����v��&�?�����>�\|H�/4S����OW'1�N�6�0EO}<pS��u&zO��x�l_�0@a�k����9�i�Nc C�r]zZb�^CF�5��p�i�5��n4�G�_�u���i�ب�����UC_K(a�8��k���F���t���[N���ò��"JH5Bc��&���l)��j�_\=�2w@j��!ۚ���P�O�M��0�?�7�rq���y�y|�Θ�V��E�d�r���G�7΋�{�s��b���!�(^!덧C�M��l0W�PZ��*��F��҃Տ��lqw�֙2:¼k<���L5��4�;�Z��������#�@,-� ���p�n�� �>'o�����])��� ����R�v�鼘�Lb&��-�,������jN�_�f�Cx�y0_�����a'����[s��s�^��L!��i��ɲ^�{��:]��}�q��?�4��B�hqߎ!���Q��4�x�ù��@Oe��F~�qK
�߫y��(�[2���u�5�+E�d	;�2L����lM�R��2XްmG�9��a����²� uҼ�[�V�~
��l@�˻G$������]�]�=�O|�caÿ�4���V��+�/�>Y	�A�M崽Xo�o��(gL��+@��;��ү5��C�x��2}8������|��t����"I1�R�TIx=��6!S^fxR���nW׵�AS��>If��;������� �?�U�+YK��%����a��,�Y�C�_�g����<�n})a74>�v���8�r�P��vhn�SM���J�e 4xp��a	�%��� �<n\�M�f6h����x��fk�#���#B_7��2��y��|���f;})�������r��'z�)VMj�R�Bk�����V����!�q;,�f��(g�����ٱN�Թ�C��{�Y�ȧ{8#����.Ew_nگ	dfTѵ�4Wӂ�*ϴ�ųi�G[tJ_V땈8�E+�V>Gk�u�YC����o��}��ղ�Wj.��hO{�A�-�n���J�'F��pê�� ��<S�R�a�4��Q��F��]�|�;!�~�p��A��v���7=�ue���C��c#�O���U��    lr�Q�����m���!��o&F@��Q�p=t`���Aq�u-����S	��G�\�L������_�
�ہ[��nr�m�8{�=r�l?*�p8{l��N>Vl��⺠6�_{�]ݳ������1�+g-�=���D�"L�TY'�=�ع��M~�6�B�P���]�՟�<�g�Tj!�]i-"��py5L.��IU͡��*]��蠬�C8m\ؑBz?c�(��X7>��c�^#�{4��R��y���)��P
-���z��
O��� �n^hԸ�R�jn�d)&��ER`��Q���n�^��s�������'�a�h1���X����8Pb�9})�����KkUlv�/۫�R��b��_�iu��}�\��]r4�L;�=�U��Ld&�$ڈ?�>��p�t�%=� (S`!D��C y=�<��Jާ��,�w�5M���k�L	��P��:1���F-�p��V�!����*'�r�} 7 ɥ7�se
b�U԰u��v=N|� ��SHG�
+Y7&.��N�~)��D9I�а�rZ��_�o���>YҨ��hr��׉��w��?,�Ðcx���ª҉L7�%*X$�Τ>7
�^����]
 W�8>�n{�ˍտ�C.�>Ļ5�~��
*�'<��E,�`S���rA§l�Aي��I����{��4�A��G��\e&�RP��=���g0ĵ�îc��}}Aq�4T!kK/	��^�_���@��X�۵������h[�;ڝh�;�*�.㬖�!��THڞ�ƚ_ôDK�Z���;GS94�Eݓp�&~�R}�_֧�W	�(�XL�TA�R�y�ՂP6�����E��#\���z�IPh
o����к�ԂM�}6y�7X��P;��q�qO�D?B�]BKNJ={Z���O��IZ�K��W|��|Gw�z��l0f]�n A
je������{�"�n񿬟�q�,t{�S��������/�8c�
�]<T�l&}i0�@A�/�F{��O���S�`Z��vA?���w�����Z���W��*��W��\��'Pۼ`\_��n�Q�9�<Ų �W�7s�ڎ:<���`���(B�W���� Q"$��"�R�\�����ᚚj��GEǐ���5B�����[��t}�6ޟ�)��ح�$�F������E�Z�˖�ȭ��,��(��Q�M*�0a�a�ɺ)V��u'p�z����~��R�g�e�N�&T|�埤P��UR�4o�eR1��.�:}�>	������	�ZK���gB��^=���K���ZQx���$=Ksv���R�C�a��]�zs�C�'O������q?��a�\�T��9������7b�.v�N{sC*�d���'��&�,����}�-��ᄌ������ekc}c(D�%��cM��TR��0nq:,�;Bi��9u�v��tS�d���E��'e�MҼ�{�։F�gc�ެR0�T�J6�P�l�&C�6Y���e`�_���_d8��Ssn�иZ;�	�7���,aO��ǞJE�g� ��ċ%�m��_�7�	75�.m���m��� �0�+ր�d��������U�ϐ˧;�j=ʡ͘�Ѭ����C��ьX(��lؕO���y�'��b>�g���U�|Is)�Gk���(�l� � ���&�|}�����,?Y*[ ��kK��=����A�ϩqZ����}�!�	i2����Ө9�i��ó��GY,()�{���[�����m\�&]� ��Ifp��
D�8�Cq?s�dyWxgK�F�4�Q� �(E>�b_�&���Ù+�S�aw���u��p�P� NsS�E��7��:g�W6\	�~H���2���8�ٛ_J�=�3��7�F�{�{,۽#=�,#[&�ix�I�Vƻ�F���V�~=(wS���������HaI<���`g)Y�(�B�����j��J`����l�E��H��O�d#%��9q���jH@:�������6�!>5�D�BX%،K�U�y֖_�y��$�����zf=�@S�lhq��%Z�Ec��Ψ<w�ͦb�P�	��Rx�2�X��O�1��}���
��Q�҆#M9肦)���zf�?V�}���G�c��W	�<&����o�R�r�-η��7���ֈ���~ ǌ�߫>�妐����4_<�d�a�4�u��������6����r*(?��x\��L�!�"{���8�6�d5�ޝ��x˕)��u�|Ɠ�'�V'
�QW��샅Y��P��Ȓϊ.~Y�\���I�{1íY\�4pwWΙ����-�]�������Z�3=2N�$8�;�I��r3���(ۼ�w�۳ J�D:�t�2g}>��Y��D������,ߒ&O�M��7���A��A��,�ML]���I��w�����,�Q6}7}NO�:�uz��6��4���$�CT�`2�U.C�j_S!ߕ�wx7GYu�����Z�=� ���ƆސƷ��9��c.a�!ګ꿰�w�� ���٭g�ߡ��~�zq��)� TT'���T����}5�q�XZ��a�Pm��.���V��
t$
Qə�1}�FJ�γ߬đw��z{���~u�`��-���i���'��l#!��͜��� ӋSY��[ų�-�|���&w��,�a�J��^�c�PI�������B������*�����i;p�GԥQA�#�0!F�G1&2Zk��$Y��y0�{�N�Wo�;�]oZ��{Z�}aNi*�����F2���7$�������/'0��m4��4��;�g#�N���J*��#��/�����;��W�涱��\�	�VJ�\TT�̘"���9����KNsMk���^�]EG������U��zġ߾�&	����9#/���vclh��aB��q�K£nG=K/$�M�En~�_�N!� �u>h��`7���<W�SJ�e�&�d�~�IĢ�+`�n�n�mi�������}º�v�j����~�Q5�] r�/��F��k4 =�R���Q��!���s���mȄ����84��P;��ԡ������K;g<���Cm�r��G��=�
��T�>�om���tpd� $��'�Ny�.֬κ��[�&�r=���Tr�C�Σ<���+��w_<u�
��.zƝ[+�����\�]K�B1t(�e(�Wd�*GO��Rz�'g��H�B��Un_�x�0צ���ޗ"�6��^a���y{�>l)6��:c�d�X-3��im���Y�;�0��#���6��9�X�����w�WiC��j�"6��&$���D��Mِ�t}�Y��q����0�ڔ@+�����v�Ce�$N�O�Y9�!�p��¯Tz{$F� �'`!�3�1ؖ�~�8�c_��U�(�ߐ���Y���p(n�.��uM�d7����fh+�`1Dz�Y؊x/ ����V��!�3KH���rɵ�~����Gj��h���w4>l��3��	�#4�'��w�fj�m�$���:{&��gx�>�%����Z�+ϭW�7W*'0\-�dT҃fa�{[� q�`�8��<�B0����&�mR�.�
���\�@Q`xd�w���Y��G�Y&�:[~d��t���!�� э�k4r��J��3M��ՉM~ �v�q�:�i��5����fK�^�Η�3F<f�������Mt��l���m��C�O��[�Yǫ�C-c���oYG���Y�9�}�O�Ե���{���z&�%���a+�}M���Wa˝Q;�q"���̂�e�8Edr���r1H��頨n]��c��+ͤ���ŐS��3��:�#:C�b9��,ú�=[�{2�Y�G�8�h�&P���4)�q��9�:�ݠl�(�s��"�����~��'p���B��鯛�����	�(zN�q8ڏZ?}��r��kqɢ����[�g��r#5�\���_��4��u�$� B݉�>k���q��
���J
���d��F�n��Y�q�=�$CM�    �t�v����UfWz��q6��{;	�}JE����tiD�&��ʨT��y�N��\�x���ٸ_�q+kP������y��h�T,������Ź�z �&�����vH 8��9�F!	i���
�:�	T�mo��rN<�M���~���uS�'E��՞�`+ڋfQ4�I>^��%���H��!lik$@�ķp���kg$\]��łU�G�1�t9�TS)�L5J+�9�'��Vh�ˬB�	}^��Cʩ��or�;o{�3`�x�8�.�&p2ߡX�*A��	���)ܞaƾ��S�)�.J��%f3e�=���z��M~��#���3���2L^�¥]�A!�B/B���rR8�I�Ѻ6�H�κF����,�q<���&�:�Ļ�A��2�TS�{D�Td���ڮ)���5�Ͻ�{�p��>��=��ZE���k~vԲ]���Ec�h�}�(���P
�I��E&�w_�L�'v-E�����o#yÌZ�G���WA^�f/@� fDPf�fT[�]�K�����ƺ5CH�Ѹ<��qTm��c�$[�[�C��-Sͬ���Z4n�d���,>bl*���=i��(�����z�~Sch��eD�fwa���q�G��c �a�K��Eu^mY[�0ݓ�[�Y�FM��n+����m��V������8�QR&���aF-&Vs���(�D���G{�DCt�����|��3������)�nJ�qg��NP���Л(���p9�5Ԥ��Y����]Ѿ�+�t��&�,�a�*^G0�w�U4��	+>���0�ȮN��;5�G�ewFғз�^�Gj�����	vS�ᶭ��o1�}(���(�8��Qz��<b��#�h����Ĩ̫�znl�t��̞0�SH�RlOq�
�+��ǐ
\�g]7��lφ�ޕb�[$�Ö.P�pP"z���7i���{��2��<愷�bpVB�敂S+T���SIN�+���+76�֧�&�'+��xz��ÅmF�O��9�%N���� ]L��"�"�sd���7�tʁl8�Pօ�l�%�.Y/!�&�!��%�D�m��Y�����=G��>U�buj�A\J�Of�����u�D���c?:�k	sQ�'���K���-��d�Y��މ�CZ&K�8��:�NZ���hC�y�ţꤥ3��g:�[48�w���8�*�ZL��*�$�Ê��}���J��;~\X�dO۫vguΟ7_��W�vN[�]�ñ�)�݅}ϢG�z8��˗�^��Z(J�6d�e" ��e��L]tGDs,�yw/�'oY��4�����[HQ��,�i͞%�K�;��%�d�h��K)��[sV���.~=)�!|�4�E:׈�Q߫��h�H2��}!g��I��|��J�?���Ǳ̓��z,�ւ�w<
�.O%�X�;��r9�X�W<x���n����5�6<��!ّ�Y�l	U�X8sI��1����#��T�~a��d<`�	;;�j2t�D�z>��WT�iXY�;�#�up�?����|����K�&G7������<��}����g�|��^�%&���J6�M�>��f���T4�&��T�������ul�����<W׆����m���Z'����u�&/�T(�(�>�ys=ǿ҃�o�6��һJm�rz�a�n�ۺ��<�Q��c�:"'��=Skw�!� P�w�>���%!���:IU��_�"Z�Z�oA��c��͌-�ޤ�#\��:I?�+a�S\7�+R�T7Y<e[��|z���:�nCЫ���4��t'�C,T&%�}]`����:��p�?�3�ӭZEg7w��@�[��y��A����~�b� �j*܋��0�`�'d��WL���Y$���e�ޏ�^�z�3Oc_^�]���G{�E�YU��B���6jֶ�1�F��Z�����+5�RG�m�y�0��&�w���`
��q�uj�;�vy����� ~eh�(��$i!��e
f����tA
�Cż��s�/޳�%Nq�~&���h1Έ�7��q�o<�"�c��ʖ8�'�n�0��n:4U0���|���'�m�4����5dpFwj$�X���-o��(������򾭽m$���+�mv�s�p��[R�A�6@XC��82,^4���ߌH���Kd�����*���TD"2.'�Y#=�vpi[S��T�z=�S���M�U]۹L��yESzt8 9�=�6�΃M`��mJX��ȏm[������[W�Q7�J�=e�T@�f\������L��x@P�XĹb�&���0Z'��j�<�����y��Z��~<�J؝��>a߽OC2�&w��V�s�3�@-4�^�t��]��:�H�M���Ka�e�L��|�'�>l�8�<�M~�Ӡ[��=X�e�~0m�����ʳRj9��b��Q�����1xB��Q������]|��q�[�Cن�n�v2X	�,���O�3�,os�nX��Wδ�on����m\���r���Z�gI�-f&c��p���=�=D�8ԡ0�-}��_�D@,w���b�dxQn�Vˏ���G��ٳ�>X�e�5������|�� ����Rފ�bX��, �}��q������xu���p��G��
҇�^��b�휪'$���ע@q�)Ё>p}��,�Џbu]	���B�1�A�zN�*�'/kf�y�sF
�u4��I������f�P���ɬ@��V�@1��)�8n���@��3;� ��#Ski����t�w�A�vl
����'w��� _[�ڕr�m=��%,�Ov��eZ��v�ۢ6�	�[�\����Hv�kmK��NhЩ��U�����c���t+MXn�q�����]�?��ƅ�z����u邪�� 7hѰ;�nh�p�^��/�&�v�A�]���<a�O5`��-���ˈ�>��]`�G��j䈘���6N�r�7ג˱�kZ���0S�L��x�(���s$�.nׯ�M���,!d�"�� SmÐ�,���
�΂���`>�0xN�$ݥ+B�a��U@Y�b��ڶ/���8��Q�=���)�.��	/�v�Ɋv��0�U�8�|c.)�J\Iԩ��Hu�k]A� ���RZQ���!+[X���-��LW����3��]�^�����V3�?�P���
�.���._��T���n�d��@��Bg��ŋg*�.�d�CZ62�5y"��b���Nv
���ٝ���,���v��|ma��c
�����T���ɻ)@�!<:Wז��]��8ƽ����8�V��`��f�.^���2f;�_��D�,��y�9����?!=�3mC*���S2>O���]�J�qŗ�\ѳt���O�3�7O���I�h_��+<���1�h���2^�-3A�W�!�n{:!�� ��%.�g���lilH��Q�g���W���u�B�𨆯�g ���]�r�O��{�������N e"����-LWo�ځ�A�����_�is���lk���t��W`3v~�^�����,��ԛ?���e�;������ ܮ�0�����2R���������N&ш���c1�i��nW+���Lʗ��G�b�+x,�Q�J�����v��"�8�,2�k�N���}@�����|nQ�f��˸?HV�?f�qF�ӉO�>��Ȱ���D�:��o���*12�%�����\�>ن�CS_��p@1H���}�%at�����{�F��]�!U��]_Y��8��zL�&��|�,Gn=��.�Kޣ�^R���v��Ȩ���a9O�_Ѷ�l�J��nq���ʌa�7��;HDr"�3��,��g�e���Y��ϫm�"���rc����������]f���8���\�����K�� �fQ."6f�����l�QW{{J/�0{���g�K��q�'�����Ĉ�(6ԙё�����s�T��r|x����*!��J	�r[���ܿHa+2:F�=B-w>�Գ�r��Y�s5�Ǳ�� ~p�G��1���2[���Lڻ-��jXx�V�    �7�#�K�[N���Y��M)O�T�3��q7`]��+4�/أ�( ��4��a%=�N��3P� o����j�ܡXSΙ��r��Bz�c~C�p�dc$��d��px��������G�#l�����)�nҽJ�?u8����4Mw�
��z�T�#�?%#ܞN�ņ��z��	���2O�.|'^�k��%�@I2�\����oZ�<�t=�pF@@,�T��&�`�O\�Yr�/ݣ���f�<�(������Cn+� @��<� y9���0KԢ�{�����TI
���TK����`d��UJ��KnP�z��x�{o^�6V
Cb���k
Hb�w��_a��m���R��+C��b��Vqu)����s�}!��t9
����S���C�"�֙� �x�#Y�hC������D3����OX�%A�a嶪oc�[�2	8#�m�G,]�+V[�kJv���3Ө#��i��̻8I�!��E��%=R���(|��Ջ�LY�9����N���欶ZAJ�![�b����0~M_$�	����ju�
IEd�f;�1����Ё+9|�>�x
�P���y�9a�ʄF=
�v���{�aw��~�߈ӚA����Ǜ$�����1��'>a��Z�v��ۗw�L���O���gTWbDT�a� ���V}���J��t�63�s��Gd6�<�fVMO3�z�u�"`���t֝�`�.�Y�۾n���%h�r���o`pΨ`���p��?b�H��f����2�i�d�iU(��m~�9�R���R�բ4�+'.�M�a˖k7R��}��x��~���vI��\���	*��ߒ*u�M�˪�ird����=�2(A�MwA����rA���Kۦ'G
X[�jb1��>:�r쨾�,D�uP�p��<D�_n�[��l�js���ceN&����+} �@;^�"�x�:��,�Z��.ٓي]�O�C�-��6r���@W`�tA��"���"sF���X	���sŀ��o1+:������NU���?y}�]�,K*��k��0��ϬO+�P%ф�Ri�B��ȷ�W/�f�n/���Uy_?�S-����TPW��ht�x��UA.���-�p}�q����RS%��V��0��h�W���X%Q7��I�϶+�fcU ��$�P�S��y�+�S[�@�
W�	��ۂ>A	Z�E��"%i���������3j۳1%�}B�}2:�"��R͠X~�~M�,g�p>��W�ӫ6����&V��p���ig�����y��B�C�e������s�:P!�zx�nA�n�j��R���Ng�ֽǁ
�mdV�!}@r��_Q���I�����7Ue�:�o�s�)%�H��o��/�*��[�ؕ{~СQX��\�8Wύ�7H�6�j4�(�\���}o���[�#}��%	Ư��u�2a[1�{%���o5����f���}!�C�l�v�;[m�����,�0���0 6|~2]����Ea� ��~���+W���& E�Z\ZH �1\�V�a<�H�p�Ʈm��Ľ�.��Q0�iu�c5-Q��k�*�>b��	�d�6f�t]n��f��ngJ�h�:�'�7Q��3�s�Dk�L���Q��hl|�h���Ś^31l&ܔL;�<�O����z�#��'2N�I�ɥY��ϖ�o�.)6/��ٮ��3�h^��h�� �J
�:��3�d�Ͳ�8�=���"|l�z�y]n�����Kܠ�������J�{F���d&	�R���-$AM[.��>�T�{ם�(�(���l���b���+W�+g��$�,�����9pO���)_��?O��c
�I\:hq�G�`�\m�^h��?s����b���M[nɶ�NБ�er܇@`e���E��pg���@.����=J�[�W����zM������_j鋍m(��0�]2��?�*���X�j"���ж,� ������{v� !HR^�O~T/�0�g`��!@����NNv�;�K��db�<�t��)YC֙��R�r
B:�Hs>�',%��>�E���g���w�������X?�d�J��b�t�W��o\���Q]a+a,�|R��h"�/��SH]4�Hn!K�c��5"O��r�c$BI��2���{���Q��Ga��_��u�GH�\B1rntA�gA��~�z�@+�%q�"�_�x"^-��3R^�B�e�g�Rx0f����*��%�-�s�.�;�\�>�G�/Q;�T�����ȧ�Kw��bw��g� G�؍����Xj�r���^���z!��Ǳ��%��+��u��4~�����ŗ�x��@.�s��n��@󁌬)��gY�}с�]60�tQ_6�b��Q����g��*`��Mx��CmYnS��+��ﱟc��2���(eE6�V�x���i-�@�q��ec�m�E��dvC����]�?�d�
4���o���y��f�������n��s�vH�	z�"�l-�۹)��`�P]Lɜ���v4)j�A1I��$�=������k��^~؁fO��-��m�.�j^&3��o���~ ����E��M� $��~�|#�UV�ܼ���|X8���I�|ܖ��Ξ��^�m;5��ۦ�i�~���vƷ?�I�R��Q�3{��"��;�_YC|_մ?����o�\x����MH �D)�L(X~�f�4G�l����8\�BǴ�U���g���ɦ�57���i��I<�h
A�mvE�u�qi�>(n7���@�ق��?q�/X�zц���#�2�a��7�t�H������@���Y>�.��h�wT?��p�W {ƞ�yc~�ǟ ű1�w�˧��Y�k�:�j�L���8M?G���8Ys*/M㻻FQXHF�j�F[[W�t�F�S����S�c:����Ba�$�x@�}A��		� 
>
~���-y�.Z ��'��-� �_�!�/�6�p�0���2����}c��r�2 �Wk���+/:"Ú��[��G��|ձ�ڕ��5��S�= DepVpe!	$��eﰉ+��%BI���U�y�r��h�>�'��f��v�}NvI��D�=��<��x���$��o�ЌÛ5+��4��Л�v$d_r@��+aq�~Fe��LRԼ�`"`Y3� ���q���m��o���=ﶻ����Q�=3Z�o��85�85��P@�ۼ"��	����ؾl��������IX���5q�N_��'���hAlh��:�RIڽ�����;�N��g��%?U�p]��皅�~�=���
,��6[�����]�	�Νie���M�I����i��:?��5��0�ì�.����+jX�mv��Ք�p� ����{8�kD�����c���/I����>�t��CB�Qu:�����T��&��E��4PH����>p������C�awF���f9�"�-\e��-A	��a@n���������=0.~ء,2�	�	���Ȉ!��lI�y�<n����d���϶�_ �=��s�V8�:�� �LX-mH֨G~_öW4�:{2�Ib�*{�x����e
��ҧ#@`p��/�Ma��|2|�%��&�r ��x����FfVhj�ᾞi��9\N(\\�|s;^%G��ݹ
�w(I� ~}o:���}c���g�{B0���BX!g6� �M]�s�͉��g�À��)��9r�\��ues�z��P��p���h�x��8'$|JVD�4�/���5���v�kilOU��>B[I�Fe�p ����!J(��f�_��XWqEl���m���m{M��x�%�G�[��eX^�Ϣl�xo�l�[�c�2���'��LK2}�+�σU�>D��_ޔ労�b�|	���gf�2�e`�FSo7߰<�k��Y�
@����e�j�G[���]ЉἏ������_?eD����r�2v9\(���`*wt� ��hrwI�N��'���� �
C���������宓�Xi�ߓ��oR�ud����u�\@@/G    T����x�z�p�U�Cm���.��e����ҡ��K���+M����҄�(YXɓ�Ǿ�u�Ur�W[{;9�� Q�D������q�����G��F8�^5\��M����e,,���vgs����bP�O��sk�����h>/ߠ���~�3o��e�����n҈�hw� _��Za�4]#O>W%��%�o?�]7�����I��2�f���^�d0@�u*�Vֹ)6�4sf�'���9��	���lr&q|�^��I6�g4�z�u��j���ဆ,�����Ŕ���+jlZd�p�]{yG�%�Zu����� 5i��I��: �+�F�x��u X����q7V�֘1[~�Q�;?�9�u0b��%w�km}�s�@$5�d���`Z�g��X��S�A�	;!�y��ڨ_�g�/��i���&~��`*���j�S��L�:#Pێs�!s��£'I�q�$C0ay]
�������t8��>�Hp�u����ܳ|�i��5�,U޳��������~��6t%YSmX��?P�$�3��p�#=�qܮ�YƄ��e��kB��8P&7��������~�[�Eڜ��*�%�&3��n&Z�q �����G��>��<~��ǹ`6�:N�TY�}�
�rK.n{O�l8P*R��ivQ���H�,�~���f�n��f�dА�v�ְ���t�Ȑz>.� Lt�3)_��(��.�R	�i]&�q��b�d:�#J:>��!��>"�S �j���/-��6q�0|����G|!:�6\Ɂjmm��Hj�թ!.>Jќ�ٙ��+�j�]�,P���;d�c���?b���m���NII0�����6����{���8cǂ�ނ|��uK�Lc���P���^��wee�����.Y�����K�&��m_�/p�X�x=#��TVC���/Ѩ���(�|A��B�J�U.��x�Z�����x�q���'79�n�%|����]��ؒ���M��m�i�2�FÈ+琁��&ϫ$���3[���*Y?r�L�KS��Z��%��hm�n+�!��Q��`��<���K�y�P����9�?�7l��
��5l���Q��X2�PR��`�B�F�����u*��/���w������W����?��]厂�*�L:ݰ��a 0O������>�%O�;�%�l}?�.^(0<�s^ۛ�S&��8�tr}��;����K��-�Z��4�$AҢ��xo:�8Ժ��Y8e�}h.����'{'����j�8��Y�X_u��&ﺖ�E�=Z�b{8D=G,	�t�����Ͳ=l�Z�ؠyg��J3d�yd�C�
�wN��� ����b�<�?�/ �ifC�l5�2,�}
`�qrԕ�!"x���Yi�lr~rN�`�S�Y��5�6[cU�<�/8���h�+A��͖8�Cp^���r��������Ůn&B�|��y3m��{�y��B�0������YRORV�@���Tƹi�1C2���6�`����խ��1��',�>q6ņ�Xi�ݭ��<M�_s8
�`�Ah?
E(x�,d���M���l˻Jw8%mf�Lqz~�@$�w�KvRBl;|sXϘ�笜���s5�i5�IX�=%�5����q{:�+�e�X�������+��Ʊ�\����%��Pos��1��@�]�ۘ��;��ה��'8�Hu����	,�1�Lơ�2��.��,)&�hL˽3���w�	ܢ�v;�&�;������i�\DЛd��t��C���s�1�����ᾶ��e�0�pD��yN�Z�n2E ��a�#������]Nle��o	���kÑL��ܨ1L�e٩���k!Ho7X�ގS��<ɈRk;�o�T���ye���ʺ%@jme[Y�pP�\2����H��d&lWx-�7�������2��	r<�.+��L�
Ϩ_��tu�@ϴ�^��/M��1ܴdG�v���;LV&tL�9�+���=��8y��E���m�Nz�B%�.��G\K��Sڗ��d4�ax����: w�kM��S�$���	I�1$�!�|��B�'p}'�o�8�9��%�jϐ�I���MU	|�u;�'YDg�s�ʼ"I�%n�H�>$��Й��dT�ڍ��TUV=���ה6�݀���e��&n�������� ���||]?����Jf�����^�L�+�iF}��2�D��L���U��
Sm�uI-�َl8���%����iw��	�l�"�gQB\�v�Osm��]z�<vw�2��&G}�o*�U�D+���X���FjHnp��09��	��2
� %:;������^�O��CD��@"[f�p�I�nޖ;�� .���m�^�qx0�?���&��R_�
��L��1��v)��i�3٬,�����}�3/۲�D�%�����Qp�B��
���*̲A#Tt�Β=W�Fb�\��[h�Y�ڲ���h��*2���~#6���pN?�_,��]��� �τr�%��8x?�cy7����	�oI��>%�.i����z��Y��,
����8�������1{d0�X&O~�,�_�-O�ݹ���-�8~��{RV��4͆�k���}t���%$>�ysTC5���J��t��94*�MxT�q�"�}�|�����f��qmBW���֕������bz\j*���p�"�cb����s׏�$nTf�ě%P�_�1.����ş���������x0]t���oq�&���wb�|���pr}(7LOr�Z_���t:&�1}1V(��EaQ�ɋ�l�L㉋�5��7��TA�\�Q_�[J0m�q��hwD�t<���Q9yA�$�X+��L�ȣ�s�$�غ�@xQ�抦����A�u���0���G��� }�����0
?��G��d�gK�������ȓ,��I��#8% P��g�(�3	�kU+ 6H0����n��"w�T]�����e���b6þ�b:�2鋁�V�]��= |� �{|�~���˙��H��2{�=��s�����G	���	��*�SoW�FJkLϐ|����^v�f�V͜`��Y�3뷁��&�x���-�g���}��uJK���ko~f�h�c�����66H��O�i�ŇR?�\5��e)9k�]	��E#V�⦂����Y;~d��D������d��

�R�����M�]`߁����#_��Ҷ��6a�#�O�'7nxȶujo}3���}P�h[H�,�?�d3v���P�$�������t����|�~�=�����s�,��|A���U�:��me�$@��]�W�����'��r�?� H��j#��`e�O�u���N�p=-�W�$,Q���q���]ń�vۯ�8������S��Z��d;���G��4gF�ۀz�\'�TD,
�<xb�V�L2�p��ܞ��^�����}Gf�?$mLC:,�WQ�L��D��T�|��cC��y��m;M�Ja��~H؁p��}{��&��G�k�#��u=,�l*	��)�����Ȧ��7��d�"��8;��{�l�w�M�i�����(��J�جHg����I�k��d)�f7K������F���tm����Pu<��iR�`#S�����m�i`��A8G��|���3K*��0���X�Wj[Zg�m!��n�$������l��d%�e�dZ6�4|��f� �&�� *��I5u���߼���Af;�MT�3���+���L,/�j76��J�Ad@�-�y%���U��uN�ś�����¤��zK�嶭����$��Eզ�jrς�>͖kضL7̈�� ~R��[)�z��嵵���p���v1-�a�O���}��qu��R�k���,{��뮟|K��ѐ����٧#z�rΩ?�Z�������9ݘ���)m�r�%A�inWU�M}���}�q�h��-7O�S���z�#���7^& '��g:�5����)�۠��|:t�k�[',͢p����
犟���� �kfޖ.KlXgVW)���#����`�
���X3��    l+������p}�Nw�Kq,vTL:�J��|f	�ȩ<&6�W`~�󆋰��+og
��r��z���V�f���� �ި��Z&��ۢ�����S����o-l�D-�8h�+v7`�#߮��X�"4��Ggiπ3�-F�4s�ܳ>a�':?R�|<r�cokz�e�]e�ʛ_��:+$�T*���=!���-�o@ �f��zV/�7C2��4�?y��d�|���~@5̊�E?��I�P��&o���!�_��\��0���T�]��a��􉯳���	�@~P%s!љ�̷����me̪�p�����p����Eص�z������`:�!��iE�VP��;Ә��1~!a̅*̡��̺��<2�a8����5���*=}A����W��H'��e-����<*z��{+.�P7�~�֣��]�#v�7���6�4%�D�����E�.�X|�[����>�6f��|�8*�c �on�<OqS[?����>ӈ}EZS���&jڗb�;�O<����K\ɹ�tu[[o�
�$
@@���=�P�4�3�(l8�$[u8pH��� �L������;����f�1l���
ׯPCe{<wK��H �m�k�<ʳp?�ݭ@�ߎJ;���A�FeW�h��q�9ղ�z��p0t�b�9��l׾")�UqZ,�g8ʟj��["]m0��(�.��X�KKN\7Z�&�Ո�9�G٠��%Y����x��$r��w���b�����nvQ�]�y4�oJ�@� �>��$��9."<n2�����Sh?���L��p1����_I�Uba�]��M��Mǔ�|���Y�@8 ���p��.Dt��*�?AL���"]�v�|�7o�����?fs��)��R�p�V�w���2݊�n����p{вd5�r�[��8��m���,@��~�Q��f)a�9�"M050��]
]H�p�ԛn��кh�����n���XyZn��M�j�aQ>\��,7��Zw�3�;�΋�ʪ����&O�!o��f1'K�&�UE 2(�
��� (8�k!�e5x����Bg�; D�4�0>M�w�A-2����3�{�p��~V0�����6h��<�y�9��$�-�<�&��4��֚�Y^��v�%Cj-7�����-a���?����Tt�{Q�T�OCp���ao�(��#˓ݓe�R�����_�~FJ� 6v������QUJ<�b�h�����q�a�6g1t"�aŵ.���)}�T�ՔF5����A��v8܏*�]�|�-��>�e7,�"�)'����B��v���L;ݔ;���k[���n�T�N"vk�t�3v�4Q���z?mY❴g|��A�(�L�g����Ĵm��4��Z��=@ӻ��j!����=�{���u�#q��������0�X�l�Usc�
��U]v��)�F8���L�I�C?�f�;�lϾ�v7���'S���>��et���	���1�>�+���|�:f��`$�.��_s˛ʌ}q���u�}PQ�$�$�r��OA��:���e�h�����,^�Yh�z�&��Xs�[��þ��{��m�Y�@���-Z�$�57����W���/����U���+�14��u�����#U���Rw-ɶq��(s��/��yIH9�D$6���>�^m_������UM���-א�h���]e2���b<����zh��\%�QKD3�p�^��\�KC��t�|h,ȸt�CZ���&'� ��%�-�Gp;�9*�d�U	EӴ-��^[��@�t��d.�ˣ��#[��*��/�0dg�"�}���7����x�>�,�La�~,���+����Օ±4�X^ˈ)��$4_A�B6w���uTq�G�������RAsh*%o$|��y�Y���v���P��+�{�xyOP}�(e�/��y�2k����7�%�&�|�N���+O��6x}mo*�hR���.��������k��3n7T�vH��N���`���y�;K!u��#hU	Ήkc�dނ+�r\��ʋ:�hp7�a'�����8_>ǫ�f�f���y���]o�nC�Dt��p�xX�����Iv�Zg����Y|��b	�	�]/�!rMި�6��ktW���H�E�P%(�
�|�?W�R�}�Uk����}�+y��F�|���(��h7�ڢ�^�� ^$Ko��*m(���N1 j�U��\s�,]�)
%<���|��YjJow���Wxw�c�5�$�i�:�w��r�˨�9P)�O���+��=�Mau���	�Й���y !��,�K�Ҫ��'���G����=^bn2/K�>���w+����j�ɟ��]�t��� }z:��|'��)�n� ^4/��~ �J8e�z)�ϥp�R���L���p���r���)��۸��l�Ň������.���Z����;ү��M��N %:Z�yu��n�xk�nsV(d����@��v�E�h�g���Lmڗu�>���#>|@A�⴩5��"n���'�50�roaq׽h��q,|O=��Xl91�Y��|U3�QDЙ���za��Z��[֒���5�� ��ߞ>L��n����V>p瞦���}I^�"��:�Kf@�K�@�OQ���=�M=�.���48�W
J\L���>�θE->K���&�X�UyE0�l��g�S��T����q'\�BΨ���*gz��cr��L\b@kۖ'u�g��={j���k��e�\w��@sm�@n��#[�%��%�e�׏e5�r���k���-��R�LI��y�d�M��ës@����3��u�-�:�_��#l�5��t�SBG=BP����c�i���ix����p��gV	(x�,�n��T^g����Z�0:�?���عW5��f�˦�����u����	LU;���F2I�q�����E���I9���Ɔ��� =ƃ�<��c)6����Y� ��.M��'@@���C�8t�o�p�]�}�8[TMM���j}���ew�i�x�t�>�=�cA���I���G]��g��{br*!�Ų-Za�,��n��e����BO�q~�a/�o�����2�v�j��f���.�:�}2�Y�!A�q�"��F,�@>Cv�B0Gy:�B�ś-7��rp�¯�ivi�i�Tm?�茒>� �W����[�p2�=�L+w�f����`N|>�v:b@t=[���Oɑ����-0׼���C��R�z؝�}G���Ҁ� b)(`����+^�~�hv������%��6�˗����R�q*�'쵳[w����`��ûM.�`d�v��������l����_��d^w�X��T\��1�9ƾ�,�粠0ݼ-wd�2�b�LWqؔ���Y��X�p��c��`�O���",. �>g�j�S���7u�}�z��r��|����#2LG~�̏�4q'���~�Y��ɇ~���啗�|(�᩷�-s�Y4MJ{ɪ�$��is�9C�+䟸3��pޙͽ�rcn�fL�Z�;��a��"���{�����?��m��LI����KvP<e�L�,�Af����k��{%z7[�)%��HP*��1�����x:�L�T���{F�k�|�S҉��8������O���\5\oO�
+աW���kW�M�QTn]M�S5�Ɨ��y~<�vX��F��q����t��|��n�jHA� ���lh��ƴL	���-�lU�� ����e߶;��l��_λq�F-`[$B��>���}l��N(|�.�q/�2f��͈��W,�xr������1 L+@�����Mg*�@�[@V���&^�W^��\M.���u��iP�߱qf��k_f�\�n��e<���z0ed�nV� �+m���F��a���/�	���_sX:Ӏ��Zp����+6@WqBx=�|cCE�,֭�+�x��nr<��Ry�E�gƒ�yݝd���'~Ǉ_�,m��)�8�;���n��+�i�.�k�Ѫ��, 3:�qu�x�|���    �E\o8I��2WC�ea��/�*���z�U�*-��ZZ�Fv��mL'���*,��\x�I{���%�]D2ڮ�/d��e���)2�^����zGa-�{��y{��uqs��I_үm���t`��9|=�Xb�c�u��h[�Y`)|Ⱦ&�Qve���m�G��N�%�QqR;��ńe3��̫W S���TH�-��������j�ј�2�d�`�5�}ےCʮ9���au;'>;�v%��_�\ˬ�6wT%�f�I�֐C�C3|%��	�j��ׯK��4M<�����$"�긖��]GSP��ع�UJ#�4)\��%H��,Q3`�2(.�y��%�u!_�X�q�ˤJ>�������,�k��RC;}J�8]%+�0޼mw���?��].<:��V}���k��O��J}`C�_ $%t286�s&W���!CԾ�`���޶59x}�m*9�&9vG���7xp���+gH$X<]�\��,���N�M5F��A[�̶�]�2�\W�	�#Q?2o�߰O����Y�/H\�.�f�@~�z������N&��``^~�w=W�h,r�v
k��u���,>."rMb���i��/������8L��:����K�ޠ����SZ�t��_o�� a��0�j��<���2v�~��iU��������y�1���ƺ�˔êX��u2�P��t3}< �a�3ag��yix>�NM5��	������Bs)��g�"�˾G{��;�L�Z��(�ՔATؔ��IЫ���8н��Y�Y?�� ��?-3p˸�*�žFs������I��	;�����8C���o�����$�:ri�W4�j.���j�� �lX��x)����ZY?�]��ɸō!�M���M%�;��`Ö�y��|��t�t���y�:�2��Z�k���
���(1�+����)DJ
.'h!�� c�
L�J5��ll[鰪���|a�Z��_ �L_�/��+ -�b�n!������3��s����_���(���Vm��?Վ������H���r��`l�N˻P��#�݅ݵ���S�L�x| ���������]��׊��7r�mI./����@/]\Z��l7x�Wd.�!S�
>P@$K6�����8o}ys�=��8��,k����ã^�\��Y<�Hl6���З{F2�hm0�ǧ!72�a�VcC�Ǌһ����8W�1�#2���*?�	ԫBD*�B�8'+O��#* aGҸԤ�,�i*��
S��<�O��2�m���M��Ex��K����-<Un�]ck����'}R�����&��~:v�8��$I>�\�XU�H���B�����,�2�H'��I?#3�\3ݰD�@{���EB����?�F���`?�#u����ҋ��	�P��8e��#Y%�)����t�pF��'�[Uː�����Ǌ�8��K[$�5|m�k�Wg1����0�R�	��͕jihW�`.|`�댪3<SH�I��Ap�Y%8��.G�
�Ir�̶��d?�<�2�tR�����8}K k�6��n���=�W��zK4�u���k6zFs��#�/��o��K�<�h$���@
����(�"����*���e7S��P5����r�Q�d l��_�K�L�<D�
�����LUj���q���U�OQgTc���s'�qe���4��פ��X	�����&Mk�n���qt��2�(��X�����maA>��)��%� ��C��ʵ��6輓���j�e!�85;���Ȍݢ F�K��"��i|� �u���\�����^+ �.�K����K���w'Hn
�PU��@�(G/�1h�C�1T,�4'�m�]���b��6�?�����O1�b��y�K�1oL����!�"fk�OO��n�r����Q���'tܦ	��s�S�?΀� N1��p%4$r�F�d�l�|eU�#��7Y�~��UC�5���w��k��(b�gѾ�2L޶���e��,�;\P��WW�'�3��ŰG�u�DAPo]�0M����x
�?:���p�%\/Ff����Y����T�΂:��uU�����f�$�]���	�{*�5(�+�
i��lp7C��64�x��:��R �xK2jWtҡ���W�\,�x�e��m=�vgLS�i�0kҡ�+�G�O�EK�C#8⻁���ifC���Ʉ��G;~i����L1�����x�s�@�v,��S�T'��5��&B ��\� �-�	�	�gb���sQ����`,ȴ�M��J"���o��r���4Kaߪ?�!]��i���d���	�G�H�1Qt\�a]/�s�+�T-G���ڒ��
���?�����&�.�4׆	Mv�S֓��y>.����^m�ژ�9J4f�����D�*��!��ɐ�Hۡ��y�m=ӕ+M�mvW�uۼI��e8�?`�m7[��=�Ŋ�vX��,�HJHL����5��%�X=�f���x���nxr0�z{�S�t����(&V����氩-�~m�ͷd�S=ͼK�G1���x��-U�����kCW^���:��%�"i[��'����fqJN������e���b�+�t�i�_!:�c`KŽwfw�]����{�/�#'XK�J'z�A��1�J^��tE>-��?J��#�2h��C��	/���Kc�7�P~Mx��t�kip��은fd��^%oa_�g�:y�ś*0�pid��W�?��3���8�� x����/�5��u���a�\زܿ��i�33좎>���S=7���dd�J�=��S�fU�[�jq	�;E0_ڎftޝ��1�����n෣�Zv���gus������I7脎+�TGDZ[�X:����jL~������M����bvF;�
z.�sL� >L7���Ŧ�	��55:!�AS�*�?������|NA���x�G��m�%H�X7�w�O"�xG���Qu,ﮰ;�7j�0n~d覕����d����Ļt'.�x���7�3E}��>f���G�+��Jv쉲c�#E��2��A2�������Y|�g4���_�D��3�1�?Z�U�T�=eI����$ۯ�8��Qr�/�"4���VO���U7�*�������w���_�����������P��c�3���cؽM��(� ��:�&�N����)ԙ<��m�ΡX�PPUT�$���/���+�/JX�S��KM��u �^Da�+���/yB������rp{*�������J ��)��jRŭ+��Sl� �5�v��h����q?�\^����M�ƃ{z9��ސ����LS�*�������X�&�,
+���?�e��������n�t��w�gY.��;/�����D�8ݥ?Gե���-ԿQg�T:	�'2�(B�f���������-U��=Z6;m�,�Ԕ��OgA��2�h	�t��k��������S!�=�o41ue�A���g���9���u��e	7��6#�Q�A�͎�g�N3D�l����J��e�'n� նE���:�Th ����D��=ߴ���u��euN���5�����.2F2��tTA��>��'X���g��$�w<��m�M�4$H`J92�
%艝:O39A@�e���Ҁ����(G�:���p�+��'�Q��I��M'Y�_M��;%���eU	(��w��@�K=e;��)��2��	�\O3�"U9_�_�]�O(�XX;��.<Ee�m�Q?wL�Я��	�Z�]�$BՇ�/�j�&����4ei���m�٢[dcF�a$���-�~�T�hs��C�T�������s��!��苫P��M�LO(&�\
L�r*�y�5PϠ�Շ�࣌P�u4"�eߕ��۴��������a��ބ��9�:8��l1|e	 
���eC���8Ҍm2�@�x)d�<�OKx���̟������g�/j��g���_�=�`�Ai"\@#���Ϙ~��U��w��rm���*GOJ��X���
�&�L�> �   MW�%�[y�}�)^�o��\�����	uTZ�Be5ѳ�	=U���S��		.��l���*:
u2�vs�m�����_�PY�-bhh��l��%����?E�y��8]��rPX- �T|��)[u,��+�ڤM�>R���pH5k�g������?�Q8�      U      x������ � �      W      x������ � �      Y      x��[w�8�-���+�v^�2��e�ёbӺRj���);1c[ʒ����� ޝT�8�b��u�NWy�S �����(J��]G�(�DKN~��o��9��/��1a(�O�!XJ�S��T�,��7�����������2���,����.�_�(��߾���3�__�F������������!(��������<���1
�����8@pA�O�*�|�t
8��0�����B'���.tTA�ܬ�U���_,��P��FBL��)~@��,�DcF�0�>���Og�t��{���:���.jJ��lW�d�yi��.#�Ƌh�]^nRH8���=
���r��4�|@l�EB�A��7[����D�U�m�������R]o6]O/��.������"e|X���,Jc����#��rIC��� T��	Q�P� ����� C�����>D��hy[�Β�9T�����L��(�$Du��*z�s�1�.�}�O������P�("G�z�OQ��Ө΢yY+�g#�.�-"�2z�V��/Ѕz�����o±���@_i�̡~M8� ���D���F��<�^E� ��?����)�T�|�����R2��I�'5*̜��(*���b�.�l:��,�<��w��@2�S�9����1�*׎�(� F��n�U4��s���s���S�[H1G�<��;/��}	��ȼ��d�n�ȻZm6� Ct������|�����h���b��gy,��+LQ�ZD޿��j��:���r�%�fB�"Tl���cGYF�������J�n�j��h��R���sG����C�"�}��OQw�@���f�kH�3*b~�d������w�b�r��Ҕ3�1js���GS�Pe|	X�GEԱ���A=8Q�+��_ͣ8Q�N�:�\� ��:�ə�	��/��C(�u}]��X%E8�୓�e-��r-/���
&�6�T��H�c���M����o�J�8��iT� oe�oT�g�����to:o�i�8�?R}� ���6�$g� ��{;�w�-����U��sGabt�y��`����:g�F��B}0/�L=���'�&�'i<�.��SW��wL}8w�2��?���*�Qg/����l7���6�kD�?E�~�|E��7l}���o�^��ϼh�ͮ���%�mr���奾ρ�Ǝ� g��%�������Ȏ`�۫h��&�&���NTR�pMoy�:�*Ut~)	̩�~�2�3>.$C���o]�ҥV �v�ҌH3t�
<��ILHѥ5����Ia�v�]*�����K��= ��`���t��ً뛲��:b\�v �"��Ԥ�b���d��qa7��M�h�p����|�����(��rԧ*�����Y�%�b��5��]�"�C�>m]�s�j�����'���O�	`*ϣ�5~\�/UVD����ѼH��8"a�a="	��
����\��0
U�l�U�ץ��*�B�˘~�O�
"�SԻ��^hV6S��(��Y�$��X�C��I����v��[����DP���o��m��Pg	]�:c%%�?E�%VX��\h�XQt�]�އx�>k��6gLӫ�!D��OQ�:/+��6���h��h���u	gӋ�b�,u_:WG̷��/��HA�3������u-��c�����$�pXLU�Q]�3<O]l'���Q�Z���upm`�L�b�`qH���g�ر9�xȘ�3wǞ)�SS���$���\�u7�"Z^G�rz%��I�3d���;�쫛�[���h*Q]-�����ӫ�`���� @=疧�+x��0q�`��:�Z�էl�ET��\ذ@'W<�))�v�}��
&�"x�/&�|]�*�:�O���"�"��(����1�@2j����A�G�2�+��I����Ec�H�S0Ʋ�tu�Hg�E��Jݯ���5U=Rx���W��H��o_y^%[�h�gY���W�ɺ\}��畜�Y�P��\7
K5���u��1DWQr�k�l�%���|���R;Z��z�n`~��M����Ub�C�^�2�8�8v��V}Vhq��e�h,s�����N�8�o�^�*VOKP�̀��4Q���J���x��F�ҤNDH��!�u?���2ӊj���T؉T��jb��Io��'���*>&�U��.��>�!1VP|0�km�d��wz&��*�ߪ���V�Q����n��aSQ������:�0���r)Zz�
�Zh��rU2�f8k�ڂU1B	���jY6����241ŵ��ش�2�X9�A��Q��9i��~�.'�Ż4�|�T�[%݌����%��B Yv�� 'SUy�u[O�55+\��	�ۿ����-IKq�-��xz�.�܉;'6D�Ha�N�p�ХլR*���Ud��i���鿣�6tn��su���Ve�
�4�w��5G�Ժ1�%��l�Q]�H��}��<Z�a��4_.V�);����b!�O�y�_���y�c��u��rݗZ�l;_��>����BH�0,�K'�p�f�-�RSp�{UH�����9,�Ws���V�1�*���Cu�mc��!����k�F@�V�`Ve�g���R�|�FG�X:�|}瓹�\7���Ү&K=%q=����d�n:)����x��Qj��at5U���`7Ge��^��m�ZgV�0mAh���0$���cOe����b��P�❅���z��n���-�H��ie�T�w��=s̈́ř�ϴ�����T~BF�b��*D���[G�p$cxi<ӣP�bh�8p��Z	RLR���D�?�!�^�V�$��6�W��b�q��s`n�q�ڸ�#���x~1M@PN}��
:7i<���64��i���ꐔ9$�o���N���f�Ac�j���/��ƾ�Xӳ��$��~�K�;�#�Q��X����������d�� b�� ���F{��I�!��k�}�ǳT���C.���^��wz� �FC�L��p�|� �*ϖ��S�kt�Z�R��{���>�zq�2�||G�c�a{]�G�qOSH8�Ѫ�S#$t�Ǌ �u&"A��:���E���Ǚz���k�����SK�r�A�[o7���Z�5f��u)����XgeV����g�+������j�y<QHFh-VziZ�4 i;�pͰ��K�{]p0�K7b��h	\�t�QH�0ol?��Y��ˀJ�,R�Kʾ|S
��1dh	rI��j9�l@�[x��g4���J��j+o-�1~\�XT�\�^oubȱ={���l��9{v�5:�Rw�v�\59ـ�3'�P��V����}�C�I]Go�����y���>�I؍T�>o�ޤ����A>|���%!�v
Y��&����^ϱ��R�C����
b�:�[;�\�i:`�6
�e���r��?��[��}�L/V�&���6i(�!�Í��ڭ��M� ��E��t����%ܳ�@
[zy�9^�>s�Fۍw�U97M�i}śւ�G9o�[
��1n�H�hp՛���3�M���}��Y`��Vz[����cH/�~2��J�g�=*qU�g����e��� M��YR���We��G�������"���.�z�k?��ba���5��Gq�$қ�Ѳ�����c�ʊ����$�7t�GF�u�ZD�&�n�g��Pb�p/A/Uu��T�%B����ToӍguN.T"=M�x�}���4�?�&���0H��o�^�.QWӱ��A�YE̠L�x�� �h�Z6l�x?Z���-�W�k���|��y�z�B���&����"R�d�J�����=;�]P��#��"�б�xdՇ��j�;�~L����`����_����v��J�&�ە:z�M�����d�������FQk����&&�9�靃�5u��t�H �͕cN���/R �;�����R�v\\����\��|���DP����-�{Ϯj�ĸ�{��仺�獛��P�M'�oj�w߃Ȧ�����ƊF    qr��_g@ט���t�k$6�W"����?z]E�I�ե��b۠`YA<waJ���	��;�m���+o-�0�HA	�f�L�W6���g���!�Įhڻ�)�	b�n�$���7�����mkn�C���0�ĕb���~�9"����mK_�W�N���aSk�radl'���eo�����h�P��@��P�N ���*��(n�uto���j9��/���b:or&�ޅ�;7>B�w�YP���h�ik����59g��d�<���ǵ�={�0l���l�$�4"�~��N!'́3ϝ�v��\�D��p�l]�Й�#ri�q�-4��Y=fid��8��� ]��1!�]f�i)�!Iuo�1 H�</ݶ���k@����- ���� ������|U�����ް"������޾>{�Ä/Ի���zG��gRܕ
�FP�����c�v�.��NE���NcmP����h�6�+�5S׳�G��$V��v��m{�L8��Y�T�D��cCR��Y~8=yI���kǚ�u-�i�ܣ��>���(���f����] �ٞ�@��]{/A �&8�z/~�=�AH|4��M��X|�]D�����0�L&���L!�fz��eH���֍?��D�զ0��f�5��Ĭ���(�:Y��������#���M�,�q�Lbh�$�}]/�\C��V�}�s?|*Q�.o�X]^cG�2A��뮺���gIk*/,7?�6+�0g�b WX}x�oS�]�0J�?�œ��6�M��f�2]���u>w$�d/㦀�Q�v��dD/q	P�.�-1����2��c6X���b�Fo���[{i|]��D��ֳ�kF�t�lk�:J�#�)��4��k���$�����n��S�L_}�u<���iXPs`�/����ַ�[l�%՜;S?��DVz54ZZ*�g���姠����z��P20=��ϩqE���+�&�Xݬ4@RR]�5��G���jPY�/5=���#?1\�榃��z!�AxeA�}���2i���8{�-ՐC�i>�fw�I��ZKxu�D*U���Řfхnы0��jL�_��@��Lh�jA��e�5=w���k:�S`V�"J2;�R�x % ڼ���ԯ�6�ެ8�\;U�z���:��`�!�i�5�p`S���~����2����h%�� y,NP_n�ߨ��Ћ�.i�O���5��T�����x5l,4�-.�E��%8�A�I��D�4����ڨ�>�S so����$pTd�uTh7	�z�-�1 ɐ^%�n���t�V��@�Q�t��e��FȘ���v�Z~>R�&ӛ*�8B��E4�]��Y`�޶���Xp��/��狡 ����.r#m��U��[eӧ㝑� ��&�j��r�3i*�,=��ɣ�IُG�g�`��b���@K@�/��	\�U���7l�eO�$��=q�h��X�%W�I�������#��9�&M��<#��@��Ѹ:�����`ZH�uƐ�$E��E�J����W���_^��
�Z��!�?z�\�%= �k��@�jp��t�H��^lAm�ӹ����.�����j��[��J[�(��r�C�iZ��^�!���@Xw��h��� :�#(�6FG���N�7�M�h�y̑�%�Y �P���nV����{�ͮ��C��(`WY@B�	(
��ډik�(��Y|r���g4���PQ��Ty(�6����q�,P��x�z�LJ�w��eF��3j%=�W��q`*A��
��X��$ΉiH���6�p�`��|���*���^4h���v F�I@ݼ0�f*����>��M7��F�Ʌ%9�$��B��v�]���7,��Z��Lo�̏��lm�^��8p�	���c(d�l�$�+i�K��Z�2�l�ߓ�t���a3ub���I]F�5�ݵ�0�ca��zZm��Xz�	Yu��T;n���z�w�߅��w�w��kL�0I�+ �jncS�Cs3����ĲCI�e���uL�V�J�Xs�+���}6�p��O�͵"pQ����OBZ��f���{�D���z` ��srkނ�h�M�Ϊ�|f!�;�A�Z30
�A�G���v�V��*����|s��\P����k���~dq4^�����[o�M���,��8sziP��9�?���h�T!���6����R�w�sk!X�_�x'v�@3m߯f^����J[�Y[��β�V��Gt��B����j�j1[h�^B�z76�\B@ԣF'YLʴ�p+Ww�#��xA'h�Կb��-���Vt����̷�!j�o	3Ez��\n��/u�rf�~���i��L�����M��O�>�$�{�q���l@�Jn������Cm������5	��4J�ds����#5����Qf�hT)�iq�B��:>�`��ĸr���E�xA榙�5�"nU����*��*@#���K�`r��@Y����U��j�U}A��
W�_F	1)��gS��?ǋ�*�+�̵��5�7}&8����p�>�'�20x�`���v#ɌB�ש�.0ZĹ��g�S�9�o3����>���u�S��V�$�w�#Py�%q�\�%[�u��
u��4��nکg���h?	�$�t��U���8'f��[�����:��Ry����k���?�	<���Y�>�6Y�9^^�MI�@[i9��9��wP�T�s=�#N�X�P��=yϣ���
��?���5�)��ZPe\k����NU�M�^��p[7�4c�u�&L����.j���
1B8Z��>D��m���"�1g�ѱ�0�H�ڪ����s��S�N��M|����NB5ßsKH+�`����k�;S
��",2W���D�y���)�S���i7Q�r;�Џ�ѬJ��h�mA��_�U|�M�ߖLg�@����a}5�8o�[o� �-YM��GN���l,$\�6׍y�B��S{i��Ǿ���'~��4�m�I��]o/�d��Z���z�C�P���[���ͽ�����P_F��j�̡ѿ�N���x �(D;图Go����]��vM=}���βw�nk��_x>��UP��އX%mk5�8�`� �~%$�����?�J@���K���੩��4��]Ҵ���~M4\�sQ��[Q���9�1K(�|� 0�D��TuZ����|�o��%8������s��� [6&ƕ�a�� �|\��[D�=eAz�k�*a�^���=�?_�@��*Qq�������p�y*�Uc�`f֙t�.�#����w!��<��"�-7��n�Vv��E*`¦�f��9��U����94N��.��ͭ�o�r�u�8�SaI=�����OwL�?V��������(eF�A�ҷ[������J�V���G9�o��lk5���t�ꯦ��
O�qx)� ��D��p�����CT��8�Y%��]5�u�k����Wu$��η��?�Ώ�� m���v�ݮ��� ��:��GW����ɪ�p:q+���[����$��ʻ��Q���+�
��J��++�ʌ�Æ	h�1#��3�H�*��|M����8� o�N�s�>xU�j�<W[j��%V#O�R���=��q�I��Ѧ9��@�;
n�(� ��/7��r�@����ݯ�P�v��}��8�ͩ^��-Lά�o��6��d���YD��>ͦ�4s���S=�񹸸���̞`�|��l�����p,0kF��\og� L�[����H�>Dq�U5y�l����%�Ғ8zH?��%!e� ?R����_�˪�F�$���ț���l�NV�P�+��Sʰj�
�v��?���������Ӎzs���`�QӅ���E��Z�����������񠅋�N�Iwd��R�����;2Rg�`]����~'�ӵT7�:JnVZ����0N�,��c��[��|+�[	P-���38�_.A��>��˅Ka5��f�������(��U�(���ޱ�u6t�~Xh��핸������ 9�ު�ht#I�6,Bm�JZ��@1��hY����oׂ�    O������Kc��^o��h�����xa�Yb�=\f�B0+�I��GP��@�2R�a���6��j^a`.��\]�Ng޿�M4,�U��J�����uR�5]Y���j,����0.i�-݈⸞+�R{,{Z��Ӎ���r��U��J�
X����>����uT��y=��h�ПY�W3��(a��1k	3;�K�\���X��p������{f�mP<�F�KAb��+E>.P��q�7�f���-�^%C�<V�Y����KgA������,�a�8.\�~��m��h�@gwPfP�:��;(!?�#�!�S�η7�J1�u��Q��PY#���?.H��kPW��*}������qq~Z��u9�b�V0��á1���z��hOU��ֹ���Kc���ƕ>Ί�*s�L��	��;�ya=�%w=p�������Z؎���
-l��$j�F%��ֳT�m���M�t�JӔ����Ƈ�Õ%�Ĭ�=*=�LURU���f*Y�mQ� ���3B(��JnA��}-,�f�{HK�P����n����`��Q�H�9�c*,(��4Ό�p5��c��B���(^n'@�(I���0+�w0�k
���<L�zJZ�H�P���������������d;�R�lQ�a���*aһ�z�����c��! lyZ�v����M#��
TA�B6%A������q��a���R�T��;7K���'��W�t�##�RT6���u:��i�>��7#m�h����ԋK�xֵ�}���zB%��)�H�r�w(��*��	dM�Mg�|�*|�݋Mn�P�V�f��g��b=)ݨ4�6�E|�B�f�a��o���泋��u��O���bT2����ɓ���IK~���0��o�����W%�{]3%��ʋq�{��9�?���T{X��������ڞ���s�,5�,��^nⶓpj+�_;��ݮ.#/��I�XL
8��{�����E�$��g�L��Mn%���ۥ5��SYp�e-1zL��R��I��"o�M&�0ۂ��N�l���͖
������h�lP��}���d�;x���mښ�SgE��8K�S�}�'��(�w#D6�3���3M��r֘ҕ"�-�)+7��op\Nr�(�b�n�sv�����}�/�7 �����Q=���&�cA�P�l�4����um-��A��R�ǂe�n���m:]o��&H���.��SvN�TaZ���
���)�4nAU2�z��Q�Ci4��·��x2p[�'�@�q�BPb&�>���o�9����ރe�g����_9a��>�T���ܸ�ΦۅLP�����_)k���E`�hm��u�GL��܏'��<�bX�D��s�S]�b2�\{�M%Ӷ�"�����a1B41Z��{��d~��HU��R4�� �Gf������wH�B�� �e�.�3�J.�o>5D�Ɗ���� ��(����&Q��fq�%4�ѕ�95dRP;����B��$��O����f�U2��U�m�V�.�ŅnE0� ���Znof�����1��>�oDǰ���oű�����������7�72ߦ�|��.uT܃�	�?���C� ��-!��5ӳ���I<�7�zo����*�6�T��݌�:���7�+��.{r�hs���V/Ix�I]��l�Jw�6F�ӝJ䏔�Ə�@���B���(Q�2`����e��CO�I�B�����_�+�>U��e�{�d/�t���Ƴw�[+87��U����������<���}���N�E���Gh���^X��B���a.����g�L/�D����O ��"��6`R��k��+S5Z��{�1���uk#a��M������I\��.՚�L�>ܿ��z��);�r�g�KTj�+�5K�R��զ��IF�&A��C���y�S�=���JR`j/7���R��n�����(==���]eA�J]��-�qS���������B��<����u�G^�L���o������/yv�{ۗ����'�0����� ����C~|�w͑)���.u�I+ԯS�2�t�1ǂ!G��ǽ�Ξ?�ԉ\�����i��n�k�q��}��-�A]�!{\o�@їܛ����"v�n�n���ؒ ·ShA���۲����_©[���f��L�:�e%�A��/�_n����h�x�M�o�;�����g5���<4N����z�Sg���>�����K_�����魂��t���u6ރ����E�OGU }=��s����w�"��Q#�*-��մ��Ͻ��0A7���QeX�s^�͌UKO:�̈́� �ғ�X�u��/E�
q7�.;�R�bu�ZN��
�>ʁc5��U����4�U�$���m��>�>����=�q����.q�eM��#�4D�s�x_��՝�5���j�B�]�eh�-�����"X˸Ӑ�3\��i_ ��8o0F�.G���K�ǃ��v�tځ���0����u�ª�K�^����1�����C� e�]Es��O"oW���БqlV�nm�2��Ȁ�z-Q0<9V��
f��C�Jm�{��B��[B�fV��U���
���T�彛�����R��i�G�(���&,!;1�����ۖ�;v�i��(�P_P�����j�W0��=O�Z;�}t)��ZRvE���G-E�n不gU����S)��
�A1��59��&�hQ����u�O
��}}��h;
,2ɨ������T?�����5�y�]�]d�'�
�h��6�Hۮz�2Ĳ m��X_�	�?�?o ����~�%������t�N�:.s-W�]� �\�/��O��<@�(��{�!W�m���^W��A]��D��A��V�6[<#8��Ȼ��	�:�Z�;6b�qA0!a�i�!*�&{V�z�Oy�Т�G@�#��0P�;��G��t����c~lR�G'L%U���1:a'ؽ�u�b�� ���t�%{�[��X�|�cbz�\ӭ~�A<&P�zK��x/��F��B!�R@��ʵom�	N�L]�P�-M��jX�����Z}�Z���l�qB������E�&UB��׸A�:�r>�\�X
�R���V�Žǿ��+�U
��;�J!C����|Ts<g���tqQyBw3�#,$m���o{)�B�<�] �-==�03�78�]��mg�?f��8(U�V�O5xp9������x:"��|�LSo/��Q����?��T3P����ߔ]�� ����E��xB�����9��0^�ӡ��е�c��q�+jN ѫ��0J,������5�6U���T� U}E��,�	Il�x��Woz���]��g�o&g�,}R�}��!J�&;}��7�ݧ#���z+��1�HQ]�4?���Ν�}��;k�e2�n/tLXhs����a�6�8��k8e&�����ΠyLh��C�*�o����78�f��ʃ�h��&@�	�Yg�t<Y;U��"SE��������T�D��i�ha,ʹ���o�B�	UUy�������i��
��M�^A�	5�%0KxkP�M�����~��-N�?���4��P���})u���=/����"����"{���>{k������Ƙ̈́e������3���w�fF��oД�u�,�϶����/W�P'��y�Bau��7���U4z��y�v���s>�A������:�t�(��f<�����9盌i��|�������.{�^�����i&��$L�R�D��u4&8?檰������}OL�][��L�f�ݵ��!�>�T�y|m�A���;#YX�r�kp6&$R��������K���LW�����d(9Z��0�E�ӟyS��dZ��K0��ȴ�;���ԁ���VW�:�����Q�OM���`4&0%*��I�ݮ.o��c�߰s������b��#B��h�2���¸�b���;��qj2"�ǵr��:$��Q�/���\n�.&1~u�I�M���*�Cn���]�nV��e��fI�_ٕ    ����^i�E��Q64)Z䏇�΋>fw9�6�:Zn籗N���$���ǻ.B����/q98'����G5@�S�E������
(k�=p���i�x���ۧ� ���!;��}�L/V˲(w�0�
�P�W��p�{9#C�a_;�kZ��ٚ�w�r�%���#�1��Q����C{��y�nB�}ner\f��ۃS@�����fq�Y�i�D��� Dj��3�n&�z�=���T����儗8Ox��o�{9�-�Fb�`R����X"��s�-w7丸�am,YSn�/�B��!�z��w{��Ͽ�&EV�W�2mV`�6��;��lw�i��o�GS��$̤G�}��2m�]e�`��wb!���ߨkfAh�p>�[�Wo������d},X��~B[NV<lLG���E����2;��|�~��"�G�E�8p��oM���C������1_�LW�	4���U&=r&r����@F�Z��M�ֱ`������_��W�i�YY0��HAz��Êz%�"���cS�Y~̞KBe�(�M�3g����n�L����i���p%����b��hnkPl�ji��ꉍ���[od�Z���.�rf�@���sio�H{�F�����	:�a�jb��_�D��E����������0�]G1z'@w�u-�u�+�^��q�H���7�?�w�7���,zo7�@DY�ގ�"$;tC�咅��rS�>���;���H:�V�i//��|[�Ν/���Fzt^]v1jLCUL����J���\��X���n�-7�������J���cc��c�#�$���Ty%e�ݴ_U>>����@�m�o�9��tHa�u���<ט��:�mhO����o�����K���V>4�3�Ňo����*�1�M�S%�v눀��v�?��>�d��8 ��!��[]#��e"Ko���3��M��b�ܨî."/��4NP�u:j ���^�a���Z��?c;����~�.�Ņ�t�������]���Ye�1�0>!e=n��� �����A�(~Ξ����M���4�ЎP
��/�*4�
�m�ݟ��8�z{�&&�$� 0;S TZc����M��o]N��t��*����Я'�����Tm����ֶx����%Ty��a4�q�����`�(�*��з�NVq���f�0.�͐�!{x���>���"3ђ��=�P��K+�t�������CX�lǁ6�L`q�X]���z�/��=�N��=�Dt�����>��� iD������w8�L��wm�&҃��4|<T)L�;NKN��h�n� ��F0�s���f��C(����0p)_k���[���g�)�t>-�_V��I!��~�����ҍ;rBjf���t� ���'�,B;�9Ws�CAjU˫+�8�(��S��N =�m���P��s��L8��}�w�uv�;_�h��./��(Q��XI��5p2k�m�LZ�Fm8�M�L��}k-m�%�$eH����a$ ����Wwj��Dק����)��!!%���J-�+�{��qU�h�U)7b	w_��T��2�����6��F��x:xּ�B�״�hj����_�VGy��<�����]d��AE	q�|�%��[�V>3�珃��A�g��?�e0�n��0&�E2W������mf���G2Py���i�]��xcN�������0��Y4|Gx���)�x�����6����]�F�H쇕M�V`�!C�I��vB���"%3�Le����>F�8J��-%
���ޛѢ���UK涹:p�ZxI����ڬ}Z[����ZkmaGG���'�i��9];o`��b���������`g��r6A��z;+��+9N��V¤�O�4����	���^�����"p��E�E��Fݵ8���.J�*,:?Ê8�-������Š��jj�es"M�\��e�W�p�&L��7=-Q=�{}��Ȯ���i=�[S>�܉�>pUF��! �HQ_3%�lJX�)}ϲf����ux�ǰ�7
���mhv�F�P������^�t�Rk��7��O����zŇ������G�Mr����!{>=��]{�]��U��C�k����#K�La�W���c�Y'��8�R7_Չ���f�1p�z���wq:�d�b�s��I�XS������1�>Z�>�{���O�omo����/t0+s�"���,�����NG~�^�ˎh2]D�J��u�T�8�Px�k��k��a���_�g�1�i�{P�%ջ��Y�z�Cl�� B���
��.4��or��it��P��[o3���8���^Ow�~"4�]�B�и&�M?p�T�zz�z�-^�&�^}!^[���R��*kKͻl�w���("�eV�(�0A�m�?�tj����饱�`z$ஐNM,�am$�^�8��Ny�^O�*`�J�:�v�
�V��޸UV�����D�/:!��[��b�>���Q4n[����D޼��&�Gӧ|�ٛށO�K~l�0�O�� ��)�d�sG�ǁ���p|�M�{�>xi����w��y�w�m�����u�����"4�D��;�R�0�A�дs؝O���ʻ���Ѐ%(����#���n��lM(q�f��7)PXM�T5�o�~��R��v��>�M��ku5��٫��@���^��R���⿶9\<Ue��4;���-@�҃{�H�*=�zhd���z��}�,U�̓�A��GKUc�V[v�i��
c��K�1d��2�e��X55��X���:SUc{A-pϋ�,�Ơb����X4n1�����Dd�hOS����E�Ѕ��!��e�n��1aH�e&������$�Q/�";>�ZOA��$P��8�b�p*x��#�n��Dl#`>�{�����i��Vk�]��#���&ؘuT�~�z.���.zcrȤ�]Y�`�
6����N!ǂ%--Mf��t4�i���5�䌅��ڧ5"�lG�g�&��W��5/�p�dSi.��e�����X���}γC���'2(<�Xe�GDO̓���1�m��RQ�5��Yl��h�K��o�C��"}U��������g�b��J�Eϥ���(�������?�mj���p��)r� ���R�swz�(��؃^U(�D���5�pL��)���7��B�c�]���қ�ur6S���N�t���[�Ͽ��.�5��Etͧ��Y��=\��o��E��ҏf?\�iAF���C���RwQW4��fN��,�U�x�hR4�}Q�a��!��6	
b.�^��� ]e����5�
{8@J͜+�9@��=��ty܃���â4�.�K�/bw��/F6��*���^�X�d�v�����ߵ�|FnǑ�}�Bn���~Oj�p��Zᩥ� ;\���[6���dOy��"(��8�6�]��:0R5�5�f�Z���|L���bb
�c1ġUk��[�^g���̘&71ݗ2!54��.�kF���#�@�M`�#�s.�zi-7f�:Р����N����v�Qux(��H���f���d�.��B��R�`- �����h����32e�0���|]���Y�-���A:�G3��]�X浵۠�aw{tk���&c��8
Jo���@�,�x:�`�2�h+1��媲�%6��z���5��p<x2+�������,a*���BӲd���v�rF@��ꭟ>��2�5'��C2^�����C��{�s~�3kޤ��2t�B����p�h�����J��9�P+^ie���=b� ���{Z�,{i��p������ى��w��h��(;����;c��$��2Ƌ)�XA$h�ߩ`��R�r'ФXW"���4)�E��i2P�ݫ}wȾ4쑙nK�jV`I5�1L��%�K_&b������a`��.`��oQ�켼�K!U�j���V�c��!Z��`-�JE/&���E4�����pTu�Q�:�$�d�K�����2�\MJ�)luI�6`�gt�0��4��z�UOm�s    6]D��d`���}�����I!ߕ+su����2�o����_��O�R`��2�g�h��������	�3A���ڙ����b(�l�k`*� ��������dB�Hk4��B�(`}m@q��z��Z����I�Tg�{�H�-�.��a6nϭ	��:�v"}�E��ԡ�D�Q�t&	���!WG�!{=�dsE������m�+���8�
#E��C��?{ٗ�!G�h>]\�%Dͤr�[����}Q;�O�q@�"ą��e�Y�z�f[�uRw�.X�F9�9����(2�T������%�o��E��dN����mUdaTO�,�c�
#��<>���%{���~�����$u_�V����U���B-��_���&G�s��C��.�ܗ����ؽ�j�������@�(o�'�bs��[Qu�H_��b(5E ��`]n�MnV��ze�6C8��1��]Qb�!if@.���¨R����pz�ޚ�?������B�� -�J�&�I=*�M���1?ԅ����KZ����>#m)D�F�PA$h�cͯ������u���!�cŏ~w��Bk��*�-�w�?����I�wf(У�1@�8>�E�nK"��Q`�%�n��
��|!��yy����f��sʰ�T�r�+0&�UP1J]�_��w���#�;���Vڣ��u-��﯃�@�{#��<���]�{��v�"V���*7��(�&{�zȟ��{0o�(M�s���(MU����h��h���S�i3l߹�Si���
��}T�77�"��H��j���GM�b]}L��U�����|c_���+,ș��,�~���QC����I+�"�>;�Z����U0��ű/����=-��
b%l�F�U�on�@�a�v��hũ�j���d�
� 0�?~�^r��<m�ZCg�g�Z픐TVc����P���7�r���sg����i,�(AЉ���L�ɻ܋A��=�w��,m{L�F}�ۇ�"G�����u��v���zhiRjQdd?g͡�(Pt��]����޻j��f��X�\,�v�
�q��m�/{=�+}�Z^F)*囝5h�����Z9�A��Q����q���Ijz��]8җ�<TUNx��
8�g���'o���6[Z�E��b��I%��(aRV�/��p�(_JA
-�V	Rw�=�Ci�F}O�А�4H*�i�|��UHM��\�p���ˋ�C0 �����>{�n4I�~.*!!�7av�\h���6��r:4Ct{:�>�����[�1�ؙǰ�4=m��V�i�5�6o�+�<�т�f��wГM?D��֖��Z�4,iO����O�m�4{�mY�>;���+U�]m��͸�C0�9�p�m`����f-K����u�={�*T���a�'�nl���ݺ^]̍z��V�zo�]�?x�.s��9A���>RzL����B[�ՉMc������/�
�ңw&{�P�fX%kdO�i�}�")�>��,{:��[�dڦ��]·�0cӬ��Q���/�jy3u���l�����N���V�i1��VIT0aFJ9��;�1�B�/.�L0��;5-w�f�9veT=lmN�WI��$���Q/��I�������O�Z5\�����|7Sg�Φ]j�:3�I�G��@����H;��p{�{	�nohn/���r� J��d~�������3{	6-�a/�~��?�"88C�G	h:A��̻>�ro��y���!�(e97X9���U5X:��"� �T��QK�T6d��$L��Q�uD��kg);2�/��S��FO���CWF�u��M�nir�(R�Z����W���ݹ���0�7K9�_R-�u�Q��I~�{�G�`#�f\��:DL�Ÿ�P��B4�Kv"˹#�.C���*X�E��mR
�9�w��̭Н_���v?.�W�$9�l��2��b#�Dk2*[Z�X�=x�8�+t�]n���,�l�K({x���v	e�S��2��?�����;��G�Y�$f�j#5�Bw?����Ą�/��Cs��[g��˗���S���3�J�1��D�\�5�=�� ��b����1 zE0�~��O�)��\Yq�K;gg+�0�C�r��1�i�u�����~�B�E=UWRu����BX�W�P���6��d4�R
*J������5�};w'�W����P�d�3���j[�F�%�腦�`����VoK8�bX�æ�%"�Ð�X�,��8ң9HBm­I�}������Q��^Np����hm[ ����g׽aPW���5��@�/�A�V[��Oo�I�MK��l�K��Y�ך�)7:�bJR�7pX�a�2���7������p�y��Guu��]{��g�[[F�P�g*�Cn��j�߳�e�k7=|S9���{����������,��A�[xRJn6�de-�ol)�;�%{�z���ɳ�2^^j�1�r�&�@��Io�_��]�!%��䥧��Y7��@�\K=.	1�$���h���g���$z�EO���#���z���Z&���u��k�>�S �)��oٗ�;�fO���!{ i�w��K;�q��cF�bYsU5=�"Ǧ�ܹ�Ȫ�O/��s��sWw�A`<D���kT��+wٷ� ~l�lz�%��l�:D㮬��c(�$۽�\g���Цb�S(%�tC�Oa�-[���GP����.&5�չF�@T%9�6�]����G}�m�y����;�Z3�Z{cت�0��(M��2 ;��g�)�j@Go���Z��-tV&���j�/��ޔ^9w��u�k���p�aX���<��d��4;{>��R���k�Z�{��b}.��ۿ����ʋ��۰�T���y�$��KX�_-��*�=�')5�΂�۽<��8�
G�hb�ٗ�͊kN�����`pZ��%oG�F#C�NE����Ye��.n,���?�xi��fO��u�͂0���^�;2V Hr>�w�kíXh�w�}-3 ��P�U�ȏE���|�ً����k&��D�:�a$�5�	��?t(�Lwq\A�L�,I�~s|GQ��79�ʩ�x�ZS|='pZ�����aN`�8��1�SG������c#�kb��Q��8����QRߕ�M�w�7;v�"V�=7������X�xCH97����by8\LU��.��x �>3j����z̪N��j�/��C�rW2��@��P/�f/��O��ϝ)ɒ������Nu3��<�w^�����-7�:Zn籷�DI� ��L'Y��驅~)g<bXa���J�D��]Ƶ��y�伮&�hh�%�}n�s�+�l�e�+����� P���s����t��'����1�ޚ?VC_������f_a�[f/���s�Y���I'RX�]^%E�-��q������N���^V�Ɩ;W��g&�`Lk��Xq$(��h��eg��X�����80�z9���g��w���$��h[���d��<B.�AE������zj�h��Y�讽�E40C4�ݩ��{�Ǧ���׌d��j���a2\(��T�ݐd��t��y q]ט��4��Bȁf�	2�ܽ�Y`&���T����p1(͎/:�y�.��M��pl�BA}Z�<8-�]?�w�_����P"�_�rcd+�/��+ �
�k@)���Sw3}$�2��|Z+DF;�qVa�YP�u�Zq�4�c�à��l�]e��Y���<�!���������c���HՉ��k10�E'�,���q��J����?z�Cv�W�P��ϞI��u\��
�7F�cA�V������%NhLZ>�%N�F��qŜШj}���}][�<�?��~灔バ��Q�� �I�;�O�3�����& }�@� G��DF�NO�&�w�mg=j� �ڮ��*^ӑ�)P�5��*��=�Ա�|<%�y���(�A��j�>z��ER"u"��B�h�1�&�{P�Z�����`�>t~�g����Ň���\Պ�a��s6p��穫���d��6@1��w`��b�Z��GRR��Z}�5Q��;�m�/ �i    �:�\���H��nL��Yk���H���{��楧��]׺��j3K����� ��v`-�|�}~�ڜ4��5�D����Yӌ�-����Fm���4����["c���	�dyg���G8`V�Y=��3W�q��Mì=��B��Yx�e�	qm�0���ʓ����$�'V�CLi�U7[��*_�D��k:��{4�k��.ؤ���;k�	J$6K�>h�Ujd�x
_/�
͕Քb���q�@(7��iB0ȞQ���R.��J����+	�3�zP��Z�Ye<!���V����v����a�jŹ���;,�[q.uK����U��\�b?��=��F��=�K�Y��a`D+���)9\���{�R;�*��j��Z��y�ʌgh�TsW�Y��+������u�n��m�Rݠp�U��{��J]�F{.Y]����j��=�,���2�R]-�qA��ܛd���a�����4�s��U;�cM̅@��l�=�^D�rS�9�!���5�h�l!U��|z���l���9k,!Zs#g��z,�57��hB$�	��cCL����	������L��bJ�_�z��6��\pc�1� CXd_�����M��kR9���X���^r/=��Q]�78�XàY�J��K�kd�.���X�yӮE��ܮ�?����}}g����D{�Ȓ1��v�0��3�o���J2t�=������8�N�$�]r��%��.9���� aH�K{|ν�*k>��<���X����,'���Ǹ#;¦��֜����ȫ=�v����O*���}c9���BI׀��q���}�ʆ>�ʆ�?Z �\�l��0-��[��k�=bs�;�X��3+^e������E���:�=������A]�X�%A���;H(�8�ۓna�]��Z�Y�p����G�7�=�^�^�;����2	̢q}����͚�,�1u0� $L_�9�;o�.��JLӁ\���T�����1��\5��Ok��?��W�4Dۯ9�ȏ���Sq�	���dAP� H)�Up����崇&���\~��b@Yw��z�Dnbxr:�Yc��>�,��)�8�z%�����l��.s�	���+�_�!4U�s̟�If���+��u��L/�K	|r�L�d�x�O�1��*j��0U7�Ȓ�!;|�7�.�lѓ1A���:�n�x��(�����߲?��9�O03&F�b�>��t��li2n� `K�~ISƈ.A��.�W��Qe�]����x	�����7��&;�E����p��7R$�����!�$���	�d���� ���`fF��K��?}ѽ��zO���t0D��i�t0�h��X^��~李K��w�j�aI�cKY�y����l����e(�Y��;nd� e!h(kB���p2�E�O���~�w��a���-{��P�݊�ޱ���YP�d�"��+�z����Z�H��wC�Q%no�?f�TR��2��ȍ2��sI��zI��Q_�Xw��;�ksS@�n3N,�읒���!É�Vi�л�����p�c ֗�0d�[�Wee�6������Z�u�E��sCo�HRm�ِ��p�5.����?�K|�%&Y&�T�Ѡ�t��?�m�1��@�h?'o*����xPх�x@ �{���Goѵ��n�^؊��z`Q��[�#."C�����No�����h�-{��0������֦a�W�a�hrd�V�;��YH�}�+~�ln��1�h�@�17M7�V0��%	��[Ek���ǃ���w�p���P 	$�Y�Q 1��
��x���ڞ��k��漙��9�4��v��&�3�mȀbu���n��#'癤� 9�D]�n�F�����q4���4R$����JQy��5��H!lg��zx}LNu�v�koPNU쮜5���x�d`W�z{k�^f(�΢��"��=�9�3p 6�=��\��8���ɷܻ=�e:G�����&��ti�(u�d*|a�(,�z9�v��vDJ���P�[լ����v�tV#��2�\]uu˧�Z�/�xc9��X�}s�ƪ�L9f$E��>��h0�:%< Z�H��N	ї��n�Kx1]n�C�\S�.O;�+f�t*�ۚ�͓��ź�ƭ�o{S�׈��1 ��Ǉ����b�[ʵ/��3�}�uFt�ԏ�k� b���MN9��R!iKP��}�U�6*w���Hgd;U���b0�2sfV3b����Q�G����1?���?� s��=e�KV����D+[2rC�r�h}꒑זI�r���g������Le�O�r���tb�O�Ǫ����w��X���Î��`�l��t���r@x�݄�2���Ƅ�?C�&~0�9<廬˪��ml�8�,J�N�H_�";u�(r4=�Go��g^n/z=իBͬR���85�_�iP~����:4�5q�LJ�"U�N�][��(�Rǂ�2ׁ�BDՐ�0u�PD�U�O��z�>�*j=��iYO���� �T��˳��7���҈�p�s<C`m<C�kxc �N��.o��X`�Ig����)em�З�<LAD�kG��h�`g���j��jq�/Cw� R���>{�^˴�r��4���_BWh=��CX�v��$�0Q����.{�&�B�(�V���q�9rCK$M���]U�@����1f�	���XsP0��u8��j�
=gTa\��������s� r�8_��2c��$C��\	��uc
��mb�'��@7��pڡ��2��t�����tF���FUk��!"G��D�}k!���=ܵ�]6j�
qP��Fh�1�G�r`ATg�1î�I�9s�e��[0�+S�k�a��}|�!��M/��w(^'�r�,Āt��E����#(�w�w�߁�)�N�WKo��L��a�%v`w�F�dw��n@Rt�W@��G�a?�$��6�	!4�o4�2>W������Ys� ]g��G/����%{DW�Mt���&FJ~��q%)�v,���E����\�ab	��߲]{,��o��v5gu��7�Oc�����Ǉ�!�T���?."����SPM1�>*ߡ5�<�̿LY&� �vlO�u��N�B]��\�F�l��5�@�l��,��_������eR�@?� ���H{nL���{�����B��/����(�5��ӓ:�-��.�I��ɍIe�W)a���PEe���n��t�^6�<�Z������E����&v�k�H��;O�T�!�'A��|j�(�b��J���3�"0i#�d�{+�� %�/�cnd����v�~��j�����zA4�ho�Y�F�Nx��a�5����*J��L�4��]���J���ܮ<0&!����ep�*��f�243���k0%_'�jf݁+[��-�څi�B�q��t�ő�4;<��uyv�6Ύs8�>7�� S,��Ӛ��G���{�^zz�·\�?��Y�P�W��N�8%�d�oj��:Qq�k�>����i?�"(|}<�]�.-����v����'�x����%n���z��1(p`ԳhMc��� H���[������L��Y�02x�G/��s�C��`��{*1K�&�.Fд�'o�@�^���g!�����.J8�w{$phy:<��`=�P��"�K�G����s��׆�`A�:��ZE�os�n�/8��ɷ9���6�)�K��C!=Xa�u�9�n���8��� u����R�F�ׂ��v@"����S�����C뱪�΄��|�i8�޲z(�4\�K�.����w��kU3���L��)�L���(��v��ڙW�^JE,4�n��TD�׳�8T$��.��Gmٖ΂�]�G��gѐ�%	F"%F��!{��.��Y�?ԳUMlĵ.x��3U��å��/���0=t2��b�0=)�-�����yڅ�������]�Z�#���j<X*'>�>?f�V��~9#�ڿ5OH�S�~���<�㨊Ė��2W�3�5sY@�����c=�M�������ei�    �\g�2 A!�*0��A4X$UIs�3�����S��Ť��:��{h�1e����1�`QZ�[g���P(�L�.ʭ#B�/�9B��G���`J�� ά<A	���Xy8�-
\?�#�y���C��D�PJǴ�bjJ�'�~�0b�Z}�޸ּ�P��|��eL%���#�������Us`Q�2G�Cx�c;2�5�>V)�͞��M� B;��@�M�-�!+~J_�����ӕp��p(`L��U�����,��֤m0l@wM1�8��v����#F C�������E2������ݍ�X(-��׌�¦��/3l�"�ҟ�h��ds�Y[=1�5���kD���;@p�ٛ�O�c1~YG����1�&:O��teYm�b�c��,xZ�Na?�6i$�º{���k�puo����^���������^�W7�K��22º��JwTG�Bb؉9�f�r�\��������QU��g�=���#����_��w��y�S���!��1q���4빬�c6��S�N=Ўx�%a`x̰ҁkí~�Ճ3@��S��f�P���4)��j�z.C;&Ĥ�����禰�O��1L =�Й�N��0�J�6�g�024��f�Ό��uM���SB�#�LF��~������%B �5��(:+CQ�3֮4o�;��(
4�j�z<8���ʖu6pm�q�Kg���8+E,��	���Ǯ�t��q���9h��ido���H|����G�r��O{��=�Re���Yh�ʾ��51���/�˾4m���%�ݶ��t�k���:� H.��l�:)��r��0�ΰ2l)�lu��� x��&z�b"w�Օ�Um��;�9�3��gß'��Ґ��� 	����\���Z�� ���9�n�#H�6auL��"6|GH�Y���!Vd�Ei[�)���H*/&
��T��S#PHϓ��J�M�M�"��y�v)�W.�A�6)ڏ#�8#4�����@'}6��	��p����ɀ�UM#Լ�J'�`#����t__���d��J�b�#6�.qEߋ�������A^,�o�~�ݦ����$g��#�~ʛ��߆y'Gx��1O�U;�TDh��7�w�g��*�3�:�3ߦꧼO��\]��'���஺Xm'"k�/���Z�������-։���:��]��.��7��k.�?P���cL���9�-viW�2DGkR,qU�c���j+l+��]���I<g�w��$AöԷI�u�&�/�U��X�m���@�P�q��@�4T����o����1�+�J��՗T�N�:�3s��H��S��-�ն0vsf�����F)۵�kE�u������/�M���^�ʁc��n顝 ��Jۘ��k~�a�Я�l�,�$Ko�uÜ��s���~h&��Z�z�3�1�m�i�@�����~0��̫՛Ϙ2t(���d�߬7�~ba���l�5@,%c����X�w!>C��B�M� E�5M����1�,�5�QW.�`���&��(�V����]w�)��.�g����J�*���M�u�"m����e�b��e�.���-�Q��/�U2U?�|�9�0����§��9�k唼�B�ս�\�nT��&��X�I�+:����~nCW S\�I���`�Ѧ�.ȋ�?��o�3�^[ڼe�9���it≿�RU�6w�ܥ(��T�fL�];��6�S�F ����_d#�z�kuP;n�UƝsʌ����*+Ϳ	��6�'�t�m�\��U����
�!E�Kn�+�~<G����b�I���z0�Z�r����h��N�r�����[�oP�gɭ	�3t�on,�3��4��h�?��\��E6O��>�u��&�՝�B�m�0�����+Q�R?i1[��.ت�6�����v�
P��H8-z�9VP&z�C5�,z���=�Y�L��L�U���;�P/Ũ���j`�L��>�S'��,͙��P��[UC?��CC������-���L��n]��BS#�*�te�y���S5c��,X�.����=�|\BC?�I�=�8X�k`�z��xG�;Q�)��h&"�h�1i ���y�����<K�eρ-v.]a�e��1��v� ߱��N�����Du��
��x������
:��Ma��^���~��d��Gi?�b��e�z��e���g1����+le���VJz�-G�U��<e}��Y��>�M����CU��W�r��J���4�~�H�;4���t}�Ag�.D53+`n�G��c�}S����n�y�oj�[E���������昆��3z�,F�$+��M�qb����!��X���!{/��;8ISEu�� 6QdG~�`�|��'E�d�ΖA�I���N�$L8�ڐ�H�	m��e���J��G|��Za��=����`6�WM�^���sP����}�ΛB�!MS18aXڔ�����@8?����A�~�]ڣAW*����d8ՕJ�0���Ou�Q����>�ӹ������(C�&bƽ�7�k��i�ד�> w0���#5M���,g�ۅu�b�\�3��}J�g�
�Mv�M��:K'0�nEf�'U��˪$����I�/ �S�|06Ԉ��!Z�N�z3˂|�N�G�)bL�a5��w������/�n`�w�h��]���X�A�S�_�Ni�SME��l��!'A�+`1JV�:��d��x���>���}xʥ���
R�.��M�-�%}���2�+8���ٞ��uWlR��m��@�$~#J�����~��n�A�٤X�g�ڕ�&����#�6���!�!M�|4���9�1A��"��a|��W��c�.��*�Quhn!	|A��A6@%Int����WK�Peh�����	�Ȩ�i[$Hq{�2"=�\5H�2Y'�rZ�ߥ����i,g�K�&a��ǖ	�?�e�a�*@w)\��&��j���!�Լ�T��,K�b�}%��靨~�5�T}DČpK�Ԏ��j5+e��*B�<-^��6��[��{��c-���>��'��T���y�\%@)[�{u>��O G+&#n�����zւ�y*�g��qR��tv��5�0#r�B	u4���5�r�n�I?$J?��,ݫRt���\������y8��a�1�AF)%�{g\O�|�3Rgr�7�d��t��{Nk��C8��8�e}�i���n�
��I}H�U�i� �!�,e(+�#����%����P��m�K��&���<x�Ա4@��-2�	��y$�)�:�jnΗt�|I�̈́�U��"#ޅ	k��z��\u�Q��z���\8��E2�?�
.�n�?���}�t6����`�}���Q>f�8�Z�d�Ɍ�ud��2T�
����):i;��ӑ��=��]�FZ�?��� ��Mf##5I���^����[����4�J������3��"���s����y��*Ye�7.f��Tш�q�v���+7/p��f;���V����$
��K�����@_/��~�W��Mf�K4ktw6r��5z��|5��k�q��U1O�wi�X�3ÃG&'�#}Ƭâw�2����q�wX�t@�*��҆����7�͓<Y�����c]t;[ź{���~ܙc8nZm氿�E^ܴ�C�e��8��š�QDJ�ZDhHp�(Q�l���T@YUZ��8�Mi����i�^��|B��ա y�o�8(�P3d;0�W«�{cD�t��y0/v�m�Y�u���l@���_bC��X�f��TRg��qCJP��U�x{ ��BC���ʩ�zv$�����|�ߘ=,�b4��5��0|����t����֪ΝLMheUGZ�5/��1�4�������\�GT?���Zŏ�������Nf��3a��)�\wz�<Y��k���4r��q����ryM>���ܨ�#�^8��Ǎ d,-l�N�'0z�;�/
M���0s6�7�R�k�8GH���.���42�<8���)�V�� ��M�dvS,UI=���Cc���1����c��ݔb��_ipV�W� \����c�2�Q/�H��@<�D"    ��}/
�d��(L5����i�`�wr�=����f�	�4��}�0u���u�!���b�fb��u	c��������#bޠ���n<���t,��uZ�3�D���{E%��[θQdh��<~�~��ֻ"�y�X�-u8���E�fت&�w/5�������3��6�$�}�Jr�DG�v���y��V�3���?/L7��'�6�6}��X�1�R�cߑqz���_���'�t���r:MV��o!GҢ=������Qu�5�Y��$E�d9�Ff�QI�d���M��Umx?�ۄ� ��d��nqz�qt���5J3����D�*����ԏWG]�D{	,69�9:|�����X2d��Hk�愈7����n�R3�i�+cPn��>�3$B���,arP�3���{�v�s\}?�T=n c4) QMg����r  ȹ��!����S�>?���'F/��ȅ��ՕVB5���Xi��v�Z�B���:�I���v��Sw�y�b��i�$%������ܥAr[T�s]EF�� �dUi�ǲ�;:!�n�D���,O�(V��A�vD�@�ujm?��4T.�}��iw��nW�Ju+-␵���ܾP���D^|I��I�ɟve�w^l�����/8t�.�]�v4$�KA��:N�O�!�	D�,��Ҋ��JX�<iڢ�X�qs��x��I�&�L����O��P,�(����;���#l(��'k3/Nc��|��$�P�ʝs�,S�����2�U*��H3���+���cF��	o�}�xQ�Vi����ՍA+����ULY�T�I���&�|[d�� �����YQ�#J"�3\�H���� �-�����N_�ɴX.��H2�c���J2+�F
e�Y�����nv8Hi�f�d���.�����#��>��O3Ӯ� 2�'ꤛ�0�W��7��Zw:=}����Ar`9De:V)y䶫�������h�0���لy�Fh��@��M�"�$�Y��m!k"Ahxe���$��R��~���vu�qJ$1�$�pJ,��Z��K�1�כզ+��(%���X�����YG)�"GI�AƟ$_fs-=U�c%�pNQ�1�ƫ�q
�(�>�ƌL��u�v��Z;�H�"`�Ӭ�	�$+��կi���Ț�XZ�3i1��a�H!�C��t�����$.��)�Y�K��C:| 1V���M�'�k��nv�,��sf���V�Mf�Å�cŒ��`�^���Ǹ�vԗQ�OU#���ő��E��ʹ�k<Ĝ&��JА�����){��2Rg����@sr�yT��u���SǏc�v��t}6ܻ3J�A�ؓ���3�I�=�2�ށ勬��qk<!{��7r4�Mg�`�� ����ڀ-���k�Qٕ�燗Xc�Q�������j�Ǭ�z�YGB�G���7U���[s�KF���u~�V�y���%�4HW٦�^����Q��Õ���������Z�t�/Y�N����7K �T�iW�}A8�v?�2ܧ�G:��<�%��n��qS��Y�I�T?���)��-��`�X�zSk�;���ɉ���k�O���^﫛�jU�܄h�;�]x��X�SK�}�1F�t���&�IpMu��+Ⱦ]���蜷*�Y��h�S|�Ik�x�8��YQcE���jM���A��8���ɰ�SqU@�.;�'�+Ʒ��Hu7�,�mBO���3��+��xa\��8ogbm���<��f���"�i?��ߑsT�+h�|Cٕdy�U�!�$Z����l3ߴ+s�\p�"S`�AX.4^d�=5x�hb�K��t�t��#Ʃ�Y��#é�޾؜��g�>��աY`������:��@׸�W���X1��<�MT��̀�(r�u���JE�
��>�yg�8Fh^�یᎆ�rG9pG1��c�u;ns���[�A�tv46X�U��E��6"j�	Vc��+�ܴW��ݹ�f�L#C�8�v���k���T?)�I�م� �\B=���u	ɇ���
�h,��I���`�K����mUchY�\�)���Ϭ��dJ��i:0퓶ڃ=�q�M1��&q�e���un�~��+��Ep��Pb��e�b�>V1J�U�.{H>`\��(ȁ���'x?�B�����I�M6w��A�;#XiP��[�Q�W��������zm6���!\)�m>r�+��ɛCYzE��$��E�j�s5�����푏����6��ҫ(�kw�<��ᐃ\��ɵ��Y�FT����.eѥ�S4
�x��XQ�h�٦��,�Σ�>:��0f���E�//�@�����)�/χ׷������j"=�q�#!44$*�mE5�'�->x�JV[��o�d���q�*Q~��x�,������0�=w~xdL������ps�q*C�?������k��k��Bi�%�gT�e�|]�C|C�U��r��ЦA�fɽ���/ny˃��-�H����V��V
���ZIWh�E����\��?ȰN�����©���B�Gfd�����)3���c���LݢR�`9�1�O��c���C|�9��Jŭ/x��b���ȑdhz:T��Z�N��?k�й�\� ��\o�	�&��`� �[y�*G���`��l�����ϲg�*�_t�g�.}\_zz=��MԷ3�ʧ��i�[{D� g�3S��M�}B ��єh�T����W�_B�fT�K�����\�Q�)�ߚ��a�N=@r�"3�h89m��O�ǏF����ʗ�!X_�P)_�E�ܨ��~����� Y[�oJyկ��,A�˷��kp8��Ccrj,�C7�S����9�X�.�9�凷C������.�/�U��_v�S�9�oQy/�z�Q��g�楪A�������v���7]��촖���S����#G4F��s�|y��h��ww�F	ے�ٳ��h��S�dh_�,�T���|(ߎe��#yw�maz�(�Z>۲�9c�p=�����n:�y\�D�?�E�Ơ�hB�{��@��/���<��2X<��Xc-�p��1�ں��aL`g��	���;N���Q���8(X�'����G�zx;��s��'�ݦ���mJ������?Y��s�Lz|8�Az.tyƣ��4^��<�m��
�q\�O�T��R_�j��}'�f"il�����{W�M���N����|><vBPِ�&���ݙ�kZ3P�=�%�z��>/�_�{�Nw~Z�!u��!�'��P�/=������k�Pw;AMz�.�a�f�y��c�z<�P�ҪH�$��ӕ�l�w�<�ƵV�γ���L��I*��Ji�Yo��������Yz���ͣ���<�tr�|���E�������i����X�EM/�,J9��@����E=����^�Y�A���W�6��[�k�� I�墩��z��y_X~C�ǨZ"+<�H]�W�$�y�zO� ?����|�%o,˰s>cD�GT�V�E�%��D�V���r���H�lAN��F�I
���#IТ<?�I��f��a��d-��Opv9��+:?�/h:u�,�ZJ���s�'s���DH�y�����T�g�?�'�u6�#�sV:aQ����Y����1�g��|d��z����v�3+LPb�<�!$Gր"n�~:�k��3�U_>��6'�kO=��=6�V��{7��(G��UUJ�sC��:I�=PAD&�L�Ea����5�7h����I���-��*�~FEd��@U�G��o�a��<4�D�#�T�4˓u7)�r���6t/l`|ǽ��r���H�)n�km#����=r~����un�tL=�A>�7�����U�yH�.]$�҈��J�p���f+|�s�	H�ns����.iv�;�Y�s�v���8��H|�y�����91�����)�1���)��@6[YN<�/�-"���K��0H��T�N�����6���V��9��)�8b�����R�}�֪�y�qV��^KֿA^��<��F
�`s M��zo|*8�}+�ͷ����H����1�N�#㘉�2f*R    �4�.�0(�'�M���}7C��c]��0�0��k�q�	�����(K�{�M��d�7�VgV����5n�]��c�u�~�`�d+����o�!N��&�#̮��gpb��SW[�D�bi� c�Λ��� #��fG�����7]��;�;R�Ca�rö`�<9>aIU���d%��K3�R"�ji�p3?��:b#t���E0�eK����t�3f��90���^_���	E�N�o� _C�cC4>r�}1�bA�U5[�ՠ��04J����r�s�!����C��T��7�U��g0��&٩�&Ow}�h��5BJ����#�751���I��ekg�F.u�De�W_j�7?r�\��8�V�yq�4]�לllM�T{�lq>aS;b(��0��g��-��;csjI�b�VA+г3IЪXB���6��rj?�N�4����GK)�^�u[�%E����֗����	-�I1W?�$��c���g�I�ֽb5���KF� U�N:�Kn�����؝�*���}tç�|��1�Φ֙����a;[I4��U;ۊ���jz&C�ʒ���~���u�è1(�BI���]�yz&9�ʧ�2��#{�?�>�ے�GIFfx�+	4	i��-h��<�tif��~��f��o3a�YEQ/�)�ؾ���Ԍp�/�6�<��k�c �jz��~�lsӍ�Ԓ=�z��c5�B�_�����ֈ��6v��#�Qg��t�aB+���u�>�Hl��{�^��`�)���Pl�l��~r|���_d���l�pύ� 3R�7Ii�:r�'#�f7�GT��<�01�A�+ɹ��bC��R�x��d�X�h����lH}']�d\2f3%�֒ŭ�\22���V���-7�s�< U ��H�"B[o�rGI~?\��;�	m"PˁK�����k�ׯ�;���9�.����#Q";9�_�H0��������Vו� G���C�.~���GH��9��_P]la)��$F���y�Vs�N#8e�Zr6�@�جf��i�bY�/%w��༒�s�[4+�_NP��A�骸K{Qt���ݭ'��C�!~w���T�B�T��i�v�J����d���!��n�G��Og�ֳE�~�ٍ��i ��2����й9��X�Bl�<l�x�����3�g:[��?�/I�%�����E:�N:�9v�v�p��YeHo��k����$���[�?�il�r�gip�N7�M�XI�_!��+�dH�W�F^�B*�4Xٗd��<��7vve�1����f�⪄����%��R�-�[�h�����F�����{�����'PħZeRǘ�zJ�m+7=%���.0ګ:(H�I��!�.٢m�K搻����!�/���OŐ h:�mg�O耒�� 
5����)ElܰHC�^���Q����%h�w���u(,Dhx��z(R�D�]��f��M�Ծ���|(97�8	 �VJ�[���Ox�~�d�Y+ς!a4��3�z;�&�>M�����U��6�.�@�2�u�!#�&�Lo�����(+�ewN$�����V�yla4������+�-��π'g����zO��泅�ť �
x���>�4���WI�㙄fQ��@RF�^�����w0J��\�·ףΈ�O��D9�qK;H��7��^�Q���=��`����C�/7"[+x�<8~~*%�xn�<��WR}5a�H����$»��b#��v��iI(#���\GLuկ|�鐗�Iq#�j���k<�C�&��l}��U��q�tG�&b|�"&o��z���A���<3��Jfk�������G�L�s��	~��j1�$�M��j�����d(A��b�Q��۔�bw�!Ʉ��9�����ݨ��(W{��l��09�1YJa=�1�é�8j(8Z&���:���Z�wƴj��
�&�:_�/(%�-g�l=U���R?��,�6�&��9X[Jk���Cx�3�����]鶝BaQ��;s��͢��Q��j\Jb?O�} ;�f�|�܍ڰ$��8����.����"}zе=�6Y��g���M���d���;�`�lB�hl����A
���'��n�t�k�R_QUyN�R}?s��`�p��R�McL=����4�Vx;ղ7�r�R��{nI1q��B߁�������AcἽ�F�f�� �`1n<ʒ�d��b��&K�9Ey:�,o����r�[#8�%��vU4�7�M�A�L�o��iZ���W���9�Ǹ��Ѥ���^^<���
�e��_B]�`��&�DюP�΁<�U��y8&���u����K�d�6�U6��$@_�wEf/=u�q#1���z�����CT�NFk�T��';�w�� �Е�Q��e��E?a:n`1Z'=9�	)w��:cW��ךsO�7�D�C���q�b���� ����1��y|�)J��x��M�\n�h:�n��%�5��d�5F6U�{Q�#�}{��7h���w�á�D\�f?�0cL�[1�;!i�G�_p�`ʼ������/'L�չ4�_��g>j��!	��\���4�ɫU$U�+�&����-��i{���%�|�u��\Z�1iLq�]�U�߆M���3n(�z��ۮ�0'��ȵ"pV|���e�R�B�E����m׻�T��ٌD��E�u�`�Q�~�����؉����j��WQ��m�g@Z8���қ ����]���igĘǡ�a+=���IPv:�m�;T����䌚5&������ٸA�h����k`�S8�����*���M�&&}�;n0#h���f�ɪ�-�&<v]l�鰣K��&�PS\Q�k��!1�7F�$��\��Y�Z%�vҸ`�缮��5I�3A1׽Um����[F;��Xu��P�T7�mӅ����.V�2�7}�̓�-���U.HUM'�
R��}?�@�Ӂ}]���/t5&����"mL*�h�oL��ޢhs=m�B�]�*M
� [�+U���Q�I�a�z�~�d[�ߥ�[7Cg�`$�9�XkL�iD����ƍ���P�kjت3�V�¸٪W2"���{��F��ju�����p����KuJ��#�V�[�5�1gdL`!G�I����qc��}�]J?JMڈ%7⇪���)�I� ��_�X������;;�$mp�k�%�B֊��]@�;���}^�t��2��c9�f"�f���I��~���)P���f�[�t�����E�Pi�hd2�t�D<g�Pa��Z����Hw���j7[ƛ���Д�&�gi�Rc���y"(1s���� ~�CQUiBRK����cj3X�ϭX��"�-%)�(Oқ�� ͉w
��z�ʖP8���GD���y% ���&��m쓎P8��*� ��l�����1J�"C��m��/�#�Փ�c�3Z��'_e5�7ON8�&��j�iB|���dT)[��:�q���%7Y��:��%&u�YSW\X������3��5�� �P�s�1y�f����D�SbR"iL�1,,��1Ffl��$��e �P�v~�#�I͋u�z�����Z��a� Y��(�zcN���\�#Ydl��Y�m��Ot�#�6����A��U�A�p�A�I�S/�,b?�d��ư(��ζ�
p>�{�Iil-�y���6C�;0��a� �A�L���u��d
K@�G�I�� ��=?�l�xdm�:7<j�J/�8�>����-��e��irU�q�f��&m��gxi�r�6��Z݆:�1�{��?��e.�z��*��ҹ���^u��yJ�#iLTh�¶��9��[L��4�>BF�JT�1�:0lM=>�C3F U�OVy�T?�b�u���u.ilgqz�n��:PQ�O��ݚ����I������ͧ�V�!���FR�,�u��E�ެ6��w�5��}�ƨfl8��{(s#��NH�G���u"[�t��l�� �Y�����}�ln��b4M�h.��ի+d���q��((d�&'��I�%h���<Q�ܞ(��;�s��h;4�I�cD��t�.��Dݭ�{��]i��|rm��i�x����L�a#�M��.�ogln��w�op�#��^    [O��f \�m��f�	uR��tp�˸�ї��Q��lY5�����ʙ$�A2ݻ�G�}?�\����fÈ�}h$Ñ��Ͷ���d`��9���w'�z��Ѥ���3���j�?�c ����^O���#Z�D&�.�^#�a;4)���@�`���OfԲ���Ч��?3F 1Re���`lT�!�b&bA-��*3����$h*� ��UWm�*�����V�B�?�I+[Y\�?\ƈ&�����=�]����C��1A�x�5��Dw�1B���A�}Ő���t�c�9��7t��V�3$c���f{�+2TG� ���d
�
�f1�?�:e�x2���v���μX[ѐ�uw��	V4$�v��5[�3<yEGo�E�
�J|5 @G����h���K4a9�Lf��F1(W��І��r��v����%X)?hc�{��1qHlP#n ��^>·6H�(�LӹBt��<$��=��ri�]���O���P�`C�W�d.;��^��e�f��q#�nW��E�pBt�S؎x�|�V
�&�}��l��Jw�\$b�DZN���P���I������JC2I9T!�F��o��������p_M21s�E�����m�`h�-���d�o�q=0&"�>������p�d�B�e����h�/��A�D-¦�_JL$J^_�n?���RP�M?���!����t ��K�o|1.C!�#2Y�z7��o����w�AbV���c�}-)tV�M�k��I�oЛh oɘb3ь:��Y2l�i^��:�G⿈㐘0i3GTC���_����Ȼ�Gb4���;02.� K�I�F�j�Y��2��U��fmBZS�(�}�KbΩ:��u�O;�hX:��Ru���O�03�1"JM,��M��c�w)THq:&�5+�{�!#}>�2�ʤ�m��ft�6)�-z��=V@N�4��M(�DO)�R
�'�ꕀ�UP��s9�'�`�Yl���hT+��n	]޶F��f7Sp8�MƢX�V�!4?ۙ�%���0�'t����x��K~�C)]&��C颟j�>F$%Į�K��ٲ��^#�G\R�	�W���T�+�Y2Wk�р&��&S�+ʦ�M��ѴXΓe�B_�lf!���g�DVN��ʅ��g]��(ɖ�<�oӝ�0{S��ܶ����͔.���V�~ϔ0P�u�X��^����u�	�D�Fo%�6��P���c�;�Ͷ����g�O�j���!��!��4���L�1C����H��Za� �zv2ʵ�{{�	���tA�I	`:��7]P���Ī)٫�\���s�QXfS��&i���ʐ4�&�Q�����������j�K�ʧ�<�#��w��_�m/�9G�8֡��mbzL��{����R�q.�Tw�&�����<�V~=��B�䳵ݹ�g^x�;	E��l!9R$�I�^ʇ ;�,���~g�!��N?�͆��է�x#F���|
f��k�-�N��[|�a�[-/#����I���I���d'쮰�������^{7��NrcŐ�i�P����K��bx��{���4�CÆ���!&�c�3B��Y�NW����+Ii婭�W�}�7 �
ė�uh���Ș���ڸ`�#��;VU�sz~|
���xB�l������u�P�G1I��Y����y��V�#��R0�Ok��(�!JʱB(P~y*��wZh��s��ؼ+�Ԟ{�X�z��T�����{���hKMg�df�s_�_Nxx�/��,_^/Ϫ����w�_Y�2�~aH8\�;V$1J��ˣz`��7l]�P�z��4���k�����S	���rzve��{:���v�a�������߫MUo}<����֛��!���.Q���^����c�����j��Gq��Pw/L�����+��s8��1���g1Xl{:v_�Ip��:&M�.;+��/�����|9<�fd��q�	Q=�u>��x�$�G�����G�vy~>=u�U�Ao��a�e�!��psѱB)��n�A|X#�-��FP�i����V5I~y)�/'H��E:-l""0S]�AR���f�u$�w�c�;U5>_:�=Yk1�c���v��텾�x#Q]����`~x(�o��|�����7�p�`���-g����J��<�(��������C����7�ܶ���TFh^�<��Z�������|�u4� wAib��0j�	N�+�1/���B?�涱1� a�2��{��Kd�Xad c�x:=�׵xl ��U�f���+��<��?����ɩ�Ьx�P�aC�HK�	y)cR����ZO��NW�B[��Cc;�{k�����|y������z(cK*Ǹ�U�j�S����h����j���q���,�M����X�(;���X��2��ҟǪ�nL�?��e� �fF��GU5~=��:�#�q��K*���m���`U�X��(��A}W����I����	Hm\ճؚ�ڼ.��U���"4)_~3ܲ����ؿ�C|�����n�zS1\�9V0cˡ({q[�y6!(��4�7phª�0d��6��l(Ss���b�\�ʼA���A�{�&z��:W_Ff=��W
���α�(����.��g��qi�s�\v3�\2�9ƍ��'D��E�~-��<��:�F�ƥe�E���g�)��8D�k�v>��g�+Mq�b�f�qf>��n�̅�&<�0��4+_G�.7YUs�G��H�2T5w�U��V�w���X$�2���bGb��^��ܵ��h_%<*u0���è~�ٷS0Q_F�ļ�����L�cDgg!J/	MC�Z����?z�e���X7B��D6Ǎ���gOLl������;G��X \_k�	�cE��d�YA��
��vr�<�TcTo��y���+����ǆ$G�>�2��ewJ6��ldQ����jk��qe�XA(��t��U{$�!4��Ϗ���D7�<+ ���;&8S/��5�	K�$�)�,D��z����"�mT�D[��Iצ������<����ا���k͖7�b7[���}w����c�%:4�^lFP��-�D�q&����YC��;5�"�#<�9�U��`�������:�|W�ڱ�Ǝ�5�)��E���Zz�f�fE
v廵	c�W]��Es�%��#�)_�������5�N �9d�<�^{Qx�!C������p2�k�!q��Nj+��dZ,�ɛ��l�w4��f¶P��C6�c�Q]>�\�Z�~"�p�� e�T�׎(�a�=V%
�E���7������8��^[wO��<D�JOT�ܤ�,��􎦳�fQS����=�c�H�������gc�m=\�ot>��ST���K����H���X1$(��^��f��r�q>�Lbi�z����sݱ�H�YL��ޠI�`�� Ahp�g�+���{x�d�*�b�O��b����J��&�&��ڱ���g��D�~Mg��k���Z&㑿�Cw��jbZ43�Rt�J���B��h����"|P�0K=2�s���-v�}��Ev��fw+�aP�;�΄��0������Q�
�jg��"��a�{XR��8� ZL���-yO������'y��+��`��'K��V6����F�`7�-�A^ܦ����YXƝ�_6�p�n�_��Pb8�Sp��ӊ�As��jF$%	����`$�FU>�z�Q�:�w�z�,�.Q?p�L�b�d��U3W\"=#ɪ��Vf����\)��,�0��7�6ۨ�|� (�_�s)w��X�TNQ�(/ɤXU�9��✵B��|���F�h�٦A?_�i��K#ٌcܚ6��A0�A��.�ާ�2Y�0�ܗd[k�C�u�0I�:>^��n�QҙF���՜���F����\�Zvώ�@Y
�b�oS�mV�$�Ov�/M�+��ڌټxL�l Rep�R���.�ýnw�F����xD��)�u��gȔF
��N�V4��D�p��gKz�juT����MH����!���%P��=�%���G�+� �o����%Lځ��    �rc�H���m,����oU.�΂_%� �,g�sWt��i1��ǟ��T7��L�Bc�J��c��f�J�R�su��}����ḙ��T1N U�����"��8�@���^q`��u���1f��>��AR<�
d�0%M��k�^M�MB�sz$6SsH����wd7�I�����:�'Y�J�� )t>���x$��>6Ͳ{�@U�I��Ng�K�Btf��� g�P3V�Z0����hܿ\�����ɰ�VB7�]ΟʸR&��4�,��Vg�7�$��],7��T1��E6Ԓ���E��5�*��X�$����+�A�k����0i�!ӳ�2���C<B�
&Ux��$;UP&�)��;�h�4���3��kyT�۩r��H�yj�B��h����&�5�M`�}����A�tjNB�tְ�	�2��=�Xp�n�t���8�w?���7�Fs����V]o��L�tn�4��W�����\PbD��h?�en���fg�ɼ͙�b:g�C��b:|e��ӭZ�I�/6YW���-LC�W1����Co׉$�h��b_�_��"�Y�mm����c�`p�}�"�PuÊ?��tR>>����_���?V�Ȫ��δ@�5�J��uj_���`̆��2lB��GP�S�v�����`�h��ܗO?/A~y��ـ�6�on�}� z�z٭>��+�ͽ��>,�-�%_/���$/ԏ>[�]��^Bٮ��_�0����K��me\/��������zPF%3;ڲ)��t�6�-���Ց|R�|ޣ�HPz;n5m�Ij~��/���������#|/g�q��<�+���Y6r���J�H\�v�v+��X2��?��V�С<w��tpd��?�ĕ�Ҭ�z��N���?h���K����S�\a+�g\�
#iN����/�?����㷧��fL�eZu����Қ�ĥ����3)ѤT��u.��g�.'��-=#l�kgl�I���.�?{.�Ls��׎Trb��kGA�(�� ?}��q�7N7�~�,���Mض9�*-�e忞^LR����|-�Ǽ�� /�(~G^rm���T����v����}�0�����|��i�0F(�-����x&n�9+���*��ϐ�F���~�&�}�z�z٨.��5����/�d��Ί2�-�L�s�ʗ�U%��ҹ��v���s#�v�n���0@���l��D�6��o,C͕V�jnTk�ֆ��f�r�H
�
�����S�Z6vv0g<6�Z��Q����RK�`�,�ڤc�\>���5������B���s��ҍ������f%�܂p���B1ڗ�`�ӳ���㝚Lc�E��ql�q��o�jlH#%�='G&Ay�|x�ѣ��."��jUSS�h?��+)� \MO*�&�ҭ��1��A�Ƽ�r�e�@F�0� ���ʃ�ƽ�a"vY���-��mЌ�66�˳*}��	�v"�I�&N�	�[+D3���� ��ñ��!�+mq��U�]�Gc������N�|;���	��j��$KvQf>���T���-hȚfĮfg� *�ֆ���e%3r�\A�e"���D�����\�)��6sw���x7�5NV���y={o�%�C����h��r���ַ�d�'�;�I�妦�Ě�c��}��������n;�}Ӌ�nA����Hh<����P�%���Fh����k� �5�H`-�=�只6�����j���'��r�h�ER��I��)�:���a��?�J�m9*bVȮ�Pc��शe�x<�hs���L�?���
���x�go'��ǉ����U��.ߞJM�l'i�ַ�ͻW���<6�u@7�9ӃF&�w��R> k M�U�>��V���m�ZE���ph{�ʛ�x��b�1$\�ȡ�leh4=�oW[���������`�~�;S��E�MA����LR3�'�i���#c�6�8�Y�f�dƼ.$"�1�f���|F��hAT�Fy.Q
��d_X��:����!o;�y<��yrԋ�]^�5�w�!Q�#g�P1�f��(mJ���ZST�L�#���b&ƅ%�ʖ��5՟����tx��M��]����C��y���c��Q[��>�d �yW�|��#�(��)dh5����������p:6N�ݲG�/9�V�(�EcG_��%Ͽ���|8�C딛�k[n�%��S�6�����-"*·����1Q�h4BXl�- S�J�p4Hb�㹔��r�aZp���
h�m�ک��U����:ܲ�>@,D�����C=� ���̠��j�0(�'d�@�f�!&�Sy�<���6QN�Ϲ��k�>H�@=k���J=���/����N��俰�84�H�3��/U��aMO�C�+�/��C/��;�6�Ǧ�k$i�f��v�#�/vf�Ƶו���q�|_�w���ty8�V��L;�Clbr`cӾ���0C��w�* D��'�u_:p��i�CZ�c�9����l��] "Y���d�m�٢�	��i	�ʭq��DL�)!�������Vώ��v��b�6K��b�N�2C�����8�o�o1��c�wd�7��
�V���f��3���4�O��<}k&<$�R=�:��c�pi��̒�8�J��q�%�ݦ����E�X^Sq�����+I��70L�Ԙ��v�n���o4U�~����6���`�05�8m����n�f�4ئK��Ltt[khi�|j�^���1j���y���,��I/ϲ��+0֫[�b�v�:��㮟#F2F�*p��gFD��N���0"ju�?I�J���1�Y�!dJ�JV�N�*(A4�y�r�t�%YO#Jݣ!d�mq��}E��Q���>���XB�<Q?k/���}�.)���I�T����<b\!4t��f�`���+{O���Q��7���x�#�S�h�ܥ� /�ws�����u�ꍙzˍ{]EE��3���I�iw�V���/�>�U������HT~o�چ��]��Jt�F��?#�u�0R�4��M���4,	[vM�qs@B�_��blUӸ�l��+R�;Q��he��4D��J�C4c�����Y%��V�p���(����
\%����O7S'q5/���~�s��⇵�V�����BcF������3H^��1X����r�Zg�X)�cB�$Õ�9�!��.�f�VU�Z'u�y� ˹"b���(�:s��t�1�)Q2�� �䪺�g����閪�a�.�ݲ#�pt�1�2DM6^�AG�(�ie~nDP��U�J� J�۠ۛ�DI h�s�\�n�G�H��WX�H3��6��.��Mڝr �����*���ߕ��3��p�p7^m�Q�f0g�]ny�V'�k��O�>i�9{B7�i�5��ZB��1J�i�*�O>�H����ɨ�"��}��0:b4�&��f�]��o���K�X��=�A;�ħRS򚺱/�E��hJ�-����l��'((ƌ�@�>��X���>ɺW���Z�@������*_�|����$+=�o1 '�+���Kњ��b��I�߻���6>x���nZ�1�Kހ�:�1���:�0�i4`�α�b�֜=��[ICR�<;Ս�&�ޤ}�M�&�([k4\ɟ�\FR�0������T��P�&��T��m\R��1�n����!��|[�zs�O�io׫�o��PJ���X�&x�alaO���m��7h}�ܧ�������3e&Ǽ�T�x>LU��k2['� ��]��z|�f2b��ukʀ�z�1��Ѻ��?_�7�~;�L0+4��X�= ��J���3����bW�~�u�."C����h�,[D�F���ç�?� s'gf&�"�)�������T��^�H��D�q(5�ŏk����]��5&�D��%F�$zk7e�C���IU��ZL�}�iPՆ�f��<�z=٭�5ϳ��Q�!���e_��D~���o�ǚ��s&ta�̌	5�	UX6������ȃ�b��:`�#N��0��q���|��|�`�hryx��O�}�&��$��_�    m��9��Ĭ�^�SF�&��9������]�*���}d�2�~�v8���i��6��o~�ZƄ�0f���P��2F��*'�@��P��TV⼘��6U�VU�IP��ԎX��?�� +�����B9j��d!6�������:�x�@�R��Cg���R3�C��X�:҃D� (Ѯ|Ӂq�����HgI4�"��W(ø��|#��L� ��Z�Ǉ�)XA��Op���p�gF6�8$���n!��� y�q��	:BQ�,���}p�d�Ճ#�_K�K�H��˷��xB��,��02�l{F#+`ZkaX1WVoaH��ԯ�v��la�s��8�vy2-�"�t��E�}"#4)���}n�ns��U�QT�o��x�Q��m^L ��THmU��Bu�g�-���*�����z��c�����/� k;���A:�Ed��i��0��δ��GX2�1~>�-�d4hW�cl!�X����39J__ 8�����b���1D/�����%�: oئ��"��h}9�w�)��L�b�k�|:�S���Cv�1��D���w�	� /���%�m&I�'���;F8�%F���B3�0�X˼V}ҲÃ�ޛ�r��h�0�k�R��d����G8b��'ߝ��~�|IM���ٝwj�U�n�{-�蹔y'Aɓ��9�^z�wCGuɹ�hC���?�;)D"���+���6HT�~��
gUԄT�V/�_^��h�n��z:�7���z8#�`��O:�>��4B�5��*��z�c��`Q��ǎ�.މc�9��h��X���e$�U�NJ�=�,��!�?<��j�銩*���(�15�f�il���2�S�&��of��|x};�z�t�,;��ܬ���I�~�x[���~���/ڧ���N&96;�u�n$��fgwB,��`J�!~�<?�O��|<~���3gr�v��J���U�9��$� �(yPџ�Y���	�c����2�\�z�q]xJ	���Fs���U-%�t�k���t�@Z�3`�K�h\�:�B y�ԭQh[ͨ#A�S�=Nz/���ɸv��������Z.���=���D��Ζ�GF�7���>�iy~��9���gҨ��#w#*����K�妾^�e���5H�\�U�siN�����NC�W:��Q���Q��Ǉ���FpH��le����D�����>S�D��Q�_xr�?���.�9��z*�D�I&zϘ�#ZJu�T#T��툴��Y��"̭��2�Ӥ�w��=T�ٷ��,��?˷N���ם0�-ǐ4;�w���3Q��E��r���\��ǈ��<<�1F�o�s��{�V�J�aGM��q��3��>��O_����|(�:Mv�~�Ԝ��N�{�	���k���d<������d'P�.4�#vk�գn4��5����|}��\��Y�J��u8���ԣ8AU����X�h^�/Guُ�z���N{�M:��:�)Xk�M��NV�o/�P'��O`8��+�����5�!��%Շ��o'G�ǇG�a;��# �R��%AIb,��OI�S�,��4�f��o��2��&W�E"�eS�H��V�Q�������o֛|3���X�P�Z�lłEf�v��I���o�������w��X����y��rzǔ�#1�=�:�||*��RE?tuN�M?4�	�j�=�������V7���G��'��w&�02cc��Cz�T�����dT/�JP_�_a5I��9��Qo�I{���ږo�ԕ�mv���,�]m��zT���dc���b���w3��5��7�]:QY������Q�G��������o�۸K��K����x��q�������/��\ɫ?"���!�к�vP�T�)�/W���겔c�Y�<����}}���r4�������,�����kë�5KّW��jY��jE���_^�no�C�l�/�SL��M⿈��pǡ ����+��·`{><�Ƿ�o�C�s:��!��)$q�~���\��o����ʟ�.,�jm|m�xD�VI}�5�wB����C��0T�����6�ױSh�quxImn#���KP�Rg�z<X��`�J�eޜ��k���r��Evn��j�Rmvh`{�m&`f2ŝS�CI�Lq󽽆��˫���U��?˧�U���#XUv��zQp]/x�mQ�����/�LD���Budk"/e�WH���x|�rQgҏ�l;_R�O�b���*Gw�����ݏ8��8HԨqR�l�t����@�����M�Ue�<`���̄�7�J�N�J�WF:w�]��c��3u8��Ekf�7*�D�v�_/O����b��j7���� ��=��`8h��W��� *��W5f�)q\���m��x�5PU�u>��	���r/��F�>Y��x�8�B�"Z���+��ӞP����M*���~�#̌�&m�G+����*NV�}�W�G�BS��P��r�?��6x8�qm���S����&����Z ��:�e�c$?/��������{����v֬ر@��M�����(}y|~(���� ?�v9[��YO�B�*�i���Xp#f��*��0�	Qg����Y�L��ކ@���}P�������z0��$+vV8; ���p:��5y+�W���Flu_>�ʠq�Z>�N��ƞV�M�4v�x��)Cp�*a�zsQ�����7�3}��]�5�s!+�j����Z���X=]���`qz)����F��j���Ht�1��C���Jj���� �S��~�l�H�E0�.�֖�(�]!��p�����Ns�g�/����W���+ԩg��r�ВH0�, ��*�!�5�װF(?=\��/��[Y/I�^تgXƪ��b��l�,��+�ڣ�Y�ōp�É��<�ݹN����p��m˙Rhq����v������6��Oe5ac��kl`r�*�Y*�~��@#g�̒8#���̒��!����0
�T�����	և�׷��k7�U�Ǹv�0��F=�	�yn����*�������s=�p]���[7���-Y/ ��߻-/�X��z��4O�:�Ԟ�=3TD��W����Я���%���ù"����
���j�EQhD��V9E�;$Op$hyR�N�
�^�)�Q��*3eE�+����3��ߴ��+&v�Z��#'��k�#`����/]ɪj]���=�3�eS�ɩmy��	�1��]+X� �1�sz���찐�v���'2�=�.���Â�:� ��eι�v���L߫�����Ə#W���lJ���#�ڳV�����l���'��C��@_\��C�Ρu��Ӏ�Kk�#�k��7~4%J��v{%�n�b�L�����?�:� �����ch��H{�?��>z�]�����vM�L&	�fўL�F#YI$�7Hb��v��`cFx�
��&-ѾtcԌB������8Ki���A�q�]vM��?�҇�Q|�f;�}1Ψ�H0ql�{�53��i��gu���n刮Ty�9�F�h�gG&��A�Ѯ<�~���G0�\��2���6����Q_ÆW�Q����LN ���R���}X���;l�ޞ�E���l��)���Z���v��c�^�	i��ƭ��A� TX���U�������`hl�*;�#��*!ޏF�qfẇȴ�������6ݒ�Z��B�䡦3f�����w��`��p����tz�V.�n���^uB��;#h�].�
nh�պ��dwb	��J5@B��ڐ8S�8��0�%	�/-�h���M;��W�
�b�2b��^��W�(��~����� (�o弣�Ї�N,D��u�	���B˧nLE}�XFv �??�s{y;��i��$Ջ23�4�I�i��Y�el�@ꌟ֑4S]wN:�TI��9�Ơ��j���Pvz=<h�j_Տ�~�<��>�mE�}�_L횊HK^'KR��xx�9�׶��+bM�v�\7Ċ8�a�r�υH5���e��h�Z�����҄~�{���HO��    gmY��D�$B�������_���	j�(pm	/N��� ճpx�v��d��	��y��艖��"���}T���WL)wK��rC�-������8Xy֙�3��^�s��Me�VzO�iWC)Z�g�T�H+Üy� ��?�c����W���̳�\>�h�򼟇bZǡ9c�0	[{���'�-�1��^;��p�$��y�y��̳��B�֧���&�ΘB��������Z��]b���bs�`�x�V#S(y��e��\�>1�(��0����	>*L��Mp���kl�
�R�ͥG��7[@��d��M��N�����X@MGûS��+�F��T5�M���v���1��O_�?��0�<��3pHIn��z�HWƑ5�6#��?��Q�H��a ��&r��]����>Y�Z"(d}�9a�(aQS������R���Bd������*,�G9�֐��ԃ�K�O�ף��vB���lpv��ܘ�~��WHF�}�(���tiԙH� ;�T�&��3��p��1ڗ��c����R��d=����q��pP��\ǖ�Z��]������`�xg&0��Ƣ
����j�B��ȑzď��� +�ʟ�+#l��vU�6-�$�\kb?�A�Ka�����������
;���:c�W#��͸vc�W�8^�
X����\>]��]�8� �Ǵ��qL��+��z֡���)X������O<��+qLM��f�z|:U�_�ZQtPL߄0%;S�̸E�Qo��AYӈa��Sy~8�t��nq�3�����6�5?� I5��G���ZF�4���#�i�|(�ß��D�$6�?�ޔ������A�>�l6��5�Y6��F��ś��\���!0�~jEIO�hx,Ĺ��c�$äi��w�� �����Uu�O�fZ|�<�e���O	)n��E�������i��^ �0�E��D�(�ǫ���������j��h���Vߍ@L}#�K���%Qv��7�<�����n1�u���՗16�^8��:�`�Ј��(yx�cu@{4!��]$2���}x�w�'���$h}�L���<t�9cg�S��U�ø5��4b(A�s�s���1�f¤Q3Q������<����~x�|�<_PG�X�؀.B���cĢ��l��c��_V�o����i�]�g
FC�T�6��ރѷ7�R�\�\�N�������[�~�n��?b9������J��l}�h>��T}Q5ݸ5�i.��#S�rJ����x�$Æ�DĤ튰-zP��@�#)A�`�d��|��W��Iˑ��_�f/�<D���~���k��*��h#�w-��P�ҞL������� �!L�}�D}ɉ����z4D���J����#�a��U���RZ`�Q��)!l�`�2��ތP�V����x�������|�i��]��';��%���2l��z��Hazxn]��l��L��Mk·h�c:��s�ɫ\p�-�y�֪Pz�myyS�t�(7�">2A�r�Zca��du��˟�7�1M�h�����2#�e�Z2��4������'�u��UsT����S/��׾'2�/�)�(ƺe+ZKe�Ǐ�uRA���ri练�9 ���vDV}-�'�\�]o6b%Z^��T�^�<�����]����;Ƌޖ�����g�|��'[�Tv�7�ǂ>��{���q4]���w�f�6�8\ґʖmI~$k�1�!�;���7> <�z���`�5k������ �wx".�{u�I{�	���U� oc��Nk�
�tH��}P�F��9�^>朠��i�����V2뱇�X�����p�Sev�>��[X���d�3U]����az��O��1tw�a����~��ړ�r���uv��f�}I1$Оr�q5�Rs�ޘhz�d�& {,���!e��~)�Z�n�������E��N��x����
����ش]�9�7��e�3P�8^(�]^ϧ�y����p�h�iN4���������XX���-TM�������/�B�F�����6;ԫӖ;r��u����)�qX9V�d�No�p������k��3�H�&Z,�T"�����vȎ�@$����=�6�6q����%���}	D��I�whOE�J��V�J�.q$,��t��5�����B�O���>���噧��fa�l��#���C���Z��b��"W�N�n��˕=�x�v�����m����"h�;�]�I����x��-�y���o8x#Esy�$��,Ԯ��Im��!�g'���ݷ���1F��fV�&c�d4�/~=��K���l+_�y���l*$t�M¸1�L{�PO��,H�m��h�㝡1.��J���z��'P&��M����� W��VմW�+*���G!m����K���q׵��F��=��6+���i��p�t~��Cv�f}U��8�!
QV�ʶ'�}�PFh"�)X�Ln��t�鿲�`F@ayc��QE2k�A,��G��`���-�q�Z��P-�s��0�C��E0��l_\��ܘ�ʃDw�Kܤ��:x��o�f,)��K'慺�vV3/�����BK!h�f����B]W��6�]�
x��ޞQ��o�c�ԙ\L�U�Ο�;-3:�%O��`�M�-�bp��x��(=fy��a����A�2~�V��I�±�2l�w{o�&x۵�a�f�1֩:K���Hu"f��vZD�1�J��7�:2^1JM��>��7���K1��VL䅩���5�%�a�E��	��g�V��nٝ�Ǩ]~%��W���5bhuN���C����!�E\��DT-I�O�������`!U#�z�
;{�PH*P�H��� �hK�+�u/?-��Y����,"���P.*���&��K�9;���স��3��O'i����KU#��S���Ҫ��;���"�̪�>vHё��6ep�P.oWb	�6�jx����0nM�x�b�;�U@�hj������G��ϻ>�i�+�C���������S�W��n�CyI��p�.6�>Һũ~Ԥ����R�f������M�)$Kӵ6/���2"֦���Q%�,�#�F�	��.?�H���1��>�*��}r������:l�	�x1��n[�0W���]�`��J�	�ո����/|�ډ��>�gj˚�P��Hn"K	�y,�!xH	JU��7�� A�d���ׅ���S-��p�ĝ�k��ў[�"�Z�}T��<k����TJ�pLI�Ș�[6r4/.W�M~���逪'�Y�!�uahk��q��4�6$�m��[-��+��+�P���b��#D|�e'H��!_G��3���Im����c"�&Z������������qSՐ�����1���V7f��2R���(�Nʝ�{�V�,6��{Օ�l���xQ�����^T/���,��d�^5�$�f��qͩ���(D1��3<�v�@R1��&q����OQ/M�Z2�d�H&��,Wu�嵝b����2/*"�������u������Gh���᥽.�Ὲk�%f� qɢ��񵷎Zg_�k�2��z�KWڪ��ܡ��FPN�/��{v8���Y8�JK�,�թ����-��j}�I�ZMM��)�S�D}"k;�1�C����6����,��WH�`%��T�F i(����1��d�1ԎT�؇�C���*�l^C���dLPzȂ��g08]��L4��A\oy¹Nȡ0O�8��� �jo��ݼ��a�N�:6<#t�;^���<�X�.��ǥ�A)�h�
!nD��Z��[p&Guz���ܘ�����G�{	>f'�̞��qqm;��6����BD,1��qX�����G�&��z��}��z!��+,4t���tE=�]:�GP�M���5�h��u㢩W����d�����N�1cr��]%ޤ��ͣ�;D�,��W��:�2�=s�`�hzʳ?Ϡ�?>���"u��yqi2%�=��#_��n�������#XZ�qy[{c\����f�5���z|B�r    ���&ru�V}�Q��C��q��2Ϧ{���C�{}��	1��4���Ds��MDL�e�J���� ˘��99���?�N����_�Em�f�7+pS�7D2(a^�|���+${l?�����<��k��s�BC�73[oް�>�JjU�J�]�Q�ɐ��*'��1|'q��L�3��Zd<��V��!��`�;m�Y_�Z	��RZ��x��������62hO0��u�S3�4."�����(���8~�/���ž�v���w�eT��VuM1��&���C���RNҮ�"��FG���?`;f1ҳ�`-d��!�P��%ס��z��	Xe�cN���՘�$hv��=�e޲��%q����H�)�ۈj���N#��hmɝ���t/��o�86w����ڂ �+�wz����w����Mf��<�O�b�86ϰD5B��L�]�n\D�J$T�a�U�^�s_���F��<��f�	��j����lR4�����?���:��F�����)K�����8�o�K�P����sB���j�5�s�����c�=o�2�Jo�O�r�]�HYT2�q����|�Z-��¡q"�� ����|"	����n�1�,dy�%`���i��3��"��u�/�$^�G�f�U-䥸f�S�ƥL';/{�漨�IiCd�����$hR�Z����L׶,݅;�����}���c1B�}v�Jxi^��Z\;K<�q�~��U㨠c��dc�S{��&�V���P����d�0�M����3A�W�g_�=���
d(L�d�����%��\OE^�7<RG2LN���u�݇'CQc��Ւ��С�+��*�Rޭ]	������4r�Q~�Ng�a��Z~J�i��0�*��Я�FUN�q��(���(�PF��CEu�X�$L�In�<p��z�ԇr6���R]����l����fc���>~'��,ͳ]��}��R~���
����ytn���� �ɑ�%hh��<\I�6.<4��m6��_KUr���>/�T�^��ؘ���*s[�� #���(�\|�/2�ٶ�g�M���Myd\�bu,�.M�V�<A������to�������l�6�$����1�I���k��#�o��i��;oo����v�[{�E�����uQW/�_gys�M5t҆h\t�C���:�����z�������\�TGQo�!
�Fuy3���)��N_�;	�Q+0jv�+�6�\뙡fǸnȩ�h�F��Q�_�N�2s��Y����\�k��A�c�`�e�׬!�m3u�4�4��Dк�,��a�c�S�@�SL��N�W���O&7�\g~�ɪ��m&�;�����l$ܷ�L���l��Q�Nc��7'�f}��k�#(��Ӭj��P�1�� �̔���pKp�w��Ɇ^MD�\`��h��K��t�?����`��>�U:���7�yI�d�W�*fȕ,Ծ/����K�{�Nۗ�t�����L��O�٧t���f�q��Ӷp�� Ä��[�K��c���1^$9RGr�7��/�e/�ȹPWP�N�k$�-ĽAR�ߧ�Y�ج&�`ޡy�h�!s$���K�GR�6/�_�{$U�i��ڬ���&]���m>�S�s�	�3t��5�P�	�±u�Cª���3�w*��+F��d|H�>��>���I�,�>�@����<�� I�b���� ����>93�`v�+L��5���R�:��� ���w��q��K��0F����&}��|���4x�'��?5��̀a<TiI<�k�p&�.��6�+�n�s��P'���&QY�F)�PʰWy�"E��v��Um	�ʩͬ���Σ��R�)0�(�wR�ǋ$Cw�է`=}�u�l��p�Nb��`���+�������z���3�{,noW��U�S
^��B�N �ޑJMc�tB*#F�jx�@���v�_�R�g���/7.��xá��/���a����g�)�e��o��~�h?���"⡍:a�,��:�A���j����&
��F^Lԓ�O��I8	�������G���t�V�tѳ�Ů#6�["c[[
O4ː^��xaT��t�HW���!��i	F��\3/	w�d��G���+�eiX��/�1Jo&��*����"�j5T�x(	��.-L"��`�X��!�g&(����W��;����ɣ��.Ǎ�%�H�&�b�7��+��\�j}�>�~g��ځ��K�{������������j!��\��v��Y.n�%�3"W΋�\b�/����_P9�L?΂����l���2/�c�C8G֞��bCw��R�=��l���7:#*P�@�ѲԖ�A�<�-���I$Qo��*�嶺9��,���vG��FdƸi����Z����]��m�'u�x�{�fwg������Si'��P��Ku�����p�ΏEb�X�G�?m`��xq�T+E�j1S��]�V��oNbhU$�1ޜ��Ї�N׫�S�o�_ٙ���Yb�mke������c���:#�O�"�b�X����n�>^$)Zo��<�Z�i�h/'���kh84㥥XŸ$e����!]D�}4Q���=���J�b[*��k�%G��q�^��*��͖��ѹM�)%��~'�Y~\��{��8;��/0�|B��@K���Ճ����{p��@���XF^��v��E�G����CC�-��w%%�n�G	Z��8��� �-���x���x!��z�<ҵ:��UIC����`�jJ�'�Ei�i���W��=�Q��E�&�fcCMc�U8�?%�jo�a��I��@,��޲\-;��}!�I �yZ��6��n�HRt�����2�;�� � ��vI�= ����bɐ���݂�齪��u�Lk�	��l��R�0���F��[���3�B,қ�b9���͓�n��R�p�\h����d�s��9���ҡa%?`�͢�X�y������8�摫٤3���Dg7a�f����$ƪ�)�k��j+`���cs.�oK=�P��i�N�؇�6t#���|��S7�	�@��<6�P�ΤZ1�%�^@����h��S�_:�ϴk:=���Ų:�>ꓢ�@1���gߴV���1��>el_��?֔hؾVO��w*G�	a��6{	�˩m�FM��*v`�R�T�]���i�^�HQ���E�M�â^��tU�+�g��k�X�'�E�6y��xiM� ��=a9Ե"�~�	ˑ�'���<��O�]q�_�8}��4�j66RY]����.Ps���k�w����ry���{\.�V�m��F�$�G�L	NJ�s��~!���y���JT;}�w}�$�?%�u�܁�q����r�y7/Ya�ݪC����(�C^V�a_��~D�6�M�NHGg�������R�ˮ�(�xJB���]�'��$_���f��~x���A�b��E*�VR�v�f�/V��V�˱��A�����c�.x��5���!dz�:���FJ;At�A)����G�����g�@���8�u:_�g+�,#�\J$��d#��!B�8Adh"���5��o�z�믡��pvwg�	kU�7��}9�?������cQl2���7q�-�$��b��a��aH!��77&/���6Q�Da�#B���u�twR^f�~4Dە5cz��,R'�9��&��S����������-|ac�X��g/	%�7�2��+{;��!�՗Pp3Y���g�/B{y̎����:�����s^�U?�i�{�9�U=�"�����t��:_��H��!� �/8/`LЍ������>�M�MH��#n�i�֠��'�͎���z<-;���A^<$�BRy񨒆��"n��}A��u�"�v��P�~�k�X���dh��8��0d�&�����1�H�%V�W�'b�_Cy�|�19) �ڵ����"�q4S�H����>U�M�-�yqP=]�/!ZE�컑��gI٤�oo��i�5N��u�^���
aaB�%�4��Γ��k�18N��&�A�Y��}�sdDCs�hX%󔆗��K=A/Bk��^���C�M�U��    ��rӔ��2�ȷ3�g�9�O`�Ο�?	 �;�S-�eL�0��*�:N �*i�1�fZg��S��~�1��~�GQzT�/x���ަ��3�޿p�kӉ�޽�0*�'�L���ϰ*I��k�]�$������&��KTe�ōţ���U���n���
%��1ð�6"�|��1��`"��Cm�Z��!,��÷�!�~��C4���� >���Y�N_��_$r�O���L�0"Q�f=Мi�(bt/��Pl�S�B�-[�HC!�ef^~9A�i�g��1 (��bY��h�ѡ!�D0B��S�N�5q�9l�sj$;Q���8�1�C�(�$J��]j�k�3��'���Å�tՏ/`�&��k�=�����r>]����qc����%Z�Āۊ��g�ju�tU�%��IbH����7��O�-NPX��߲�U$�a��DV��(l����Eգ�螀bݎʁ͉�ߤ��M,�*� ����1��F���x?d��Ŭ��6w��}!T��k����Y�(��-��|c��F]e`\;ڐ�;�x� lOv����Ꝿٵ1B$�<�N����O��.,�D��?���`�7}JW�O�ӴȌ`��i��x2s�:�{��j_e
�xǫ̌ߊP 6��z�����U�U���m��֛Uzc­���K���h(��`S�q�7T��9��4L�,C?U'��{y*@ϝw�:�_�)#v:W@�<�D!W�3�r�%J��6����k�/�m���Je��X.�������m�h��0O��?�L�i���`=K�ڹ�,Y\_l��\��ۜ�H�O�n��`���������&��Y���&6�E[�j��e��fs��T� 68`d�X2����y=�ƾJO���U��픻6�����W+���W;?��Y�:����Z� u�P��N1����rG��]�<�g�\e�U%y��� ;۞�<c`�:?��7�"�M��"!�ۧy�1�<d���M�����k���#�����'�x���[�~�|�V�E[-5U��\w�	�*\^������v'����t��ʹ!��؛�m�����^��M��m>�Tw�1~i@�v۽���Dw�	���F�Z'����`�YM�:�8{��X�����Y>.W���5�s7vP�רc�ĩ���� +�1�ȁ]�� gq/��/o��BW�����c�:�"�iX<�S�ɏ,H/ע�̩�QWgN
���(jgΰO��H��z�S��8�9s�C�m^i���G����1�������5�<з�|����9����V�=�]�P%�F���l�uI+�D�@Y���Z�`�a瘑��rw�����ϝ�'v�y	�M�^w��C��.?�[^I��V@�/�0/籫������%��>�/�,�'N:�n��}�k�cy��@cF��}�i��g�;<��G�I�+�0'(�iA��c�����2�����\�u�9��88���"1�0~0 ��Kw��1��Q��]�W��QUfm o\�\��Y��^��πIƘ����a�PǍ܍�	u��V����C�D*N�U+���h.x75�s���bȌ�ż�=���O����.��5���?��Z���휜z��$��ˡ=J��El�C� ��֐�|k���0����U,�wRK��<��z�PBh��^nU�]��L��s8��3�j�,�aL���6�r��]���2�ɱ��D�Ԝ�Vܪ�+8U��]�`./���UJ��$1��\Aq\J���z�#Cυ�q%��h�H�N��74z�I\��{�$G���"�䛺�ٶ����C)8�kB�S���\
t����<g'y�� =�Ez��_�f�h��Q88���ؒ(�Ĵe��~
ˈ1�B���Z�U��4^)�~3<�+����׉0Z�?g�����<��p��Ib������{�&A�"�}x�(���gXő���.|�eŘ��Э̎���6�4z�L+�'KZ�'�Q�V���� ����N�v�!A�����z{\��	�t~��;�
�~��/�d�8.��&���
��cI�a��i�}isz���՝F$F�	��Ք�よA��%�v[���rSB��6�a����;�Փs�&�`]�˵g��5M���'fa��MV�w�
�>��s�K���U2���TK�ApZ8.�<0�Z�RaɈ��C�_�c�\���\[R랜Rxo�lz|;�1Fk��K�s!���o�K��۶��^�\rQz�ߞ���:���z����g4�u2$I���Pt֚��ۓǑ���uy��Lo-Q#T���P-#S���g^.��m��5�]�joqf\������3�b�"���<d�^��<
�xЩ�nx�.�b���,�������Y`˸vu��������f�ywݝ�g(�O��M�}�����&:�P��qX�����x�ts0����K����]"g�2K��=�&#��l�@˗�fz����U�cf�3�]Y/4�Fb�$���/e�T�^���n����|k���=���Њ$h#���3�����5;������zYf�I"\��	�l=IDI�n�2f,	����r%���vl'����*Or�x||.*�Mv�� }�,󞡃�
Ɩ�����e���N��Ь~g	T���ڼ)w$�R-����|�Fѝd���' �o�j׶	E�!3�:H�xy���F�a6,��;�#ºMc#�ˣS��'�m5�̬�ܳ!qh(�I��X�����D��{���CV:T�汵#�t�&��_I���E��yi;����=a�f�kU^2�g�P�MO۽�������?�S�n)�e�@2�M���Ő�viX������l�~H�c�����;���T�9;O|Y�̮̆s�)[7.�#E��uv�w&�݋ђM�Oˇj7�ݩ�a��5���
�	�Ze���,��G��첫<}�*�����|:G�	�S�8i�;��e����hU�(r���D�E�lǃ-F
_��]j��6qe�P���8�Mx�s����<��G^�ӟ���>.���jfg@��p�E�e��0�d6Ӫ�w�	���������½��I���I�7:�FnB׬5Bct�,�Z?JڜE�Sݵ��A� +6X�ss�r'd�)�.B�֓���"�S��k�H���뒁�w�G�f�˲�r/����]�HA�h%�YG� ,ׯ����e覫C��+�?��#X�9��Ӗ�9��	#��Ǎ�L9�@�)�Z�g��=��k�^c	�jb���`a���1Rct���@��gt���LK���4���v3�A�+��6���SmZ�x����L���%��V�:	ԯ�H�\�ߊS��l�LW����Ց�^.��WU���$�ŌDV��֯�ˮ��1��3���\��گr#�����7B�"��:�06�vVŤ7�y���Hh��^33V,�;�:�Y~Z>��v��.$ѻpH�3�`��q��Cu��΂���e�ɢ!S1�7���c!�#c���I�Z��E�D|������q����FK���u`)�X(�`^\��/����%��Aw�H�O�w��҂��Zi�0F�9ϴD�1�U]��� ��S�R���������|��O��:���>����,�<[�6< �H�K����h��8�#E41w�y�;wޙh��@'�j���f<�CU!/G	/ٱ	��t�ܔjyoɨ� )�Had��"���ր�nc��������a�������BȵA�~cjhC�rNL�n�6�O/�@���Q�y.O�� �-����T�n6?ļ,a�ھU'�H��~�k8`�H��HҚ�ux�$��A�����8��fz>}^-k��oW("R�ઊ��@)��F��^��zg@��W�,����c�ܻ��u�'F�S�Z� �F�%C��lq[}1�7�9f��sT�4$�~c����!H�y@O�j�~��eq��a1�m�����V�O�
$�=_M���J����Z\ꋚސ�^kȲ9���52�ဆ�)��z��	�    �-H_��1X��t~c%��A8���݉�V{,K��t�|��0nSL�_��PKW�(��.5�h�m!��j���<��F�"A�{����[eǬ 좇�B�fm�D ~���/�\E��3dA��7K+���;_�Y�L�����	
��k�C��j��ɧ��*q�
b��U}M��S	ϳ�f����=T��VF���CEac3�%W���%=fy��	�ADL�����,��Qc�+�	�p���kVݥ��������i5�|d�V$qUT�ĸb������d�s����jlxR4�ܩq�YW�!<��"pk]յ�z�Pm� 2�N���2�8�Y~\6�wȠ,�P�H NLZ�4f��N������ӧ�~s�L"Z��x �6���5�k]ݕ8
�ިo�'8��v��,n����ј��kz� �ncԍY�D��|��e�H�_�n�����0�&'�_صdD��2�0��w�t���W�G�&�]�v�~�� ��$f���1~�Gp��f2� ���[5�<6G�G�q��F�8�l�t�5~�~�a"a��q�
w���S��W�[O�g�*^J�e~:����U�T�Ou
+(G
b��ռ�d���:�V��>��wO��H�j�����F�NY�v��RM���	r�?��A�6��J��e�~�����a�cE����ƕ1�U�C`��uuڙ�Fի,>��`��>��䓹�=J:�{���qĸ� }�wR�G
�@���!P������]�!��9�Xl���W�X�N����Xm��$�z�g�ׅ��Q
o�� b4OWK�C���)R}V?�*x^ޤ�ϗZh��l�@�9��)֭�ι�߼9����
o��b�����J����>�$����;a���zH��3�%�T�s�M��f$#S?�q2Xy5R$cU>�_Ȇs?�qܦ���$B��`!�� r=���;R �1�����F��ӕ�0NSc�ȴת�&�R�7Y��f��;��K�~O'���y�ާ�i�(Od<��ʴ��V���(2���ޭ���G�q`����i��5˞��*��Ns�Q���Z?/�1���]W�,�6� ��BQJ��Q
�?�l��+b���z�4yk4a̧�ic�0
r��~����y5޵�IJj<��6M��Z��� ��t���-�Z��.Z�T3�;Ҙ/�Ĉ�E�q�J���/�ZΌ�l"��/�����M��f�:��t�<�x��P�&��qcL�2,>)�1�_ީ�cz�i3����v�TC+	;�Ӯ׹w9A���rO��f� h�!}��z���9GqI �5��o���a�#�>�����Y�����\�~�?���@�������"��Q3A;p�[�-���"7��¦�v��2s��R?�f~��f�����<&�f�G���e����,��r���}��y)BD�Ю�?��+Si?w�q޹|=��'���>u���n��ou+�#k^j�n��S�	ӑ!��q�:��M<v�n
�8Q`ި���w�>Ǌ"A���k�g�M�~`���c��̑y`���� ��4<A"]N2�눡��]�Y&��6_5,�圔n�*�y�'��X-��C��"Cb1���b�.z\%/4�b@�^3�����;Ycc����+g��I���k�E&B��������>P�.��N��,6?�@��m"T�"���FvT������z�m���S���Q6�ܐ���о%T]�r"½�5_p�ֈ��f2��0�a:���<Ru����z��z�E���q�g�J����V�H*�yK���I���6�NM� �0��Tp#��8�S�)]�XQ�(=m�� ��g�CG����8fF��Z�kGd�]�Xq$(�Ý�/#!J��ѻ8�ԘZ�0=���lp&�Xq����c�K !	9q�bL�)�v����y`�n�xɂ��S��k'3~��*��L��pQ��n>���}̠Թ�;#�Ľġ�tR�WV���O�~+��.G���E��7B�<Tft	�t�v�+}�ms6�%��h.Xlc	�yv���Ǌ���"����<y4�Y���X�3=�Q h��=����w���j�����)�4D�!Tx9�`�i3O׶����bk����z+��a�j��qq����+2��Eto�wGJ`kp=��5����(s�YF�r�G֎62r��۫�A���s����:j�"8:�E;�u�;�����w�s�=on*Cd�.�d��M��O�"M�d��Uv�!!wm��F�Ƈh��[���U
�{�Xq�h"����]�
��^�Pj]_.L�N^���r�(��0�ٗ�K��{2%����u2e5�H +��Z�:cZ���l�X"USMj�I�_�zr�d��E52��ԟ�U�,O8�P�Y�4�u¡���"�B�J؆��lc��_lU&r������c����i���_�f3�Ul	�H�b��6ǀb\1w��'��Xa$h����zjNťU�Sm|�*����82�I4X��v�
��cd~,�e�FP8�eA̓M.��4d���,V]��rrZ(�@�1m���Gn��:�\h���%����Z�9��%|;�EF{��Ӥ�>�74V )������!���Q=5_ZO��t�šeҚ�n�>�@��s���=ˏ���C7�C�z_��o"��Ɛq��i>ǿھ�&t�u�C��/��Y�&��+2O/��}�h�;��R������
��z��\U������q����yFL4���bO[B�/��Κ5ԩ�|��اE�:����̉��
�i+�~	�,TĲ獯��M��]o3�J,?-�=��d��RQ��^��ˆ���Y���:ў��n���,457֖0��h�:V�T�r��<C��d�~�OK����0����ªm��cgi D�ȝ�Hn<jèa�N+�-���������A���*u���X�Okӻ��G�o����X��h�;���<]3U&wy֥J�Y��R%�2K���e��I~˶Otʇ,)����f��?�u#BÙ�Rw�'a��yR\)���R�������C�b�ݴs�C݉B^w�Q��1$��Ύ핋��vV��%�
RN�J��'�ղ=@^j��̃*��U���\h����֎߫���߂�v�f+��O��[��z��Q�N����I"\Y�a!"l�#�T&��I���M�J�Q���?02�4V��`v�f� ��[���:�N���NFZe�3�FD���KR=B�Av��Q��v�N+X��uz��N�&�r�w߯�<e�����7�I��%��nF��H��R}!�CvA��t;]��G=���{�(s��ڵ;���Q�:��5�����#���Yv7��`��=���cv�[��_[B
w�S�<Z��	)\==�Î&�������	���i6̂Z7�؛��)䬜�'�@-��lp�������C���;#^�T���C��`���.��8	z*�y��C���`X\:�2��	��	���x*�-3O ������mvP�P����y� ������r��xh �V-C��(F��Bt�����T�h�0�_���Wϳ�o7s�í��O,���'���߳k`� s=�[oRK@�}� �>�C?1}�=�[��w���;A�������Z}->W��a4�5U��X����V��q�7�#	̩%��wyVg�jc�|�,��i�k�w��ǘ����5V��IU���0P�Ij�,ZC��A_��K��=*�a
�]�*`st'�@�����0��c��$V-�aG?�����h�#f��P7� �^��R��7��o��	��ER�E�V���8}��o��DF�
r��yVE�@��_e��2��W�~�z83Uמ�$B�cPՙo�����t�zLЄ�&L}�Cd�&*V���_�t�Ȯ缸��tR�H�9��
��SAXcԝ��*0�0���.b@������FI��n�֝	�EN*AwənVr@Ί�wL�49K��WV@�v�c~	�)Z����9�W�_����,W��    ��9���P�p��H�zk�͵�v�m�Y�V�d��*�3ժ�?��f5����"���ݰ�0�8Jja8~�O����鿳 �{�ָY83cU�*���OQ����~�߯��@��tn+�V����$�r��{�[7�"��VR���Z;���=/"���V��g�_�A0X��3�M�H��#"��`� ��G"�u�%�����$��]�Qpu&CR��r�'5��_�kLTx�n䤊�t�w%�m��b2�g�����"(��#s�|Օ�9X������&P�\��DbzB��GL[S�
�V6��|��Uߐw�c����b������ؐM��O����3ȏ�U����aS���6H��|�wL;4A&�g���'���W�)]lg�Npef�鲂��WV�N��N�=S� W���I{�?��M��>@�H>��X��/��H��6_+I�Lh�C�WU{���!)�U��W�K�cz�鬍H��Aq�$��k��2
�-�D��j�3pB�L�4�s!T5�����Ol|�r�_�������%t³s�M3hF�N��;���&1r��錞7���Io��tM��GU���.ׁ}@Z�U����O g��Azl�䛏�k�/��:��&ml%�re�p�Ѣ��r�t��wU&��d��8�RYjs�t&��D�u�锇L��E���V�L���QR����/��Eg�<�/�[
�5X�M
���6}��~ΟP�	�S��n2ߔ�z%C�}vDf��~���wVS�܄��X��L�����.��o�l:=JrvZc1-GI���0"�O ����l�j�����\u�S0�]4�FC�`C���i�W]xvx���1��:R��l�xz8c`���r��R ��6�{uˉx��x2UMY�k0�?d��v9���{P� 6'�HS}2\����=�5B��G�_�z�Կk�L��O�fݺC�Nj��I����-r����X�� ];kKo��xe�:�YǍ���GTX�I=Wm��@R�Q���{�>�,6�<��G0�N��L`���s΍%0���3
�n,������46�͒܇���aF�a���J��{�JQ5������B�x�ܘa���sc7#�<��IX!��ܝ��m��'Ȑ�Ӡ�������)F�6�8<�ݮ�7�[�(�G��Ώc�G��"v��w>!�e/����΁x<"���@<������1���н�#�k�׹q�K���f����8l��^O����v�e�˾�}F<���f�qM�P�(����9Ho̎�Z|���Ck��r��`�"��i2"ix߾[��`J�$˿�v�> A�D�[HPW0r��dM�w02u�O[������%���!
`ʬ�����*�� P�V�Wյ_��)Xȭ�����	US�L@f"ֲ,��Ʉ��ƭ�	�h�z����/g�a6O�f�Y0��$��YjN��'��(=d��d)�3��IiXa�f���`�h�T%��ަ� }L��z���8Z��Ȉ:x�1��[þy�_H4۪B^�?�Lvbp�v;�h M�9f�`F�L�"�6�|�Vc�zT�o������G�v-h����3D����	ȝ��x.�J��m�c1O�� �菖��Q��s �����$/赛s��(�����>�9�T͑�r�.^�I�7�{��f��އ�@Ȯ �?P��B/�L�h2UU�z��Ԍ�d��^$6�'��r��=��S��<��@$���nM'Um&2���)4�6��u�s��Qz9Z�Z]��+������8��X���� ��@S���r>����C��N� �~Xj��b���;�\��F�uY���W�롲��^q�+��;~D�z�>�h�5/��:�d�AWLlnv���"���5�M/``{����}�=��'T���ϻcbg��3O��NX(Z}��Fe�ڹ��f�R7��9.Uq�_�X=���N¶�۠Eq����m`&�SqȺ�C:���&����a� +��ɑ��s�I흿ݟ�y��MD��%+���]�oZO���2u���Q]w�k���ʜ��`@�lW�нRYӕڸ	�W�`�4�)�|+����p��yl�"Ͱs��Z#�͌�����7fᧀв�tfoq��h��k$7����=�Q�(��<]Lq�:ԅ�ي��}��6Jw���O�!�S�S)v�["��y&6�ì����������X#��:��E0~o8�8�Ff��Y�%��L��2!�Bq����9�WHꑧ�L���]w"1��3�x�$��N'�);]��4���)��L�PyA���&�B􃫣Ŗ$�KX	����������!;�v)i�]��L����
���?H���z>)(��G��P�s����B4�7. ���4�)��h![��Ҝ�툱r�V�$9�-
�*��V��7��taY��I�=Jg��'���� �P=�z��k���𛺚�f�Z�}ԥ~��E�n��Y}
?-�G�����͠�f���}�?�>���ڡ%�"E���IX�ϣ~��z,^����C�aJz�y��֎P��*)��IOZ���AJ�"�m���Ybl�!�����yL�b�N^ϟ��N�9��u��S0��Q�f��S IdM�O�}W�=� 67�1�ͱ��ѣ? 2P��	��r�١]xC��8	�$�$6պD&�\[�Q^A��5�K7�v`��ua�}qZg�(
�Q^N!y�OW3�Sn7�vS�ڇ2cr���Sǎ���S���՘�����l�~�U�:$Ed\T?X���m�C�u��v���s���jA�e�D!�M�a'E�O$��c��	�O��t�~޵��7+5���!�V���Ҩ�����g��[u,w_�=��_v׬��̝��L��غG�55�1��@4F�S7�4Ԍ�W������o�[�t��m��O�a�JqY+$D�WǙ#��(��0�m\��-7지���<��s~���7:�E<25;Qb�(�Mąј���y'C���s^ȣ�{I�/�j�,b����J�)�?�\��yG�H���k%Č�8#��*~��Ӿ�9��J��� ?a��E~�|����\����Y�zT�t�M���5K/�i� �)O�kJ�S`��mq����0c��s����aܓ0�5�O[�ɏ,H��T���A?w��4��u����0�	�)��V�?�<7E�*.׮�A/e��dp�:��p���1JO��.�������A���m��1����4��y��ژ��{ ��#�E�����2��^S�8�;����f�k�g�ơBuۖF�੤'e��2�I^��C��7�T��0nL�Y�1ԫʇ����,��׎1��+�Y����yȫ�z��4�e�dwȎ2�+���!��gugR�]-G(ա>9��*��_����wm�ښN
}B]K *pl�sV�w�ܧۮΜ�$����:B=��f?@��"���;e������1x�>���?���#���f��b��m�v��2���p�H�W��7�g�3B���W�f6/�ؿ��4Ltbc��p\	b-�1'����~& ct'���|�fU9�ccu�_$=ʀwhjݍ̵�H�K�J���~�AfC���MʽC�V���ϸ�����DKiĠ��w��=g��2]��W魑9�J�Y����������$Pz(GsY@6�P��ϳ��ʘ 萻�{��R��
M��t��U��Z�ү�%x(.?T��V��=OE�a�󚁅��i���@���v����½G�Qb6=Qݣc2t�6~01������5>2���㣈RC�j�,#�.�3�I�<h��:,">乧4��)�]kIg:�~���QU��y��� =��h��rW�`cL������{Wnv��K��&ܿ��$m�;A�$�MP��;Mu��w&�+J�h98�JZf��w^w�V��+R��v83���<x��D3�V<�	����:�
a}]C��V��6��2�׏=G7��oYp��z4?�1I�"���>�S�Z���0y�S���ǣ�W���������RΗ+�s�����qΗ���B`    �+�E�5��q��z_�Ǫe*.�<�n�`(����p�	k>o�<��1�K�W�����}x��p�1��ec3W3f2T�2~8#�>���Y���b[���n�qb���娈97L���<��{k��䵀���6{��`%O__��a=}�_ǜ^�_rݐp�Df�K��V���Q��t:�]�\)��&��"� ���Ͷ��<�)�y���0DO�8?a\Eq3�����;X�=˻]>��#(FfL�_߬�S09��6�!���9˻�&�=<\�'��P4'R���@:��Z�}����)r�݊�r}�|��kY�!��h�gZV�ެ�3�*ujq��Lm�ÆR�Ǐ&6f�X�D�xLc}�!9��w3����r�X������4��m��sG��*}���H"����Џ�ݟ���|�^-�X���U��f~��s�D!��NZ���H���ktb�Q]M5�$/Wn�
Kߟ�$A{y�^�?`��5�QS�~�y��8*��v{�ǣzwb)����aw���̮��_Ϟ��Q5iG�OM���-<U0;ʎɩ��߿�ʀn�pv�0U�`:×��⒳���3��j��}���{�u_��3ʭ���ޯH�bЭ��Y:����4vF�Q��4��8�F�$�H�<<�T;gk˹�f���$]S/`L�c�kQ'��<~41Z���c�D�5)e�&e�Q
��h[��)�Mv�aҢ�O�A�-a}+��"��Y/���/�W�4B��GvR�}~:ێ_@�u_3�P�AId��-�ɪyz�4q����^~.N__d�ή�񜃃H�mB&��݈C1F����4����#�96��/��\�	���[�u	zt�j���@sTM�z|���G
!�Ѳ<eA�ͮ�=��M�`���j*	L�z�Ǉ*�F
#ӫ�<;��Y�w�lܝXL�-ޛN}�@r r��8e�� ��Q�/jFv��e����~����Cչ���wG��;X�~�b��GwW,�aW��P��1���C'��� �U&uo˖�3!u�eAGT���:u���)���Ο�=z�,f�ucM��s�1B��y��5�;[I?P�Ъ�f��v8m-+�ũ�xM0c��Q�93p�1Rm�6�d�׶� Ӧ�Φ}�Z���s*ǚp���HqLЃ4��O�y�h����p�;|鷙Ru���䦱v��B�#%O_C�/�9U�=DFP�)VFTf7��D�&ߊ�GG;4$�J=(F;d�xs9>`J>R��]���n���S��ln���eq����r�����\J�Hq��tb�0��]	n�N��3)���V[�@�0��3-�j� �Y0NL�iK���)�Ms�2��WP!0/M�>����K�}�@��r���+X˃<�jJ�������(hH	k|2�G
e���E�X\��r>�T��T+��'�k�%Z5�h��])�1��<S ���-K3Q_�J��� �fUv��O)�	����LΧ���BO��t~S�T���������NI����=������>��i�W�.kLf�A�~�ǌ�Gy(^��!��L[�Жmn+��'9���B毝��ŉ�O4uW=иѳ�)�B=��,���͋LM��sf�+?
q������9NE�L��S�}�#���8��e���(��~���U�hbu��Iu"w'm)~3}P�EE"uw�҃D��4�e^��Z��JK��qh\g���
jv!��a���#E1j���m:�+k�}ʓ�p,�E��������b�zf1�8NY��t�=ݷ�}��aY��'vW����R�[`Q�DU�2�sp�XRt_�d��J�X��a*�C^��҆���rq�}yd���/�*{��V��l��m̡h�lq'�Л��d�}U��
\�6U��|�Ě�P���Y:
�V�_�`�;\Χ`r>�_��'��K���hL`?��,�qe�(7JH�/V_��3����Ȃ�!a��A��,�v	/�'�����ՙt�<��x�x�CO�deg�9��}�E�H�Ĥ*��"��q#����S5مI��s�6k��!�����I;����X2ֿ�����
ȫ�cyXޥ����c�'cI?��Z���q(�a>d��g�;��X�)�0�W[��G�sv�\Um�q�z��/�������v89Ia=6���;��ֲГ{�U1/E|�:x�?�Vӛ�ֺ:�&�9�ֺV�	1���ơ�n�+]��\~���<r�ΕE�[��z�Z���}#����걩�\[R:��!cښ��0"�~�M4_��l\���v_o0�-�u��a&b u�Q�'Y��h-�ȼ�na��]���š��KٰOeb'�|*[�Ofj��j���aZ�7��[�*(��n�$�t,!�t�2k�{@;�CF#.�"8kd�)�1�]�2;s����'�KmF���rңY���������K�͸��= �6T
x�+�H�h��`�{S\en�=/o�`�Η�٪ځ�ЕSj��"h+�J�c��|"]���ll������۷��1}��Jm	��!2c��G�����-�-�1�tP�f�Kq#��B�>Nߣ�A�E�S:Q�u��M����*a�U�Q�j�ĩ��T�A���}�'���_z���k�%��
�������,�/D�C������i���\M����,�m,S�c���1���Q�8i�}���|qd��Z�ĵ�I鞠#4S���ʧ�e(�����	E�ef�0�ӊ�G�1F��$��3d��[yzm�H0.î���Ⱥ`��7F�~��2A����gvy���|�NWp�;yk��t4^�CNۆ���/S��?���J����N���Wx��}�8]�>���n��"q��-�#��w�	(��ݩ�K�ś.��dhF�5��.�HO���A�����g��q�]Pu��mvH5���?�'�=�+8~�����z�o����np����f78�^u2��@�^pQ�玶�F�˖����:O	-�X5��!�J=5��lM�c�;�z l��b�a� f��}z�Wyj;g�!��j���D�oIJ��{_"pȾ��_2H��N8 �FW	���+k� �v����X����_j!7��7�� ������9��%�dV9�of�u�)�d�P��^���Ŷ�`G��p�)3oKX���	�������LO[0[o�-���T����-��loQ��iWl��Y 3m�3��&�!�"ax<�ma�
�t���L��;Ç��xd�����(�Q���jf=��~٠��F�!Ȳuɣ�QM�_���Q}|^d�.@�f���aqlg;����p���ہ��8�����Y=6��ΐ_M��j���ZEA̪�( �3�v���S���|k�����.)���=���R�	�>���s�I�(=^�y�f�����&fX&j���'��ֻ�ziɿ�{�^x1�j��6.�^ㄐ��������b��MR�r�r���Q�8Qden0sa��<��2�o�)K���	�����G%G3-bP�aq����9O	�ni@�%DZ�?��?�7�Pe�=�Y�.��
��f�ںr��G���u5�%~IX��<M'�\i����y���F�i�'��0�'��w�k�a�g�+�T�*�f9�]�����q�ʨ��dnH�eD}���:�KS�V�&��/�*��ɇݧ����úZ�w��\r��d�,�m;�3&FӍ����j7��$�^�/�Qu2:�����6}De茻
�lfg�a:��2ASu�?��<h�7�y%[ ��,��؎{Hm��0��ܿ��~�.&� j�f烘pS7�P4���?�}'���	6����nKo�]?�1.y��B��Q�e�\�ɼo�J��Kk��$��v�36�	J�xo�#4�̵�Q�E�U��\73Q'L��Q�c���87�,/�|����u�)���獼���:��ݪ�܋����\�L�B�ո�`_?�����f{ڢ�m�>�3���{�홛��3��1Bsyy�[� ]��� }�KX��Φ��U5��s�q�[�}�<�X��;ٙ4���Mlϥ��    �R��["8M c�إE�.��c�c3�	�Uo�iJ�'���@͂E�5�{�>-o?����9ʂqƖE�Ұ(T{7i���x�Qsp?]mƆ*C��<e{X�~����ۊ2qO� f��(�FrW��Z�S�5bD9Z���Y+��֫�)�=4�|�zU�t܁R��(75�4Xw�����U�86H�5x̓���$��t���w껹���!O��L\U�	���D�ʤl��퉏hbdx��&�a��M&�װ�OL�g>�5��&��DGQ�S׸B��9K^���Ւ�7������%��̻\w��1�\�;3/6�Ee�@�h�g�ͅS���^�}s�Sډplxb�3 ��^����m1��:�?2=��!�v��1_��MJ�k�Ӹ��`IA)wQw|���
�L��u���8�O	E-	�������1������js��B�m0i3����1���9��ώ�ԜiSbWm���ܘ�X�_�`r�!`8ػl�~��sd��:[�.������b�U����U�6�Й���Ċ8�Mi%�zv�9F���Y�Gq�
BP��b��0�p�Bb����G� �f�LN������C	�5��y ��l�����V��*hlr�[E������빛��DRf�|�}��N�2����G��L��fa�����~�ňa��g��k��d�68��}ߐDV���}C�h7i�r�PV���٢��i�`'�*��"l>6�y$G���WL~d��ܧ5M3�s����������q2T^<b0U�R�c�h�����;f3�F�Վ�-�3ϰ!�)�����b���Ne��q�lPYb��@�?J�����۴ ���78DIb���u�����}�S�e�:���pǹ��;>��6b0�������r����ff$	<5� ��J)�5U
�C�|=��v�y�T�2R��C��n@Lнܝ$P��Ы�rr�nGUAܰ�@ �P�41�T��C�c4&Į}w�ʄ�
\�zJD�$+��5�̍�ؕ���43a��,�U�Ē�i�9��o�z)�o��4��@ϻ��5XK�Ue6�{(9���9LL(9�u��ԌKu\���*�f֡G��� �$&�u0m'�4���U�sU_�6�4��R�xh���CI�:;�O�j��ʠ����G���f�A4�~h���$M��oXF(�����{�n|O)7ޑ����yo�ѣ[�z�����oc��bZt��&WݵN`1�
&_;C����|l>����`a����x�� {��*��U��<;��t�11�>���p#i;�ӫ;�J��׬5�0�cg�l�-�Imb�/	��}ң�Vj��:t����&��a7w��ے|��;0�l�pus=������?��_j��ol�4�1<_�58q�,`f6TS��-���Q����e.��vP�[�Sj�~��sp��\{�Lg�M��c��"��c�������;�O��\�Xw�� �����v@U����ƒ����(����uam�箋-�1�ہ�iO��
��ǭ��@�v4Q�F�n��h!L`�%�`�^��� ��F+B֐�ECe�����'����k�첖��Kˀfl�@��h!d}�8�ZWn���ۂ�Fy�5)�@prγ =�O��U���Bv��:I.
���l�(l��uF_�a�qO�|ͮ��7���bEMa�fܰXaCc��
$	�*���.x��,/��j3,#סcB�ؐ�a�%����9�y��h���YnebK�V'3�
������!TbpN�h��F�g�f`�UD��LjC��N����s�^l;TX�n�3K#j�6ø�,��"G#$m���p�.�MT�+�1�w�Ŋ������c��s0�ޟ�6I�T���!�:��i�>p)3Z�v�^?t�xW�:��H���6ܦoa�
�+H5[Ex8�ޡ�٩��w�!n�hA�v�U��Z�]�����Pת��F���G_����S�if_�<]�����գ	�%:ؙ�F�S��T�w�����6k��܌��r���M_QT��iy��1S��,o���@ε�a�&��DU�N�-�B�d�V(0M*sUy�Q4�(�9̆���3Eh~6j����}�exM�#z���yC]��$$�w&i�(޻�-�1�j&��˫z�ofs}#�(��=`��c����٣}u���΋"�4���v�>���Zϸ���$���G��lζmN=@8��+j!nt2}�8_d�y���ۣ�Gy������yi>�{W�kD��7��	� ?d���jj U�K{~����$)}�՟��$v�f]q��ev��b�l�S{�H3��������Ú�&�y�v�P}6$
G"nBL�o
�������̌H�րi����qc����=W����L�h}9�Mv�,XI��6��G�XblZ��2��G��_O�ݾ�xd�����r#2�6:Zc���t��I]��)'��Wޛ-�mdk�׹�w��9 �K���Y7P0��}S>�[����ߡ���Z���D�bBq����@���r��&�<m�ƽ�P��V̈����ˈ�e�]�R+Q�Cٹ�'�R�K9�x�|�4�YS��1sR_��hϥ"���)�=����^]�;��?�<���l��$o3AR3�B�r&��p4;�H�(�34��ZsI�O�3�U�Bi��y�3ys�7<�c���I$�)���o'�b����Z�ǯ�G賿,l��a0
�\x��s@O;�
�b,o� ~?>�{���Ᏼ�n	/G�FD�p��b�H���)�~<�����؟E�ل� L����Y�t�����h����cs�o��k�'�>�7��>x��u&�귏�d����9*GdL�� e���K���'H�u��b4��� ��P�:J���z�ڊ�t<ྑ�p��6��8�!�:�f�PJ����{�IẆˆ����#5M4*� �9�٬��_���J�4�gnIchK��#�T4 j��Xrs�{��4� ��XJt�pĔ���c��h�4P�9�4�B��n���¶���f�L���C��v�O	�޽�ͨP�i�{��Qg���QRRb�G�یU���X���Ke�X��˴�EF
��O�&�*�R�	�
�c�֜�+T�_����Ӊ�u�'[���3���eCJb� j.�UP�]RE�d��,X��־ol�'X�M�i���ɞ�%7W(���
�a������&3NO���~[��`!���Iߠ��"!�T�G<K���FZ/qW���qs�6����̧�;3`H1TDU��WE�n�C�%��6�����ùB��
	�ϟ1��[�;y0��]�]�(:3M�l�9�\q4vP�Wz���S�D��g>�l8��V����R�z�p���٧���xY_yVd�$x�Y�;B�q�J4@R�z:}������q��h���٨b�=ي���n�
?j!�8�&;�ښ2�7=1!�I��������7�U*f�7�h_��Kˏ�nv{����㯤x��X;�Q�vw7c��NƋe��ӏ�
�?^��SsJ�=�2)o� J;xd@Jr��Mrx�&��rngW��"q˝Qc4zD6?1�����t5Iu�?[��u��7ER���c!x��@Ŷ�M��	���ˁS������CK�^[�o�p��k7�"�m�����Ă�!7'��L�o϶�zȖL�c��\pW�۬þ�ܔ8ә��S�V9ޟ�u�q��:<}JfƧ�i���3��h@�&�ds���$h+�������;W��b�=>|��z3;�f�3���N�u�f��������,7����6'>��u��r<q2�d�G���K���u^��w��;8�����`R���H�t���~6Hf����M��R���C�m9����^�0W%�=~䗺̟�W�R6�3Z!���Is�P����GTc��ae�޵s�6�04M .�d۔a��=�)��7W4�[:�7���)�(�w�m>1XE��]m0��ͷ���&����3H�XI���]��J��$��]NV�    �K����#@hGi^�����8`��pK#��5Zk)0Q�=_L)�C��<����2/w��v4A[��07�h���u,�k�f�w�<~zz|8�.r1��O
���Hg? �|�Pr�<"=(��~��h;N�a8%䴰v�������$3\���s���Җ��~@��\!���As��' �3��cg�v�hõ�7�i���|�N����#�j[]��	O���C�L�;w�|N	��+��lO_~=~�[��\�2�C���f�E7e�b��b]��y�_1a���5|Ȳ�kW �'�4�j�C
���΢���Io?:Gi%�N}\�{9*��
q"9��V>������b��6VkN�����1<�ܩ�l77_)�>����7�&!�7�&��f\RO�s�0� 'ˏ�M�\��jn`���x��������f��M�N�F��e�L��JN��w���s�%Õ#ʕ�"�*Gƛ�X �<�O�E۾#wݗ�@xI2���i��oc�1#��ϧo�{R�%|���<�v/V�KFTvٚ ��<Kr�����
g��]Q��iH��L�h>n���2\���®�K?\�m��oj#�p�ة��i��*9[5�\D��ɢ�*ɡ�]\��K���тѳ1՘������N�9����kR�Ѩ���k�B:�ȘH	��C�{��!E@#u%Ԧ�Q!�[&j��Wv!�C���GJ
�u $:}:������Tv�k��>�7�d��\�d�x������ڙpA��·3�J��X0D��P�|9�����c\�K���n�%���%9[ۑ�lʫkǞ�W��(���@\f��>Z���]?d �Mi�R1��Mi�5T���0W(��=_���c��v�����lE���v��,�m_�2[(�Q��Ҟ�G��e�&��+Dd�����lL>[(5z�����8jy�5�RnE�cz>�br��lA4$�F����Ͻ��N+�]�5���w�F�|u�Վ
G���8={�'>�݂����	�\�q��Y�O%W�H4�~�V��Y6%�à�[���^Lg�C�ʹ���G�͗E�*B�i%���)�=�XRl2Kj�rR=���5�7~o�c���kYg����:m��>[<�}���ϛ���N�*)y����SEffǺ.&��x���,���|^���ߕ�thL�'p˺Ud �b�`J���,��NO�>�7�ȋ��b��XPj��f\׎"����v��nccW�GR��j��і4��"]0�����g`���"c�r�$e�aUF+��Bu�j�vf�_�A�+���{��Ī����t�a���^6iϰo��x�8�y(�?���<��L�	Z/�JE"u��'C|�M�Tj��� !�<)Me�00>��@i�4���f�=���<[%X��9��UZQM:rʏKNvǧ�����V{Y��IAD�X��y�w�\���7�d�o���ErX�.�5i��CuIl���(���DƂ$45ǻ����ơ�y�0��N�3�	I���.[��ո� =];W4%Y�qJ���_>~��8X}��[D�\w�b(���o����>>$W���)�4��
��X���k2��.�$���5X�6��`� )��A���+��Xǻ��6��"�z�T�">�C>��#9���-�X������=T:��J7����5�"ZF�����|�p�Zk:!9��qS@��\FڮX�g���Xw�.#��(2O��7b��3'����:���!/�ZɱP�t���c:���d���Ӈ���twz����/|M��4��3:��6�ƧA[(:�.��Ϭq�l��H�.�3l��9y��`N�N�l�B\�|>=��Ƌػ�^ՙf�q7�:Ĕ�'�:>=���N�3\����d�֝0hϔ��<j�����;�-}@Po( 1�y�!�)�ԚL�cwc)}Y��,���\O�S�c2*:Ex��O����2�sɰ)�%c���A�gJe�aH�/�w��yzJ�����>'Mu��a,(2RB��1�E~Ϲ�Z-��j��l6a�`���l֎˨��ٜq�|��S����m]��m��,��H�?U'��uU�����M}S;�2UB_�Bڸ*�)�.Gx�y���/�?��h��3�Z��j�,��5\B��~�0�Hg4%>a��y�ȩ��U���{Q��=���*_�J�y��u��G��9�=JS�1����!���l��&?'�'�UR
��P�xǾ��y@E,*R˛|7���	�X�o�y��el�z���M`��m�+�*�d�����$��@� ͅ��u��㼯h�4n����^/�N�8�
nm�]��ac +���~�M���0�Λ�X(x=z�n�� ����T�M�.v�~G�#g��Хm.t�a4��`��cB/Q��:oh ����1䴁P7��gs��T"���]�Ir�a�b����7uR�6�9�x�U��SQ<�Z%��E�w�����]���a��X�di��������۹�+ȶ^�Ų�lz9��rmŔ�ե� ?�����H^m�bp���T^��Y�.rI鋔�W�<�$��,W�U�YU�C�%�
�6�{)�b��7K\��w�DV�]�?CUl��~w���=�����2`��w�r�?c<&Ƌ�&��>�2���\�:O�cW62�u��l�ª�7���j�,nq4W���';	O(�C�)/�a��J��AU�pf߹C��˱�l�}/: z��3��6�E'[�h��RRT뼼�&u�]�X��`�J�����5�����XqeX#�u��mX!�ehV�St}&�O���u{�X!�ܯ�pS,��}WS������)O��p���[A.��N�ȗ��>6��i�qt"�<K��ɢ�"�=�U��w�'�d��2��2����H��]I�=����7/�����rO�[��Cػ���6^|)���]��J׶P*��*�t�*1�/�R@g�y	�5O�G�����Ш�PP����Q��=�G�H�h�5�uuAR�UvU�F]�/��f*��)
���E+	�L���,�%"5n��r�P�()t���^�mӹN�j�%ۅX������:�n�x�l��!�o8��E^�Ҥ��`�C��, �韽~y�3��ڻ�I�����g�����T"��F��R�0
�YN�%~�k�� ����N���E��g�F�� ���9��w�w��PN�6�ۮ�Y�tb3�lFa�dx�`��vy�^p9�UI�7�I�H?bv+���n����3�,Edi��B[���w��6���k�=�[�1i�n,�(4�]�1t7�w�{��7�nY���m�5�����I�(��.)��G8�E��w�.�X1���F�&l>��8��ɕȕ�R�r\��Ƞu�ۀԤd[on��f�Ϊ���P��G1���S����x7��[��}�9�d�2v�t7I�&a�%8��bK�ּ��cz�N9RY���T�r$^�ӉK���{_�7#G��E�b�zGK*;��	��7�8�_y����O[�p�z;U�=���{̌���,;�4Y�U�>.��z	�:XS��
�C�V~���&��v�����yH��B����
��%���A*���ɠ��|<h�K�?��,�N��H6dƶO��Rg"�)�_q=�UEp����|��{��kNY��F�~�m�R�)��A�pG�c�=5o�Ӳ��FG+���wC��MQ���C�Vl�;��;�C\vM�3��r7}Dx
��� �u��.V&�ER�)+m�L�"ёfTPRR�����3�����)�m���w��6��{�٨{�
NF����*��E^��~�O�v_��Kng�:�l{f�~�9�(Y������%�u�xn�qs���}j�u{p4a*�#���>���bF�bF���_X
O0�OoE�Z�(�X��@K�s��K��/��%��tg��'�w:a8�����3�*]����坔���K�L q�y0%2�i�[Jd󐳠1��������Ej�֣����Wb
�:���+\DxZ�T^v+ui��Y�3N�͏ʐҡ��#��    ����þ, �d��ѡ���a�Μ���z�\S���$��P�7�A�����{�		�e���A�����d�v�O��
��~d�\aJƽёl+�l
y����M^A���̲&M�p���2�)��s�dV���%�Ⱥ�M.ݡ	wt��O��oku��>��0�e�=�]N�k����fJ�a�L9kmz���� ���M��N��������a���*9���Q�Lo��mG:���f�m���KS��Lg��Db\U%|��*��չ��e����̖��Dx>����yrY�..��C��v��S(/�]��c�V�?H�]t���� 8�Y�-M:a�S4�o F
����LVɶx��6�I���VǕZ�p��nV^8HA�J7��}��2��/�	�J}���ʅ��c��#�) (",9)�m^l�j�Y��0"<MI8�vk�Jƺè����p,7�e�C+>��[��|X�T����b*�<�3"�4#�#ˢ`�mI�V�����q�$_��pP']�PT���r��]�y�ED�*7*F���?�MԦ��B���u���;#�h��rW�ͯ�B�m(�g=��1�P��%4EC���f�{�w��kc��S�Y��r�ޓ��گ����]���%j3�kW�S�#��u�~W���p�g�X�P����Pi�4��,��"�z(�jG��וf�X�ƭ+M�@�RdbD�rR�) ٱqT�����2�Ƣ����Y�o���Ao HA��Pn�$S�m~�ڴ��j�2 �c�um�>^)Ȋ�`��*s�_WY�/������������;�h�vkɳ	�Ko NI���w�Дn�8)Fraf�.+�1�
���y�iߘq���EVe�zN�W�%%�_�NEQڍ��ھ���`���G�����%c|M�y�i��46�ƽ;��QAj�H����-А�--1�2����2��J<�'��H�/�ڠ��?<�Ɯ����&FQII^V����Dm�_`/i��@uy�����uT8�3��H���-*C�P$����25�M�
LNP���$�z���5<�4W�X�#�7��#߁]'�Z��<���:��!'\i���({R�'\�~��`�l-)��jۜ��}Hf�^��%�#�[��]�l2��L��	ߣ�y#(J���\���%���jh�G�G�')���e��b�S�~�m=�j;
�8Q�Q2u*�`6N8�HM�+�%ۓ�����x��}�J��(���Y�h�ϫ�6�g�M�+���{�[^����R�˫����T��7����}�">��[{g�˓�8�۽��^ُ~_�c��~�&���s�k�%biv�U�C���@M�7��o���xJCs��_����i��fQA	��z������l�a�F�Y�ީ�cV�ƾ�߳${#`���Q5��A��2�B��4�%�,�C�o�&�hQ�[�ˁ�
�@&+���fG"��Z����7��$�m�A�nר�wn|��un�*���S_F�l+��f'��ֹ�7��Tǜ�L.q͙�9��ʄ
?r��W���D5q���$ń[�ã�����l�F^��z#(�/��&���u�Ym�3.Ť�1�
�;<�`����R��l5}�5�U@{E���m�Zjz�R��RR�^�eq�l��(�J�p~ k�.h�;����d8"BNF��;����yc���&м��@�ż�4�=��M�,��P��Ĭ �ޢu�}����-�%~#hB�Sل����[�</.�[�+.=ԙ��������a��v�l�t���2]�2���U)".��$ۼ�`��:����W6$���NT�A[���\�s�(��ٺ�wE�-*G��m`�jcE�Rx�o�2�� �����"�{h�oB���"��WzD(�,<�R�&.�<�˾�o�F��Fneq;0۰�%��T�i7�T)����!x<8��������^Z-<���G�s��:���l/�3���HIY#�n\�B��SB�6A!4�Z�݄��T]�ʑ+^Dxb�Ϯ��M�
�1�9�Y�ь��P�Edp&w��m����)��rf��tʿ�ӈJᢻ��?���/n���芦n-�SN�P5�H�� ���j�JЃl��K�"��fҙ��-=u�BOm�$A����h��Eq@q�f��m<��/��d�y�pک�L̇T��~m5Pg͎��ǡ�6�����"��*}��V��ȹ �2�Do)ꆖ/����!yu�l="e3�O�z~���0O����Nі���^��ך����\s�2W1N�3V����L���O�PvNw�z<�p�y�U�����Nf� w��]8�)G^��L4uG��ɳ&nFDy49Ym��.���\�n���iO�qz6k���c�E�������e���Tb_�x#������))a����e�r��MD��D�֗�|��v�vc&[jI���C~Չ�M6�v���ո�(�\M�����^DMdy�"���]�v��)�3CU�_��.� ��b1T��p#"c�v�3�QHɠ��7��&����n�]A�y���;L�R��[XZV��pw�+�K��ƇΔER��Vy����͇u�xCkN�4\�C�3|x��T��[t���w�R#�9B;��Ņ�.�@���z���D�Aلgޓ�HB���W�rF;7Ψ��JF�%��j�aBWhixf���u���ƙ�y�eLHr|�{�	�Z�p�?��q-YJـO�Q���w�}��\(}{`aRD`%)�՝�na�K�c2h�ᩮ��
ee�u}H ���_�4�/J�9#�;�ށc�e4�Jb˟]��v��<����D'�55A�{oCE��=�$��2�m�'P-��1O��5�&�Ԥ��˝�b�̤�=��'ۥ�Y,9�z�F��'�&�X�	�Q)����v�>��#A2��ab��v���W�ل�q�2W�gm$�*��1��+p��v��فZ�%��Qsb�K�ؙP��!��̙{#�ۢ��~e6I�����ߥ��Ua1�oKN.q>9Ќ��`ͨ�~���5�&��(��m�o��*�d�, �3V3�X���^���^��Ū"M�Ip6��o5�Ŝge3���C��6Xox�L^HG��k���F���E�x��veO���Q�/nl���΀��Q�e^�^e�K����Mfs����Md�08�u�ci�� �����MXv3��)�,�E�W�L�"��okh�s�`a��W�\7��E4Rx��&��Dזj[�]���	���m-�MC�{��.qW�e�)6�!Z;�2�d�B���e�Ǒ����U����� �f�X����m�T�-"���y'�c�;$1\t[�eѩù}��;ki���s����h_�A�1�9�{�����!�/ذE	W�@#��p���$zQ�d_�86~�"�42$�w�$�O�5��OPU�4U�i��T�ްÈ���0�)��[tZ+����]^,��j��,���p�܀�u4��BH�<קlpO�p�$��\��j�'7�%�c��P�8WP��Y�"��hq=�P�����|��Ro���)�f�ѧ̴K
4e�r1͌i�hRW�oPܴ]`BZM�JϷP�b���n�(;�L�D��dd�_�&//;.P8����G�b4��4	�*��hF�,�I��������f�� ;O[I��	.�:��EE�.�|�jq�(������������|��[�ý|X�r�B�| �	�Y��\{���͚q����8�ф�ޯv�tz3���q�:F�Z2�x�Lv�r�����\S%�S�dX�Ծ�aws��]$p�,��r��%�I�Tx/�.iw��<�c�}w��QV#<Qc�g��'��҆���0�M���jv���&O�2�l@�%
��Y'��D;�V����2�XDIə��62����ONV?�o�u�"�w6���m�2dLU��bp(�l� ����j2������b57Lq���ˤ*�y]�W/Ega�wր[2(����%�hF�s陃5���:ɬa�H��M�w�����w����fb�۬1�6������	��{ߛ�    �M�e�5��q[��?���KR+"��B���Xj򾄲��Hl�F��+�i2e��T�[4T�M*=})�>"H��͋���o.#�!��^��:<EJ*o�]���s��;(x��]~�Heg�#G$�@��p�ԋ>}O�$��;,�Df�r@z��Kgm�S	FPjW$[܊W�)��5&��)p �������Ʊ��$/��1�q#���1���?�CA.���m��,�Lg�Қ�4����r�j�0f䰺�׃�Z���E!R�hL����Yc(IY,�y�tj���kFcl��"�t 㫃sf�U��%<��j��t�9S���ƽ�^ꪙJ��5��K�d�W�U��&��h���¦��M�"�0F[:�'b	��$>�?�t� f)<��Gg���l�5�&j�'�d�.km8��1i?"0)Y�}R����ܷ3Id��	=�2ұZx�cs�u���\�7�35Zw^��|���dhd2�3J�^��'�g�%44�b٦�;��`�%���hh]���X;k��%b%����׶̦d�I���)�ّ.�4j038�%��n����a_�i�2�nL!(��ZD(JG��!i�nƑ$bʕ�*'J�+GxD����<�j�=<�%T�F�NG�q�Ų*�@K>ErG�'u2ҧ:,�E$��6i���V��n)�8�GQ�|�Ȕ�Ro�����/Ir�7A�����¹#�^ �^�j"u�HRR��֩@˫noc��E�1�:~U1�ܒ�.K�W�5����VL��5�^��U��: �"t�E�n"Ě��]N���EA�K'��6��s�� �M��>� =����,f.���Z�X/ʌƕ�t#rݱᅻGގ����5���͒�7d�s�T,�s�2ƨ'PY/?���3���5��l�N�S�[W���-��G������lH�ͫ-�f�&y�C�i����O�&������=�L�'���q=T� ;_Oh����;�ݦ�	ND�3�*�#���=�����h�Pw����,�G�d;��RE�>A?�mδ)��gE�\��|+F�yY$�K��I��,E��Rs������,�D9Ӭ����[8���ع��|.M0���ސפ��<��.��:��6Q~l��M��_>Y���MTqJ�����š���{����p��L�qN�I�+xY^�ᅞ�=�~�z��,5m`*'Z��LU��:��e��r���5 V���!���Dd��ՀHi�-_iV�JMG��rw����9
~�������:h
K!FSdʙ�����j�7g4ujgD7�����ۼ�	��,1fH�I�&sl�m�b�;	M�/y�A�p]C"�	�{�K�3���4tA�΢s�K�妔v�|0��ѥLu+��9���Ԝ`{��7��ܙ|{�f�[��ӮpMN���x,q�Q��L�������e�Q�bht�2#ˁ�I;�o�S�������4f���hዒŲ�]�mC��xwn���aSMRg$�<�۹@����\s��6]�v�a��v"ܾ"#�+��T��%��X;WP��Ab8��e��/;Cr�Q������"�7R�pRi���ܖ��㯪��O����� 9�w�Ѧ�c<g� y����m�l�h�p&��׎���2f��ad[T�|����0W��F�Z�����#'���ce,�r���6�
��..j���S���IZj��{[�{�v���^��슡gôe8�1�ex�i�[2#v�V����徹��j����Y��@��y��?�)I��6��-|���ލ$:�?td�g�MtR��9���S]�����`T�W��*(�,RxK6U��<߃E�+�爝&�>�ڿ��"QP\��L4����װ�y�i�!4d��N��>��J�^!v�%�Y?��������5��=��U.9ԻOH�a�����"G�>���E���OW�d��v������5�v��i���9G4�y͵
=m�b��zK���5�]�ۇ����M�*��rݿP�8���q�n䬳���57G97E�s�H�Ew0aS[B���K���-�9D�A��c���W��;�X�k�	��RsK����7Q���+B�9�(��Y9B~ҿ�'�'t&������{�L���B���!|�s(���5r��ϡl���T��9§I�E��������~.���9�M1�;��Y����WJ��<Au���;�1�}e���tmK�~f��|X�i���l�0G�(ʮѱy�'����^�'��\�ғ�$?*�����9B�Ȼ�u����>�X�3ޭ���-\�� �9"��&��g{)����Vp��X+�It�4[���(�)��N��n���a�º�7�ź~߿�q6=!@[?k�K��{�#��fv]e���2!Tv�Y�%��{��x����N��<�FQ���H�z�2��R~�n�Z��m�?�rڭ?f�^NI!�ӄ��l��-~���1zxu(�qH)N�#<�6�)���}x�� g!KIqkݗ/��������,�+�)��"��,�� �>�&�U�,W7�a��! �@��l%�w�n�O�+ᦽܯ��3޹:�$2��
%�ZI5�Q֍s������]WY���92�t���Nr��	[�4�5z-4*t���8�'`�tXR���̚�{��?�#.������s�U+QI���|�#����[��7��x�
!�)Y�X�ћ�})69�ßȻ��~w�jhh�[FY��&���·��&PO/��Ev�ʘ����Bz���F�"&��V�
��˺*�$���š��75���5�0˺��N���٭���i֙Nӣ�Q�v���M�����\�/��N��S�D�n,^ߤ��bY�`B�M��� ux����6�	!g{��� �~�Փ�)PJi9�J�ؘ�>�(�痓��nw�������E� ��.�@vM��!��?��&�޸�|�����:l�esI�h8}�kM�4��e>�k�� V� j�ky�(��9:���ހRБ-/H�=�5�~�w�(�s��/�|Dx�P��k�+��&����3�eg}��oj�5&/�|=ؚ�`�}i��������26̈́&��:<�^��gIۭ��܏�f�̿0��慷a(��r��۰*�����ͽsR�j?p���8�� �T�j�S��]0Rջ�<�8ʚpoD�e��@'�<�KYp�$8�^X�d��.�W h��bhi���3���I:�q�(
���$��o���=����J�� �C>&ʋӆ�@_+/~Wl�ݻ���	M0F �u����ͼ�.V8��:R�^��DۄO�f�9.���^�4�-����d�ٗ-�5�>R	w
�3���W�����=�v�yRa����Ʉ�~�]��L�."X�=[5�%_av����y��ڷ4Z��pݻ6�[�Iچ2ɉR��bi��Z�Ϯh�iL�K�5�Te���䎆;N��Tn|X���r�[]���9�X�$>�Xu"�(�q�d��:ԇ����vN
''�l�����ǂ�DQ�AFЋ�[�b]�Ѝ�z�2� �`6J �K���F�9́s�prRW��.���o��M~(.�~ސ�,N����*�4~(�o�LO;کj��8G��xx��3�:��f�dv�@�e�)|z�>>A]˸���8ʩ3���(ۜޞ<w���r�G"顛�)�V _%�̻os��kG�,�HU�fJ�}����⪮n�m�\C��k<�ι���u�a�Fg�!p��Mr[o
�zd�����K4���*��H�n�-�-2ޡ�ܻ!�;��5s��i*�TY>Ux6[�(�W~�mq�9[Ch8��&㍹sc��Μ�� d>߶�|L�U.X���Rn}�:b�t"�i��b��6��D8��2-�h�<�� :ٙ��c��}��ߨy~*���yn_�x?�I>"�:��4��u�sQ
]�(γ�E)=��9|	)���gfI��I	=�mYFf����ԍ�Ck�A�K��@�\Ll���z���WŲ���~x�
N���뫎��x��:��l���"?� �ܿ��c��T��+0�O�?�R�G    �����-���W�]�tl��*䮋M��s��f+j�wM�
>Ƒ>͊�]�ɵ6�t�p�2Bx��� {��t��o�@B��0�Z�7Ŧ���l뒆NqL&3�;�y)���b��c�Oq�˫����r�&�$���'�N�ҝ-���u^.�#>�5��>k8;����%�6Ze6��=\���s���vo%©&�9�	�h�
Se7��O���c^�;/��Ǽ�n�Tp��lT��[���
�5!�:x�%#�֒�+~~1����R�/���b�5W�~@���$�F�w"#}9�[�KU_�$v<v��B���n)��>gjBC=-X|�@��Z%n���f�>�VF��\-����KU} #y��BE��>3��GU��	%�7�3�Z�ź�׌XAyR�:χ��u3A�4�k,�v3�Ɗ#wħ�� �Ix?���Rٵt��L��K�Z	��Mv۝�E�uh��ܝ�gA�A>��Du�4�S�m����@#V���6n�9S��D9J���ڑd�#�1)�+����s�}Z�\NU]�IE�ʱ�d��[���&�,��r��R�e�ۼ�X�IM�|����n���<��c9˦z�@�-v��=�a�P<j_��֣2Vv�I�U]�l�r?P�1�I�e
Vđu�$��niC]��a�+�mQ����yɥ�fW��"E�n5���0���\$�7��;q��}��\2ԌLD��`�}}�lo���f�K�����,���5��.(��#�Dt�\#���j�a.�V�	��|�Z��	�����aU=�cTG����c���c�)��
.��1��6� ��RscyAJw_'Cgn\�	|�y�"��yh��5*b��mZ�Mi]�u�9	�k]~���ll�0eQ-�׵c0+8$����~w/0w�l���S ����=u�5lG���fzr�/Wx��3+|S���p[W���!�BO�(7�Ag�v�#&Z��K�i��`W�@������$\�ƩWM�:k��d���<�U=�����&(7�W�R6 ��x9��M^��k<�2\$�}�#S�Ɍ��X0$���_�Ikr�t�gf����{��w#J����k,Xf$���ݖ�ۘОJ�ܢ���O3��/��`VXR�Jx�8�����^����Gq��BW��BH�0Eո�� {����au��i������0Q��#�����\:�z拡&�	pS,���`^1�!Xٸ�W8��ƈ�i�i ��ѐk��Cq�0Cτt�L�ŉ�&�I���q�I������V,hWJ����LM�/���e�I���X�l<���Е�R`�g'n{X�ǂ!#�r�.{���I~9̒0�8ed�֯�#���[x��o�^-�/����׷��Jd��p�0|W�����9OG?���P����o�cHi	��O�0���QD���Vh��^��
M�����|�_�5���8�\�����S/@��ځ���08���⣍��Pl�һ�	7�0.�]���e�^&��+��;���5��B�8f	��<��˄e��l��J�p+4�*��g}������Jq��±@h��b>�į�r�o
�f��[�_��=ߚ�� �v��Q�G�9��^'�z�^����G��r&��My��N�D��|��dyS\������~�$`���$�3�O��H�Ȫ�V��֔�������t;��!�*e;�,�휗IG�'��Q��\H����,��m?I�Aj���H�٣͡����э�ER�ܲ�D��-���~�ږ�9��v��0����C����Հ��&p27L���J@b=��U�V���1 <']�L{H��8��"�|TT�v��~z�LTƚ\��E{Ɉ���b�I~p�e�]��I��٣?��,�9T� �JJ����Xr�r��ʆ���|Q_�����z���W�,5jI���f��!��o�'���;�%��M�ɂ�l�3� <Y* Oa��\�Y��G��U�������I]��E�)��wǏ�ǇT��)�����P��xR�{~z����פ��t�vL��?�1��f�z��';��C����=�Ci�8��`�>E�8��3c�G�;* ��9�y�K��O�q`_����/ѡ���K��%�+���r{�'����<��ç����a���3Y����vB2��Ō,��O������E�hT*��F���̾:�8@��zx8&��%�[��p	
M���[��޶�������o*�=}>&���������������%$wWk�<I�@�5�%�D�A�,ʿru���
~�*�[���<��z[o����+���&��	�)������Y=@5����~@��i�x�~:>=8A��Sq=���/��?�9JgY��X;�p�N�����#A�rR��{A��dJ��v�;/��2%��/���
~�m^��N�@q��(J__�}�)q2��MIÃr�
�O�S�Q�ʆ�T�o]N�ǧ�}�ڶ7���$B��Li�jdX��cPґ˖�`A�_?���?���h�n���^���v��G���p���x����ӘU��� ����I�-n?�ػ=,�%��4֋�wV5���*R���-�% ]F�BB�y��^J��ZM�'\��m�pxn�buu*Myښ���=����_~}���smbv�������)v)��p6~|��,�������p|��T���O�_��ݒ���zwQ�Zu�0��i�y��鵂�p��c rS�po��yu��U~���,�_>Å������^��lF�X5�	rGA��x+wl���D��=>�{4K�
�Ij������o	G�s��營p����˼ܭ.�$�6"�iV������Ӭ�"�T����Ǉ�����?]�E�Z�ЦR�9xu���67��~�����xf��ߎ8�M��?��||8/ \�ApG+9gN鄹���*�t�A
�������������6�h.�ndY��\B���V֝MF����}�p|8v|_Q9��K�?�V�.a1" 5�<�:>�d.ǲ~g�ؑc��DT@"e�_�'�X�o*�t&�g\ٰ[�Π��L�l*��) �l�u�����F��)�?ٍo7�*4Ime���~J���6�o EJ�G�P�/ǻ��� !���T.���Y��|�?/�;}M���e��H������alc��O��:�����8�3��}���r�Z=l���M4�GA��Ǥz�[��]t~�Q�:�~�׉�F]i4`fx���V�^�|��,֋5���=��M�����٥Ԅ'�2[��Q����b�Q������	aLƣ��Q�d3�KY���	��v_O�-�Ө�)&�ר�F�!�x����?};B'�l��
���}g�e}�PwT�*%��w�����=� ���<c2�1�r�2|ę��{�PR�v~>�vw�v��c$u����?���"#�񾇠j�3B/igK/r�#���㧧��=%���_�Oǯ��Q��5�Ҭ5�ʚ�:ӣ�'4���kf5(�^���ii�}k��_���Tw���_GM`� �@��6"��xO��S�0`+�1Y�BRay��d鹑���N4*R=�v��Z7p�@�P�Y�
���|;C��3���� ��lJ�����������"r����(O�_�h�4�|�p�v|��HF?�{�y�����̻�)?�m+�:������èv7~B��;�O���7 !%�Ovn��~X�g�.��1v����Y#���K����������\(����ͅ
��9��I����_9�ԅ.�]�W�Z�@(���)��!I�[�ĳ�]eLX�/�5uh��:����Қg�/xO�����y�rw�G%��O�+�:����H��i7uj(��������%ϐ&�lZ�fι�C�٦���L�	�?E���?��z��ԧx_S�<���uC��m!����N���%���V<9�q�x�Ͽ�P%t?�M:mqp�OLAn�Nq"h^j�����ԉ/�~6�#h(Y�> 6  �`w��?Č67��P�� �C�o��'D�&G����Y�����.�e�[�XA�$��7+����4<�L��9��v��8!��r<ݑ�G���d�Ef�X/�����`Fhu9��<2ϼo=�KA(1��6��>�z��ڮ�@���Z�"mM&^/x~ ��5�d�~PrW2v=y1�'5�q�|����q`�C��&x����QSx�@�ߕ��8R�p�#	��������o>_�qm8h��th5����l����BRR��t�t��GғMkN��]�BT 2R=��#���OǇ�4!�� |�M��1����k(��INn��<�6��'R1�-�xG!�zR�ۀO�r��Wl)��	6*�,\!����zAh�Z���sB�`Jj�B������'я�y3�u�x�/��M˂c����wr�%ل�`�����H�g@J���P��Tkc-C�� ����?��q|��n�8j����N�+��t�&��>1��#�?`v=S��i|�}H�P��.��9ڄ��uv$�[�����n[~�����6 �_� )�⭠(郈��	�o�ŵ���u, 2r{�z�O����0���*��:Y��Ke�0��0i$��ً�FO�6{Qu�'�3�P8�����{��q�&t�
����-��9�6�߄�����}OΥ��4A���i�F�ď�K�DI��s�+�9~���a���Ag��:gL)���N�9������H������ΚN_�I�*�Y�1e�󙂯�����Es|��*GQ5����m�{˙il3����'�N����/s}�l_�٣Rƃ"�h�ߟN�jm`"����p�h0ik�/�ɫ˙�HG�zi��xZ1'{��|�b�Rz��t�2�����C)����>�cڒ�1A?�s�k_O��tފ���9:��n6�9b9��l_��t���sN�t���0�Ă!��~9��<��d�,��ʵݣ� 4���uQ��Y�$�t�"h��=5����Lp��?�62��)E�>?��&����'s�3��C��0�)���_�Ê~
���j�!|�4
���֛�|YL�?��� !�-�pCl���-t����Ǉ�ghLS�`�������|����?�~xL�;����i��4��7��r��T���~��\�D�\���S�}]�/�|���7������1�(�=�3�:��@%
����� I��ޝin���ic��
?�1ڇ���^CͿ?K�._�'a����D������� ������!������������������v���      [   r   x�3��L*��RN���Ģ�DN#]C��4���!###]K]CC#+#c+#s=KSss� 24�2�t�L� H&ZZZBM��j��������������)��1z\\\ ��%      ]   [   x�3�4�tN-�L�442# �4202�54 "ΐ���l��̂�N��i "����R��D��������@������� �͹b���� T�      _   >   x�3��I�L��4���C ###]K]CS##+Ss+#K=3��gHfJb���b���� M�      `   I   x�3�,N,)��)(p�J�N,*I�K���L�4���C ###]]##C+S+SK=sSScc�BC�=... 1�2      b   �   x�Ő�
�@�뽧�����i#X�N�jzz���cb��u�ea�faf���w�M����3�>1(h�@HT�/�HQ���$��}Ce"�}E��:�
v���O�� ���K�#Dt�"�,����:��qڇ�3Cj�t�r
��f�Bi�5.��
e':V���̚��B�����      d      x������ � �      e      x������ � �      f      x������ � �      g      x������ � �      i      x������ � �      k      x������ � �      l      x������ � �      n      x������ � �      p      x������ � �      q      x������ � �      s      x������ � �      t      x������ � �      u      x������ � �      v      x������ � �      x      x������ � �      z      x������ � �      |      x������ � �      ~      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   3   x�3�4202�5��56P02�2��21�304312��"������ 
�      �      x������ � �      �      x������ � �      �   �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU      �   i   x�m�1�0�9~(J�H�PX��;��"y��J.�r�'T2�,w�g���N���NI#K�X`؂"���m-�����u�ۿS�΀A,�������5e      �   �   x�m�;�@�z|
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
A���^`��{��	�c��?�.(�NCe���c*�AZ�x�y˺���,R1��I� �Vڡo�VGF\�961c�j�c3��6;��b:ű��i��m�߆�lg���J�>L�      �   �   x�u�K
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