PGDMP         
                z         
   dbsisappra    14.5    14.5 .   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25854 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    26362 
   auth_token    TABLE     �   CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pengguna character varying NOT NULL,
    token character varying NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.auth_token;
       public         heap    postgres    false            �            1259    26368    auth_token_id_seq    SEQUENCE     �   ALTER TABLE public.auth_token ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auth_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209                       1259    26911    dashboard_kejadian    TABLE     �  CREATE TABLE public.dashboard_kejadian (
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
       public         heap    postgres    false            �            1259    26369    dashboard_kepegawaian    TABLE     B  CREATE TABLE public.dashboard_kepegawaian (
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
       public         heap    postgres    false            �            1259    26375 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE     �   ALTER TABLE public.dashboard_kepegawaian ALTER COLUMN id_pegawai ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_kepegawaian_baru_id_pegawai_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            �            1259    26376 !   dashboard_penegakan_perda_perkada    TABLE     �   CREATE TABLE public.dashboard_penegakan_perda_perkada (
    id_perda integer NOT NULL,
    kasus_perda character varying,
    jenis_pelanggaran_perda character varying,
    tanggal_kasus date
);
 5   DROP TABLE public.dashboard_penegakan_perda_perkada;
       public         heap    postgres    false                       1259    26918    dashboard_plotting_anggota    TABLE     M  CREATE TABLE public.dashboard_plotting_anggota (
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
       public         heap    postgres    false                       1259    27163    dashboard_titik_rawan    TABLE     @  CREATE TABLE public.dashboard_titik_rawan (
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
       public         heap    postgres    false            �            1259    26381    dashboard_tramtibum    TABLE     �   CREATE TABLE public.dashboard_tramtibum (
    id integer NOT NULL,
    kasus_tramtibum character varying,
    jenis_pelanggaran_perda_tramtibum character varying,
    kegiatan_tramtibum character varying,
    date integer
);
 '   DROP TABLE public.dashboard_tramtibum;
       public         heap    postgres    false                       1259    26925    dashboard_wasdak_ppkm    TABLE     �   CREATE TABLE public.dashboard_wasdak_ppkm (
    id integer NOT NULL,
    tanggal_wasdak date,
    jenis_wasdak character varying
);
 )   DROP TABLE public.dashboard_wasdak_ppkm;
       public         heap    postgres    false                       1259    26930    dashboard_wasdak_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.dashboard_wasdak_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dashboard_wasdak_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    275            N           1259    27424    hirarki_kepegawaian    TABLE     �  CREATE TABLE public.hirarki_kepegawaian (
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
       public         heap    postgres    false            P           1259    27434    hirarki_kepegawaian_bawahan    TABLE       CREATE TABLE public.hirarki_kepegawaian_bawahan (
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
       public         heap    postgres    false            O           1259    27433 "   hirarki_kepegawaian_bawahan_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki_kepegawaian_bawahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_kepegawaian_bawahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    336            M           1259    27423    hirarki_kepegawaian_id_seq    SEQUENCE     �   ALTER TABLE public.hirarki_kepegawaian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hirarki_kepegawaian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    334            �            1259    26386    jenis_sarana_prasarana    TABLE     m  CREATE TABLE public.jenis_sarana_prasarana (
    id integer NOT NULL,
    jenis_sarana_prasarana character varying,
    is_deleted integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer,
    updated_at timestamp without time zone,
    updated_by integer,
    created_at timestamp without time zone,
    created_by integer
);
 *   DROP TABLE public.jenis_sarana_prasarana;
       public         heap    postgres    false            �            1259    26392    kepegawaian_non_pns    TABLE     �  CREATE TABLE public.kepegawaian_non_pns (
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
       public         heap    postgres    false            �            1259    26399    kepegawaian_non_pns_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    26400    kepegawaian_non_pns_keluarga    TABLE     I  CREATE TABLE public.kepegawaian_non_pns_keluarga (
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
       public         heap    postgres    false            �            1259    26407 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    26408    kepegawaian_non_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_non_pns_pendidikan (
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
       public         heap    postgres    false            �            1259    26415 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_non_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_non_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    26416    kepegawaian_pns    TABLE     �  CREATE TABLE public.kepegawaian_pns (
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
       public         heap    postgres    false            �            1259    26423    kepegawaian_pns_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    26424    kepegawaian_pns_keluarga    TABLE     E  CREATE TABLE public.kepegawaian_pns_keluarga (
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
       public         heap    postgres    false            �            1259    26431    kepegawaian_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    26432    kepegawaian_pns_pendidikan    TABLE     �  CREATE TABLE public.kepegawaian_pns_pendidikan (
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
       public         heap    postgres    false            �            1259    26439 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    26440    kondisi_sarana_prasarana    TABLE     h  CREATE TABLE public.kondisi_sarana_prasarana (
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
       public         heap    postgres    false                       1259    27230 
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
       public         heap    postgres    false                        1259    27237    kontak_pic_id_seq    SEQUENCE     �   ALTER TABLE public.kontak_pic ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kontak_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    287            �            1259    26454    laporan_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan (
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
       public         heap    postgres    false            �            1259    26461    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    26462    laporan_kegiatan_jenis_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_kegiatan (
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
       public         heap    postgres    false            �            1259    26469 +   laporan_kegiatan_jenis_pelanggaran_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_pelanggaran_bangunan (
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
       public         heap    postgres    false            �            1259    26476 #   laporan_kegiatan_jenis_penyelesaian    TABLE     �  CREATE TABLE public.laporan_kegiatan_jenis_penyelesaian (
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
       public         heap    postgres    false            �            1259    26483 ,   laporan_kegiatan_pelanggaran_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol (
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
       public         heap    postgres    false            �            1259    26490 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_pelanggaran_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    26491     laporan_kegiatan_penertiban_ppkm    TABLE     �  CREATE TABLE public.laporan_kegiatan_penertiban_ppkm (
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
       public         heap    postgres    false            �            1259    26498 '   laporan_kegiatan_penertiban_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan_penertiban_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penertiban_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    26499    laporan_kegiatan_penindakan    TABLE     �  CREATE TABLE public.laporan_kegiatan_penindakan (
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
       public         heap    postgres    false            �            1259    26506 +   laporan_kegiatan_penindakan_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_penindakan_minuman_alkohol (
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
       public         heap    postgres    false            �            1259    26513 2   laporan_kegiatan_penindakan_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_penindakan_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penindakan_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    26514 -   laporan_kegiatan_penyelesaian_minuman_alkohol    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_minuman_alkohol (
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
       public         heap    postgres    false            �            1259    26521 4   laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq    SEQUENCE       ALTER TABLE public.laporan_kegiatan_penyelesaian_minuman_alkohol ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    26522 1   laporan_kegiatan_penyelesaian_penertiban_bangunan    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_penertiban_bangunan (
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
       public         heap    postgres    false            �            1259    26529 "   laporan_kegiatan_penyelesaian_ppkm    TABLE     �  CREATE TABLE public.laporan_kegiatan_penyelesaian_ppkm (
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
       public         heap    postgres    false            �            1259    26536 )   laporan_kegiatan_penyelesaian_ppkm_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan_penyelesaian_ppkm ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_penyelesaian_ppkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    26537    laporan_kegiatan_proses    TABLE     �  CREATE TABLE public.laporan_kegiatan_proses (
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
       public         heap    postgres    false            �            1259    26544    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
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
       public         heap    postgres    false            �            1259    26551 2   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak    TABLE     �  CREATE TABLE public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" (
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
       public         heap    postgres    false                       1259    27179    laporan_kejadian_banjir    TABLE     �  CREATE TABLE public.laporan_kejadian_banjir (
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
       public         heap    postgres    false                       1259    27186    laporan_kejadian_banjir_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_banjir ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_banjir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    278            �            1259    26558    laporan_kejadian_dokumentasi    TABLE     �  CREATE TABLE public.laporan_kejadian_dokumentasi (
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
       public         heap    postgres    false            �            1259    26565    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    26566    laporan_kejadian_jenis_bantuan    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_bantuan (
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
       public         heap    postgres    false            �            1259    26573 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            �            1259    26574    laporan_kejadian_jenis_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_kejadian (
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
       public         heap    postgres    false            �            1259    26581 &   laporan_kejadian_jenis_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    253            �            1259    26582 +   laporan_kejadian_jenis_kekerasan_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_kekerasan_unjuk_rasa (
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
       public         heap    postgres    false                       1259    27189    laporan_kejadian_kebakaran    TABLE     �  CREATE TABLE public.laporan_kejadian_kebakaran (
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
       public         heap    postgres    false                       1259    27196 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_kebakaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kebakaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    280                       1259    27199 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (
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
       public         heap    postgres    false                       1259    27206 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    282                        1259    26589 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_dokumentasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249                       1259    26590     laporan_kejadian_korban_material    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_material (
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
       public         heap    postgres    false                       1259    26597 '   laporan_kejadian_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    257                       1259    26598 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (
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
       public         heap    postgres    false                       1259    26605 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    259                       1259    26606 ,   laporan_kejadian_sumber_informasi_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa (
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
       public         heap    postgres    false                       1259    26613 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE       ALTER TABLE public.laporan_kejadian_sumber_informasi_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    261                       1259    27218    laporan_kejadian_unjuk_rasa    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa (
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
       public         heap    postgres    false                       1259    27225 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_unjuk_rasa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_unjuk_rasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285                       1259    27209 )   laporan_kejadian_unjuk_rasa_tindak_lanjut    TABLE     �  CREATE TABLE public.laporan_kejadian_unjuk_rasa_tindak_lanjut (
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
       public         heap    postgres    false                       1259    26614    laporan_pengawasan    TABLE     �  CREATE TABLE public.laporan_pengawasan (
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
       public         heap    postgres    false                       1259    26621    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    263            	           1259    26622    laporan_tamu_daerah    TABLE     �  CREATE TABLE public.laporan_tamu_daerah (
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
       public         heap    postgres    false            
           1259    26629    laporan_tamu_daerah_dok    TABLE     x  CREATE TABLE public.laporan_tamu_daerah_dok (
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
       public         heap    postgres    false                       1259    26636    laporan_tamu_daerah_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_tamu_daerah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_tamu_daerah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    265            !           1259    27238    master_agama    TABLE     �  CREATE TABLE public.master_agama (
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
       public         heap    postgres    false            "           1259    27245    master_agama_id_seq    SEQUENCE     �   ALTER TABLE public.master_agama ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_agama_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    289            #           1259    27246    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
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
       public         heap    postgres    false            $           1259    27253    master_eselon_id_seq    SEQUENCE     �   ALTER TABLE public.master_eselon ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_eselon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    291            %           1259    27254    master_golongan    TABLE     �  CREATE TABLE public.master_golongan (
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
       public         heap    postgres    false            &           1259    27261    master_golongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_golongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_golongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    293            '           1259    27262    master_jabatan    TABLE     �  CREATE TABLE public.master_jabatan (
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
       public         heap    postgres    false            (           1259    27269    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    295            )           1259    27270    master_jenis_bantuan    TABLE     �  CREATE TABLE public.master_jenis_bantuan (
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
       public         heap    postgres    false            *           1259    27277    master_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    297            +           1259    27278    master_jenis_kegiatan    TABLE     �  CREATE TABLE public.master_jenis_kegiatan (
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
       public         heap    postgres    false            ,           1259    27285    master_jenis_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    299            -           1259    27286    master_jenis_kejadian    TABLE     �  CREATE TABLE public.master_jenis_kejadian (
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
       public         heap    postgres    false            .           1259    27293    master_jenis_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    301            /           1259    27294    master_jenis_kekerasan    TABLE     �  CREATE TABLE public.master_jenis_kekerasan (
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
       public         heap    postgres    false            0           1259    27301    master_jenis_kekerasan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kekerasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kekerasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    303            1           1259    27302    master_jenis_pelanggaran    TABLE     �  CREATE TABLE public.master_jenis_pelanggaran (
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
 ,   DROP TABLE public.master_jenis_pelanggaran;
       public         heap    postgres    false            2           1259    27309    master_jenis_pelanggaran_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pelanggaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pelanggaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    305            3           1259    27310    master_jenis_penertiban    TABLE     �  CREATE TABLE public.master_jenis_penertiban (
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
 +   DROP TABLE public.master_jenis_penertiban;
       public         heap    postgres    false            4           1259    27317    master_jenis_penertiban_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penertiban ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penertiban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    307            5           1259    27318    master_jenis_penindakan    TABLE     �  CREATE TABLE public.master_jenis_penindakan (
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
       public         heap    postgres    false            6           1259    27325    master_jenis_penindakan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penindakan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penindakan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    309            7           1259    27326    master_jenis_penyelesaian    TABLE     �  CREATE TABLE public.master_jenis_penyelesaian (
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
       public         heap    postgres    false            8           1259    27333     master_jenis_penyelesaian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penyelesaian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penyelesaian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    311            9           1259    27334    master_jenis_perda_perkada    TABLE     �  CREATE TABLE public.master_jenis_perda_perkada (
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
       public         heap    postgres    false            :           1259    27341 !   master_jenis_perda_perkada_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_perda_perkada ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_perda_perkada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    313            ;           1259    27342    master_jenis_pertolongan    TABLE     �  CREATE TABLE public.master_jenis_pertolongan (
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
       public         heap    postgres    false            <           1259    27349    master_jenis_pertolongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pertolongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pertolongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    315            =           1259    27350    master_kecamatan    TABLE     �  CREATE TABLE public.master_kecamatan (
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
       public         heap    postgres    false            >           1259    27357    master_kecamatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kecamatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    317            ?           1259    27358    master_kelurahan    TABLE     �  CREATE TABLE public.master_kelurahan (
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
       public         heap    postgres    false            @           1259    27365    master_kelurahan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kelurahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    319            A           1259    27366    master_kota    TABLE     �  CREATE TABLE public.master_kota (
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
       public         heap    postgres    false            B           1259    27373    master_kota_id_seq    SEQUENCE     �   ALTER TABLE public.master_kota ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    321            C           1259    27374    master_pangkat    TABLE     �  CREATE TABLE public.master_pangkat (
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
       public         heap    postgres    false            D           1259    27381    master_pangkat_id_seq    SEQUENCE     �   ALTER TABLE public.master_pangkat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pangkat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    323            E           1259    27382    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
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
       public         heap    postgres    false            F           1259    27389    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    325            G           1259    27390    master_sumber_informasi    TABLE     �  CREATE TABLE public.master_sumber_informasi (
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
       public         heap    postgres    false            H           1259    27397    master_sumber_informasi_id_seq    SEQUENCE     �   ALTER TABLE public.master_sumber_informasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    327            I           1259    27398    master_tempat_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_pelaksanaan (
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
       public         heap    postgres    false            J           1259    27405     master_tempat_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    329            K           1259    27406    master_tempat_seksi_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_seksi_pelaksanaan (
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
       public         heap    postgres    false            L           1259    27413 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_seksi_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_seksi_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    331                       1259    26765    pengguna    TABLE     K  CREATE TABLE public.pengguna (
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
       public         heap    postgres    false                       1259    26773    pengguna_id_seq    SEQUENCE     �   ALTER TABLE public.pengguna ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pengguna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    268                       1259    26774    sarana_prasarana    TABLE     2  CREATE TABLE public.sarana_prasarana (
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
    updated_by integer,
    sapras_date date
);
 $   DROP TABLE public.sarana_prasarana;
       public         heap    postgres    false                       1259    26781    sarana_prasarana_id_seq    SEQUENCE     �   ALTER TABLE public.sarana_prasarana ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sarana_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    270                       1259    26782    status_sarana_prasarana    TABLE     f  CREATE TABLE public.status_sarana_prasarana (
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
       public         heap    postgres    false                      0    26362 
   auth_token 
   TABLE DATA           G   COPY public.auth_token (id, id_pengguna, token, create_at) FROM stdin;
    public          postgres    false    209   �      ]          0    26911    dashboard_kejadian 
   TABLE DATA           �   COPY public.dashboard_kejadian (id, nama, lat, long, kota, kecamatan, kelurahan, jenis_kejadian, tanggal_awal_kejadian, tanggal_akhir_kejadian, jumlah_korban_jiwa, jumlah_korban_materiil, is_deleted) FROM stdin;
    public          postgres    false    273   �#                0    26369    dashboard_kepegawaian 
   TABLE DATA           �   COPY public.dashboard_kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, usia, status_ppns, is_deleted) FROM stdin;
    public          postgres    false    211   F[      !          0    26376 !   dashboard_penegakan_perda_perkada 
   TABLE DATA           z   COPY public.dashboard_penegakan_perda_perkada (id_perda, kasus_perda, jenis_pelanggaran_perda, tanggal_kasus) FROM stdin;
    public          postgres    false    213   ��      ^          0    26918    dashboard_plotting_anggota 
   TABLE DATA           �   COPY public.dashboard_plotting_anggota (id, kota_kab, kecamatan, kelurahan, lokasi, long, lat, total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam) FROM stdin;
    public          postgres    false    274   r�      a          0    27163    dashboard_titik_rawan 
   TABLE DATA           |   COPY public.dashboard_titik_rawan (id, lokasi, kota, kecamatan, kelurahan, lat, long, kategori, rawan_terhadap) FROM stdin;
    public          postgres    false    277   %�      "          0    26381    dashboard_tramtibum 
   TABLE DATA              COPY public.dashboard_tramtibum (id, kasus_tramtibum, jenis_pelanggaran_perda_tramtibum, kegiatan_tramtibum, date) FROM stdin;
    public          postgres    false    214   �      _          0    26925    dashboard_wasdak_ppkm 
   TABLE DATA           Q   COPY public.dashboard_wasdak_ppkm (id, tanggal_wasdak, jenis_wasdak) FROM stdin;
    public          postgres    false    275   ��      �          0    27424    hirarki_kepegawaian 
   TABLE DATA           �   COPY public.hirarki_kepegawaian (id, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    334   m�      �          0    27434    hirarki_kepegawaian_bawahan 
   TABLE DATA           �   COPY public.hirarki_kepegawaian_bawahan (id, no_pegawai_atasan, no_pegawai, level, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_atasan) FROM stdin;
    public          postgres    false    336   ��      #          0    26386    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    215   ��      $          0    26392    kepegawaian_non_pns 
   TABLE DATA           ;  COPY public.kepegawaian_non_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nptt_npjlp, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan) FROM stdin;
    public          postgres    false    216   ��      &          0    26400    kepegawaian_non_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    218   ��      (          0    26408    kepegawaian_non_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_non_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    220   ��      *          0    26416    kepegawaian_pns 
   TABLE DATA           0  COPY public.kepegawaian_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nrk, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kepegawaian_pangkat, kepegawaian_kelurahan) FROM stdin;
    public          postgres    false    222   ��      ,          0    26424    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    224   uS      .          0    26432    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id_pegawai) FROM stdin;
    public          postgres    false    226   �S      0          0    26440    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    228   bT      k          0    27230 
   kontak_pic 
   TABLE DATA           �   COPY public.kontak_pic (id, email, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, status_pic) FROM stdin;
    public          postgres    false    287   �T      1          0    26454    laporan_kegiatan 
   TABLE DATA           <  COPY public.laporan_kegiatan (id, pelaksana_bidang_wilayah, tindak_lanjut, administrasi, peringatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, penutupan_atau_penyegelan, pencabutan_izin, yang_lainnya, denda, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pecabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam) FROM stdin;
    public          postgres    false    229   �T      3          0    26462    laporan_kegiatan_jenis_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_kegiatan (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, nama) FROM stdin;
    public          postgres    false    231   �U      4          0    26469 +   laporan_kegiatan_jenis_pelanggaran_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_pelanggaran_bangunan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    232   �U      5          0    26476 #   laporan_kegiatan_jenis_penyelesaian 
   TABLE DATA           �   COPY public.laporan_kegiatan_jenis_penyelesaian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    233   �U      6          0    26483 ,   laporan_kegiatan_pelanggaran_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_pelanggaran_minuman_alkohol (id, nama, is_deleted, created_by, created_at, deleted_by, deleted_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    234   V      8          0    26491     laporan_kegiatan_penertiban_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penertiban_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    236   #V      :          0    26499    laporan_kegiatan_penindakan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    238   @V      ;          0    26506 +   laporan_kegiatan_penindakan_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penindakan_minuman_alkohol (id, nama, is_deleted, updated_by, updated_at, created_by, created_at, deleted_by, deleted_at) FROM stdin;
    public          postgres    false    239   ]V      =          0    26514 -   laporan_kegiatan_penyelesaian_minuman_alkohol 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_minuman_alkohol (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    241   zV      ?          0    26522 1   laporan_kegiatan_penyelesaian_penertiban_bangunan 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_penertiban_bangunan (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    243   �V      @          0    26529 "   laporan_kegiatan_penyelesaian_ppkm 
   TABLE DATA           �   COPY public.laporan_kegiatan_penyelesaian_ppkm (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    244   �V      B          0    26537    laporan_kegiatan_proses 
   TABLE DATA           �   COPY public.laporan_kegiatan_proses (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    246   �V      C          0    26544    laporan_kejadian 
   TABLE DATA           �  COPY public.laporan_kejadian (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempua_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan) FROM stdin;
    public          postgres    false    247   �V      D          0    26551 2   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    248   W      b          0    27179    laporan_kejadian_banjir 
   TABLE DATA           �  COPY public.laporan_kejadian_banjir (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, ketinggian_air, jumlah_pengungsi, jumlah_pengungsi_per_kk, lokasi_penampungan, lokasi_dapur_umum, jenis_kejadian) FROM stdin;
    public          postgres    false    278   (W      E          0    26558    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    249   EW      G          0    26566    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nama) FROM stdin;
    public          postgres    false    251   bW      I          0    26574    laporan_kejadian_jenis_kejadian 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kejadian (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    253   W      K          0    26582 +   laporan_kejadian_jenis_kekerasan_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    255   �W      d          0    27189    laporan_kejadian_kebakaran 
   TABLE DATA           H  COPY public.laporan_kejadian_kebakaran (id, id_tanggal_kejadian, id_waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, id_alamat_lengkap, id_jenis_kejadian, id_uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    280   �W      f          0    27199 2   laporan_kejadian_kekerasan_pada_perempuan_dan_anak 
   TABLE DATA           U  COPY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumla_personil_satpol_pp, jumlah_personil_instansi_lain) FROM stdin;
    public          postgres    false    282   �W      M          0    26590     laporan_kejadian_korban_material 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_material (id, id_laporan, id_korban, jumlah_korban, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    257   �W      O          0    26598 <   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    259   X      Q          0    26606 ,   laporan_kejadian_sumber_informasi_unjuk_rasa 
   TABLE DATA           �   COPY public.laporan_kejadian_sumber_informasi_unjuk_rasa (id, nama, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at) FROM stdin;
    public          postgres    false    261   -X      i          0    27218    laporan_kejadian_unjuk_rasa 
   TABLE DATA           :  COPY public.laporan_kejadian_unjuk_rasa (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, jenis_kegiatan, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi) FROM stdin;
    public          postgres    false    285   JX      h          0    27209 )   laporan_kejadian_unjuk_rasa_tindak_lanjut 
   TABLE DATA           ;  COPY public.laporan_kejadian_unjuk_rasa_tindak_lanjut (id, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, jumlah_masa, tuntutan, penanggung_jawab_unras, jenis_bantuan_satpol_pp, jenis_bantuan_instansii_terkait, korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita) FROM stdin;
    public          postgres    false    284   gX      S          0    26614    laporan_pengawasan 
   TABLE DATA             COPY public.laporan_pengawasan (id, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) FROM stdin;
    public          postgres    false    263   �X      U          0    26622    laporan_tamu_daerah 
   TABLE DATA           5  COPY public.laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id, pelaksanaan) FROM stdin;
    public          postgres    false    265   �X      V          0    26629    laporan_tamu_daerah_dok 
   TABLE DATA           �   COPY public.laporan_tamu_daerah_dok (id, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, dir_file) FROM stdin;
    public          postgres    false    266   �X      m          0    27238    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    289   Y      o          0    27246    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_eselon) FROM stdin;
    public          postgres    false    291   �Y      q          0    27254    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_golongan) FROM stdin;
    public          postgres    false    293   	Z      s          0    27262    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    295   �Z      u          0    27270    master_jenis_bantuan 
   TABLE DATA           �   COPY public.master_jenis_bantuan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    297   I]      w          0    27278    master_jenis_kegiatan 
   TABLE DATA           �   COPY public.master_jenis_kegiatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    299   ^      y          0    27286    master_jenis_kejadian 
   TABLE DATA           �   COPY public.master_jenis_kejadian (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    301   `      {          0    27294    master_jenis_kekerasan 
   TABLE DATA           �   COPY public.master_jenis_kekerasan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    303   sa      }          0    27302    master_jenis_pelanggaran 
   TABLE DATA           �   COPY public.master_jenis_pelanggaran (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    305   b                0    27310    master_jenis_penertiban 
   TABLE DATA           �   COPY public.master_jenis_penertiban (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    307   �b      �          0    27318    master_jenis_penindakan 
   TABLE DATA           �   COPY public.master_jenis_penindakan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    309   �b      �          0    27326    master_jenis_penyelesaian 
   TABLE DATA           �   COPY public.master_jenis_penyelesaian (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    311   1c      �          0    27334    master_jenis_perda_perkada 
   TABLE DATA           �   COPY public.master_jenis_perda_perkada (id, judul, deskripsi, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    313   Nc      �          0    27342    master_jenis_pertolongan 
   TABLE DATA           �   COPY public.master_jenis_pertolongan (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    315   d      �          0    27350    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kota) FROM stdin;
    public          postgres    false    317   �d      �          0    27358    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kecamatan) FROM stdin;
    public          postgres    false    319   og      �          0    27366    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    321   �s      �          0    27374    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    323   dt      �          0    27382    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    325   9u      �          0    27390    master_sumber_informasi 
   TABLE DATA           �   COPY public.master_sumber_informasi (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    327   �u      �          0    27398    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    329   _v      �          0    27406    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    331   �w      X          0    26765    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    268   ~}      Z          0    26774    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, sapras_date) FROM stdin;
    public          postgres    false    270   h~      \          0    26782    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    272   �      �           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 33, true);
          public          postgres    false    210            �           0    0 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.dashboard_kepegawaian_baru_id_pegawai_seq', 1, false);
          public          postgres    false    212            �           0    0    dashboard_wasdak_ppkm_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.dashboard_wasdak_ppkm_id_seq', 1, false);
          public          postgres    false    276            �           0    0 "   hirarki_kepegawaian_bawahan_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.hirarki_kepegawaian_bawahan_id_seq', 1, false);
          public          postgres    false    335            �           0    0    hirarki_kepegawaian_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.hirarki_kepegawaian_id_seq', 1, false);
          public          postgres    false    333            �           0    0    kepegawaian_non_pns_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.kepegawaian_non_pns_id_seq', 1, false);
          public          postgres    false    217            �           0    0 #   kepegawaian_non_pns_keluarga_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.kepegawaian_non_pns_keluarga_id_seq', 1, false);
          public          postgres    false    219            �           0    0 %   kepegawaian_non_pns_pendidikan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.kepegawaian_non_pns_pendidikan_id_seq', 1, false);
          public          postgres    false    221            �           0    0    kepegawaian_pns_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.kepegawaian_pns_id_seq', 1, false);
          public          postgres    false    223            �           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 3, true);
          public          postgres    false    225            �           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 2, true);
          public          postgres    false    227            �           0    0    kontak_pic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kontak_pic_id_seq', 5, true);
          public          postgres    false    288            �           0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    230            �           0    0 3   laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kegiatan_pelanggaran_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    235            �           0    0 '   laporan_kegiatan_penertiban_ppkm_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kegiatan_penertiban_ppkm_id_seq', 1, false);
          public          postgres    false    237            �           0    0 2   laporan_kegiatan_penindakan_minuman_alkohol_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.laporan_kegiatan_penindakan_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    240            �           0    0 4   laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.laporan_kegiatan_penyelesaian_minuman_alkohol_id_seq', 1, false);
          public          postgres    false    242            �           0    0 )   laporan_kegiatan_penyelesaian_ppkm_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.laporan_kegiatan_penyelesaian_ppkm_id_seq', 1, false);
          public          postgres    false    245            �           0    0    laporan_kejadian_banjir_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.laporan_kejadian_banjir_id_seq', 1, false);
          public          postgres    false    279            �           0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    250            �           0    0 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_bantuan_id_seq', 1, false);
          public          postgres    false    252            �           0    0 &   laporan_kejadian_jenis_kejadian_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_kejadian_id_seq', 1, false);
          public          postgres    false    254            �           0    0 !   laporan_kejadian_kebakaran_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.laporan_kejadian_kebakaran_id_seq', 1, false);
          public          postgres    false    281            �           0    0 9   laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak_id_seq', 1, false);
          public          postgres    false    283            �           0    0 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq', 1, false);
          public          postgres    false    256            �           0    0 '   laporan_kejadian_korban_material_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kejadian_korban_material_id_seq', 1, false);
          public          postgres    false    258            �           0    0 (   laporan_kejadian_sumber_informasi_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_id_seq', 1, false);
          public          postgres    false    260            �           0    0 3   laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.laporan_kejadian_sumber_informasi_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    262            �           0    0 "   laporan_kejadian_unjuk_rasa_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.laporan_kejadian_unjuk_rasa_id_seq', 1, false);
          public          postgres    false    286            �           0    0    laporan_pengawasan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, true);
          public          postgres    false    264            �           0    0    laporan_tamu_daerah_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.laporan_tamu_daerah_id_seq', 1, false);
          public          postgres    false    267            �           0    0    master_agama_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_agama_id_seq', 6, true);
          public          postgres    false    290            �           0    0    master_eselon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_eselon_id_seq', 6, true);
          public          postgres    false    292            �           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 15, true);
          public          postgres    false    294            �           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 30, true);
          public          postgres    false    296            �           0    0    master_jenis_bantuan_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.master_jenis_bantuan_id_seq', 6, true);
          public          postgres    false    298            �           0    0    master_jenis_kegiatan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kegiatan_id_seq', 19, true);
          public          postgres    false    300            �           0    0    master_jenis_kejadian_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kejadian_id_seq', 14, true);
          public          postgres    false    302            �           0    0    master_jenis_kekerasan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kekerasan_id_seq', 5, true);
          public          postgres    false    304            �           0    0    master_jenis_pelanggaran_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pelanggaran_id_seq', 2, true);
          public          postgres    false    306            �           0    0    master_jenis_penertiban_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_penertiban_id_seq', 1, false);
          public          postgres    false    308            �           0    0    master_jenis_penindakan_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_jenis_penindakan_id_seq', 2, true);
          public          postgres    false    310            �           0    0     master_jenis_penyelesaian_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_penyelesaian_id_seq', 1, false);
          public          postgres    false    312            �           0    0 !   master_jenis_perda_perkada_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_perda_perkada_id_seq', 2, true);
          public          postgres    false    314            �           0    0    master_jenis_pertolongan_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pertolongan_id_seq', 6, true);
          public          postgres    false    316            �           0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 44, true);
          public          postgres    false    318            �           0    0    master_kelurahan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 267, true);
          public          postgres    false    320            �           0    0    master_kota_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.master_kota_id_seq', 6, true);
          public          postgres    false    322            �           0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 15, true);
          public          postgres    false    324            �           0    0    master_pendidikan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 9, true);
          public          postgres    false    326            �           0    0    master_sumber_informasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_sumber_informasi_id_seq', 4, true);
          public          postgres    false    328            �           0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 13, true);
          public          postgres    false    330            �           0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 87, true);
          public          postgres    false    332            �           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 7, true);
          public          postgres    false    269            �           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    271            }           2606    26917 *   dashboard_kejadian dashboard_kejadian_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dashboard_kejadian
    ADD CONSTRAINT dashboard_kejadian_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.dashboard_kejadian DROP CONSTRAINT dashboard_kejadian_pkey;
       public            postgres    false    273            ?           2606    26789 3   dashboard_kepegawaian dashboard_kepegawaian_baru_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.dashboard_kepegawaian
    ADD CONSTRAINT dashboard_kepegawaian_baru_pk PRIMARY KEY (id_pegawai);
 ]   ALTER TABLE ONLY public.dashboard_kepegawaian DROP CONSTRAINT dashboard_kepegawaian_baru_pk;
       public            postgres    false    211            A           2606    26791 H   dashboard_penegakan_perda_perkada dashboard_penegakan_perda_perkada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada
    ADD CONSTRAINT dashboard_penegakan_perda_perkada_pkey PRIMARY KEY (id_perda);
 r   ALTER TABLE ONLY public.dashboard_penegakan_perda_perkada DROP CONSTRAINT dashboard_penegakan_perda_perkada_pkey;
       public            postgres    false    213                       2606    26924 :   dashboard_plotting_anggota dashboard_plotting_anggota_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.dashboard_plotting_anggota
    ADD CONSTRAINT dashboard_plotting_anggota_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.dashboard_plotting_anggota DROP CONSTRAINT dashboard_plotting_anggota_pkey;
       public            postgres    false    274            �           2606    27169 0   dashboard_titik_rawan dashboard_titik_rawan_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_titik_rawan
    ADD CONSTRAINT dashboard_titik_rawan_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_titik_rawan DROP CONSTRAINT dashboard_titik_rawan_pkey;
       public            postgres    false    277            C           2606    26793 ,   dashboard_tramtibum dashboard_tramtibum_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dashboard_tramtibum
    ADD CONSTRAINT dashboard_tramtibum_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.dashboard_tramtibum DROP CONSTRAINT dashboard_tramtibum_pkey;
       public            postgres    false    214            �           2606    26932 0   dashboard_wasdak_ppkm dashboard_wasdak_ppkm_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.dashboard_wasdak_ppkm
    ADD CONSTRAINT dashboard_wasdak_ppkm_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.dashboard_wasdak_ppkm DROP CONSTRAINT dashboard_wasdak_ppkm_pkey;
       public            postgres    false    275            �           2606    27442 :   hirarki_kepegawaian_bawahan hirarki_kepegawaian_bawahan_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan
    ADD CONSTRAINT hirarki_kepegawaian_bawahan_pk PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.hirarki_kepegawaian_bawahan DROP CONSTRAINT hirarki_kepegawaian_bawahan_pk;
       public            postgres    false    336            �           2606    27432 *   hirarki_kepegawaian hirarki_kepegawaian_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.hirarki_kepegawaian
    ADD CONSTRAINT hirarki_kepegawaian_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.hirarki_kepegawaian DROP CONSTRAINT hirarki_kepegawaian_pk;
       public            postgres    false    334            E           2606    26795 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    215            �           2606    27208 Y   laporan_kejadian_kekerasan_pada_perempuan_dan_anak kekerasan_pada_perempuan_dan_anak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak
    ADD CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey PRIMARY KEY (id_kelurahan);
 �   ALTER TABLE ONLY public.laporan_kejadian_kekerasan_pada_perempuan_dan_anak DROP CONSTRAINT kekerasan_pada_perempuan_dan_anak_pkey;
       public            postgres    false    282            G           2606    26797 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    228            s           2606    26799 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    263            K           2606    26801 D   laporan_kegiatan_jenis_kegiatan laporan_kegiatan_jenis_kegiatan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan
    ADD CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kegiatan_jenis_kegiatan DROP CONSTRAINT laporan_kegiatan_jenis_kegiatan_pkey;
       public            postgres    false    231            M           2606    26803 \   laporan_kegiatan_jenis_pelanggaran_bangunan laporan_kegiatan_jenis_pelanggaran_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan
    ADD CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_pelanggaran_bangunan DROP CONSTRAINT laporan_kegiatan_jenis_pelanggaran_bangunan_pkey;
       public            postgres    false    232            O           2606    26805 L   laporan_kegiatan_jenis_penyelesaian laporan_kegiatan_jenis_penyelesaian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian
    ADD CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.laporan_kegiatan_jenis_penyelesaian DROP CONSTRAINT laporan_kegiatan_jenis_penyelesaian_pkey;
       public            postgres    false    233            Q           2606    26807 ^   laporan_kegiatan_pelanggaran_minuman_alkohol laporan_kegiatan_pelanggaran_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_pelanggaran_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_pelanggaran_minuman_alkohol_pkey;
       public            postgres    false    234            S           2606    26809 F   laporan_kegiatan_penertiban_ppkm laporan_kegiatan_penertiban_ppkm_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penertiban_ppkm
    ADD CONSTRAINT laporan_kegiatan_penertiban_ppkm_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.laporan_kegiatan_penertiban_ppkm DROP CONSTRAINT laporan_kegiatan_penertiban_ppkm_pkey;
       public            postgres    false    236            W           2606    26811 \   laporan_kegiatan_penindakan_minuman_alkohol laporan_kegiatan_penindakan_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penindakan_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_penindakan_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penindakan_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_penindakan_minuman_alkohol_pkey;
       public            postgres    false    239            U           2606    26813 <   laporan_kegiatan_penindakan laporan_kegiatan_penindakan_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.laporan_kegiatan_penindakan
    ADD CONSTRAINT laporan_kegiatan_penindakan_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.laporan_kegiatan_penindakan DROP CONSTRAINT laporan_kegiatan_penindakan_pkey;
       public            postgres    false    238            Y           2606    26815 `   laporan_kegiatan_penyelesaian_minuman_alkohol laporan_kegiatan_penyelesaian_minuman_alkohol_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_minuman_alkohol
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_minuman_alkohol_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_minuman_alkohol DROP CONSTRAINT laporan_kegiatan_penyelesaian_minuman_alkohol_pkey;
       public            postgres    false    241            [           2606    26817 h   laporan_kegiatan_penyelesaian_penertiban_bangunan laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_penertiban_bangunan DROP CONSTRAINT laporan_kegiatan_penyelesaian_penertiban_bangunan_pkey;
       public            postgres    false    243            ]           2606    26819 J   laporan_kegiatan_penyelesaian_ppkm laporan_kegiatan_penyelesaian_ppkm_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_ppkm
    ADD CONSTRAINT laporan_kegiatan_penyelesaian_ppkm_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.laporan_kegiatan_penyelesaian_ppkm DROP CONSTRAINT laporan_kegiatan_penyelesaian_ppkm_pkey;
       public            postgres    false    244            I           2606    26821 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    229            _           2606    26823 4   laporan_kegiatan_proses laporan_kegiatan_proses_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_kegiatan_proses
    ADD CONSTRAINT laporan_kegiatan_proses_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_kegiatan_proses DROP CONSTRAINT laporan_kegiatan_proses_pkey;
       public            postgres    false    246            c           2606    26825 Y   laporan_kejadian_ jenis_kekerasan_pada_wanita_anak laporan_kejadian_ jenis_kekerasan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak"
    ADD CONSTRAINT "laporan_kejadian_ jenis_kekerasan_pkey" PRIMARY KEY (id);
 �   ALTER TABLE ONLY public."laporan_kejadian_ jenis_kekerasan_pada_wanita_anak" DROP CONSTRAINT "laporan_kejadian_ jenis_kekerasan_pkey";
       public            postgres    false    248            �           2606    27188 4   laporan_kejadian_banjir laporan_kejadian_banjir_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_banjir
    ADD CONSTRAINT laporan_kejadian_banjir_pkey PRIMARY KEY (id_kecamatan);
 ^   ALTER TABLE ONLY public.laporan_kejadian_banjir DROP CONSTRAINT laporan_kejadian_banjir_pkey;
       public            postgres    false    278            g           2606    26827 B   laporan_kejadian_jenis_bantuan laporan_kejadian_jenis_bantuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan
    ADD CONSTRAINT laporan_kejadian_jenis_bantuan_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan DROP CONSTRAINT laporan_kejadian_jenis_bantuan_pkey;
       public            postgres    false    251            i           2606    26829 D   laporan_kejadian_jenis_kejadian laporan_kejadian_jenis_kejadian_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kejadian
    ADD CONSTRAINT laporan_kejadian_jenis_kejadian_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.laporan_kejadian_jenis_kejadian DROP CONSTRAINT laporan_kejadian_jenis_kejadian_pkey;
       public            postgres    false    253            k           2606    26831 \   laporan_kejadian_jenis_kekerasan_unjuk_rasa laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_jenis_kekerasan_unjuk_rasa DROP CONSTRAINT laporan_kejadian_jenis_kekerasan_unjuk_rasa_pkey;
       public            postgres    false    255            �           2606    27198 :   laporan_kejadian_kebakaran laporan_kejadian_kebakaran_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_kebakaran
    ADD CONSTRAINT laporan_kejadian_kebakaran_pkey PRIMARY KEY (id_kecamatan);
 d   ALTER TABLE ONLY public.laporan_kejadian_kebakaran DROP CONSTRAINT laporan_kejadian_kebakaran_pkey;
       public            postgres    false    280            e           2606    26833 >   laporan_kejadian_dokumentasi laporan_kejadian_korban_jiwa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey;
       public            postgres    false    249            m           2606    26835 F   laporan_kejadian_korban_material laporan_kejadian_korban_material_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_korban_material
    ADD CONSTRAINT laporan_kejadian_korban_material_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.laporan_kejadian_korban_material DROP CONSTRAINT laporan_kejadian_korban_material_pkey;
       public            postgres    false    257            a           2606    26837 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    247            o           2606    26839 c   laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak laporan_kejadian_sumber_informasi_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak
    ADD CONSTRAINT laporan_kejadian_sumber_informasi_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_kekerasan_pada_wanita_anak DROP CONSTRAINT laporan_kejadian_sumber_informasi_pkey;
       public            postgres    false    259            q           2606    26841 M   laporan_kejadian_sumber_informasi_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey PRIMARY KEY (id);
 w   ALTER TABLE ONLY public.laporan_kejadian_sumber_informasi_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey;
       public            postgres    false    261            �           2606    27227 =   laporan_kejadian_unjuk_rasa laporan_kejadian_unjuk_rasa_pkey1 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1 PRIMARY KEY (id_kecamatan);
 g   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa DROP CONSTRAINT laporan_kejadian_unjuk_rasa_pkey1;
       public            postgres    false    285            �           2606    27217 X   laporan_kejadian_unjuk_rasa_tindak_lanjut laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut
    ADD CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.laporan_kejadian_unjuk_rasa_tindak_lanjut DROP CONSTRAINT laporan_kejadian_unjuk_rasa_tindak_lanjut_pkey;
       public            postgres    false    284            w           2606    26843 4   laporan_tamu_daerah_dok laporan_tamu_daerah_dok_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.laporan_tamu_daerah_dok
    ADD CONSTRAINT laporan_tamu_daerah_dok_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.laporan_tamu_daerah_dok DROP CONSTRAINT laporan_tamu_daerah_dok_pkey;
       public            postgres    false    266            u           2606    26845 ,   laporan_tamu_daerah laporan_tamu_daerah_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.laporan_tamu_daerah
    ADD CONSTRAINT laporan_tamu_daerah_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.laporan_tamu_daerah DROP CONSTRAINT laporan_tamu_daerah_pkey;
       public            postgres    false    265            y           2606    26859 &   sarana_prasarana sarana_prasarana_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.sarana_prasarana
    ADD CONSTRAINT sarana_prasarana_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.sarana_prasarana DROP CONSTRAINT sarana_prasarana_pkey;
       public            postgres    false    270            {           2606    26861 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    272               L  x���ˎ�����*�$u�*g@AA@@1;!�	PQ[��w�vzu�{H�L�'U�[����I<ަ����Z�V�?�ܥۡ.��*\/]bĚ��p����qWN:�Tde*0k]<;.m��G�p����<�֫�!��*|�nQ-ik�v����E�� =�H
��j-O�R�I��|��}�]ߵ��Vf�V՟��34V�����PC	ˀR��-¨9:siJ�k�����[�$.���V����!c{ʫْ#/���0�C\�ˈtH{0����.�O��v٢g��Z|ou���I�ꆑo�3=��\��A(vS�!�C�t�=1b�q�/�{���e�cw�����U�q#�ʬ~~��ʇ��]b�8��׎�l[[Y¥ht@�h3=�S-�g@0p�+	�t,'D9�Cz2�$�!�#L�����"Y�x19�����-����7��nç���ww�7�.�z~7ÔE! *r���{�십���,�W���-��B����u5G[��w�i���tA�7L���r	�$3L1��6a�H�YX������8VG��8+�;���kl�R��7��� e������bɦ%��ɕ\�6�O�zvGo�JM&�x�=W�u����!�D"�1;�(C���Et0��^�<�c�O�t�8DVVG�:��u��j����ɰ�&�f�e��a���Qlì�%�d�<�d7�4�s�U��~q�� R�h��rh��_2oͥ�<��0m�pBgR�*�^�{���V^���c�i�,�˨,k�Z�7��(��V��:�N��ힰ�S��2��p�Ǉ0��ͪ�_�iX��e�5��������W�����둻�5�r5z�l��92/C�(����
���?1�e��n�U �9��M���RI<׌��U(8�a6肔��f>7�ӥ�ln�{����r�	!����^�(��|��s:yU�o��%z���n��4U��j��&�Th�?��y�~5 D�j��]��3Ug4.������1���}���#\&��Pi݋���?2*�MDq`�Vd"e���Dj�αw����n(�&���[�
���>���m|T��}�-C��0kR�S�d��`{�P�������o���f�^*�I�H�b蓱����<��ўX6�HLF@�P{����D9���q`uq�UN���r��`�A>2l��I�a�x1�k�����HȜ�­�<����?ڗWO�w���9�ǯ�(�G~�~���<�_)�I�����)ͽBIF��%#��j�Zus/�Μ�6����2TO���|����G�t6K��!�e��C���F(�umKfy'`y�bR�}����A�m���j�6��,�:���j���_S�? m�L,.&D���L�5Y�k&���Z:�X��R��r�e��`�3yC]wQ�U9KAV���f�1��1���$��_�y߃�
�s�,�ŀ����>�wC�1ۙ9<���J�w:��)�I����G�A�%2�~���J���O���x��QJ�����r�:�?����[�O7�9�RQ��[�a��xB�����q��O���'3R���,֧�r�<S���j~��Wh��(���y[ d��\ͣ�rم+i;y�5.��q}��g�_<�
����P���� �d ;��0Ej�Ek��ve��K��^LʋS<6�b�B.Ð0���M��d��\�����L����(�n�L���٤�]�oG��P��"̩9۪����ě�c��C���Z.QΈ�;��
0�J�SS�7�v���]����g���"�s �l���Q�|�3{�-�͝��?@
c�8�G�t:��,�J      ]      x��}[�Gv�s�W������luM�X�F]� �/�5a˲8�4����YYUM��phX�Ȋ8��/��jx~z~^|||����?���C�O&����=�a���X���o����|���?�~������>�Κ]����W>t�����t�O�|�Ǘ�����R��Kz���.w�?�v���~��߾~��;\���a����Ww��ð������)��ϯ�պ��K�����/���պ��{�S��e�����/_��_��+���ۯ�~������|}|�������O�_��3|���#n�?��_���(�;T{��8lḜ1��×��W�?Ň�����/��׋����e--MwA�ŗ���r�`a�>��}����������*`%��V�N,U��rؾ¡Y�w��%�_.������~����{�x�������^l_��(��'!��@+O�.7��ҁ���8X:�-�
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
��b}ZQ�p�0"w�u��6�尪��I̭��x�ϻ�˰a�v�j���-}/.�礂lt�Sn���n׆6�� Ҧ�O	�ߧ�~������V            x���͒%Ǒ�ט��d6&����es@3a�!�jV�4��"�I����u�xVux�w:�`��Q��'�{_��ݷ_�y����~���?���߽~�_���W��������������W�?���o���?TD������W_��#����w_�_}5-���#0 C�|�Mmlz�U)����y���~��W���׿���*�?� �xǮ/t�����h|��#��^��o������__��#��#x���[]�~ly���>��'��	��ס��cH\��-�}��7o~��{���>����aIݢ����t��xﻮ�w�qwK��{<߻1��wW��{e����Z��#�zD_����}H���n�I`�:��l�a�;��@\��� �ݻ\�����滫K��nL�>p&���dm�.+�\Z��>����Y������X�����<���>Mh���D<8�D�Ҵ������߼�f�d}�qNn��7�ߛ7��o]'��o�Ϛ�}��oVZ��y���9ٳtW�����m��c�yӭɠ�x?����2g�ipI���zK�B��6��d��Ɋ׬�X{�d�uױ%�3���%q߻^/ɜ�]��͙�>�h�y�g�d��_�9�q�w����s�l%�S_�j׎h���K^[9��9����n�-�ۻ^'��^�Y�[/����lV�d���msކ��כ3�d�u�sO�]/��d�|wk������6+w��h�rS;٬��#�>��f���e����a�ٷ�6�m����Fv��6Z �������7��,Mv��N��	��ITJ��p�xiM3�E�ĕݕh�+�߉+��f�+�C���J0hP�'ȕB[�R4̋A���0O�)������D< &F_��E���L�.��T����dc��q�?�������w�uɝ������	~��0/jԋt3ڣl�嶌�y��F��,�-�h�����;�""FkF��<=�4�XT� .���N�ތ�yw<��s�2�o�0�
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
�?]���+���s�_�����Wo~����w?��߿���]�߯?���޿z��������ۿ���o[KC�ZKc�ZK��ZK���?������o?���Gd~	�	2�����?�����~xD��E��E�!�E���3�I�<C���3􉏟�S��9��E[����.��eN�wі/sB����޿{��?�O�#�)<u��>�7o��ۿ|���a���O�_}��������s��>u9�}��iX�ߧ����}L��it�ߧ�1�r�>��������?���?����:��׏���~ Y  ��~��u}zX�޽����oFΑ_m�l����f��n�l2������n�l����V��n�l������m8����/5��{���R#/�����/5��{���R#/�����/5��{���R#/�o���/5��{�����o�����}����#�dt�'�~��Dp@������?���Ǻs�Ϸ�^����7'{�������\��W�|?��h�7�����˫�R��w�_��o�������N���N��q������o�x��>x���G������4vz�t;e��NI��SN�i씲0�/|>��S��i�q��# �0��ƾ��/�>����/��^�߼��?���?�����:!������zl�$���N��h*���:�|����w�:�z����w�:�x���xw�:��߾����0h^����~���N������(��z�G'Q���I��ti���T�G'����I���9qv�����DD~��ҏ>'"�n��?���8�s�c��?�s;}�g�N����&���o������O�v��	��ݟ�O<�	��ɟ�M���D}�7�{~�o�7������o�7�^J���o�7�J���o���z���߳˘O�ϮN>���=���o���Z���߳K�O��(�O���O����O����O�Ϩ�O�������w?��~��zFy8�������S�4qJ~�7qJy�7qJt�7qJo�7qJ�7qJ�7qJ�5��1Ԥ��ѹ�45o�rt.��y��s9��ϛ���9�|����<��ϛ����yף�.>o�zt�S��M\��3"�4q=:ψ�7o|������~� ��o���_��������~l�l��8�́&��w���-h�l�8��&�������#h�tG���?���~����݃�\�/�󇿾���p����k�vzڰZ;=�X���T��N�1Vk����s���ڹ��i�\m���E���m��E��Cn��E��9�n��E��9o��E��9�o��E���=����wVk_t,��?X�}ѱ �h�־�X Y8Nk_t,�ߙX�}ѱp~�b��E���]�����<Vk_t,��Y�}ѱp~�d��E���ݔ����ZVk_t,�߉Y�}ѱp~�f��E���]�����xVk_t,��Z�}ѱp~h��E���ݣ�����Vk���O?�9Ч$��)��}J�?A���OЧ���)7�}J�?A������������y��V���������HSF	��ҍ���X�n�6-W�?	��͟����O�j�'���!r���1u���Ax��_vԞݰ^m���g7�W��%G���o��O����t�      !   �   x�}�A�0��5=� 3b�[WFcbݹy�F0����_0Uvlg��]��A瞘4��HJ�2m|ht�]6��E)��f 3���=�������'3��kx��,g��o�h0�81^N�EO�����o�S����Nk���+���P�      ^   �  x����n�0���S�O"��[�C�v����,��I�`�ۏV�:�r$PMA�>R�������b�(^s�To�����;���S_��֙����P���/�_o�L��O�S�7�2Ǟ����s9t�g��-5�l�n��b=쮋��Z	�\���2Q���\� ���Yg�0iU�_\>�+q��-	��F��+7�*|T��uN�s)�{ɉ�@�hg�Z�e^��bq�0j�|��^�W:lh�]}��C߼���M�`�«�w`c4ގ��:�5�RQy�i]x�GQ4��nG`p|��q��x'`L�������%��=�UVt�������E}��(�=���L��M��$h1��4�5a�*�4	&F�.:�'D@Zg3�-���z؋���IzX�&lsC����Lz~���/��ʩ      a      x��]ے#�m}��
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
8�\0����c{�e��[��w@�&a�����Ӓzn�B�=U.��K�)(X���\�5��SU0�7���W"q�w�uY���_��Z�F�����ׯ_�h�1�      "   �   x�m����0D��W�P�m?aW�!�#��ִ�ĩ�F���eY�.�'����E�Ü/J3&��M+nX�A�ۯb�:�v�j�Ô����V�2Ҟed=���*:����~���)��l��x��%'#�ɐX5/F�gt�f#X�i�)~pb�Ԝ���d���<�P
Nr���"Y�=g6�4Aݫk�&�!&��UY�wHWk�      _   o   x�3�4202�50�54��N-*�-�K��2�
��q���$�(�'f$*�$�)�$f��U&rCU��r�e'���!�ô�&���2 ��Z@�Ӂ�1z\\\ J.%0      �      x������ � �      �      x������ � �      #   �  x���Mo�0��̯бÀ9�G>.���$��ۥ&QͲ�Ir��׏NR`(��zDR/_�#(k�n�A��(��X�%60���W��hw¡ae�Jؽ�a�f��x�2��h���r��Vl%�p�b�P�?Sw|�Q�TN���ƻ����D��z�,�b���� 8y�^l
�>p�n����gP�[���LW�����)�-œ�/gPh�p#9��t}�J���[�>���)��Gv�Վ(e�@�r�c�ELa��q'":��x�r��I*t߱�aŭP����7h�&.Zq��lqk�ߥ�R�ڽG�pmz�h���Rz����&� �(�k�. ��ލ��i�gfp��@:�PQ�eJ�#&C�(�A�KF�7-yNl�Đ��P��F�#�ʣu�	%)��갖��.��ֲ��dt�F�1�n>�h���ɋN�a����\E�)
86��B�↭��vk��Q��!T���9�3��2���*ګfO�T�ٱ�n��PVK�e���ɱZ�d/E�<��4�%�N��Մ斶Ҹ��J<��
:�5͠���X��]=�$��SXG�~r�i���ֺ暞�QI�����'R�=�_�!,:cř�#�s�
�.$��?��|��k��c�n�W�~et��֊F�e��I�xM.�ϫ��c�*y��4�ư�-C��&P�N�� ���%	��w��_~ٌ>�Ǎ&;{�?�/ O      $      x��}[w�Z���W��`tA@�	�A��I(>>�^�XEds� T�����޺�I!qz�Q��I�$d��u�kNU�Z�=fӆ�>w��5�oM�)EU�5K�yZ7��_���l�7[wl�˽�=���?d�{�ܯ����6�m����im����K�Y��=�ݥ_�=Ycˁ���s�����ZKk�l�z�\e�\��?����kjڷf目2���[��n6�_�2���x}������m�ߚ�7�yj�	���8����f�ƿ��Ɯ%k�*s�Y�ō����p��N
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
���j�|��SM1�ôV�$�vZ�!���/)�i���Y p� 4�6eI%��E~�?���;me[����{;>	$ASld�[��8cw䘟#������;�*]�,�gH{�� Y��T��\�KmB�3�_�wk��42���ik�ؙL1���;Hg��b���� ���-6	�	��W��Ѿ��Qm�������Y�lC~��6�4D��]�^Q۴b��@�.�/�ߗH��_�|�jw���������rm�-�}�s���Fʲ
Y��!�yj���[���<΃=n�@�Ē<V�ڢ$�-�Ed��Sz�ܝ*�L$D�u�qU��]*��ׅo��Mg'�Z�)�hܨq+r `z�'=:V�ܫM��QW
�e�*��,3��NnF)�V����S����b��p1��M];4�7*��Rsݭ6���s�A�E�ɈQ,9�N�n�U�C���Z��<x����+;m�N�.
?L��x�7[�G""M�N��D�2_�V�T�U+Ɵ�Ծ>$��t�A��N�·�����$�f�>� +ηpb��[��о���CzPaUl���u�fՖa���g�Yn�n�C��i�n�U䒢�Χ��8X"��l^�`y���nb�T��_K�ز�r�!ڢ��z�]�D*������e���ph��,�WH��B�O��y�؅�e-�\�L��pa���gT�[p��S���Q�F������*[���!@jE�ܴ��{"Gr雖 ��g�1�;�@f�cG�!�<���a��՞(77ҴAw�ݛ�N��:���$�Ҙ���$�J��ɜŞ�x9qv�M+oe��"|�sE4�Ną�I)>M]�,�����g@��'w������0�)\���&�J�^�)5��SSQ��Q�F�E$3yQM�H!�ZKn7a����l�I�2$p�8�`�{�6���⟥my(w�/H�k���:l����*�=}g���C	`$�g2LΈ�D�CZ�84���t>��=k�s�Ϗ�"#�=wV���mh�i�C"'z'��p*����i�1�DUJ������C�k=���[��L�NxL��X�Xxb#[B�ŀ��.`�F��|ק��?���\��?S�����w~n��V+{l�y��'��HӀ-�}�QT+x����(
�-��(��O|�s)쉥7��=wW��ת�lH��cH&*����(c�q��iJQ�����'S�]����ĮK�¶�� �o�O�@�"r�8�pk��fƞ��F�`|���]����P�V{���G?ҬV�T��W���K*N�yr+�u�;J{�>�7��wf	IB�+�|�p^�
F�$.?�<��&~D�<��G�/��r��3��ٸ�����7��9�� '�]8�dp۴n
=�E�貫ȾjF|�z�]��@�&Ґ��X6?|]m>����8��D?���p��3-��h�V��~��_�ҏ	�l��sp�K;wtr&�I��=�/�KGwQº�z�2T�"����s��`�h�#�S�|�o�����Rݛ|����S�t^��]����X^�Ӳ�X��Q��6�� /����
p<K����n�cG4�v{ ONs<��8)�v��^EȬ�\���ft1p��Z(;P'	'��:)2�	IBÎ[V�-Y�6Y������:�#�G2$�2s�r��u��t�";�]Z����W�']�[]���[�	�M�z�$}�>R"����j�'�+jvL�bQtj4�o��!���Y&k
@oZm­��4�t�,˽��(�|�o���%Uf�}�mvϯX[�ciBs*�o#����f���n�C}�}&2�	<?�<    ��&>�e��R�z�[s&����]T�~T`W��k
D6۾A����d�Jۄtc����U�#��;sK*�k��:s��ʬ����g�[�B�1���I���x�*�Bf������z�V9s�Z��:]m�	�}�wϤ���b��������>�p���H����~Z,G�*��)g�Y/�nSs��\t��p�0Ԙ����H J�L�I�\�����h��G��۷��wx9O�"�uA*�[v�|��wjm*�H>!y*W9#.5'���R)X�5�RJ�3ťjruj����(�Ɖ~�|����-{�%$j��,�x?��ͅ?��/)�ʙfֆ��mi)�z��<�ޢa���[�׿eLN�Fe�g�]w�0������C�5����"���\��8���1�l+Q�Cd�o"1�K��!�1�%xUce��uM�K��'��cg�;HtZ�(o֏�XnS���B�z���4��j[9���Pۺ	�v���9�
�q�0Am�	��2�KB�m�c��d�w��A �b|t)�Xe {�o6x��]wm�љ|֛=#�g�<8�0:/%��T7�WМ`{,���Ь���k(ְ�w�k_����^YTP���b-�Z�����&;�tpt�#�'F�4�F������O^:��'�9��C(�K����&��H�\ �Y9L.B>�Ÿ��	���{(c�*/�U>����Lxi�,�K�Uf��s�ą�0d�2h��B�vH:�F��)��\E�*�R��*�؊��̦�2�����ռ�I�G���'s�[Mj�
����m%Y�X����Z���e�V`6mk�s�(����Z���L����j�FCI�婾G��30m��e�#���i�3Ϭn�l�4��1��柝o:rb+t����#Y��:q_���H%�X#3�l���N+�=_��ф�w8��̲�&͈�oN�D�Ԩ��`�$����6ţJ�%�)�#�W)0�͌��k�ݫj�k6	f�,���C��=��V��\
,c�:!i����+~���;1	�{�-\��j�3�E�ڄ��Ni��z�5|5<�/�&L4F^�&y]��&*_����.ɚd�.y�.^�ye���߄�E�"������%����à��aC�2H5���Ia���x��8g����kX��MR�bC�_,.{ZB���G"�MdA(��><�$�d��x�e�dVof�˩O�C�|1�4*6T��_c�l�%П��2^.�x�?|��"U5h�6�>}CI�6�q�͋�2֫���"<d���`�F&\����ޗ���b�Ë�[��ёZ�q�ɼEs�b+K������WIH�˙'m�sV����QЪ��ٓ���y�o�A���z�F�����VqQ*:��,�;���j�0M݀ʁ�P W��r���@��ƌXW[�LqYE�*V��vF[�,�5�����僛?�m�Æ���@�5l������J숐vrX�7�C ���ӂv9��Z�w[�C�dv��EK4I��Ks��E���R��d8�W��˙��ſф��[��^̧�
L��ci��D^f�#����={�=�r�mW1ҫ��k�-Jw��Ҝ
���`(��䴒�o���;�3�s�8�'���I��b���jb��]�91�󳀷����	C���c!p��S�<�pl��L�$�$��6�QE{���9��s׽T�_�B�Xx����| u]��8�;c�}��6�����s�=�g/w��=��3L�b�e���Q!����c6���b�5D��L>Xo�r��b���_>��!�r��/�j��M� }w���}�L1�G�{X��>i�s�姽MSy]���>~��x[e�p��{�xĨ{3,+X�BA �	�ؼ�<�Xb괞��A���q���#�"; �]�.�\g�WM7jnl��S���|	m�ES�'�^ _q��V1��˿ے��`�	�<J��*��Hپ�ӯ�����'���s��%[�9�x�a��?�J�]��x^���6C9��z52�b?cF2���h��Z���gC<�{!$`>Wk6߃�Pt��8���X�WT����~B�4���r��Jʨ&���.&s�T�O�O�ߊj!o�X�i)tby߱���]����$>-�n�mł=?p�y�����nʕ�@=��m��H#�"���o�-m�R{�l(8�;������1�)1հ�o��(em�ʔT>t_���4İXjR�0q6i�rخڡ�`b�s���7��;>�m޽�6GX���D.Ib[���ۚ��ͦΘ��_"+KT�6L�����YA�w�\����y��G<�@������Y�o�����M�\����i�̓ᑋYq5��|��8��g�'($��rSƉ�і��`��!�� �����B�U���5��cV����y�^�oBL��
��	�Z�A��N ���!��gPUo<g��i��1<#g^��׵��pG���]Hv��l�	zj1��1<��Alxx��vK!c�:�����)腯��?�¢�HF<�}�ڮ8�����ħ_A���)��`Aa����{�"ZG����+����R	j�Mȹﰎ�6�$EX��K(q�6�y%�u$�7C;��ݷL�[�T\n�O�]竺��\�� ��C8��w�&=���b⛥Y��7�!�er���<��F�
v�rA8.��.��U�Z�e����n����d�E2�5�c�՟�b�_0WA�+;����w�]��㬒9�0'��HKB=�CI�~Rz�&�R_����%�MȒ������"kZA�+J��mc�&�oE�[p�P�Ώ�q������2��N)!'v�	�,�n�?h䦕���H����um�U'�!e��ncv�]���nXV�q�⫌Ծ<2c��b��s���/�W�ɋG�N�b"x���A@��v|��%y��Q�k���MR����.��P-%�����'�q,��J6'�;�d�x�����Gx�Jo[e!u1`�N'U�Cۺ�w�V�&��H̔c��W���#Jā$󞂬t{1p.�r�o{ۼ]��mh�.�.z�g6tq|�(��h��dN}��x6b=FQ��VʤN�ҏ���g�>|^p�Sf��xz��*
;��<@%T5L#��#��K}�>|c���H��4�TU�DEې�I-C��nS��[hJs5�嫚x�P�c#|��4�Hj�cQLP1WB�˟�/����:��?�7T�B��u�����6�C�=�/{�,b�S�rf9�� a71�f֭P�cd�ɜ���@�^�.�ʙw�/4��U�h[d���SU$���%&��h�n��"]j9��B��Bu	�+
�m[s{�%���N
��:Q�R�m�}�D�ŷ�� qqחX�C��>�^W��+u�*-�g�;��Y�����8��,�x�@�]N ��\�����9�p@-�.�|�hh5 ��+��2%����|�7��{��ę{R*�	Y��%y��ژ�Q��	^t���w'�X}��ou���%w�-���~;9�(y��9�U*���;�&z��R1�Ban���{'W��U�/�����
����3��<�/&�ސޑ�捂*I&��c�U��;gT5�K�ԵŲG�%�ߝ�wD/�Y� ����<��i
`�ۦ����V�#�Q��>�����).bʔ�����i�ȁ��c�ь=/�p���D�Ň��;i��_����C-(����� 蝻����5��͖5u6ʶH�A���Z��u2��O5v��OF2�43/��f�[���bm\f[{r����A��f�H�绢&���\n�w��D�vt1����8"�)Ӹ��s���F��HDe�wP>�/���b;ajDKe�?qܱg6�fj��n"T$5���[i;��0��:���s�-m:�
�5)���Y�u#��+m��*����j�p�C�a�Jě�����2?N�����J��ې�<�6]b�߼/giX/���FXͦ�\��x�K^��9.5#m����YΗ�6JnfW    �f>�.p����HmX����jGvCX�`�{6>6�ď���"b�
5V�Ia��e2����p��&|˱���5tR�S"1��)�D;MH�!h�[t���х5Ux̎A�-���C��f����`o�Ʌ꣨Ԧ��qս�5d�ǽK4%�9������/B���2��r&�50L5-C���`���~nL©)j��P7ٽ�w|����$����&�3
�.�����Zl!���R�VXٶNI�PU,����2�TŃ������YU�cZ�	�s!�D�4K�/:����[�;��)B�Yy���V��l��yxs|�l��碍(UrՆd�Rmn*ϽO2��&�'K7��>`�����U	�kK}��J �$Ny�_E���Y��}�p��7OG9L�#$*�	1G�$i�yb��-�˲�r���R��lR��tPȩe�ť��E��H�����X�8;�9C�=������6�����BG���()�l۸��(�D�$��sR��K
��<]�[�P�T�'ؽ�� t� ���\S't��݊R�[����&��z:�yu2Eᆷ�,����/��T��@q�v����&g.t9�ȺDc[צ��|������hME�5g�����@��8�I���k�A�B����_(/�#�?����wH+���݀y�C.���'�W��C��+г�Q�Y��.�])\�U9Qɞ�FѪl$���i�-�_����pg��$$��!���%CȢ�F"`FD���4�ݬ8��w+z(x?�0��@��f���3�w/�&j�����dXĂQ�B���;�a�;˸�^o�;�]39��޳�S���S^1��k�|�~�`�v��(���]��_V�޶4T�FI㟻��
n�_�X,Z�l����۲���?�
/b��-a�����s�u�{�L}�LmMۆ?T�xX�b96'���!؉.�$h|F�3Z�Q�6�j��9�>M`57�x�Ӧ%W
����Gt��i8�6���U]O�Y*�Wp)�)=��Z�@Ѻ޽;%Roni���!��;`�a��^�.��;il,}�n�y�Kg��>��v?����h��18�sz���5��F���-~�3���F�-��݁�m�Kg�h�Zت�5-���l�2����4�������ݑ&ǻ��/�:q��z��{l^K�nDm�H�eAƧ���&L�o��C��x]��>�y�,�e3~�CP,��U�"�b�̂���R1��6��H�NK��۳�l�цj�p�i1�����L�'�:'����<f~q�=�g���.���~EK�N�|��h�|siŝG���94�YW�C�c֚��L[��2��d~�:��`�;u����fF��;�hEъ�ؠ�(m��"']���n>�b��+���r��uiJw,��#� ��t'����1��_���dӖb�8|Y�|����i�s:�M߳c˔��AIu��T�I�yα�i��kyUy��I��:v������I�Q�!�Ekk�0.a$z*�
I�p�M���6��fA_�g�f9��:;]m�ǃo����L�B1��Q�+7���i���`^�
[���m�����z���[�~����׶M��"*w�ą����l�?�(vL޾�����-�"[VQW�&�)j0ϳ؄'k�HT�|:ÍEp����a��b�d��m���k�N�l��|���ک�h�;`�CL�x���F����\��T9o�І��=3��+�p�dEtSv�'�/�vN�d�|\��G���\�~���%�?A%�|�fÙ6Z#F_��5;����dƌ�B�7�#b�!\8��g2�=��y��o�_ݶ��l��n�Kw
`�:@��r�#Ӎ���ƭ��K[�*g߯�J���`�#���I��;�� ���� ����b?�,.� ��Dp�[\$^*{�F��/�3�gn��(z{n���o�> �4G�?8u����Ȁ����D*�E���į���ԙ��%��K����J�l���󛳕�3����~���i��z[4%�'AA�D�ȕ�sw��FM0']����=�G��gu3Z!�������T2�]���\�T��J>��'B.6߆:��U�h;�Ľ_8å�<eN\c�Xk(6�S�}�N�ǟ,��1��b9�&��hnZ
��R��+�ܜԲ�����j}��sg<R��.6�A���S�D*ugՈP*7�~���
�rvµpw��%��$��Snv�tu���"����GR�6�p�E��\�v�Xo�.�U��+۬���^9�H��MH�x&�GQx�ؤ#��G2i�ه��M��p�%����q��r���z���j�`?�\*x��|	?Q!($��-~���b��q�:����V��
�ȡ�_K�����3wB�b{�����
�E��
��hi��ӷ�W�����P�����R�;�}�dc���Iy�+��L�Am��z\/��b�L��8�p{K8��w��:Vy� uW�����n��#�o�X��y�ӹ�M���kp��2��a��Qܸs�D1���ttكh0�P�����1zc�w�Ӄo�xY�dՂ���<O]0���3%�9C%���ἥ1
�G�E(Z�}F�,R�R��{�ß�wBQ|%�f�������Z��q'{�Y�E1L��-+�b��_�|2U�_�h5m$�zϐU/�s�;~�:&#�B��'8�`�H�L7fu�sy�}9SvVe��*��s�����}�x$���DW+���&��[��~��}�	Ro���-!gyS~���=�=|�jv��e/���t�M`���x��T�f���P��_��FZ�R∤c
ƕ;ޥ[D��O�B'����ܡ��,��+\�c�V��b�'����$m2���h�����D��8}�3KۇÎ��'g������6�!�L�z��s׿1����gP���Z��L�
�0�7]���d���������05��'Ķҹ�qL�z�S�\����p_������;�R����*~�|�γ3�?�>�]{.T�>�
"cù�z���#�����*�π�5W,��;w���Z��N�Y�R�9�I'4�&?|!:7e9����p<"HK�?3��?�}V�{t_@(��>f���S���SR�w
��:�_���&�����y˳KR��2?�B�Im�K���h��f閐Z�O����K���0���9=�|�?@�	n���)�M�
����^�5�����L9Q��mm2[{v��A�@SaD;Y�;�c霢dx+����N��O�HB�4A�ݮ�(��tv���^��N��ޡ!�3Rm�9d����0�O��$�U�`ohĹ�
Kg^dV�e�jȊ��;{r{������VQ,�k� l�ch��i!\��z(:M�(i����<pVS�z��������DWB�K���+��ް��X�w<	��T���Mi��dR�^Z_�\�L������/A��)�t,Ʋ'�R�	���=3�l���K����="�;��_(.��I�ta��{�ıL���<�dM��IKyQ,�E1j��3��QL$��0qX	����d9#ະX-��QNZ�P4��P;����Y�;т�aY(�.!�i�@ץ�����J�tZZ'�]�_,�~�|��R&���������'\�uAeՙ,���3�����-���C�3�$��J-2g��?����oiQcB��"?�;�f9?�z'ZFz�K�)�-<

T�#'�P?GH�}K?
�2��H,��*�ο�4ׁbc���<{p$�)N;���4�\mH������������ם�H4ou�����h����3��g�g6�BtJ�ܱ-�^�Y����s�,�r��sU�W���6����b���>:��Iܛ��ߞ��|��y\r�Y�zBFW��h*u���E��u���M, I��o�}V��Ev]t
�VS�+��y��&OBB��Y���ct��3lm>̒�Fv)�>�_p��ҵ�����;,��N0�9�9��8��3�8�(V"{�^xg-���\     ���u��-C�C�_z%�6�쉠mL�JV<�6S"e��\ar��ji���T�XR�/ǍQ|�ɽ�v�����L���0��pNXν��V[[�-%:$7�mS;F-۬4�2��Tf9���sX-S#�
�ό;.���Z���#������Ÿ*6$?��E��jF��[L�?���&��ޞ����-W?_oY�_�7�����!�)�R��E�#���i"kⴶi`�h6Hey9��S/���O�u�B�����.Wv#l�za�ˉp���ED_i)�j���y]m�=��d��:ByU�49yB�}AѴ��O��J��k����Wku���4�~�U��k�����&#��x�wdV����pu����r������ҏ�e����J�g�ఃs|#d7���8�B�?FP!N|A8�"3|�|I�f��D��s<��l�+�|�E��DJ~(�2)�߃�ROAS^H��t����r��uF�+b�:�ۂ�)UR�:��c�3�mC�3af�k��RMul��$8�ш 	N�|��v9#��P�8��	��4fLF��+��~Gq�F��������z�(�6�3���|?ڧ�D���9�{S�g��4�vK�/]�ړϳ�d7�S(/��E�AeR�r����]l��v[{XN��ȼ�IKb_\��g����i�e5�[�op;���Æ+\�ܞ��F9��z�,mS�o�\�w M�	xZ*UƄ����n�e�k��wږ�/�������؀TW:��RnoqC��Vb4'���-��2�r��u�A۶6�0?@19)��8�+�qD�:�`-_�h��'�F����%%��4��)~��]Pu�����4���|9v������	����[q���t����A�t�(򢞁<D��V�g<U��EʅU�cU#i]�z�]�h|ь���,\$���S�1�Br�]���-�~�h���סZ2��6���*�i����p�F��@�������3}�i�����˸������_��j�T�,Pέrh&S��g1u����C,��,^	�����$l�k���اtkIxSq�?,g�Z�֌ih�������0�G����a=a77���P��Oh�&zf�&����G����oaգs�r�
3�ެjُ��	�Ǳ<���r��ǿ�3��2o���B9b������>e�*#��JgZf�7aP1I`gb��TO�4Æ��pˆ}�,1�Dj�yá4�Qas�(.���q��ݔj�v�����x��[tS�Q7���Jq��� �tO�R�_�v�!���ތ�F���W�:0-s�zW�ն�N����r�O�;�e(�?>�b~2��/��
��֫��j���;~��l�xn�Qe�{�M2�|˥����ݻ^�Y"�q���*�Rk|�W���V��(%��u�ɗ�����_/nWE�0�}Ŏs�bSΈ^���2�mq���������yI��|g��Jt�9y�)��\@�k����|ru��M��r�d���Q��b�o55�yp����V@�]��9Q�>D[�_������\Z�Ӎqճo'�#n��[	в�V9gJ�٫	&�ҵ��cnN���[�a*j�:c�9�:z���n���p�փ��lݒލ�A���r���ލ�}�.�Jo�ȶ\�ٽ;ʨ��[Ab}�|�#|�:�%�T$hU�0�Q�;E���^ħ��ف��w����|�p+��[-��x^��y.��Ni��H�˗q��%� K~��#N�~�~~? �K�u~f}���]�m��6�A�Z�]PD@��C��6u�㕞�$޶)-п�a�s^��I7��ꦴvD[�����`Ś��c�H��Q^"Egʿ�m�u���]�qK�"80��:��,&Σ��5uU|)\y \<�#��F�%�	�	.�k �!R��ҷ{9�ֺ�8�揝�`�Ÿ́$�ϫX�e(�yHY�G�n��׺E��4��i+II��nJc$���Z+)�b���4֣N�b�4&B�@�ې���}�l���>��Yk1������A[X�z�}٦�Ri`�4��4��a��a\r�	g�9R�2�e��/rrůԢ�"��n0qT�Ԯ
�DV�=��%����-�?��n�f����N�x��gg�,-���s.�u9�>tc'�2F�b�;GF�6��#��
2oK0�^����Y��b�g�T������S����{Ĺ���� ds]�m5c��t�M �0Ƨ -PVrh�sg��d��Bz�h��E�=��&B��ON�
�,L���A����Lv��:�Q*���g�?��nk�x�%�y,>Ů�]|E@�o�QN~t�>��EZ��L�Uλ�.*���!�ʬ>zv2��Y,f�qA:���!�*#��?��4�G��c|Y��m���.�o�W�i�����w(T?�Ua+q��b�L���[�F�Ĵ���^W��!��97�Q��������.ؚ����Bb���`f�����F�#����q�0h�;lvG�w�������M�!*\�[!]�ԩD%J��nK�#H"EN鯎!$7�TkΥ�X�gk�Plw9��Q)2�6�Z���V9%�dᰐ�Ni	ŧ��|�wo.� �sM�}0Tl/:M�������
!�T�oQ��H��ЗW]���L�6�3�c�%��|�>��γ��U�Օ,�uH� ����c[(�ݢ��s�~�������Юy�Q��;YV�e�V������ �*-��ѱ��&w��g��֛�.�h���Z��$��8��Ke/�m���h�
r��v�{OL.�qWQ��q�<�n^��I�@s��!Y� �Hm^kI�q�����p�q�.�<���y�IX�S�ș,���*�ǈ9Py<֥����Y򑛌2�{��|��+*�/��촵��?Ax��ϝ3$�B����,�"h��� eC?~�Z`���1�/C��́�)����Cv��g�z�N����W^�> x�1�푏r��{��!�P��ؕ�cH�8eƈJ�����x�,{=硂V�J�Gǋ!��y���e)�$͏Y����I��U=hD{�¿U�׷v
[C�N��I�*��}�H4��6��a�3t�E�T.e�K(8�8-�d�J���}��#�s���!�jmx���jͿn�mx8�Rl�1^%|���ulœn��WG����w�)�iA�2�m��j�!���TtI������j���e�ݚ���q���\DU{(��m
Eh�W=�Y�|�k,�p���Kzdt�����{��7�S�<�7yk({<iCb�K!�+%.�t)�%B�̜���r�}߻P�[N|Qk ����Wﻤ�(���ޡ��C�ӶoyĖhO�ʐ�>�U�B�_vU�3i��ܷk��2��,��:e�9n��+Ju��r:�6���1�^��W4���Ţ�7���h�Jx!�۸�"�E(��Ψ� ��r�S<eM���Fn��UW_�c�m (+ő,z�u�G�0ٔ���ح��ok��_5��>����n
���%��N;b3j?@�n�� ���_0����zp�����Q��7Q�rA9kb�G�O��kA�*OQ�V����Xj���z�k꼕؂4��I�`�]�K�P�1�YA����>Q:P�mnc(�"f����D&�����5�um�[�x3���g��)��n_�����M��P@�-o�.��ݡ<���'ymT]�n�-d��.��+^=c�Z }��ʬYJ�/*���j�c��RJC7NH������Cxq��c�������|�F�����yUuP�[Ɇ���l�N�I�EZ<J��wJ��f�4\���q�ٙף,�!��A�֋�W+ �w�&ؾ��0\�{�4�~)�a7��t'.�0��H��4����B�Ɛ����n�&��8�Q��^m��.��A�y$�m㹾i��_�$�)�M^�ֵ�l%�����%#4FU�1HW$�4�:p���>�i�Awjn㹈�r>�5B�4ې:Q�f���^�^�O��W�c	phv�*�Rq���c!M9&���Q*�^i�PY��ij��L9���b�    ���h����.�f2Qg-;���>E��Zq*��y���/�f�j���M4�{�� 2��T
LC�B�Rj5���9����BCs�V�)u�_�QR�ٰ�sGx���)�o���9F���r�ܨ%���|6�Z�7����m��hx�&���aR~���]��K�b����	qb7;�?��R��uL�-�-Cv�!��D1�}C�-n���-.ۃ��g
E6�Oh��c��4.�)gU^���j���0���
z�V�B�is���<l�=U��D�r���H<q&sxμrm[oj��a ߯�Ӊ�ˢ���EY�a�9�_��'�I9_���_u�E�U�0�F�/�w��EK(��j�#�JT��H�x4l8/P���g�R�T+�l~F�b�nB���jT�E�.�6DW�.��Y��k�FRcq��\�#\򛗀H&����R�)#.��ae�:�p+������r�>���%ڬ���V��Q�
�u��Fz��F����j���&<\f3��_m�۩^�{7z���uugy��^wp�i1]g�*	�I�.��çc�o���ք�n�ݎU���'|��y�����e{t�0��"}b�� U@o�e~<�ƅ �r�����u[s��;�%� 9ꋭl��C�1��h��@ldf)�$w�A�&/��Lo�[�oxr/���>ΰ�U9�y[�hO.�UI3,8�W-�OX~���t�/u5���ʙ}��i�]���~�Y~��j��DLz�l������%�ж�L"����3Α3:'@�ԩ
��5f�X���(\���G��@&v)$n� C׼ʰ��A���(`S�(�XOw�J����y���I�i���mĥʓ�x����ot��3~D���h}���RWh�1ZzS7D9�5?_Bb�n_�)f� kJ���&��T.zQֹR�7�@<����}s�ԛrh(��B���c�^L���D�SU����s3�r����^ۆ�� ��	!޾���t��!���S�~�2%^��h����F�\�6,g5��dU�*��S�#w�܂�_���E�C���1����n��k(]_H�W��~	"�mXH��_�,�ʠ�B٥�y'�V����ɨ��Gx��:���y1����e����2�`�r��h�X��*G^؍9�C��o!.P��8��E���lC�hd4A㗲ͻ�;Խ@4�Q���`��;U )�'=�0C�1>����U
�vH�z��\��f�"�It���ʙ�ΙkW[��g���s{ⶪ/)��}��!1�\�d43 �X� ˍ>6�;�.��-�Y���jj�o�84��:l?G}�XjO,!�8�Wu\I+��#���EG�w(���F��j�le��=QO�7%�')r�h�?�j~����\]F�Tw��G�_e�+�4z[���RL:\�^!]�;���u��Yl�	p�2��"��'X��3=�;L\X��+zN\M��Ɯ���]o�������.���o摦p��PUNb�n�����~��G�]��Rc't�p��v��nz
fqA���߬����jK���PU���Np���n�B_*�"���m��#�*,:����{�2�A�8�{[�U��w�na9]�rΝ��s�[�֧�J=����x����4��x�E2%�S�� ���>�§�����S!�Y���壅RQ(��;���� C�'��%�n��#�N�H����(Q�#m�F�St~̀���o���AW�5�I�o1q4>H`j��9�E.GK���cȖ7M��%O�� ���0Z��`�uәk}��\��v��-�=b�=�s�G�����Q��-�w���:���z@̓(ТC�ݽ��l�V�b��M!'�Խw�4�/~up���	�cޠ (�T(lR�h��\E�U�y����?����M��s�/�,��<�@�%��B?� [��`�_�,�VZ��:���w�B����ţRZ7b�n~�pE��h�f?B��c�p��� ��9s-(7mC�����^ ZtU�u�=���/}â0n;Ůh�)ZF��.��\�*�����Lg��!�q�O�L�Z��$�[�V��&z��7	��w1�
m������W��W���nk�a����ͭ�ҬM���8��d�;T��l���J�R>iNS+�݂�\���M�g'c�MK/��LcK5���޸�)�⑥En鑾�'�y�Ԍ��E����6�m�6�ޕ�6Z�|��6�@F���m�y�u<�-K^.!a���@�mk�]6�i���c���ȡO$na�a�sz1 &9�7݌ۦI$>��I�z&�&d�'Fؕ��sm�����ڀK.��;e���<s��X����Æ��w ���9�ӧ/�|,���-��\+.k�о;�)9���{����)����~�mnh9^"�(C�EC��wn��:�'n�K�ixS�f��4y��h���3�����}�0؄�D�F�gd��^k6���~JFG<	:�b��'	��ھ��P��S*�j7�]�R;�ͦ6r����z�GMpW�� ���5���'D��w}Z�*�Ҟ�	��j��z�}]����:M-g����cŊ4S�<�a�u�l/���FA���Ǩ�~�ԍ!X����W�1�1��FV������U����y�MC{t�t�pR\�M1ta�툶U!�;.����+�����OC�'�)[Ho	�J�V;���1�.�K�5��Z�� ��y���@
��+�X�<���G{�5��&��&����Lx�qM��lɪ:3۔�Br��t鹏�8����"S�X_����GZ�_�?1[�l%´Ԭ�]�����M.W���1�N��3�xxؘ��E#�v���P��ᒩp�&�L �]�5�F��Jq��?v��)̯���KUwA�@򬑆���iJV��&#�um�.g]5�֞b�/��ںE����B�б)���(--�#K�����s��TQQ'L���8Y��Y?yG�g����D�n3J.�w'���tD�ͮv�z}G׊�j� Tc��!����0{m���<%�S�|�7��pwm�#�X���7�1g��m����G��jjcw�ؓ{����~��� bq�[$�#!�CUAm[�%6M�h4��fO�V�*�Ѥ��<��TD���/�n��%�#}�C�FlQ%�s���Q��5�Ν z�	(�JY�|�H�!�oY"=n��.K�>q�#*��s���:�����Sg1���C�
�q��}z��/��!HfG'��)Y�l���t�r6�a���ԓ>O�t��m�27�p��$���3�2AIe�Y㾯���3�Cku;q����!�M4p5􄓕�
���y�2*'a�Z΋3m�S�f�����+D_�W� ���qQߓZ�PQ����O�/~ވԙ�]PȐ���W.��K��I��X៻#���������M�x��yo�W*TP���֢�y*>�1H��y�������fmt,K��ˆ3��ʆ�(<� �-.�Wl������6`�$j���r�#ř�L�qw��c��k�m����x%W�xVB9+�#~�\���>���L���2���p�R�E�;��4��$��z�8�겔�vb���ߤZ��v9O�:�bX��Az���V[j?���	R
��8,�`�L���o&9��NB���P*�UyE�ͫ_`v�'͘ЋF����g��ѺiC~���Gp���uR �m���Z񻋞��b\Ϲ�Z4��Aذ��o�u:yR�|��+"o����o��$���1x����7�`�AԹ(�s��T۱6_[��؟�~L�R�=�B6a2�����t�#k��s�]�sg��	�G|�<W������>N ��\-}J�;��;�64�����n�b�L&H��*UB�H�ڊl��%��Ҟ����
��3!����fA���S=ݱ����^W��A�B��^9(g*XP�٣�x��-�b����7�\�$p�ц��o2ʓ2��w�K�E�N��\LU�wu>��    �˙�3�[���x���(��C��b�t�b
���gB�m��Ÿ���s�h`�ֱWA��-d�� w������� �Wq��*%hI^A��+\��"��U�7��{��}�[M�z*]�{���r�psO����|P�.���|�%#-t���&DF��P�aɟ�� ��tʙ���oK7�#'����(�E�{��.���,a�Z<��[�< ��A��L�=N�����V]�Ǎ�>�8B]���R]BĽ�*���1%}^/��ׁ�C�jmB���_�
	ÖڄR��q�a�A��鄚7ب���՜�؏��4�����Z�Pi������'��4H\T�1��
�0%�1�&c���O<��N�z����"�*!��N:-m�,������SC6�J�+M1'�V�%G6w+$����������;��p#U�f�%������9�L͙��Zd����7J䤠��(�v3S"Y�4�>�������u��l��%_��1����s��Y�R2X�/h�����ȒV�������"�`�)�s���z4���y��3|����3'�q���dd�5	�{!Ѡ7Ӛ�o���T�D���䳜�]��u�n�|V�@	0.{���'�[�i�P����������*���FێF�`=qc��ϴ�[�}�:��L� *���ې���ת�a����F��=;L���8C	�d�,*���)'�ފ��'��^m��n�a��9{?�!Pj�谩�$���?�-]־)��L��lf���]���P�fS��[�T�C��nHT�#��Y�]�+�����}�}e~t��މ:a�t�����h<�sw�T�VQ��&�?^zn��=g}6��1T�K��#���^�v9��54L����v[�!���_�粢�J��+B�ap�nd��*aޏ�o�GBܖ�kV��/�{��Qy+�ə�s��[���mM�� \?β��i�I��j[��JYӪ��sw�$v�Ǫ�M�&����ü<5��3�s_��ɶ��R���nM��� ��xb;��2a�o�W��Η�Hw-R��]Y�*b.���Y?��Lڪ���GHb��],���܀�Bj���3%��m#��[���_�̪;�4�.iS�[ig�6j�h_������(JCꤷ�mA�h��Z���L�����<�/W�*����+=}��yZ/ ��Ql2�Q�/v؄��$  �E���������c QyI�=����}�r.���o4��z.�xi8 >#�8�q�-m��5F�4��va��9��!�:k�l�dW��&��Ե��N�fLݱ?H�߅H�ۋʻs�&��(j?�D�{�
Y����,*2f��w@�y{��A�+�
C�g��0;�Aݒ���{w����6��v�\�r��5[d�#����A����)�Plu+�;�L� ��~'s�s7�~j=R�N���a�����p��ԶT���g�+鉥�m�nM�y�Ꝼ�W%9$��U_������
�w�,Ɏ��$��+!�)�
7(����"���g�xtv���7��.�l1A~)%*p#�����`ľ�g\�-��g��MV���(ҦzGl�2����l煛�[��&��Q�[)l�߀�^�V��֦���2^ gt�ӥV�͉�F]D�:��Qog�ܙ��=��N9ϯ|��q6t�*� �CP\Y4L;CW��^c�w�{p�XI/��^'�w�.\��Vϭ֘�	��r���!�R��F�D�M�V��IY����_��d���s���N�:��Ϥ�.D
�(t+�uN�����W�~_
Ir�XHzFE$�>w�Kս5����P����l�γ��	�Xpw����h�"*A<�l	�p���H��'6�~��$U�݉R�o�e�::��	i��'������/w0-�j��Q��g���mSz�@G�rIui�Ɍ9�e��uʘA��9���(;/�T���~��h��ąA����?P.�HvZ8��ŀ��М�e�Va�>#d����*�0��	�i�#��_kNt��D��ĸK쏝�`��q3Z�J��>18s��/���n��y��|�l���U��������!��]��n�ޑ�l�-�BB�H��"�|���&z�������a^���-'#Q��"A@�'��K�3�ma�>HfV�6�1x�E�����q��/Ut�+��5�?�57��N�_�Bտ�g�=m��vc3Y/�=*c{�)�S#�iG�h���g=O-���W63&�&���p}a�[�]�^ǽ{�Nz�8/o��H��t+��86Ngyr�s�\sa�s��h�w�hjh�����l��6�n{c"���9>�������X�2����/��6|q}Ŏ�k�h��ή?qܼ�S[)��jἅ�/B�Lf9�!O�+�7�K<�2��l�޲Z���	����!\���;q�NR�=R ]H4rщ��y�����nJ��oݳ)��&�����_��)�xT���M����s�Q[%.R"�)	b��٭n(�U���u^FU4(�mm�����N�c����dfl�/�.��M�S[>�ly[�����?h"�i�v&~$;6�����m�������(��	k���`O��y:�Φ�ʼ�����M�� *ֻ!6��g��u�~�2\��C�����fh.��T���M�����r��B~X��cx�F��:����ĸ�*��܊�l��~�yyI8��YprW+���
�C~xP���o55�ﻌ:�9/�֩9a:�`�6�9K��&(��������(k��K]��,z����x�iX�:�	^���%�ĽY ��\����f��6�`��xn����B<�ˆn�yƧ6ڒ[�h��*�>|xcOp���ټ�[���˿u���C��&����:��o*����,����wP�)a��T<õ� �˯��b�m���;�B��p��t�P��R����2���W����_�/���t3���j�~?���Ul^�*�J}�W��o��0�D]J"��	�a�%�i��r�[݄���W��;�j�g�Л�`��v�!�o2?i����/aE����d�����+4~-� 1����Z?+�E�SoH��X��y��2����%�v�_z���-�	�V؀�$�/fŪ�~�4X����6���Tn�z�.|��]���u�{���˫�uheŰ.�)v�_���epɌW/�G|�5s���7�:�1 珵�E���5�ɶ,�/P6|�m8,��X>%�� 6e�&����ق���U>�U�m��zK�x��$��g�:����1�i��D�e>x#��q��Y-�Nǰw.-��J��>��XeON�{n&�`�&7�y2$␯��w�|_��KB�:�.���� Fx{-��E�Ƚp�ξ�����&�sU"g�(첏`C����&IDI���!ܿ�'�7���ۀU��6������E�&is(6SU�^���K���P���i��$�G��`�0��7�Y���Vn+�LjhR����*�Ѽ���1�1)�� *���/�f�t�VxB�o���/�ҭ�7��h��2��W��~f`�(:�(����#<\��Ry���-q�J��*�1�D�$N����b�?Q�ƭ�sş�M'ͫ���}�v��I�;{	Z�Tna�� @=��rSޘ����*yt����Wh�\�Wm巎�b޾S 7� �	;�xx�J~�I�M}��4����9�,J���j3�4�|&u7�}wT�\R8�ͱ��Aw-i-�xzFr5�CpV��y^=<$1�Mf�dþ�� �=}�s"�,���HZ�W/�Ub�U�CD�:ޓ�=}�	>�{��L��]��)g�W���(����!�a����-Е�X/C1�4�̅��Ї�kEd8Wr��s��Q����ic.]O� ��+v8�=$/�3�_A�>	���F��R�OЩ�.���7Z��7�d��|�jǂ�5FB���߁�w�Qx		ˉt�xJO����k�_����"�)�R    �5��*\�1W5�+[�AtC��i<CR���j�����?�< n2��߈��8�bK��^D�=���A��f�����$�A]���` l�و���dH�.q��\iV��0d��4�V��,�Io�b����BH���۠���U>÷����ѐ_�Ή��?�-�5_`=W�I�=iD�Y�o�L�d:>)�曋��u���N ���_��t��
�<�T+H�ȉ	��6����-tCV��ouĐgd����>�.ۆ�`�մ��|۹�Z2���ki�5|z�=�Jᖹ$ZeH��X�:����z	���c�o����ǹ�^*���d�}��������r@H�,![��B�!;�>��=3yE�o�歘�����QB��q����İ �]��S����ހ�s�b�Җ����<�h>�|$�|Ҳ}�z������o�U���w�T�.�k[�?�6���P�A<?Ϧ� �WI��!\+�a2C�b��Ѭ>�i�*����,x1�ʮt�>+�P\%9Y��̲���_U�3͛SuT�W���V�~� ����J�M>���6�zn'�\���*�MoAI<�P�dZ|�^�)s#�7�e�.�S����ƫn�s��"8i]2�?�P�M���S�	BxQۄ�=�5�a��������h�F�.�1�������U����P��?6�\����%-���=���X-��bz��A)�򏴢�eؔ����x�`�j-?������w�-�yBfLzq��=�a���ɳNS�u��8��Mܠ�"�Q�K}-�T�1��`bK>��0A����%l���Z*}ɧ�w.,��[����]\�'g��sפN�J,���~���OlK�`KttV1�4T�����tJ����<.�{�b�S(�'��q��	N�3a���9�~n�M�@0�D�y�-Z�7Zg���u��.ә�3��ؑs7�T�9_��9�e�~[�~�X#n�؟�m�v��c�3io��_!Z,` Eٰ�eww�K6Ҡ"��s��-A��92nrLg�ܼs)߼�]Pκ�6Kni�����MV?)	��Y%�TH��ڑ�dBeR�OR:�P�I��v�g��rUR�J+R�p�I,Vj�mm��4�]r��s�J�U�dԕQ(��@��-v��(b�R(��M�:ݫ@S�,��6��c��yp��'"C^!�T����C�d��@�������G2g߇��;g��s����y|��HVk{����/�-L�4�	��0����ށɤ]Z���
���u��h�!c�v��h�������/�m��t�<�O7v�M#F�e�C��͡d�������!]�s�L�9�豕�����p�xT����f�	R�L�Br�]�W1`*��1�9���ܫA��~��R��-��� C"��j��>��h��+���";b%ƛ?��d��i�r�v�"9�Ƞ�ZLﴴ��Q���'8����v%,6�b������[l:k��w�A����ٴ?1��3���Bv��3��g.x)��*���j-w[vֲ�ϭ>dު�t�@��?�}�"��{���quHw��rV��;�t���+��3�S#�s��V���d,iHq��;F9xxXm�5�����s�?�l����w� ���象�K��~_�����v,�A�0K#R�R��3�0�hĒ��O%BvAb��K~D���d?_�ٱ��l�;gH����u$�%��@���gD���n�[�vں��!u�����m�n9��ڴ):���u���
���%�n8��a�e��^ll����
��o������^fQW�E��y�h�H����͞f9�%��� ��k��>����tk�+|�#Ty	a��Zm�v����-��]��{˞��b�zŋ\\�����[=�oJ���urq�����nֆ���5���>�"j�r��6!�,�b.U|��d����՟��gv��,�j�U��)�`0w9� Oj��-�t4��F=e������ǧ�l.��h�3�$�L�XΗ�f(�nKC�cg�F�ο�i��[T�<��Sٺ)����EH�\z��ک��F����R�Y��jsp��0$E���=�t}�ul
(D��|���̭��3�M�L.�WN�*]�[�M0 g���! �_��͚��n��Ώ��/y`����USJ�q�����^��� '1�K7A�j�TUbX�8wsJV�R��ZQY�-��J���=,�1�������.�����K��=��Ē<L�ڹ���«�����;������\�A�ܛ��	��v��wΔ����dE�ba�φY��t4TC���"���ct�'+M��$���B켔S�Q� �	���Ѽ�w���>����k�F�҄U*��,�R�#l���s�\��P�+�D��W��N�A���(xIm̹[�u��]rw�KJ������ү���4���:��B��7g�EG0�&8H8s�����~��b���Q9��?��U*c�D7��w��y����K�E�%�Z2|�5<s�G���r�*�ȇ/�4�@6��)~��P�jNo	I�`�݆�`���'�P��[f��ٷD�]�}A��;�{d@��0��ې��a/���������5�>L�SȐ�܊���O����GA5<�Q�G`�6QkJr�3ߝ�*+e�{����?lR�nD��x�&���/�Im��S��;��V?1I}B�������dFK�T#��D��R�;�
E��M�D�Ln���	@&�5��x1�x�{��B?�q�o�xTJ?)���\����a�U--�L�z�~� �g�=X�9�"|�N���zm`Q�^�c�FV����0�?e�>1Ym�7���?�U�U���}���͋��*�y����/]���Ç�O���>vr��~��3��b�v�y$��W�w��M�W"��i�+����?���'���B�7�k��K�|d�)w1�~�_%�1�=V��ӛ�C#��黅�Z�����Rv��m�/8Q^�{�-�AY�3D��p�{����T��ċ�_�Hzg�}˻�I�v%U�/��t��Lց��0�9����/�	���*���n����i�����儑|0Rz'�3/oXo<��	���q:PA4��}H��?���eWh9��1Kbgo0��=w��b�Vl����hF_O���e�	Q�Lp �$��a��������>�?0�~M�E��d�7��*v?vl���PC���?*����$כ�QX�ybV���4)�.�ɝ���Y�G���m�Dm�Zrƽl������w�'N�^5P*g�X�vİL�٬�}�T�B����9r`�:�<�6o?�xy��Y�zEa�Ǹs�OFq����P]�����B�]|��{�B�R�Iк�.���_�-����h���cO�F��	w�����YI�"��}�6���*Ӳڳ��B8�-�����t%/�)$��ت̐�zo��a�5~/<��\�jR2M���ͦ؄�"���	�rD���bk?��F���V������
���A���U��
��"0���i?s�4�(���GHm�� tKA���޽҂�����Hs�'L3'�*��^�����C�<�����\�m�6#��h�}w�L����3L�Ͻ�%y�o����#p�cڈ�}/_��d$�o�E��RદQ�a�D�g��Y�����Vɼ��=�Г�I;�1��")L4\G�� ~?�p�zKJ��5���L�j��`Cw�ۣ�&�ϻ��91�J���mu\	EX�۝�jvoyc�u���Im��{q�iJ5ad�E�#�8��8
�=����P�.�۱�j�@����e��/B�J�R��k}���1fՒD|	|{8��,��V��S>Ԁ�{�
$�&2�«�O�0�N_�M�.b��ct4��_#x�TE���=�B�<�A���7��n��L�s׸T�Uԥ�;�Z�mD�@n6��b[���g#v���")x9`>@vCڛ�_}�����Z���G�m5e�g�/�vk��F:>j^1���C]��~D�s�-��%X�    �d>�xx�,R'��%/Uq�B�aPȨf��Ox3S�Z�B�q��_�x(�J�8C�˂g��1D����Ҕƺ� ���7�g�ٽߞ= LH�F^�MñXRJ\Ba��P����DzC�ՋQ��Ԝ�^o����ub� ����ի��^w�D�K-��<��˺`�~qzi�*v��%ޓψ� �����k���}�Е��j��
�}�}=��V��������oj��w�4��K�7�˅���#mao�y����;���k)�L9e�ڿ�>^�:b�%���y����	\��h~3&�z�o-N���9wH)4޺*-(L=W��爱2~�������[��9�V��Ӳ���		�ڜ��*.J!���쩢����`��bE��/��K�h���Y�b�8���\,���ͧ��n2���v�1�#��e�B9C�l��V��C[xP+���
�4J�w��:�Ն}K�4ƻ�l�1�=�M�����ҙ�ʩP����>w��Sf[J1RL69����m�6㈵�[1���J��h�#��{(���õ����d
T�]�i�ӗ��@������a�;�x���a��K��F��\(���o~a�X�hnJ������#\6d�����#g����Q��de���QrU�V?5b8�x"n��M���O�X��%�W2���h6󰕵�y2q8o��.�-���7��8\��ji�����i�T�B� �V��g[x4ļX����;�IT���F��lBk62n�q`��H)�֕E��	���N�+����Kjk�Li����dE!,m'��X�n���Ol��c�t|
t��P��՜�S�,CY�\ ꞻ_V��۶���_z�F���n/�m�<�O�C%��0N��[^�I����?��έ�ĸm'�"�tTY��>N4�r��'�	�7�t��j��U�J�.lm��t�����yr|��%[&s-�20�MK�Ī��Z=Y�=*��U�-�WSt��y����@ګ�u�����'��B���~��_�z�.*6�p�&�1����R�B���z����:CZ	C��<R�V�)&V����x+�O�Mi(�
����n�z�J�m�>$����
Lbi[�OMu�ʿ�5/Hܖg�w��+�Y���p3v7t�9�@-��/�'Б�д�=���M��ڪ�0��p*���ZOc��Tk���?{o�ݸ�d>�/��1p�o�H���P*V�@!\D�T�bƍ��o�/k3sw��8Y�ꪕ�'$�s$sw����1���ݹ� �<�z�^�1��d��
7o��X�������D�]�^N4����V�m�m�n���3>��	i�.�F��Ñ�&meb�h��Pp>�� �!۽�/,AP�f׺ET����=�[��)�2|�y��K������Z�=s\��3LN�L�ȿ�����>P� �%�4���9�D��ϋ�x�d���q4��� ,�:Ei�d�O�w����RT\b���E@Voq�Ge�dLOι�7�/tS��ںfSjQ��vf�&!'�-������dݢ�K�h��^�������=�tIXf�p�J4I��,��|�iH�0�*�C�So1[O��#X�_\�Jk��{�H{jI�k����Yu%�?���.)�0�d��#�X�k���Ho75��א�>-��������~���R��#�%_�mްd��=�bz󆘻?l�.�61��)̙n���Xx�"uǶu��%�5��$Bp�o��Ͼ�+�w��_��s�+5���3!,�|�L����f��t�U,����&+�<ϓ�j��7�E�E�n�	޹&���mS�/V�s��g��t]j�v�lv�Fb�o���=܊�֋����C��o���3F.�Uf����i��O�ٻ_��x���O��00���F�a�;))��W[_��{)�m�3��)��'9?�ȶ�x��$ߖD�Q�)C��g�:�H�u�뙙��T΂���z�?��8�˨����u��n�ϔ:�����m8��������FX�[�X}7����V
��Q���� �z�s؋�	�6j6��>H��U%	���{�+IX[�CO�S���5�K���.���x���S�������������D��|�g(���N�.*��`�C ̄�74��6����NS���
�P�F=!_�h��m��e�����Wbn]�ߜ����c��t��36� 5I�� 9�;�K�p�CDl E	��Ơ%��x'�1����o$�%��p��]�J���v�ў�j��L2
����̙a�Z5.9��\sW܆�34�cjq����A���d�]@��~����@��࿄���?a���q���"�|e7���s�Gr�)l5-��F{t!���O��	���mH7/�I����ŌM~	3#�T����
Z��Dn����Fp�j��f�l��\d�V/�<��>$�}�_�ݛl�=���=�bM�_$�}-A��y��[O��Wn�����u��vQ�� o+�]x��9����c�"^x#��`���b`���a���[��h�_�����BOs���z�&G�`�#��P�/�ʈi�qtnc~jjgQ��3C%�Uꄮ�j��I��tH�H]%$�R߼xvPN���B�r*=���@S)�Q�P�y����=?>���½�����&Z��S+�D�m�FB� =�ee�?��b����t�ˡ[��nS,�H���ɗv�����s�t8�;"��_�d��ƹ���0����B���f��L�*Q#'h!:���':��ΗTP��Sm�(���.s��i�Ą� �R�N����M�Q�� T
�(��_�����erS83�c��k�r�ŊaF?w2�J%i����oyWy4���!��w�䄹'
���۹� ���
�t�4�Z����;��^{���B[
=�$��ɰ�=�m��(�{��T��e�J〺�e�-ml��-&�δ�l!�w@��$���ۈ����;���U(�A���ii��͆�j�rW���vyec���8�s��pnN~�Gɐ���Q6,��kl�Ĳ�j����<�`��������^�t�\��(��E�Y�CZM��r-ݮ6_#}J���J9r.ײ{�yڞxQ�G����㴕�g���4u-X�+���=m�~p�=�+��EI�{:��H�:��KO�6�KE6��:�^Ss�����!�x�v�	Z�6)��ʷp��TG]���GS�N��F h�I��=�a-?��$^&S}%�dO���~�0~梣(��@�W��TD7� L�@�!/�0_q��gh�=�_O!������: ��7F~�N*�:_z�p>�cn2�ܿr���z��L��>-2�45Q�t���I���m������濇�<{N���{�f?,����v%,����Nͷ��`n�bUR�.|>N�S�Q����=���C\�8�J��W��#�'�{�ޞ�X�,UJ)�!�5�8l�0�|6�X��^�O+'~m����L�P�zmN��M�ISw�	,.GT6�����zd��������ߔo׫���H����v65�9I��OA��7|�8ъ���S���F䁈ie�Hs$((�<����H���aQ3�w5�&O�#
�9H����>I��^���<�P�t|	�ۏ����2�v�Mi/��:��]gm�jF���%Hꠄ�&]�Am��Ķ�ã@K��7��h�J��ʺ�r��W�qSsauA��0�!�oBr�X{����uRUvɒ4((�E*7p$����u\�8N���餯=���� �)�'Q]������Ό�Cb	՛�y>E�rY�����j��*i�(W#G�{��ܒ�f��~D�(�x3�©��+���� K\��l�^�_BHW]�f~�4zmL9�O$��\U�a�7�^PJ�)�9�s;x$��yAu5>*\g�
��r���[ASOF"R] �Dv_����l?�w�Ħ�̻:��z���͑����*���kde�    �L|Ɉ�����u�o�j����:őTp)a��wT<�*j��	[�(�0}��k��.��{i�l��5�-J)[e�`w�o6��G���>�l����MY:�R����t�t%�ovg��2x@�i�W���F����=֧G���"mKB���K?�+�#�W�B^ a�_�"0���W��W=ԥ�2K��í�Y��E��:�,`�����Qvz:��}�`@��i�v�F�)Z>W�N�*>��M��7��ٍ'�nA4�x���'�*b���X�����e7��O����m�Ì���t<gڋg��W�L��ż�l�:.4�d���QM5.�@����h	��i�V�#z��g8EV�"��v�+��/�a*��/��tC`t��Sg����
�C�ĭ}��йB�I�h=�g�;�ɨ/�r�	�M����{:JC�f�S�P�wT� �W=��z���<��B���7�(!N���.6ٺT{i��f<��ԙ�jF�㚹�x�?x����P#�SI��B���MQZ� YrG����g�rR�W�v��z�j�:}�-���v*�X�q��Ъİ�W{=QgG9�ԞK|��R*U�M� �bvP7�j����8�V�?NG�T,��(%�!�6^��I�v���|�����[.�_ J��/��{=��G�l s[eRTT�P��i����k�'�
4F�u$�&/~^�l:�Jk�Ƀ����Ñ3����f
����c9K�P�G����[�T5�����j�mz��^�l����o����Q��ic����8#[�x�-���o��ޘ`�����9�������ߊ˼��MH�݇����z�@���{�-�Nk;�,���m�O��Q��ӆ#34�����[��C�!�KO�s�໏��yށ�j��>�4t�.XG>���v��5��o6��r�ތ��9W���܆D�|R�[��T�0l\gw��=Cs���b>�|`�׫�
S'RB�Sn����iR�U��q��F�st���(�,�#����/cꬑ�b��@:�i��sQO�>�<�L�0uI��Hg>U�Ck�qP�.��!̲�h�N���/!���>���mt���w���C���Q��޺���tC����Ԇ���i��q�B���Ɠz��}�u�*��Vq�_��WL7�G��#e����U~�2}��JP؊g�
5v�-�6�Xu|��$�Hz���������٧�,g~��.ه_Cl��a���Ya��^!���Q��=TkW䛷m����$G.�5䭻$�/'�z%�d/η��χ����sp����|�5�l|��ɵF1rtq�U���{2�PH�m�h���lJ�{�u��l�P2e��?�����4��[�F;�8��KB��������ƞe�x�vr����q��i�� ���ATO)}���n��|m��3�{�~=�`�uZdQW�� ��fE6KL���[|^������U�ϜK�ӯ�z����p��U���@TO��҄��r\�V����.36�-�|`�[���b�^N���&���=�Oﱩ=���� (���&���>o��#�}{)آ��1p��i�՜�%������l�4��/��\(��|\'Ml�E�H�F$=��s�	:f��w����WN���udH�9�hKz�Y4N���'f�@��řM3Y�
�t�S�Bs�""��76Ͷf�#���N��>]�P$9��e���;Ḝ����0�g�מ3Vp�(Z�3��bHzޅ^�.��ŝO��.6���iё0���K6A�~��7�5θ@@׋�	��3X�j�6�?1U�۽d����I+u�����%x����	k����}Ҍ��1��!r��n��T���U¦��`�
��(�����z9M�+�oב6���q�p�HA�]�э�5���.eM�� 9�RZ�h��ˑpG���,GZ���Wߞ�{{���ɷ�E+xR�(8�>���I����-�MM�l�3x�P��:�J�=99Ꮴ>����� �?	�o᫨$�2>�1	��6���\�GՅ���y��oo��H<�1<��0W2ٲL���ab72�c�dbEK{buD���=a|tHIY����53M�N�\�<��d4!�q�+�?���}9�]��Wx"�N��/�w
���9��|1K�b�����S��G6'U�m��ȝQ��h~dfڽ�}�+�����-.�l����fQ�OjCPp�L��tеt�<�̙f�k
75��XP��-#��+Cn��G�D�Ə̐>����<���$J��\Nt�(V.=�yP��P�濄�8wW�s0��
�r'v�Q�ѣ���}r�	��8�C�����(�r�N�;�cMs���J��:�?�fG��$��]x��v(�"�?�}���}�N�c�A��L��@t�d��қ�z|^����)>N���	޸���}Ҍ�o�^SyfU���t68'�5�}�)�!\�\9O�̾\� �5��;�+���ң���ϥ�d���ϧ��l�@:����.[�tm�v�cfO��	X*)M>8ld����UUd$C�}�_�s��<0B/h��9� s�[�N�r���|��(������:r���<΅G�-ކ/�mD|XЎ#@�h���[�nt�?�� j�HMF\��\���I2��|u;K�5v�&6��gp*F��X� A��h�x��(Y���\�)'[�c�,������W_�Y���y�oUbk�V��$"�KZ>1}_�T�	(H) ��p��H��>��\O�?��Y!�F~�Qͦ����h�����Y&ѝ�"�31�E�h��,3�)��-���`8�#MY�ù}ܬ�)"]�6����FǗ[�M������k�ݨ�o�q~��ս3�1�e.�5u�w��c���?BC�`r�|����␈��h�6�tK�O �
n�p2s�(ʮ�ՄՑJj7h�̙�#;Wm���j�
y�د���3�x�۶���,q;\r���%/�	Od�>N?0���<s���B;�� �uݳh7���lF���kd^�����-q>6�L8���	�%WK��]o�9B�H��"Q���g��M�T�}X�p�E݊۶�����xO<;�J�"�v�čǍ�}QD[��o��v� +�F�5))�+HI�hz�D�(�%x]`Ѷ�ř�Γ�i�*�}D��OY�:����G�䯜o�[:yE���.���Cj`�����p�0��m%G6��A�N�s��[8���Ƹ��	9,�S|u�'���Nb��Q/'�w5)mۊ�ִ&|��Rۂ9���\hj~��u�b��8k�
��h���{�)�J��`X�eZy�83��/mc��>�8�c���כ	�=U���8�#Bi��6�����W�bxE?x#��s��rby���k��G{���t��?o{��ht
�`���Fkp��?�L2'H'
i.k�Ĉ�:~�D�:#B���Q�P�K����<w��~ۮm���S��&5�>@�v����*1�������G$��xv���3m\��HF�Z�մ��.��9(�C��S����,#Dm=���$��$�92t#i�\�������T�5;�^4�����=>� r�m��R���>��|�יX���+bb���%�T�;��w(����Ŝ=�u�j�NS�g�z�z���$�*8TF�&qn��0bZ��_+I]��8�2��2m��������Co�`s^�x�a`�P�mX`�M��O�b$�k��p�޾�8�.f��!��4�AW���T���,�
\.�!�����QI�Q3_*�)�]-k�������Ώ3�_	~F\>z>���@s_�i�o��b�MWPyp�#�ſ���O��v)�5~E(Ek���a�ü�ܑ��A���T�YJ�ӆ7�C���-:�w#s��J=�:�P;-�2�.�;YQ�|�08���,�y���p��E=�k)g;m��!����df��U�
P:��#S�
�J4¼x[[/'�tU(�NG[r"��i)����`uΟҺmq2���M�K���KS]@���SK�J�NWr    Dd�yĘ�f���xq���O.`��8��Z1�J��?���{�՘p�#L�~r)�Ff�',:��u���L4_`�:8ٶ��XDa��r�C���D�r��d�8���)J���̹�y"�R��u��4f�N��������R}U�˓\��e
Ē�@R���A��C�|���1�+�	�ș�S*?�.�ϮNG�r��r�r/�ČB�P�v��gD_�K�K%�Y�4虜gx�jU��t�P7lcWPl!��C�z�ZHۻ��8�3�G���,��;�+���M�C0��O{�����n�<ė��L-ܾ@��*|����{w1r���j����c6v��eH�>n�՗l*���7J��ڥf���
,4���/�+���	W��3�R]�&��X�\����'I����	|e�h��:�����nIJ���
����B$��/\�ժۮ�1�m��8�6Mf��olj�.x�-{ɀ��\�E�y�GU���˩�]Y�ns9C���t��ġ�/�$!�'�$:��5����Ե}���u�m�@]o=�ݧ�ʧb�o������=����tq)�f?�9 k�*����-4��f�F�*�Ub�ҳr�[u�%qA�J���w���<؅B�3�P-*��4|���U"��=�q�����㙓w&��I!h�'Âk����xم.U�^˅�55��fų��R=��D[�U�X�VJ:B���\�2�-'o��oQ;ɩ��M��cЩ�S�_\��g���[yD �&�� �g�J����a��o��Z&��g�J�u���\�:C�]��(��%I���<�ӱ��aj3{|��1�w�j2�1b�B�zk�
��\ʑ���6r%j���K��%��J�A
�<���P����+�Ƥ�S�[���b�4�p,C�xu�kU����d��	��`6��0f�i�0"���߸O��PHZ8��HL>�4y��:�	�ڄT}��9h��;��&D)L5�֭y�����-Jet�5^�!*xF{>��������8�P�ft��Ə��$������jt��^�6Q��-��7gFŃ�����;�Mc�٫�b
Fg�����]m�Rdl߉���܃�S�#����$��!	̎�"?b������6�Pב6��Ӿ��^:i���S�\������������U�&��m�- � ������%
���]Ý��/�8�E�9H�}�}��~uL����hݑ�]`�����L�~FKs �7���� eX/�TNx5�6���8i�:}���H𺑄J���p��cX��ߝ��>�,0o��#�`Ȋ)4�?,����{'v��W�9�/FT�.����ު�V4���j%�w�_0ϸ�G���yƛ��?.z�`�5� :#-m~B|�D����|��5�&m1f#�%3o;�d=��x��)'�u%ѳ�=�ZW��ɲ"W�ڵ�����;�D*e���֭��T[��֠�����"L�2	�%���}�Ê�K(_�Sԑ�"+���V��p�qTJ'���a�\yG#q�烼1o�(d�>8u���pk�]������6���� G:lv8 �_�1x^Ķ#�mr,��&����pI���-ɕa�G[���!f�|DrX?㬁u;�x�u`�D6� ��{�A25]�:���:���P��WM�kx��&���Y-�#d�z:�Y��a�"=�!�!_��՛�x��X�9����@Q w8 W�<{dCq�b%f@"g�����@J�	B�V�v}	�1�������>��^Nz�0��� �9�ᇵ�W�	��4l�$�	%b�_�'q�&7�,�ƍr�cW��uS�� �<l�V�d_7�t�Yd+M\��+;�r�O\��W41BQ����:��h�����-F�Rs�It�/��j�m5��-��?��3��"k�f���(��\�m�3��d�
\�\��GF�*�##��H�\��#�xZcCA���F-T"�H�|/��_�:��R��I�"��G�W0��S�ą�R��*�w��d�.��ʸ�/��;�͸�ؙ��\aQLR~TH�K�)],]�0T�m_��w5[�R��z���J�Y�2ɞ����qNo��y^��t�s��PL�\��>:�dz��$2F��]�����y8�K���l��ZN5���]O�	���r��'��r�$0����X��Z6$Bׄ� |m�����t���gc�`�<��/)�E��i����}�I�6�A[�t��+m�����6�g,�(���+���d�P��L1��}Bڽ�H�n��m^ݚ���*��s���_p ���;\�JQ,Z�#�^̿'�
y�V�̵ş�L�v@�6D�y�K��bP�~(����a��_I<)$��5|����%|�J�`�P6�l�ae+T�	R3�iRm�("0�O���[w�M�D(N�*U����j��D�h|R���4#W6%*�챓�".h|Dķi�c�F偊�_��x5���H׆�|��Y�������/.����'\��=�����f�hX:
o��X�ݠ�?�3gR%�!�H��v1��x/,6�Q�"�r��F�Bz^'�%�љ���	�QN��j�ٮ6������d�c4m��F����m�!�5��lֹ���]��y'���~=���F9�ī�p{��|K"�S+f[ji�DG�sף$n�m(���BQ.z���+��M�� 0���)�p�M��X�f۸��� �����O [+�;�Ň� W���S�F���qL	���C�d]�W���M��(�Gq�f4��b�6;'gH��P6Zܡ���ȴ�q��м�|8��(m���#���'>��->�U��䌓h��q��UW�%\ �~/%t�a~y�S�v��0t��K��;�ُ�����S�EɜGG�H�N��-����_��ʦE�;��h=��"׉�����P����b����fb�f3�+�<���.V��b*���?���4��o�ʞ��lZ(�:�R\#ܠ���h��}�B[01��@�{�N�2x�y*��K�?���7?�6Zg��U�_�5h����n��Y �-� d�|r:��:���n����8gl��P�aT%u�!���h��.�
2oF/pjD�Q� �����Ps
5�v��r������,�D�j����sk�~!of�TfQ���x�|�I="fI�m7�T�h�����үG=u��dY���X9�M��DS\�C��H��'����-��!��5_�T׬��S?vM����Sd^\�)�di*�>�	mn�CxN�����;�ĕ�,�hb
�GǛ���8}�5�U�Շ54�r��M�j����?�s�&��2���ڮ�bѯY��d3������>�o#���kF9���H~,S٫�
����~�O�[,pW���"G���\��)����U�S��#��S�ha���
�E+il�@��_��c�p���Q�3�!�F͎��E��h�R��p�
 �d�V��v��V< #����Ƒ4���]b�;8�3O�USÅP�͸(*����49zkc2���gE#����Ȓ�ꔮ���u��V�S�cG�m���ڛt$J��}���\;9"��	�#����;�/	��:�=��`b1��r��{�������D��NL��˥��M�?���VUz�Z�����oL�9d�c�cD8$_W.ʷ���ž� *������;Wo�!���̨&�Z[;��ؘ�����v�M����]����N�U	"�*5��.��jRW�O��,s~���-d=4�0Y�����������s�`�y5���~�)�E�W�X9�h��>�U���*�<$=�2V�H�
�l�T����fG`hCW��4o�#P�{�٬��I0�6b��_��cU���w�ej�H�2���d����;�{�o .���O9�o�F\�œ.H���&���U=N������<����8���ڳb�3�ݒ��Í�v�_!��3�]��]�8���ii�s�y��6J�t�|�#�{����
݉/�LNg�̶��ru9n��PA�_N�M_x��`����t�����    ��b� �B���'`|	O�?��`�����p��Ri�u�$��랎��2�_�⭱��hsD��0�Yͳ`�v�� �Y�U��?�zh��}�	{��j�3�P 9�=��;.�s@U������갴jEِ���J��W�P�zP�,W8��Qu�e���� �y{��FS�2� ��R��7�~AE|��vS;o����+�P�p	1ze�ox [<��Q��qx٪�ٳ�S�3���A�v>��Δ�g���a��a'�Mp�<b`0$�3}��U ��@�I���0���-+����&> �32+ɍ��v.FD%H�h���'�J')�E6��#�bj�Ӿ[rI��pi��3�T��b�n� E��`���#V��D��y>S!�L�*<rA@���4ĎN�4���+��%�)!�c�*��,�H`���-��3�͜՘-!5����<O���B&���?A�vڱA�6�����O
,\�%!BQ�}5���V�1dL��E"*���Pı~����O�����b�H������E24(����K�w�rr���&p���K۝)��1{�U�]��e1P��z��3����,]�$�bW+���s��uvF�k��#���F�a�t��6rZIO��JY�d}�0+:�B���G��C�.IQ�6�ޱL�5:!E���<R��~L�m�N��O���|TL�",א�|��>�O��حGę~��'2N� @�~&f�2�I*}������{ڣ���3 x�Vy�_x4}��a��P_ڰ�o������7�~���8�������6_�lxO+�1��Q���)8!��m��9�Q���t����zL��4��H}Q�(�H��H5@o��v���ɵ�6vt�i�m6q���QQ�x��/z����87<b�S��͛x���7���e��%���j�xHr�p5�� ����8����IWP�q�A��?Fj�������#S{ 1��s1�H8j	���l���adx��&�oa��e���H��V��3���)[��ٓu�H���ؘ����u4����C6�[�B�.
=�/���7�5���h��:;MV9�fC�?P��;�3�g :���Jv>N���(�u���9&4��v-b�e�V"� >�'�	_���dW���w	�&�=�J���`*��~����v�\%��3��t���N[s����c��?]g&���u%�Ţ��D3���d;�#���ٞJf��s(t��J�~��6��	���z�Ht��y#�����4�t<��=d`������@4��H�"5II�׍��㯦�M�<�J�2w��;��Ő�6<��͜,�71�5�OCyC6�chQ�[T:�qdO��)�1!���g_�̤����u��D�7p��k��,,*��}4�˜0�˴!Y���;s)!(�ϴ�$j�65���Ar=�_O�8�m�]�����	:���H�{��,�V"��/���krZ�r'�[����QN(�+��%��ٓh�e��i�>0��)R��_s��+e=3��Ω�����tx�c7����3�-A���4#E�$���#���#�~s�G/'r}=辮�=:��	�!a.�7d��a�������;�����v�#�=��p�H������w�?���'�2���B�Ұ<���!�Ѓݙ�Tj��
#w1�*o��a]��î�e�[G)'E��jȟ�����Ë�iwU�/o{��Q�W�'���r���	���oT7[��a2���ھ��c��MCp�hR�����$�M>�w0]�����I$�47���<�W�Ֆ��Ƃ�[���jB�1N�!�v��s��(e5��h��U5���V�2�5�i�HNu�MCJ�c�(S��0R6�L2r�o��ч���x�3b 	�-��r�%}�f�� ߇�g*i����b�HC�W�3_�'�$�k7$HF~O�ZN��������1/H��u$�ߊ*���CdC�>�d,�"w�X}1��g������4!���gnT�Q� �>�<�=p��t�E�Yp�||p����-OV����x��L:F���e�Y9A�����m�>\�g��@�,���!�L�t�+��79�������Ѷ	~5q_��*M��3��е����ڃ'y�l�IE"�+�y"�R���&虚�-�ךĂ$}�@��#����}�t��z�C�.���LQ1.�<��P��y�cC<)
�1<��)Q��s/$�β��,���)^O�+u;Kss{:�A3W�0����1���M��\vL*'����7I�Ȭ&|^ߕ�^K�g�i�x�d��Meʊ�&8g	&6~5D��y&gv}x��r%t����0@���Hr�:�\���%����?FM6)�!��]����wH��<�h��Ը��7�)@_�Р���N��T��Auuf�?��vr��!�A�X������}��K%�yo�W��dCu�v�Rq�a:�8GXD�] ���mE���
��ŀ��"kj�W��4�I=�t����Tw�'�=��A��S �#~��ت���o�����EGP�����ހ�=�������S���Pvs�a���!���$�1R�Ѫ�Q����h�����{0�Z��T"��'0�(ܽ�#�׳HC��iF�wz�Pp%�_��?K��T>y-u|F�w�3�hC��%O����Cx�\/��|�*��r����4 5N��O�}����i���&3�K�@?eу�3H�(�*�G㹢���M]� ���F����itj3+���1�&�Ѥ�./�)f��h9��kY�5�����;�cS����qf/c�F^�<������M�A�P�;gi?��h�g���ės 񯮛�ۚ��CF������,��'��H{�mۺ�=0�9������%J�J���y�N� �`C,�;��@�h�8�D�ޕ��M�����䲱���ȟV����>�,DB�Z�l�b��aF�x|�o����-}P��~�(/nc� ����u�M�k�����Gq���Tk����F��ٮ3�nO3�B����%�@�G�Z�+���7,�D����J�S={ԃ����-�GjͿ�rn��)U�}v!���4�)=!�ŀ�����]|(W��#�夠;�}MH�t��	����40O}Y�^��ӧ���r����q�S����ް�K%P��oO��D�w�kQ:���j5��ڂ��W�|�����C������i�~����)��}5䤕f�(��$d��>��ᴜ�K�>:խU E��8l����"��/����2���D#d�}ӗ*���O��#һ@��/r�z�v���7��s�Fu�AN�]�N(OyY�U�B���5g�܊��=V�Q�6��ʎ{�������+f�R,�>uS^��T�J��ׅw���Ȇrj��fj\��NO[�/;S��}N�px�cL���5��q��Y��ÙF.5V���\�YL�f㮶\������_�_�C/P�+��a���ܥ� ���$s��*ᨱ�o��[��!��!�X��s3��t��
�g�`�9���M�����H�R	'�Q���O��ā>�d�˸�3�_Np���E�=sl,�4�Q�w2}4�_ �4�"K�jDxu����0kVZ	�o���t<��7j�=��C�J6��ф��xH4[M[
ȕ�K'��t��,Ä�ޤ��z�E2��/+���H�w������t�"qB���WJR#�夠��ɀ�}f{ȧ�?ρ�v�U�c��"ۜ�'HvtZ�f�yȬ6vtqZl܊O���a����-���c��8R�[j[�8f�����h�`ޣ��\��OEgK죍F�y��a9��+i�AV�s7�^����[���T�Ƙs���д��o��e/�'����������DL��r�*���-h/H�y�n���Ӥ�+�M���r�G9�A8��q� 7�,<���h�fA���>D���lW�i�I�����CZ׫���Dn;�3g�-����qq�"*"�&v�l"���#J1���8Ab��C�C˂%��r��W���գOӐB�G�    =�",G�����r�+��ׂ�{@��:Z�Ł��p:��$�@t<�7U��$��jb�z�
��hG�ٔ�(؊�A�f��o%���O�2����&n��6xtأ=~Z2�s��+��?���w��62�~} �l�K~�*6���TS%T�4��5������:�+{�Q/,o����o�C�8����u=�$�F>n^��{-]I��C�naH$�Z�1p��:r��Id"���;��&���0�>T*s���T�{Hɾ�)�
�|}�З��o��A�Sb�Y��(ZZ�J%�}Z0pB���^��7���A���鷺 ���hmF3�������C�2
��pBX�����<D9M�|����Iѭ�����_���F��9\W?����eu�;�rz�W��ƀcϾWj�`����'���/�o�)����ݢ~MI�����~d��2�� [��H ��I)�~��E�g$�?��;1��_��(U�3��T]p]�C��ǂ'��a�p�|;�W��!���i&��(D��?���y�;��)e�m���m�����;=qxw��If�o�8��� ��E,�dN���;$�Cw]7���k��u�ܰ���qy o/�`q�d����:��wߒ�I
�Ix�L�p����u�����j��J�WXd�o�h�8�,�3��w�J�7���Ş\߭l���7-3�r�;۫��M���K�'V��q�N�QM�X#���I#�H�����+dC�R9�5Ȏ�՗;���N���48~"�*��$IwvP-'{=y���V��쉡H6�^T�Dj��K��p����2������
*��=܅���1��ʫ�2�J�i��њ�_F8M�����1
U��'j4ab��%��!��e��J���ؽ����/��&G~c�'�{����a����Ii-pb���3�+�-~&��%����,mU:�W�����{��2w�Y�'�-�h���[�ewR}�
cD�2���X���&�d1�7q8Ůzf���3|�d�ǧ,��Z�C��#b=��M�V�+��/-���#֗f���&���A�;�t˿%紥�?䓼K���%}\SX>����gA���L�S�h��� -]C��5�gY�� ���=[�}ib+V��r�͟���?��9��Ϲ���2���j���S��i�'�6�b\��sXe�˷��|�`&T��x��x4Q�7��O�#�2���U8�N�t�j��-S�w���t竌�[+�l���~��%�Wi�uE��-�x��������X��%����������L���;�D��w2y^		(5�;9��?�)-S���P�J'}�.�/�ׄFәg�[έ��\d�q[E����#F�F��$�q�/$��*x>K�[��'��}5��F��jÃx�]���ˉJW�p�%����%n�w�oE�u�?����LWU��/ȭ��ܵ7�h(�8��b
��Ͻ49a��B')ZDf.��ө�TT�6~���#wݢ��Rt��z{!-'�"*�A:��L���[܉�{i��,^Nm��8�غ�o��D�㗫�s�v�o|h�N�Q]4����3��\����,���x�0���u�R�l~R���o'�UR�'eq��Gf:>e�_*��T~[G����7G��:���3.h��u#y�ۥ�yQ
x-l���6��q��H�k�|
�rYĐ]�ϋX�C��,��c�C<�ՙ6� �Z�u��)
�d}H��w_�N��2�5�Vs���D�׈����X�NWL�kN׆��b���">�6m�c�h6��1R ד��DY����%d5�����P<:��)�l�(߾c���$��4�,�p���9}�HҴ�`+��	~0x�]��y�.����)-��Yr�f�XG���I�R����2$���tB�a%1��E���j��YHU�ͺ���(�3��yZ3����,�Y��)n&�W�'�A�BB�d|�tF�K���:��3�ښ��S��\�{{�=�@�-X\�7�  o�Y|�����/��'�Sg>�R���ĉ��oK20m�E�K��q�wQ¨��������F4x��'�����7ɬ��)�Ez������+6mk��t�"x���ln�
d���L�mpH����e��<vs$b�^K9��b]u��o�<�3ωco��dn�~c��)�J��������3����Cs�)�����Nj�NS�+�MVԼ=��{�5�3:&\j���X)��5�D,�Ï�9�14�/!��qӛD�%\GN����g�A�W�3�T�t5ڋF����ΉTpJ���FT�ȏ��`�Q���0L����o��/�rF�k��'�	�bV%Uc��$�:���j���ͱ�.�QvZ"��>��K�
�[Nb�����j?�/{�V9����m�Hہ�2� �uT������o�ޓ!$�i-_o���+��ƪ;B��꩛�˯V��m{8��6 Y+ܔ!�)I|�K�P����Ooyٔ�P����7o�	N\G��Zͯ����jC|��<���B�ㄡ#��m���8�m'���H�S�Tv�OtVF|nH���Q_�k�i��=(��LJ��Ӿ�r�j��1C���o2�Gf}V9a���u�ѬO��S� K ����լ�ִ�jS׵���5́���,�i��;�[Sna��W���Ax=@���i�̩�r���6{��w��;�R��	����)�0��9e3���"ܞ7��ʉO_�c�8�^gA��I�P[���Z	~��O��U��V�"d���r(t!�_���9<d<KAZ÷�""�N;�+5e�^�*�b�I~_H�ۂk�'{5���Z�l3�Sr_ H��-|�SO���8b��p�w����Z��e��b�{�Lm��u3[s�iA?&[+�k#�N���S�C��-�t;��Q��B�3���u�F��� ��`��;�G<�څS';��n��}�j�UMA����.��.ٝ=�u���U<F�<��1��73ާ����Pֵ��Ł��ރT ��l��,\������Ap��S\,\�pF9�d&c/&���������-��9�Ԗ��$@��y���2�ώ%�����qX��wP�al�`���Y�b��~�
ݔ�X1��M�C)�_����8e�g-���y�����jHB��3�ܕ0[�ֳ��P�	'4\�q��]��p��o��CR"4!u%��h�4�#�B���%ܤX���=��_��'��߻�o�i�d8�+u;	�����Q>v=��M���M��®D*u�S����t�l3���27��T=C�����l�F"|"�L��)\S��	�Ѫ�R�E�X.��i����%�p"t$B��Y�S|.�|V4���ŞJ|��ptX��Ox�u;0S�m[��E��I=��9Җ�%ˊ��X�"�U���9�3Ϧ����vymϊ�qOko�L���W�`U����J=G[W௬r�W�F굴�ԁk�:����,�M޾�C��Z,�s�����\���$���}�sS�֔St�^����v븻�k���ؙ�r>GQY,�d?S�����Rn�s�����\KE�aM����"Rb�k?�M�sb�x����o�^$����,/.|�ې�����b	]�^�������ޔ�u�]���cf�ER��2˥��|�jRОvo;�=EJމ�n_@����4R�-�~QK����ZrXPN/�jF&|m�L6�N�;�.26�c��f�ד��޼�Xj=�����S�G'��N�|���ғ�v�c�#��g?�L�3Ȼ���R���&��64י,R��0N�]���X1LL�g�B���@＝l���e�V9�ӫ���M3�����nq�O��&<���I�	{�4h	�2��� �[�*�ӯ_3�P�.�<ٞ7t�"�����]J����<Qib�ć�L��Ir^[ujB����9���SD�mLu5�G�՜B(XynÈޕo+�g�*���9mm���� ����e�L�b�|�lD�Ǝ$׮2y�~��N?#��m ��1�9���F�G*2}%��zNr�fG{��hΈ�%�s���+`p���    �ˢ8F_�G�նܽe�2��`�Y�J��rR�WU�ͮ�<�NrO�x}Z�W	�1n���?og&�q;��iz9��kj��^_�����zA��E�N>#�Г�@'v�!�p6g"��^���&�=C�?�+�x3ۙ��S�RA�V#�9٤H,c�nQ����Cb�.��TɤR%�~~-Sסb�	&�M�H�*��o�y�(�L{�4-��
�(���ӹ�D�5��<��Gg��`�ftKǠ��ۆ�Н5G'3<{�Úw�+�d~_���t<��*�y%S7c���<�E0ͼ��p�ߩ�;C����3�-�y$�N�6b��Z�L�?񙸕�3�I��<7�,'yUS����{(��T������#=2�%HQ ������\˦U [���"�9���sl���qMSZb��y3;�f<C*c����Z����>B��O閺c���rO�*Y�"�26���^��y6J�1w�M�l�M]�Q�ĄW:I�㢉������_���Ի�ү�$��U��F�>[��ͳ�'N6c�����2�����4ās��@n�=�׭HuZSS���e&Df����DN^zjTU����+����r�]�[N�<8�������R��>AI�Rq1���PC��s��ϸ�6��	��d���p�(9:*c��Z^l"��i�����q�m���/��Dɤ#��xG���e�(YU���F65��"�4�j�D?8l�ON�"8Tn�&UQܮ��ϙKu���0hH0��?Ϧ<Y,�x u3����g#:#s��ۙ�Zy��#�6>=Cmx�<�/�[�N���ʗ��_Yj˄�[tH�;l�0�-t��PҼA�r�{����m�`j��QuIKG4��ޢ�����ζ�\/רC8��Y��>Stk#Q?���/x϶�\�EHb��)w<��e�K5E�v���OA��at4|
��'F������?��Z�fk��/	��n�"�f>������6q�)�f�����w��AH�W{�,S]�V�"Yms�:+j���ʉ�^O�|
B-��Ơ<5;(\���Vʰ�H#A",W�G�"�qya�r˩�R���(��fS�Sg��z�Z/�s�@���%7��a�m�Y���;���!����sAD�������K�H����F�{�0���vh:$�Tl�!%�b�Hgt�`S{L2-�C�� �DZ	��k�.��9�Gkn����c��s����k\�6MC�}>B����:��X��u�=bQDؿ�D���|W8ޠ�S�8�4.��O��%����LS�x��#WF
�M�Y�Q��}�[�WBeƦ���Mɹ�h������.���&�iZ��8u�TZy#� ~��2����j���/�e�-�!Vp#3;�HTi��ߟ�]gF�B�{Pk�Y /�|U^��*'͚���h�z�[7��5��~����O!k��'����ws �Z()N�����g���/�/�J�㯅��4;��aO���p3�U@�Ζۓ��q��.�����V}S�˕�%�����5ǔ�+���ȩ���h�=|�C��/�=c�lޚ���@�K����Z6w�7�gJX��&*�Tf!Jc\�.��_���1{�7�gC�N���x�b.?�F�ND��=qius�a��Ǯ	o5���́�v��Q��v!�Eߩ��N�︫�
�5�u�t	����z���T:l<(�����+���
N����+t������5TD?�Y�۴�sF�*.�������#�zE�� i������鿟������	���ӈx�ʮc�����.�e��n��uRE� nI� �u×����7�=�`aJf�����#�(��bC��#(U�%Y�� 8X��iJ0������sp��<�� �ҴҼk�����:�?_�|B�^�=S%�K�K�9{��%���}w�Qp�)UR�&
�ON7��`�D�qx���ǀXFI-��Ġ��+Ur5vEPM��D/��Vj��&5��'M�!v �֧ؑB��{����_O�L�p�����÷:ڣ3Y:e�ȳ֨ ����isJ�den��%����� 
��j���/�}���w
�P�Q뙊���v8�|���)+���� ���K�b��2C�j��5';�_O��1�E�u�tV�m��n�k�p_��儆��Dv4�7�A��S� ���zsYL(���GL��uW[M�+f���|�k����L@r��?�7��t'p��hQ�2���B�J���|�O��u��ʖ���w{8��l�^���r�YmK�*�_�3����e��e�T���Ŋ����<CC��R��;F���=܆�are��MD���$B;%`\I>��<{�̣)UM_W)�2��7��F����Y'G��B�­��)���R9���)�ZH%u'�.��^z"�S�V��2xA�:j�[���[�2��6	��G���������'�	��r��KU�� �B�ݺu�Z�[�}��=�t�j��H�)�h��(R���>��-b�Sڇs��~��B����-���Ovm��@,�(͔�OV�<YmgӅ�����X�J2֎6�,0a������U z����/4�o�Gc�3��x\/�z<�[�/�͊Z�T�������!bO멳HWf�$�hS���!�1x筼ޭ�e���k��Xy��*��}=m�V���Z�[Gί�����@^�3��o-����ЕN�	l�	���� �gR���`�D��gJ�:��z���9���i��1�>,R|It6�&�Q�V�Eï�o�����|��J�� �ںƑ�рs �`!d�0`��I�g�X�8;�y�����߀_�ʩt_N�mh�$��F/�g�n:3�LT�a4O[�����.h���3�3���8��3�8�������f�	 ��L�r�w!{������v�A�;��r��x����m���o�Y��!Z	_%Ұ�C�_���%��$i�
� P�BxBĠ�nx���w.L��6���n�[.������:T<+��Ѓ��V^��I> �w1dĸߣ����!
�K�����4��8�^����d�]���S�`�×�h�7���O '[�����,:�#�����mQ�#�d���叟{
D1������7�>�����_���C9M�k��]m�~s0�[��7`��;�R���'�

�(�?����w>�x$� �v�Z�z�O4"?˲'��i��7|\��v�S�6_���^�sG���!�A@G�����lCM>9��x�F�ʃ�o�?�i�J#�z����8���f��_^��hhO@�:�oqXa����^������=,&��5��!��wԴ�O�Z���۱��`8����#P<=B6U�ф8��[���4�	M�3-\Q��Wی������sы:Aq;4-Э���+rN�z��ci�!�`w�f�  at��d�y�f=f{'��e�iL��\B�>#�f=s Ha�3z+d�A����l	�a�!�-��L��dh�
���ګĨtZ�QA����h.��T�U��ح�;�.T^s�UNx�ڸ�:m��AqU�p���)\��$�������F�������N�:�t�(8�Rl��'B���2��KÆqkZ���%hG��A���98D8����ߟO�(����]yj�4鿦g�@�� c�0(�&ko�ARJ�,(�6B�h��M�!�2&Bv�ћᏦڄ�lp��,�����T�풬��tzKWK��N����3E�s":*Bc��A��mq�R��7��5N|�&?ƿ��SN-���PO�-�^ʁ5�P�N]"x�\�jB�0����I�V�*n��0��]�ꚷ���IM؞��D:Ɨ ���%�~O�#���J��H�ꔳ�qu��ȁZ}����׈�@�8�M&OM���W�wv�ؑŎB�7A#�8��������	���I1�F��R�`Vjx��L�q=�-;�܋t6�2T�+���\!�h'm��}�ד��-��7�<��C�RKt��4,���)����h#��6�A|`���~k���	���cL���?���z�����(���Zԭ~�D�6���    9g�2ܑ��>�gT��s;��ͬأ����f��F�%��dF J�b"������'ɋ���Sί����h���Q�XE0���Hk�i�7#J�����lS%��&�._4����6Vpl�^ň�Y��.��I�I4�Mu'���,q��/����i�1�+����>�Q"t�j�r�.�}�`L�F�^��Tv�]a�5��3qX4�Y�7��*�F�����y���=Iɫ�Dҙ	���8� ��&גl��77V.q����kcܘ�1C �ui���O�+�	�b�UKY���U���\�N�"XԾV�a(�0�<��,W���u@Ϥ���.<�J���Lm8;s��{{�1"gW��Q;Ώ�F;�K�c�a�	��K��[�e|�>�ȡ����g�k&,�aoz����>Rt)�� �"'�S$��K�u������ݪD�^�'����� Y� X�;S&[E�z쿅���
Ӓ)�:Ħe��T�V�*��5��!��b��f��?��E��Vu�h��s���Q�N���N�l�*���C�.���l���L鎔���$8�K�E�8P��#}���%���X�H.����#�j8=���l��Sr�N�����:6O�ڷ&��	�T?hY��k*~Ѓ��@.6oe��L}������;a�d��?��%ʉ��|[_o^f���Cw�D+ŃDR�b2x���2<�J�.#��m^��R��l[M�WhخC`{��xW
�^�R���[��sM���J�ZIl��b�U�w�	��ywCU 5J�55�O� ¹�(��Q>�Z��~������q!Ab�8U��o�#���da��57�n�t$ \!͙��9ǧ��{RXB�"fR9���U�Ѡ�]R�ii��ݞfl�֍��:��V�1�<	���H)�2Ad��EF���Q�ƛ��`�΃���\�@1��6f����7r��-� �t.�eޠ���z%k�F�,�g�@��6;��~��A�p�Y�����~�����֠��ӔKITr��_�^�u��"����:c��}�0�"}�D��[�`2�S�}�kN�-�5�b��v����95q"�T�=%����M�-z4*n�~[�4�&�U����j��	��p���g�CWa��Q|Ǐ��z��E*|x�)�M��T�S���-A��7��b�T����3A�aSWX<E����������g�vU澡��V��u3��A�����l2^{O�v>�F��!Wӿ���d�FS�M6���M�d���mj��̳WK$u[���������+'�|��U�ʯ';��|�B�8WÒ|9[�KǦN�f�"F9ݔй�#$UpZ{��*U�+J�����`8��}#p��1f�H����
q����-�j����m]���ζFtn��,�f�ƾ�g��@f�>f���V6���: �+�9���,�+<�)/բ��˚��Jr=����ҰXAZE�I/�Q�b�n�Oj*GKĄ������?s���[�RU��`-�Md�s�jͳS�Va
>��G6�UC�2u�6؛��<�K27xާ[Dg��ǺT>&��<V,`� ��'�9��aK*�[��,��b�`��K��@�O�w�j�:�.2'��v�3��I��n�d���6�8T�c�71xI,���Ψ���L�W�֐���{�l���I���"�\#߄���wP�%d�Ő+�ZڮV��u���j8x���=v݅�
�#Ҏ	.pŷ��]��.��y��\4a�;��e�1o����
�������^�H����d�H�j���K�=���;���8����4���C�=d�S������ ��Կ�N@j]|,{��Ibn�Ԑ���,�I$>C�y�|=:8|��_�>�Й��R�D ��ڟB���$:_������3�'�˹�$��\P]�!_�;�M��tN�T3�f�`i�������i��忠����69��AY�N�H-�m��:�$g�z|�I(
�/�냓��sx����p-j<�#�o�g��s:�^%_�����ۧ3{���q�%}�f�nk��K&�T6z��,�E� 2��Λ�&��P��W�?�m�١q{���\7�c��]'���i.�Re���O4�}ۭp߂����筞���r:F+v�₋������i�|��,'v�V��r���%�厠�i}7',(To�f8R�gP�f�0��QU�wxB��ۛ�5|$c�%�EIN�R~_[ \ro=rV�.������AI,���2���,�=[���W��D[��'�p��+���;O7�ՃLw�C1t�mO�׉k��Ϝi{��f[����JZ����<��L����g��͐����UT�!)|�{�E
����F��`�#"�r��<�*�~�ٿb��4���̉�dLp��N�:ϡ%-���-+�[�Im�*^�?��Jr

�>���ĬJg��dְL9�fG4V�eQ%�d�8 f�5�*��B;�5�����\����ҒJ}�lK#���y�G2�*x�\X���yT7�ǳ��7	[�c_X{�B�I]M[���N����	�m��e2��g�3�`p��ƙy���|�W)��q>���s{���)d��9?%0PG�.�w�ED��[0k���@��`��!����R�b���d��Π�]���\y�Ca���R7�w�;�c����Xl�>E��j��	TC;A�1�b+����,��,���]X��W�$��UB���fp�΢��m�]O����o[��5�7h4���ݜ�(<�,'P�e�+��LR��n5���������H����V�a@������H%�k.r�G\=w����p��N�T�e]5K�Y��S0R5[�?��KL\x�`#8 ˺a��0	�Ӊ��7��b9:�����r�r�h��*k��C+����\/��U�!Ƽ�W���O��QSA�F�!F�ä�Q���u[�����\���B>\�����J�����.D/����xZ���)+.�]�B�^�~D�Q�J)�%o��(�b��?����VY�V�p�H���.��4Q1'"7��Mϙ��7!�
���H�J�E�3�H��ٔt\�fE|O��FK,ƈ%��d��'��$�S��c!�<6t@�V�D���ܔW�p:~���(�\�nS�؍�����������ˎլƻ����vQ��p޹m��!~�&=����k7/��2���� �8��?�f;�M 9ݽ�?�Xĭ�$��B#fL��0t��6
H3̼5�_^r�ijLobu��5T6���4��ɛyw��Nm$���l����A!�4���߾�.�s���������N�T=�ݰ�����ʞ���ÂZ=M�n��ï�!��,�"��IpxCsn,E�o-^6e���o)0\���ݬ����jj�Q���ų��߿�9��u#�
9��WC`߰�c��<���>+��m7K��Y���v��e4��1oh}(�_���Pk�������q$���+�M�B�aY���I��_�ݗE�/�5�©��v2�y�� �� ��~)�B-ڷ(�|PY�W!�/ �erڍ��x3����[&z��"RC/��B2��o�hh��~J	/��U}�;-(��;��l=�U\7I��f�9��|�����-�pav:s�p�)��E�c��B��cj��"'T �mUN@Q0ɨ臟��-�EqB�6�7zB�G��o��I�v�^���`<=���h����-��;z�n�)q���W����\��(�x�D�B%t�|ƛ ���)6�
%�W����9�&k�}kvr�xg�],��{m���c"V�j*�JGe�`�
j��kّ��A��K@X�d�v��T�s�a�*�V�/0��7X�Dz��m	9+��q�����si^3��{�0���Gv��s�i[=$���)W�u
T�!$?�F�����)�c`��I��K���rr�W��n75��G��
�]���8J�(~�#�c�6�۪�C3-���E�St�fQ�p>��{h���6ێ��2��㰡=�cF���P<�z�2����d��ͷ�.�    ���JT�K{0��P��jc�<B\3t��!a<��dh���tD&3�5y���ز���1�(w޵�n�V@R�a�f����t�ۼ"�+�mKh�r�Qv��S<'�����I�W\⫥�[��u�����;�u���>��GQ��T�*-��	uHN~E����`lY{	���,��eG��t�ǝ���hq�v3Ѧ�����w��`D���l�
HK�[Rwjy	���(��yv7K�\�$�����g����n��T,4q���B�"n�A��t�̬�OP��vW[��{g���L���R�.|���C/����Rri��=��Vl�R��ka�o�4U�����
���F4���:%�B�(Q_�u>�R����NS�g�{��k���ʽ��)��X0{���-�>�>F����v���YQF���$�D��������g���k}��;7�.���%�������o��%���~O}��	��r?�LOW�q��P�o�	�I{����l%]^0Ǜ�i�S��/���]�ueS:ݹ�ߦZg����JM3��d�<S�M�d�,�f ��u��j���aɸV-Zps�,����d�&\�;��6L6��3�s��$�S���W��o��Ŏ
.[��j~�(����`-EGw�Qg�2QS�B��cT���q�f�%��~g��%K�ԕ<[k?�L��@�3�?K55.F�����.�|���2+�v0,>9��%����9���(�������꘸������ɾ����g���{c9�������:}J7ۤc"�X�S�K���V�&��KH��i�헃#�<Rˆ
��a�|�o����*��.Yēʾ��d���Υ@�<�FhO�:3�����6%P�7�PѣZweZ��z b{=#���$��4���5�ǶVVs�vy�Yo%O����%��Z����]S��=���r�ʾ��<��*���G��G�o���U�b$�S��90��z�Tu~
���]�9.ȗ�n|C��C�f{�n�Q���FJ���-�����ߪ���υ�4G��8|(&/���|i�;��lV�$*y��(:�U>�*�/�T�?��׳-m����T4�ł�s��7)�'oD-ރ�6ˣ���{�9_��=͢�BF�~A�g�{�V!N(�v�
k�?��k��
ݾ�� �K��x���� ���}�']���}�Z�����E���r��C������s<�T7�{�A��M�y����c;W�Rb3�H�D0�pR`A�4����tOs���U��A4&�A�8��x
�	Ӄ�Y��B��0"�7jP��O�4��˸8}(ۇ1���[e������sJ3�vC�h�Y�f���^�@��mS���������g�+0���ڊ�eP����턦�<��f�iN����Z�[b>���=��0/;n*�%��mZ�J�K��Y'^΁�^�H���#��u�h��v�ǴPY+���l.�Ͼ[�%V�IA���%��)]�փ˶�f��Bwd�k鐉�J=���7|�����T��PA2�凢�	��X��I�v�tU�נX�/�~���z�qO;,�N�)�0M��Vs��ܷ�SP\U��Ӓ�YMV����PX���S�ґ��5��,�R���	�y*����e�:�4�K���9��)���3�Q�?�,���n�$(j��Qm���蟔gZ�"+A�r�h�tU{��	]fJ݌a��HE�$�.��~]<�gH��f�(�ӥL����CU���)&�u�"H�E�bʹE��[>'l�V�Oί����pt`�SG��hخ̗+ ���T��W%d��&�ذ���O�3�tq�:IEC�Z<�x:��V-�����(Ī)�a_��uY�Vh�O�`���Lb�ȭ�d������K~ ��_���'��O�ɔ1 ,J*�lT5�����Gx#���7��a��~o�c1<2��z��Ď��~�_;}��'�}6��ߙ�1�����iu*�g�fE߁�ݣv䈌E�p���#�$Z��]�$}�����̪c��I�!2%"V��Uy4^AC��FAx�?ݵmD�S�@�u�NP�SJ�xb+`�v'��{>.���
o�&|��qw����i~�e��&v�nB�����ފݦ>����G�<Xg0����43,�p��N�3���k�.�C���S�j�(�?[��kk(_����:�p�&���]�0��2�D˄��M��.��z:��"���Z(�+k�O��:�ˎn�['9�,�C�p�����$�'У��%��0�fx,�dÄ�0Γ�%0� �B߹��D#}*;�4o�Ka9��٫�>�����7���c+ �~*��&�}F���ڔ5C��.��1�������=���(��V��c���w����U�yF����fpy�]�tV��Ԅ��J�p�Ip�iO�z�)�%M<�d��h��I��>ISm��\X���wO�v��H�C�7tg�@'Նw��^�؊ᱍ�膵�('H2x�]S�<�i�yC��{"s����'v���3�8�����yĩ������s2���s�F�7D���j/����fn�|'�,/hN���K���rxs��;�DK��Bl�G�Z���ˮ�����Al՛!3���)�˷0C�������r����~� �h$y#���ރ<+a�B/Rx�L��3)~�1���T���Wȼ��Ǥk^֋��SKQ���|��E�V':��a���Őy��vT���0�9]�$�0l�k��c��x@v�aM;O���O��g��zv��|,�P�ġEY��إ
b�x(�d�� {����0<�+�8�u[�+��{�+���L����C%Hb��ɹ�i���Fp[�M���]9���B�Z���x�K�S�O��#K�[%M���'&�z�F~"�.�G!�?�]k�5�[Ku��5����mKx����ka�Vs�7T�ᔶ�4��KS�p���&��gRq~�
Y#_fB?ؠ�N9H�Y^3��r�h_�:;ͬy�y��a+��iO����Hu����~�X IG�B��94�RB}��쉰�)TjK�����+5nv_��tE�S��+l�e����i�BCR�����M��	���%PP��̄�B9t8�gϫy��V�?�O[J��!�n7�%g�n��H	.QJ>e��9�3���n@�!ɏxePMґ�!RK"�
a�eY����"�T���_e0�@��ܢ��g?_#Ϛ� �m�JO�:�e(������7�G7�pP����E�z��If��_���ϗ��_O�1��̨����em7��i��^��-�Y�����#ȝ�xd�?�MM���,�/�&6Q�P�`i��d+T:�l/j!	�-ў�8��>M׫݈U�?/���O��o�Z5m�j���pX-}\�W����8�Ϙ�qtG�y�,O銮�%����f/�2m�i?�<[A��]Ρ�Տl>O�(�$���k��1�������X��?pr�iv�w��l��j�o�:��N��@NY�wG��_g<�%S�}${EɹR�4��逽�f/�j��"$���Ϣ��@��#b������E�,�T��؞U@�pg�^=[���R���;��uI(E��9AwS���d�b�%�b7��U����d�kmc��7mں![(����{���v��3���[E���t�D�8E��l���Q_mN*pj�v4�k�h��y�xg��9�ȍ��C9�A���,�����H������FA�ߥ�C�Y��δR�N����ՋEn�qg2K��=�(%T�T���7vk:��G��K�H��	�'Ɲ�(ju_C�:$��=S �G�FBdqZ�>7��E�l�f[9D��D0��E�
����z�I���\����;M�3)>���r��8_��[%,v�#�|���G2Rˁ.�Ye�g��n(D��"}c���ߠ>]�;[��8͂�����֢�2�]@��8��7��􃗪�$&��O%qh)nF۱�θ�d�t�/_��B٭�ǅ�bP�EJ�/�m�<��)�+��^^�-3\�B��,��
�p���'�    h���y���;��\${����;Qx����afy�َr���%&�����4Le�@�9��ݵUFg�z��w@�������C�<�i�U|����{3xj���aY�A��$(��3��M$�����c��$h!V�qoN�z����r�Qݸ�#�W��DƓ>��������g�g����tU���+<Ρ`&ۜ�UU���JR�p������o���GB�7+�
.q�".����= ��.���Cp����p���w;x�C�A�p1�����SH���_��2�����ᶎM ���GX��Q�bXX�nO��7�Q	�#���ye���1�i��:�؆�'%��hJk+Y(Q�*3�QV�R��4��]���i��6�v��a|�7�p�TG"�t�ٟ���k �/Y"w;���(�@n��B#Y|O��RO#��9��n{<tP��Gm�I}.�#�q;����RV���'�C����2��d�k͹�`l�ǝ	�����j�W�y*�>�����6�����vm��'��<g��r�wʯ���N��_��v�Nwon6�}����:���vg�cA4h��4 �G��k���)4}]�M�P��m��R�+V`�S�?R�����Qu�T�ۅN�Z�N(B�NQh��u���V,��nSE�������ᓱ����i����<���^�cO�s�?�5���d=�}����^Y�|m!t���E)�9��m�B=�g��։���e����n�#86�T�lx�^�t<�5m��z�m\7��̗J=�k>/�%+V
]d2�(M�ك�R�?��fᓱ?��ݿ~�8�h\�wtmGj�2���Z;�h���"��}���ߡ�_˜�9���������14>�`�JL
��fkDa��,er����r����ˣf�1@��ץ�+�p9���V���>�,�p�=L𺚣߅�:� !�)*�&4l(�b����4�#�+�N�%������f�}Y0�������,:�?T����(���,��MI>���U�*�����wM7�)4�M��;�&[,�¼졪͂�^y��>]gɎ�'ʚ���M-�|��}6�7��nG{w�>tQ�ኚ�G]���V����9�m�ĸ�ϱg��&J_��?r���b�c+8Ӏ���m����|g��.a���>�I�覂%�E����!{�=��h�v�����S���Wj��s�v�Bx��Y?�蓛�������Ӹ_M�f�i$O�F��wc�E/V�J�g3�}R[����q��m�ע0�C�o���p�K��&E�!�I���)��]�P�r��.?D�߶�h�L���w�8���6����-�PNl2����r��o~1}A�{������^,��O�͆�G8(��³L��J�>?MDۆN�-��
�j��U��A�#��s6���lcW�vT��Çp��I�>M��:4����`W���#O�pS��}��>*_9�~p��%�Ѯ�A�Q 6
{H��X*���i��-7C���d��^湷C-�M3o���n��-��a��-Lj��s���D���)ǋ���fr�@�O�H�|�D�Y��F��x��7��U�g!����0�}�K5��E>O7$ą�t�Y�w�����S*���Ns���%�k#e(�Πf�R��9[�1��.u:8��8��� f��nݟ����֯�d:'ճ�"��:�t<��	�FD��Z+[�&�n[vxO���|{�jle��Kܥ������Y�_�c@%.�+~����,�P(	 D;O�C�}��S���E����|8N0�����9���"��KR��ê���R��S�EQmT뻿��y5O��sd�
]�o�����A0pNZ)\��ES�^�g�aak��PHAX �IU6,�x��*�� ��oη^��+��q܂��H#�~�$�ĭ$��.���w��?Jxt�|w���M2��4�Ʒ��i��ZujC�۞��T��~E}7졿S�F��+xb�_�kGx�?D�e����N�h�/��ǧ? '���ѩy�B������p^4����Z#�����������$�Cۖ���a��+�~�L펆�[)�*�[��I!G(j��u6 ���A���6
5�VT�qF�ݓj�K�?�,4���ƃ0�<x��mg[�KDH���𛘍���l��0��V.�K��2	�Y�z�Z���س9��z!�z���o����]��LլT�%Ad%W�e%D��q�t���C���K��8��tU��֞���H?|F��(l�.�I`?<�Y��P�k��1Zڞ$=c��2�5{���m�,iS,��apz�Rե��0\E�l�x�b�5��V�4�7R��&��s���"MYS�kX+Cg��$� q�Ԟ��'	�n:�}+�o�^��I���>�B��vs�~�<NtnǛ��ú���I������K�.��O=��u�ӈ4�X���!���q_ȱl�z�E��c��n]ZB�� f�h��ϫ?�C,���{{+���A4~E%z_��Ly|9ݍ��C�v�B�E�M�3dak�0>é]��zGH��r�ax��{����
�\�nY�s���;��fE�׵�얳A�G8G��K��t��zX�`q�g�����������'t����6������c>�7�>�z="Ҟ�V��o�]g�r����
�n�]��h����P���m�
���n�pFw�z"�[�Qâlj|o�� u����%j[5Jk��:����Q�y}�|�>�Os���6ݜ��KE���m�:oX0�eOBLs�OgӰZ��R?�0���$]wtݪ~���㟩e]gO��ş�2�|�?���υ��U��!�Ѱ'��Y�=�)4�w���U�W�I�~��݊�Z�e�?�QNw��/>�d�H?�J��ly�ؾ�QnFm��g���f�f|G��QG�bh�b�-�aI�F�!4=xBXK���d��ga�}�I%�����vTr'��4,�F\���^8,׎������J�.m�_Pw�U�U�mJJ�i������;��2��{�t<� �b9�>�Ȩ'݄��"�k�S�)^A�M��1��jkr١��N�]Ʒ�H�m��E�D�IF�@0�x����93��p�m��+�w��$$�7��\�m�L���Cg���P:��܍�^��DO�����ǥ�2�3��e&EN��c��y��n�O��	��ً}�km�Xɲ�?򪪛{�����q��P�jO�WH��<}�_��H�;��H�5,��6��}}��!q؉�>;L� ��R*]���c�bJ;�D��z�$���*#�ˎ7"����u�,�����I�#�r���7�����҅iT�0�f��F�;���g�u����~*����[C.���<�1�H�#&�(rN���]�nlɥ2��HD#�s�����r[��� �0�i�1��UD�<`�a����VJb
6D�]��:خ�r]��H;�l0���4���(F��t-�O��Q}5[i��ub@G<�~�^N������3p��ʒ)g������c���?�>��Mҏ�늵�e��()֞|�2y7Y<e�3fꎯ��^v�=�K9��!��� UN58�b����$�7�m�'�"������JP�C�k]<�8_���}/��ag�[�E�PaյΧ�S�q֝X��eG6 ���G��AR��)G]�l��W�~Ƽ�A˳�<���36E���h��Cr�F�x��'�7#�ݧ/�5��-�ޒ��ڐ"��s&胸��9�m��^����1�#:x}ΐ�1��e���"#�2��J,]� Ռ�d,��1�y�� �i]kfW�e�ŅJzȱ��-\m7��WM���}��nX$�;\��_�d��� ���`���lK�:?9d���l�hRE&@O�΁��d��8���A��ĝQ�뉢 &8
X�3�Uh�ˎ:���]8**��v�S�Y�T\Љ���<�-\��̊ʿ� ���a�#�Ņ�p�-�[�&�[*��&�    ���X5Z�YCn���e�����8��I8��&F�hk��q�H�r��m�N�Zd�Z3��PpfN���ЍB�7�B������k[a������OK��v��Y�?߫�][�?�!'�-�n_�	��Z���ځse3W�5��B�P�^�ʉE̦Р�Z���e�a��k;�q���kzD�]Y�m8��!?G��~( �V�JtL�p�7�5y�qd�8��0e����ݍk{���h|���k��#ǈd�):�j^��#�a�c�fZ}��� ��*��Y+t�B���$]��R�B<4gXƕ-�]�@�<���P�1��o�����\(J���76{6�ԥ_j���УH�!��wu!7�v�;5a�\Ys��N�W�i��gQ����m�`.��e1�i��
ŅF�x�I$hr�9�X�+��d��dێRt���&U�F�+���D�����{>
�_����{�ßa%�l�!��A��*��`��ү2��i���W��pG������l0��a�;y� ��=�kN��[�Y@�E ���ˡ�<�ښ!�D�������,q|8`�q4�NW\�qצp�"%��-������o!O<!��5��"�~.ؓ��"�q����q4����lJ����j D�ME��I��.! ���K�![)ҹ��c���}��A �2'��~�G�����i��x�
�PrηLP�3�VC��,�~<�����?��Ǔ��T�C�u�#�� �=y �`�3lO��"Ɋ�[I�}��uk���� s)�������g��}�aD���,�&��i�(| L��*�h �g6�K�l��FE�m0y��$$������3\I���L�����&�ɠqk��2U�79T��2߰^�i�����d�4|�W�h���U=��g�u�3��k���q����o{qt;ps`n�c0��"8>�ug���m��� �Q�ut��
>�g��ڎ���6f�X~6�'|*�ݿAVh��!{k��3��?��Ĉ�hړ5Q���3�>�2pe���g(�� ��Ϩ�D+��k�L"�����M?X���S������U��7���i��Q��7|o	o�C?\���oZ�Y{û,d]Wg�zÅ�1�b]�{�Ru�|�-y���?���ᯰ�L�M,��	\��	^�?��U�w���=R[f��p��O>��؊����`�@ך�,k��`�0F�� ׏b�o��ugx�������x��5TOv�}�*�[��Q�H���m8��{>�B�JLW[��\�ȟfQ|B2|�� �p�6j�*j
�$�g
�؆bs� ��d6�� �Χ�4�m��E&��@����W��"4�m�iA�y��:(�2�0)v��q�d�z��y �p�t��4��R�2&��D;����J��M���ξo�|�#��{�ƣQg��=��w��
��9|4,b�&]1З��xQ2�p~ph@WtD��@�v���qF�FblM�_H��s2��8P!�$�_$�\�yp��3vW%]z!�tm������f��P����&��)"5 ��1�u ���&�sG��QZ*X�u���b�
�	��?�G�y1~K�=l�f{#aK%��ee�;[��*t���޲)�4��{� �
tWe)wq75��ߡ֚�օ�������> �����^��V��ˤ���Յ� B7>?�ul�Q)�_G�-��ӊ$���~:&��~�?������g�x��[B���|,/�q_���A����r�Ψ�i�w��y-����>��ꆵ��i:���u '���Qh��*x ��h�:�n�O_W,kM5���+���F�-Q(���	Cl�h����?��ˬ�w��/(�NU�P*,]v�=t<�DĪKa��O�W*v���C>�ns�+�ٹ���XNUtsO���X��X����T��#:�`¦�l��!7�nCm��A���	��ǒ*G�,I��s�ʞ��SyC�%]+�:�x�k�ӵ��b��4�_\��[��v0=�	Ѓ���ĽN繆}���| �Ci��~�@y_%Q��BMu�K��#�D��\��k�hPCkw�C�j��*jƨ�ZUIJw����+᠚�,U��',�1���Dc�y�R�t��e㒱mjݰ�Xk�;l8<�� j����㐗�A?�?
�=������I�{|2��u�$Ie!����]T��i���~ $s�xIP5E�'�� Y�J�G�, �L��z�wxc���9tl��9{_�3��N̅�U������I-Y
�fTQ�"�j��K^��g���$<��-���,i%O�ؖ'�ڜ�Sm��ӳ�딆=G�]a������~�V꽉Եz&�7��6�n�1�X*i��9���>�bt�غ��zW�����&�8���IHk+j�v=k�A����d{�B�Y�ϸ�~5.T�=�N8������fD�f(��p�=�D�)��^����}���L����Zԃ�g��ϟ��'@���"��xA(�O�� O�Z�W��3�K�U��J��V�@��[š��}���2Nrؽ�'h�01a�<�u���TyL�ߌ�21#C)��|�._W�8��S1�q�t�1���s��E��G,�������yi?�BQB�+wD ���4Ԓ�u�T�8�����Ce������pJړ�v�;�T�R��R���MC�����l6��>Fp.n�q̫=��{�톬���:��`,խ	��t�0�t�9[/�~��%�_����:�R�:boiQ�~@^⸧���7�Atx�J������%C�?f+�C�D���F���\O�`q��QpUL����p��6J�PH-�mk�N�>2�#�Ig�}�־��N򋖳��u���j
{�����i��&/�D]y�>�U�dq����#[���HïÐ��
nIƜ��w�/��x�ٞ}F%y1��z<z������6z�AMBe�|(���6V�%�$��~K|���R��������o��s��{Fv1O��Ǥr��5�LZ�3�5K�KM	(���(e�A�1+/����>�Tl^���g�쎵x������F��K���t~]��"�Bu����OR�˷�Z�h#}t]'�zȵ�֝��T9e��%E�GU����*Q���c@�9'g�
�$_��X��ʡV�y~�:�D�1�������=kQ�M*�m1"A��p��$͖1���g�!�
�p���5$>$W��7��;B����oM�d2�l����=�gyf�*T�Ň��~�zQ��+l,-�+^�����,A(qOe���x�V���QI1\|�-j�g�S�D�@���f2����p\"[Y��=�#=��}�g��:���gC�B#�
}?FI���ʪR�*����lN!(��s��A�f�����I�<�l|��=�w�[a'�Dl܇��r;q8��
�G���?�N���eJ�)�]:��ծ�����J���w!��#�?>�Іv���F��ѤЍlw�+��E_��T�z�����Z�Ɛ���|6Ǭ*a�s�C��1D3%�0�7�?�o�Y{���n�EwC��kC� t��{�0ڃ[Gb����L��t�tGO�aOg��j���Ň:�x7���O��W����Fq����߫9^������#�*���we�&g�� ]�
��k=)�Kr��~��҇��;L/�+t��C�#=X�(%��s��}0/�<w'ԫ�0w�aG��!�B�C��N��P���8G.G;Y-��wq1���0J^��,YS��Z������x4c��/�8�T�u%���c�Rёe�ԿL��~������E1o*jĐ��.�M?y�9#c8�E�x^�yЅv��-���^�(\���IFB Xi�����֟��.
d���石G��h��"@���{�6(�|:�tC��`f�	�TW�5�W�49Ύ�c��Pwunh��0ߐ0�'�X�nND���;;���bM^G��(���~�PW����iEj��@�'���M������ht@1�    ���(ë��0�(ض(_Z�G7��ܝ�d�-�Vm��h�Y���-�5�sU������RlvhX+:Ps�R=�!�8g��xm!��&�x���x�B�{�U����:[Hn�0�1�Y�n�q�Z��3�v�w�}]����0>Ϊ25�8��Z�M�B�ΖT��I�~����NN?َ��F.?ޒ�Jv�Q�t�=�M��^-X�ܴ���	�/plq�zsæ����(d�YDn�qJW��+�t���W�o*Y�r��d��e��
��a��]aı�lC]r��{շ�j(ь���R��ې���I�k]�M���#�e�f{�;e/��P9�mNKd�c+�����%��5;�s�U.8�ZG���l��<ǽ��TGzy3�a��%<[3��v��c�F5�u�Mӧt+%}�>���ϸ�������l¹F��
@B���v����e% ��0�7��y�,_I���f�p\�:���E�))���i~����6~�>���I�٥/�D���d.�X>Mfq|ϿV@!�`P�܇�'�z]�ŶZ������0-[�H8�-�Z˵Ϭ��ir��%pV���D�>�0vV�n2Η�s9������L�@Թ�&����u�=е6�1����3�D�Ϫ!()�����Y::�0$�%(D��$���0뀖MWw��9���"q���$��4ԃև@~���J��C��N�P;>��2c��>����H���n>ϙf�ε&� }Z�<�2F����qob�vQ@��6\!�9t�wӹe[�m!xG�4�g��R��0���ZT4�qX��Mgl�{�a�������%*o_G�*U�DW��CZ=�m{����������(��daW�a�5� |���g�N
E��2��	�l��oh�ߤ�\k����n	!�F�	ѽ}��J ϫ��6x�8�(�Ey�B�j̺��t<,�>��
Gb�N���s�u��_4�q���ԯ������m�Z�tPW<�{|ԉY}Ǫ#H����x�	�"g��u�l�k	h�nq�oǱ��x�܉�wX�?�Z>�˓H_��C�P�}7����)�t����Jm�Z�\/�e��i����̂z�N����:��g�pԍ�.9I��򜵓��}�B�ݣ��B�Z����	��SbmX�
x	�=�p���G{�"����K��_DI�2נ)������q�	�#��_�A���!V�2o��@�\�IZ!�'2).�/��,e�-���;8�W
�CW��zd|p�Qp0��p�pT��n
��^��K���Pf�M�)���ܠR���>�';G��.�5���<k���9�N�}�th��"��}	흒������y�m;�7�ir�-�.Q֟�n�ј�:�/8����J�g�g��F���⃝1,s�k�y����q�n�>t��� =���#�'�X/���>P�Cyź_��Wu�+��M���v�[Dgp6�!�n:��mg�c��}>��/���i�[R R����!��ºW���:aD��y�U��ŏ�G�L]�!�oQ�dj���v_0�?����α��}ᤌ/ޓu=���[ 69�m�C�fqH�O�qM��2c�K�G����n��;��U�9���n�f-GctX��F�<��h�+u�����9&�F�]4�D�ϳ�i��i�,��&�������9 'p��
��@�;�(�;�{cx{إ@eDiڈ�����1$x�z�[7�B��bQ��(�� �(���G��ܸK�#j]�Y%+�c|$�~�M�Ť�Hq<�Do�r���������-.ձ/�(�J� T�8�<ǸRN:�g�6�񠳧�c��n�mÍ8g��m!�G�G��z=L^�n�<<ݽY�WY�]�J���0]����E�
sA<��ҩ���u�}˽�ɰ�����!E��x�n{���=�(�������<�� �c��0y#`�jt!Ag��� j�,Z!!<z��˺VF���d���̚l���T��%{̗���?G�{G��j�h9��6����Q��ŠRj��#�n�����V�ۑ�P��g�|7n�1����0{��u���A9)}���<�S�d<d7��yq��$���%ܯPmu&����
��!��s�WG��o&��3|�HD���8 ���K�Vj��q_��Θi�Ő��	���[e`����v�r�<V�}ߢ٢Z�{�̡��÷fo� A��ȧ�=�tݳ4�pS׆c�K2��2i�
��س|� �����¹�w�d+��ñ�o8K"�ɻBb����M�R�oۛvsZ!yI�5Pl��{�u�zd��Fz��{wՎ_�����
�7�+�`����㻔��K��~{���2ږ6�svǣٿ�p���F��+��1��PAz���H@�0�j3 ����m�WB1p�(���[����ao[%�=����{���$SBm�3�?P(�"F�0.�6�'R��ˏ��]DU���ij�R'�qt_�}�#MvE_�oTѲ.�4B��H���K��L�	���>����2�a@L,6��@F�26����3�4��3�/f6bP��X?��hS��6�����|#D���Hp���������j!ߛ�$<m:�J����}7���q��������H��6h�7����ge�#__�}m0��*h�B;���H&IW�&�&�5Y6�L��v_/i����Jp����c3�F�E(\Ѓ���|adt��U��\!�~�0�~�W��'L�d©Q�[A=.SCl�����6m���%x�SKh��	�Ts�d�nOR����#s���S[�ԓ�hf���LB�y�-�iQ�`-��	��m�H��:���p͚NG���M:Q8���l0���bG� Ҿ�����W�Rxw���+Y/ycq ��j߷�Z��f���Fa�3b�N<�~I�@{���jN|;�X��Jh�01���@�c��1e��VR�������hf�m�H�>��Gc���d����]��L��X-�"�>�9�b㻍�lrw��]u�#43����3e�0�Ƹ�h��Z�y���i�u$8�!<Ꮎ�Ģ��o3��jw�!Z����x�+��㸘�f�=�(�m��,? �b��O��WxI�WfO�d�u��.��E��G��w6��.�SAf���B/�TWu�s�P5ЃB
�yġe��9��H����~L��_%��hW��	����8��q��S����^�$�gZ<�
��a��KY��Gp�q���I$�Q�Ѭ-Q��5Njm]L�I܎�8���<5��@QA�^Q�h�u^y��*�]s�ԐR�%T��K�ZtI���������(���	t.V���ER1�1��$�JO�ql�[*����X�c�k5/�H�B`-��(ð�1Uۖ�"��(lͦbզ6r���+S��x��3h�is�+se���	1<�k�Mض�w�Hq(Y ͡UV�+�\B��>_�	�*�)6���7�4ZE�E�SԲ�+3�������B�b��y6W�˳]����q�0
=& 5ʑ2�ɜ.�=)u8%.� ��b^��nM�:r=�P��=fms���F�$���"�BD�e��|)�X���C��|�e�����ٖYo�����Z���;4�=T$r|B�ẵ��\gH����0$��"�ZS���m�j�|����v�a'�[�{*�J�Nez~�tH}6�0�UL�dD��p}&�P�X~�J���vt��;L�����@lN-*M��䞠
]і�+蝮�Մ:48ܥ�dH*�P ���y��D���OT�(���"ض�ԣM4r��ڔGCkO���}^^��Ui��n����K�[Lj+�>}�Yիˬ�SjK{����l�oyňr�t�Ď+ջ�]�E}�`x�_��nM��F��͐��h������\��I����M�e�ʫ;Cq�
Qk�#'(���JB������$D��֖�RL�����*v�̹���+�4�Շ����!�t� �F��7��Y4�k�΄{GY%ʽ�A?J�Bq>O���QQ��!P�$��~ב��+�=�<�����c&�ak�Pq�%��    	���(�i	�!�u&�}2�{��7��y�PVM}
>d�����PWM;��������hB(�5��"v��#4�t$c�WəpM��� ��X���u)@7I����k1e�'��
�JB� /�ە<=�T׬[�b�?9Tw�zÆ��յ�1EϢ�x8F�u	���jf�rJ�Q�"~I�D:��x�]C������2�rw�� Ta6ܞ8]'!n���|���c��`�M�������O�����0d䱋����^��\�&s�k�^}�H���g�3���:=��փ5X�����L���n6q{���i�ˏ�Z�aX�����"Ʒ�Z�j��6�m�_�Ѹ7�#���47A'�Q���FCԣ��6����Zm<�ц�[��-�XT�{�Kl�Ԩ��m����#ɟ�$�m"��4��E��
{ {������&?W#{��T�-J�ǆ�?��h@cU�XC��	�j��'����lo��R.�\�CF2�+&eD+gb}]�ߪ���:z=<h3�,]_#09�D''��E���-�
�<H�6	�P�[-&0\[�� [$H_�,�O9�51�2��a�泘�ޠ�%�
E�M;�
�4�/��ku�,��]��t�F~�����G��n�CEz�f�d���پ߯'7�а�K���~��-�X�E���7��H�e�������
�^'����_���);���s��64��P��٨K��qu�i����1�:�@��@�����IZ�A=$iC����a��HN���_��c�W/���m�H����V���8<3��ρ���"��H����,A`]Ը�CH=7%Tk�b>ϯ�Ք64�vC�i��W��&)"�	�.-��l�Kh�:V�.����E�h| c��p�]�o;�	���&a�qaw�x����!����{�^OT�{�!��M��� ���%�g}
����Z �<rNҹqα.���{ڄ��MD�^���Gt�%�+N��R��D����%u�7�����blw��^W�}-l��,�A�	���W@7T�.T�O^�/I�#p���p,��m���<��g�;�8ǈ��r�P��=���[tWzP�$Gg��u������ئ/�}��z3�F�b|��u$Ѻ]$��d,o���:�`B$��e����o�a5xr��"4B�@�W[���^��I�Q�Ç*�z�İ|�oH�
@ԑ/���ig�_�z�=ec�'O��D?����sJ���n�����V�E�j�HX/T�jr��&�3Z���ϵ��N`�s�kf�-A���4�������{X���\�˷d!�Jh}���D�Z��:���.�v�oC��qI���׃U}mSX�՗�v|ÿ>!�Aτ���L"x�C^���=����}�g�B,�e�!�V��~3��jw|�3�v>���$����L����,��(�ȩ��w���d�l�UG���sþ>���!2=�b�Gx;GP����j[��~H��)������F+6]�����/�"J��������o�#�5)��g��:T1�c���R�@$�=FLh&rPm�\`�J6�w��X���W!,4;T�,`a��1�1li��� 8�Y���w�k-���Pe�BԳ݃I>z53:�R����M�Py�le>��댸�u����d*ณ���B�!�;�s!��7�y���챀`Z�z�v�/��5qJ�"'J�nN�(w��Lꁩ����|���FEd�k��Y� l��U�M�u���3[Jy[�9��bM���Ys�ni���<��2@#�8RT�zb�z�^W�����i��Bd�4�'�qּAW`kw�G�a� �9���JvŁ���L$��R��O�^L�����#|;�sȱЏ8���T ����s��{Ҥ�bB��)c4Q��-�X�߅p
��-g��8=�>jk��A�yR���	�yĢNkܸ({hb��9�jEa�O�Qux�������FO�/��]�!N�0��q^+�(�b�kP�3iԷ��`c*Q[(s��g���"�@�D��J#��v�ӈqld���!�>n��=�ʱ�-U�lg?%��6���b�W+ҶeתH����A�EN��ډ� ���D�����iJ+]���.`���f:����,f�C�#&��,Q~�%�]�7����-���F%�� Y~��F*��J�gnN���I%�P�������'?;��u�'AW.(���~L��|��Y���gpd�	�?�j�@l�-J9n���"�ιM�Ӱ�t�lY؂�K���L��!���-��_�1"��)m7�x�)��;'M/�ش��s	���Dj�m�j��;"�N�ʰ���]*v��xv��6��?R���B���h����CT��#��'�J�Z�kJ���y�K꠬��/��תz�^���p�ڏp4��4.�5�ʢR;ō����[�_�:� y�^�Y�ۧY^R�=-.�臸�ۧZ���V]�T����R��W+%�W4��i��K
��E���tg��!�Hg~�U�4�u�~R�uV�;���@69��&01"� �.^'/�%� �:(z{�oXuo�K����x�iJ_P�]�ǃ�W���WQ�l���;S[ ��]R��}�И��[k:��	0�����	/�|XN.�RUX'
HR򼆤MC2�R_� E��Iҋ	��=��!#�,�|	�y˞�Th<�T���q����14�X���K����8�N�bbl	5i�fw�=��Ԣ�j�� r	 ��ٕ�ր�F�yLc�mk��)�@�N?	�g��;	\�ٞ"���)ɞ��@Jyw�������O�]L� #6c������jWmv�7�?��f��k�j�l��D�wj�ߍ���7q\��dET��1��C�~�����"~�:��t2�Ʉ)bx�せ��3�{Z���HeEB"�
s\��Wo��[Ncw:���g��ޮy����M��(u��}�Z����N�U��F���d]�:z-B	c��G^��7�ml�D��r�w��UgKB¨��5��=gK�gT����w��R���@�g؆z|�l�7���)�ꕋkdt��7���uƄߟ�-�&c�#�T<��q��p���t�y�D�
Yo<"l�ug��҆�UwT��4Zd���~�g���Δ�	�]�A4w�d��n� ���'�I��]dw�'����biIV:ޫB�~��F�L����ڮ�w��h�;�����Kq��٧�b�?2��䛷t�@�B�߫9�
|A�1�y��|�Z���ֆ�0z{<�Cl͡c��z��~3�̾��'�zA�m��t�����9�S�4#�
���a|;�4sG�����	�v2=��ֿ�=�-)����&�toɰ#�V�]�0�-`�M��0��V8����]�KջJ�~yöY=`��1�W��A4�yǷ�R�<�ـ>�w�H.ٷ^É���{$��&�wi:��7�n{W�_2}��߃\��i{����
5XQΘ�W�"�w�g�HkN%����Y8�ph�=��3!�����l;6C�?������*z*�8lBF�����ݮ�kՃ�6�@}�"̐�w*0��	G��A�@��W��aK�Vo;Th���H�>�ph����^Q��ѭ/%��G�.���]�����s��a��4�_	��nP��#,a���D��Ǎ����m����l��r2f �]n�I�Ł<�g�N��vN�B��`[Z���h�9��}��&��&]���3q�Zs���P���O�AyZU���if����X�ټ\J�����,z��=��{��h���/7��23*��_��iAw�g����4���ݤ/��JD񢇕w+����:ì!�X��7��>�f��jYo��5����=Π�U7�tg%���t�a�eM�e
��O�E�k���T#��.Z�֝��?J�my� �z;P���2��|Ա�'�Kݪ�^69Ҩ��@�r�����Q�7#�K�(}�:0OS���8ۺ�o{��TBu�Q��7��+����W��v�֫��mC�#�x��ۏ
��    �������p��.���מvW��=�����h���Y~�#������S�U։ǟ��E� 1vn=$F����M�Pd�h$jWk�g5O�$�Z�hW�]��G(�G���xiRUshe�J�7:(��Nv�����4
;�6֍����kĻa��XX�`|w?��c�;EJ���"�CZϗ[�iZ��|�a
�wRjTm­�,��ѶH
̙�� 
�s­�K�|� �aպ:����g)��3���X����8Pb�9})�����KkUlv�Wث�R��b��_�iu���T�G�h �v�{Z����LH�;~�}�A������xZ��L��UtI���� �ȋ�*y�v��,ߩ� 49��]2%�C�:��l��8�)n[����&#D�ֹ��p�\z:W� �[E[,o���7�P/<�t����uc����d9��g��(')6VN8�k����'�B5M~��:��N���E�xrb�6R>QXU:��f�D��ߙ���F�����^������ݫm��`���W��Kְ�c&iN�V�m�7"�6Ѵ�/��8^-�j�cmqkއ�ݚ�x�?���LP�0�6|��2���̲��j+a�&m��/�%pܫ}�6�P����b�}z��=��k!�]�<Mg���ni��֖�RS��l0�+9�C�P�,�vmn�oף78ж�Ҵ;!t�iUH_�Y-�Cv���=��6��Պ���@��8�&&�h*�3�M�n9�����O%��b1}S�Kٕ�W�����-��(2!87�[��Bg�P�#��0��=�]lB��[��j����W��Ԉ{Z'���ZrR��s����e�v?}JO�R\r-���Z�4���]����uy��d4�KP(���7�[���L��Z�~�S�������j�_O���qH��q6&�+:����Lz a����_4��,�U#~-&b(w����~�7��^+�յDƳ�3��Wq}p��D�b�?������,u�zP�ʙF5��Rn����v���^.w�cO�D���$,`�8��B4�:9vp���Ԅ(6o?*�8��>F�������fߺ/̠�Ӵ��4L	��n�&�/0�uL���.J�4��n�Rd�~h~E9��:mQ��	�/L�M�z?��;����48ֶ�s�b<�8.nG�p�5���,�$�������-��p��t	��;�I�/ï�6N8�Z���v?�����i%m�]�
֊�ϭ�&�_�i���ƽ����w��Y��|����*�7��ǐ߇�r1#�J��~�o�z߈���o;��)r���۟�c��b���y�����L��2�ۮ<˗�����d��ʏ5I`SI)�ø���04���UC����}dE�M�m����A=� �o�An���N4"� ��f�����U�A����F:1�d����b��"s''�sˆ�=����L���.�{�>�T*Z�8��'^�(On����҃QO�����tiI�7 G�r{O��_��&Kw@���'�2�x�\>��V�Qmƌ�f݈�������-��f�B-�`î�P#ǻ敞xS��0�X/ls����%�]��!��&��r�P���܂�n�������wB��dYr=�`_g�-m8��3��>��i-/T��P ��}��'d��/�u2L������ϦB%Ƞ�����[��09T۸�M� ��j���o��q��~����2�ΖP��4h(�*�A�R
�Bž~M����3W\���Z��-��;�|��D(\����t�؄��u�z�l��,��5��e�	�qN�����{Zg�#�7���X�{GzXYF�6L���ԓ���w���=�5m-�z���>_������Ha�<���`�)Y���B�զ/���j��J����l�E�� :?�O�d#%��9q���j�L@:��������6�!>5�D��c%،K�U�Qٖˆy��$z����zf=�@S�lhq��%�Fc��Ψ<w�9�b=Q�	��R��2�6X���5�ѾV���S`��(�
ɂ��tAӿ�FC3�_��t[S=�ɱ�Yل�G���
U��Y�����[������5��8� �1�p���C��),>r6�O9��X&�o�/#໦��o��M���tJ�x?W�x@fjȯ��h%!N�̈́\Ms	;�wg69�re�iw.��d�ɷՉ��G4��=�`a��>��B���i#��_��W+��{�^�p�CW-�\���s&�Dv;���,��=���F��<	����ӣ��̩D=**B�8����,�R=A�&��Y��cVd�A��qV�%˷d���S�a�e����%�}$o�o }S��?l!7�]&"�0�'K�B���>�'s��:}�]B��w�!��0�*G'Q�������;|6G��u�����Z�=|@�]��!�¨�:��c.a��|ګ꿰�w�� ���٭g�ߡ_�~��|��):NT>���TD����6�q�XZ��a�Pm��.���VI:�
t$�9Qə�1}�M�γ߬�G��m��N�������~[B5�=�A�Dt�N"�FB4\�s<�����5^�Q�5�<K��B��olrw�5��ܜn���U>�
�����J�~i�,��-���o�R��*]�W{D �?C�g�ya"��P(�L��/�C�7��}���s����e�����p_��F���xi!q�o$�К��th�@_�k�N�þ���'��T(R�����;6���:�cJ*��"�ҿ��OB_"��Z^=K�Ɔ:�rq@��[�6r�Q٭
0c�4�7���N0:�/9�5m�b���*r8ʏ���(6H�
��#����%5Ip|���yy�\�`C���%���u;�Yz!�l
�w���u�~p��A��Ѹ�_�ʞRJ6/6Y'���O"�_;w�phK���t�|0���=��U�����C�
������|�.9�2_��[ �a���h�4����W/��u�C&�_�H�Hǡ���)ϧ�h*8��s�<I?��f�+w�_q�]�3�p@M��sq���B�ZLGV�B҈zr�Jh�b�꬛-�
���iω!��#��N%w;��<�:��2����W�p�p �g�y��� L�����еd,3@�2�Q��E�1�r���.�w~r&H��*��a�Q��%�	sm������}���k����*aR�7�C��b���3�K֋�2���֖-_�u�C#�>rl}n�y��b8y|Z��p(p��6�0��)bS|lB2�P�K���D��Jw�ǟ�AZ�w��M��M	�Ҿ�!���o��1Tv���T��R�)�JU���Eb��x��=��mi�G���C<����\�a���
�E��������9]�4�v�zi��a��RC�a��������\�a.�k�H?��(�\���7�P�>ġֱꍶ{G���X<C��p:B��y�+y�mf�F�@N2�쯳g��z�����C]�,��5���z�xs�r���pJ�0=hF��udg^	������3(���/	>a��&��b�P���y��
���dh��u<k�C3C��2�$]gˏl�.��3$$��p�F�[I�zU~�:�����0�^�6mӰ&����l	�K��=݈��Q��w�Ɂ.u���͟|�	;{�5�x�~�e�:�-먔�9K7ǳ��)��v��`Os�<R�Ĺ�Xz ,ܽ���j#l b�3jG8N�Ӿ�Y������B�j�[.�:9խKw�zy�����4�rJTp&v]�~DgH�Y'��eX��gKqOF8+��A�m�
63&�>�@�#GW2��M%a��\D0RRZ�ϓ�y�R�x?�us~ԡ��B�x`"�Eω5G�Q�O�"]n�}u-.#Y4B��qk�,Wn�{)⒋1��+;���Oð���@�;Q�g�Y�7�� PA�WYI�t|�,��(׍u9!��]�d�I=�n��<�߿���jB/�=�F�xo'���B��V򶖎������W���>:�Չv�+O���8��1ne�s�    CQ�z!�v�퓊E���]U~�8�Q ��x�Z{�	��?g�($!�8C�CaVG>�J���VV��ݱi�zZ�W��_7uzR�l]��b��hE���E*�Q�Z썔��F� �H|'��p��pvA�յN\,hAQz��N�3J5��=�T��2�S}"��`���*����k<��zK�&����;������rm'��ŭ�a(�0�z���f�;]�:%��Wva�Qb6�Q���ۯ'����aj?�!�:�јX*��%�KA�>
1� Hh('����k�t�k��� ���C�!��6��A'��L�9��r��#��B �%V�vMx��H0�<����qÁ���8��^kM���u�Q�v�z������*Q��5����b��L��ؙ�WO�Z�PmM��F�
��p#�������P�^(�2̈�>��ͨ�(����TS��i-�uk�&���qy���2�ǦI�@�(��~�[:<��Y��!��h�
ɜ�/Y|��T���{
�T�QV�%���Z���6�Wˈ���¨ͫ�,�v� ���y'�,,��ڲ��a�'a�&���j�V�
F}�R	�}%�	�!qD��L���6�ZL��Ji�Q���ۏ�����(M����9gB#����5S�ݔ���h!��&��ɡ7Q����rDk
�I���[񷻢}W8��"yMY�9¾U��`��\�h V
|\u%a�]��wj�m��'�oA� ���p򡑩���m[�1��b*�Px_+|Qdq�)m ��^�y�
�G���3I|�Q�W��؀;� �C�=a����؞�:Wr��!��+Ϻn5ٞ�+�V�H��-]���D���=�o�N���j=0dx�y�	o?��.���'�+�V� Iӧ���Wn;��Wnl�}�O�MvOV|����;�ڌ��4�3s�K�>]=8���pE�E��^��o,��/�p�8���"K�]�^$B�M(�C��K؉:0
��ͳ,����=G��>U�buj�A\J�Of�����u�D���c?:�k	sQ�'���K���-��d�Y��މ�CZ&K�8��:�NZ���hC�y�ţꤥ3��+��-�;
Uf�o�f-�q~�I��a�M��[���D��_V8�����Y�������}�`;�-�.��Xڔ���>�g�#g=�����v��Z(J�6d�e" ��e��L]tGDs,�yw�O޲|�;isA�����6IY���=J4��w��K��p��͗Rʳ�欸��]�zR�QC�4i��8t����W�;*��d���B.Δ��P�z�_�J�?���Ǳ̓��z,�ւ�w<
�.O%�X�;��r9�X�W<�T����_������<B�dGRg��%T�c��$�{���dT�1]������O'��L�a���U��{'��^�c�'�Ÿ��L�ʢ��QQ�����dE�#�k'�O_R69�y�5m���0�� �s�P��=��2(�0I�T��n:l�A]43\ħ��7A奢��ϧ��c�'-�/�9��6Dlp�ms<��:��p�[7yI��@)E��y͛�9��t��x+�a'>��Uj���t��֭N�1�Z'�9�4�y�Z��q�r�{���.��d��I����rѪ���3�ofl��&�႕P�I�]����?"嗺��)��_��Ӌ�w�t�^]t�I��;�b�2)�����OO���[��Q�n�*:�Ѹ�EpޚE�[�����[sq�U�P�^�m�3=!�����`���"�W/+�~�@X�����y��B�J�_<��,�ͪ������Q����MW��4
��J���'\�ɖ::l��#@�$�7Q�[��S���C�S+��i �����\�+C�Fid'$I1HE-S0��P��R/�*�ퟣ|�-?-q�{��0��@��pFT�!��}��{�V��9>��ep����wӡ���Wo�u���8p���$xOא��ݩ��6`��/���#�>�_�<�v��m�v�r���)q����E���w���=C����	���,86��K"ؔH�ǇR���i��y���6�d����6���X�_�-)� ^ ���y�J/Rh���oF$@`�%2�j�uw�M�n*"��|<{�� �fbZ���G�L�
�،kY����w��I�j��8WL�D��Fk��5^���6�^�<��U�2~ԏg}S	�3v�'��iH�����w�w����=���K��p���׀T���\�����`),����) |���D4B������A�ɯzt�ٹ���,���6��v�P@yVJ-�7]��4�_�1�2O���C1J��}��/�9�u�v(ېC���N+�c?�%����u����`���+��ʙ���p����Z��U��!�SK��,���d,�Nx{�籇h�:渥O��k����z��],�� �-Ѫa�Q���(�?{�� ˹���8�U����|�����;�B�[�]Y���B���u1NY�<��y��=� �4��ZA�����\l��S���2���Z(� <6:���8��]� �Q��+����A�?F>h\�� P���e�l�#Ow�H!����9I�1ߗ5��L�
_�"0����J� f��9�������bf��>budj-M������N7�֎M�5��n���c+�@�R�񷄥����L+�_�n�v[ԆC<�p�+����C}�m)��	:������?��u젡�z�n�	k��4�}�1��K��ڸ�S���[�.]PU���-vG���+>�6��܄ߎ6躋�{<�'��⩠̒�����q��1�L�(P-��[���	Wn���Zr9v}M���ףFc�	?/e5�q��څ���u�Irz�%d�,YDB`�mR����S��Y�Q4̧��@��i����tE(3,��
(k\��BY��eڝ��0*��:<%��A�<���N7Y��Q汊��o�%EQ�+�:U�p�.b}��+���UJ+ʜ�B��<de����2��
�26Rvf��K^����2UX�jf��Ju|B��Őb��嫘!�*[��-��_(c�c_�4�x�L��œ̾aH�F�&ODpX�����NAޞ=�S����cڮT��-�ڃ�bL�8Օ�
Uv1y7�H1��@���ڒ�kpǸ�q�}��J0�=�����ū��йA�l���K����%�=��!�<ٞ=�'�~�mHŷ�z�A��Iܳ�Z�4��R�+z����)}&��U�:���ˀ<�y���>��;��b�`2R�+�e&��J8d�mO'�D�ڹą��#}V�M ��:�"��@���t�]�ѾnW���u��|��~�K_���iRp�:>ߑ��	d�L$���Ń��Z;p;ȕ�u�4��2mbN3�]�m�b�����
l����K�]�垙z�ǒs�L�V3�����FQ��\F���\��5�aߞ��$Q��=6�{,8�����j�qޚI��~���H�SLq%��9�\	Wc_�z��UP�E�xmpÉ���W@w�֙�-*��q��Ɋ�!]���;��|:�I��u}T��HQ�T�M��W�"F��<�������!ې{h��!S( 	53���$�#�?��/��;��=��5���!+9�\�s�B���Ԥ1��s��ȭG��6`�{��K�ּ ��=��?,�	�+�V�-Wi��-���Y�1�`���x�HN�w���e]?��̾��V�2K���y���B��\[n,��YZ_7P?����~7\ Gv��k�BuB�[��,�E��,��߀���-2�joO�Ef�p1��w	43N��4��2�1E:3:�!�yN�*cu[���V�T%��Y)A�C�a�?���)lEF�(»G����z\��6�r.�f�8���N��<�4��TfK��I{�e��A��*3��u${�s���p2럼)�	ݑJvft4�,���#t�=�{t5�&�X#���Щ{~*d����    b�:^��;k�9S�W�]H�a�o(nBڝ��l���t�l2N���Zy�|���y�A��x���<e�M��A������>���\�U[��}��d���I��P�P��=�4��C�)ׅ�īx�a��(I�+W�wv�M����R��ȃE��Qӄ ����	�+6KN��{����g�T��Қy�me (�� /'�P&cb�Z�x��}�#ض6��*I!�2�ۚjI�Q��������A)ֻa��Z�p�opo����3���JaH,B�3~MI����+��಍���@
�ye�]���*�!?�rn�/�ٞ.G�S_�{J�O���t�P�:3�!��B�$k�mH�R4��hf]U`�0�I ��$��1��V�mLq�`S� g$`��Kv�jkuM���Сrfu�s<��y'�5�㿈����G*����W�zQ��)�=�W��©�Xܜ�V+H�9d+[L�P��Ư��6�?U]�n@_�"��l�l�5F0" �:p%'���'@�o@���C�5o=�!,S�ШG��n��y�2������qZ3hu���x�dp[8f{��'���U�0���u��Nx�i6��>b���j"��J��
|C"�d�?ު�oq�_�㒮�f�~N�v�Ȃ�&�g��̪�i�To��Z�#�2�κ� ���:�w����^��`^.����<�n޵��G,���L��[�>0���9�
e����!8�P�s�"XB*�Z�fz��E��u!l�r�F�0������oW������!	y���:A���[R���	vY�=M����9���A%(� �.��r^X.z�}i���Hkk]VML"f^�Gg_�՗��诼����4{������-}�6��byCm2�w,���d��_ �q� �`�p�@D��B�����Y�Ak`��%{2[���H���r�F�2�
��.p^�Q؝T�c�(�`t��+ᷟx��S�-fE'�����ߩ�t��'�o���eIe4um�����i��7 �$�pP@*-_H���3�������%��
#��G{�e7s�a�
�j������*�e���E�}3N�]}Yj��5��F}��
�c�$�f��3I��v���l�
`1��J�y��4=�"Cv�xbj��^��=Ap�t[�'(A롷hR�$�q��P��b��qFm{6���ݱO�OF�\�^
��/ׯ)��Ln��P�J}z�f?P3����~��2�3�L�0y�t?oa�bTp(���1��pS� *DS���-��-Sm�V
�5#��ܺ�8Pᴍ�
6��H�0�+j6�7IQ�������A���q�0�$�z�������V�4q���r�:4
�������q���&W탦4 �kv���x�y+t�/�$���7�Zf!l+~��V�r�m�fy`!�̶߶/�@q���߮qg�M�rb�7�EF=B��Ć�O���o�X��(��9#�/PUq�J�����HQ�K	�>�kX�J_ �gc��V�Q�ص�ڙ�w�e�0
&>�nBp��%j��r�Q%�G>`5�l��욮�-�����LI�@����&*�|�t�h��i�=4�`��m���\��5�X�k&��d���i��G��:<Y�<s��D�i�1i8�4����r�-�%E��x4�Uz��r�}��AI�[G���}f�̴Yv�g��Y:�Y����R��#������y�t�P2��Q��_)t�(6� ��$A[*�0��$�i�����/���u�3�V�-Y9� S�u�a��p��������^К#4�K4���	�pLa2�K@-n#��̗�m�͑��g�^5��X���i�-���	:��L����R!����̼���Y�q��G�z���w�R�	5?��>�K-}�����K�?�']e?WM�<1_ږE����r4�v��w"$I�+�ɏ��a��,��0�r� R;����~'}I�L,�'�N�>%k�:�@�Q�^�AAH�i�G������'��>��,�r���@���9�y>맛lZ	Z�@,�c�N����
��kֳ>�+l%���O�MD�Ş�|
�!����-d�tlW�F��Z�Q�|�D(I��OX栴�t��Y�"�\�(����r����"�K(&B΍.�,���~T� �hE�$N [�!��Oī�|F�^�,�L_
�l�?�P垸d�ey�~�evG������%jG�j�Rx���|����V�B_������6��KM��O�3���������V/�>�8v�գDceп�4S���v��Z�������%t��ҁí]h>��5%�,��/:PX��&�.����],�9������cV�b�	��\u�-�m��u%\�=�s�TF�������*����;�e�>��l�úhR���n(�������X@�[{�m�Y>ow�,�t�#�y�-�|c��i#>A/\�����`;�!E>�L�5��)���r܎&�A-�/�"&��$�G8�����r����;���ؼ%c������a�V��d�>��-�1"����r�~�(п) �d�<��o����*��7�١��308	��ے���S��˺m�fv�t1دX������c8�_ʒ� �xfϿb�O���b��+�`�﫚�����M�o����		��(ŝi�o��我���}�³�KP�ְ����lҶ4ٔ��&w�1:>�ဧM!H�ͮȽ4.-��ŭ�����3[��'���Z/�p�p��ļ@&4��f�n�w`V�2�h^vq�b�2�g��e"[�����g"<��
d��S@7o��/���86��n���<K�t��Q��@� ����Ǣ����t'kN�i|w�(
��Am�hk�ʐ�>Èv�~�~JBL'�@�6T(l�$��/��<�"!D�G����%/�EdR��y!������:d�e�F���_�>���o�tX�R����b�0�o�EGdX3�\q+7�>��:^���c\�F��\b*�D���
�,$��ַ���6q��D(I7���j�2OX�w�ڇ�Uٌx�n���.��=���\�g6ou�����-��qx��feZ��sz��9�΀��K�?|%,N�Ϩ����@��7L,kF�ĝ2_>.�޳m}a�͖����vw^;?8��gF� �ma�����Cx
(}�W�8A�_wۗ�P�Bѻ��>	+����&�A��K����-�M_G^*	C����C{�5�I�,�������!�\�Pޏ��WqY����چcK�����#>a߹3�ls:�� �?��=-_P�Ǵ�f��{���%���xEk�����2������~��s�h�r9���q,ל�%��y�xۇs�αH�6�Ng�s��;`�Jvؤ�]C�
)�3�{�n�V�]����<`(4��H?�`�,��CıE�����%(A^�9�m> �~у��vR��`�����;T��E�<5!�8�!�R�-I7���40��WW��ٖ�� ��}���U����	������k�6���^gO�0I�Xe�o�^��B���V�t����e��)=�O�O<����X@�_ �������
MM2��3�t8��	��뜑onǫ���;W��%i����M�2���blW��,~O�6�]+�̦��ɢ�v.�9�0��C{��9���3G.���`��l�SO?*�AN|��!�O8焄OɊ��f��Z]���t�p-���
_�Gh+����L�8�;D	%ݬ����*����w��{}��m�����4 �}ˠ���k�Y�M�-�-wkc�\&����!��iI�/uE�y�*ۇ���˛�\��\,�/a1v���}P�l�h�����{M�<�T���|��^Q�h����:1��q����만��pt_�B�X�.�%R?�L��~�@��.������$�"�@Sa��{����;��r��u�+���{�v�Mj��,Р�������H��C���_!��q��~��[�L���V:���a�{@�y�	�q�T���"+y����nx�    JN�jko''w] d ���}30�Q\|������B ���ޫ��i��׽���Y�U��l�S�W��\��i��n������4���ot�-W��@�Y�S�M����_+윦k���������'����гu5�0cZf3����붃�H�NE��:7�f�fΌ�t<gt8�S�M�$����q<�f���P>�n_M�:А%3~�bӷ��p�aE�M��v ��k/�Ȱ�]��^s^��&�=�Z�C��0b%���Ϣ���S�� �1�ƪ�3f�o8��"�c��0'�Flٺ�Nr��o w����L�~0L���+�r
:�1a�#:�=��@������^0MՐ�į�L�3��X�|�`���q��[gj�q�1d9Zx��$�3��d&,��K��[;�v{A:�n g?��	.�.U�>�{��?�b�ƞ��{���6[��p���OS݆�$k���=�*�z&vNw���3���5�;˘x�l�}M�T��f�q4�Q� ���~�ܵH��wSe�d�dft��D�: ���4 ��Hwt�gR��o^�8��Rǩ�Ճ*˳/S��@n��m�iw���CE�31�.�5Úə�֯�2�������l���؎��S�����A������I��`&��K��w^��[*��0���/>�uYl�LgtDI�g�=�z�G�b
�T��@���ET�&#�����:]��/D'ن+9P���5I��:5���G� ��>;ӓ~�X�ء�A����q�,|,?T5��@���@�M�#5�))	��W��F:�?�c��Ug�Xp#�@��[�ﳻn�i,| �
t��#��v���l��0��x�%+��_{�A�D7��k����g���j����%� p�ş/(t]h[i��e��BU�3C���3Λ���&�������P�[�\��t[6���i���5�R��hq�2���W��y�d��yf+��\%�G.B��si�^˕�$C����m%;�3���,S^���]x�yI9O��
�?:��g��mQ_�2���6��;�݀�K�J��W����=�N��Ž���N������ʃ��2���Q�AE�I���8扁2����g��z�ݳ��������'y�k{�z��'��N�����a�]aps�Ը�^K���$HZ�? �MG�ZW0磌��ER�"��d�X:Y_m�Q5�뫮���]�r�(�GKSl���%A�n����Y���\�4�,U]i��:��t(W�|�����@0<b�X��������<�l(���R�ŴO9�@��2�0Do�ա0+�M�O�),y�7˱�f�fk�
����4�}%�߶���yN�יXn�`�����A����D(���<o��5yXc�#/�\H=@���ru`�9K�I�*t ��ۘ�87�3�cHƙ�;���0�\=��Uc3������g ΦذA+-�����ɶ�k�G��:�G���Z�I�s�myW���ͬ�)NϏ�dB���<W�a�NJh�b�o����S���o��&0�F3	k���S�&��?nO'}e�����"���~ev�8V��݀�Ӷd�mn�;��ȴ+�`Ӟs�}���r���� ��7��:f��84CS&��eߜ%���i�w�!q>��>��[4�n���y�A7~��3��k�z�,z<�y�ߖ{N1�]��4�׶�����;�)Q��M�d���4�y��?�70�ˉ����-!��Vam8�)|�5�ɵ,;US4c-��+��qʸ�'Qjmg`�-�j��7�l�[[Y�$H��l+���K�!TQ�	��C�����
�E�����C��Q�Q0A��ee�0���T��K��V@�X�㥩�2���숣�Npz��ʄ��C5'w�|2��g�'O_���`Y��]�I�R������`i~J�2�����:�u��B�t͢	�y*��=!�� �2��ϝ@Z������G0�8�R��<�u5��*�Ͼn��$���lu�^�W$����i܇d:󟓌�Y�����ʪ�����������L�����s�!�9~Z�AV����K�gTձ\Ɍ��ޫ��ue<ͨO��W������I;~a���Ra��.�e0ۑ��5����;"�n0:!R�[��,J�k׎�i��x�K�����U��䨯�M�J�(`�S��2�0>�H��&'0a�\F��D@g�C2������ɜ�|���H�`��lN8	���ry"�E�T�M��0o &�Gz=��dUQ��[���I�4�8�.1�~&�Ձ�v0�p�e[6ڃ�d=[_�;
��B���T�0�@�Y6h����Y��J�H�q���P#<KW[��\mtYE��ڝկcĦb�>��g����k�1���A��D����g�q,v�3��-�ӧ�:�%M\S_Ox9��E���Ug�Z�]�6f����ɏ���c��i�;7�5��� �0{O*�*����0~M_8���Tb:�r���6o��j����Z�ҔN�� �Fe�	o���9.T���<��\_�̠�W#�M�
7�غң�4 R8_L�KM��}�^�� C�sLa��1�č�,bC�x����8�e�1�u����~� ��?�~������r�-����NL�O��N���I�R�kpS�N�d:ƣ�/��
�r�(,
3y��i<qq�fV�浕*(��b5�kvK	�m�>����Ȝ�gQ{:*'/H��k�SÑIy�~Κ�[7/j�\Ѵa�_V1��.����S�����T�o�srPF�g��(ב,��o	�_0�r^�c�y��67�trǠj<��%p&�v�j� �	�U��-�W䎚�K2��׸�4��C�f�w\L'U&}1��
�K����\ s�C��؏t�y9�3���!��[fcϸ���p�4�c\�(�2�0�RYr���
��HIx3`������\�����ߪ�l6�|f�6��[�� /�� ~�%���T�O߻Ni���|���l�{��_�/����C!��!���P�'㐫Q�,%g�]�+���h��Z@�T�|�4;]7kǏ�C����?��a��������WAac^�Ք]������;�{C��|�+?Q�x��!�{��I����� ٶN��of����m��ż�ǑlƎr3Jݕ4���r7���2>�/�/��6pr�b����/#���jSG߶�,"�(���j�\?�����\����  �?Vm$\���Lv᩾�p�������*��%�9@P3N�_�����n�5g�0�q�uJ^�A��lG�����È�aPϐ�D�ʂ�%�Oa��O�ڪ�I��<�۳��˴=�s����=��iH�e�*ꙉ���
�/�}l�=��~�m��T),W��	;���oo��d���s-y$S�����M%�r4vB��Ts����}Sd��g'�~/���λ�8wr`6���R�"��,_��=�|�w�,��f	ٚY���H���U����S��2-C�ld���X�9l�:��H�A�o24pfcI�Sf���JmK��-����7sZ# �!U�ͱ���Z���L�F��o����٤�} @e0=���p3����r�5�l����q��t�񔙉�Z��{[	A5�hء�3o�������ɱx����]�T��_o�ܶ�5��t��Ӱ�ڔUM�Y�٧�rۖ�3�O��~+�PO����6w�A;��.��� ��	���O�� �N�]�aM�R�e��u��s�oi�0��>�tD��@�9��Uєw���8�6��TY<�mZ��$h=���
���8��W��o>n��pb���)yJ^0_Yow��p������LG�B���֔1�uݛOg�n@z�q넥YN��a��]�\��wDv����e���j�� E�^p1���Z�6 ��Sk�4�m%���W>������ة!��u)�ŎJ�I'\Cɞ���!�9�����
�}�o�p�t��L�2    [��ZOs�����@����C�uCRZ��z[t��~�{J���E��c�e�x���@�`��usR��:����,�pf�C�e�H�f��{��'��$`A�G��A��Gnq�mMo����s@y�+��<�Bg���J�X�'����"�H��@���X����fH&wT���'�<���b��蠆Y�þ�gB2ɿʘ��䍜87����˞Q?�J��v5ג>�u�9�8���d�� $:���7V���Y���ܸ#���7���![���؞2L�4$�Ӡ"���
�sz�b3Z>�/$��P�9X�Y��a�G�=�\ZY�Ɩ�T�G�/�u�
��U��圙<�GEo�woa��
�F��z�A���zĮ��}]�f���:���Ӂ�>"t��ڥ��}Ӛ�Շ�f�L��o�G%}@�m�����"nj���~�'c��H�b
���DM�R��v�������c�+9���nk�#[a�D�W�'�
�f@�u���d��)�ÛiuV��[y`gp���,3��s:]��j�l��n��	$��z�Gy���(��Qig�âU�2��Ƞ�x�<n"7�ZvS�ӣ��S1�؜��W$E�*N�E�G�SM�wK���#������vi����Fפ��3���#4���$���U��R�Dn�}�n�UULy����.ʁߡ:�F��M���ч||�d>�E��M�S@��`�{
�G�~�)��.F�ӵ��+ɰJ,��ӻ�>�阒��568˼H���Σ2 ۅ���A���'�)~��]�k��o��-��U�U��l��5e:\@���
�#�nP^:C�[���v��nZ�,ࠆY�{�����Mג���:j��,%�2GW����~�K����z�-Z�5����q��Sң_ +O�m1�i_9,ʇ�7��&��U�.y��'�yq]YU�Z���i;�����,�d��D��DeRa��_�` '�t-Ķ���u�R�{���aƧ��n�7�E�_��vFt�N#���
&YZ�Z����S�g>�>��$�E�y�x����Zs;�k�ڮ�dH���t�Q�# �%�>�'��UT�ꂎx/��j�i.�;�e�ydy��{�Y�����U����C��F�Ҏ7?�u�?�J�GS,���1��=��,�N�3̡���]�Z>�ϗʹ�������6����Qe�K�O��>�'��eQ�5�dr\�X�q�N��i���r~{�#`�2}������I�n-ܖ.s��Δ&j3p]�-�B����]�8#��)���v����ٝ��{B���hz��^-Ă���p�����q$n���?�p��;�Fː-�jnl]a6^��k�n ::��'QՕ)?Ip���lqǖ�������dʾ��'Ѽ̃��7!4�8���x��V�[�,��D��e��knyS��/�~�.@�*�d�dTC7�)�x�r`Ag�����͟�t��ū5-_���d�kntK��wؗq��b��2���~��@K���ƶ:�j0������*�Wx�<�p�._��t��ӳ�"�C�%�6���eN����W:/	)珖��f���G۫�1��u0���7�����5���L��}�Z�G����\�t��d#j�h�׋��׃k i(W�Β��w�NwH+�AW�$�D@ӷĴ��ng:G��*��b��%�kkt����%sy�Rq�`��tB�������[�c�o�"s�R���G#�E�),�O�� ��Q���B8�� Z�k1e����+h]��������#N4��h�Ұ��B*hMe�䍄O�9�1��8ݎ��*�t%x��/�) ������#�7�Yf1�[���ڤ���)|y�ɗ����M�M��]�A��T��x����q�_u�톪]�i@;�	��^lwW5��ag)�.�|�*�9qm���[peY�k6TyQg���>,�t֙���x���!�l՚ �6�S����-�m����~NK���y<�.Q�Ѐ<��0�/�X,�>�k�%z"�C��U�{}��*3\ ɷ�:*���]!�/��
Vj���j���w�A�O0C`%o>ވ�O�e<�"�#X[4��w@��d)�M�9\�%s��)@|���+b�8E��g�?���2KM����p�
� #�.yL�&فĀ>�[g>�.Y�z�A4*�"����z�v�Ǻ�)��:>!:�� " �s�%t��UZ�U�6�~⨼ �_��K�M�e���~�n��!�T�BM�#��3�k����OO�b��d<%���ċ�E���C	��R/9�V@*Z�)R.À�\n�9>E��y�����P�?|�څ�U���#r�O��3��P�	�d@G:��`�M�o��m�
��Z�;�����?�c�p��M�����1�uć�a(��B�CZ�6����S��S���<�&P�-,��U>�Ł漢��-'�>˾��jf4�:���U/lq^kpv�ZRq��w�|��Ӈ���-�{�����t��ܢ/�Y�\Z� �b�H�c�(�)J��'��݅�ҙ'�JA����_��'<����g�10���*�&�m7�l{J��ЙJr��:�[�5\�z@�LWzLns��Khm��N��;�gOm�B�t͢{���Õ�NSh���1zd���{���������Z�sQ{�#Y\���ЀU
�)	��?���|xuH��}ƞ��EW��k�"wā��וNwJ��O�S��u�3�v�!O_�\�.����*�����MאJ��lptP��A��'A�;��f�]�}��#�<�ؠN_�z8��j��[ڨbA&�>���U��(8 �?)X����b�����x0��|�"ņwWr=�D6ߥi���p�CwH'�n�͜n�K�/g����q~T���w��?���n�ǂ�G�,��3�tXX�8����}pOLN%��X�c�E+�b��r��m׼l#�cy�QX���7Ώ?�%[�mR:�U����C�t�L�c��eQ�O&>�;$��>]D�ш�g�nR�(OY�x���[�C.R��5�.�2������Q�g`�jT�Sp�N���i�=�,��R4\̉���NG��g�~��)9�^��暗��(7Xj�T�3�>����V�@,�Ar��~����M��ߓb��t������`��!���C
?N�����vv�Nߒ�6rx��E�����~p��r�ޒ���k����������S2�!�ؗ��\���厌SfZ��*���q0+{��P},�,�	�PV���`����Pmsj�\���/\��X0�/ԟ�yD������q��&�d����!�=���0���Ҙ�:<�6��b�?�F��@i/Y�d!m. 0g�|����a��;���Y�c�M��T�@2�[$��yρ�\�2��ǲ���)	�Q�w�����i���>Ȭ�v�|��p�D�f+=�4	J%��}!f�cy�Q�O'B�	�� u{��{�oqJ:q�!�w^~ׁ��xB�����	Wa�:t�ʰ3~��ib:�ʭ��w�����5=��O����6��1�X�����1�A_)H��ֿ�m�ؘ�)�@_��%��*w��`;�����v'����7��y7.���l�DH��R:��M��	����0�eU�l:"����O�!:����9�i�3[<�"�t�I�Le�w��y����K��+�A���eCu4��~�1*�}�;6��]c�+���k��3����wvsB�������jD�͒���3LW���>A�0�kCg�8]C��� y��*N��o�cc��7�źUxe��M���X*Ͻ(��X�=���L �����������-�;{g��ܭ��Sp%:���r�:Z�R��dF�3��o�o@�������'�~V�j��,���Z�^�W/�JY�%��SK���� ���d�C]��v����4i/cr��    ĸ�HF�������[�,�Cw�5E���ݖ׼P�(��� rO4o��a�.n.�:�K���m�ҜL�4���\K�u��qm�!,��ׄ2j����v�����h��©�d5*Njǜ���lЗy�
`*��Ք
)��۞���]�0�\�]�,l�ƻo[rH�5G4<<�.�a��g�����6�W�K�k���措��,8��r(�vh����<��X�4`���u�����]�z��D�Vײ����h
�c�;׽Ji$�&��q�ɴ�%jl[�E?����.�++:�~�T��1��A3�%z- ��Ujh�O	��$c�ƛ����'��˅A�QӪ�͠��^���c(�� ���N�Fq�$�
9��1d��wl�3�۶&���M%���$G����?����[|���k��˕�5����u�щ��&¨�=h���v�KPf����1��c$�@�MB���#}7�C��0K���k�e�l��B��>�������0���ρ����j��eB��Na�񲎣�!��ŧ�ED��I���<����6Rp<��� ��>]����y�b	��wWqJ��.��mp�!,�fT�ט����x�B�.�/�2�*�cq���8o<�Ҡ��XWx��oXk�X�N�~^�n��$�!�{&쌳3/χ۩�&w9��t{=Xh.E|��Vr��h�`�xg�i\K�ܵ���2�
��3	z�|������;2�G������"`.`7\E���h.���6�8�7a�~X�|g��a2��m4�R�dWGn!M�ኦY��^�T�7��K�/e51�V+��+�97��1�i����~g0lز?����q�n���ε�"5o#�`C'T��5^�u��[\�4�E &|����;�HI��-��`LW��\��|��m+V��y���/�Z+�y�����y��[��-�p�t�R~��n���W��㫱��Vت�1��ڱ�U��)sQ_N���-��iy��$�����]�u����/�0?S�y\�຾���Z�P�F�-��:;�c�襋Kx�������e3d�_�
�d�}}���/o.�g��e�0�9tx��뒋�Vc�=����tR�r�Hf����4�F�6�jl��XQz7�0�?&tD�QR�4�zU�H�Q��$b�)�sD$�H׃�t�%5M���Xa��3�ǁ�	:^���y������x��4�a����ͳklmS�����O
�ґ�D^�3�O�'`��$�'�K� �
i��c1Yh��B�|��Pfu�d�\3�gd�@��b���ho���HH3]���?�Gs�.�Z��Vz�:��=1��B�s$�$�8E��x����Ht�c�jr��:��9�X���xi�����s��,�{�@3� �^J4!��R-�*cLÅ,�Qu�g
��2)�7�9�Gq��HS2I.�ٶ~������X&�N�� @u�o	d���]���ܭ�= �g�j�[o�ƹn:\z�F�hN;~D�e������s	�����H�=�]��t2T%7����f
V���#�Y�;��͜[�p���|���S�U�Aۚ�J���:n>��j�)j㌪c[�{N�<�쟙��p��t�#a�=y�bޤi��M0X�2��Tf���+��b��-,��36��T�D$��`h�#U���ަ�w�y��T����!$�f'9b���[�Hp��ZDW3�/���㔕+�<�k��Ew�w\}a)w>��d�Ma����h��:mv�8��e�愰��ˠ5RW�yن�Ǳ|��#�)FR̝8�w�:�I�< ;D^�l�������MW�Z_�;
������4 A�bsNTc
����)F����DN�H������zd��&K�/7�jȱ������ p�E��,ڷ�[���v�>��p�}��V�j���q&}�����A�(�k���:zC3O��G���^.�������v1;�s��J�YP��b���J2Q���얄�K] �7�{O��e{�]a��"��Rq��bh���f����pA�0�@JoIF��N:t"Y�����eb�ϸ��m��G\W��,�i�=mfM:4|z���Ɂ�(c	rhG|7��<�l��6:�А�h�/-��^�)�����rnގEtj܂��r����Dd��k��E8#�?��L̂ 1�w.j�6�w����ִ	"�ZI$77�m_���րf)�[���4��0C?X�,�c�9aZ�H�y�:&��K1���w��=uŒ���գu^[24[��>�G�`�`P���E����0��.}�z2�0�ǅձ�ݫ�]34G�Ƭ@��C: �hX%�7��42i;T�7 o��g�r�i���*�n��!��G�����f��\�Xт����EI	�I2P6�������l�W��O�ZoxʜN{���Ī�t��6�Ŝ5ï�a���lp���w�c�!f�ﯰ���q��pzm����V��DS�#m�����Q��,N�)R��֚2����#Z,�q��."��+D�ql����쮁�+Z� =z���%p�k�]�D>��P &W8S�K�ȧ���G	�qdWM\x(`q;��^|i��ʯ	/���t-n���Ќ,2cԫ�-���,^'o�xS&.͂,����*�'�y�73� �w ?��������5r2�[����<�yf�]��g�r{��&t��ݖ����bX���pq�٬�{KW-.!{��K�ьλ��?��ӣ�@��vTZ�.����nN����9���qe��Hk�Kǵ��R��/��v��2���qV��hgTAO��{����ć�&�<c��?A��F�#�2h��\%��>�U�Ӗ�)���bo���m���f�.�I��h^�<��!����vG�F���͏ݴ2�u�, �WP|�x��ą����{�������P��h�c��_Ɏ=Qv�~��Yft�5HF 8`�=�<�?����ښ�k��zz�0F�G�����J��,i�a��d���1Jn�eY�������ѕ����xCe��^Q?�������5���?�jPr�{wQt��IQ��~^'�$��0�;�:��z����9K
�*�ʕdU������{��E��u����^��ً(�z�ރ���{�%O�RB�Zxtu_N�sO�?���ݞ^	�`S=eCq[M꠸uE�rq�������.B��24�;����k�� W�	~�xpO/�_�r5U4�i��\�}_�<�;:X �$�Ea%ޙ@�'���p�b���M��W���l!�ES}�e}=������稺��u٢��7ꌛ�B'��D��E(Ҍ�t�u���v�ܡ"��j��G�f��o����ң��#��,�^_�-�Q��="�Q���`�"䶧��F ����6("T�B��6�9�!�޿�1�,��}S�fd:jC:(��q]�l�i�H��3�\^���,����ڶT�T�
`�<\�h�盶�]�N_���I����y�t�PS�eA�H�ј�*!�S�gr����� ��������������i��	L)GFW��=�S�i&'���=^0R�}�(�p�@'����q%��D0�S7�:��$K�K#�i����U���*e������l��;��^���8a���i&_�*��K����!�	B�a�pЅ��L�mb;��i�u?�VK�K�D��P�SM��$u���,�!�Uy�-1[t��`�4,��[�r�ſ�O�*�m��tHܑJ�ܾ�p�r.q? �}q*�I��	���#C�IWN>/�����P|����F���ҳv�֒P����2:lWћ��=�T|"�-���!� D��U���A�`h��gA�q�M��/����i	���; ��s����c����Emº��VX11�K��g��9(M�h�8���O^���?�.WY�m��\�(��B�գ8��pP��Մ��է��*��p+��!3�K�����t��P2᠎J�W��&z�4��*��z��4!�Es=�-��`ZEG�N�� \   nq�<���K*˰E�u��r��ۛ��H6�7��P��Pn��e����~�#e��%Q~�Q��i�G�X�f���l�ۿ�����8�      &      x������ � �      (      x������ � �      *      x��[w�8�-���+�v^�2��e�ёbӺRj���);1c[ʒ����� ޝT�8�b��u�NWy�S �����(J��]G�(�DKN~��o��9��/��1a(�O�!XJ�S��T�,��7�����������2���,����.�_�(��߾���3�__�F������������!(��������<���1
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
n�(� ��/7��r�@����G��rqq�%�9����fu��p�M��ȩ�U��E��	L͊S�z��r��)ч(N���~��-���O]
G�:H?��!��F~�������Ue��I<��o��_@�A�9Y��N)�VXPO��ە��X7���vJD7��6�r/4q�վ��̸@T��u�����耿��Zh���<����hz#uf��[��N�wB<]KuS���f���.N�o�B�Lp1F�?���Ϸb�� ��"��;���������!�\8��K�k���?_��_H��+XM��x��uZ�Kgrꇅ�e�^��'���Ka�j
�뭊�F����"Ԧ�����>�1�,��;9�JZ_t���0���������/W��*���.7��W�W�����'��.�`Vđ����^���e��6    p�'��j���G���/W�ә��x�d���&�%ru��iMWVu�8?��%�*7��1=oK�8��
�Ԟ��N�4u�f�\��m����"㯷�8/��~^O?$Zg�RV�����IXQt��C��N�Ē4�?�+�>.\��nl+'*힙��G��Qp��R���E��Jg�Tb|��MF��83�CF�1M�h����+E��<yC��Y �U�B��1aX#�� �_�j��-����͒Ty��j�fIȏ��ǅj��Լ���ͶR�t]�a��B�R�H?�l�R����@�J_/"��!c�D��V,n�-A�O3�j���������������z��hOU�������Kc����E>�
�*s�L��	���bva��%w=p��皜��w�͎B��j
�f�H$jz�F���ֳT�m����t�J�D��N��7�Õt"�Ĭ�=*=�LURU���f��*Y�mQ�־��2B(��JnA��}-,뾌{H!�P����������`��Q�H�9�c�+(�|*Ό	n5��-M��I���(^n'@�(Ij��뮈*��0rk���o;L�zJZ�H�P������ղ��������d;�R�lQ����*aһ�z�����c��! lyZ�~�x��@L#��
TA�1%A����U�q��a���RCS۲;7K���'زW�t�##�RT����u:��i�>B�7#m�h����ԋ6�xֵ�}���zB%��)�H�r�w(��*��	dM�Mg�|�*|�݋Mn�P�V�fׯf��b=)ݨ4�6�E|�B���?�U�7K�E���3��:����s1*�{J��I�
��%������7�p������齮���r�E�8�=����V��s�=�����_h;��rΌkƧ�:�X�:2�l�l�S�P7�ڞ�\o��z�����s�<)��d�/�r��8��J��xg'C����K��j�4i���Ø5��� ,z$�8h���e�w6hr�xJW-�.�����bB���+�l h���,��d��-h����v�Rh�~��=(���G�g���3�\�&����o�l�/�:{(��`�Y��@��>�D�E9!���1M��n����Ɣ��3FhiLY����`p��F�wày󟳻g�����}ٿ��Py�G6�!��(�5�*�;�
佤��n�\� 1�=,� ���w,X�&��ݦ��fi��:Qy��?e��J��L��0!�!��T%�j@���<��F#�|�O�c����O��J̤�g��-�=���7ڥ��#��G��+g!�Sڇ�6�
t��w���b�Ё	jRڃ�+b��L-�M��n������d��Qk�ȝ�.p�kYL��k$����d�VW�~��s�7l#F�&F��{c��!��o�x`��Q�}�I�C�L�T�&��iSH�^i����t[ޥ���ͧ���XyR��p1}`R%����$J�,��������M8����1��SH��1�	X��l�J& ��J�m�*�E��Э�fd�W�9@�m�ͬS���@a@���y�}3��z E�����k��?��p���&����#7�#�w˨���L��)~H}����h	�O��5�M�I���{��n'W��I���f���,$���_�Ov٨�G��T%�z���0M���*ݕ��Nw*u�?R�?�m���2��D}>ȀQ_����5�+'�O33x�� 	�:Z�S 78@`0�E�E���M�2��)o�����>,T%����O���?x����~��_^:}=�{��
іZ  �a��� ���2� V��O�?�0���R�I���L�h�K�E��5{P���֭!�17z"k�'q�뇻�u:01�p���ꥧ���r��/Q�\��YJ��=�6'iM24	Z����΋�����}XWj�S{�A�ʠv���� &E������*rVj;]n�����$6}׮F�X���.／����>�"g�ō~Ca,�(�ɳ��۾���$_�X�a�	���yޠP�H��?��K�k�LaI�R�9�B�:�,�KWmt,rt��{����I���!;޿��F/X��v �z���R��*q���F
}ɽ��9{� b��6��-��"|;�D��a�-�_���%���:�n���4�]V�$��B��v�]_���w�$�v�����p�zVC�X�C�T���q��?uV�\��.yͼ�5�?����*�*�A��Z_g�=�У�;`�Q��tT�׃*8w/{@x}�*�z�5³Ҳ�]�k���܋{�t��U��=����X����zOH��B)婍�Zx��R�>�w�ﲃ*.V׫��P�8V,0[jؚZKC\uKb�� �f����c��.݃�����W��.�2rLC=g��UO_��A\+�/��*4��� Q�&�r�
z)� ���;��1�U���J`Y�3�c��r��?�d<��l��K�x{	����3�ʿ�X�hy:��O:�=dP�M�U4�$�6 �y���_ �fu��֖*#������#�cEZ�`��;�Ԗ�W�,4*��%��`f�~Y�L�G
�����I%^޻iڪ�8,���~D��[�l���{�ÊQ�=�m��cw�&����u)���9�vxӫ������3�G�S�* eW�.�x��R��^zzVؾ��0��+�P��j\��nob�Uo^����P}���	����`%��ZNq��λ��#?�!��^�����E�zҬ���[lӊ����*C,�v9��E���M��Z]?�w^rzȏ��N��t��2�rb��͵��QK�4j�T��ݽrU����u5kԵLk�lmn��3�S��=���젞��3�U��c#60��֞�m�g��'/��g-
�^+p�<��P]���*}ty�A'˻�?���!�}t�TR�[y��Vp�ݻY�)F���/Nw_���UZq݁u̧8&���5����c�����ދ���zHa$�*�*����F���ԥ���4J�&(q��yȭu�����v'���^P�^ThR%��w0z��#�|N�V �\�������W�|�b�J�@V��V)dh��W��j����u4�..*�m�nN{����_��mo�_�����`���'�f��'�Kwa���l�Ȍ\� �J�
���.G��WU�OG�}���i�m�1R1N �u�'ԝjN �|`�2�c�S�����ֲ��O(���yB#�R�kz:���ul�0sE�	 z���UF�%U�������Ӧ�w��J䡪�(@]��1!�M������M��q�k������,���,}��?>D	�d�O�c����t��>Woe�71f)��+����١չs�C�5>c�d��L��텎	� m�p�3��fǾ�b���q�B�|_�4�	�}�U���MU�~���l8vBy�?�(;�>�왎'k��[d��|�Ts�t����*сȑ9�-����С��]�1��j!�VU�Y=�3=�t]���ӫ":���f	o���4xՙ��^��I��G8��f;
!�v�/�N޹��e;��Y_��]d���gom�P2���󞰬ѝ��x����yψ�T���|���v�Z�?����Ĺ?�X(l�Np�f�>>@��F_5#���3~���2��Vǒ�E����֟:}#�|�1���Q�oR�@Rt��e�ً�B�~ܷ8��}��IYj�����g���\���\�ߺ��ùkK�9����l˻6�c3Dק�J0��M2�T{g$K��Yw�Ƅ$C�>�T��?7�u������"�\R���o%G��F��Cv�3o* @�ÙL+tz	��w�cBS�:P�X���jR���cߔ>��i�w���De�>�����mu�a��vN1��2XL��trDhmT��ߝT�R�6Sw�w1NMF���V@���T�$9=�B���R�����$f�ï.7�I;|U�sȍ��s����j�����,�a�+�����+���    �<�Ƃ&E����y���.G�&ZG��<���<ژ�����x�E�8�%.�?v�(zʽ��cv��OUe-��X ����6�c�4@C��?d������jY���Va��j��"��ad�=�kgzMK38[5�nY��A�D�raw�;&<9J�O��vhO|�6�M�ϭLN�ˬ�a{�`
���,�9�3���h�v�Hm���cF��$R���wك����9C�١���	/1�M�~/'��H�Lꗓ�� KD�y����<��%k�M��eThb�>d_���n����ۤȊ��\�͊L��r|'� ���=�8���h�>�bܗ���H⺯�[��cA����� ���A,2��u͌� Χu�����������S�Oh�Ɋ����v��x��[fǃ�oԯ2[D����� �IsPu��X�5�+cB��
=�&�]C�ʤG�Dr��HPkv���:,�Y_1r����j6M6+&v��"H��sXQ�DUdWY|L`
4ˏ�s�B�����q�l�"������)��;�>���yCUPR�R�m�U-Z=�q��vK��,SKUR��T��H]p�|.�i/3�(=}<:Aǵ!�T�Cl��˔��q�HPz��=߿�Yf��#&B���.��%���s�ԋ>.����!�&�����F��E����(��۱Y�d��oH�\���SnJ�����w�{#յI��j1M�奷�o�ѹ�e�5�H�Ϋ�.F�i���c��/��\�"ؖ�����-#���Y���y���C�P�}ll��yz䕄s�*�������ʇ��<���-:G�),����ѕ��]g���p��t��:��x}�"?���ʇF�cFS���C6BW�3ư��aw�䯿�n����������g������!�Xz�k��Ld��w�c�����c^,�u��E��b��	*�NCG��@��4�5�[+~�g�cg����O�e��P�nX`�!{yۺ��8��2��'��ǭuWğ��6���ٳ7;v����f�Jav��]��V�����3;��2@o���ę�fg
�Jkl"�����Iv|R�-�˩�؁�P�C�0��s������7���w�]���z\���D�
� o�:�=����SVl�AW�1�V��*���Lƅ���>dϹ�߇�ϼZd&ZRй�
{}iE��VCw�vu��Cs�u��8�&�i,�+ࠫ���Q��E?�a��|Ӊ�������2��ӑ ���>��c� G�ɼ�㮭�Dz0Ҙ���*��x��i�i��M��@��v�t� ��]}e9C��"�k͙�|��|r#���4e�Χ����X=�#D1@ۏY~�C}�Z�q�@NHͬ W�"���]��DC�Eh�4�j.�zH �B�jyu�G���`�7�	������3t�߸�	��o�λ�Nz�k-���w%��+)w��Bf���X�Ikܨ��R��a�iy�o��c�����������9��Uz��N��1����p��8e�<$�da��T��t�z�<����*�F,��q�� UV�p�z������h�OϚU�����CM��1�����(ϟ�G{>������P5h�(!��dvq�`��g���q0"�;h��]�Ǿ��M���¹H�ꟷ����t��q�c�H*�y|>��+X9 o�iR�C��y��>�����sX8e|��q��֦#\{����H����ң	��
�8 d(=�`r�Nh��^�df���,PԶ��G����Da��{3Z4��{C�j��6W��@/ɞ��V��OkK�дYk�-���6p�$2�z!��a��SW>u�6z�l�Z�&��^og�Bv%��P�J��i�#��t��#���ë�R�?<CN���b�(�Ө�������E�U�E���gXq����;�����xZ�B�B��lN�i�u�l��
��$�I~���%�Gp�o#[���u��s#��}kʇ�;���c�����8�)�k�ĘM	3��Y֌ ��t���/�6�FA�н�ͮ�H��w�]#�������Tj������UzC��P��PS\#�v�H# ��I�b�?=dϧ���k�cb���*�yhct͞Wv|d���)l��j��l4k�D�'R��:��v"ݬ>��T��1�.NǗ�C�q�_3�kj�~�R�?��G�����a�u�����-�Ӝ���feNQD�_��8������o���v�M��hV)<�n��G
O~m�|�<�����k��7&6�bʺ�z��3KY/z����@H�սVa���ԅ�z�M��:��� J�{�m�~3�2@7�����O�f��AT��ׄ�ݴ����\�OO��B���k]�Dث/�ku\�@�Q]em�y�����}E$�L�jE�&������ӃNmtWv3�4�L��ҩ�%�6���:�kP�)O���Q�U)X���Y!�ʴ���
��Z��!��C�E'�w�c��V�C�gT=��m�Uָ��������d��h���>{�;��xɏ����t���?E��rN�h�8p1���	�a��/͟���s�/o�n� �-���[�Ny؜X���H�ugXJ��0h~�v��it]y�4�%�O�y`$s�������o�	%��,��&
�i��f�-�Q����g��i<z�Σ&}:{2�5�ګ�[�S�X��"��g�������f����Vzp��[��Z���P������*փy�!hX�h�j,�j�N� �Aa�{�\2��7P��,��&��]g�jl/��y��E�T,2�U���-���8�x��l����i*������?d`�׾�����#&���W>z]���$?�eZdǧ��!C�)��� 2G3BlN���v��-�����a�g~��;��8��C�jM����|7c��v!���*ӯU��E���EoL��U�+��#�O���]P|�)�X�����,;��f6혹�������^��Fd��!�h��d��ܳ�%���a*�%�,�P��!2���yv�P��$B�����y0\a3���\**��q3�-�|����9`ȑaW��*v��@��v�<���CL�5W�蹴?\������Ǽ��A� �S�.07E��7tRJz�NE{Ы
e��]۸����?E�^�&;`T�B`,����X[z3�NΦc*�aV�I��5�~k���x��ű&0�����ty9+XS���5󭹺h�U���#1-�hw�|����S�.�Ɲ�̉�ŵ��M���/�8��3���&AA�e��A��������?��\aA��s�5�'P�.�{0ҰsX�&��ti�E���S�����Q%���k���?}�?��6����8r�/V��Tw��Im.�\�#<��`��Y�Cr�F#56��)�1\z���f�+9\fA�f���,Yk�Q��	CS�@[�CL!},�8�j�u�!<��LU����&���R&��Ðԅ}ͨp|7�bdȼ	,~�z�C/�����[T��P��	�^�Z���:�%v)���7V���ÅYh�U���O�y��-���yF��f\]6���B�9+����5H��h��+˼�v�?�n�n��T^�d��3�BA魳���O��^�m%f6�\U��f�]����F��Of��ԃ�\�^�%Lq3YhZ��tBC9��^N�Ȟ�C���G��Sf��D�sHƋ�@�:|�w{/z�f�����R�P�T�ۢ.����T�^��2�je�+�����G���<|O�e/��n��{�T;;qP��B7-���W}�֝vg��@�D�X�x1�+�m�;�5Q�X����J�Q�&Ű�U�#M����{u��ٗ�=2�mIW�
,���3�	U9�dz��D�r�_~8�a����`��-*����|)���R�w��s��:D���%Uɣ��$6������6.���9�\G��ݗ,�v�9YF��I�3��.���L���&X�&xTϼ����tΦ��v��_    �b�����2)�re�n��zXS&�7���}�k|���)P
��]�#�lm�P���;cܐ!�~&H�}_;���b3T��m�~Le�{�at�?�R?�L(i�f�V����(�@o���BC�u0���cs��ɹE�ec�5�f���5�5S�N�/����:T�Ⱥ#ʘ�$A�?��H>d���l��� �����b����Pa�(�x��g�"�r:�hͧ�����T�z+Ԕ7���/j��I1(�R���A��9�R�"�l˵N�N�%�(�>'�_wE����[=�d����Z�̩�7������ʁ,�꩔�v�Xa����g��d_4����۾Ֆ��k۪����J��\�%�����P��(~Ξ=`�5Ӆ��r��c��7[���PQ(�����QlN���@�pk�#�.�k�<T���p�˭���*�^�l�f`��<�>�+J�0�#�ȥ4PU�r��NO^��[s�ǖ�ђtW�1��%Y)�=��C��6z<懺T6�}��C+WW6�g�-���(*�- ����qЃ��T�.r98$t��Q��.�Rh��A������G`��A�1���zt0(��g����mIp�v!
" L�������A���/D�//��Uv�L�T}�B��J]sƄ�
*F��P�k�"���Pq}�����J{�xB��e>��u�q ��boDS��C��õ�u�8�ӮR�Jb��V�Fs�d�_��7�t��)w��Q>���#��9��!:j3�`��;�*�1�V��������@Q�qip�U�b\}\U㨩U���)��
� �1��>�o�k�X|�9S?����=j�0�<i�\��g\�S8{�
��8�������PA���bЈ�
���1��R�8cXm<ؗ�<T@A ���ǯ�Kn����Yk�L��R����J`�W<4;��S.�2q�l�¸:�%%:{���3y�{1�����b{��m�����v�PQ�hv:~ۿ�u�n5Y-MJ-������9T��^���S~|�{W����v��a��%��.W!7ΗQ���e���p�/V��(E�|��M���|�_� G9�>J�׶0n�]8IM���G�ҙ����	�UP'��Sv�䭳�!��fKk���4Z��8��%�B�
�\��K)H���� �Aꮾ�x(-�Ԩ����iC�"M�������}�
I�i>ҚnRpy�z� �p��g֍�!���E%$��&�N��A�צB:]N��c�nO�ӧv�1tk:�;������ �c�*2ͺ��-tŐ��5Z���6�z�釈!s��Ҟ\뿀�%����t����M�f/��-���g<0~�꽫�T���c�3��o��x�Ьe�x\�n�g�T�JvT9���эms�[׫��Q���JU���e;='��Z�GJ��P�S�Rh��:�i,���~���P�[z��dO���d���;�ó�_$E��ܛeO��sK�L�4��K��fl��_�!�q��V-o��_����:����t��j1-�]�]�*�
&�"@)'Uqg6��V(��%��	�1w���Ь0Ǯ����͉�*��$����9�᥹;	"��37�ò��)~@��+!xY��f����t�KmRgF:��hz8�i�v�n/w/������X�D�R��/����y�vf/���0��O��Ta��(M'����yק]�M3o}z9d�,�+�~`���kA�sW� ��41j�ʆ��ܗ�	�p!����7x�̡#eGf�%�j���;{�p��蟢�^���-M�EjS��5�����u�;7� W���f)��Kj���.0
4��r/��l�֌��\ǃ�I���WJ�7W�f{�Nd9wC�eH2V��hy�MJ�;g�n�����qߎ�ǅ ���s�$�M�]FC�_l$�hMFCe�A+��O'�x�.����қœ��v	eO1�.��y�uY�����a_�×}A���>k����Am�FV�;�P�����phn�CR�c댓�z�R��zJ�uv� bX�?f;�Ȕ˷f��8@0R,��r!�0�cB�� fүY��� �++�qi��b��czU�|u:�;͵ΟZ}��ݏ[H���*�J���!5�SK���6�a�����qAJAEI�ѰR��FB��o�b ����ʷ��Ls��\Vm�ը�d����4���}��m	�X+z���DC�o|2�A����aGz4I�M�U ��/ߒ�?w 9J�O��	n�<z�aĶ�W��7�U<2���C�%;h�jK����2I�i��{��y�X � +�Z�7�fA�YLIj�:�]����U��a�N;/z��a�����ko���sk˨j�L�~�;S��{���z���o*��tov:�����US�%�?�uOJ��擬�E���-�s���d]VO;9�0y�]��Kͣ1�U��dH?4���:�0��$۝��t�=�F�hZ�k��%!�d�b�m����U�D��)��r��_�P�X˄���Ο|-է~
$;�0�-��s���ɿ�8d ��.�i�<�4�hP,�c��f��PD��T�;wYU����5n~���<��HCݽ z��Rs�.�� Ï-�M�������{�@�hܕu?�d�W������tC�~
�Ėn��),��e��~�J�>u�Ťf�:7����$��´��?{�����;o���~�]k�\ko[�ưz�iC�Udgu��3�Z��-��Sk{B�����2V����כ�+�!�w-~W�0�=�����á�L;�fgϧ�[�^0�w��C+{/`U�o��Ew}�W�T�]y��s��^�?�����ru	����4Q�g�$���Y�c����ǻb@�HAL2��ۣY�`����b7֑NKV���C�H`d(ک]��>ˡLr�����з��ǁ/ݳ��쩹�°��Yf6T�ԫqG�
� I·�.{m�������et����q�(Q���>{џ��y�D��b��T�6 ��F�#�1 ��%��.�+� ���%��o��(���&S9u��Ck���N+SP�^6�	�2�uJ�HҜ��R��}lDcM�?�B�G�5q�?J�R�����.�f���P�*��f�!�W�"Ko)�]��_,���*�s��7��gF��\���V�Y�	sS-�Q}�AV�J��`���e��I���3%Y����T�ܩn�"C������K���t���&ZG��<���(�du�� +11=��/�G+,�[�赹˸���<�դ�m�d�ϭp.�u�X��#��t�0yc J�!?|�ߐ4���D`ӖT1��[��
b�+_T����+l�{��%���:K��9)�D
��˫��%r0P1����)0��K�*��rb�
����i-�+���/��������0?���T/G_��̞�N��ڜ�m�ݜlp�G��E1��=����OO-�^�5��ݵ����f���;��xo�ش�����,�wX��}5L�%Cك���l���11$��ғ�3\9�,:AF¢��w1�$V}�������.����E'<�e���@�S�MU(�O����ER�����+��JD�Zn�l%�ERq�_Ap(#W�{�n��W旒Ok�hc�h�:�*�>���_+n��l<Pb��������c7��ݛ�<�֒r��Cy,P�:1�"x-�������a#4U��v�Go}Ȏ�*j���3龸��3Y����{,h�J}8[�S��	�I��'��i\�H�@>��U�ourU��k�����'@���<�r|2�=j��@3	p��iuFuqU����p�(֝������ӄ�n����@�Tە�BX�k:24���_�T%����:������;oxa�� %?�q�T��G�r�HJ�N��O�"^M4��D�`j�P+�#��9,�܇������~�C������Z�2L4a����<u�qՕ���(F���ZT���HJjx�R��&�x|��M�ģ<��S�k��    ɰЍIu0kmr6�I�Uv�]׼��z��Z׹_mf��B���"����e�O�ϏY��F��ۡ��Ț�7k�qA�E�x8٨��ԙ&��Bq}Kd�њ�0�,�l�Y����
C;��By��j<�i���5Z(;�`#�5!��F:Uyr�ߵ�d�ĪY`�)��f�qT���vcM��u���b�����}g�=A��f����J���O����#Z����R�x�8N�F�<M�3�W݃^j��[��4��y%�u�^�WR�0��'ĝ{|�
W��N���9�_�8�t^y�%w+Υ�c� <�����@�K_��?�P��ha��z�9�7�hEpC>#=� ��c�6�w�^jg[��RM�Yk�8�]��,m�j�;�5�y%C=r#�������M\�κ*�x��2]����h�%�+]��OͲ���\q�P�Vʢ�9.(u]�{�̘�7�6l{�>���z��]�jGr���(:���-��ӋhVn�:�>D�bS��Bm�-��8�O^����58�?g�%Dkn�L�Q�%��FU��B�9��C~l���\w9��t�^�I9ZA��k[��ئ; ��k�`�1FdH ��K~�a�8;��rtM*�7?+�T��C�'�4�+��� �}k4+�Oi0s�Xc��E��=oڵ����U�' ��B����p�Ԛh� Y2�t����  �t���M���^I�n��ד���cqg�I�ĶKN�#��Dp�%'���#l Iui�Ϲ�Qe�gӸ��R����q���:}�w�`Gش��ښӽݻy�����Μq�C3p�I�C�o,'S�\(�0�;���/CS��G_�0�G C���-��Ş]sK�s���BL�c.t����q�bAcū���C��v��RTXǹ�A��V�4�KB˱$h��w~	��}{�-��K��X�?�.p��#����ҡ����K�cG�[f �Y4�/3���Y3��9������6'}�-ޥy�B�i:����qw�r"�0�֣��������b��#���j`��h�5�2"}*N�!a���,�)%�
nUQ��������Z�Ԕ��;Z(�YO�!��MON�<kl�3��8�"�?�G^�DR�ٛms��e�7\�9~E��6����u���7�l�xx�s�����})�OΝ	��CO��9�5�@E�ꦙY�=d�/���E��-#z2&��A��M�E0����[�'?���)f��H^Lԧߖ�--C�mliC�/i���%hz�����?�콫ՠb��/#a�_04��w���dG���s��y��F�t6�7$��!5t6����q��>$����_x���/�wtU�i����5ͣ������!�"�ϼ�q����X5,Izl)�8o�yb����<1�E:k�vǍl��!D �beM� �=�C�����ɹ{���<<�0��e�B�@j�[q�;�W#�T =j�LX�qw�Pϳ0{@+i���n�0J�������JJ�Pc؝��Qc�|.I_]�#I|=�K��㠗}'�tmn
��mƉE��Sҳ�>d81�J#�z�1�?nQc��2��a�zK���lv���վRr`Q���n���bzn�I���=r^���%�]���v���Ĥ!�d�J14���m0ƜH���M�]�`<�#�!�P {�����-���m�[Qz_,j1yKp�E�`�p2����M�����!�eO]FT���5��4��J>M��r�J��qgv0��/`~�/��-\:&��=����
ƾ�$��t�h�]��xp�����}�
$��6+7
$f`1b Ua�zZ�sw|�ڜ7�[;�B<�&��nT�ds�P�n���-�^c��<����#���K��!�H�"���9�����U�F�D�a�US)*���Fu)�����]��ɩ���cr�ʩ�ݕ�F7�ϑ��*\oo�����Yt�]�v��;�p�f��㰖�Gt4C4��{���L���Q}��$��.��ΜLB�/���B/��n�؎(Ci��
{ˢ��P�ZގA��j$����CƑ���n��S���o,�7k�o�X՛)ǌ�(��ا��a�]��D�	��)!�����_c	/���th�k*��igt�̞nCŀ�a[3�y2��X�۸U�mo��qc�8������Q,vK��u~&�o�Έ�����]��_�c@��ó�)���^*$mb	*w=�Ϲ��F�Uz��lǀ��r�\[f��jF�2���=6J�(Z�?=�����G`�U|�y�j3���heKFn�W.}s�O]2��2i_��0�P�p�՛��I_�t��N����Xu��V�����tؑ����-^����Yﻛ0�@�Vxߘ0�g����7��|�uYU�`Q��m��7�Eiة�_d�E�����M���K`��E��zU��U��q�����0�R�:X���&���aB)P�����k��E_�XbY�:�#Q��R���a�(�j��[O�§RE���4-�i_vr�����!{yVQ�f�\]�{�gh` ��ghwo b�	?��M�?錠�S5��M�R��� �H�hZ���ЕBX�\-��e�@�V��g/�k�X&vC�K芢 �'�|+�s��u��&��=��eO`�dQ���j606.`R G�ah����9��jh9[�2�L4��W�k
ƃ C7�'�V�T��笂*�K�S���zz@�����Sf��d�Н+�0�nLa��M����@�&;N;��^Fs�θ����`�Ψ7�Ԩj-�3D���(�o-$��������F�V!ʚ�h � =��],����6�o�>);g�,�w�we�B�}7L�����9$0���va����Z����.W�h7�~%�.�n�;08٩�j���X]4������a��nѡۍH���
���;�4��$Z�F6!�����U��4���|?k�a��������_�rڽd��j��.����H���:��$e֎�2�hQ��+?L,A��[�k�E���rӮ�����i�bq�����?�J�����E��38c
�)F�G�;�Ɩ�����)����Ў�I�ε�I�A��=�k�Hݖ6��h��2�r��[�=�=��L����<pyi�M�a�)Qtw~����[H���e�`�Ѱ����|zR'��Ҁݥ6	��0�1���*%?������5��a@�ˆ�RKw�6�#�М�h�����x��	x�	��2��$�_�O�EZL�Zi#w�uf\&m䕬so�a��d�%̍��z:�.�O�^M�ݶ�]�"���m8����	��:���վ^]E����v`���x��v��W��ە�$D�s���]C�_��B�f&���x���$^�l�;pek�"���U�0�WH4���n�8r�f����.�����q����`��TqZs�4���z��KO/�c���k�gw�>k*�*�>��G�D���M�7W'*�}��cR�3�'�=T���������ڥž��. U����?U���PϢ=4�z�i��C6 	��˵tV���0kFo���%0}nu(5��~aO%��bI�$�e��v��ma���q_��,���r��E	g�n�� -O�3��W�A�=ri��9x�=rn2���,�!Zg_�CK��m�����>1�6���f>�z��\u(��!,��?g���� �����}�\j�H�ZP��HW�`_���b�Q��ո~h=V�C֙�ڜ�=ǁ�[Ve����b)�e���n��o�j|}�)���>�)6~%��o��X;�j�K���F�ו�(�zv����������"��Y����Hr�,R�$��O��(><dϠ��%6:���z������o�xF��*pr���~�u��g�N��Q�g#�����u�;O����5t���KVK{$1ߣC��@��ϧ����ت���#gDZ�נ�	�{j��P�GsU�زᣚ\��s��f.h�T�<�����!��>�<�l!�����_$(�    ��B%^�6���*iz���zz*����sV�8�u��<��3T�5F,�B�b}�r�
塝)ԅB�uD( �e;��B(�����WL	��ę�'(a�v� +�E��GqD9�� #{�z��J�ULM)��d�FR���ך�JW9�������һ�z$0t�܃�j,�V�H{oplG��&��Ǌ#E���׼�Dh�sh�����9$c�/@�k�p8==u����Ѳj���1Ԛ��- �)��Vڎ�Zc�~�H d�a��C�����H���x��1�%��1^�T��e��`Q�V���Вl��/ k�'���Rb��VQyh�>{��),�/��}�1�<��D�)����,�-�B�rlC0�O�CK�)���&�$[Xwo�V>bt���m���܋v������1�k��{	uWFfBX�Z)#���H^H;1��L]�/Y��4U�8�}"����l��z�`q��׽�T��q���<�y�â��?<4&n�V���c=��y�f��ة�Ϲ$�V:pm��ϰz�`(>|�v��ӟ�&vVMP�ehǄ�T22t���6��i��7�	�':��Չ�\�T�ݦ�F�&���,b^ՙQB���	�vJ�x��ɨ��ox�0r�D���� Ege("
y�ڕ�ms��E��_A\�'ӵ^ٲ��M3.y�l�@g��%�8���!�ؕ���=.�z?��2��-�<T�o6�_�(^N�io����C��S�9�T����F�!F�s��%�oٗ��27}pg�g�O�X/iHk�p$@��K޻m7����x��Mu�8\R!٢uR,/嚋a��ae�Rl��X�O?��(WM���DN��]��;��5@���f�i2W?8[��
R�<�C��&P?�@J�	�c25��;B�2�5�"��(J۲�{H!�FRy1Q@ަ
՝�7��<�ݤ�4)�@��?O �.#�}�ʥ�� �~#E��b��g�f�}�>���fu4���~Q50��i���^��,c�ޛ�>�����u<��1W�\Lb�xD�F�%��{�?p2��4ȋ��+�/�mz;Y�Lr��	;맼9��m�Gpr��W���LP�3OE�V+qCq~�z���2Q�9���6U��>ɦsuპ�S[���b�Y���5���
�k!�7�J�ޫ�w[������tջG�x����殹T�@IC���e0����d�إ]���I��U�I�*N��T��8�w�"�'�-Կ����$	�u��M��P�l��e�*V#�c�M�|���
0ι�����>6q}�MV��=�EX	�½����)X��`fb���_<UM�2Ymc7g�k�Xj��]�?�V�]��o�)�2�d�:��8F���	0Pk����H���������2H��&]7��N9�Z�6`M�Ů�P>C��f�f�� ~0�0�٨�s�˼Z���)�@�b|I���z��'�i���Y�R2�/X���>�z�3�\�!4�tPDZ��H/�S9��[��q�F��m�_\��l�o��uW�R���V���D�b=��$Y'�*�vO�\&)6\�������"�(�2_%S�S��α��5wF>�vx�]+��¬���bt���4	��2M�]�i}���sʸ��*O���� C�6MwA^����~˜�����-k�iDwN�O����@����.E�ݦ~0c
��9F��-��7��Ԅ�"��;]���q[�2�SfE���UYi�M����>	�s8�h����W�C�+��.�a���Q�a��6��&lV����k�˭�Ň�;a�Q���koY�AA�%�&���Q����4�h���[�����gpZ�<�&�d�2��Wwf -�q����6{�D�J��b���]�U�m2����v�
P��H8-z�9VP&z�C5�,z���=�Y�L��L�U���;�P/Ũ���j`�L��>�S'��,͙��P��[UC?��CC������+���L��n]��BS#�*�te�y���S5c��,X�.����=�|\BC?�I�=�8X�k`�z��xG�;Q�)��h&"�h�1i ���y�����<K�eρ-v.]a�e��1��v� ߱��N�����Du��
��x������
:��Ma��^���~�}��գ��ߺجfY�^�bY�*o�Y$##;�
[�ja����aˑz���B=OY��iV4��jE�go�P���앤ܽ����%)'���1��Mi�1]�~Й�Q��
���Ѥ�t_�TE���`����Vk#�c�w�:��9��{��!��*Ɋ�r�n��q�t6D�43���em���K��N�TQ�0<�MّƸ-X5�~�I�4Y��e�o�妳�6	�C(�6d*RbBD�lcY�?6�R���v�Vت������P�K0�ޫ&T�W��9(VA��q��
������0,m�Q�Ngu ��X���V?|��hCЕJw��:Nu�R �x0�S�|C��i�e��tn��B��y� �о��q/���"fZ����ĳ G����HMS���%���va����C*��̼i����m��j�����I��E���I'�*	c�"qR����T��5��w�V�S��̲ ��:���A�fF�"杼3�@�!�����%�'r��],Ӡة�~���թ����T6�א�����%�T�}��a��TI}��s�><��\~uN�i�U��N������f���_R�l��l��+6)��l�6L@ U��H��ꇪ?b��o�b6)V�Y3�v�	�����M����GH}H�`�.�$r��`Lf��Hc|_�)�U����y�
nT��[H_Юn�P	E�� k���Ւ�3TZ�:�3���D�,2*b�	RܞA��HG$WR�L�	���o��$F'�j����IX���eB�j���@Yj��
�]
�;(�I�s��(x�� 5�0�h2˒�X�@_	�jz'��y�9U�1#���8�cF�Z�J�o���,O�Wo��v�V���}�X�A�c�Os��01����h�.W	Pʖ�^�ϴ������ÊɈ.��j����fނJ꙳}�T??��.k0̈�PBMn�zaͅ���[t���Ə)4K��]���>Win,�0q�bi�zL`�QJ��^D��S'���ԙ�o�M3Y�3�e��Zh��&�bY_z�*�����B4F�CRR�AUa�)Hc��pc;Kʊ��jg�kɿgh2�o�@��f��fm8O�"u,��}��w�{yb^�a
�����%]&_�m3ar��Ȉwa��Z����)4W]p��Ƥ/9�A�&WNcc�̆�����K��A�Ϥ�FEt�)�M���� k��k{���8N��-�o2�s��՟d1��@�N�N}a��t$"fϩ�tW����Oz�6��f���HM��d�׫���֫"�<M�Ү4ux��L��?9�7|%�EdE�J�@Y�ٷ;A4"f\��������:��N���j]��D��w�sX����~���j�2��l���f���F�q�Fo���F�r�6nc�*���.�ZK��tfx���� r�ϘuX�A���S5N��HT��Cڰ����Ɛ�y�'�u��>r��ng�Xw/`�ڏ;s��@������ȋ�vq(���Ǳ �8!8�H�CY�	�#%ʒ�^�Ld�U�����iДָI� �&�5+�'Կu�: �m% j�l' ��Jx��vo�b�N�4��.�M6K�.T���H�4�Kl��k��,�@�J��4nH	���Ja@pXh�B�9[9�Pώ$�������Ń�A������A=�o�:B��N�Ѣ����Zչ��	���H����1F��֝�`�?�8���ϳ���V�cr5q�?�>��Yg��L��s
%ם�0O����>$�7|\�g�=�\^��|�97�����׆���q#KKۼ��	��N�B�(k��+̜ͧ����-��Ү����p�=��&Na�{J��9> ���<��KURϳ���Xl9{���4����g7��e�E܀U��. �6�n{�ؾ̬Eԋ���/�1��ds�˟� Y�    (
S�35zpF7��h`�h��m�<��{_F6L¹6{bu�~���B�X�|]�� z8c15��6=<��7(�h����~�5K��p�V�L%D�6��^QI>�3n�f �߫?⟳���{$�aKΣ4sE������K��d(��������'�z_���>ё�]����<�Q+O���v���&�A���d
�>�a,f��u)m����8�@��/��̓I:Ig�9�&�^刍��#i�KLH���c娺��,�g��m��U#3ި�$j2����~v֪6���m�{����2݀j�8��8:zd��Y[Bj�w�PZ�v�ǫ��p�����]�~�I,��x���wUčD���r�k�����4ו1(�co��]r�c�09(ՙGLϽe;�9���w�7�1��(����fay9 ��M�f�C���N��sF�N���w�BF��J+��Cbd���K;J��!G�f��$K�i�P�婻�<c����4n��TE�cHJ�� �-*���"#�� �dUi�ǲ�;:!�n�D���,O�(V��A�vD�@�ujm?��4T.�}��iw��nW�Ju+-␵���ܾP���D^|I��I�ɟve�w^l�����/8t�.�]�v4$�KA��:N�O�!�	D�,��Ҋ��JX�<iڢ�X�qs��x��I�&�L���ӧ{U(kt|a��̝	�L�6d������1Fi�P�J�u(b�ιn��Ho��~~��*�ic����@��1��Ǆ�ƈ>N�(G�4�	�pm��F��EQ��*����*Ф�DY�B�-��zY��n{fᬨ�%����b$v�qo�Ԗ��G����d2-�˫l����ج�����ʪ�B�h�-�������)M��l㙌Ҕ��_�Ցy��ާ��if�U�@�D�t5 F��?qA�N����s��X�#H�,��LǊ E ��v�@��{?-&��;�0����_�Z��/U��9�����"dM$�̂�A26�ļX��!�oP>S�ۮ�� N�$Ƒ�N��6]�Z|�u"��z��t��x@�d�#X˶t��<�(%@�(�3��3��l����t�d�)J2��x��:N��Շۘ��)�]�N��x��Akg�Q�q��3�×c�P�]��5�{;�Y�K�|&-�>)�q��b�.T�X{ف�%t?�B2+q	wH�$�
!6>��B�½f�f�ɲ^A;gv�X�Oa�dv:\�?V,�qz	&�I{}��lG}��T�1�q�!�_)���\��L���C̹�a���Y������,#u&�~[	[[
4'�ޚG�[�H��<u�8�h���N�gý��1�4>��=���=C���d�38 C�X��J����X{!G��t���
���[@���J�VŐ]Y|~x�5V�],��M��f�!p��𫇚5!p$��xT-�|3Q�NP�5�ιdTo�^�G�l����Q�L�t�m����9�~�Ҷ���{{�U˖� �%��)9��f	��j?�j�/���[����H��G���P��@W:n��P2K2�5��\�a�����r�V`���7����Ӯ���������������٫V��M����Ѕ7���N0�T�Gc4OW��@n�]���Ty�����.Y��P��y�Қu|��8�瘴v��g�#:�5V����4A�n:�)�S��{;W�겓}��b|��TwS��b�&��L�=Q�9���ƵI��v&�Vn̳Hk�ma.!�~���]��9�Aո�V�7T�]I�G_E�I�������6�M�27�W/2����B�E��S�Ǐ&F���I�Ig�;��a�����:�7�
��͉*z��#�Z������@�Cht�z�[p�Cj���D>��"w_w	�=��Q�p���wƊc��E>����h(,w�w�M?�.1Q����6�~�2򤳣�����_�/B6X�Q�O�B+��\�妽*4n���6�f��y�+��DX��3�ݠ���&mfRO��s	I��B�GF�%$��+�����'y����/=V.w7�U��e�r���>��)�w����O�j.��Ǚ6Űv�@�}�y��"Թ�MG������C�!n>�#`�]�XA�(�WI��1 ��q6�� n�����4V	����'E6��%��5vF���V���3�V��;:���e��l�OC�R��|�W��7�2��|3I�ы���j\?&��+�#�i)bmV��WQT?��yZ?�!����ke�78�j��:��)\]�"�Kq=�h4�p�����~�M�Y�G�}t��a̪�c��g>^^l����S�_��o������Dz��XGB hhHT�?�a����;��x��*Yma��͒��/�U�������`Q���P������#cB�p�e�.��+�P�����$ǯ_� /_��J�h��(�=�*-����Z���ʧ���64K���4~�p�[4}m�o@�<<��'�0�RH���w�Jb�B{�(Ru��m�A��pbn7ݭN���>r0#s��N�)ݍ}38�d��j��ȑ�Q~��P�e&��)5T*n}�;fC|}F�$C���J����v��Y{���?��K��֛�jK	�������w�r�=�~�?��\�>��,{V���Eg�Q|�������Wѣ��*�D};��|*^�vн�G�p�:3EQ���'��M�O���x{u��!jF�������e5�R�[�<�u��H�Zd&t�!�M��	���è���S�R>��*��K�H����g�:�P�E�e�W������|{>���cy~;4&���9tc0�)�-�Êu��b��IQ~x;���\>�/�2��lQ�o���npJ�#��-*�%R�1*8c���мT5hps8?���� ����R@����s\{j�p8�`��h~x.�/�����N�(a[�7{6s�z��!��˟�j����۱l��z$��-L��Q�g[�4gn�G�r��S�M�1�k���-DQ��1h"��к�")�n�K�*/��O��C�X�)kzL��.`q��bB{*F�Ӆ�?rT%�8
���I�:�v�Q��N��\l�Iv���yw��(��-Ƈ�29�O�=�����e����A��hs5�W�(��G�)D��p��#�#U9���ן��n߉���H��;i9���ޕ#G��䷇��s0/���T6d��%5|wf����z(Eɿ���������ӝVlH�-~!�I�#T�K��Cpw���ӵK����&�k�аE3��Y�1Z=��FiU$Y����r��;OJ�Z+l�Y�n�&C�$��U��ݬ7��v��psw�,�K���Q��`�`:9J�^^�"���t��t�4�y��l,ɢ��w��Ra �������s�T~��,Š�_u�+E������|�$�r�T�t=��O�����1���
�#R��2��b^�����!��?`-�b��2���U��Ɋ�Œ��E"@���r9�|c�{� '��D#�$�~���ȑ$hQ���dh3� �ш0�f����'8;�L����4��:}�M-�A[�9ϓ9��k"��<Y]�GJ�pѳ�����:���9+���r�kd��������t���~�YN{\�ؙ&(1���#k@�y?���{�䪊/��K�Ƶ��{�i��Ž��������*��!�s���� "k�ޢ�u�}�R���C��K��_���P�]?�"2KN�*�֣��7���h�
�R��A*Q��ɺ�k9��k�c�60����a9�xa��7͊���JWU�9�@L��:7G:��� ����a
�QĪʼ�l�.Ti�o�l%X��J�V���ҹ�$Q�9_A�B�4;��,عl�Åbx��a�
�ռmds����������ÌD���� ��,'ė�Dh��[$��H�v�����f��f}�G����W�	��f�c�ƾ^k��<�8���X�%뿠
�PU��{#��\�9�&r�]�7>�?;����[�߇�t���[yŘQ�ȑq�Dh3���~v�W�
�    ���X����!g豮dcj�GH�5�8��F|�`J����~�&�l2�a�3+�PQ	[����H�1
�:Q?,�&�J'mv��l�S)Ɔ�����k>��2���V%ѮXZ;�ؽ��Ā(¸5��}���9�p��M�x ����Ԇ�P�ܰ��7O�OXRU`f�#Y	����9����Z�5��O`����'�}�g�Ҥ�27���+bL�z(D��<F�zi�E�����3�א�p#���\D�s�F�&�X�tU��@i5(!;�Ҫ�9�3��\gȦ���P��9���MA~�����Iv����]߂8`%E��R�b��H��MG���m�9p���рK1Q��՗��͏\(��1�Ui^�C8M�G �5�[S.��4[�O�ԎJ�>���Y%}b��XŜ�B���U�E�
��L�*��e���;y��ڏ��4�D��{n���R
�c��ƳCI���|x+������tB�dR��o�$��v�pu��,2�ٺW����z�����I�w�-�>����V%3~\��n�ԑ�c�8F���:w^6lg+��R�jg[���_M��dHCY��w��v��t5�Q(I�ұK2O�$GY��R�Cya���G[�'t[b�(���q%�&!�����<�g�.-Ì|]�ϡ4�0�m&l=�(���3b e۷�ؾ����`�f��֗�b�y$SM�?�ߑmn�Q�Z��]�6�z�&X(�~� wt�1����up� ��/�,����y"Lh%�����'�M^yoګ��>e�5�͔�C�O�OpR���X���1�`Fj��&)�^G��c���F�D����#D����*(6�++u���LF�e�Vi��φ�w�UK�%c6S�h-Y�l��%#c(�l5m���rC8w�RPL�$/"�e���.�q�����u޹�0��@Hxh�Z�Xz}$E�X��~U�)�F΁v�<؟��1���y�ZG���],��md�����09��D�u�k���>
@���6���b�Ki�$1R�Į8̣��cu�)#H�Z���"�f5�ԯ�ea����>��JV�	nѬ<~u8A�z����.�E��"v�d��f���}�pRU�SuF�Yڭ+��v���Bf��X���qO?�Z�����u�� ��e�+ԟ�#�ssH������y�^��%1�1�g��t�֛�_� KV�ٵՋt�tLs�����ާ�ʐޖ5�&z���Ibk+����؈1�(���>�n������B�W�ɐ6���~�T�i�.�/�|�y��_���8cf1�I�R�U	�y�%J�[v��� �m�ōp;���\5y1O��O�ʤ�1����V(nzJ�5	]`�WuP�d�$]C]�E�d�6�!w/F��C�_5:��!A�t�����%Y�Aj֋�S�ظa���O�n)5�$K��K�J�1��PX���40��P8�^3�8����zs�f�}�!���Prn^q6@z��P�0]�_x���d�Y+ς!a4��3�z;�&�>M�����U��6�.�@�2�u�!#�&�Lo�����(+�ewN$�����V�yla4������+�-��π'g����zO��泅�ť �
x���>�4���WI�㙄fQ��@RF�^�����w0J��\�·ףΈ�O��D9�qK;H��7��^�Q���=��`����C�/7"[+x�<8~~*%�xn�<��WR}5a�H����$»��b#��v��iI(#���\GLuկ|�鐗�Iq#�j���k<�C�&��l}��U��q�tG�&b|�"&o��z���A���<3��Jfk�������G�L�s��	~��j1�$�M���R�;#��QЇ/��F�/ަ� _�[I&,_��Y�%�-�F�&G���3f;���a��R
��1��N���QC)��2�4��Б<���E��@0�U<V 6���~A)an9f���W]��շ��ڄ�t�`m)��oD�u΄O��f/Dv��v
�Es��!4*6�
F-N�q)��<�:������qr7jÒ0��:"�������xo�Ӄ��y��J�?�$n�]�&����؃9�	9��M*f�)�g���h?�����J}EU�9EK���5������mc�oğ��7����۩��1g�C��L�sK�����d�&��8�D׬g���7�Hu0�����q��P��%�4���6Y��)���fy[]vwW���1��1-ᕵ����ܸ1�h
b�f�~s�L�bm���դ�A=�]�&��<��z�I�T�/�L����t7�$�v�Bl�p�a��$n��1il�����^�$K�A^��)_'����+2{驳��+�����Sϰ����o2Z���*�^>٩��`e��ܮ��-��(�	#�q��:��)MH��7��:��֜�pxZ�q$���͎#�_O�	lh�]�I?���NQ����s��n��r3G��v���.�Q%��1�ѨRߋzi���t�A������GL$�26�aՀcB݊a��	I�<*��3S��f����~9aZ��Υ����H=�Q���I����d$�V�T�/�����;n|�����ђ�r���M��s1hǤ1�vWi~6��ϸ��9�o�^<���#׊�Y�i{��H�
��*�'�]�*S��g32����E���F��sf��c'Jw�;��F���^E�����im��oۥ7A2ϻŻ����$Έ1�CI�Vz�秓��t<��$+v���u��5kLj���+"G��q�H�T��i��L�p:kS9U
gK�zML�0/v�`FИ���.ȓU1[�Mx$���aG�h)M�:���p���Cb�n��I>�`�ƵJR��q�V�y]%�k��g8�b�{�ڌ�����v����q��4X�:n9ڦ����.V�2�7}�̓�-���U.HUM'�
R��}?�@�Ӂ}]���/t5&����"mL*�h�oL��ޢhs=m�B�]�*M
� [�+U���Q�I�a�z�~y�-����-����J0�O����4��A�q���tDz(�55�lՙY�Ea�l�+��SwJ���=ol�os�:�
Qi�m�^T����:�H�g���M���32&���֤�~��1���>�.��&mĒ�C��q��$]���/h�~����ڀqgg���cm"�$X�Z�6���!��ϋ��[Qfw|,�L��L�U3	�!��w<ʑ���b��u�;����*��L撮���*�Y+�{<���V�f�x�z����$�,�ZjL�9�A%f����w(
�C�j#MHj�ޘ~,Cm��s+����zKI�0ʓ��*2Hs�]��@8���%�=����i^	�Ev��fw���Nb�J0�o:#[#ao/�j��Ū��nv�h��Hr����&B��WYM�͓SGΣ	��w�_g�$U�ֆ��f�}�|C4F�M����dw�I�s���+Gi�*�ƌ Bhox �.���wLށ�E��u2y'5�����HSm�f~��۹�:I�q�(T���sR�b]��,�f�z���o�?@�:F,J�ޘ�k�)W�H/uq�8��?ƈ���z��a��~Ug�9�l�i�`�ԋ�-���� !�1,���������^mR[�rީ6���L�sغ�x�'S�Cͺ�~2�% ��#π$ZI�����a�h<��}��O��W�jh� P��v�2��4�*ڸ�f��&m��gxi�r�6��Z݆:�1�{��?��e.�z��*��ҹ���^u��yJ�#iLTh�¶��9��[L��4�>BF�JT�1�:0lM=>�C3F U�OVy�T�n1Ϻ���:�4��8�P��Xl����x�'��nMP`��$C�i�E�fs���V+���q#)Q�����"[oV�`޻�E�^cT3�	���=����T'���X�:��m:sc6@`j�,O�FG�>s67FH1�&z4��v����F��8�p�Q���$~��4�Ca���ܞ(��;�s��h;4�I�cD��t�.��Dݭ�{��]i��|rm��i�x����L�a#�M��.�ogln��w�op�#��^[O��f \�    m��f�	uR��tp�˸�ї���SH����n�D�Q�L� �����žQ���iw�aĂ�>4��Ȋ���f[��i2�T�Gx|�;��c�TW��hR�H���Hc�Q�E���1�h�R��^O���#Z�D&�.�^#�a;4)���@�`���OfԲ���Ч��?3F 1Re���`lT�!�b&bA-��*3����$h*� ��UWm�*�����V�B�?�I+[Y\�?\ƈ&�����;�]����C��1A�x�5��Dw�1B����˾bH]sg���1�b���u+��1J�l���=���#W �b}2�j�p�i�2F<��`�YB�Tg^��hH캻��+W�������#�7�"C�i%��#Y��vH4B�N��%��Z&�^N��+�DhCX[���~�CH�c����1���x��8$6�7�F}/�[$B�m��\!�Hz�����H����VT�J��(F0��!\�+g2�u�v��m����Ը�K�������"^8!:�)lG�D�o+E�;YU��M�;E.��F"-��`F(��Ť�QR�mq�!���l#���R�A�zO{�[��&����ޢYMR���B0�ׂ���x2�7۸�	�VyE~�H�I�O� �X!�Á��[4՗W� L�a��/� ��d��4W�:�_���:)XVa�
�}�&t��M�k��I�_��`ɘb3��:��W�2l�i^�8��⿈ㄓ0i3T5˱��豻��V�����o�YRL�5JV����f@Q@}�p,5����8,�;7VsN�1UO�}ڙ~Dâ�����m�{ӏaN�cD��4X��������R��4�jLpk��w�.#}>���a�mi�f��v��-n��=V@NA��1�&d."�!i�\���b�J@`(�2����]��,6�ru�4����E�l$�z��~
�|0�_�ʰ��bg6��#��`�ޥ��{�L:�.s��#���~�s����ZT�!uPogˎŇ{�du���k$��F���S��hg�H�YtD�Lj�LA����6��/D�b9O��
}I��i����{v�Y�l�+o�u��$[�k0��Mw���Δ�5���<RU����5z�j���)a�c�D�|%�*<g�� ��E(��XH�!m����=��o��m3�����ɶj���!�}� ��4���@�1C���1���Z�8�`qzv2ʵKy{�	���tA�I	V:��7]P��uê)٫�d$�]��Ȁ'�M[�s�*5���֚�CDJ���v:��/A~(����� �%�m��~I���F����X'����1�z�͖3lK]��K�.��D��oo�`U�+�Nh�~�lm�������zaLB�*���IuD����!�?ˇC㟢�ę3�1�ӏf������@������\>���5ؖo�c��->�0ɭ�����W�$R�/�$huy���v�Fadw<PU����q��bHѴ|(�_������sOn	���=/��RҜ�r�v���ӱ�!���,�o�+Chgݐ��2�ֺ�
ľn�c���:q�yrd�u�j��K�r�1+���9=?>��|<�|�JZ^|�ݱX�:�E����
�$��,rE��<Kn�����d�5�vU��X!(�<���;-�T�9�Nbl�Jjøj�^aH=�P�Z������V��3�X23���/�/'<<����/��g���O��;��/���h�0$.E+�%���Q=0������u(I�ulk���V_��驄�z}9=�-i�)��?\ۜ0m�^�{����զ��>�u��X~�M��clS� ���D�q�ttN���/��f��F�Al,�Bݽ0���j}�W86��p�+ ct{9��b���.t��`=�/tL�X::\35V�_^/߃E�rxn��L��L�z!�pY[�O�+�M�������|zꆃ���I�
�& ��Θc�R؋�p���F0�[�ۍ���f���Z����p��W�s#��
�[�GVpҥ�{�*���Ky~9A: d�,�ia����Qː�DDh���_k�H��T��|y�G�2�c�L�v3��7�j>��D5���߃���Y����nO���"Z�[����GU�yy�Q�8ug�R�+�%o8+�m��٩�м|y(��V?������F���E�èq$|8+m�p�p�|;t�G������P��q��6���.��c�������|�_���lV�Y4��v�0rt�x>���'�
C��;2@`O�A#-��'䥌H����k=I�;]E
mI�a��FA\{��X����x9_��u�z��8���2��|��q��f�޼0Q�f�?۽�f�:���+�B��ʐO�/�@����[�xBZ> ���&x�J�Ɣ��\�
�jf�|TU����C�1�%�5��B�#�s�ЮCƊ$E�o꫸�� M�Ue�O@��*@�ּ���uݯ�Guw�I���}?N�����Med.w�כ��ٱ�[Jًےγ	A�~�9x�п��Qu�/ڼ�&���Pfjn�{�[d�+j�7r�<hMB/�D�B]w	��Ȭ�ѻ�JD3X;V�<�qR�ŷ�~���K{�c粛�k���1n��>!�l�(J�k��f��m�)5r�0.-9/jv>�Oq�0�!J^˷�T�uR�4K��!�Aƙ�0
�4�O<��è^Ҭ|9U��dUͭj�j#M�PS��1l���_����Tc�����ϊ�տ�"�ˇ��KxT�`<��Q���o�`����y��94#ʙ�Ȉ��N�^�6��+�J_��6�ͱn���l�CϞ����_{=��v�d�@6.�����Ǌ"C�z��(�/|����y��i��_=6_n�����I��}�e����l��(c�6�;4{��|��⢱�(P2��|X��x�Ch(5�)
�H�n�yV@�S�D2vLp�^;k�21H�:RY�&��>Y��G�ۨr��Zh��M	��u���U�q�iu�ײ7o �n��[����Mtl||�،�d5[���4M F=Yw����QwjES}bsԫ���cT56
H��u$��صcW���krS$G�Mq�0��͊�wk�t���/:�1�(&�Kj%\�S�|+�1
֝�%�I�k̝( RsȚy.����C� � L�=�q�0e ��3B�V59��<V9
�ɴX���7%��:�h"�n�m���)�l\�
��|&�R���Dj�NKʨ�$�Me>Ç|�8Jl�|��oZ�r�j1L����:��y�̕��.1�IwY��,Mg�͢�>��-Jm��&l�\��y(�7I�	R;�����OQ�c�.�CS�#]v^cŐ���xe��������,2��5<j�bL��uǊ#Ug1]��A�&�.YA����PW:6���H��HU��r��$ׁe��pEMBP�	9�c1օ�:m��	���>�1�d=�|�#��fk�Ĵhf�v�J���NX��zQ�e� �Z����9�V���>E�"��d�����0(ÝGg��en{�g��3c�T�3�m����=,�mig�Φ}�ꖆ�'r�K��̓<Y�M_�@ܓ��c+�[���Q���� /n�d�xmά�������7���_(1��)��iE��:v7�#�����~��g0t�*�d=ݨ�\�ǻb�Kh��\,Ӡ�%Y#z���T�H�*t���}���W��6�)�,���6�&�0
%�W��Ɵ�]j8V$U�S9ʋE2)VUqΆ�+D�8g�\D;���1�o�iЏ�a�|������H6��[���{�fe�Ȼ��i�L9��:�%�6�H��a¸�7��t݂��3�4����g1�l��ͮ��G��z�"ߦ�׬&Iv���+^���py����ҪxR�+p�R���.�ýnw�F����xD��)�ub�gȔF
��N�V4��D�p��gKz�juT���2�MΖ��!���%P��=�%���G�+� �o����%dtځ���rc�H���m,����oU.)Zs�    �A�Y�����q��b a�?�*ԩnTa�v�"�iٕr��:���H�*��8&��nU9�S�˘[Cq��b�@���!n]cE�!�q���������0C��c�>�}$-��x��XaJ����$�����]� Nl���[����n�9�
A]�/t0R��'�� R�MU�H��}l$�e� ��>��Ng�K�NCt왣� g�P3V�Z0���ګݿ\�����ẻV�7�gΟʸR&��4�,��Vg�7�$��],7�f��D�"j�tr��l�U}�~�@��S�[G>w� Ƶ~�y�A�N��Zc[��!!c��<���*(��n�X4d�BY��׵<����`>O	B$�<5U�CI�N�	JV���&��>�Qm�� {:5'!t:kX�m�C��,�~�a:Ihk�ƻ�I���l����sy��7�m&	|:7y���+�[�aj!����]�Ɗ�jv���ۜI-�s6;�0+��Wv�>>ݪř$�b�u����4{[�
��v�HB�V�/����X.қe��&��^9�	g`���.oU7���L'��S���� �%?��c�lA���!��L�]��:�E
��l�~+�v!���/~�;�iW��<�M�����%�/6~�U�������@�T/���z%����ۇ�ݣŖ����U������uݕ;�%$��ʛ�%	�+;���x�V�����tv<�]ʨdf�C[6���æ��2� ��:�O��{�	Joǭ���A�#I��P���y�A2F��������`���#O�C�)s�͇\}'�?%d$��OU�{{,���j�w�P��YT:8���?�$��Ҭ�z��@��?h���K��� Y�\a+�g\�
#iN����/�?����㷧��fL�eZu����Қ�ĥ����3)ѤT��u.��g�.'��-=#l�kǔ�I���.�?{.�Ls��׎Trb��kGA�(�� ?}��q�7N7�~�,���Mض9�*-�e忞^LR����|-�Ǽ�� /�(~G^rm���T����v����}�0�����|��i�0F(�-����x&n�9+���*��ϐ�F���~�&�}�z�z٨.��5����/�d��Ί2�-�L�s�ʗ�U%��ҹ��v���s#�v�n���0@���l��D�6��o,C͕V�jnTk�ֆ��f�r�H
�
�����S�Z6vv0g<6�Z��Q����RK�`�,�ڤc�\>���5������B���s��ҍ������f%�܂p���B1ڗ�`�ӳ���㝚Lc�E��ql�q��o�jlH#%�='G&Ay�|x�ѣ��."��jUSS�h?��+)� \MO*�&�ҭ��1��A�Ƽ�r�e�@F�0� ���ʃ�ƽ�a"vY���-��mЌ�66�˳*}��	�v"�I�&N�	�[+D3���� ��ñ��!�+mq��U�]�Gc������N�|;���	��j��$KvQf>���T���-hȚfĮfg� *�ֆ���e%3r�\A�e"���D�����\�)��6sw���x7�5NV���y={o�%�C����h��r���ַ�d�'�;�I�妦�Ě�c��}��������n;�}Ӌ�nA����Hh<����P�%���Fh����k� �5�H`-�=�只6�����j���'��r�h�ER��I��)�:���a��?�J�m9*bVȮ�Pc��शe�x<�hs���L�ʕ�`���Z��N����M��F_]�=��8�N҈�o��w����yl|�n�s�;:�L���| � ����}�L�bi��2��z�^�(��<��7��\���cH���CM���hzF߮�D�k$?��������vw�J6����D+W��f�ON�E�MGƊmB?�p ���<Ɍy]4HD�c�͞�%"����т����\�2~Wɾ��!�uLS��C�v��x0��'��>kJ�C
��GΘ�b��HSQڔ@�㵦���FG�#��L�K@�-��k�?�1B�������2���Hc-��2�-��vS� ;����}>� @����G�Q��S��j>���[������tl���e�t_4r&�VQ6�Ǝ��7`9J�?��w�p���)7�ֶ��K&B�O��X�v[��8�׺�tD���a�嶀L!*��� ����R����i����+����qj�B�Vqw��bl��p�P�� ��ʧ�/��h�3�Rnx�Qà$��8Z 1�� ��O�Y��[��D99>��^3�Aj�Y�W�W�Y�$h~y}<�vb��$��]͘����Fܘ1E}��?��hz:�]y~9<z����a<6�%`X#I�6{ͷ��}��3�4���4��3��ʿ���p����е�g��b��������JοkW b�=��ҁk�Nc��{̡dmgK�	�z�(O'�l����ɟ��ܺ�H��?%��\=�z�a]����qqa��rU��f�|t�VL���_fH9;�����#�����j�M(�µU���ǫY�m���D�,��� O�ڂ	I�T�ί��&\��:���.#����a�f�v��z���q~�8#���TFD\��{$n�J�i��́�%5�"���')�M�����}��{��8�3LM3N�q�﷛��.��R}/��Z���1�ڲװ}x�Z�:ާg�G(K�uҋ��l!�����V��X���N����爑�Ѥ
�h������i�(��Z9�O������v��F�x���U��
J��E1�\?�wI�ӈR�h�vEF[\�k_�p�>�O��*)���7O�o�E5���%��P30i���<�G�+��.��l,6�bye�����<�^�ft�w�p����t��n��[>���Q�1So�q���胵c�S5>I:��`��a���%҇�
��>6b�j��MBQ�P��+�U�nB"B�(��g$��F�`�&Y�����Н�%aˮ��!�cH���#"4[l��jW��tsEjs'�R�������Y�{�f����4;��v�
��{\E26�_��d�����f�$��E�v�O�|ΜY����J<ܰ�?�_h�Hr4y<�˹<��x9_�_�l+evL(�d��2Gu!D�~��l֪�\뤢�<O`9WD,�|t�Qg�1�N=f4%J&�bd�\U��l���/�;�R�<��E��[v����#S����+2���:��ύʙ�*#Z��@�߀bt{3��"	 ��w�+�M��H�!�����cF�����e��I�S��=7X�]x1���!�c��"=n�ƫ�=����,��-���du�����'m1gA�&�!m��C_K(��3F�2V����n�d, �+��j+"�� �ߗ�	�#F��m��ov���V:��D�U�J�#��L|*5%���b]住�t�����h�& ��b�h
��,���O��{Սa��U	�h!k��wY ��%͗�*�I�b�s�r�������./�T�{wp���Os[ݭB�4fu�?C0f1Z'f�5���9�V,՚�G>+iH�g����dٛ�X���D�ak��+����H��f�t���*6
�d����ѷ�K�ד"���wݝ<��ok��77�d��v���&����^�em�������m�M�A���>�e&w7�-�)39步���a���_��:Y�$�R����;7�3��0�[sP�S�N��E6W�����0���d�Y�	����� QuT��\�I�%����8�#vJ�MEkg1�"b�0J�P?~����̝��������ffb��jR�~�:�
ǉ��Pj֋�
����r�k*Lx�4�J��I
��n�(%8�2�2��㵘��<Ӡ���n�y �z�[�k�g�m�}��C"`	˾n��.+1p��Ϛ��s&ta�̌	5�	UX6������ȃ�b��:`�#N��0��q���|��|�`�hryx��O�}�&��$��_�m��9��Ĭ�^�SF�&�    �9������]�*�����Ȱe:���pԁ3���l0��е�	�a�8��U�D�e���LUN��x����5����y1	&�m��������թ��~��AV>u�I�1�r��q�BlH�d_���u��J�����i���0�f������u���AP�]���./&����ΒhBEH�P�q�E��(F����NյN��S�������q���:όl6�qHR�)��8<B��/A�����t��>Y6-����ɪ%�G�-�.� 	�/���	�r�X���ܳ���D�i��a�\Y�y�!E�R��YL���w��B��������j�`��f����Ф|8_Lp���]��}�V=FQy����uF��y1�pvlS!�T��
��At�P��VALu'�N�S��1�>H���g��
��_M�3QXD&螆�!
ܽ�L�?y�%���c��JF�v�<ƶ"-�Eد*=Ñ����s�N�/VInxC��1�zI�^�����m:��+�L�֗s�|���NA�4+��v�����B�VcȮ:F���h~z�A3A����D��$	�d�֑a�g�����b�|�Qhf�k`�w��OZvx��{3X���!&�bmU*�����G��#���A[�o�/��V�5��N-"����}�e=�2��$(y�Q>���CO��n�.9��m��\r��E
�H����e��U�ߢ:��YC5!��K��~!�������z9��HG+X�yl�����&�P�@�~�Jz�����2X���ñに�w�آCN�>��x'VdA`o�	{U�S��o�&K�x�χ ��c�b��"�9
sL���c����}Ô�I�򛙵?^���*]:��qD%7�t0�AR��"����_x��@��i����I΅��v]�ɹ��ٝ�+�fH��/���S0-�_{��̙����?%d��*�φB�B�<�����`}��1M�veb.t�ĸ.<��f�g�9�O�򃪖u:յ?|Cy�J���0�%n4.c�s!�<C��(��fԑ�{�)�'�Zv�d�;H\���lbz-�G莞��s��xgKq�##Y�K��]����д<�@����3iTUVUՊܥ�rS_/w���s�$�?.����4'�ՂKFz�!X�+�ZѨY���(C�����`Z#8��r�2M{d{"��\Ll��{"��(�/<9�a��viÜdb=�c��$�gL�������*�vDZ��He�V�R��i��;^�*���Iu��χ��['F�p��N�ږcH��ƻ�����(��[ۢ�� 9�b}.uP�c�����䷇˹|z�=[+n%Ⱓ&��8UyI�@~I����epwy>�G�&�S�j�}b��ܽ挄�X�5��V2�J���Gy�(����5��Q7_ʚ����PV��Ao�~`���}a��c)�(NPUg�C�=�1����Q]�c������)�Ӟk��1��f
�Z�f������������I���N�m�"w�qFMrHdxI�!���������n��N�����9zIP��K!z��S���T4K��7M��l��e�L���7�G��m��D'�w��<BT���|y|C���&�L6�?(,Ժ&[�`�Y�])��AR������{{-�}�'�2�{u�#n#���1��G�fO��/��n�T�]�m��s»�j��$hv|8���M�Gy�Q��	�����X��1��!=L���}�d2��l%��ԟ����ǜB莨7椽���m˷��Jն�K��e�ꮂ��Z��R��R�k�1��th1��ֻ|��Y�7�]:Q��X������M��gu��@�q�d��4Y���>�W�%����_j�%��WD�WC��u������S>_�8 4����e)��ty��3����`���h���1����9X��o��׆WKk��#�V�Բ��Պ�#jͿ$���·�)�>�_ԧ8�>��/��W�;#F�CA�;y/��W�%ڝ��|x*�oe�> ���t,gC�SH�:�z��/�<D9��`u9?�?]XH���:8ڬ�X���(46k��.F��� �?�a:������m�c/�������F^�#<����_�*��?�x���"��˼9ѡ�R��
m��>ܔ�ՠ���*�>��6�L66��d�;�6��V���{{W5x#����O�����G�,��Vf���^���6�-�_ԙ�V噅���D4�^ʸ��24������Τ��v����Ő�_T���矽�pR�q�>�Q㤎ِ��_S�V��������ry�2;�}�	uo�����(��t�����Ήg�p������oT\���^��%����l=�.n&Y۝ȵ{$k7�p�2�-V-TV��j8�S����$Ώ���j��>�|�]4ſ�^$b��r}�3�rq��E�|'+�Wpa�=�:q[A�T�;����G��Lڬ��V��SU����Z7��慦f� ���xX5m�p��ڶ�����%bMn3Qǵ@�ouV��2H~^������M���Z����Y�c�:���=���;�Q����P��_O�A~��r�������U��Ƒű�F�B�U�a$����#V3�l�����zu�����vc�W�w������Y�t�\�p:2��8lr��U��G\Q�X��}��*��uSh��;�{.X�7Y�����/�����y��E��^�����cg�j�a�Y��P��f/�������z�V��K�|��6:uWc$fGZ�So����_VR�'�p�����d�F�/�Yt����Dq��
����0��D��u�ˇ8sx)_�8���`]�N=�㇖D�Ye؝V9����5B���p��q�d�ؚ�zYH���V=�2V��mg�dY-_9����,n��Nd���;����uR���x���n[μx�B�n�/�s4T�T���*k�	S����&G�������0r6�,�31Z�,�
�����@A���Q�l�`}8~}�Y�v3X��k�s+jԃ�К�v���	����(_�=�S	wеy��u��a��ڲ���H�{���eK�UoP��iV�!��S�g��HW���a������Ԡd��bt8�@4V^]�;Y��(
��Ȑ�*��~��	�-O��I^A>�+3�;��Te�l�H}E�"uy���`uw�b���V��}���{Mycl�����+YUͣ���gt�c
=9��#��#<�0���k$1F|N/53�����A�A���G�e��tX�\G`׻�97�N��5��*n������U��G?��8�y��3����-�9�(g��	0�P/3�����Яsh� �4`�����Z���M��=��^	�ۼX$�b�o��vS�����ch��H{�?��>z�]�����vM�L&	�fўL�F#YI$�7Hb��v��`cFx�
��&-ѾtcԌB������8Ki���A�q�]vM��?�҇�Q|�f;�}1Ψ�H0ql�{�53��i��gu���n刮Ty�9�F�h�gG&��A�Ѯ<�~���G0�\��2���6����Q_ÆW�Q����LN ���R���}X���;l�ޞ�E���l��)���Z���v��c�^�	i��ƭ��A� TX���U�������`hl�*;�#��*!ޏF�qfẇȴ�������6ݒ�Z��B�䡦3f�����w��`��p����tz�V.�n���^uB��;#h�].�
nh�պ��dwb	��J5@B��ڐ8S�8��0�%	�/-�h���M;��W�
�b�2b��^��W�(��~����� (�o弣�Ї�N,D��u�	���B˧nLE}�XFv �??�s{y;��i��$Ջ23�4�I�i��Y�el�@ꌟ֑4S]wN:�TI��9�Ơ��j���Pvz=<h�j_�OV??ρ>�Or[Al��F��"Rǒ�ɒT�;^r����{ĊX���-��"iض\�s�@R���h�h-Z�������4��^7|>ғ��Y[���(�>����vx=���    ��u�g�Z+
\[�Ëӵ��H�,����4A?��z�}d��z��>���~|�q���S��%�ܐd�@�h05~� VG�uf�뵗��\�}SǤ��{��P�V���.�,��0g�#��ែI��g}d�+�i�f�Yy._�ly��C1-��М1b���҄��Cߋړc���zk���v8c���<Ѽi
k��G��!C����JQgL�JFg�M�uo�^�.�B�y�9J��H�|+��)�<�Ӌ�۲Iq�C��T�P}�N��W�&m��&�M@�56DZ���R����- �t�Y�&�Y��i� ���X@MGûS��+�F��T5�M���v���1��O_�?��0�<��3pHIn��z�HWƑ5�6#��?��Q�H��a ��&r��]����>Y�Z"(d}�9a�(aQS������R���Bd������*,�G9�֐��ԃ�K�O�ף��vB���lpv��ܘ�~��WHF�}�(���tiԙH� ;�T�&��3��p��1ڗ��c����R��d=����q��pP��\ǖ�Z��]������`�xg&0��Ƣ
����j�B��ȑzď��� +�ʟ�+#l��vU�6-�$�\kb?�A�Ka�����������
;���:c�W#��͸vc�W�8^�
X����\>]��]�8� �Ǵ��qL��+��z֡���)X������O<��+qLM��f�z|:U�_�ZQtPL߄0%;S�̸E�Qo��AYӈa��Sy~8�t��nq�3�����6�5?� I5��G���ZF�4���#�i�|(�ß��D�$6�?�ޔ������A�>�l6��5�Y6��F��ś��\���!0�~jEIO�hx,Ĺ��c�$äi��w�� �����Uu�O�fZ|�<�e����R�(1����S�)D�0\�� Da$��%�<Q�W5ܻ����kٻ�ܝ�"�������F��b$�J���o�y
旷�K��b�����/cl\�pX�u����Q��>���hBP��
HdLeU��:���Oҟ�I����B�w�y�8s���?�:B��qk@9�h�P�����#cV̈́I�f�%#�=�wy,�u���v�~y���T�2b�]�A	#ƈEt��"\s�D�����|;��l�����P��m���ooN�ƹR;�67��7@W77!�$����8I�r4}��7&'z��%���v�|.ݩ��j�qk���\:1RG�@�ӧ���I���I�a[������#FR����6�,�ݯJ���#-�*2\�4^ y�&e��<�=�d�Ur;36�F �Z1��=��ف]���C������gk?.��h"�T��/�-OG��0��,7����^�gSB��S�=��t�z3b@)Z��o�g��_Oh;ӿ�6��d]�&J#OvbOKj]e�v���%����ܺ���$����Mk·h�c:��s�ɫ\p�-�y�֪Pz�myyS��5�0Qn�E|d��������1P;�?o�c�l�V��e
F@�r�d`WiX�!��O������<��	X�^.ǯ}Od�0^bS<Q�u�V���
��뤂������w�s2@X/C투
�ZXO깦��l� J�>�Z1�&�$y27
H#6#���T5���w��-A��[��f�vO���\oV=�},�J��ԟ�J=��X�����U�i�T�!�����v9�.:�[��L���\�!�)QI-Rl/�N�fX�x��V>�� �T�)!r�wﮬ��閾���10��bֈ1�G2��\t�9��x�����%f�a,k�=�z�ߩ2�Ϟ'��-,!E7��\W��o`Z�0�YM������p�̌]w?�G8�IO��p�L�2?�}�ն���hτ��Z��9moL4�A2E#�=^���%e��Rҷ6��C)Y�w����;�'��9.���+x.>�c�v��ќ��}NO��p���wu>���f�J�{��HG6�9�B������ca#��P��b �jX�:���rt�PJ}u{��~W�|�ӯN[�(̊�W��k�(�q�X��:���)c�TߋNȯ=��T"�h�8iP�d��[��.�[U�<vh�L�p��7�7���/K�%D�{&�١=]�P
��PWJ�#ᱣ�������`J�>_�/�h���g��&��{x�����������ey����2AϗB7:9�����4��mP�h�����}'@�E�
w^���،/��q��-�y��$o8#CS��r'H��yl\?�_�����!y`'���ͷ���1ƀ�fW�6c�d�4�.~=�˗��Dw�Z��s�,�����TH�L��Ic,~2�R?���(+�W_F��LpP:u���2�o���rU�lUC���b�
�Y�-��~`�Xbt��������'��!Ķ9y��EO����E����8\���9��P��.H��qŪl{2y�Ї%E#�����ZiH׆���<�f�7vh�U$w��a��i����Т�o��-�B?7��Wp;\S�ȷ�s�|7��j���J�7�m��'ӛ�K�*�ҋy��ۇ���;~u��2ڸD���Du�n�Kt�.�?<{�`�(7�7�>G�L�F�"z̦O֝��ߒH�ib�4��{�;�v�X
���Ⲇa������2~W��I��q�2n�w{�`��6xݵ���f�	6�&K���H}"&��vZ��E�e	wJ��7��:2\1�l��9��7�YMK1��VL䥭���7�%�a�E��	����Z]Nݲ?��3��J���i�k���,W����C�-C�����IZ-I�O������h�t#�z�
�x{�PHZ*P�H�~��45��g���?f�����;DYR���P.*��&��K�9?l����rV�g�4��z-k���F�(qS���ҩ��;��"�̺��wH��_n�2�6��$ؕX��K>[�@炋)&\8�&Q����~5P&�ڵ8�-���/��O8����D�F�je�?fw��uM�7�a�� ]��.61>Ҧũ~̦����2�f ���$�M�-$Kӵ6/���221������x��ԩQBB�����~�<f�'W�s�O!�3�4n��z� ä��sV��u6񌾪Ą0S���.�"ī��-�x���)-%���:JP�c��0 %(%L?3�T�u���<3����NI��S�±w���_@{n��L~��^"����}|R��q0Q$u"cn�(��r:�o�sg>�zT=��Z�Y�k�c�X� �c����!�i�}�jI�\��@\i�����C]�X!�S�:Aʂ��:�d�[v�hLzXcnVC1al������#(�f���UUC�����ڣ�[ݘQ�`kH���^��;����yb�5���+qXO_��H���_t/�����d�_5�4v�#pͩ��nh�F�Fϥ�'�T,;�%�I����S�KS�ք�u.�)�=/t�xzm��̋IjR4`1C���������j���8��ׅ8��}`�� .Y6v3��֔�e�5?G�[/W�la�z--��$u�a�e���B�g��qۙ��>�����y�J�k�P�B*���Cj�jjRM�-x�͜���Y�Y�`�i������T��l�hv<W�� V*]L�h`��r)��`HK6C�HU�}D҇�˙�����2tC�J&e�<��E�����Dc�����B����K�cj^o!�Pw����]hF�wա�I��f���jwD`;�f�v���Q�.��m�k�;n)���^�sC�2A���%��@3{8��Ź�䗸"?{Iyj�;.�Hu��πPMK:�����B<MWxl��!��~�t����9op�81C5��Eӯ�5"1��*�����5C��6g�J��fϫG�w�=�,�����:�2fW��(��P�A�|<��IE���˩ɔ���y�|��m������( X%Z��~y[{c]����$��5���|B�r/]��u�N}Cc����    �n|��Ƴ���8��R/����nvJ,y7+��pj�~�&"6�2�%P�D��e�`������S'�R_���_Ec�f�WpS�X7D�+a^Z�|��H*$��~!!�(j�E�U��:S̗���n�E�V �|*�S9�*}sjGQ�}F���4�����F�7qr�XrHkQE��kcke�\�������P��H�T����&菧@���ִ�Q{�I�����	�u��}z%�G	-��w�=�bw�^�]E-��=}Y��|@�U]SLb(��7���j�����#�@R�(`Z:��CF#3����Gޙ[r
�\
�Jl���U6?�Dz�XK�&����`]-�h�X�h�d�bI���&a�錢��hK��קs�E|3�ı�[H��Ѝ����|��ȐM�rs�m�~��T��s���V��h�KT+�H�؇�&$M�P"m(����P�?���Ӫ�'p�N1A�XM�Z~V��M���*?������D�y��\��`�;e���0r�}^_v����6Tf�(�S��F{4���P|���5P�M��T���%�7��Hȷ[���,'��қ���'� ���ҀA�1� �]G(C��_��R�q)w��Cy'�r�8b4)��*h�N�s~<Tk\�M�����΋>���6D�Z�J�F�������ҕ屿p�;T7��3}� R��懳���U�Ηsgb�{5�ƯW #�j5t���l�x���ȆӪ�_W"�c��ڬ!S�d�|<S�|UE��+гY9�@����AV�l,��XBX��p)��F�}�H.��i���t�� j��Z��:�!p%�]�2f»�+A�x�F�>����>��O�2+��T�BX�Uܨ��u�j@8ʿ�<�^��n�P��˘���#)��.�L�O��PN�PR2fJ �Yb��L�@��lbw:"����eE�����竔����B=!b�����.Ȅnr��54���	�d����6� ȯ���\�w�-.��M*��eb�{u�����x{��u��}�|V/�������M�����.M�>�M��p�s��O�������:���5����xmRIh��!������e�_���}T����vώ�Jw�lo�m�.pp�r�}7!D]����͉1�0I�q��	�V�@.�'��˕�:����ERE���(�I���e�H����us��)(�Z��P��_ٷ!F�5;�uC�FS6ڟ�j�z�*s���'��a������d;d0q�Y�|���63�JLs\L�+͒��f;d8ut<�����~EO��d
����gجj��f�A�LI�5Vg#�u����D�u��w�9�:��O�6<���>ͫV���'2�)2�L�
��7y�\`�l��m�ː%C��]6�f�h�)[L~ۗ�	-������LKr%����UqK���}�;lm_���wھ<e�l�m��0�>ZL>e��y��V����ؚ��}�9&�M�^��:�ER }$��r���2�_�y� *Ӊp-��W�`�����b�V��>�wh�=�b�I�m�B��H���_� ���{?/V�h���f��w����\=�"��jtm�7OB:�pl����j$�����
���h>�D��O��p���cN��%.��"�3�'= 	���w�e�V7W�O�L.�[������#u�߻�'c҃e���gq����p1L��~>��?̟���>�����ӟ�3fg�0�4�$�k�5\8St������wŹel���~�R��(%�C_B���Pvg���w][��r�2����󨡦4
�1������"���x�)Z��'�'ۮ$����p5xb�:�J��jg�@
��<��D����E����W����H���R��=݄�ʈ�\5��S��ꏑ~���d�ɳIZޗ��E��P}�/���a����'ˏ�e��o���h?����"��:��,_u�(F���F�����4�ύ����=ޟԘ�����E���-���t����ʶ��؀n��mm)<1|,KzI�g�ÅQw���,[��������94^sü$�s��S`��s����a��w�x&(����n2-�tf�P��P�RSZ��P���Xg�!F`�(�]�����;����)h�r��F�.��$C�l6���\�z��t�>�l�Ӈ���@�d��%ý�}�o�}�����L���p.3t����g�V���/�E.�՗%�K.���'�l��f_6i{bٗܳ�!B gO]{���B����r2�_���_ ��X�jK� a���\����,�c����b
�5t{���Q	v�	nh�����p:�p��i��I_�^�+U���rjs�M穴=\�(Aㇹ�߳O�VU8
�G��2u\,Q�����3�l�8R݊CQ��M�/pס�{�ZZA��f~L0'2��!}ß��b����W�fh�@�ځe�Z9�''Ed�Y�e7��H��ӾH򄤎�*k$�[�I����l<͠z���	k)��xi)V1.I�������nmA�5q�}$Ĺ�$��ǖ������B)�l�A���;�J��e�st�RxJ�}��I�n����_�	��U�;>a�򼧥�`��q��,&�_=8�[ ��A,#��I���"���c��Y�a=��һ���n1D	Zf��8��x!�������p!�h9y�D�R��բ���KS������I`QZcZb9��)z@O5M���h�ll�ml�5�G�ĢA�-7�6�4�ln�-�ż#��W��B��Unl�m톋$C�s3zZL C��n�`pgl�6�P��`.���-h���z|v�P��޴�g�fi-%����pa��r�8-�,�Y���1zX=���|,��J����N�K�k�t0�R��Y:4��{�9��Q����L�P�K�j���:�
�N�vÑVmv\۱�`Ob����w㐁�aL|�{l!��m���<v=�ީ��=��n` 4U��qs�F=�7�^$��יT+�k�wR4>^#cquh�K���M�g,q�X^���kRt(&p�������<f�'�����7��bC���k�4���y�rd��� ����r:�M֘��}�;j���kQ�uk(2��h�٥���aѯ�}�����X��5\�z���"G�"�^���e�ퟰ�ZB��e�I��O�Ctw9��jw9|��4�j6�RY]�L��.�s���k�w����
uV��{�Ϟ�mq�F�$XPl���%ݹ�l˰�_��:�mo%f����>X������n�	�0��qs:�����1~�!�W�E$�(���Z�~D�6�M�NHGg�������2�˾�(�xJb�Ӫ]�&�}R/���f��x���^�b��E*�NR,v�=f�/����-6�}�уt��$�]�j�+���!dz&���FJ37A��A)����G�k����T�H���r@�l:_N�#XF����	I-��E��C��a���H���k4����Y���ƪ��ݝ.�U�߸��5���r��׎E���6��;^IZ�EJ��0�0J��-�ϫ��(Lƍ���O��v��0�3��D�<ӝ��Y�����ve͹٢x�ԉ}N��I��k�~�/a�����a_�؟��}�K���q��ؗ�;�t��K(��,8v���a���>Z�vW�:cBSv!Jc�Z�f=�t�>煮_�N���A�l���N����"�1����)��aq9@|�+�OjS{���K+C�t���đ��^����:���Ν꼗IhL*/]��Y���|((r������c��E���zGĵ�2�.7L���n�.�7Ɣ����cHq�y"��5�a���0�]��x�G�.b�G3���W~y!��˷�U4��tO��K�QQy�n�&k���9R6���D�w�gC`v�����BX��)K��y��v�b}=�	1�8�3�5���yg@R����*��4�,�_z-���ee��h��:�;�l=*�MSZ4�|���`��    ��>��c6}��$ �����s]�Ծ�����0L����|����;̘	l����|Z��C�^���	��Sx�-V��x����el'{�C�W>1L����aU�}����wUs�����W����.��zK/J@%� ҫ�&E73�}FR#c�a!kD�����M�F�D���6�ڷ��CXF[�o�C���O�h��;�A|���������_�z��2Il�uL	mЬ{�3E���^�.��С�˖�Ji) ��l�<ȏ� (;����3��AXB�SKȆA�1L)z>:tBl��acB0+١q��� &����S([fw����~�Yj"� �6���j_���卖�{�������t���n����)j_5F���wߓ�f��ڙ��K~n�d�FY?(["�h(%D�rt{9@a-���"�[�:!c�����2Lu�R�{�u;*6'�~�����l�8`�˂���a|%GP��PNf��s��9���0�3���0�g�����۩m�{���7�*; ��ц��!$0a{��=�b����钟#D��S?�jj����va&��q٩�x�lQ�T�1M�vK��i��b��AR}�fվ�t�W�[��l�3;�� �����:;Z���-W��Ɔ[1�O�����P�ަ�Ä1Eo���]�f�i��7X�a�N$C��p=w���||9v���;�\i�R�`R5�8���(��7��R����rnӔlT*���
əӟ4�$�o�@�b�1z�_��qof�Oc�3�F�I6{6�v���b�D��ż��|Rs>��麃���o�Ct{ٝ�{4?N��x1r)-�2�0 |(���-��S�x!b����y��*3��6��ŷpS�� ����A-���_�⠫o�$�>���4�;C��:�j�G�A�yL`>v��4?j���.��hy������3���c�+~k-��t\-�k�� ^ �߀�����f�V�l�^�=s��ML���9���7��'hq9���
ן��!N�+��w�����T�2?��n���1��{s�;�a�}�u�q�AkSs��]��_��v/��"5�u
�~�����Ή��� ��/��Y��>N���"(VΪ�~k�����~���������Ԛ,	f4?���Ês�8
`�lN�Yܪ���d�ؗ�#ah���μ��4,�)��Ge����i�Q_gN���(kg������{�d��.�uP����R���0+���w2v��"F�R/7���@��N�^�j<��l��jvX_y��*A7j[\v�jw٣��"Ye��(kB0���T+C��4�2���6��>����yy����`��q�>�	m�������Ђ�q�ڍ�@L����V���rʋ��I��-woxMx,o�� h�h2]��s�����i��6�Ie�%�&-(q�a��v%G�&h���%���Cd�0	N����L�:L�_������`�p
�����xt�Y�[W;�<s�`˫�@����c�1d,%z �z���%�	+wceB]y�5`��>�P?џ.������s����������i1��ݎa��{N׆�'���z�m�V�����eʜ~��nN��L��Ӯ=J{��eb�RKw ���Z�5O��b��r��+��;i$�[��SZ=d(!��e�ֺ��_6��;�Nwݩ��-+lSk��Σ�B����:��b���8QF15g����ns�sM�)���J���$�W��"(IJI�#߀p����q\��z�4O$L'���H����$����FR��U~R�h�M_�|������a�!�թBa.%�?n�as����֐�,���/q�zt��*���I�H�)ib�2�x?�e���=o�^��"�x_Z��A��J��f��u(F���\�:�qU���n	I�7�>����I��R�>�K����3<�	u�:�݅���2�ݪ|9�lJ���޴�8�{����	w�N����t��m�wB��	�m��������Lѧ�+�ܹT�����2|E�'��'II��ٟeV`�Kf��:ʊ�K������42�2x���WS��"����m����s��Ǎ�;���O��*��e���W�?��T}-bi'�v.�d�Dˣ<�����U%���K��Hj�)dh����l}_�<�%3�m~ht��s	���wm�xbzr��y��	�\&-U.����n~�\r����e����������$����U�㹌�?��Q��>I
L$̅��ք=ܞ<���0��l4�}tDګZ���ZR[���gA.Ɠ���5�]]����ܺb{�}9Sgp��E$X;'�˷Wͣ�(Xr�A��Ǻ�	�J�~v�ևڷ�o�-�ՁŲ�'S������9D�P�r(,G���;3��#KM
�n��2k���	��`����3,y:V@w�ނe���{(�&i�L�D�����3F_���ձ31�վ��0+���
K�2�QfH/��n�E˕q~�u�_���D�D�����J�ɨ���Lla�,��$���ߔPWOY���K��G;�\(}>��I����ʓ\4���ʔ����e/�Uqe��+���ei�@�_bl�&6���i-��[��0.�6o�I�T�4w�/-�|fP�'Ybc��$H��:ܵm�P�������ڟ^�|Q�w�O�u�1%��46r�:�}R�V���z�?ǖ���M��M�.ߚ�@p*�G��ע�J���<q�`D���$�+)ѝ:�Ct�Nm����'��l|s��K���J��a�U�x��:_��'z��-�e`�l#RH�t)#0b���.K��Z�|�,��rh����W�~�67��0g�/��ݐ�uN9e��e��@c�(��w��U�y�Z���i�P�ư?�:.wc��R_��#E�����G�b�^��]~V��_�߸~2�O�i�C"iy��p����=_Z��-��e�0rEQ-�Ioˇ�g�����M|�-��+jQ�����3�#/�ß��>�g���b�f@��p��Ա�Nr�i���
E�����Xr��ze�_H�4��^Yօ$�6:FnB�5B��,�9?J֜E�Sݵ�A� +6Z^��(V�N���S�\�����zRB:�<NU~]3R�&�Ka�eAu͘�eM�^��������B���X�_C�����MW�0��W(~�[G��s��-#s�c=S��Ǎ�L9��A�(�-7�#��_��Q���5��P:K�������(�	���Id���#�Y�oƥ�v�|�P���w�}�G��bjL�:��̘�{D}��� ��%�q��:���$��u�����Gh9ͳ�u;�e�u�㖗�D�UUb�>�=v1�Wj����iodl��M�$<-����������P&�b;}G֦�Blg�QL��7�5(�-6�snǊ����o��٣D�C��KI�.��D�ۥa�`�X��ݿ�h��jYvr�g*����r��
,�}d,77�#)t뒿���o�1�bP{{N�S���XI4<��,ő �M/���z�q	�ם9��Sܝ�7���`��V(�=��h7��죔�`��Sʕqu�~tS��6W����=gO�l�8�V�N�iOc� @.S�Ҁ�iC�-)?�@M��~�n��w��Y�dTcAWs�io��@1���e����%�7a�ޒ���1#���-I�0���F�-jg��j�6��XKI��X����*����7�v��4(��D�,�Q�FX�	�2Kt��}���p��a�N�������ؗ%N[ۗ��a)c��o{	��@���o��[$�`�İ<|����O7����b^��|}�bII)��*F��m�(4Z%�r�ݚ���_�[����-Ǆ�ܻ�u~ R���z9@���K�V���� b�o|s��zgZ�4��~����.��'�CO�b���e����	I\���V�=O�
$�=�m���Jt���Z\ꋚސ�^kȲ٩|�52�q��EX����I��-�^��>Z��xz�$��    Ax�Rf�ݩ�V{,G��t�|��0nSLH_Ɠ�HW�(Z��.5"�啔h��!��j���=�eV�"Az�(��[��� ���R�vm�D �a���/�\Eo�#dA/�7s'���?_�;�L����	
�k(b��Ƴ�be�ѧ��*��Jb��u}MH�S	ϓ�j����=�v+cq��h����w��ym�� "6D�F�+"1�`LC�1E���x	ª�,��O���x=-&�������J�Z7BLL��QT����r���2[O���;�#�:�*�ǂ�8Zn���6[��@����y��G'7���镅K	 ��Bk���6�K�7P u��a�ݯ����ID˲��Ӧ���z���
G��+�-��ݮf��m�0� �q�MO���6F��_�HYw��T�I��܍����wf��������X������ʡ���(�k׎�O�D���q� &W�`��d�M:��ŷ�֍�H��6.�A�?�#��VJX�'�W&v��4�p�`>�	�}����y��5��8槧�����%N��ԧ���r� �h�ZL��AnȾ�m}
݃��!����(�-&ˏ�-nT����m'.�̒����p�s�I�@�hu�$�_V����nV�+7V��:�~m]cSe�1��\W���@aԽ��c������K>��ߣ�C���ڐ[GA��rm`�N
�@��({?D���{�k>7B=�O�p�Xk|�i��@R���R�������ua6w���<�M��\�Б���m��_������7���ӹ��'$PxSPæu��9W�[4�:]pBt�1����|6_���G��_룯���@P?$��	�n�ӹ�~�3�)���֏&E��V^�D��������MC<���
�D�uCR,�0@af�=�
`�>f�n��\�u����cfM��Z��d1��&���t��;��b������S4����=Mf�L����@���ު�	E�����ż]��4�_��;{�f���_%��i�?�#�S��;�6vw��*���E$�\�^Oi�8�R����UyEܐ�|"ǘ�o�&���?ml� �X#g(��\���'�R�}[AAIZR�ti����r0�I�Ƌ��m3
Tњ٠rx��ߑ�B�$R�f��I+��ؿxh�^���z>J��>�F�b���c6m�A��k�_��и1&�g���������1���M����S&���ĝ�i��<������~>�'�f5C���=WP����iR@q�辶P�02��u}�v�,��[T�!K���a�������d�uҨ9���8��2D�pQ�@a�Y�r�z^�z5������w7OwY�V���sBz�%��Of�l���>5�"�}����X"re*�.:�!»P�ǯ��D�߲�N�"��M2��m�Ob噣a��K���@�0y�>Ac:0$1<.N�rm����b7N�X4����ϡ�H��f�=9dӶ�/��/3���pr��*�@P�H����&b�eqG�$����Ź���m�TE�����������e��ː��o��Xj�_�K�P��ܼ4g�N��P�}�>?�ɴ�~2�0�n�˘���.v}�����/Et�
}��F��Ro�ݰHf)���_�����#Gϛ��5z��W�17d�&�B@"�o	�טVND�*|-�3"���sU|k�p��{��ةutJp�n�C�ײ�H��ʎ3V%��y�T�q$�ּ%�	�4F�L[O����t�wr*��pɩ��.u�(b���k�})�Ԯ��M��d�p��Mp��u#2��z�8�m�Nߗ�����]�{jL,-Bڞ�]j�;y�8R�u<�X�@HBN�î87�E&��b��\	�0A7�tyɣ��S��s'3���*��l��pQ��n>���}̡�9;#�Կı�tүWW���O�~*�MN{���Ef�7b�<Tnu)�t�v�+}Rms6����h!ybc)�yv��⇊����"����<���H��`,�����(�}Ɠ�Et����;��O	���`���kK�l�G�	<0����fK�����ታ�od��W�Eܰ�o���x��Q���q��[�Ǒ����rs�U�pܫBuց�_�b��h���t��A�G
����QK'��L�;���T~ݔ֟�4T��?ߩ��g��������7�����7W!Պ,E��~��釂ܵ���Z�Z��:��V)��	$Cő��Z�C�{~�j ;{iK��}a��Q$&y�j ��k�@�]��ʿt^j����)a�(m�m�)�1mO�Pq��`�ӂ���`�$���jR�M��j �Q�Q��_t#S�*�\��򤇳#ؒ�I�Y'�(�<��k��6>���b�2Q�$����A�*��m�B�P���:7��bK`O'<v9㊹Ӕ�x)|�
#Ac}_�Ss��Z�83��Ri���#��D�e��hg�@�>F�˷��Jo�,�y�-�e\��<�2�'��VUNNEH{��2]��-1V��C[�bR#��9�/mNc�ߞyC�j��y���=�
$C����a{��f\=��K��6����8�LFS��7G�ya.�8G���^:~�6w�Gx�U��X��MD�r��?��g�W�Wކ���|���:��$���D���|�<Z�d�ԃG�@�9x������P�H�>-��-|�m.{��f�8ЖP@��f�M��/_"!�i�G�6�6bc��uX����
�bY���W1�&F���9L%����lo��Ø,orR/W	�ʆ䣘�I��:1���n��%<�576�0���i�:T�t�rܪ"G��h��O+G�����0��ÿºmQ�}gi D��`d���1m;�މ�CŐ���ߛ]��6�W?(���Re�4<��iczW����M�7*�M7�]}R�s�����ȻT�>2˄8�DSf�B�۲l�>�o����D�%�&��޼��ǡ�`dl9�t@���$�q��c�+Ea�^j�Q�y}�E�д�Xf7��A��Rwh,���P�!�t�o�\l��� �!T��p�U�� 5�N�� y��b5���+T�Ni|b@�Zk�Z;���c��~����2�,L�F�=�6�m9A���J�;����#$�����RRl�)|*���$��ſ��&[d�(����)+�k49��c�u֭��VV�RH'�QAsí�1�&ǒT��o�]�n������
���j��eC���ѫ�F���s���JAW՞ô�ʒez7����$�@����.?!�y�/j򣄞�D�=�-�Q���f�ڝ@�`@Խ�:�h���s��<���?�9`��Mw?��D��|�/s����V��׎�"���/�)B��O��B��I����z{~8��{�M����&�f�n
/g�i5P�W7;1����h��Pl�ΈW�+�5v(8 ��V�e��'AO�s�Gwj��U�������cB�D!+�
��,@)��[�Q��w�����k�&H3g#~p˾H���Ȑ�3���?��0�-�3��g�H�7�����F���T�p�1��1�	C�;A����)���▫��Pa_у�Ϩe觖����������N�����c��_�ϗ�*�0Ț*MW�~��|k�펈Ÿ���ޑ��̑Է�"��_���>�)��؆4ϵ�;��c�����G����+��W��$�c�!��gЗ~�R�w�e�3L�FW�
�ݩ/Pl����F=,`G�Yo��SK
����7~~�%�ȣɾ:��$@f-�d��°s%o���/9+1��ӛ�<����L�=Ϻ�cȢc�����Rk���/S�`����T�s
�:���ж_a�V��[���݄�or�\�D�
c��� LKǊ�|,.'4�J� �qϺY\~*o�����_�F��˺���%%���tQR� S���3��i%�.9��J�Y�_p��dȐ��o{e�qm�>� ���f����{��E�?}�]q��y��[C��	�L�$�Wq����    jSc����6k�W��V��qD7���x�q̿�]�]�1R��[~B�����G��k���[�*_�x��6�����_���*HK�p9��`E�j��#3��NN 0m�g�u�/���=a%e�O��3h��"�tǘT���<��r��J��]Gڏ N��v�8e��u�%������Ϊ]�1p�&C2b�r��5��_�kLtx�n䴊���w��m��br�g�����"('ޣ
�|5��1Z������*��\�pDb{B��Sn��xO�f+K�=������u쓆р�4�Mf#�?1��3���"�|��q�h��|;l�bR���i�����i�O�&�Ċ|������*<e���ک���8}VP,������)r�S}��'����0�����iU:��02���)N�h���E��@��HA��K�$x1.�WK �������!)�U_�W�K��f�魍H��Cq�$\{�%��-�H��j�3B�M���s!T5������6<ʼ�Oهɳ�K��g�%�JnѤ�N��vNMb�P��=��ۓ������7����AX]������z��k�� N��Q�o��ۏ�o�/��:��&kl%�r�pL��Rl�\��5�LRo�(g	�RYjs�t&���u��T�\E�ˋ�����)��5���LW�_�`�Ϋy��,<,l�hq�)`���챚�yB� �M�h�d�)%J���|�>L���j�h3���o�'o�:�53),k�|������(��i�'�%�Nk��H?�҅f,۲Qf�z�.�p��O��v��o��eq��#�m�M�����;R��Ǻj�H)Z�e��L�m�{���*����o���[N䛷<ē�k���r����U���M��-�TG6��K6�&�V�����-��p�(��ȣ�ү��w�}����IƬ�tH�I�C?��~��E��7ރk��k�b�M7���L���f�q�=��IG:����H�V�cw^�מ��:O�O��Ln��s�Cu�wc	l3餱4�eӶ;ܢS��W�$���~{�e��q����RV�e���dd�?�17��e�%��'�H� /{W���6�n|[l� �	2�<a�4(q5A&�3a�A�Q��!�6F������.��%����򈒫��O	<G����z
�@<AI��$ '�5v{+, ()�W�`.r�:7nz�~��l�6Ǎ�2�iR�T�Υ*��/a����P��>#���c0�p?��8��^�/���k���i�|�;ؾHV3��䆌H޷����24ʋo�ݭ�HP'T`�}	�F�8��)=F���a�^�"Z���Y�G̸��u���~�C�� *������Sq<D3�V�����vBՔz��L��,K�m�!¸$��q�p%���=��!��}�L���{�zL���>K��<���e�|ߚ,�}B�8�ֵ5-+\�Lw���䟲�le���^o�O�VN��C$�ʺ5�6OI�&k]ȫ�g��N.�nO�i8�\��ʛ	X$�&���j��C��͢i���A��ܮ%���x>Bd�U������,�d�Ex������h�<e?�	Zw�N�Y�y��؊������>��L���0���K�7)�Vx���0w���� �*�U�鐫�ƺ�\�����������W�T��n&<D���ug �8Gl����6�� p��NY껌�9�(;�`�.J{�b!���W;��� ��s �s�)�hs:y�˯�c��΄$�~\j��b��;�\����u9���W������^q�+�{�;~D�~�>�h䵸��w�i�����촑�EK1hH	����x���9�0y�>dO�L��w����g�����P���9�e�ڱ���~�R�Á9)Uq�_�D?���N¶	���`Dq�ދ�m�g�`���e�w=�Lf�7-Lr��'1ǸAV��'��瀓�;�=~��7�����vM�i=��"��m/�{}��7��J(�V�	�,P�]���J1u�+�q��R�i�c���_���(�j�&�Qð��Z#�ͤe�^�����S@��u&��r��h��o$7I���Wb�Q>(E���)�Po+6N��Q�"Nb�(ݽ��?��
L�;L��?o���智`�."~���F�r�;b���6C��*Na��p��
6�)0�v��Y����L&,�q��B��l#{ϐԣm�����.dj=@�g\�bI�N�S~8+�i�DK�w�\E}B�	-'��$���
;�,.a%�z��3���
fD���ڥ��w�f�r#����3�p���x�P��ތ��	�
�"��-�Xj4n\ X# �k4�S�)�L��ۥy�۔�r�V�$y�-
�.�w���aoV��̱�瓌�f�ι�O�>�՟B�{�r�nS��7�5�!�65����K�F��懣�~�?f�.�Á���A��r�;��p $h�S�͹C)J�)E���^�4������C�//��|�a��0%�_=�tkO(AZ��t��JZ�6AJ�Kq�a�穵y�T��k��1u��;u>~n:����j�q��O��V���Ϣ� �!Ț:����{{�@lnOcZ�ck���p@�L��i��]�����s�I�Hl�u�6��|[�QAA)�5�K7Ķg���ua�}�Zg�(J�Q�9!y�0���S�W�v3�ڇqkr�Ĭ�S'����S���Ә�����d��E�z$%�	.��SR���!�ٺ�|;F��ŹKV�`�1h,p�x�K��S IL�0~�����1[�w�����ḮwȄ릥4��-m���I�x�����en���9��q��g�_o��#⚚�R�S ���^Ə�#��r����-Z:��6Y��0E���"ͫ�͑�f�dLk�$���)`dh����X��N獎c�LO�M�cõ���\s~h0pr4�h8��W��G����5�����R8cO��O��ee�Q:�?�[	qk!�	&��_$�i_�GY%Ru�jz�����u�"?�P�i&�@?���5zV�U<]g�������lZ��$��G��ߚ�Xbt{9���~g�5��%uqs_I�˚<�����Ge_/�T���N�?w����w����2�	�)��V�?���K����]y�Y������"fu�/��)�]��������0��4{k��79i]�M�1A{�@z#S�E������2�^34;�;�����v�k�g�ơRwێF���J��9��:��6��{od��mqҘ��chP��@O��G�+^;j����g�&�����#�t�G��.߫��rV�Uy]WVw6E��r�1�#`�SY���+���M�7֫��4'Էb'�>q�x_���t���ӕ�.�Q�}��BGhF?������[��y���v1��?FO��lz���'z�^�<�tYoU[���u����Zni�*{���LxR9��~un&�Ҁ��{N#�D'�l'� ��.s�����g2Aw
^���V�wQ.0�V7��EzEM��Q�qi�C�`�|I�	7�6�lX�t`W����dհ����n,~&a85�D�1�k�|Ϲ�DG����Evke��*j$���j��#c4	��*�T]v � W�q���t�dLt(�ĶA�T'.�j:]�{UaÇV����=\N?t��V`�=OB)��sQ3��5i:4<)s���ظ_��肦v�C���s�჉����-�������Q�,	�A���3]�g�yа��uXD��s�X�8SR�֒�t����ᣪ���:���?�W���[c��5o�����r���^��n��K�m�6�ĢA��eW}�������}EI�-�!C��x�Ϋ�._�WuF�W1g����D�Fm���+"ap�r]�!��kH҃��c�s�&�KF���F�^��[��-��ǟ��G��ꭷOb��'��Vz�7L^��T���~��t>�n��{f����J�_�BU�8�S��E!�ϗ��i�L��4������n�    .�M�w7p0�|�xB���J��K4�\_���ӫ*�_Z�>��xΘ�ر�9N�3�+Y>�e�ϛ�|���鲾��n�qj��<��L��L���<v=������r����Um��:|}�4X��#�:��Z���DX'2�_����"p�0��˶M�#Ƶ���bI�h��T���dh��h�����OM/��K����U7��p|՘+G��E����w�Y�]��M��6�L�����:~΋.�I��IR�8q�F�dOj��A���S�/��q�=��w�޾[���;z��^����4F�"7���j����U�3k�k<fj�ޗ�<|4�5���J'
��c����)-��mD�����Rח�oyJ�����>v[����~��� R\}?qo
��1�����x��'�ՒL���[A9n槄<�O5b�ᠠU:��������r���|T_S̈́����mXc�S���a�v�K���f<*`����H�G��n�����X�>lU�ۜ�q�������yyTmڑ�S�R��AgO�N��csjD���r���;��OU,���e���������Lh
ˀZ�w_m��Ɖ�/F�N�X���W$)X1����$�N�nX�x#ə�t�aiW#}B;� �'3���r�Y�+I���Ė��Z����>M�f��_�t�wMʸ�I�n��j0��w
'A��n�����~�:aK��J?=�L)��e\���%�J�Q4.~�]������\�53���P�fn�LV������5A������EE��|�p)�MȆb��(FcjM�|N3?�F;c�n�"��塡���*�]^�.A�n|�yA#b�h��)���zŁB�`��y����B���i�0���q��J������������j��w���~ַ+�������5�$  ��r�Ee�� ���1[�/fGv��e��M~����C5����w�Pb��^��b���#����+��尯Cg,��J�ʡ�\�� �E�Lo˖�3!u�gA�P&�af��$�F�CRr珻�=�fȺq�J�;ԘKiD��blB���V2)Z\�y�dN[�Jkq�;^��Z���)m0gzN1���@]G�|��6��4�۴�1���uN�X��?(�)zP�0�i<���63.�/�63�orӑ�6����B�L���kd��e4�.��Ȉ� �?�Ɉ�솾c������������I������*�\����A�d�7�Y��J���x6����~Y�{?a��}y�?�;P%z�?:�_F�7X'
�Diu��j�a(btF��EnDV�D!Ʃ�8m	Y�>�E�q�[��
*��)6�P��yiﰯ�H�Tm�\���j����ڀ�gg�"�:
3��Ğ��BIQV�h/�(;��=�J?���Z�QMr��D}CW
c�F��5���j��lԗ���a�?���Y��A��S��d�nTq�E���+,��S�8��T4�>e�n��{f�SrMPI�.š����>��i�W�.	oLf�A�a�ǭ�G���v	h}ls��:a-��VUH 
t�U�vhl{/�>1�]�@�F��;d� J�@���^�6/2�q�ޙIج�ę��
�o�01�1��*OE�������Z�����t�X�U�7V�a�������������A����U�m�J�0�wxA�kIJ+-�mǡ	���+��Ĥ��{{BE��[-�tf_�(���'��Xp��J&��kh8�Q���t8�d��)	t�"S�QF�c�w�l�]���Fƌn��8�U���sp�X2t9�|��|�:��V>�9����e�'���� ���p�+
_�E�������J���C٘��N�a0'R��f��/���m��1��3�a���t��	��^��fw:��qw|y+��/�G((1��~�/%X���2�?Pn���_����g�	�ƭ�g}�!�J�Yn#�� �'�����c)�3�7y,���zǁ���κs����p��#�IU��E
�R����S7��6U�*<����C4�;��vȜם�d�(�	Z^�j �Ə�a~�-��Ώ����1�~,>�<�3�P������םϢ��3�qa�^m�C����e�"h���+��|�֯�v�q�q$��`�����d�Z��@�Qż\��X����a���g���;5��ьֵJMHp��6�uw^�x\�:w�=v��2���k�&�����n�Ǧf�	cI��&ƜkZ&bJ�y�m4_�l\��0v_o0��w��a&� u�Q&Y��h����^�|7?��/��D]��}*S{8y�S�Z�2S��0]K~���f�轵��2�;�ObH��K�p,�6����9�
i�I\� �@AL��W�.���/���=)�]js��4.���+�����@�L�2����i/������܆J�uE(���9�to.gU�E��,Zf��r��v`$�唺$3
�bE[���7��f�l1����|/�[��=Wa�����5B1��F	D��eD�fݘB�+�	;�e�\��?�O&����n���)��:ZNFc���07*a�Z 	fs4uiPi��
)@��/۩����W�u�h�HIcy-D
C��9���i��8_���n��,��m,��c��0�����𲋲"������������k���=�Dh4�>a!I˧�e(#����	E�e��0Iӊ�G�1A�����#d�kuxm�H0.þ���ʺ`��7F�~��2E���g~zQ��x�gp�;\��p��h�2�����S�/S�z}@C���oѝ*.�S������f���xv�P�C���6�2��Y[hS��w�	(w�ݱ�K7]޽�Мg�#p]�+�R(p
�K˟L�fǗw�����!�l'��l�J���������_�k~�-V�n���W�Dr����������CR���Kq�h\d��l����s����b�u�����ScK�ִ<1�þ2�6�)��	b�;D0��yU��s�	���6���mxKR�}������T����p@8��:N��kk��p�v���e):�Q���RJa�h0$�?@�&�)�S�7�sމK�#ȝr.N��
�234�u��U�.��m	b�����L0nߖ�V5ĽT%G�S4>��l�m���B3�^k��k�=,�EQ���e�=���mӼ�g.	 �q����n��P�����)�3|���SǬ(mE1i�j�W;�)����]�G6��A�mJ��j���*5P�7�E5��i}��$n�cMq���C����Ȼ~�s\���?�c3����I�F�}�Utĝ���W����ab
[U���r�%���0�:
>��ǒ\�RG&	���cѶ�������B(������aj�4��_�?��,�8ӵcm��
�aB��V����`_��u�%)@�S9���(i�(�27����z��&�j���ٌ��L�$ƍ\���僅R��1���W���{O	�ii@�%%-6G���T�2���i�4z_f3GmS9�F�k�r}��_Wf*O��!��Ǥ����$�1	c���'���	"F�M�}���,��:�]��I�n���9{��2��D�x�2c�Q���I���TB���ѷ�˱
�l{�a�i.#f�#����/$]&E0�\�2�9�&�N���妘:�fR�����0�NƤc��2z�f����W�0���L4L���P�h���G�V����f5�d���S�&n�Cj��`�)C������ld�qo�>���u#�eC�M�	��0!4�L�ک�Euv[fS��QLpɛ�:ԏ�(㸦���K�� �$�˸��H���9�g����P�_�y���63��h�j}��f�v¤�u=TY�s����7��\�BAf�({i�so�ѭ��W>�"�7����V���7�g�4?��l�XT����x���x�=s��wf�8R4U���e����e/[+�������t���\�V�P'�,1��Nv&K\l��F�s�b+��#��RȘ�wiQ&�    ��Hqb�;qc�l?���<���y4�|-�V�O��O-�(���ǉcQ���,
�^'M���=`�ݏ������d��Q�����#�䮢L��,�Ya+ʴ��_}-�)�0�-6�7��	�M�U���D>�*J:nO)�Q����I-;{l����[$����a����hr8�C����\���P��T��*�T�}v�OeZ	6K��4D41���hU�0���3kX�'a�3	Ț_q&��DQ�C׸¸�yK^����Lk��
�pp�h�yɣ����.Wşw�Y�W����Ƌ�uQ0�	Z9ps�T懯�|�\8��v"=�D�Ȧ���)�wzk�g�����y����k��'��dii�@�?�;��r'}�כ����YoIORi��X֒j��հ��䀁�m�V��?h�I�%��F8U�쀡�m���m����ܘ�jk���LW��Z�*{�#��q����k�]g�z�AV�m�u�2(�;.�B�9ŏ�j��z��R�:g��!�d�����h�>�]�(�[AH��Q,W���CHlԳ%�_��{��9)��D�>�7ke�PBr�nn�>E?�&�t�td�
��ܾ��Vq�܄d�n���Mb�=�wl>ވ>�Z��U��S��Ì#c��rw�y\?0�����o1`��<�30�D��uF��7�ԉ�x�o(�� �B���|��^�6k4?��D��cä�X��ǆ���(;|���я�;����i6p���^͟�[��?N�ʋ��\./����Ħ}������\&�Q�cv��,0,e�n.��芋�C�q���� ��:n6�,I�w\b ��~~�߷mZHD$�<�4uY���:�F�J8X�>���hL������t����[0��\+G�q>��N;���w
�4v�ޚ*��!s���v�y�L�2R��C���p@Lѽ�P��Ы�r[r�nGWA²�@ �P��40�L��]�c�&ľ}w��ʄ�
\�WJĀ$/��9�̭�ؗ���4�q��,�U��R�q�9��o�{�qɷ�bZ�WZ���z�-Ъ���?�\PbmSJ�S@��65��R49���]�u���`��8�K�L��I�/M�hb]�����M<�]���4+�d�_�P����C�ؼ�2h}D˪�1~h�Yi�͜Z��$iS��e�j�yo����;�;�{˳��M�8t�]����W�m��_܈�}�亻6�<�CC�jgH�q[��Y]��l*]w����dC]e���(�^�]ޡ��0a2�'��Xn$kqu�y�����Vx�m�ͩ�2���&���H,�'3zl�&Y�Co��r X�Is'K�-y��y�����4�=>�������q�����vMc��[����v� A5up��҄x�)���l���J�v�l�p��/���w.u^�����Ĺ	�{�B�Ad	x��^�� ��:|�<�){���.�����nT�s;LN,������ ĭkk>]�`�L��L�d ޭ�>~��@�4�F�id�(��[�!�Ev[���r9l�2���+;,�=���_ke����-H\Z4c�z
�!�&�3�U��Fi ]�-�h�7]��P '�"���k��_U���Ξ�$����ma	O�&�Ҹa*�-Cy[���=�5?���p4�}4�=�I�b���y*�$F�����a���۵U�	`I}��)1bC�ĉ9��q����^ă�;g���-�Z�L�*�	AJ��C�d���"	�̕1�3��6T�e�3�U��G:�O( R�����xPa3���,��m�I�Y��EFH�<l�n�]Vۨ$_".���>�7y��	�=`��=vm������[C}IӦ��Rf�(2㎽��0��]�k��#!N��p�J���(h� �l�q�z��������Q��V��k)>L�fC]��K�S��<��D.D�GC3����,�펰�}H(<5��L4�Ǆ�P�����?�N�rjm�a����xb.7�L��WE��֐y���<����|Q���2���QSZ��q�����H �Km�7�2_�EK�b��ly(�>3���Ѫ]��j�ݔ�5A��Ϳ��Yu��{Ҙ4ޙ�=�x��z�X&hl���/�����L�y��Q�-{��ÜGsZՎ��1����u���Rt�B�T�NA|Ĝg\c�XQ��c8M!��u�S�`:�B��̵U\(r���zٺ�e{�s�����y�>Կ���3"�����D�'�UD�|��H�Ҟ����?I��g��ļ&I�]�Y@W\�{��ó�<���+�L⴦�P�[�0TX�����.�φD�I�M�M�a�MaW4�ö�������0�C7@]=�\�#��xj���u���a(G���f�G�^�����8Om��j[&a������v���R�ri��!7"}i���0A�H�ƙ�7j�	��I.��q�$��}Sd;�h�NW, {(����l9n#[����;7�>�9\�T%����t��ܪ%������L&��`vG��f?%�k���Z�V����sWO6��-�rh�:��8
i�����c�(��ўKE�ǇSr{���r���w��k&y����̝I�f��f4���L�38�h�v��Qg&h�������g���#��@�� g���ox�����H�Spoq�N"ŀW��4�_���g=X>�BC�`����=��v��Xސ: �~|��P7��i#�^����R�H�Ő��çS��x����ݱ?�L�	�6k}�6"��hy{w�r������0�.�;�bO�}xo8��}�X��L��o���u�sT�
Ș�Qʒ+,/��ݡO���j��h,�������u�:=<?�b���x�}#��~�m:�q6rCzu2�\��$�r������u�է�'�Gj�hTXA~s�)�Y-�+���1�i4�ܒ�Ж)G|�h@��e����d���i�AL����N�6�)m�K�n��`i��r�/h�-�;��Lq��m!g�Ͱ�*��-�P�힟0�{��Q�>)�R�l7��>)<�w������>��p9A�@3ė�V�@u�i��pG��MdU�;�8"(x� �9�W��$�㗧)�2O��a/�g(��ˆ�6�6��\̫�����v�*�Y<�
R�}7��8�O�&�
��6iO�==Kn�PBOcr��3���Mf��&���8�"%�B��#*��A��3DBv��x�\{U��^�*����
&�m>=?�ޙO�w(f��b���|�����&�K&�mb;&�1�s�T�v�?cJq�@w$�`�)���@Qtf���ts���h����çF�dS�|N�p�ۭ,cAQ�d����	3�O'�����,�I�̳"3v6���(�h��d�t�����!�J=\� LS��Q!��{�;����~�B&�qLMv��5e�ozbB����+^�����ov��T�xovѾ*y���.�*�������_I?�PY�v(�
n��n�Z���)��z��ç�Z{veR�A�v�Ȁ�������}MJ����2�,sE�;��h�l2~bDQ���'�j������|Wo��>���B��g��m#�?��)���10l��4&H5��7�,�p����&�.��nE��N1C���CCnN跙�ߞm��4�-�`�v%��@�Y�}��)q�3ES��r�?��|�>�/(ux��̌OC�V��gf5рhMN��8bUMI�V��g{	�? Yw�(2o�p{|�ҟ�fv<�&gʱɝ��|�D$'����!Yn3�:mN|>_�BG�x40
�d"�ޏ81ϗ�A��,��΍wp��7����4ރ����GA�l��j;o�Ti��w��Z�$rn+ �W��>�a�(Jr{�2�/u�?��H�l�f��B0�r�抡"���o�6�����.�k��%l�ah� \.�ɶ)�4{"S6=�o�hj�t�/nl��S�Q���|b
��H��`��:�o'\)B�M����g�-��U��d]�
[I:����~�-�&%��G�Ў������    �q�.g�Fp*k6��R`��{��R(���y��>�e^�V�h���an��֡�E�X�d�0�(y����p]�b�}��"m��~@�\��dyDzP���ֳ�v�<�p�J�ia��G�i1HYZIf�����da�-���@��B������O(@��;f���4-��цk/�oL�X�$��/���GRն��#�z҇��w�,��87Wٞ��z�d��IϹ�e��j����n��q�pmź�5��P�b��u��k��e�׮ B%N0i �n���E�/���~t��&8Jj����rT��7�Dr9|�|��+%w�����m��:���"�cx�S3�nn�(RR}��?��o�MB�ofM�}͸���k'��`XAN��b�*W����������������k��,�f����`�*�+��l���}�J�+G�+E�U��7۱@�y6����}G�/�	�6�d�%)�V�=�&ƂcF���Oߎ���-K����y"�^�2����$�5A��y�������:�黢\yӐ&n7ԙ��|��9�e���J�]�~��� ����F���S��8!Ur�jR��*���E}U�C���(Z-�rgY��gc�1k%,Y==�>&(sx!J��פd�Q)3w�;�tr�1�*0�8X���/C��F�J�M�BP�L�LA)��B�w�"���+����� H��t�t���e|uK��T�`�}�o��T��b������[�Mɵ3�:E�ogZ��	j�`�.���r�裏��:���%�c�fK29�Kr�8
2�#�ٔW#�>�=����QT]C��0�p�}����~� Z����b�[�Ҵk�4ٛa�PJG{.�������ƹ���يǹ�vY�� �>=d�P�����=ߏ�4���M��W��4c�e3٘|�Pj�^9��q�"�pkN�܊*��| ���قhHn����/ϟ{׍�V��k̹���0�N��Pe�qz�O4|t���K?��,���\ݳȟJ��+�h �`��;��lJ��As��������+��sǧϏd�/��U0���J���S0�{ڱ��d��\�z�9>k(�o�����ա����Swu��99�}�x
r�|���7?
<�*�=TR4�e�C���̎u]L������#Y�o����	4U�+��&И�O&��u�� ��\��h�X(�?���}�ob���Ŝ���Ԯ�/͸�E�c��^���ƮB��4��jã-i�e�E:�`��9�?u�����E�4�6!H�ê�V�Յ���@�̂�V�8W�=���	�U����$�>A��lҞa�t��Lq��P@h}�Gyt�yU�r�^^��D��N��ԛ�����iBZyR��-``|��Үi���͢{���x�J��=sd����t����O�?zKC;��������Ա ��T"(���n`�&�^׻���]�k�X��$<�ޅ�QT7ү3��Ihj�w�[�C[��a�2gT�j��]�L�5�q	Az�0v�hJ���\?�|���q��J÷�F��0�P�a���+�?|}|H�N��R&ix5.&��w�����d|C]�I��k��m�;d��R2l�B9�aW�鱎w�Cm�1^E����FE|>�||]Gr�[�_??��{>�<tB!�n2��yk�E�� A��i�����tBr��㦀^{���]�<ςa�3��r]F�Qd�@{o�X�gN���u���C^���c�:$�th%�t��!���ǧ����������_��l�i��gt`�m��O��Ptd]�,�Y��.��"�]0g��s���4��ٜ+����|z:7֍�w7��3�D�n�u�)�O,0*ru|z8&득�f�:��CA+��m�;aО)�y���1$ۏw�[�4���0P b$�bCxS~�5����R��>>X")�������dTt��H���?�eB�aS �K�8Q���ϔ��Ð�_��>��4��R��,M}N��,��;�XPd��2��cr���s5~�Z������l�V�XY�٬�Q+�9�d���d[��ۺ��'�|yY,��l�Nd�ꪀ`Y_%���v�9d���:��qURSJ\,����cO	^��+����g� ��nY�k�����8a 8��hJ|�@��S�P�z����C{��U��������|����s�{��^c����B�+?
%��M~(2N�O�	���ߡ��}iO���X0T�,�7�n�?SV�����v�ظ������P��zW�IU�:/o�]�H6����������y_��i�.��a׽^�bq(����x��� 6V�\�|�,��at�7��P�z��܆�5A@�;&)���b]���6#F�x�K�\��
h�+"���Ǆ^�X�t��@�!4��c�i�n�����۩D!'�z��pÐ�jwqUo�Zm�s��$�$k��xڵJJG���su_�ZV��
m�v��Z����e���sCW�m�ȋe���
r,&��ڊ)�K;A~T������7��"����P���]��)��xy�IL%Y���d����(K\�m�R&�D3To������7����������"G{j�ٵ�e�fW���+~�xL�cM��5|�e�y��u�n��ld��$tG٘�Uo]��uY��h�*�;Nv�Pr�4,S^��tg����J�̾s�vW�c��`�^t �޳gd�mЋN���X�����yyM꾻 ����ƕ23�+hik\I����ʰF(���C۰B\�Ь>���L�W�N������B�I�_�+�X������cÃY5S��1�xi+��\�w��C�/�}lBG�&�>�DRy�F��E�E2{h�z%�O(ɦ�er-�e^',3{�r+��J{lo��o^|����L�X7ڇ�w-���m��*R����*K��m�TH=U��Ub�_+����>k����f5ɣ�QV������>\}{&��Ѣk��ꂤ����u��R;^��TjS����V:t�X��)Y�KDj�j���QR�$�)���ۦs�r��K���Kɻջ�uR��e�>�ևC��p������IK����"�Y@��?{��fdu�w�0��w��τ���}�D�����za/���/J����#��1�?�he���������\Avu�)rrU�
4�l���~)l�]?�3��?��fdٌ�F+���o�
�\#��r/��,o:�0��~��Vb7ҙ�6/X��gY���h��>������m�+�ט%z,�o[6�*c�P�X�Qh2�*c�n�%Y���zo�ݲ����k<sCU�|Q,�]R���p��:+���]4��b8� 
M�>*|�eq(�!�+�+�54���mՑA�ܷ�Iɶ�ܺ��&?�U+W�^9ҏb8k��~!�)2,))�n����9&��&s
�,e�<�n�"^M�~Kp2R�WŖ��y[���6*�r����a��H����s����?nF��������Tv(�voRq���}q՟�b���v�4{Fۭ���.Yv�i�Ϋ�}\x	���u��n�P�R��Ml���ۙ�����(�g���4�K�'vs�T���Am_
�x���twY��
�)�lȌm�p���D8=R��z�?���~9D��._'���ל� 0���~ۜ�BS*�����*�{6jި�e'���V�Q=�lW����Y�?�>��fw�v&����6g���n����5$l���21]�L`���SV�X��E�#̨�����!Y8g:t#(��S��*#S�"cm]�γQ�����-<�IU����$������੗2�:�(u�K������s�3P�X]�1�sKr��3��2��(*�o��n���h�TZGpi}�7z�Ō
Ō1���`R�6ފ��.Q��8����p缳�NU_kK�k��Φ#�	N*�t�p���ӇfDU�H���;)�u����@��`Jd&XӜ����!gAc�����E�;���j�G��Å��TuscW��𴪩��V��z���g�R��!?�C͋F8%�E]%�}Y ��"��C�	��    �b�9�	�й�q�Ix���od�"mi����J˖�߃��3��C����v�\���Ș'��{�#�V���� �����f�ԙeM����Ge�S@y��yɬ0"�K�)�uߛ\�C��j9�hg����}�a�({������Ƀ�͔��t�r���L��8%\;�|��xwۃIq��RI'�U>r��ţ>�
ޔ���&t��}��L�2<��ۗ�F;�� 8꣉ĸ�J��IU,��s�=
f�(��љ-���|,�w��-���]\���f*&�S�P^��
�	�~���B��vc�Ap��:[�t�h>� ���Ay���m�._mp�v�㭎+�z��wݬ�6p����n�A;2�ȡep�_����2'�֟�FYGX�R PDXrRTۼ�$�~�ZlaDx��p���$���u�Q�)H���Xn��z�V|$�Z������r��T�y@/fD�iF,G�E��/ڒ���}�q�(I�\%��N�^��0!�9�Q����UnT�VeCb��MCy�R	���3b�wFp�\����_����PN�z�ycN�h�Jh����)�ʹ�n�HP��"�������~�'U}�_���)�v��K�f^׮z��G
(=�0��������±��lo����|!h2"4Y��E�P��&<�I*�+��N�[W�����Ĉ0夬R �c�,!��e�M�EGw�}ɳ������ ��\���"I� ��b�i�e@j'Ɩ��*|�R���2sU�:�*�
��_�w�\���'l-��w����֒g��� ��E���A�)�2#pR����~\VRc�Xe���AӾ1�BS9����b���
�RKJ�ҝ
����9\�}����R[��2_��K��6�.8�����il�{w�����@�7�#Z�!�[Zb,e8=��e4��-�xLO�	F��^T9�Acmx��9k���7/L�������e?��ڬ��^�4�w����ac�pDg�]�\�=Z1ZT�Z�H���Eej�b����> Wi�H����ckx�i�(���G�o��G��N^/��yr�-t3CN��[�Q��^O0����n�P�ZR8�Yն9���6�̈���KGl�⁻��d�ՙ��G��FP�d���@/�K(����Є����7NRM�4�ń�";�`�z�#�v"jq���d�T��l�p���WnK�'���/�I�(JY�R�v�Q8Q�"Bѐ�W�m�����4�W u�h��󣝥d�We���7���o4������E| 3
���f�'Uq��{��q�����4/�>M
�$מK����+� ��7-#�(��oE�R�3��pk�,��9���)͢����~Q�	�o��F���p�2J�SQǬ��}��gI�F��-��j�%�	�p�e��΅i�K�Y���+��M�Ѣ~�ޗ�E�LV��͎D��ky�oKI,���ݮQi���l+��U&Mi�����Vd�N^��s�o򑩎9[�\�3�s���	~2�H/�L�{#�j�tSCI�	�l�G�k)L�٤�����FP4$_,�M;��|���g\�Ipc��wx������L-�j�k����0*�ۜ���.�:�ץ�d��-��*�ֻQ�#�B��@��]Ўw�����pD���dw�����p��M�yc���y}#hB{���bY�աY8,
4�E���y�[�K�FЄ���	m�UY�y^\>P��V\z�3���ݽÀ��jٖ�,x�e��e:c��RD\II�y����u^��=�lH�=�������Nyi����QF��u#�|[T�
�����;�Ɗƥ�$<�*e��AS�k!E���T���E�ɯ*�P~Yx|�dM\�y�;�}?��`i����v`�a�KB��2�nT�R�W�sC�xpT)�O{i_���Zx�_���0�uԭ%�^~g������F~�6�>���Jm�Bht�B�	[�6�:�#W����h�]1 i��Dc�s�I���7���	���L��۞���S��0�����EwY�hG^�Z���M�Z����3�j����4#��r����9�vELOͤ3s$[z�8�"��\I�6n����~'�����j��x$g_Z�,��S����k��j�Κ㣏Cim�K�U'��E��U����V��sA6eh��R�-_L��NC��>�zD�
f�)�66��\��a�xoE��-��Ž(��5a��w��Le�8b��g�p5%6Da�T�E����:<��b�xJ�*��|�~�ѕ���b@�.��p�S�&�.��hꎦ��gM܌��hr��,W%\>P�+����͙5�0����l�H;��x�L-H�ɷ�����������Fƍ�1��RR"�2C����&*7��/%&��	&����L�Ԓ\�7���	�l��^��qQ��2��I�������E�_�ۻ^�.�moSlg��"��]�T�b�8S�FD�(�g����AɥoIM�+[�滂��~]�w>&���2J��*��������W���	 ��)��ܯ��vqۛ���6֜Di��y��g��4)��׷�pyU��'�F�s�v)��]��<���hU�ރ�	�6�'9Z��*sS���vn�Q��,jK ��վ?$��&���*�1��|w��3#�˘���d��ȵd�<8���Z����:�w� ?����P��8�����JR:�;-��(��V9���dЀ�S]���ʊ��� ��Յ'�`i.�_�2sF�wl��T�h �Ė?���4z�yR�k�N�kj�r�����{\I��e�� O�Z/�c�j9%j�M �I}i�;/�r�I�{F5O�KݳXr����LO�M ��\t�R�G�� }\�G�d_������lMݯ̳	q�e�2��0H:U5c,�W����r߳�tK�q���~�T�3���B�	 �3�F,�Eu���l�WAei�KW���b����\�|r�U����Q��JGQ=j�M��Q4[�2�.�Ub��9X �g�2f����������(W�UE�|��l(#R�(j\�9��fL#�1��+�m���0�����k_�"�W#�M�
J�^��ʞ`/1��_�ب�?�E�&˼�):��N�H'�����)��ٛ��ap���3��@�sU��w����f�vS�Yv�>��֙�Ex���� ����Pϯ¹n�ԋh��L[Mhy��-ն8��x���1�Z�����X�]���|Sl�C4�ve�̅43Ji��#�����"/�����4��o�����2[D*���N��F-v4Hb�趪ˢS�s�Pw��8q-<���19Ѿ��:c3r��6c�C�_�a���F�5l�&�q�5.H���en���ql4��E�idH*��*8��H���k������i�T�ѩp�a����a�S4�&�V��%㻼X��=�DEYx!��1�h�����y�O���h��Iչ�}��6On�K4�����1p2����E$/r��z�����ߗ�/�&��޼/��S.�P�O�i�h��b�ӌѤ�,ߠ�i���,��^��o�&Ŏ��*Qv���2����r��M^
^v\�p.4:.P'xY���h&'7hvUҫь �Y��(�`��SM���EAv����'�\�ufU��v]��d��Q�sL%\7�i�������:�{����f�8�@tn�5����]�5��m_q'�	�^�_�F��f�%��u���d��.d����`��-�'���J0���:�h�}���b��H�Y�嶛K��v��^"]��8!4,y
?���~飬F$x��2���_O���a:�zS���f��M��e~ـ��K�9P�N^��v$�;�4\/�0%e�����3G�mdk�9���~.�#���E�l�S��
e�&0��V;���P�U��8����:d��%E]���jn��Fg��IU,󺬯^����dPe�K�ь���3kځ�u�YÚ�������=��q�����O��h�Yc(m�K�!�{�(�Q��7� ��:k,�㶌�8�M'    ė�VD���36���}	e�U���<yW\�d����h�ܛTz�R*}D�B+t���1�<\F�5B�ýңux<(��T޲�*��D+�wP�j���j���jG�H��H�M�X�|���Iz�wXh�̜��*o� :�ڈ�
��ԮH���pSV5k2L��S�@0�YO�)��c�;��I^��c4��F2��c��q3��5��\��5z�tMY&��*Υ5eiLg���4�լa��auQ����'=�B�^�$�����P��X���%��2{�׌����kE$� �W��F���Kx�p�@�s�h=��{���U3�H9k��*�"����M
}���Y7�Mu?�5�Da��tO�6BI|�����A�Rx�я�2 �5��k(jM�BO�ɤ]��p�3�c�~D`R�,v��ʯ�C�og��j�zle�c����4��&����ohgj��*���.����
�d�g�(,ƽ�O�#�KhhŲMKw�.Kڵ3��к,165�v�
��K�J�uQu�m�Mɼ�Z[�S �#]i�`fpK���.<g?þ&x� e�ݘBP���P����CҀ�6�#IĔ+'UN�,:W��"�,��[�x��{x�J�$-�;���;�H�eU���|��RO�d�OuX�5�HZ+m�|o���U�R
q6j������)���\�7po_��:o���)y��sGL�@޽�Dꬑ���ŭS��W���z7��c�{7t��bn�%k]����IkX�9��5��!6k9�"׫r7Hu@�E趋2�D�5s]�:�&��5��8�N�o�m^��>�A8����}:A8z+�Y�\���;�ֱ.^>��+/�F�c�w��_/?k(%��%�o����X �Te�QO��^~n�=�g^g!2k$���x���m[ �v�#����yِn�W[V�LM�j�D������
Mb항��{���O��W�z�Av���2*;_w�M_��>gUj3Fn%�{�Ã������#O5Y�5�%�v���$:�X?|�~�ۜi-R��ϊ��V���H�� �?�j5xY���vm/K�yY҉r�Y��I�ͷp2e�s���\�`�rM�!�I�Qy�0%\$�u��m���D?x�ȍ�|��?c��2�"	z%�C/)�828	]ᶳ
�<�>���W�>�=��z���V�Yj�(�TN���5�
���ur��0��r; ik@��	C:5���Ⱥ�3���>[�Ҭ&�$���f���2W�s� �1�;ӻ�u��B��Ȕ3!`i�=��o�h��Έn��m��a�y��mYb̐��lL����:4��xw��_����2�.�D>��y�Pg�#ޕi�V%�E�Z�t�M)��#�`j{�K��VP�s"��ũ9��|[o�3��87�:��ɧ]�6��xk#-�X⤣��87
�٥���(���(��eF�m�v�`�T�[����i�1-��%�e?�@ۆ<������s�æ���H�y.l�s��ρѹ
�1�m�J�d�m�D�}EFZWjǩ\K((��v��LC��p|�ʴ3$^v�6�ƣ�ɷ�u'"9<�EHo���Ҙ�&%�-��5�_U���
o��r��,�M�k�x΢A�Z	?DGۤ٤њ�L�����9e�|s�ȶ������a�¹�N�0���9�FN��+��X��:��m��]\�N'��dw3*���Ԙ�����6���ѽ&�Cφi�p�cz����<�dF�(��sY��}so'�j���#�p��'���KS�r_mV�[���E�It,�:�����2��s.l�ç�(^�/���l��7�rUP�Y��l� �y���WZ%�;M�}Z�;|E��$���h%]�aS�:Ӫ9Bh���8;;|5��
�B��K�~$M��� '�k>�{hɫ\r�w���+�X'-#E��}))�
>�a�4���x�����	�k��(���4ͧs�h��k1z�x��	�0�̋�k�/��!'�s�pU����P;pU;�<N)��Yg'3�kn�
r(n���x��`¦��Zk+�vcS[�s�.�#����0#ܯB�wL��׆l���䣹�-n�RsW�6*sQBe�r���9O�O�LzaC'��.�v�>�ܽ�C���P���k�\Y�C����>�s�O�ҋZ#]������\6ks,�8b�#v6����	�ׯ���y��p#<w�c�������ږT��*���4�>��+#�\a��Q�]�c�nOn����O?�t�'�I<~Tx���)@s���w�����}���g�[�5>�Y[�4��A�sD��M����R��3���J��VJ;��h�.�mQSL'�@��<�'0�;$�(�uYo��u���lzB�0�~ּ�0u�4G���,�n̭eB��2�KO3�"1�Y]���9x���&1���<��!dl����5��t���}	�[̀���Bz�	��[�by�c���P�R�GxHm�S���;��L��B���ֺ/_�3�5�����+X2WLS��E2cYl�AF	|�M�)�<Y�n
d�n�C@84�~1��Jp�^��DW�M{�_�;,g�su>hId��Jҵ$�j����#'�!/������?�;rd�'$莧�T�����i�k�ZhT蔍;�q(O��鰤61!�5�r�wG\v;.Q�簫V��r�_��4G%yg�"xnV��b)B�S�f����7y�*Rlr\�?�w���\���d����W5�Mv��o?M��^�#��P!�1� �C���՝��EL�R�vT՗uUI�˯�C}]ojR�k�a�u�N�%�ѳ[9�NӬ3)��G�!�p�n���b]/qչ�_�K�6���܉��X�,�ItqŲ,���0�"����0g�m�B��*���>���'�S���r����1�W}�Q�/'7���6��W�끏�
~J�]���NCC]�9�M��qa�Z�m�quؤ�0��p��ך�i�#��)�|�׆�A�(Ԍ�2�VQ�=stL-.ѽ��#Z<^��{�k�5���Q����a_&��� ��;��/Vt�M�=^փg�� ��&�ԚkL^,��z�5a����hG��۵/B�el�	M�r?tx*��ϒ�['���=�a��o�P ���a T��@A��{�$�~0�J��q(sAf�t��2��`��w�yb=p�5�ވ&�g�N�y����Ip�����f�]� �2?89���F	af(;��t�'�Q(��uIr��l{�;z��T3-��wA:5�6|L�����V^����w��3�`�@�%�|����y�]�p�%�u�
��ቶ	�"��s\*9R�Ri<[%)(��b�/[Jk�}���g@�?�@_���-z�����F���5%�	I���t3�]D�V{�0j�K�����M���r�oh����wm�����e������ ѵ,ޟ]��9Ҙ���k��ʜ�6�w�8f)���� ���~��@��s�
 rI|��D�Q��zɐ�u�EWo��NN �P����{��	����5�~źءy��e ��l� x�>i'ڍ�s��l�䤮P�]B'���#]��P\��
�!�Y�PM�U�i�P
ހ��v�S��o�q�T���n)�gRu|�����l��U˲S���}|���q�[�;q�Sg���Q�9�=y
}�3�D�C7�%R�@�J�w��B�׎�Yh���͔F�@���U]ݠ�������x$�sm�����JC�J)V�����>��w��%�h���U���>�[�[d�C-�wC
�w}7j��T���|��l��Q�+�
����<.s���p�1dM�s��P��9u�A�|�mG����\�XE3����u�*�D>�l�C�
2�;m��pJ'eZ���yat�3[�/���Q��
T���A�ܾ�~f�|Df t*.��iH��|��vQ�g��Rz^�s�R����>̒0�z�ڲ��Bm!�5�3��=�D�!��P���
>06+�}���e��{��4�vS��W���^�u��b��E~� �E�A��Bש��W`6�`�	����T'[���������    �/:U
�]�~��:[�V����|�#}�%(B�ȓkl��N�de��t'�A�f#�DI�l���>ar��o�M/IE��%��Lf�w��Rd�%<ł#�D���WI/K���M�I(��-O"���;[��\�G|�k��}�pvK;�K�m��lB�{��7>��:_��J�SMsT��v�&�nPI�@3 $�Ǽ�	w^V��yU݀�����H������kB�u��JFn�%�W��bl���g�&^_�q�Ŧk�F��6G�)I��F�DF�r4$�Z���(�I�x쮅�&.(cG�R@C}�Ԅ�zZ��\�ԩ�J�"��/�� 
;|ꭌ���Z���y���@F�hÅ���}fhO����Jrog����u�����*�u�P��f��5h��X��f(�G�O�:6��~�,#��k�Й�F,~�T���,�;G��1��^�;�)΂:�|J�����i���|[գ�8F��J%m܀s�<w�r��ɵ#�2G2cRTW(x+��I�R�0����-���c�-�$�Z��MNYvI�\����.�y�����T�Z�����Y�yfc�r�M�$�-��[ �Z=�+z�ð�xԾ衭Ge��Z����t���~�tcΓ(,��.��#�*:I,1�҆�ڱ�xW�ۢ:/��9�K�ͮ�E��C�j��ad���Hro��w���j��d ������x�����i��~�\����Yt�k��]Pt�G���F��5l;�p�\\��v�����	�Z;Ykêz4Ǩ�$�1{������0Sv�\vc\Wm�$�����N��ܸ,��<<�E����x�kT������,�Һ��s`׺�#��"؊aʢZ�k�`VpH*�=#R��^`��B�ӧ �)0�!Z#{�(k؎VS=���:_��>��gV8*���ۅᶮ��C:��0�Qn���n�xGL�@�/���p����zIၯI���S���u���b��x��zs�&4]MPn���l@H��,rR՛��_�xe�H���G��#�_1�`(H~e9 ��%�(��>����RK����F�*0��X��H���K�-m�1�=!�N�E��	0�f5_ %����Z��p'p(��E��h]�ݏ�js�������a��q��<��U���bo� [�?�]>�a�V�G�\9g�#�t���CM,�X����b�C��q/8�p����� 拣!���W��v`.��	����SM8`�j7��-�w5c�	�'�XЮ��7d��8_)��z���m�$p�x$.�ϡ+ǥ���N����CFp�]�"����r�%a�Eq��ԭ_MGg��PS�6�Z0<_09y��o������a���%.;"W�s��~FŃ�pWuU�ǐ� C��a>YG�����М/��w���-���f��k ��qƹnI�^������a,pJ���G�Qɡ�֥w7�nla\�9����ƽL,(*@qW��v��k ���p�ty6!ޗ	?��S�$#<��9�VhU����Z�	 ���/<�c��k�|&�_��"����Ϸ�"v�{�5;A8�h��:��s���N���֭�c�����Lf��lm���j��"I����',����I��I�g6��A�48��U]���)/�=&��Ki�v��C U�v�Y��9/��nN��/����*�����X��~�ƃԄ;L�z�G�C�usS�狤�e��$v�[n���.��-ws��
�af���'�|����mEM�dn���=ٕ��ze������c@xN�T���2�q��ER�����ne��"t���5��Ӌ��	���P������"Y�r�G|�Y�s��D;���#F}ñ���ݕ%��W����+hSW��&���bY,jԒ���KC��/ߎN���w8 KTz�$ē��Tg�/ x�T ��♹P�����@�z��|=T����3��S<(����V?0(S�=b?(�ѡp��0�d������ǯI��������c`�5�F�T!dOv�ه�?,�B�	 �z��8q"��~}�zq"�gƈ�
wT@B�s���|�\=�������?.!_�C�/���Kt1VF����&~OY?y8%�O����À��g�H!<;8c�d9�YO����b;���pѨTn?�|+��}=t�uq�(���pL.�MK�s�#��r��(�*�mS��-���Td{�|L�ǧ?N	W?%��yW)[JH�ֶy�V�%jfKT�̃�Y���
z���"�U�	���}y(�����? �W�y�fM.��RN�?N3���z�j�_�a�������!6�B�t|z�p���z0G	_+;~�s�β귱(v��2�>�����o�F:�`��:�V9�8�h��w^�odJ.�_�ps��@ۼ<+(������m7P���4x�3R>�d������
���<�ĕ��^�>��l�O���moX��%H�j��Җ�Ȱ ;Ǡ�#�-?���~�)�9~轅��5�x]ٽ��s�������3�$����˷�1�44#��8V�93��[�4~��w{:�> X�	Jfci�1�j��U��?>�[&<K@��R����&����=���O����|��0�|���T��5_y)�%zpY���|w�����Pa-��17S�,R���l��f)Y>}�i�������1�N_����c�%U��7��޵�<6�aBKӨ��y�k'-��;�> ����)������07d)Y�|���×#ֽGٌ$�j�䎂W5�V�� ^=�y#�2R=�z|��h��N-�Ծ	e=��W/���bO�?�0I��y�[]8I8�mD�Ӭ���!�Y1�EF����������?�&�r�X�M�t?r��FS�mn�#h�>e�!����/�w�pn�������p^@����VrΜ�	sZ7U���#�:�ǻӧӃ]-����m��\"<�Ȳ❹�h�;>��;���7JA�����p�*���rzi���]�bD@jry��t|:�<\�e��̱#�J����D��NO����T��L�θ�a�8�A�ۙ�9�T~gS ����z�T�3΍H+S�=~��nV+Th��ʢ���.�2�Q�m"� ��,�С&_�w���AB6���\T+O�����^482��v��\c�5�6
��ڵ���?�؄/�#��NIu�����q�g����9����>z�Z/�h^���I����G���£Fu&���5����h�����X#���Y�k�/��E{ %��>���3�K�	O�e�`�:
�U�ń�"���Ӈ�Gw�a���ft���=T�35����z[<�Q�5RL
�Q�C��/�=~�v�N&�:C.�5\��P1�����"UJ���N��ǧ{xA��	�y�d>c���5e��3��=����8��|���4��d�(�H�h;�NۉDF��}A��g�^�Ζ^:��G����OO��{J��_����_��6V�kƥYk@�5Wu�G%O4h
�;~�7��jP������Ҙ��z���	���������A84��7�mDg�B	��a�Vtc�Ѕ���Џ��s#M��h0T�z��4���n�&��d��5nk;�v�&]g����5����+	�ǯ��E̓E�xQ{/Q�ҿ8��@iH����������~
�|��AZ�18�A�w�S~�#�V&<u
]����Q�n��<XW;v��BY�o BJ���������]��c�D;.�/�F#×�����)>С�P�Ft�J%~(r�������r8��]��������P�ՇSR}C���*�g���&�:��+^Xk��عu�C����5�r_�Z33�����t�J���xW6u*x?�)��/��n��PT�w+ܷ�ۃK�!MH��p͜s��&�M��ݙz�~���>>$��~��O��y>f=��l��B459��~m-K�;�xr��^�$^/��J�~H�t���< ����4�)��Dм��I�Y��_��l�G�P�>}8���&	�mn3�v $   Z���N�O��M������L����],�T� ����I��oV"��9�ix��t�s���<�qB(H���x�#I��3%�L��:��^���5�o��,��rh�'y$d�y�z$���Pb�m~=}:�B��]=���o�HEښL�^��6 Tgk�A9�����d�z�bOj�������������}M�1�����v��+c/�p4��2>��GN!9���_�|����p��9���jFٛ��N3�{�8 �������t���';���aU������@d�z�G\����CiBf�A��z�c,��A�P����>y�m "�O�b�[<�B��������֩��R��lT�Y
�BFO����(3�*���Z����Z)���O���f��X��_(T+���Љ�3��K�	[�j������π�g����Z�H+A�э�V������Lq�X#�Ͽ�>V��q��M�q}bZAG*��z�(�������6���]��s�	�y1���H ��:�Qݶ<�:����m �x+ R\�[AQ�G�H�.;�k���X@d����t�@���aD#T��u4�6��ha�a�H$H��ύ��m���PNg
�p.swI}�|���M�(.�1B�1.ZJ�s�m��	VG������K#i�HS[�D�Љ���)��,���Wrs��
�������,�/t�.�RN/�;B��s`w��"�ǻ�ݝ5�����U�5��c���3_���Ӌ��6k7T��,j.k������3��f��өOH����_��پ
��G��E�Ѱ�?�����D��	����`�ָ^<�W�3���f��N�bN�(h����Υ��Q�Ld8U�;�18�RN3mI}�[Ǵ%�c�~,�-־�~=�0<��'9stN��l:&s�rپ ,s�V�`眎�V-a<�CLg�r��y@�ɬX(;�k�G�@h:'1�ѳ,I���E2����{jzeo��	��.=j$md��S�\}:~��M��G?9�N�dg y�:2}a:S$5ɿ���>1�/T3�>C��9hB���7����0�rw{
Bp[�����[�>?%ۏ��И���*�F���O���9����s>�j����w$)�Ӭ�i^�oP%2��ߩ䭏�(+>�@�p�:�e�0,��&-���_�����o���=J�1\c�7�P�{ /f�u���J������r�;��������~rc�<�����~�&]��O���/��/����A����/d�C����{�����??������3��      ,   r   x�3��L*��RN���Ģ�DN#]C��4���!###]K]CC#+#c+#s=KSss� 24�2�t�L� H&ZZZBM��j��������������)��1z\\\ ��%      .   [   x�3�4�tN-�L�442# �4202�54 "ΐ���l��̂�N��i "����R��D��������@������� �͹b���� T�      0   $   x�3��I�L����D\F�!�)��
x���qqq mT�      k   I   x�3�,N,)��)(p�J�N,*I�K���L�4���C ###]]##C+S+SK=sSScc�BC�=... 1�2      1   �   x�Ő�
�@�뽧�����i#X�N�jzz���cb��u�ea�faf���w�M����3�>1(h�@HT�/�HQ���$��}Ce"�}E��:�
v���O�� ���K�#Dt�"�,����:��qڇ�3Cj�t�r
��f�Bi�5.��
e':V���̚��B�����      3      x������ � �      4      x������ � �      5      x������ � �      6      x������ � �      8      x������ � �      :      x������ � �      ;      x������ � �      =      x������ � �      ?      x������ � �      @      x������ � �      B      x������ � �      C      x������ � �      D      x������ � �      b      x������ � �      E      x������ � �      G      x������ � �      I      x������ � �      K      x������ � �      d      x������ � �      f      x������ � �      M      x������ � �      O      x������ � �      Q      x������ � �      i      x������ � �      h      x������ � �      S   3   x�3�4202�5��56P02�2��21�304312��"������ 
�      U      x������ � �      V      x������ � �      m   �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU      o   e   x�u�=
�0�99���I#�M����k���Fx[��K^���&�@s�8D�ʙ��d��K�, f'H�+X��e��-%�4�8��6"�	��8,      q   �   x�m�;�@�z|
.�~���PR��s�3��� ��v�dY�f�ry��z�^x�����e.1�秿�r;�6$
MĦ��l�iӏ��rｨ�$xF���ȳ�u�"t�b��E�*���t�&���.&�����6t�	���P�`Jԧډ	�K��T;1�}�O�/�_��s����3��h,X� �Zʏ      s   e  x����n�0E����d!	}�K\�A'������M��li�Jy�B�1s�X�^OhQθL���$ޛE�B|��( ��y_*���
^��|↽�r�6-�}A-J1������A� 18<И]��NYe����f,~�%�T�Ɂ��&��M9aE���04��ΠK��>�Y�C_Y4��0�%^��ChS3����q��q��^�����Wi�|�*�H�Z�wef#'F����;�w�k�qTR_�\_Z�?���Q�IM�e=o�bjִ��Q�Ƥ�]����G��roa;g�^���j�_q��nĥMѴ�r�������)�:u��E\���D<��h1브)�1uo�u�cI�~6SZقK��iS����?G����)�<u�&�8�lƅI�0�z�l�������c�\@�S4���t���ؼ��(� P��CX��@)�9��ӄ%� .#׶4���+p<�?P)��H�_[���/�U{�f��^L��@a�fl�̼���d=8�����t�fXB�i�G�ܽ�n�t�Il�9��"gw��,�%�c���/�y��+��(�e!^���<���(���v��(��      u   �   x�}�A� E�p
. ������Hj�`S[������&F�Y�b���c�a��U�jZ2Յ�0#��0 ;��,)�:��:����}�H9f.}?��X��j�s��o�  �&�**=WW�����fIL�tN|~Q���C��N�+��/eQ����F5�cy���q��_��=@:X�«�\���h/O�      w   �  x���Mn�0���S��Y��v�ӈv �$)�?G�LK�,���^U=#� �!U#,����E&�g��*�ԋ�_���i�n��V;/,~�(vk׶_buC�߶�{u�)����� }c��h���܎ט �Ę����2�k�T�5V5��Nx�Öi�0�����������v�2�;��B96Ú�!�����K���$��N��Ֆ^��ʰ@i�o�Pg4�؉%���j��	��H`4u�ʐ�i�"q���0��S�\I�|)]���k��RZ�);��ԥ��~��
�٩K����X�%��j�s�1u�qd�����V��	ӥ�W��OW���s�Ak���@�S�U�[i�>�m�8��m���a(w��R����2`.��X�]R]k�gR���ǘ��l��~�O��a�w��F����0��<�j�i��H�(x�h�lɀ��"�t��~,�S�6\9+ľ��x�Ǚ#Z�uz��_.�/�a�      y   Q  x���A�� E���@8�@v���APU��?�@*u�t$F���o����1Sjϵpq�1���1����'	���%G-���Eӱٍ4S��B���a+���rB	�A�$)�N�[,>?�V���r4���b�g��.%��f)�j�3���ί�\kv
4׃�НV{W�ts*]�%�-�9MG�pV���q�S�۴Q���AX�z�~w7%�s�ף���[m��
�:�klO��KQ釻9O[QX��_�Ps) � ٺ\��nُ_�
�鱬��螏�M�AH�+�U�c�\\┼;%�^��_~�r��s[��������>y�4.b�Y      {   �   x�u��
�0���)rl��M���m		A���9�#�C�83���[�Gy��PB�Wа�OHU���J����
�2�A0yH~�y���Zi&n�����r�F����,��l�C\��}Ii���cP5��݈M	!^8�      }   �   x�U��
�0�s�y�����Xo��Efs�e��v:D!�O೪�K�g��ι��M
�O�K����<q�TT�֬�!$jqh-��)`o\����[ӏ.\���@�t�eL. I��[���_��`��O����[�*)            x������ � �      �   S   x�3����S�,-.�,��4���!###]K]CCS+3+c=KscScNC�.CNM�ZL�LM�LMMM�!Z�b���� ���      �      x������ � �      �   �   x���=
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
�e�����	�3U�N.ps��=@~h��0�d"��'166?�)���]��&ӆ� �����9�Ob��T!�k�{��v���i2HVj�p�u\��y83�JL y�K�F�\O�(f�<�����>���$3�T/�8&��R�`�Oh2{H ږ6:Pb���!C���)�j��c��ԡ��5�t�z�6[��&��b�&�/m�S_b�P�k2|(�3]� ��M~�Qy8�L��Xw����D�ݨ����3:m(	��Ώ��,2:J(���vX��2���'�b4��5^.��X{D��iA_�xr�s�:����N�q�n�#���:{�����.��f/8x'{����EspԴ�K�;�����d��>��y=E5F�L(Z \���e���Lf-�:L5��;��D�YB�����X��&����ԏEb�ɨ����!`�p�t�;j-4���}nwN��##B�A���l�q]`�ȈP0(�}[`��!�A�,����J�<���X���_��H�� K�cd�pR�W���1�dB)�7�����]��&SG���>+�*��������C-��      X   �   x�}�Mo�@����+�`�\�a�"-��Z��̈́�[q$*���4�tלw}�H��.��2ꪺ�SL�x�ل_r{�.8���"�nୟw��p�+s*T���g�Sv����/lٞ�v��/� <OL�B�\��I!�0G�+�|8��&�Q-�����2�͎�|����i��{}���al�T�O�l+_b�4�ݿ�Q�k�4�RD��nk�q�0�Ff      Z   �  x��T�n�0<[_�? �O��P�r��)�"��);=��۴(d�`3���u�8��p~�yY>�_�/�'��IO�]ȡ�n�<|��Ws��M��ݟ��3Aj��H>�����_9��(Y�94#�����Nr^���J78D����l��̐	�H�1G�zBu1�Z�`�kjƖ0�EÛ���U'qn�Hnt[S A��sglӝt�j��8{ʎ�8D,m�8��#�T8��btlv3�,}c�7��O@=a/�\�5#'\F؆Ϗ/�/ϓ��0!Y�41h_��XG��Y�,2&p��~{���P+ ;�����Ѩ]��֠$[�n?�M�!�*d�p@�@�$�eY������*Bz#1�6,�\�5�L��@l���~����2��̲u�:JJ�>��      \   /   x�3�t,N-���D\F�~�y���9R��SS2󰫈���� �f�     