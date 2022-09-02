PGDMP         7                z         
   dbsisappra    14.5    14.5 �    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16760 
   dbsisappra    DATABASE     U   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    16930 
   auth_token    TABLE     �   CREATE TABLE public.auth_token (
    id integer NOT NULL,
    id_pengguna character varying NOT NULL,
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
       public         heap    postgres    false                       1259    17059    kepegawaian_pns    TABLE     �  CREATE TABLE public.kepegawaian_pns (
    id integer NOT NULL,
    nama character varying NOT NULL,
    tempat_lahir character varying,
    tgl_lahir date,
    jenis_kelamin character varying,
    agama character varying,
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
    kepegawaian_golongan character varying,
    kepegawaian_tmtpangkat date,
    kepegawaian_pendidikan_pada_sk character varying,
    kepegawaian_jabatan character varying,
    kepegawaian_eselon character varying,
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
    updated_by character varying
);
 #   DROP TABLE public.kepegawaian_pns;
       public         heap    postgres    false                       1259    17058    kepegawaian_pns_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    259                       1259    17070    kepegawaian_pns_keluarga    TABLE     $  CREATE TABLE public.kepegawaian_pns_keluarga (
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
    updated_by character varying
);
 ,   DROP TABLE public.kepegawaian_pns_keluarga;
       public         heap    postgres    false                       1259    17069    kepegawaian_pns_keluarga_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_keluarga ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_keluarga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    261                       1259    17080    kepegawaian_pns_pendidikan    TABLE     t  CREATE TABLE public.kepegawaian_pns_pendidikan (
    id integer NOT NULL,
    jenis_pendidikan character varying NOT NULL,
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
    updated_by character varying
);
 .   DROP TABLE public.kepegawaian_pns_pendidikan;
       public         heap    postgres    false                       1259    17079 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.kepegawaian_pns_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kepegawaian_pns_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    263            �            1259    16970    kondisi_sarana_prasarana    TABLE     h  CREATE TABLE public.kondisi_sarana_prasarana (
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
       public         heap    postgres    false                       1259    17095 
   kontak_pic    TABLE     �  CREATE TABLE public.kontak_pic (
    id integer NOT NULL,
    nama character varying NOT NULL,
    telepon character varying NOT NULL,
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
       public         heap    postgres    false            	           1259    17102    kontak_pic_id_seq    SEQUENCE     �   ALTER TABLE public.kontak_pic ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.kontak_pic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    264            �            1259    16978    laporan_kegiatan    TABLE        CREATE TABLE public.laporan_kegiatan (
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
    updated_by character varying,
    updated_at timestamp without time zone,
    tanggal date
);
 $   DROP TABLE public.laporan_kegiatan;
       public         heap    postgres    false            �            1259    16985    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    17028    laporan_kejadian    TABLE     �  CREATE TABLE public.laporan_kejadian (
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
       public         heap    postgres    false            �            1259    16988    laporan_kejadian_dokumentasi    TABLE     �  CREATE TABLE public.laporan_kejadian_dokumentasi (
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
       public         heap    postgres    false            �            1259    17035    laporan_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    252            �            1259    16997    laporan_kejadian_jenis_bantuan    TABLE     �  CREATE TABLE public.laporan_kejadian_jenis_bantuan (
    id integer NOT NULL,
    id_laporan integer,
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
       public         heap    postgres    false            �            1259    17004 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �            1259    17007    laporan_kejadian_korban_jiwa    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_jiwa (
    id integer NOT NULL,
    id_laporan integer,
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
       public         heap    postgres    false            �            1259    16994 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_dokumentasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    17014 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_jiwa_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    17017     laporan_kejadian_korban_material    TABLE     �  CREATE TABLE public.laporan_kejadian_korban_material (
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
       public         heap    postgres    false            �            1259    17024 '   laporan_kejadian_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kejadian_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kejadian_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    17038    laporan_pengawasan    TABLE     ,  CREATE TABLE public.laporan_pengawasan (
    id integer NOT NULL,
    tanggal_pelaporan date,
    deskripsi text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by character varying,
    updated_at timestamp without time zone,
    updated_by character varying,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    id_kota character varying,
    id_kecamatan character varying,
    id_kelurahan character varying,
    id_jenis_pengawasan character varying
);
 &   DROP TABLE public.laporan_pengawasan;
       public         heap    postgres    false            �            1259    17045    laporan_pengawasan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_pengawasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_pengawasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254                        1259    17048    laporan_tamu_daerah    TABLE     �  CREATE TABLE public.laporan_tamu_daerah (
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
    id integer NOT NULL
);
 '   DROP TABLE public.laporan_tamu_daerah;
       public         heap    postgres    false                       1259    17055    laporan_tamu_daerah_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_tamu_daerah ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_tamu_daerah_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    256            �            1259    16880    master_agama    TABLE     �  CREATE TABLE public.master_agama (
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
       public         heap    postgres    false                      0    16930 
   auth_token 
   TABLE DATA           G   COPY public.auth_token (id, id_pengguna, token, create_at) FROM stdin;
    public          postgres    false    233   ��                 0    16945    dashboard_kepegawaian 
   TABLE DATA           �   COPY public.dashboard_kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, usia, status_ppns, is_deleted) FROM stdin;
    public          postgres    false    236   ��                 0    16937    jenis_sarana_prasarana 
   TABLE DATA           �   COPY public.jenis_sarana_prasarana (id, jenis_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    235   |X                0    17059    kepegawaian_pns 
   TABLE DATA             COPY public.kepegawaian_pns (id, nama, tempat_lahir, tgl_lahir, jenis_kelamin, agama, nik, no_kk, status_perkawinan, no_hp, sesuai_ktp_alamat, sesuai_ktp_rtrw, sesuai_ktp_provinsi, sesuai_ktp_kabkota, sesuai_ktp_kecamatan, sesuai_ktp_kelurahan, domisili_alamat, domisili_rtrw, domisili_provinsi, domisili_kabkota, domisili_kecamatan, domisili_kelurahan, kepegawaian_nrk, kepegawaian_nip, kepegawaian_golongan, kepegawaian_tmtpangkat, kepegawaian_pendidikan_pada_sk, kepegawaian_jabatan, kepegawaian_eselon, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, kepegawaian_status_pegawai, kepegawaian_no_rekening, kepegawaian_no_karpeg, kepegawaian_no_kasirkasur, kepegawaian_no_taspen, kepegawaian_npwp, kepegawaian_no_bpjs_askes, kepegawaian_tmt_cpns, kepegawaian_sk_cpns, kepegawaian_tmt_pns, kepegawaian_tgl_sk_pns, kepegawaian_sk_pns, kepegawaian_no_sk_pangkat_terakhir, kepegawaian_tgl_sk_pangkat_terakhir, kepegawaian_sk_pangkat_terakhir, kepegawaian_diklat_pol_pp_dasar, kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kepegawaian_diklat_pol_pp_strutural, kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kepegawaian_diklat_pol_pp_ppns, kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kepegawaian_diklat_fungsional_pol_pp, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, foto, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    259   ][                0    17070    kepegawaian_pns_keluarga 
   TABLE DATA           �   COPY public.kepegawaian_pns_keluarga (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    261   ��                 0    17080    kepegawaian_pns_pendidikan 
   TABLE DATA           �   COPY public.kepegawaian_pns_pendidikan (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    263   ��      
          0    16970    kondisi_sarana_prasarana 
   TABLE DATA           �   COPY public.kondisi_sarana_prasarana (id, kondisi_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    241   ��      !          0    17095 
   kontak_pic 
   TABLE DATA           �   COPY public.kontak_pic (id, nama, telepon, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by, status_pic) FROM stdin;
    public          postgres    false    264   ��                0    16978    laporan_kegiatan 
   TABLE DATA           �   COPY public.laporan_kegiatan (id, id_kota, id_kelurahan, id_kecamatan, kegiatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, tanggal) FROM stdin;
    public          postgres    false    242   ��                0    17028    laporan_kejadian 
   TABLE DATA           7  COPY public.laporan_kejadian (id, tanggal_kejadian, waktu_kejadian, id_kota, id_kecamatan, id_kelurahan, alamat_lengkap, id_jenis_kejadian, uraian_kejadian, jumlah_personil_satpol_pp, jumlah_personil_instansi_lain, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    252   ^�                0    16988    laporan_kejadian_dokumentasi 
   TABLE DATA           �   COPY public.laporan_kejadian_dokumentasi (id, id_laporan, dir_file, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    244   {�                0    16997    laporan_kejadian_jenis_bantuan 
   TABLE DATA           �   COPY public.laporan_kejadian_jenis_bantuan (id, id_laporan, id_bantuan_satpol, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, id_bantuan_instansi_terkait) FROM stdin;
    public          postgres    false    246   ��                0    17007    laporan_kejadian_korban_jiwa 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_jiwa (id, id_laporan, id_korban_jiwa, jumlah_korban_pria, jumlah_korban_wanita, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    248   ��                0    17017     laporan_kejadian_korban_material 
   TABLE DATA           �   COPY public.laporan_kejadian_korban_material (id, id_laporan, id_korban, jumlah_korban, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by) FROM stdin;
    public          postgres    false    250   ��                0    17038    laporan_pengawasan 
   TABLE DATA           �   COPY public.laporan_pengawasan (id, tanggal_pelaporan, deskripsi, created_at, created_by, updated_at, updated_by, is_deleted, deleted_at, deleted_by, id_kota, id_kecamatan, id_kelurahan, id_jenis_pengawasan) FROM stdin;
    public          postgres    false    254   ��                0    17048    laporan_tamu_daerah 
   TABLE DATA           (  COPY public.laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, id) FROM stdin;
    public          postgres    false    256   T�      �          0    16880    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    224   q�      �          0    16826    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    218   �      �          0    16862    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    222   w�      �          0    16795    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    212   "�      �          0    16911    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    230   ��                0    16921    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    232   ��      �          0    16900    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    228   ��      �          0    16890    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    226   A�      �          0    16852    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    220   �      �          0    16806    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    214   ��      �          0    16816    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    216   �      �          0    16785    pengguna 
   TABLE DATA           �   COPY public.pengguna (id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    209   ��                0    16962    sarana_prasarana 
   TABLE DATA           �   COPY public.sarana_prasarana (id, jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    239   ��                0    16954    status_sarana_prasarana 
   TABLE DATA           �   COPY public.status_sarana_prasarana (id, status_sarana_prasarana, is_deleted, deleted_at, deleted_by, updated_at, updated_by, created_at, created_by) FROM stdin;
    public          postgres    false    238   �      )           0    0    auth_token_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_token_id_seq', 19, true);
          public          postgres    false    234            *           0    0 )   dashboard_kepegawaian_baru_id_pegawai_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.dashboard_kepegawaian_baru_id_pegawai_seq', 1, false);
          public          postgres    false    237            +           0    0    kepegawaian_pns_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.kepegawaian_pns_id_seq', 1, false);
          public          postgres    false    258            ,           0    0    kepegawaian_pns_keluarga_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.kepegawaian_pns_keluarga_id_seq', 1, false);
          public          postgres    false    260            -           0    0 !   kepegawaian_pns_pendidikan_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.kepegawaian_pns_pendidikan_id_seq', 1, false);
          public          postgres    false    262            .           0    0    kontak_pic_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.kontak_pic_id_seq', 5, true);
          public          postgres    false    265            /           0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    243            0           0    0    laporan_kejadian_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.laporan_kejadian_id_seq', 1, false);
          public          postgres    false    253            1           0    0 %   laporan_kejadian_jenis_bantuan_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.laporan_kejadian_jenis_bantuan_id_seq', 1, false);
          public          postgres    false    247            2           0    0 #   laporan_kejadian_korban_jiwa_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq', 1, false);
          public          postgres    false    245            3           0    0 $   laporan_kejadian_korban_jiwa_id_seq1    SEQUENCE SET     S   SELECT pg_catalog.setval('public.laporan_kejadian_korban_jiwa_id_seq1', 1, false);
          public          postgres    false    249            4           0    0 '   laporan_kejadian_korban_material_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.laporan_kejadian_korban_material_id_seq', 1, false);
          public          postgres    false    251            5           0    0    laporan_pengawasan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.laporan_pengawasan_id_seq', 1, true);
          public          postgres    false    255            6           0    0    laporan_tamu_daerah_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.laporan_tamu_daerah_id_seq', 1, false);
          public          postgres    false    257            7           0    0    master_agama_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_agama_id_seq', 1, false);
          public          postgres    false    223            8           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 1, false);
          public          postgres    false    221            9           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 1, false);
          public          postgres    false    211            :           0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 1, false);
          public          postgres    false    229            ;           0    0    master_kelurahan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 1, false);
          public          postgres    false    231            <           0    0    master_kota_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_kota_id_seq', 1, false);
          public          postgres    false    227            =           0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 1, false);
          public          postgres    false    225            >           0    0    master_pendidikan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 1, false);
          public          postgres    false    219            ?           0    0 "   master_tempat_pelaksanaan_1_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_1_id_seq', 1, false);
          public          postgres    false    217            @           0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 1, false);
          public          postgres    false    213            A           0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 1, false);
          public          postgres    false    215            B           0    0    pengguna_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pengguna_id_seq', 7, true);
          public          postgres    false    210            C           0    0    sarana_prasarana_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sarana_prasarana_id_seq', 13, true);
          public          postgres    false    240            D           2606    16953 3   dashboard_kepegawaian dashboard_kepegawaian_baru_pk 
   CONSTRAINT     y   ALTER TABLE ONLY public.dashboard_kepegawaian
    ADD CONSTRAINT dashboard_kepegawaian_baru_pk PRIMARY KEY (id_pegawai);
 ]   ALTER TABLE ONLY public.dashboard_kepegawaian DROP CONSTRAINT dashboard_kepegawaian_baru_pk;
       public            postgres    false    236            B           2606    16944 2   jenis_sarana_prasarana jenis_sarana_prasarana_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.jenis_sarana_prasarana
    ADD CONSTRAINT jenis_sarana_prasarana_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.jenis_sarana_prasarana DROP CONSTRAINT jenis_sarana_prasarana_pkey;
       public            postgres    false    235            H           2606    16977 6   kondisi_sarana_prasarana kondisi_sarana_prasarana_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.kondisi_sarana_prasarana
    ADD CONSTRAINT kondisi_sarana_prasarana_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.kondisi_sarana_prasarana DROP CONSTRAINT kondisi_sarana_prasarana_pkey;
       public            postgres    false    241            V           2606    17047 )   laporan_pengawasan lapora_pengawasan_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.laporan_pengawasan
    ADD CONSTRAINT lapora_pengawasan_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.laporan_pengawasan DROP CONSTRAINT lapora_pengawasan_pkey;
       public            postgres    false    254            J           2606    16987 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    242            N           2606    17006 B   laporan_kejadian_jenis_bantuan laporan_kejadian_jenis_bantuan_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan
    ADD CONSTRAINT laporan_kejadian_jenis_bantuan_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.laporan_kejadian_jenis_bantuan DROP CONSTRAINT laporan_kejadian_jenis_bantuan_pkey;
       public            postgres    false    246            L           2606    16996 >   laporan_kejadian_dokumentasi laporan_kejadian_korban_jiwa_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.laporan_kejadian_dokumentasi DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey;
       public            postgres    false    244            P           2606    17016 ?   laporan_kejadian_korban_jiwa laporan_kejadian_korban_jiwa_pkey1 
   CONSTRAINT     }   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa
    ADD CONSTRAINT laporan_kejadian_korban_jiwa_pkey1 PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.laporan_kejadian_korban_jiwa DROP CONSTRAINT laporan_kejadian_korban_jiwa_pkey1;
       public            postgres    false    248            R           2606    17026 F   laporan_kejadian_korban_material laporan_kejadian_korban_material_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.laporan_kejadian_korban_material
    ADD CONSTRAINT laporan_kejadian_korban_material_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.laporan_kejadian_korban_material DROP CONSTRAINT laporan_kejadian_korban_material_pkey;
       public            postgres    false    250            T           2606    17037 &   laporan_kejadian laporan_kejadian_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kejadian
    ADD CONSTRAINT laporan_kejadian_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kejadian DROP CONSTRAINT laporan_kejadian_pkey;
       public            postgres    false    252            X           2606    17057 ,   laporan_tamu_daerah laporan_tamu_daerah_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.laporan_tamu_daerah
    ADD CONSTRAINT laporan_tamu_daerah_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.laporan_tamu_daerah DROP CONSTRAINT laporan_tamu_daerah_pkey;
       public            postgres    false    256            ,           2606    16799 "   master_jabatan master_jabatan_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.master_jabatan
    ADD CONSTRAINT master_jabatan_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.master_jabatan DROP CONSTRAINT master_jabatan_pkey;
       public            postgres    false    212            .           2606    16814 8   master_tempat_pelaksanaan master_tempat_pelaksanaan_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.master_tempat_pelaksanaan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.master_tempat_pelaksanaan DROP CONSTRAINT master_tempat_pelaksanaan_pkey;
       public            postgres    false    214            0           2606    16824 @   master_tempat_seksi_pelaksanaan master_tempat_pelaksanaan_pkey_1 
   CONSTRAINT     ~   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_1 PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.master_tempat_seksi_pelaksanaan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_1;
       public            postgres    false    216            Z           2606    17067 2   kepegawaian_pns master_tempat_pelaksanaan_pkey_1_1 
   CONSTRAINT     p   ALTER TABLE ONLY public.kepegawaian_pns
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_1_1 PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.kepegawaian_pns DROP CONSTRAINT master_tempat_pelaksanaan_pkey_1_1;
       public            postgres    false    259            \           2606    17078 ;   kepegawaian_pns_keluarga master_tempat_pelaksanaan_pkey_1_2 
   CONSTRAINT     y   ALTER TABLE ONLY public.kepegawaian_pns_keluarga
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_1_2 PRIMARY KEY (id);
 e   ALTER TABLE ONLY public.kepegawaian_pns_keluarga DROP CONSTRAINT master_tempat_pelaksanaan_pkey_1_2;
       public            postgres    false    261            ^           2606    17088 ?   kepegawaian_pns_pendidikan master_tempat_pelaksanaan_pkey_1_2_1 
   CONSTRAINT     }   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_1_2_1 PRIMARY KEY (id);
 i   ALTER TABLE ONLY public.kepegawaian_pns_pendidikan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_1_2_1;
       public            postgres    false    263            2           2606    16834 .   master_eselon master_tempat_pelaksanaan_pkey_2 
   CONSTRAINT     l   ALTER TABLE ONLY public.master_eselon
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2 PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.master_eselon DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2;
       public            postgres    false    218            4           2606    16860 4   master_pendidikan master_tempat_pelaksanaan_pkey_2_1 
   CONSTRAINT     r   ALTER TABLE ONLY public.master_pendidikan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_1 PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.master_pendidikan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_1;
       public            postgres    false    220            6           2606    16870 2   master_golongan master_tempat_pelaksanaan_pkey_2_2 
   CONSTRAINT     p   ALTER TABLE ONLY public.master_golongan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2 PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.master_golongan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2;
       public            postgres    false    222            8           2606    16888 1   master_agama master_tempat_pelaksanaan_pkey_2_2_1 
   CONSTRAINT     o   ALTER TABLE ONLY public.master_agama
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1 PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.master_agama DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1;
       public            postgres    false    224            :           2606    16898 5   master_pangkat master_tempat_pelaksanaan_pkey_2_2_1_1 
   CONSTRAINT     s   ALTER TABLE ONLY public.master_pangkat
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1_1 PRIMARY KEY (id);
 _   ALTER TABLE ONLY public.master_pangkat DROP CONSTRAINT master_tempat_pelaksanaan_pkey_2_2_1_1;
       public            postgres    false    226            <           2606    16908 ,   master_kota master_tempat_pelaksanaan_pkey_3 
   CONSTRAINT     j   ALTER TABLE ONLY public.master_kota
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3 PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.master_kota DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3;
       public            postgres    false    228            >           2606    16919 3   master_kecamatan master_tempat_pelaksanaan_pkey_3_1 
   CONSTRAINT     q   ALTER TABLE ONLY public.master_kecamatan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3_1 PRIMARY KEY (id);
 ]   ALTER TABLE ONLY public.master_kecamatan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3_1;
       public            postgres    false    230            @           2606    16929 3   master_kelurahan master_tempat_pelaksanaan_pkey_3_2 
   CONSTRAINT     q   ALTER TABLE ONLY public.master_kelurahan
    ADD CONSTRAINT master_tempat_pelaksanaan_pkey_3_2 PRIMARY KEY (id);
 ]   ALTER TABLE ONLY public.master_kelurahan DROP CONSTRAINT master_tempat_pelaksanaan_pkey_3_2;
       public            postgres    false    232            F           2606    16961 4   status_sarana_prasarana status_sarana_prasarana_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.status_sarana_prasarana
    ADD CONSTRAINT status_sarana_prasarana_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.status_sarana_prasarana DROP CONSTRAINT status_sarana_prasarana_pkey;
       public            postgres    false    238               ,  x���ۮ�H���S�@�P��I�(����'*j���ܓ�L�sIbݘ��R��_�|ln����r��造r�N���(���H�J��q�ץ*[8էឳŴ
k�%�O����Q=G�m���ʫ܇9��,�/(޺�^�����,>��(k"$?�<��R%# � {�� ��4���6�c�q�ӕ�D���o����?��>�HՍ�x���� 	)2!D@=o��a���'[�OwQ��lR�b�/O�t������Ԍ�:{�iH%Pb��۠֩tl\��q�Qx�Z��^��.�2���@�I��o0 x�E����|��"ܶم��r�����&�Z�y�ܮ���N�8���Q@����l��J����̽"��TX�&�C��x#��j11���=I0�p�5#��
j�0<����3m.',z���&�^��%�'�4Z���^�w�: P�X�"h}���5�<�Is������=3���<�,���o��%�~>����)?�빸MR4Dh����mC�n�%��c�#�ZqL�#���fEw}�х�d�0:�@D��
@�O�t��'�Z�Z�'|<L�jϬCd^�*:��W���k1^֏��&CH2�0�4 �(�~���s�;9ReLGqR��f�cA)/
��[ ��Ȳ���8o2���0�2�޺��P�J�\M@-�m�fT�i�է�7�̶Ѱ�Fj9v��m�3�]F^i"@�L�[���%�va�i����lL�ܭ,�>[gx?u�$z4��*��%ʈ"ah����%͔J�s�<ϻ�Dܣ�Fu��j2�<g�˲��n{�����>j�5�;�����fwvq��.�6������\��40��2� Z��Oih/��f�(O����^�_i�Қ�jG�Ji���iA�Z�
+�<��e~^_�o2O "#hj2����� �����8l�=)��M�Jս�b��܌�i���?2*���� � _M��+�sf9����c����:b�nZ/=����ڴz���qI�GF��	����$A~:\7�            x���͒%Ǒ�ט��d6&����es@3a�!�jV�4��"�I����u�xVux�w:�`��Q��'�{_��ݷ_�y����~���?���߽~�_���W��������������W�?���o���?TD������W_��#����w_�_}5-���#0 C�|�Mmlz�U)����y���~��W���׿���*�?� �xǮ/t�����h|��#��^��o������__��#��#x���[]�~ly���>��'��	��ס��cH\��-�}��7o~��{���>����aIݢ����t��xﻮ�w�qwK��{<߻1��wW��{e����Z��#�zD_����}H���n�I`�:��l�a�;��@\��� �ݻ\�����滫K��nL�>p&���dm�.+�\Z��>����Y������X�����<���>Mh���D<8�D�Ҵ������߼�f�d}�qNn��7�ߛ7��o]'��o�Ϛ�}��oVZ��y���9ٳtW�����m��c�yӭɠ�x?����2g�ipI���zK�B��6��d��Ɋ׬�X{�d�uױ%�3���%q߻^/ɜ�]��͙�>�h�y�g�d��_�9�q�w����s�l%�S_�j׎h���K^[9��9����n�-�ۻ^'��^�Y�[/����lV�d���msކ��כ3�d�u�sO�]/��d�|wk������6+w��h�rS;٬��#�>��f���e����a�ٷ�6�m����Fv��6Z �������7��,Mv��N��	��ITJ��p�xiM3�E�ĕݕh�+�߉+��f�+�C���J0hP�'ȕB[�R4̋A���0O�)������D< &F_��E���L�.��T����dc��q�?�������w�uɝ������	~��0/jԋt3ڣl�嶌�y��F��,�-�h�����;�""FkF��<=�4�XT� .���N�ތ�yw<��s�2�o�0�
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
�?]���+���s�_�����Wo~����w?��߿���]�߯?���޿z��������ۿ���o[KC�ZKc�ZK��ZK���?������o?���Gd~	�	2�����?�����~xD��E��E�!�E���3�I�<C���3􉏟�S��9��E[����.��eN�wі/sB����޿{��?�O�#�)<u��>�7o��ۿ|���a���O�_}��������s��>u9�}��iX�ߧ����}L��it�ߧ�1�r�>��������?���?����:��׏���~ Y  ��~��u}zX�޽����oFΑ_m�l����f��n�l2������n�l����V��n�l������m8����/5��{���R#/�����/5��{���R#/�����/5��{���R#/�o���/5��{�����o�����}����#�dt�'�~��Dp@������?���Ǻs�Ϸ�^����7'{�������\��W�|?��h�7�����˫�R��w�_��o�������N���N��q������o�x��>x���G������4vz�t;e��NI��SN�i씲0�/|>��S��i�q��# �0��ƾ��/�>����/��^�߼��?���?�����:!������zl�$���N��h*���:�|����w�:�z����w�:�x���xw�:��߾����0h^����~���N������(��z�G'Q���I��ti���T�G'����I���9qv�����DD~��ҏ>'"�n��?���8�s�c��?�s;}�g�N����&���o������O�v��	��ݟ�O<�	��ɟ�M���D}�7�{~�o�7������o�7�^J���o�7�J���o���z���߳˘O�ϮN>���=���o���Z���߳K�O��(�O���O����O����O�Ϩ�O�������w?��~��zFy8�������S�4qJ~�7qJy�7qJt�7qJo�7qJ�7qJ�7qJ�5��1Ԥ��ѹ�45o�rt.��y��s9��ϛ���9�|����<��ϛ����yף�.>o�zt�S��M\��3"�4q=:ψ�7o|������~� ��o���_��������~l�l��8�́&��w���-h�l�8��&�������#h�tG���?���~����݃�\�/�󇿾���p����k�vzڰZ;=�X���T��N�1Vk����s���ڹ��i�\m���E���m��E��Cn��E��9�n��E��9o��E��9�o��E���=����wVk_t,��?X�}ѱ �h�־�X Y8Nk_t,�ߙX�}ѱp~�b��E���]�����<Vk_t,��Y�}ѱp~�d��E���ݔ����ZVk_t,�߉Y�}ѱp~�f��E���]�����xVk_t,��Z�}ѱp~h��E���ݣ�����Vk���O?�9Ч$��)��}J�?A���OЧ���)7�}J�?A������������y��V���������HSF	��ҍ���X�n�6-W�?	��͟����O�j�'���!r���1u���Ax��_vԞݰ^m���g7�W��%G���o��O����t�         �  x����o�0ǟ���*-@~ /�(U��"B�������l����� ���k%%��w���0}X��<=����p/7��FS4���Pr�.��0�f�ш�ݠH.s�k�G^����
��Z��?�	}9������د�`ߦbX���F2Hw�j���r�����H�A��(dW��e��l�ȷ�q��F�5����܈�\C�[J��N�KY�R3<IH��1E'��.̥WF,U�=��
�7Fs�q�������֭��	ܸV�)z����W�r�jp�rR��.��n8E��l�X�-khc�A�D�A���k�hc3�M-��0�����W�q�?Ԋ�8��jH�����(���Q,ދ�<��X{��j_��8���"Z#�v�W���T���9a�Skq5aj�\I'�H	�sXɨ�n�F3��T�fK�c6~���l��O��ۈ���0�jfL$����5��KLQ>y#�IfX[3�1�3m�6�U��x`�r:O���P�i�q��q�mI���eT����f�a ���G{�M�EiQ��@ʶ��e&�´q^� ���,�j83����a��t�Y����p���ar�ҥ�k�*��C���+�ɒ�z2Y~�����J�I�f��{��2N�+��2����5�`�k|�L�tD�ae��/Y�U@'
�Ty�FF��[�ڑM7Z���]
E�����Fǎ/�����N���j�            x���v۸�-���|;/�����FG�E��H��\m?��Čm)K�V���7 ޕT�v�Y�ZU��%w�>z�(���
݄�0ކN~s�o�����~�0|?P?�e�`!�K��R���K��\����?�����ߣU9�y����_\%��Q~�\���g��~�����O�����CP�­�	��"
��1
����X��񀪟�2ח��K�$d�af@#�{���hT��ڮ�u���_���P�#F|L��)�G�D��D�E-��.�?����<�n���'NO�"��P�姚M�% �$�*�Q-��nu���@�!%��~@=�S܀0���2���FQ �B�ݕ3_���D�u����n���Z^g>�L���.���P�P�H����j:�~iyS��H`w���>S?��I �������g/(��ހ��.`�P��|��v��*�WP8{��Pp�	�S� {3�A�W��th � ��zj�ǜD �+B��0�ϝ�).y��ӯkX@ � h��Iv���?@W��_ܕϻ���x�����ۧC�_��>~>!#�V��"���j�u៑7nc��	*T~�B�[!�K�!$�WSH��_p?	�2�-w��Χ�(����oys�S?E�=��\=!�l��:q	:��9��Y8��ճ����u���=�S�Gs 1G�8{�[�ؽ AuwNO�m:��v[!D%жI�����L�� 
G��_5�|�G_�>0E�z:�O��*z��0�e�M�A�0L��>�NEG��zD&bwP�:q�]���%���|��i!v�$�݀��"o2��M��<W0�*D.c裥�D�U���x���Q�%	��Ȝ1���%	�q���|B�*��<�CG�!��&�����"�b	�4�"��?*�IK$9S���c�^��
bU���N�w9l�x}�Kg� ܅������r��	kň��ɳgI<���>u�T$�	R���LF�p�2�cW.������=��>�r"�K++_�(C.��� Δ�]������{L��4𩺦P�kZ��@�#Py��G�*�#�)�̠�e�,|��ǼH���?���A���U����	'SGF�[�l��JM�ˍ���յ}�\8k��o��e~��Qfs�E����V�L}ݥ�MP<��O��+޺�u_�
E�����?Ds'\8��.��b����E���V��Sɉe���Ĵ�T�E�(C�7�c���d.���ن���D��䮖*˓(�e��O�D�/�<�c�З��v'�LVl��E��fD�y���xR`B򖳆M�.��9h��n���.�s'��� �2�	Q�&��zn����1��X��ފ`�5���ȱ��������ؙ�׷a�Ņ��s�3�"���\��8�6&i*@˵|���5��H~�8��g~IO�k-Gf*᪟���Pɼ��W��q��C�diF \F��v��Φ�t�	��tǓ��/R\��Q�4]�T*��r'��kyex���1��[�&B%8���ɓ�y�:Xp�f��C��L�I��3m��۞�  �HxH~�h�]��� ���bq���݇*e)PŤ5JB�SdFP����f�%��v���m�L�����)v�e��^�s�S��͋�ǯ[�?��!TڮgQ,��|z�[NWų�
�چ���vE^�HP~f�C�|4�	��V�`��Ƹb}@��|�)3���1t��D|F`g�+l?�ḍ�R��ɦ�3��>��!UZ�n��Nb���>c�;	"s��O��{P�t�eM�ۢ�puƫ�u�$��`Q�N�t��o �!n�aT�T�8�-í���Yc�4�Ԧ!/lC�d��HjU04�dz�����j��s[�%�S��]J���_� �Q���$Z,�Qn��tu=�s%b�Vr�kzs	���_ˇz��#�V�B�M�E
*�̘�D���1��M�NM�2�����(�{(?�<�Q/2�8�<1׼�L�$�ͬ` `y(|?�N���î:��^�|����Qث��T��A�=������tU�)Po��q"���I�8C}���I��L���^��ױ)�����E]�����J`Ҩ{��8]G���Z�߈�<���Z]�Ī	���� }���ν_�|���N����o�KCd�oʗ������ )XB���?��?�I˦7�;O���Fƾx�n�e�e����'�.�r��~�����3{��/s����1�z����ݺR�O�E�n���=��Æ��aVkH��;��W��)���Ǡ:?��
�B��0ٮWE���mM�AQ=l��@�<]�;J*,�*�o�4�G��݈��j��Y�K2��Jd�Tеh��)!�	rX8�g���pe�\��H��U�������`e}��#؜��h��Gґ�qif>�:]!�z��	׻_
J�!��'���\ƾE�����.v���X}4]�K�,w2O��&��i��:
'Վ,z����B^�%N��@kO�(�Z��pԄ*����P?E�E�r=��EΨ��"�U�M��b��kk��5�\a�� �E�Ӫ^=��� RML��sY���i��=l�t��,�q*����A��箶c���e��o
�Խ���u�*#?�T��:� ��zꙫnx����v�Z_�=e���Ǒ1��,�&Eo9��[�b�)pͦ�a���Ȭs1U��Q@՚��FE@h�=��8�#�."G��5������Ƀ绦SO�Ew��:�;K�,��ho�"�ZVk���I�5��)i$5�(
?Me��v��	�O�F̒h��:e$и��o3���������F����z�v&�]�]�?���5��hs�5#�|]G��iJp�n��eI�E�X7X���V�ا:���		�8d*����ځ��l�G����ּ�XQ�,E�� �-Į�.8��B0@��̜71��[k��� Z�n��sIkMtȸ	�!�~h�|XD�D����v�N�g{�O@<�!��c�B��^�DY\�v�#�p�X���}
��~�|�pER����q�>�nr�G5v�k��k����Tk��-c�}�z	=����V�x=k��]5w�&v�z��
��Xc����C�Z;�mq6�-�[$�&�^y���@���CIO3J*e����5̳zӲ�RK��"�HC��k����@	���U=�z6�B���<n�?�v>Z�/�n%���������£B?�%���+.�=�V���f���;�����e=+�͜T(̸Q���6H丢�Ȓw����٩D�cs�,Q#J��c}�̄iD�H�̻�j]�.f��eB5wYb�#��`��@�8�	��\�7I�*��z��z��3{�j\�(�N���^��j�r�V�AN��.�*,`���OjQŀ�ZK�������&���\�]Z/�c-�B�E3�ms���ȭ"�>��W�\%�Bg��$q��*���#�K�О&�H���]��d&��
�8O�|TT�gh�"v��y(	w[�6\�blC#�&���=�YoT
��1n�/� �˷1@%
�i�9x�lZ3�d'�M���`�cH�Y�,��Z"�+5����g�y�Y�E��#�M�-�Z������d�G��x��h�� �j_$H6ՒU?r��ǁy��W���Hmk�����}k�q#_�U[s��B0TЄ����|�cE&��O7��¨q�NS�r�u�B�����Q"K���1�W2%�&Pt�.�u7��W?��:�+�7�g�*�2���VM[Ѳ�� ����W$s���g�Q4Y�j.S��[������-���,b­�v����n��h�����\'Ql:�L�����R�	��8Wb�x4��+����n�E��8g/潹фV����n&�L�&뻵<n�m$����Vgt�7a�N�Z�+3��7��A�?lL�0��g=�����q�m4� رtf�mx�,0[���gzz���_	��d��a'��n�u��^[rO`����*�m-á"&    �InZ�w��I�\͊5t��Q߶�L�0��]�&&�U�\� ��qlȸ4��Pi%�ծFg2�l�b�n!������Q��^�f�&\�`򐀚��:�ެM`%��<��B��[�B�'"�>݆q�wn9w��ƴ�6J0WaZ�K%)����0���`�管`�Kon+oFΰ�\�7w�@1�S���:�v����(\5���������S��p!K;<l�8�jR]-��[���\�`c
����.�lC��`��͵�(6��tFqYZ)��vw��{�fM2L��R������ ��F�������k-��vz�$f�>d�Y���S�0�j�<Wӷ&@�0Zh�|��ߌ!���V�~%U�$����OM�WwE
UBR�R��Q��Ivf������ZSP���Б�@z��y`s�\��'��˚kQ�}]����}_���u�9�p��u�M�;�9m�a��s ��ҮQ�Cw�d	d2>�<�q�E�������^�A3J�1\X�x��	�^���Ƒ�]v��i��p��0��2��z��f��g=���JlW�����*��c*��@���ë3�?�g�
���y�_m�'���KӲO�v�s�t�E�0�FK��w�e��̎�/� �Fgv\-��Bc���窱����Uc��|���^��>�K��T��jV�]=�{ڈa&c¸�%,نXx�B�q��s�P_k��kx�N���՝ɫ��d��J��Vk���K�y�&�q,fE�d��ypa��)1Y�9�MCk�K�h�[�V��)��L�m
V����PO#��*���i�d[�BF�
S �Ʌo!&�]����%n�����=R	�6\����D7ᕬ/d�k<W���;.�:E��� �
�uEٷ��~M������6������'�D�����2>�z�ydڜ�nQ���5��+�����Z��*�Y E� �)о#���.��_鍊�|��gS;����̹��ַk�TUuv�,�/���P&�k\���>��-�1 *{[[¯�9�xMA�{��"�v[�o���4҈ST��JY�QaK�N�v�O$�&>1��h�]|"����_)�S%����O���4l��s�2�M� '��ʭG�������10	H��A�����3�O(W�����7�j�'&uBiE��aj4����#)ڄ�<�@Ċb�D׻X��m�2�M��-���J���5��~!"�EM+��MQek)N�R�T��M�������C/�H�uw�`�[�z�Z�7,����g4lRk�������.�A�a�i�BeV�Tk�h�u �����ǚ����dzA��h1�
���[�c���t�}��8�������s�����M�ݴ�F�@w�xk�7��۪]��eMC�׍sy�heV��1� ��\^Mv�����>������� ��t��7�ɘ ���%J�uK#d+^ ��䳪�l~�+�:D	�!-` 3��?�d�6��P&�ڕ�a���iq��B�nv�H�#S�Ig���_N�n�`�Ё	���jK:�Ke@��xa��Aـlʵ�b�7�]�@#�Q���i��� ��z�ȲY��RG��r�}��J���3V��@�u�P�h���K�ǁ�4]k#��'�ki!`�U��Hײ��2���5|�ߣߧ�|��� ۊ���9@�E�Mt۱C9�sL9���ҦK�V��+����+AO�31]��_��=�3@�Eg�7�z�	����)�؜I8K�ӿ� Mj�3��/����X'�>�F"�̼��(s����8�c9�@un�c���{�:̃Nvn��d��qu>�n����KC'��o�+����n��__�Uk.����0����"ܪ!�Y�g;��/��'1̘A�N�$�oA+���p�3O���?���)�c���sF���kna�{:s�nA�4�[�1c��bG�rgX7[�'nOe�y�oS��żi�z0�H��+C�.8�!Jٙ��+IGbؕ$W��N*:H˪i-ˤ��e`��.�[�Y���V������'����&�چy��π��hA8��7�.�����Z�SF��a��VLm�j���1�ݭ72��)�N���o+�Y��H����	��_k���ތ� ͦ��Ι�ݲ5ֻ�lX��U6��[c�X Y��-8wFM��'-{�\�Kٕ��?�!��E�����������,�3�(�<)��k��bt3[�%�
��k���ǁyj�g%�H��@�l�č4�#�MW�Kv�%4��*�Z������^%���L���?�%K�7z���a.\Zn���!�ȡU&��a,?��ē���ŕ:���,2�.�������ǈ��e86Fh���'TC̺{�zFD�Th�q�/C`W"˹m�	�t��y��v#ƥ_ɏͭ�/�M06	�Q����[Y Y�iY �_���#�7�����rYV���6�%�ڲ���
Aͤ?dQ�cY�M��JCj;S�3}V)��{�S��G���-8�`؂�fOG�'򷨾=?B�����Ƒ'8{g;��.���4�USK��엽�`��b��8JV�K2KXU϶ {>�u�M�X����'A��[�k�����=Z��D��9���-�[�"�-V����ĸ�B�����I�<�G���Ut���S�J�Mv�<�����|M���5|L=�A�+�G��}�1�`�l�`A5#)p��VNf	\i�t���HY�M�N��pW56���v��=�ȻTnyse`T@2�|�|��],��2l)�֤ oc��Q�05���(~'1�D���*�'m3�D/�+><��U��Gi��s0oڨ�@�C�]d�p��h���Dqf��9)"P��h�a�1��/��L���p��@��_�,����o���x
p�{~J_�y�wɝ��>l�!�'����+W<K��	�q�U�v�aԤس�T!����e�K�qo���E7��8i4����R�$�N~��W*|�V��5�h����_F�n6�Ђ_N'�j�~��'H�H���8�|���������N[�Z���c~E ������/�B��r>D2�h�m�/����Q�� ~e(�ύ�ޗ�wN���6@u�G�(����E�v+���?��߇,b%�Q�^ְex���[�������;0�C+p��Sm�Qae=c6�F�K+;�o4/���.��y�,�Ɩn@:5x�i�^ͨ��������z�H]U� �;�EXN#��c�`�~T�Tj�|�oA�su|�@�YmCg�ț̒��������%k�fC�5������n{]M��;2�e��v)��8xj�Lem�1����X���oå��[Pp[�+1��v�D��^U�K�I3�A������6R���(�l�M�9����(Qx���<�
r�Z����|7�����y�ܮ�uݒ����6��]S�ˊ��޸3�|/��m���n�ܭ彙& �~6��C7�����np%q#;�������(�~_;7��I�`0C�pY˔m�62�L�Xle���2�*�A�x�r��d� ���|�]2�����ea���l�A`�e7e@��6ܛ²��G+홒���m}@(��k).�	��ld��0����?_��/&����Ή�0�������9Bᚍo���S��>�����Ľ�>��zջ~��C%�BV3�x-�Z�R�6�Ru�{B�CiCH�i���%&�n�h��)��ݿ���`sp�.��l'�R������k������_�d��4vnCyUq=Pt![�n�y��M����Ƭ�m��u1{�m�sWB2`�V'�1���VD���R~���Ϸ!x�V�v܄��W��e���3g��6v�����	I.�ݢ5|��ߩ��M`ׇw
{�֨]S����h~>
g���Ѧޝ4ڌֆ���smF����O������l
������Z׋t���L��[F�fFbmnX��o� |��2�}�a���IYk_�;'�d^z�[m�9Z���/̢��R�f������A�X�^��+Bq    �6�2d�����z�^�x���Wwӹ�{���	@�n�:��<�&k��@�pB�y�5�Ÿ�7e��O��*�7��DBER�]���wZf��y,�����F���7���W m��b=7�g��,�p�0�{&� ����Q�yk[ÉL��:43Ò'�=��v2+�,�|W�y,p�c��s�� Ś#�3�P
�����M?@)2T��]Ak�1��A�a��:o,�zH~��.�㾽�!�xrO���퐐+��OE�~A��]��h�$�(�"��~H���(_D��^��B�2�X?�Xxܸ�t�b�U�$���1��V��B]�,9���/ב5�&�mB�͒HF��N;1A��Z�U�c����1���Ro������5@�h�`u�d�&l)��5�%W�7AE�]���|: (�R6�	XvL���t�m�p�?��ca<[
��VTӥ���d*S����H`o�(�O�	JM�
'�����S�G�n2������e�)JG���0�VaTK�9�b�P�8K�iK�r0�������a��M�:QP���^�S(7`�VT;�f�t�hB7B�jz�������^)(�-�Q���n1��iYu���$�2R����������!�C9J}�j%��JK#���΀�UZJ�J3���C���8C�ڣ��nop��G��.��k�4F�bP�����䉜&f�tY�g�$��ۨ/�P)�HV�t]��j{*w�.oH��5����fC.$?�t.���_־T�:��hY*�]PF�%VSʭ�(g�[Fwkt�	��HFv�2���m�8\�P.�i烋1���L�䇿�&Q�.��׷�f���}�e��^�=�t�v�e���C�(Þ�UP1�K/��$jJ3�x���{,�!dܕy{�^�Z]m�59�x�F����?a�%�ة#�|W��n�p$��/� $Cw���I��z��ǁ���������A@�Z�·�� Gn�D������t��Sv���J��u� � m�(���rO`���p�l���u���F5;��S���w x
���i<�|���.i0��Ӟ��k�ϥ.��KJܠ�D�
SO�z�zr6����B[#�0.,�M�QQ���.�p�����fl�໪�级���h���[dl��"cc����pq]9\�mW1Q�3�0����u�(z�6����f�={˼su�Q�:]�z��
~PV�
WMaCrʇQ9�tU�	�T7�o�<Ɗ$Ǫeu��"k�%z�벒��G�9��]hg�JK�e6��Ӹ[z�`��.������B{�ΧW��
=PQ��_�&I�*�������6^����T��H2�T���XcOd�?��������go5'��W|�s���c�Q��r�^�}~'�;����*��^�M�`2]�T6-�q'C>Q���*DW�9�2*w���jZLmH������HQ�>�I/�yT���iK���jZ+���\�Nb����' �]9��:��d�:vv18v8W��J5s�e��z��V�ؙ'��=�0��s��z�� ��� #��Vlgf#`����6���9P�5������*49��)�O]�R���ܟZT(�M�I�u����&����S�Ҷ�j��r�Wg�-u�l���Q"�U���|��Չq��jm�*W4������ mw�+�o�X~2�hQ]���6�|&+9�N0�o�g�����bV�/ ��C`(턓e���m,���#g#�����<
��O��8:����a��_N2}>�{����Vj�^�@���h�x~�ԁq�rS���pv��k%fƕJʦ/�2Yge������Qb�.�4F"d���I�+8��}7�&z��Èч���7'9?���c&���K
E���ѣz�Z�w���-��q$hy~L_�{'|���Q�Im�7F��}R\�T���f@6�%�Ǉ�K�/-�Y��ku��ޚFW�E�����Γ�������ڮP�;��L����¶����Q�����{=��z�aɅ��A��r��0|z�x�N�پ>��5�*mH�Ĉ��� m���������lҗ�gy
7�����v���`��jۧc��q���DPN�E8�[��K���/�s
�8y�}�i��;ld��5�߀(�5�6%���R�<��A�/�
�<<�s&��B�pj�j���S��P�k7ry�Eˍ�����E�}���:�[�}:??_*jJW:�`�7_�JW�:7����'Y�|=�rq�z l7��B����Q-y*����u��@�Ͻ�����[�$��%�_�z�%-�g|b�AIe<�8�c���Y��l�eR��Y��`}�
�\�2�g������Xh�]R:,T=t���O�v��[.�bw\�OӪ��h��Q����Q5����pEOo�
�&WV�ƒ�ɷ̙A��Ĩ�����Yf�2S�¼ )���/QF�+G���k�磬���d��Ӣ{��1��Ƴ��YU0>`�:O��'���G(��h.�d<�-�9ΐ���b�F�\Ն�A�C�J���b|���Ǭ��2�ڕ�Z�vgX���,+� ���\�>}���n�4�*��A�V4I	����(�(I_N�6<��=ۑyZ����j����8�f�S�������%�EmRh�% 2��6w��R����Uԡ�\�9�-CO���b\�Ann�O3���,�|9Ty�Z��R<�	F�W^�m%�ўQE�o��	�3�*};�)�VI�-wIIt���>9ѹ��A�P����;��<�N|~�N/�^��t	|�"�����ɠܢ�J�4R�'G�������K��C����j��,�hц��{� 2@���8��(/|ښ���ղQ�i��	�NJ��@��E���~�����^��-�,�%Ε�@1~�P
]���urn��٩q0qm0�*�F�Ek��lZ��S���(�������K��5�#�:��Y�Dw���1�xgvp�f�?8!pK&�Cme/<�MxW�g/mՍH�tU���*I��(S�Z����i�J�Ϋ���������A�UY�?��gT�k�:�ɕ6e �u^����[�%a����^�w�f�@�z:~U����;0Dބ����N�`�.eq+���K�!�ǀ2t���t�T��ശ)%69�����
@R�Tb�]*���Q��U����	9�x�8�h�8��<�]��U���<-R|Q@u�@9�朕������O��U�hQ�1���MUIZ�7�ɞ����ƫ[�#C��?I�@	�Sa]�[O,��P����8�80ĺ����x|s����t�7�qf�6r��a�^쵏	K����S�T�Ϯo?�`����Xc(�?�"�c$���szl���-�`�M���,�A�{��@�C�#��O��/[��ص�\�����)+Z��q������L�.�c5c޲S�=Ok�c��T���_9�����k���R����czO�B�%ۘ3�[/3%_������q�)��Nֈi5X35i�]2p���B:��2�o��!�c�9;�ߜ�Y��'8��z���F�+�Jù��E�� Y]��]�/��gg�W4Rp	�j�����"ԑ���5�-��Q )o4�UU�k���b����)��uϜ1?06���{LPbo�*v[��﬏��+�4p�+�")~%o韏2d?�z<��#c�y=�2��H!�h�ݧo髓@~:4x��~Ղ	Qhs��y�����L����L���_���k�U��U,��Fw��G7�LOou���5�e%E�Uj��a���!YW;2q�^ꙷP�p���S�LB��l� r�<��w>�翲�n?4(�i��J�x�����a8�np�6����]����,^*��mݝq�(P�pO"�n}}W^k[���SF�F���?��G⢭�����J������)Ʃ�s\Wʿ����`��'Y@�6^D}�-��D/;��U&�vG����Z����{���]���Q�E1�~Y[�36�j����o��q�h�={'���g�ن�p�    [DN2]�[�z3��[���W*���j҉Y�c<=>gN��1=:q���b҆��_i`�ZÀ�+߱>�>��c��G��j�*�i��:���t�T���� 2���S��������g�ַ�ݚr��=h�Ňg��:6�PS{�6t��F���E�ݍ��c�zr��X/�9�2;��()pbH�m��'��6�ֹ����Idx��"�P�U��\�h�!`�s՜��F����K5�ъ����s�wگ�+JC�d$8b�9�_�������7�8�u<��Zx��u<L/�8��HLT�ҷ�VE�+�
�t�#p������q�h�>�{����y@,s�����y�&���j�]��cB��~��u1�`���M1X��1iN}��:��tT��%��p��[Ͼw�y�1���ޭ��*^�ڮcX2UY�о��	-�ǚ,�|����*퉋���G��-��\߬��x�60b�y�,d�b;��RD�U��c���)})���I�0�&�,(�kv�}������s�J�w2J�B�X�^����)}�y5 =���/d�J0�ڮbrf�1�:�ųh���z�F�����
+��Z&�b[$:��?�������ʔ�#UK1	k^�T��,��.�Z�� H%����3y8�w�v�gh�7{n �+c�Ǝ��#!�b�8٩��IЎޟ���
���4�V��n�+G��W�U5�.�v0R4}Y
���iE�r�ߴwl�����j����N�ϋ��D���cm�Π�!O$��3�y"e���_U��3|�h�B�lhP&��M��P&�zm	�q���v~���3T�j�'Y���Zz��Rr�8
��ȵ��g�����3l<���Q@����?~�)��7P�i��!��Fg�5�Zr$xk8 1�<<?e�"�V$]_�N.�I���ҷ��Sd\-�J��r�3����p	�"�:\^�O�	���^�s�V֚����U)�hc�T��l��
E�K����ǽjC\Q/�Z��m��,�r���tV��m�ނ�˳?���&�y����
K�Fष��h���%l��zj�a�{�wP���f�n5�n��7&+�}z�=6�����ހ���K� #����������Z��V���Q!2zX�%�=����lh���K&��1�++�u�����������${^��:�� �+��>��*U� ʔ)W|�GUV_�@��#Z_qc���`]������=��-7�����X��Ff#���o���.���LLJ�f`���[������ ����ZOX��+ƫ:x���V� �ŏ���b!M�eM޵���h2b��1)�Z��
?�>��}umc	Ş�9՝{\�c`:.�|t�5U�@9fY�bU-��J���T[�oи1P��rFu�@:(�P#� ���37�p�A8�[�wnҳ�{Z���nu�\�����^�^z�3��f-=��;"poA���O�`ڷ�z-Q�L��?P�D+K��@**\p~uǤ��	ts~|��X�N�B0?_�)�.ڲ�C���C9��
�-��b���C�]%7��k���[�0Z����1�6%v����FZ_�`�+ܲ�9�3�d�^N�g�*}<��(,��W�+�Y^"�5���<s�&��oa��y(�nƹ�l`]�r�ϛL/�����~qǡ�z2[yz9����q�<Э��gnoP�����so�/���>
W7ʠ�+/{����**��X	:x%g.�i
��+L���������(9<5��}EI1sP�/��ݖfoq�҉ӗ�� �Ҁ
��������-p��g�SE��^B �]Ė{	.����� �N��#`����j���	_�
��=c�~���)�������r�z8�@tMv��j�̷���f?�ʠ��*B�\�+���H��L,NN�1�F���]�&B7��K�\�n�JA���8;}SS��C��w�)�`hk��ʹ�yS�&�ȭ�߽E�C��Ifx����fu5�a̤x����,M���ﳇ�:z5�KƳo�CK���x�	�ݖԠd��%�{�$õ�5t25����'�W�.��WH�-�Ϡ��h��x�DϏ���){i���k��+�[��[1\-P:d�L�^����
�B��
����VN��-Do��<=e�������+�=e���JEz�m_�!�'\�:>J��ٜ�ߚ�b���+0�vy�Ey�ޢ������p���d��
��֤�\D�B�V&��t�(�t��/j�`���u u���83�����d4x�������m�x���	���3_�,Zm�v�#�-��M����~4�m�����"=k�o�[�d�qx~~s�j�)�j����x.��+r���/��U����>k1��A�1��z�roT	��h������/�N��!Sz{�m����*z�ʖ�����s�v����*�Vɲu�G��r;-�<n�b�[���~Q	޽�Z�>{%k�u�}���v]b�٩"��%�9��L���ggz��٩��ϸ:��]{�#���Xt�-��z� F���3����$�s�z�N��,�-%�w�.�r�V���&�y����!:�����>xކ3�j��������)�/�Fn�������(���<I&6�Nl�r�$+�n��}Ē�U������N�3����t,����ʛ��P���V ���'���٣��G�r^�R)�w��p�bA��EF�������b�����~�X4|�`�c�z���[� ��]�.�|�j}\|��J�>D�nRY�5׳<�l'y�界,��b>v�M����Y�c��k�n<ŏ����1�|���j?�`�ּ��{��C�������im����4�Z�����1E�)h�$�K�9��+	[a�G�;ZÇk�����f���pާǬ�:A{9h�H.HBʉ1f-�_����')�l.L�P5�-;��O��tsǭ��P����<=�Oz5m�tڦ��1_���B�������p��<����7��T�+�Ի��4|}��a�����3����rG Vڥ����M����n��g��4W���v~��F�#�`H�d\~�� ,jd�z<�զ�@.���"z���Ó>f�j�ܭZ�p]�.T���&bR�q7�����գ��E�T}b=8���)��s��`Gr��>�`e�KKY�N���!e;U�n���_������2�	���<�!\��k����� �"�������I5��0F�֛F�Wj;<B)���ҮDN�Y;�rx9��}�GHǀ��f��-{iL����z��W<��:Y~<�t�L?Q��ӕ���=NF-^{8�Q[Al�2tw����x:월8-c9���X.S�`�#��r�������=&k�	���T�]���D���bԶ$jtR6�xz�XyH�|����W-��b;á��1�����]^*k��T[������!�����*��tc��#���L`"{R�&��9I��z��Spڗs��,�i1��
�#��Pb�r��_��b4��=>8�fV�I���s�!�hu�����Yw0ejs�\U��o��'����9��у���`<��������ژ���,���z\���٤�g���>��X�L'�LJo;�jp����7�d;�J����ɇ�$����-�к�_7�ݤ�r�ۿ�a��>��j�������#~
�T��C�?8�Kv�+m̤��?҃�\���Y�h~h'�L32���,(Ffi���o���y�b�;J+}���p� mݯ��燃�t��1�(I���4n�=��{�N�aV�S���G�����XQ��uF �N5� ��G��yti�GQx� ���1�R3�e�mh���U�t�0�2L->�h<���Ҿ�����X]���X�+�[kb�+�@�[�b��q|wlӟaA�L�N��D�����]wj����EN2���o�%�^ӽ���W��zRh!a��i1?�3���	��US�j:�k[���2�[ǽ����#p���tJ��X�����6Dyn���    kir�c�H(~�>UQy��j�5�˞Y�Ʉ@�
H��^9���r�?�%þ	�Bk��@h;p�zY �*CSWe� ���,xHON]Wgd�/��0R����{Jp��ʆ#F�����Kc.�g ��BW(!t5(;�Uߌq�C��a}��1|L��y֠[�Z�F��4����n{������1}�^�������M��.����&Yk�P]���ݠr[.C�+dns���0q����Xd��4W�@7�������׀{�÷�Y?�����F�Ʃ���P��E��l��I�&�� �������__���ۡ�6��kɲfv�����!D��u_�p�(zI_`{�]�%Fe���h.�����)T��Pt���Y�W�AYwl0���%(;6��Qn��j"r�,��ŷ�xz�61����3��,�������M� ���,}8���p�v�O]�eh�����A˰�Ui;�F�&�����P�p{�?�&��N��HS�Ϻy�?�ZB>X��]Y��{z�D^�bhG������}�$�t}���̦#��r�����#���bR�pi��� �Pr ��n�w�b�n=o"A���a�բ΁�[
�`��������͙�G�UO�'�uHy�#e��g,F�C�H�p5��_�s���|�=�\8i�v���$�P�G��$1t�8Z����|�Sf�r!�`��e�W�;�Ƣ�_�����c��L?=�)gKɞu��@�d5w�F �@�'�����-���śL^��3�!{�m�zW�w�qW;F�8Բ��~/�:fT���E�mm���C��F�Q����<a=L׽z�3w��F8����J�9�N>W"�^�SKN�����=l��+�"P-3*����"���Oh�2EXe4ו��?(a�s���k�����	�oM@�R���R�~|�X��[}��ާL	��s=����\�kE�_i&��}�D�������q����T�]����G�������r�	�:�8Rj�c5a7�������͹9<g�׃3���汍��=��������m�5��|�^]�	*����S<�
����JF8�QR�<���]7�ս��&�J��v2�{�aܳ�O�ó�I��L1�	�*t�p�N������%˥pE�ld/b@r�FF�K{%8�}a��Z	N�J�t���|)�ꗴ����LHus�V<�p���ˋ���������>}4n%5q�n^>!���7�\_�͹�X��t5��>�;�Ο��GϮ)�����ǒ��C��S�$m�7�=��F�_���$���7�z���!�Vo�"��h��E3+I_�cS��w��(�V�d�s�!��$�nk���x��N�&�X[}����M�b#=��D~��ִ�����E�\k���j��va�pȰ���q����;��Ⱥ��EϾ����J>pDoW?|}�d񆦹5M�����E�B���ހ�Y��^2g�>��/�,e�k�G���6�UpAVb��yF�m.�\����&�h��t��)�'���m	�L��C!&di�7��F�����^��"��K�V�Y�3��e:t���j0�8�ַA޳��qX�R?��h�
e���##]O��='Ԏu�H+		j��oZ~��D����KWyW}}Wy�t��O�f��7]����@�h>P�K�Zv=ϗ��t��L���>s�O��9�Ӗ���;׆����Ϝ�f�c�+$ey�u�K�ѩ�.�BPe$��)�'�/��s���?��+�CE�y����vy1d��I�����j�U��\dle^S[�n+���~� zh��gN�QbWK�W���O9&1.�OmrŜ��1\�|��S����pu���5k5hp�]s��g��ǂ���K�j�B�^B�V�e�hEBf^#��M�Ǆ�w���ڙG���t�DW)�.���J�Yz-����ˡ������j��ڠ�Q!��5��T:�~9?�;ΐ�uع��3���\^��w��5�S�W�I�b��\��e #��)��n�G0~K�O�%!��l�e�3�f%�,7�ǃ'������'9{n��|{'�@�5Yɖ�i�-��<X�GO5���&�G�)�KB$J�<������ .~}gKVHR�}Z̙�FqX(-׃.I�7_�4���C��@�qVӰ�@5��1��t�%��A��м#��O����[�$�>\�8J�����"|n4�	ě�W��"3��42��Ї�KzTTφ�+�һc�r�>���js��'@�𭢦�������Pr�VUX����ˤ���!;��N��Q�X?'y��zԼ��V�S��R}�띟
[v��|զ�o2;V$mg~>�_��.(�a�}&��z�G��waw�@���(���w�hu��)���vz�=��:i�nuWeD!�P��������\+r=E�-Ը D��L���!:�>�̇��>g�Z����=*�GY��� W	�ɟ)L�����8\�����c����f"cO�ǌz�8��%jD�u%��"�ʪM o�K�l�W瞧�&j
�9ij$W�K�����}l�W:p�J��h��T��mi�!��I�����ñI���'Ol�zX���#Y4��C�N�͹�,%;ԺME�R�.���mF�������}笲�>��;klMa�3oï�/�Ѝ��μh-�8�R�tkN�2=?7v
ԛg�z+���50����(2\��4u�op���[��W��h�<�~�����8}9�/)N�ܶ���hz à|1�ڋɿ���p�Ja�/@ʚ��r�? ���5�����X����
LkH��>�[Ѯn��������Kf�c��ƕ�+�XEa0�,x߂7ca���p/�o�l��,B2�u��!/�z7^�o��_�s}cHm�n@��؀B�����@>f��[�s6P����ji>�>Au���=t�
_��g'�+�+��ϓN�������g|�4u� z���آ�2�q����u� -s�1?���f`%&��){l��U��jm*7�_���&��\4�J�|��BH=�����fmw%eV�_0�-w%Iu_h,R4y�g��|�k�Ui�[�(�7b�����#
!E�-y���]є�o��Z� |��s�)X���<Uv;����>����@�e�;|T}�`���Y*Ӷ&�
�c�i�rȎ[���c����t�;I�z8�O��ۆ�p�[D�nƥR����J&��廅T�(�%�S#�	:��2�T^������F�]�v_���F��
8���EZ�
8�\�0:t}Ȏ����^a�X�e)�������WF�$�
���*}M���֢9�Nu8�Qw�e��/��N�f�{	cr~��j�El]�q��0�1�$��C���ᵥ���C�y���|9��֩CG������_�s�*Ul���~M������������y%i���S���ܩf�Kp�vI5g�0�h���	�s��t��nD��r������G�Je�\	��4s�~qU3�����>�ǁ��
#Vn�h����_�U��n�}D/@IzzUịr����u"ñ����2���1���7�~�<dV[-��Sy�0PD=�H>�/��;׃G���,�FbY���
�˼|��V
����ƣ�{g��|lg��}C���7#RR���Tw�"A���2#��`9؋'p�����k���'˔��89�czz�)N��͜C��l\�������X)Wԁl06���"4K��ڢv�"U��X���5��U�J�:���W�+�\ z�n�!c���I���龼=C.7;�e�⑮�}���Hu
Ï��gG��U��并�*�T��XLG�c�¯�W'�����,�b�ҨI��[NX�3@Z�*�Y�uQZ�#��S������y��ٷ��?j��R����xzw�Ks<�8<dP�=^>f��+��K�u럻Z�M^d\v���C�Q�����w����>��j�Px�i�a$h�~�#Gi�T!�Jm��2�ơ<���5�!�h�>(�-'9���ۆe��    :CPbH�1�@�mf�/��秴��"֛�P�d�k�źd, �h�>�&"˿jM3�u����;1�H�@�K��vȌ�e� ���pU�G��R�:�\���S%E���R���W:���zʌ7����n��Ӵ��r�%8��t{��#�v@�p�A䜇	�ۮ��[@��z}�ݷRu����UP�ǯ�qmt���b}N(�
��|A0�qQ���uڀ�#���%���k.�jN��J�W�1>n�c�/Ș�����,`�i����27�o�(y����e��Q����>��V�����+̙��C`;B)Lk"�(F�G=�}�s3]*�w*¿JQ�z�ɴ�(���N�Z4�k���i��M(��i�R�R����}
V�
M�FxYU?��=|���$�B��7�m-±��j�̙�ژ��a���I��W]~�T9��K�� �'�43�bz΋�P댆$�
�0�FXBƔ��G'zI��\�_���1��&��GÛ2��pMB����1;�ĩ�,�����;�Р.ϡ!z����.�;l����֥���7�(��jܾL�d�-���˗(FŤt�r��q0e�>fNr�O�����9 ��~J��J�M�������9ӶŰ�ʶz5	p�K����G���r�Il���<bLI(�/���2t�>����8�N�82�kb�J�;��q]�vT�!����%s��4��[�$�_`]�'�����f����ෞ��}��JXQccknu�}��wIɭ�� 7��(L����������զ�p����&�d	d�by��c��m��r��֘�	t������n4��}#�Yz|=���}�[�	�m���;p��M��Q$h��wv	⟧Cs��n�������9�e�5�,E�.��<��N��Z��џxz��J�'~c�dkcL�)@�7e=��Y�K���S4[["T��=���t�7���l���O��ɿ��f�A�G���O���R��5���md��OH!8������E��	#0����zױ�GY{��:���>��s|>eimǛ]� X�a�S����<2���v��-:8��:8�Z�-)s��� ���){q&����op7�j2�6/"�5�q�)�5Ǹ2�o��� My��*N��C]��˘�5�
���a�������U����-�
�S���a��&�s�
/���[,|�M%�bMg/�޸p%hz�g�?�<��< 㹝�+#~�� ������<���s��:��Z��0�=;��>�԰ {��f�{zh�:��pp�/�O_T�gV�92���C�1�==43�_,����t��^E���;mBS��谋+c�Nˉ���{�|�X2�\HY���r ��r=�p5���z_tl��D���G������B�0Q��&�K���c��n�!�� ��L�4�b����|�]i{��(:���@�����ᔂ�E��U����׺U�"�(�K���'u�#�a,�zhe���� 2o�A�'���)���'�)���r��8L4g�6�a]g��D/g��Y�{f`�hkT(8p��O�w8��N:��C�̽T^kN����^����r�.���& ���`8z(9<g�Y�h�Y?��#��GE�R���8��`?�|t%���uާ����Y��G�݄��ԶX�brI2�f�@2�yثm����5K�?Nm�;T̀r9Y7w�
�G���n�|A�hkF-��gn����S:��4�9��5fۤŮ����+	�mv��n�O-M���&��z|0JeA��:JUrzK��1��Zg8�:���P�
���J0��W����}���W�t`�S$�3�O 	Zf�^[GP�$�{_B�i�/{_2��U��H� ���>|4��ձ4Uq�~,��9�q��bh�c8���ӄ��lԻ��d7�v���p�����U�p�W2��O�(���&�2��|��l;�s�.w��ڣ^4�r	�@KX��U^h�n��X2�����z7��Y]�@	�1ȷY���Q~��ry�坞~j��p�d�6be��땷Q�� ���`|}!c��������	HMi��+]}�Y������0��@��V��;���|ޅ����Go�b��FA����k䈞!聿���svR�/ߦ�����9�޼"4V(��m����7�0Z��/:G���x-14�"�u���2&k�5V��z�5(6��Ri��rX��|-��puc��8���O�����I��A��9EN��N��$\���k*�M/;�֤*�xe}�++�oHz(||���eF���r�[N'f+C;hZ��,�R��o�@_��f��Ci�����{��oצ{��qߐ���9ۧm�R����'��j�l�BԼΖ<�/�:��G�svr��Y��0Qv·s��S\%Y�X��=_��e!\�}][�q�@P(k����o��j�XjY�aQd0�?�wj���=���'�����]�ǸVq�:�u�+Z̠��A옾�Ȉ{�^��� 	��$���U�$���6l��N�:��y����NmLɊPT��]��}����t��J�f�� 0*�\	��j�t���N|P#��~=��T���� T�T��/Y�9��Zڡo�y��a�>��[����{QO�}�Ľ-z��`&�����3�Iemx����TE��޶v�f*`�>U9�����f��Ԡ���Ѵ�o�q�<�^�Rm�W���|��q����db|�_�n���G��u�0I��[		�I�|�
��Z7CD5���Y_��ܑ�Y����WԲZ�fи1�)�3`���ö���3s]�B�5gF����8l}�k���AZ2�^햚S��B�e�^W�bM����a#GP��3�6��J�FZ�W�&�������������^�^��Z��aCH��AB��`;���PT����$x�H����3��\���2�f��7=t��<��:_����	�v��zw������� HPfL;0�K�������}C4�����0���*�-dΪ�&@���K�W���1sd�������C�MP��r42��>9���L��� �uj��U�lO~�|U�ɬ�B~6̪ѴX��>�Q���^��l��OP@O=� G��H;����@��x2~ˎ�0�d����5�f�:�K�AM��,O�cC�ۋ<ƅf<cR��v���r0ܐY��?(FZ�|���*���(�UGy}9A����(�����X���5G��"P�:!~4��5�@n/�x��4�����U�����×�)����|�z?]9p�r�= Κ����ASF�1n� ���f=c�1�]o���}���R6Fg϶�*& V��xE�m�������14��޾�����zn�Ϟ-��<��1̓�S�yD!�;��z� GIz|�^�B�����ư/\����X�Ha��@m�:��5{�9�q��ko�fd�}	\i�FZ���h��\T��%��UNm0� U��n����.pQ��x8�#l���Ur��1��ҎD�"'ˎ���N���]�=��D+Jw��A��o�vJ_R���m��x��,��V������C)�d��U@g��l�4�.�����꾋ZF(�l���������q�B�2�%|�!-�4Ey�!�u��6_z��6���Ӂ̙�v^܀s��̙� =P6/�*��Ҵ(�{�,��>����tx�����C�,j�r�J.�}�-+���v=D����v�P�2'�rŕ%�}B�=��+�2�Ƈb����ës�}<|kT$��bM����%��1(�}K���ٚ�N�:��"c���C�ӱ3�?���o'e�v�U�ǐ��OSx�F|
F��1}��61�Z�WMEĕ�t�3x�d���V�����u���TZ-��W���-���;�?�� ��^Y�c�I�=��P�dv�r�~JO���rF����*����y����GP�x�5��Z�NW�+�o ������ 24=fO����d5�C��u�/�r������CY�U������\�"1���    ֑��N��HIh�UP���J��[k���8%�M��*Nɍ�~�/���<��'P���0��KFkn[@	3��m�SM\=~��d���f�c�Ct���4�D*�ۼ#׼� b�|s.\b�Er[�w#c)RJn����$���t -��
�L�v���،�hE:��A��җ�Y9���g�S��"�g��9%o�������#�wa8!:���%M��5�>_i��X� ���c��5Ri`�;���!�I�ٿ�w3tO���!�p{;4�C��;4��]�ˬ��Ǎ�d)~�D��UK@>U��qE��:FE�!�	P��v�s���A6��h��mL�}�s��r�(w�r�����F|j��!��s��"a~չ��5^���q��2'����IΧ���̇��^u��񸠥�.n���%İ#r|K�U���82@��5��Vҡ� �N4;*��AX[;8+���
��6,+�;
�������J|g�2��O-lO��Yt�f�¢�����FE�O�ޙC�x���V�� �Y�͈�R����V��Ĺ9�ӇZkTP|k��<�����,��T�Q��$=����Y�k��6���L�@���ys�-��@����ְ���/0'A.X���i�3����WM�V���t�֖�"�mk�^(����V�a����5u�>���=э���A;�H;��@������V�X~λ���t���T��|#���ť���Q���:��[��n��uo�A���S��U��X�<�MW�p&?j�����h�qkG~X&Q�����8�5_\�`QK��D\�)��	>/�>JvW��H⹕������Iч(���đ_y�u��������nۍ�h��5ނwsS�C $�THa1tR,/嚋a��af�rl��X�O?��(WO���@�ګ�ԕ��
 ��w�R���4a�:�À)B} 2B��1P�D����>��'wO����X����k�m��1R/Jp�Ώ���{�@ꔫP,&���!a�oW$�� ʊy��Z�~���&;S�yDt�����nO�p�������04����}J��ߠqy���7ԯMu�b�O��M��R]�` ]�VӮPm_&"k5����Z��������D�}9`tr�J�H��p�[��5;�i���Q��-V��/����&��.�1�UI��d�fS��&����WW���@ӵԗH��f��?,6�f2�b�_�>���`�MF��8�f�MZ������6���h�Z�4�[�)U�`�.��	��R�~�\�h�d�/���o9H�р�~���ZsS�c_����r���dPtr�Lz�&�ث5h6����O@#�{��&� ������ȹ��p'�U�h+(v=0��v�4k��Fqj�/��.��[^����O4��S�<�;d?�0�J�W!��u'�Z6d�:כ	?��zZ�Ǧ���uFz�㘼F��(�k�]��s.�-XJ�Ͱ�77�]_Im���2���J�hSl��I��?��1�뇕I�͇�u>��-V���F!J>-7�\���wT���w�>�v��W+#�f��ʅ��b�Y�i�u�䇢׸h��g5�q-�u*��J/��>k���ȇS�Z9�%0��kՙ���dE�c�+U��jR7ɗ_v�(��i�@0��V�j�þ�������VΞ{w�o�Ebh �<����{HcivL���*�'���u�����D�ym"o~�Ŗ�/��N/�w����ڵj�V#k����@��<���
^�|��<KnL0��|8[ci|�ԇ�wF�����
�-�e:O�ɡ7
4���,;ZT�eG���V�ҍ���b�7�`����d�P?�ͪg0�%pZ��[�g0L�څj�Y��\�w�]��l�n����$?��`�^������%���m�E��A���fz�"B�(�T�<�w�Y��(���ߟ�W����Y��?4￩�LgŜ������Z����I����D�u��l8�H�����T}T�X=۠?�����0%"�h�1i]�`�y��ꞎ�2K���,v.Ea*e7�1��v�/߰X�H虖���V�L������H���$x��7�~Caƞ"��~�m��ճ��_��mY�^�b]�:��Y"###��
U�i@�u��ʑzw��J=@ِi&#D�a�0	�{sh���ù��ܽ+���%&'���0G�Giw#}�wPS�0�|	���q��k�`TE��ދ�����t�"־;�GSo�t�W{4÷B�<��M������0��,��4����b#�go�z$ik���>�Չ�`c�j��f_��h�l��:�w�z��$�|ǁi2&1q�]��ls�)�� n��*T���v2HF(�-X�oU������� �ɸ�Pp�ҤN�6'�&p:Pu��i�*w�ª�|H��)�;ӁQ��zJ����EC�?X24O?�����<]��<OW@�9�q$�%�YCI�d��uxs�9*��hx��<U/��d��ެ��3jHjB6j�w��S�}r��� 6�Y:+�3v�*23񨃆\al=� hH�w�?�B��`����=²���n��R���n�R�� �0j�"o�_�'Ac7��N�K�=����:��*暗HK>�*%ZO7e+�����@�Q�I��<&�F�HǷ�=���M.�UWgS���X�,
�$(Y髞���R�)����N਻^���N�h˪j"�K�TŮ~�����q�V�Y��.��+�KHퟤ��]����;Bꃙ+�8�	�s@c�0�cCZ+���ȗr��(]/�M�YՕx_$��k���L$��α�v�^�,������+{�":J(�"���]���y��s�r���d���f���`�(c]�J9#\Ze,	�^<��W�̔�(KVAyH�z�G0�t��b������	��Y����K�#��9������$��ݦOќ�z���AT�&nZ�y��f�3�
�ޑ�Z�

�;�kNƉ���"F�t�I���N��L���6�#��KLFܰ@���ެ�3�N�L�������fݨ^a���1�8r�{�Q��ܡc�K�5e4��U����L�Isc�����K�zc��PJf�ȸ��d���r������"���B�<pq���Nat��	�1R]��`B�
�^�C��CX�P�B�xX]Kڽ���|����4[�v[�%�ڨ�h �kc\�ʘ�BS�m0�̗O�:����i��V�EF�
� ����F�٫�:�VA�S��b�� '�5�e�TS�P��� �g�wO"�K��vT�W[��3���ǻ`l��Uەw��wN��X���+��@�J��	a��i$"fǨ�iWČ��o�ȶX��d�B��dy�+��a�+�<��Үu���⫠��9��*p%7EdE�I�@�r��o;�64"f��]�����G����������!GZ��:{�!�q��8r�B6[���b�~~��vg�Ƹ^[w�WCۿ�ؚ*~1��d�%�:E�XtL�L�
`F�\S���T�cH9U�dop���L��ѣ-�ٝ11U�8Z&y����Ǻ|v6̉u�ĝ}�3So��	��-ak����-��~p7�8D{"g)q(	�!�y��DY�;�� ,��Hvuq�ޙ"�Y�s$���N��Yu@�Z�ʀ3��̀����ڴ��(�gi,�Cr���h[���� ;�,i��ؘ�='�,��ͽ>����f�`���<���0�АpD'V�vY��CpU�1��UY)f��G1n-L3n$�p����E�]���Ps�Z[��̳o`�4�?e��?�81��O��R�ѧcr5#�őc�7[�F̄7:grݧ1od�>��]����p�3�I]5��וs����;w#�wTMO;��Y+����F`�wB\�W#�\X�lo<U𤞭h���L�M$�����fdip��Mz�T��!T�<Y|.֪8^f�鞱�r�,��	�V�Y��v�G�,��J��`�~5�Ǎe���<��.���"� $��:,A:1���� ,T8
�T�K�ޙ�ց4|#��������4�|    �8��ږ��4���_�+_ݱ��W#hԌ�Ԑ��4�G�������苽�:�7�k�{g�� BO�!��~������>��Q��.��"�hXV*u8����D�e�����0��1�S��������%�c�Ir��F�o�y~�N�
3����Oڟ*v�&�6��l�cR�1KJڎI�.������e2Kg�B}	��d3����q$�٣�	�\��U�� ���LR�O֋:�bd���Dm֗��Է�X�z�ˣM��E~X@��V�O�l�F'FV*OHC���(�M�wE]�D��W�T=�Z�~�I,�	i��BwՃM>��W�p�0��YR��4ŵ%%��h�z�C�e��`rTN/���E�nNo\��<U�b4+ )�����]  ƹֱ���S�8���%8&F9s�	g�dӕ�A5C�H6i�v�O<���6�Y�,�n�+Kw�r�b��e�f�:ɯ���|I�䦨���:�H�G��3���ʶ��)f�����7H�<�U���FU�1R֫�}���Pa�N��N�����L�]����X�!����Y넼���3T�%���0.��f	�7+�_A�n����q��d
p)hT���ff��ѣ03�u:XQw��B�L;�K�m��/���1O��΃O�GϏ��+�(蹐a�;���#l��w�[��	�Q��Գ�d=���s��e��;=�o=���ZQ�Z8��ss�vn̨�1�1�_s)��&��ܘ���hM��2��]�װ�
4+4�ԤH�l�����^W8��xDIdz]���]�[�y9����(�\4�͋��*�o�P��86K��Pa��hr F!Zdk�e���s��Q�J�������v��wd^ ����yv���p���.O'�D-t���W<@�@�̶ק�c���F$�ؑ���1���aG�}U&���F�	mɺ��S�.B��� ,�?�B�c��m��]�6>��Wv�`�A_^�կO�;�/�e�Kr6��!�q�`��a�B�:�_���z#�^���ϠdڅVŮ@����x��(�3Hv3����b�e������:2����Ɔ��ѻ[���(Зb����3ǣּ,����k^�Ǐ짇�D�d�{��m#R9�V�K:�<~d59����!]�"��U�G�~�dV��|琎!L<l�dӕ�mG͛<,n�u��u�n��Z�ʷ�n"t��|z(�O��[�z�9��ꥥ�ED��B��R��C�*�@�-r�sS�$5s�NSғ�b�#u�6[WW�!瞘G�?X���Ѫs��调IL�)½�1�4N���	�������r �'c�X��Z�w
r�{ G��|���rh�8�n����Z����]�J�{�4=�寋���#̜��uqW�0k�H�c1�ڐ�n�*��Dkƚs	��u�8�B�)#�H�_�A��vC�{��b��_��������^�p����t���[���ڵ±����];�?��gP/C@13�����MJf)��M���}��Qt�X���욒���ݛ7��g�ټ��>�~A!�HW�xө�	\p�/����ƿ����`���&W�]v(���� O7�f�=$+��댯:sW�hQ�S��I��Hvؕ�yF�Ö��z]tL��Q������Ȱ��jU
��89&�+f���Fu(5a+�]�L�>��Z��� a\[�8oIbm.��ډtf������0�ґsuSh�4CUؗ%y���!�%Z�l��l��ukl3�w��R0��8��Y�=v�8btH���*0�\C�,:���Y?��� =|�9Q��V};k;�0v_8a��9��Q��ծ'�.b��Gm�}��r�������'��O�:~�'}�S���в�=�ú�e]r`]b0y���$�w)>���/[�A��v%60�U�
F;�f�"a����A��^�k:���'3j��!k}>�Co��u�?S�˩�<�v� ��F8��DO�zFDS��J��(Z��c���68�6`�rw�T��Y&+�@J;��<8�R}At\�����Bg��Hk���7Y\�@9�ō�Y�Kp���E�����X���oO>��|������ja�Y	��vw��D����m��Qd�ݗD��/����G�e�-���k�ޓ�}xRE�N�'�a����6��>zC���A�,�!�͒n�t&¹�V%�	o�
��xFzW�X[ g镅>���Y�֓pH�m���ZQ���^��n��W���YZEI<��cz�qt���@��gP��p��;�!���g�X������9�/���k������L"=�q�!�14�$�7mjD5�&��R�I6{���d�����)Q~�z������B+�ӍTB���b�[n9�*`�P��_^� 9}�Zy��?�P*F#�-���T�uDOע	��hS><]����aP�׋�85�8���@HPrw�	+��t;!պ;����
���G�4�Ů}�J���,wV)�JtT��da��M��N��Q��0fg
��r�hC��b���Ϫ<u�F>�g�Sj�I��L�L���LC��ϧJ��/����ݱ6��YW;B,)�[f�,%X �8�W<��Qv�g�T��\�ܿ�,Ƣ���f��8�����W����)�L}#��|(^�vj��ǒ�P�K����%m����'��D���:�{�S�>{ݘQ-��G7&��u'��T�d��vS@�a���	�P�i�i[�|��{� ����|*����O�)]%�����C���G(�����y[��b�}Ô����c��V���Z�ƚ��nw��3��h��z���b��"IQ^�VA�T���)]'��=�Կ���b:�v	"�V�2�	�-KUS���]yy�-�c�-�n��i�8ǍS3	�/�'�e���c�x����8wG�f���t�h��s��d�X�,_U���\������1��{�0�cF�f9�]1dz^��Q�x?��-���oZ��|k%D���s���P���`S^�S������8V�R-�gq�ݨBA;�E�~х!?Y<%,*���Y�����|�^�U��-��ˮ��ݍ6���{���4{8��泩Iz�;�Az.��m�;��~\��<��a���
Jq\�NI�T=�T�^~�겿�&�_"il�ݤ�A��{'NG��?���e�X��".٘�"����)ZJ�1�%�z�v</�?/�R�;�א";BƓ�'��y��U���]�ݵ?����&�kʰC�����1�ܟ�fgS$Y,���2���FJ�*l�X'5�#C���U���mw��f��Xjw�'��ѱ�Q�2`�U^~"9J�^^�B���|��t3�y��l���w�aNLa��������s�P~o�Ũ�Vu�kU�Im�=��}r$�tф�t;�ԏ=�I��勇�
�#Ҕ��R�ǲ\����
�����;lrc�����"b?�꿪��':lr���oO����D�'�q�];4�m��MC�V��nH�&��p��3M"똫~���daT����|B����ܒ�ɛ�l�B�Nzձ�v���=/��?���h�ʜS�	�j��V�Άlh�p�Q��Η� [���|�[��yV��"�a��8�v
q�$��	����A����<?uYV\����۱s�m؛Y�}(9�./��I[b9���v�"2�V�	;��_��!�AKS���zw��tT���̂��@����o�[��G�`q��d��(��A*;��� 2������wK� �yVl��Q�������a"f�8�������w�O'�VU�-x�d�t��B# sd������D���������t�1�ef��e׵,��:'	 U�m�]����,@$F6cM|�Dd�𩶥����l���q��"D`_�E�f�`0$�b�Z�"O�;t��f���r�c6\��d�3��=����w�U�r��
6��Y	6��=PU�ۋ"�5췹ư�]�(~5-�����k��Uy��K�Z^�Q��qd�2Z>J�=C� ��/�	���$�\��d{�O3�RW�.�!�3#Æ�~@=I%���    V?2�l1[䭔әaF����]��h�)�h���̓l�3��G6�#c�daw��7��Hyl�"�B�P��)a��1sb�a�9�~��؄m�����⇀h�Ej�j(w:N�v6��G��*3�1�%Hvm�IIDT��Zn�pD'	_�n����lm���blƌ�-�r3�!����T�%��ȶ��U��xL��)���,"�yd�đA�D��'`�9�s�Fs��K�;�tF/$���u�h��Қ
[�ප����@բ$՛��ahu�0=�F@(TYݺ|��{��P�'�xaݜ�h�����+L�f=.��)���$3/n!¤���!��c��q�jQ�m��G'	"V@U�l���-q�zbNmaH:\�: ���ys	�kȫ����JN���i�E�Xڽ��b)��L�~{��A��xy�^�`{�z~~xF�dV,կ�%��q�p�K�,2�ǺӫǱ�z����YI�_�x_�:v�{Jf<�@ܲ�#?�_qQ������q�RI4�՛Қ	��:z#C��ɒ����v�u�¨�ƌBI�Պ]Syw9�ʇ�2�W�	�.�Տ��M��"��с�h�Z�KB����R�M�'�lק>�a���7������l`jDd&	��#�v����1���l���K�0/!d�q���d����E-Xî7�Q=�,�u�^8;:BMCl��zr���u���H�-&�����Z���Ħt�5�U�
v���m=�ffJ��G� ��#lXQ���a;��Fq�mb�����g��TǲL{l�x�Ir�k��Й��/���$�1ڤ�v8�Q�CW=���A��T=S[�|��|����Vc�1�5��XC�"�d�c��N�q���m޻�0v�Gxhc:nxXzzE��P��~1�i�F�́��>���$|�iv�G����F+�ud��Q��GyjL>�m������6
�ͱ6^w��Ki1R߾�@ʋw�cu��!H�Z�����n�����ua������Z0�	���|W8A�� ����K:#��@�ns�8	�V �>�����٦�\γ�_'2��t�/��X�vcZ?��}"#�]�r����=Oh���P�Q���I �,Ć����e���$!��?���m���3��Y��-�mJ���g�b'c�^�~�O�����O6�ΟH[�;�z���|�&�Gy���|7�������X�3L��}gh��;#�O�m�}J���s���ξ��3f��4�N\�o7Y��6Y�bw��6��w�.�|�U����Tk/��xDG��mg�#����FGU�I6K�-��%{�Oi��qw�A���#�%N��������	]L���9��8���ci���ӆPP��I�����F�캎k�܌kC�)3G�
�H�ow��M�����7�ȹy�I�B詊@ݹt�~ۭ����
���:�1�%�H35w7�$ҎB�u��M�v��*_��u$!#����n��U�(+�u�#�!��EV�vl4���u��/+�)����G娾��2ϋ�ᆅ�Ţ �
Z�Ma~��4�[VY��9�VO�@VE�~���M�G Jկ\^���I����/�L1p�p��5�!�Ҷ�?��Q�[�U�&5�j�����2RX'P�<)�}%�Zn�<]��P}a�J�ڽ�dy�O�b#�v��a����\G+u���z�W�Iq#���S$�#�&����g=�9�$�C1܎�B�x5E
F�� ��1��9�&yf6���<�l1WOi�p��-:gqȶ{�E�j1K��L����W&#C9H��^��/ۦ� ��[�H&,�w�N�%�M�&�#G���3c7(��q��R
�p1��=�'���(�Q1�ħ�Б-7֖D�[0�<V�q�׹��(a��۹�hם���7��T���xd)��lDZ&�u>�x�V-Dv������s�!H(6kF6��و};�:, $��m8��aI�uR]V�YH��%>X��Xk�}�Q=�*Ƀ��!K��~`P��9y���f�2����7��������ߓ��Z�Jr���;�k���Q�+��,���ݲn?`�0U0#m�vP�vk(ǨR��Ֆr�1,����%p�)���&�λnd��0����SE��,����`Y��d�>�(Og��M}��]�C.t{ÀOƴ\U6.ݣ�hSE��9�n��h��M2O��ٵ�F�:��n8����Ѓ�$�J�>-3�����a	]��P��\�:�n�Nt��,��K�d�>�U��$@��_��^q�,{�
@b�8%�T2�?y�����Q`=�U�T�ر��"8W�TDI\���G�~��r��b�M2B2��1Auv��n4�$�8U�zi Y��]��W���}�c2`��bS����<&���z�[��b�[Y��yά�lU����G�i�&=��qws�meC�q����VV5Q�$O�S�bB�z^
_������;vC�1WN�X��h4���QOx�-$}�:�����<Ym�S��-�+]%���[/(��iw��%�|���\�Z�1i,X�]���֖���3U�z������8$��<�&@�l�юZS�P�37E�
�m��ZL��y��Bg�E���hc��B�� ���ԋH��	���z���M�7Z{2���� Y��2\���gĘ�ơ�a'-��IP�|��M�Ԅ}��Ҍ�"����U����T�h�ǹ�o����՘��:o��Ƽ&���Q:U#h�����ɦX�A���CUcn�����$ݩ��k�sc<�����h�䳁�2�V\k��e�T7��&�x� (h�ro{�t��k?V�nw�?���SE��}�R?8��`��Sx���29��G:��8�t3�������d4��'Oi/=WKL�Ћ�'Җ����ޠ(�Ɂ�6`�C;C�%�Ҥ��F��ʮ1 ���\��d_�?E�34�z��Hs$�fߛ:��4G��MI����Y�`/��ff��q�Ůe5>N�)1���|����Ո�+,��x�fI2�ؔ"M�[l޶�3yZ�c���B�V���ΙSE3B��4 Ïa����;n�
U�ǵ_a��@�����ꇃ�Ƒ�ُ6�s?�t�`!넟�>�>J�ԣ�,:�Ĉ���U	d���JH�.�yy<bP���c�{ @o�����i��Pi�ed�xt-D��Pa'�Zg<`�Hwm��n;Ə��op��s��Ҭ�B����BPb&�N.|}i�*���D�����Qq�2����;��C�O�Q����"e4w�U�=�);�����ʚ�|n_d��l�eg�k<�I���mwc+���V�M��:,n-	ў>�.qc���Dh\�jS$_9g��4�W�H��l�#�Z�ْ�a���?X�(�����s�_ R�-u���Qڭu|�#����� �+u&�=�p�M���L�IDM!& ��ưò���bd�knxΒl*F
On'��ԌRׯ$��V���3�Z��rNE��l0�4	���,2VS��޵/�@�i!(a��l��$��U�$e�#�1�baǖ�c�,&g�[=��:� ���W��������G<��F���f|xԧQ�E���~����o $�k���q�]<�Fr��uO�g�j�aP��zl��Vg|\U]\����In�ނ���y�ƶ1���\L��V�Ǩq?���k_
�8��K��:�W}!s���H��kb�#�M��s�ό�ƹRdLy��;s�d�LB���M^���Z-����}��%���L/�-�[�$#�"^!	Գ�|ɘ�Qx��	���B�`8Ɓx�J�������ȶ��.X.�樸/���f���lRp2�ͨ�gq ��N�ꚡ�D������Z�����հ���ML���勃!O����{�
7l �i�f��:��-��X&���C��u��^����} QwZ8R�ζEp�ag������aWҳ:�\�xE�3B:��[,#m���X>p�5a���{mS��䦅a�W�։��Ɇ� ׅ�d��BB��f
�g0����R��9$֭b��!�xr&�irL�    mܻb�%We弿g0R9g�pd�r�b������ </ ɱ^b��E�i]$�H;�i�Z���Gy
 ��T�`�׸ǃ���}����不Xr��̊lpGP*�$��uL_����(_Gx�LB�T?��i �vt���DPKƭ�ƾ�'$	: �> ��j�US�Is��"#�r��$�c�I�W/���i�H!�b���> V4��I�XtA`nܙ�}��ϴ@������롂F]jgJ����[J�u#��1J�l���;�jWi;g�>�B�3�]���4����%v�߭!��7��6*$v���L��
��ax�m�I^�|�ia��I���!��Y�,ffK#Z�}���GXҬ�� �O�ʔc"�A��L�kw�1��i�� �q�X�k<b�χ[(����!�v�t��\%'CØr�\Z�T'��C�\ӂ#���l�;3)���W���6E�h^�G*?��"���Mo���Qq ��v�@"7�����خ	���ҝn��z���[#�d�b���e���{L�
U�u1����zu���,�ׂLD�\fѮ)�vw :j�Go�,�{l<��tH����z!h�o�,��M8�G��K�ӵ\��Cx���(�l/��^0�՟f�/��jw;�d$�,�����:��s�{�����>��`�Șb34�zr_W�2l�f^��5���?���0i�Tuʱ�'zn#�5��h�����ȃ,)f�%��nkH)�����H8���Q4mD��U*�9��h���6��+�q1�R0yԋ)ƃy�8��iaIMA����t���/O�04�aLpg�k�-#}&�
�ڽ�ma�fR�uo��g�:V�A�޳&#�"���?���\�@4$H�Y��C�٭v�rl��2j��͵�,+t��h|�q0_۴Nׄ\g���#���`�ݧ��x�L"�>����h�χ~���0��Y�zu8o�U�{�cl��h*���{SBR�)��2|:��jF��Դ��\���k՟͋�2Y��)������+�Nam�L�l<|�՟%�:݂��Mz��a��.5u������_��eW���{Y�$�G(�U!�X�?2)It��ՈgD�V�J_�j��4_�L�rm�ze��燆i�8H&�C�?2�gZP�P� �c�*���,H�߰ �9�����;���an:ꀡ�%?��N&�|�{a�X����e�I>dD��)T5z ikG��%w��?��>���� �ʇ�<�#����ߒ� ��9�x�8�I���az���r�a��L7�O�6x��@+����kl�������o^l횖�?���X�iI(:��h/��a��E��T�Y����Z=� ��3���W�{�kȵ� @�����!X\��`_�>�ʇ~1�?nU���׹��&OWx$A�ˣ>��M��8.
#��m�q�����tM=���]y��oOe��2C ���9$���Rt��xkN����gyz}��v��HJk�a�����h<�/V�=]�S5��<ƭY�j����)��a�z�����`Y�O�(_l��;wwƕ�N��������bȽ:A)�7ϒ���7xD ��L`m�!�Ep�O���P��o��r-�43��y9(i���Qw��=�*�����e_ʡ]	�I����,Ld�pU���S��g��ryT�����3�����zC��B�����a�Qr�^��2,�a�����4��!�^b�]�<?��o/�`�%M���k��m��A,�?}��T�ħ*ؖw���l��1]6ept�OaJA���� �P��:�l������o",���&�C�z�b�`Z�<�.F7����������(	�)��Ƥ&���C�Ï�����=X�O�cg�e�g���D��:f|����h^���*_/����8�p�+"iX��F�b1ޙqz 
{�[��ƅz��y��S5�}��
K��<U�;;w!�������qde}���2-�<��gp��ԈU:/lb];aR���v��k��A��UB?^�zg��c�r��X?����q����by  Qm\u�g���ʟ�k�?W�;:xH��ٰ�q���3����ӏ�T��ԝ�J��W�e��A�7'1B���<A;|W�����à��F8�I��Q�tG�x��� x�V��A���GX�����q�J5T�.�����������_��\V����V4�@uz r���|��V�G�Ų�32B:N��"��dkLB����K<K�]
m��^��|_\���z�UW�p��/���|��M���C[�:��h�ף�Aސ(D�?�OݞX3[�����:g!o�G�(y�FY��:�u�h��H�6��"�5<� ����u��U����У���P_R!U���Bh�����Ð��;���\N�9@�tS��4sư5�'�}?D���EEhV>�aHn����ix�ǸES���q��b�:tz0Ɩ�Q��4AP��`�%����Ӳ}��k�39�T��5�w�EW7��(��|�A�^@�N���YW5�'���d�tz 
4���Y}�^˳���ǭ�퍝h�J��Ƹu�������'����w�K7}w��}ø���3��W���(y)_�U�~��h~%cs�3�v1g�����P��Y�T�T��eu��*�jQL�4QU�1l��n]����IӃ������u������d��Jx6�P4��P�9ߞ����G�e�r�#g� #:I	�YzAgZ2��bz0F(}�1 J�$/�:B$�I^�M��yDb�atp& �9p��� ���p'�~%��Bj>A��Uޏ��n��#��W]|���[n�O��@�=9ʏɧe�����q4i���4��l3;����l��@�|�S@`�9`��!yD�X~�H�G%��,�R}�&���(�3���!V;J���Q*�Ɂ�B4[l��\*��N�k�ג�tkJB�,�]|��oJ���}y %F:�B����uą��=���1#(�,�i�m4�N��b��Z<�Ƙ���:�f�����T͉�Puv�b�I~(�PM�I���֓��Q\-�<�1B�"���ք���-�����{"���ؒZL�ǯ<��b��m�7Ђ�q&
��v�J�)<@�!����倬E�}3H�5Y���S�� O@��d6/��|�m�h6uλ��(9aS'���1{������(T��0WX��>�li*C�+�����"�δ_�c�t=߭+�������!2x�z��sz�����h���Vu�=\Oj{#���z��e�(�GIN����5XFG�迊*�hki���y���iz�����|��]Y�8�?&���<������������[�swhV��!8$�����F;��b���X�a�ވ�2�f�2��͎	? _tz�ź�٦E6�?���w�5�d7����烡/��jD:�-P�:�%B�YA+�t�h�v�_:Ն��`K�d�������v�-��|�AA�<�F>�pw03:�~z`��$�)�C ��v�"�m��x��[Ӗ�����ڒe�'[�:���{>�y�auB�� !
����o�� uuc������6?�N���G1��9X���B�99v�*#�����v2�7 �Y�3�v�S��:�_��!Y�C�~j�N��d��S�B\2/#��x�N�����D)��[)4aȐ��M�S�2���M(9�ڴ�Q���a�����Q^��Y���l6�+ �e6���ٙ�_=���q�O�a�	��t�7>�F����ګ��`(���C0�M�u��a`�Oɾu�q���]|���2������Gq���,���Q��ֵJۛ#(P�B�W����Y��&���C\^d�l@:&�-?�m�GI��D���w{=#�	]�^<��
v�&E�#;�P�h'P��i�w)���= R�+�����&o�Ջ������&�>�B��m|��#9y�/w�t	M�r��F� ��j$��a66H�a����T��C�|�[/�='�a�q�d�a�`/?�*�I>�B1��'���+�At�]w/    �5I�Ǜ#��o�U�(?.cn����Ӛ�xIMC��O�z���B?.l��?����w�t�|��f��]�ߓ�j�mbS�C��dCljS�!C��
(�t}��a9���Ԓn>B�cUm�[1��9�h�݂��k���8_�بx~Qgi<g�P3��ZF�����ۧ�Y�ဣ��R����^dǵ"O�E6f�Ͳ: D�'\�b�S?1S�!���P��]k�V`]7<����Ӄ�h����:��_�0����C�t���������q���T=����T��ܦp����@�)�͎�}Iʣz�׍c�xCB��R�6:�䘠d3�mQc9��5��]��w�lB����JЕ ��ἂ�7���v�^��9��Ea(�v�s�>�7�2��n��'r��Yc����l�E�84e�{6=,U�2���j)���`�Y)�2��YVm�,�W����g!X��P�N,���<J��}�o���z�~^�]M��{��_c�9p�q-�!�Ju����?sV�?�ߪ�o���?6�d��ȁkʹ��5�I��bX���`��71�7��{���>���˓� ���Gܖ?/A~���р��48�n�=��z�z��^���MJ���-_� �%_//ڥ�D��ԏ^l�n�yK 	���/�0��u�E��'m�[�.���GAo�B���Jfv-�c{_iH�m�0A#�8�c��.�r@(��dv��i
40�4�_�p���1Z�翞O�]\@p�N�)\h��d΂�������u��j�b�"�s�.�zi���w��	��0�7)�4�l#����-�`$��:���|!�;�;���WȩrG�h��QFADN������Cy�7Y󋷆`�z�)<L]`�h�l
O���9�hV�r�:I�P \W��Ėv��������3l.�?��Lsp�W~Tr_��+?��(� �����n�Y�=8Y[��k�;Zk1A	��=<�d����|)���m!��(~CtqmA��T��
�B{��x��JE_wcE>@�3A #�|�6��36b4Mᜍ�Cfi����G��& x�4x��X���Y����h�&����kI)i�L'�S����B�z��EgP:��܎���mea����'�qy����N������q׌e��ŪIQ�jObݞ0Ӟ��$NC�6�m�x��<02�����z�p4�
}��R5�?��.e�Xn:��a�
`���#Xt�O��?��O�`�h���m6^���>��cyW�{�q���s��M>-�R�8��8�v-L5'��=������|��dbᬾ�x��^�4d%:�'�=�2��ҳ����e�����cfF��5�n �� ��:�6��<�頿4q/f���]����{���c��/��
��c���!�{j�	�a�����|{�!����:6%�y�L"n��@��
j���K�8�߿��)ܗ�U��??���̒`�d��b�̇�:�DNY�a��Մ�,���.����%Sfj-�kH�xA��%�D�˟����灗3sw[��8�nK�vM`�yQ�%�*X]^�4�f���ۛ`�ȓ�
��E�*SS'bM��PZR�_5N�������n��}���~��e��?Fh����J�'h�H~&e�E�M�m 5� ���|<���������K	���o�����)��ֳ���[R��'� �Z�"��J���af��BHc����1�r��hW��_���ʱ�
��p_�7l/�ï��v啪�7�o�&v�b���+c�'5�e�������F�|z*�`?�f�n���Xچ�v���Ah�'
�� K��m�7ׂ)��
��P#vRڎϟ�,Q�Rɏ��rwW��ዩ��ݪ��Wu�UI%��I��Ҷ1�xی���G�U`й[&��S�FI+xL���u��<A���<�(���Mr,,us���l�Hw=Լ���<*�M�./����m��3f�`��V�6N�u�)*`
��HwY��R7e��뚺���P��P=�Gڦ,t���X¡,�J�<܏�1��Ψ+av�2�μf~hؑ�����1�Y΃e��Z����Z=�Z��~1#ݗ|�I�ѓ풯�.�R���?+�o.�h5n��`m���Qd"��M�0�B��s�=��0��,�2�-s�P
K��}CL�:��\N0�
n�?��1WM��Npt�������%���a!ڔ^�$0g�$�08���H> !n��a��m}0+ʳf�w����q|��^s�AhJQ���WJQ`$hyy�?�R�-$��]m�������EC���	�h�|��Cy~��A�(w~O�M��5Ҩ���2G�X����;�+Ձc�[����1���թ�<��|���Q��I����u`%�?�R��j u_p�i�/:*[/9����b�C@ 9 ����l��7���a	�Ľ	��LJ�UB���ìg�/(����"W��M�,'����<������d_�o=��8o�TmB���b��>]��ms3MH%�l��dy,�;�1�c��c�sI9�Y�汾ηx�'�$A�j��Y�?����pX��Έe���WN�@��l�t���nI�=Fl���	}�Q�/�4y��e�C�:��S�D�vP��]�hqH�}�V��D�wu���iqL�L0l��ɽ���a���|���,����b�0�,֨¯����79Ic4�#�hf����DZ	�N'���m_@d訽��"CF��a��C��2�w'	���$�"�{���b������3�'
t�ܦ�`�kHB{+~��}�-)���I����;ID!r�l�`���+cI���Q�B�c�����R�h�|IgA^���!��#���;+�N?���=ZG0M U����v��1&��}눆�)T�������d�t͊��NW�&\ d�ND��$�
�y�廾y݉M�ښ���$����)"B��.ث�o3��wW1w�'51��ci)���W8��K�}��e��,:Ah�y{ʣ�D��P��kXo_<|��:}�e��=�0�-g�;,ƴ�<���Ù&���O��A�t.O��<]Η��&A�
v�kx$��QS�P_�g�v����:æ'N�&M�u�4o�GaԛD�&OG��ټX�.W�b��$��C�NWT}3�o�=����$a�!jsъ:�U�Mk3m#rf~ʈ�r�J�+���~^�T�P�n7�.ƕ6�nw$�`��fq��x�ibI�fg��8|N�s	 �=	V������1^���"=����C�=�،l��a��t�6�V�;/�Cs���^�k���� c���`S��<�=�Ѐ��Ȩ��C��}��"9I�'����_b�o��SI�X�M��~7��Q�q,�E>�8J�mXڙ��l������@�1��ϰ�	��m��/�1}w5ۀP%dM��_Ĩ�$���&��d�j�-Fd�q��?t[(:�[1�.?E��g_�f��3�f���T�ɺ�J��}S~��a�M ��o���}s,�l�3����&Ґ4o�Au�7�z0��Ȓ�	����"�"_��T�l��"7�1U<��ɲ�Y)����T�E�o�y(�ȶ���>�m:ذ��t�1��nX1��-[l8Pػ'&F9$��;��InS[6rwksP����c�Yky9�����=Yl�u���>u�k��s+1�A������he�4��h[dK�Wo�{s�O#�D,}ob�:�n��!���C�&�~ױ����ޠ�Amx0M %Z��}�O�p&6D��F^S�01�s-��
R?[�B��L�h(��k��ջ\���#�5�m�	"F�$bh?Il��*���I�T��Fh���BP�J7�2��;9l��γ��Q�0k��*w:���xd�ͻ�6�Pt杄z�τ*[�	��iVm]rS���b�,z0�MF��0��hҚ�|�tz�0�hv�{�l����V��%��ߖ]�����Ĭ͆�QF��$�׹=��p������n����ߟ�L��V'K��\���ͫ��I(�A���j�N�mg��    �d�u��Ao�7�͋Y0KnRuTU��E�N�t ���Q}+��|�O
c]�t㒅ؐ#H0�s��L��KmӍ&�G��1�f8�x�?�M�<�N�C��#�.O&�������_BEH;O�q�D�YF���è�T]��tW>���	�׾��������$���U�,1��$�?�`����ɺmk܇<L�mM3�Q���k $(�|�Χg��bk s�#g4�$z�u�sreA�z�+�Ru��fت���ő5p�!x@I���l�����S�Yyw��}���*��t�����"��Gތ
f��b��ئ jӢ��ſ��b����/��nf�n��c:��:���� ��y��?gr��L89YK�%����)�E�3�ϧ���F��y�myC:�pX%z� G����>C<��$��J��	��E �:A�
 v�&�_��^�A��({"Ӝ���7�*
?Z�{!���|�Q����w�#	� /���%:�fI�'��y�D8��%F��B3�0ܓXC�<�T}���N�-`��� F��4��U��;�����1JN�KΕ6C�'�Rc�o�o�VDh]}���HZ^ IP�^�?�j �q�TW�[!��l����y�����{�ź���*�oPn�&��p����_���M��/�'��<=�Tg�����:6�A��E�������v7X��r��t��S���cu�9��2�8�֐���*É �����ᔡ�۽�H=U�m�X�՜�MU�h�K�3j4͜�ؓ5ma���ʧ?����zy���k�,���ܬ��F�>�~mxWv��u�	��O�����^�46�uum$��& ���0J��T^ˇ`^ޟ�ԙ3@{��J�n�8�9�-��>`�(�S˟�Yz�nc������\�*�q]HJ	���VS��啪�u"�%���<�$PV������?���G@M!M{�F1�I��@�3wճ�Ϭ{V(��$��P.�&��� t8��}5���Q5Ǒ�mŭQu��߄Fh^�� v��94�"�(Ո
�/�D�R{��W9F��c�$��.�f�Y4���&JFz� X�k�V˨]���%C���ݹ2��|�ؘf;�}�� -&�K�}���z<����0��~�q.(���1�sA�޲��A��U�n��jfʟ�]��y8k0Y���y��o��󆃵PJ���������g��	5L=��x�5[�^'>���Z��C��ʫk�icb�w4�>�:&�A0b]��W�1�(���r.�!�p�c �:�0�R������1$�����\��B�ϱ����8w�!#�7��4M���pR�8�U���8��~�ͬ�ݚj�`~��/b����PF(+_^��V?-K6ɱ��<r�Q�z`&���F�>�-��央���WMˀ��͵��[�-h���E>ɚH�����������_��mh"wSkFM�Dd�>����������n�_�PJ�s(��$��B(Ͽ�����h�^����2�w�d�6Ő� �"�b��#ofly��D�c�t��nw�]���]|THT��LvB�"��R����zc�����zF;�;�re���
A�>7P�a��-tE^�?��
�&��%�7�7��^ I��tW��������|�t���~X��.�K=������42��\%�ԏ����cH!tW3C������a���kyU�j��åǝ2KlWQWdg`�݄����A��GJ�Z���>[�)��!��Xl��t��Q�W��
󻳺鯠i��d��4٤�q��W�!��hB�!��G��`�ж�V�o'D����+� ob�uY�1�,���݌����C�����`�_��`���N_[F*m����T��S��WK���1`�\����!�ߟ��'7���.}�W7#F��CAZ7y+��?p%:��`�T�^��8�cy��P�B7��׻4a�!��������	��b�Q������G�jw�'�5��3p�h��
���fx
׼��؛��:�S
�0�,i�Y��K`	J�U����S��,1����`� ��]uЮ��ݍկ*նL����7�n��qV&�9�7��N�6��k`߽D�u���
-�Y><�(��p���6��5���Z�KTc�Vn��PgjW�n�c�P��[Y����������0��:Sjԕ����	/Ř��'G_��矃�����>�Q�ύ٘�鯃�@���c��f��Gu(��
9���	�ng�����R��6���:4/;vοRҾ�Xtz��%��������dZ-�s�1fR���t\�<AJr˦G�P�*�^�~=�qF�ǵD��&/�������z�s��^�k*|�sG�Z+��(fb��0
y���F���NJ{�tz�5��b���2�03f1�t��=퐯'5��N���.�]�L�L*BA�J����j
^u�#ڵ{�_���$bM3��<���d(�Ne��������U{W�|�����|��L����)G����]dտ��r��닁Ѓ�	��Ώű�F�A�	 �a�����=f)�l�n���zW�;����AV���keFzIV�H8v~�A$�p��[�*��=�SGш�n�G��ޏBK�݉�I��MƎ^¿�2O�桟/��~y�~�����1%u.L��f֙�\?|�����[�����륳Qc���0;~5vk�#�l�&(i�ͳ�8$�����FT4��,�\SB��^8���M�G`"*�&��],��Ka8�W���v t�z�)�L�T	f�`�Yg��}����wW�(��k����D6�:�����*���k�X%�z�ɹv�t�+q#��p
$��H2�����*�����G)���V�8��ԍQ���i� *�?u�49ڔ��?�����Q?�n̻:?o����Щ	(��N=��:G%�V���?˗~ڦv@q��a�D���0Ǯ�6y8%8��U>U��M	7ε���S��*�1/�����?�)�,�8��ze�4O�&
�Ԓ�=#RD�FW����hn��FS����\�ΘN�e5��/΢(4�C����]�/� A�g��$/ ����?I�Qv���G�:|?���Ck��{J1b�f�n�r�ｑ~y #`t��ߪ��TS�~�bWpO�	�2�)��Զ~|@D�����BEH�A��+�#��wㅯ�{~y��us���csmf�]o.��l��k'�u\�{IESF��6��a"!qf�	�V'�Yس�^�˔�`=�^] Y�.�S5�^h�3�4���Z̈����MG��݃\	�ռX%�b������jC�_E�"����Y��r�0�خ``Fc�1�&�c&��h֯�N�Ң1�E�1�h�zsW��"#�1�����(]��U�AG���&�&�R� ׶�׺&L���Q���(��i0�a�hFu���`�z�$���m㣺�}��b<WJ���q#Ƴo�#r����P>�Y}���{�k��,2�g�f��!o�|Q_��YVC�^��)CȌ�<$�۴�י"�}�ʛ":��ޝ?����`'��#�R������c�~�	i_��ŝ2z�
Au(�%4�_�o[�^�j����a1�m5�~�����_�Qu�Ys!@+���x~|��~���X�It�+�P�m3��fU��X���I�	�����I����rXթkP��]8� *�!������i?eDkM i�W+;�L��,�$|�T�A���W��z[3��^����[�=Y�B���h���9XV�;�O}�=�>��u� bY���+��������(Fv`�_?ԇqy=��i�|�I23-4�:�iờA�bl\-�$��14�Vw�6�TC��v�������)C�P��R�i"�j�^ԏU?<ρ�vLr[�@p������QG�7y�T�,^]i�n���[�XS�ݍ�y!i�5��m�ORm_u����P+��Yq\��u�[V���!��H�>HX}�^N��c:�M3A��n��M�%{ ����V�ߞ5�=��i�}���i�㓄�����wP1��\q��    M=�ڽGv�֎VHSF"?u Vo~͸^<9��ڱ�qL:/�w�	�h�����A��i0�U0��ެ�O�4���<�����.�	�-qd3F7ڒ�����������]���w�$��y~y��5,����M<��ϯ�V��z�U:�?2�{b�
��·k�Qr��%��[i,4��Y=?YO(��:��IMc�����5|%��Dg_�w�Mʧ�`)�F�'�ʫo� ���n}�?�J� (�b�4]	�Ϻޯՙ$�RU6?4�����a�3�Zĸ��|j|%�� �Hs�*���������a��#k3l�����p����j>��&8�Y;6���m����;P�:z6s¤Q��¤��]+��K��$�������[5����)��5�����TILE�V�����B��?f��Z	���a��'Fv|���'����]ԙp� ���&~�71lg��1:�/�)P��k�Oc��/nlx4�c؛L
Sxc�ެ�sW&�> �З�27�7� ]��bQ����N��C���H=Ч��5�ʇ����d���Eu���B5Y���w��DQ�Zg9�椇bշ�Q�`ˬS�5�
��� ?y����2HN�����j���M]�=�]m�czⴁ�C=�P���9X���ӿ��RG<�)+qLM	�e�zy"Uu�_�Zg��G�Ȅ0�7S�ƸC���`��N��$�]�Cy�����zc�7b�զqwM �z[?�9p�)#B��H��$��м|��av�Ǽ$�:}�]͵7� �hs�Z��f�-f��ap:KDU�g��x��k����O��H�K�8��ql�T��m����9Z��z~Q��ja���:Od�����waG
�&��@��c�����Tט'�O��H*"/��}U���\�|�Z�0w�Hc� ��V$��õ�;��S��(����|	��������1�l����06�S8l�+�h��$��(�{ ']u(���]e2���hx�v�g��a$h[iN�]�z���3}��~�: �a� ����$� O��1�x�d��z0iu=�˯a����,Oe�-�W���e�J�j��@z�0bLDt\X���v��8�У|;W�u�i�]�\
@CHTM2��ПW�V�\)\n���A	����o��i�D����o G1����K�^loV�gѝ�.�fwF5�Ϣ�s�0
�A�E0x>�z���(A 1)�"�
T�>RL?I%h�1�R�-"�=�TyhŲ�T"�u=S���hV�j�g�՚ �In�b�H�]&�A����[��5�Pb�M|ۧO_i�l3�%���6�F�>�H������{s��%�l�`��<J���
��;9?#�Z&	%E�������k����ko�<M��w�4"\'���ֻO�]S�)4�����/fɱ���m[j>F�����[EZ���c�c�U��+�o�˫�ǝф	�r.�#C��0��3��GքN�ʯ�Y���f�G{U�of�o�4yg�5ɬ	NDHg�7���)O��c0������u躋�>IlJ"��n����Ԓ@�yc��Nк<<]�����MFH�e�=wUi�H�I3wt�\M>��Ջ�OjJI�'K��3�+��rKU�[:w���ÒRݶ��<���
+��ef�s�X��2��km=ɮ�>��Ջ�܈\Ց�����|=�`,d|s={�A����W��7��H*��_�"�W��;�V_�C�]��`~2�Q4���T�x����Ŭ�,�w0t�p�鹷�`�������b�)B��z���]�r&�GԬ�I�{c���1�����/�I�����4t���0��P����z��NU��d�i���
�����^����Iw�8�6�ƿ��n�� �aI���lK򑬎�C�!�5DSRE;�����u�`.h�7TV������wxќ���JO��A��7u>��ef��{�H���9�<������[#����R j�v:Ƙ�Vr� J}u���~S�|���J[�'�b�W��`���q���*�)c�T?�Nl�=��ۈ�8iPtd�wY�;�.�[�N���X�����7�5��/K�"�ӄx��b=]�_P�tP'Jiᱣq۽�K��9D��_�/�8���e��&��{Z��e��������`:y��CD1AϗB7+9�������FP�'�ɍ�}�5C��
Y^�B���+k�ʹ+��u��$o�� ����_)�S�:�I�״6��qsp����f�����dM1 ��Ũ͚*�u=mֆ��@���-���._�Wun���xx��H����8i����� Q���ge���h��A�	.�D��W�݇1�7Q��e����6��,�}�����>Ac�b����E���~ӵ-V�㱹��.'�����n��t|�]~:�׶����Ib�4�8�X�m� /��A�h��!Z\��Z+��PfU{#�C`�`�b��Qrg�@�ih&`��ʠ��A�3�����p�g}ťC�.5{�|{9G����v
ݭ���f��q2��۱������f��T�n ��5�*�h�K4)\�S�ܦZ���f6�>AK�F6�sɍgK�ϑ>��Q�����B�6bŷ�i�X�=��7�("�e����a��x701|���I��\�I��1�ݾ% �z]w�[���i�MN�I�#A
�)�?���{�^Y��Az�{�f;�2�1eN��]nV�R&�];ri�+ �M��<�1$e~�oy�V�SG��O��̭�RG�+�����0�+�f/ ���q}�� �y]�VK<Rq��D1��0����1�)�@C�ݡ�$�z{�HK�I�S�or P���.��/���qR��x�Jj�ד8ZC�?"C[����_���x�n.gU|�A��(�������7k~�^���a<. J)@��{�}�BL����,C]iC�K\J�X�\׳��w���x���u�E�HVCd�]���Vr��^�}�7�L&z�5���*E�ѺS���kj��}%��ھE�t���(6mJœc6C�?ȕ9/|Q�&!�_BlaX���������1���������N��MN�̰���1��=�z��[L
ɝM�qc!�Ӑn��%e��ߐ�Z�ٮf����U�%����Dt)a]���F����e�h�6}$(�Qmj������6)a�!���_ 'M�!���3Jb�B����um��+�_a��(���SX�œ���ɘX������@����Y�P_;3k֣��]�f�j��NT"~���VLĦ�}�%1�-�A��kj:@�t�bxO���
��+�jn9r�1�a��V(��hdD��2�=ݙ�>�WUM�䪋kɩ�pc���	����{Ut���ɷ��]��橮�5T=}���E��:���b|3/cp���T�Y��5o�8ߧ	�s=�F�@�����$�7Gc�O�oI����b��跼�u�鵝`f������.���43Û��2=n��bC�i��p������C��l�H��)G��{~��'^��w��X���?�I�2�X�ޙC��v��3��}�F��O�:mTWF�5uT��QMԦ՘�&��[���O����e`*�R�K�̈P��,�hv<W��R*] �h�!���'�˜`H�5�:�T�hD҇�ʙ����ӲZ��&e�<��E�S����b����N�B���K�cj^f�Jw���]8F�w�� I��f���_jwD`L:�f��vf��	�.o�%�K�;e)��٘^.h�D1A��_��%��@z8�Wù�*��l?�Iyjo7.ÑHu�� �LKS4�̴{�B<Cxl=Ѡe!�a�~»�� @��9o�81�/����/�5�!1�� ��Q�v+�D�'g�ƻ�fϫG��="�u���:�0fW��  h|(�?���>~=��"}�����d�[�<���b�6��D�U��-wj��F��E�n^��rs���𖋃<�i�{���z��=�F�1m��A��M.TV���*�syj��/�`8�8%����h65�9�_��¦k�у%2LM�Jq�����@?��Ty�M�����    ������rO�'�
.���Y$�W��00tt��"ߪs~�-���\fn�̢!��a�D� ��ޜځ�i���.�k.|q��M<&�2=T=����F�.W�h�9�����ѷ��<��vi	�#)���5M`Ԟ0��-fv�h}0,��^	��@P���e�S�DO��]��sW=
wOO0�4Jc�֔Xb]��p$���+E횇����.ܕ��G0�0���Le����w����������A��4��=�^^K�D���a��0�VEˊ(��ߊ�A2��(삆I��5�({1��;}���ܟt9ތx5�\��zə��ZV��+�w�d�-7'���'��C���<gO�l�8���!�S_�*!ibEiCt�h�'x�������V��='�v�j�jN��\
�<24�~W����.�&��@ؠZ~��K~Dh��������Ɨ���0,�\8I���7��@1��s�>��x��n�/�&�_��8-yȸ�BG¼�-��`H�8����4nn?����	��iW�:"2&��f�r7dL�?F���r�;���D�I�M�63u����Z�2nRi��.�0J�i$��׾}� 4��F��ߌ������,��A�����Ä���6?��%��t��;Eܫ�3��X�UۧA��$U�D�x��F6tT���f���ԦА��&>�#���*�o]y��R�0�6��Tdc}�G�T·KQ�("�Sr	LH�0u��?�}�A����lס���w�ʘ	_6J���p!�8�}V���}�?,�_�e����������Q_��� ������n�A������b�Ab(����L�O�� N�P"2f
kSb}L6��ibw+"���heE������������25!b���q�!���nT��5������(d�ۈ���>�����X�7�-.��5'�ebMbu�5��qx{��r��}�|U/�������fo����~B�>�M?��l��/����k��Z������xm�Hh���a�����e�_��4}T����m�3�Dw��L�ݖ�l@Xr��4�4]-f�E��1�0��q�C��V�.�'��˕�:��A��P?�i��C�סd�����}s��)(xZ��P}�_ַ�F��7�u#͂�Q6Z��j�z��r��'�a����I�P:Lq�Y�|�"P�2���^\� �+ǒ�R:L us<�����~EO��4
�@��@��a
Ԧ/~�FI�}Sg?������>��Ktn/�:�&�6-���l̫��u�&~)2I��ڎ1_r��W�E�Em%��0"C��]6�f�h�%[L~˒�	-������LKr"����qKN��,G6l-K���wZ�<e�l�y�p���~ZL�d��y��V����ؚ��}|�8&����v�:��C�P }��r���2�_��x�ܺ�)skp-��W� 0���b�V��>�wh�=��C�mQB���Ң_��B���i��X-���&��ޭ>gc@r����Cs�q����<��"�M�B���s�wjˇ(F��h}��d�k¢�s�95>�@Xf����w��  $h6���c�}Y�\y����n�*;��K ���e�:΀I�}>3�l��I�/KBD/A����&{�4I�}=]-���1g�Nga�Si�H���i�@��./V3������lˊЧ��m&4��Q��1�*o�����t,�o�V���%3D�gC�h��<��9�}��CĐ����K�?O:ϱ]x��C�ĈW�AO�!h9y���f���L��)�J[k�}&�$�I<f�{�	!� ��>D %��~�w�7���4���}�qj#�����ǇOߧ�JW֓���2�}3zֿ��}_���`���b�z��������n�"���MF��F�L��/Lj�5�����"�F����l��Gsve��}a@WD�$��c��������!�;��|�-Fs���F�������0��=������*�b)��ߝ�e7��b��M�e�͌.�zD�YjJ����ܔݬ1v�e�+�Ț�vgy��M\�nҨ�E_��!dh��&�t5���@O󙮻gك�Y���xb�̙l��d�ט���=�Ϟ�{�|��P�e�n�����3b3��e���"����(IC�S����$����l�&m�&�J{�.D䬏k��w=Du�2YNf��xcr�"��g��NB��+R�J뛝�Ѱ�x!�~��n�R��do�P�]b��F�=/����?�ef&6җ9��J���ݛڬqb�[*]A�x�!BI��a�o��˼U� ���Y�L�I�2!���L�"�T��P�,f���u��>v�v�_꿙2�)L,-G���l��<u�>�e�Y�Ǝ�v��6��QI���d�=F�ͤ3�0��/�<!�cz���V�CĐ���1O3�p�Ƴ���^��>C]^U�ER&g�u92Ea��?[�t��c�q�I+毥jy��o� 
4�k�f�5��RZ����l[���RL��P����k��W�{o7O���nsOX���ix5@i\=)��oWO
�p}����Ӹ|�b���no�yJXӿ��Nd��>�����M:0��	B����l<D�(ZN�'Q�ԧo�hah��ԯ7��= �X���X�{e��3L��f`2Z5�f�oU�F��)�h�a��^P-MA0���|1����ۙd6w.q���]x����i��bI��6�Ǟ�;������2�gx�Q�H���A��^Wֳۇ���&���8�0K)�=�H����-���	�f��j6������u(�h�W�)4>vb�X�]3�8�M�
�aJ�c��)%�����\�~|����.&��x���=\�U@{�6a<�ӗ�����8=�Es� ���X�<G��>�]��w*�>e�#tM�k�����?@���={��%���Z�����h|8�FƆ���.���(�X�6��N����_������c�){��2�yz�j(6b�yV����w�)�^��:�.�C����
�W��#��
�F]gm~p��LP��R�P�t�w�>[T/����ݪNK�eyCÏ�U��,c@Z3-m�OˍM���uZ.��	�T��!����w��������zJ��L�5�׏n��k�b>8���U������|��Э�����b;$8-���&Y���իS�vbƇʿg�5�)1�{6��� :�7��*�ٷ=�W�1}a��}��ڋ�O9��j�?$�Z?�C��dv{[���\_��u�$1�i�r���D�����Ot3~�?6|�p/�L���c'�;�S�����6w}��ӾۦA*��K���S�k�'��}t� ��0i՟&0���	��;�l'|�ߊ<?8r��8�!��}��2�Η���ؕ![>%^BRKr![�`h�q4Rku�M/��~r믞�\��	�Kg��>�A|��?����c�k�d�-1Ŏ����Һ�K�8�i�r������	���9W&��'��%L���Ч�t�Օ9����s���_�`@��{cְ��_�pq�=�����HW7���t5���/�9v��h�O
;pN�4�#G��V��}���]c�������(��j1fh�1Kн����{Q;��M�Y6�;5���c\�
��p���;�0E7��+.<x�5Fm�nc���W�`eLV����a~h24٫}tsY�СA��S��!	�I��a>�� ���q������b$��?�Ҧ�*Fĵd0�,64��~�nL*��d������Gq��!��5�8�\4ty�|�w=r�tib�$��W$��n����rl�/M/;ݑ�zb�D����"1�k��L������NCCXR��E����TyޞN)u�FמN����Ѐ#�^�VUh"5�2�?�b{�X\e��V����><n-���ee�_�h�}:/6�D5*�]OZS�̛p�]����>u�c6}�� ���
���s]��.�����РK�ĥ�̘���˘�������X��C�^���	����w�-V�ȸ�¹�    �Pl7�=�WT04���g�_ae�}����OU�z����T�ו�>$���JoF%� Vϫ�&E7���|�FR#Ӆak�T��1�M����S�l4�o���&�����}t�D�Fj�������5o����G�A��['��fǔ���������^������7I���`Aj����	��ú�;;Z��?ߞ'�:A#߾d���
;����r�wܔ̊Wh���>��K����+�-���E��p��,5�>dH������R4�!s]�,��a{�0����m�z\9�h���ňQ�p������X_2S�|��m������'�aK���<�n/(��E�/u��#�!��P'�k�+�=E����3��?@En������PW�6�K{`1��Dp�\��%GP��R0f�����0��0�./����О^�����۩m绗�W-��:�ځ���$�`���=�b��o�钟#>�ϑ=�*G������~٩vh�lQ�(���v8J�6^������ӷ5����e�����ܺ�H]���3}~h�%h����b���:A��"��!GL�S����(4�g���� L�Jo{��Yz`fe���^h*�н:\@��Gw��_������\�Tc�TM/lD%9�v��:����{�������=g�Br���9	�(Ф�����Wp{ܛ9�������r�͞��]v���<�q��0��=�Ԝɀ��Bv�����^v���Ə�h9^�\���&5,�Cɩ�0��T�y�;�bX(r�w@�<�Uccd&�޶º�n�\�
WQo2������\t�=C��G�I�y��1PkX�<��00��	L�Η"���B�U���u-/_At�>�Y��,�~�u�nm1�{���~|m��������� w�;���ҽ'�{&�%��D�wW܃8��*׿C�6����5���lp&qZSQٸ�5��w9���/}��fn,�Gќ�ĎcXcs~�^������0f,�&�+^Y/ 4��@b�Ej:�B�Lo���np����F��x-�ϓ���
��*~�P��|1��;4�}W-�>�F@���%���&���p�������*���HX��^$���+MG@J4��G��|i�A�����K�����2��;� ��.=��j�-n=������4�p����L�a������97ʷ�	���O�=��՗/�W�A�IЍ��]��]�(��BV���E�����&պN�W�4�&���6��>����y[�����&�Ƴq��<�	m���ӕ	������S��q��� �K����V����vʋ�TA�,w�sM,���f�82]m�s�����i��xIei�"�&A&q�V��."G��\������C>)	�}O��D�v!%�� �5u���&�e/��y��]5�&��a�7��'�2�5������=E�@�_��X�\2a�^��%+ﲆ��f������吟U�Pl��:w��0x��9���:�1,�_��0�ĺ�Yo��M���ݟL��͙��ͮY��CB��rڵ�7i/:�Ll�Lj���0_B���I�Z�LVN	|ů�}�t�/�wJ��	"�z�l�Z���ʆ4zG��n9�#Z{9�
`j�a�y�T����^���<�sb��`��4�b+�@�ԭJ~Σ�:��6W�dV����k]�$I)���f�=_4��U���)����iv0>ĕW{�
���Oj�~�k������>2���!ڰ:i&�ϢD�ǭ:lN�s~P����ew���oV�nQ�Z���P;I	1%M4{��M�����6Z��E����"�t>�KJ��
�hq���~�ۯ�:�m�ï"!�m�_��h;	�]]
�?wi���3�'4q��ww�=��	"E�*�GN��>ֱ�?N��*m-YB�n�-6*��mw�������*٬L����81 S���
�f.5�)�4��X�Iv�IR�m�c��G�Y3���"�����y����L����)���D'�2�C�)?w[���*3���4�q�e�{(��r���hy���E6O_��X��,T�7��A)���B�m��l|k�����R%��m
YJ8)�-0��F�3�� aLb�i��}�,�]|�]+2��^�1xQ�l\�9���
p)|��mt��Ε���o_�@	n��,�kH��KB�X�[u>���#��7����D�\�5oM�C�jL�S.�F��GG����n�X�"�uw{}�":I��\����G�Uͭײ��3���!�'�˷W����Vr늦[��i	��I�~X�VD�wo1)ƣ�ŲV�R�����9D�Ptr(G��;[+߽KM�n�������;	�Y`,���+,[:&K@&�޲\��](�i���D�����3�^���]��11�þ��0+'�ؑ
E�1�Qf(%��n�E˕q�ucY�o��D��a���F�Dݍ�����LL]����!��dٔPWY�e��E��G;Q\(}&��C������Z4��0�Ĕ����e/_UqeO�+��biO@��Ǌib]�;����޽�@�1����̏HULS�*���Zg?�"6�L�X�q�C\�B0�.�W8�vjz����a'<��VƔ�n���w
�$r�E�[3�*�@[�g79�6��|MB�O�I�]��>����ęWA��4��!䴟�!�Q���x��Y`6��֤���[	"����ު���Pg/��=u��r�|v)d�D
�0W�X[����{mI>M٧l9(����n��s���L$��,�����Z���u�k18�Z��*ڼX=�h�4��S؟x��)\����?<�-���#�&�^�K���߿���d&��Ӡ:��N��5(�	z��jn[�x%az�J�Z(����.5�$�q��`��F1�L4����y��1�R�r9�q,���|6��,&n^��9MK;��!w	G]O��GK��|,Y�mU��/Y��V�+��_gx �ߜ�֠��^�B��YsV�Or�L��c'd�F�������IzJJB��5�W�F����Rʯk@j���w�/̛+����X)÷�77}O78�0Z�}�Q �������7���ॽ���C��{�W�}�!ϲe��{�Ib��븱&)�	=�C����|;���6���U�FKоIgX�;��^��/Aw�����|D7��͸�q���|��� �oV���K��\'��l�çO�pU��4�\^X���PCSU���-'�y��~�¼�i�rY��@���Kݧ��Ndp��J��|U�6�͈�������嚽�?�����C]4�����P�fl$�wg-��;���9�c��yn�7�/���э��n�R���:#���"��x��<��?[f����]aa����Ki��g�
�~�/*o4�nu,�Tў�攸�-V�g��{��$��8E���|����l|.�u�A�c�w��1q- =L� E�En$ȍѩ�����$�>���tbeTYp߿����x���q��C��S6[=N�ճS.���3���Լ%`�ِ"��ȏ}98,S{����c�%�}��&�Ҙ��`ڛ188�t�wy�+0x��M ����Uf̈�8x�.�=�%��C��ڙ~�Z�Ŧ�k���P���kf�����0����݅-��;!O2KԈ�xD������E_ݩ:@���;2'�Im�gKC����-H_��� ��]���z=���Rg`�j�4T�-ze �ObX��GO������y1�E`��R����U �o�58�-K��n�����[Ҏ�M�Ƅ������ǎ�/���O�_r���Mf�ՇC����o� ����߿w^�� L���Ļ(۟�=e���a���1�'$q�Z�1�Zd�̳�`%|��K3�)mzLRq��izw�!�d��}�N�=�a�cep�&��Q�R��-��'|M���{��23�N�g��$9�Z����'Lm��A���0��F�I���"�t����D�|1xmM�[�)�W��p�>��k��y    :���)������}:&C��_����GH�]�o�N���w������m��z"&�n<-&Q�}�h�R�a�$�OYWʄ�;q��;Y����N�ZQo-��ƍ9}`�+	�����W�`��� e�Ȑ�V ����Ow��q�q�]���+Z��r<�����feDR_!I�'&&�h���SC8���e��MWw��uF��eq��ZuM��)�t-���|9�>On��M��++��P^���&`�����mp�����)�_��C���A(��AM� �V�V�<��!(�r��y_�$���l5��&#Tbw۾�Pӊ���S(�>�
��a�����K���falt�`�f����!��"�a�a��_C381ew�Z�`������n��op���#��l5�t��χo�`��c'hm�#�;vT�F@7���0O�/,���<i\�.r|���B�\����k�q�IO�J���3�O^o����K�l����w��u}�����6yC���38�ZL���;ۨ�����������ZS;��ޞS��a���5�����u3��>�Wn쇽_ �غƦ^��,y�^��������l-�����1տAI9�ӵ��v����(�����A(Q�8~���^L�5�9�Լ'�<�f�I�+�,�e������Z��7�����̦J2xo��i���7ҷ6�͐���Q���&�{:7j��Jh��`ش:��6��&��L�.�5z�9z���]��_��k��O�G�N?��	��nӹ϶���)�־�փ&���V�D���������MB<w��
�<�uBR,�0�7a��=f]�>g�n�\�r����cfM �q���%1��.������������o���K4����=Mf�)L�������֪'	?��_��ż]̘��_��;�f1�� %����^�< �ѳ�^�}�<��*?��3�z~�я���n&XU�74"���1f�[�ki�O�t4֘���������q�FNP���qh�\V$���U����s{vό��_�e��]�W����ͲϓV��1-�&�
ne�`wPul���p���j�;��l�<w��WO���;cLO.�-�~	�����sv�e5���=6�LKڈ;ˮk�G��)���x4nV3��sE�4�7���&%u���k�Ώ~ ��e��ރ¹s�b��%g���c��7����G��Ə�Y�I� �����Ș��?a��Jg��ᯮ@��㮦w�b�qʡ�>�	�.����KO�D7��,���ٗ��c�m�A�a�Kۭ��C��&1�/���=��h����q��L�̙��Wy�h y�
�w�u?M��/�VCχ�}\[�c� �؍�$����	|'_rx���ٽF�Ei��'D@���\^]j�c3���?��8�hjbgZvk�p8bO��n:�_6)�"HU>�jj��LL�^��ˍ�e!�Ʒ��*5�����F��bnޒ���|'kx0��|���dZ�&���
@/cfڷ���ui������륈�T��_��I�mw���,y�bػ1�wK�{������5z��W��3dc&�8"��ӗ�V�9�*x��#(�e��e���G������3��5N��P��G�-���Dv|�(d<� �DT� �T�-z�1�'��5]K��½1�7�ŦpH���4�����.^��[���vk�o|%��[k�k�d�w��C��l7��(Y�V���cb�����
��ɶ�C�������A�m�zĹ��1������J:��KЍ:]^�h��Ч��I����	�-[�4<;a7���p�/E�s(`Z���������~�Ҹ���Z�5���chrګ|�d�1c {�\r��O����Y��0��]��R����<���l��v��CN@\ V|��Q���z8$�n|��۴��Dдi OfzБ�3{�|�0<%�>WC�[�08Y��]��t<����j�-]��'5�'�j����_2<�p�j��������F��.��Cv�p@AF`�>F��9W��q�
�Y�Q�G���=�V�ѝ@r)�to;�l�|//a����P��s�S���K\�{���_���2�e��D�Jz���Q���6�^�_
2��+gxjsz�N�#��ztZ����TA�Fj��o�y�!��-���V�ԭ�}��m}x���V���+��� �����M�`5@�I����/:T��\��|
u3Lj.G|����gP�Q��_t3R����jѢ��N0�`K'''���~fp����;6[�R�k��>a?��:D��|xbt�9��o~���tR1�'��;�{�qňiJA�t�����>{���19\N������Zf �a��`��4���Q���#�q�?E^W2��2�L(c\A���*A���=�C��c�H��~���p�<����lBN�K��8b�g�����3&���G�� dhz�c=l�����G��|k=���ο���Ǩk���8�-���跼ثC�Y�f���t�:ʇ���:.P�����l{��Q���n���N���@�Ȗ1W� ��AK��L�z0����"�Н_�[�*邦�N�匿���sb���@��:� ���r36n�������C�:�:��[G�`.X\��9��+�i����ֈ���6�9�����y���/\��M�&�Wi�㗠I���0n�����%<��36F&��i�9<�trܪ"G��h��/+G���N�� ���B����P�}g�4�� d��^�1m���	p�C����_�]��6����M�Qd22K���1`��l�y����C����.����9�e�~S�]:BaaB�),d��dY�n_ԏ|�p�f����q��h^����V!2���N��$�֔W�1�u:�
C���e-�S�#�]�w��SK����;_J�;zDw���������,�8vTJIj:G��vԸJ8%��`f��4�2A�(�[,�q7Qf��im�9�	��g�ݮ��da����.'h9y^iXG��6m��W6mXJ��3 �ObZ�t�����`�d��E����@��1���G��9?FYg�i�R��*p����4(���cXi�
I�������F��ۉ>�`����]6 ��m���<��_�u}칭K��$Y�.��ʫ�8 ��K���ҟ���&J�����_�ؒe�l���	! >ݯ�ӯ�h�9�Eϳ����S��b١twsI �I���w��F��	�pk_���H����{���/!����~����e�@J�w�� s��=&��n�/��i5��W�81���i?虶P<���U�k�5V����?�eτ $AO�s�Gwj��U�	X����i�{<� +�Z��CI��_갎�u��M�.ߋ�^�i�sY�[~:p����F�S�K�����A��ƺ�z���,���x������>l9�b�4�?a8H'(���#;�����r��9�&lzp����r����6�ώ�G�9E���z���R�^Ϊ��J y�4q�=�3�Ѷ���oz�6sd�����LOc�B��r���c!ͳ���}dt9�ټ��h�9t{�m��2;1�I{>�-�{nZ��B�~5f
f���7($@`t~�����%�ԩ��{�e�F��h��r3�����/mW1��b0�<(�[T��AֿެD7{Oo�3t@�/���ҍU������	|1Z�b�^��5�A�<}�6�JsvAqS�8��8��N�P໑�������C�ƌ0|hi鿐���儦�Q)������5�凁���;��F��˺��/$�?�t�B��R�ѱ���c�V��gܬπ�D�Eg�q����W6p�H����f���{��E��慮&����٭!���T{��u8�fa,���l��f�6>�\7ů#�Y�o�K�c�]3��B��Z���r�	Y����#��5�f!̭���@:�0�?E[��#���X��    ��pl��F�ׄ��4u�{�i�}ڭ���V��� �������iT��K*��r��}+K�>v)i?�4%��5HӔ�?	����_#��Y�K4N���BF�Mݴ&��Ktw�k޴�A��;���� r�%�����o/� �QS���+zȾ�"]�eG!���1�����WRl�����Y����X�>i �O��d6����p0M�YM���#���E�?��3��?7�����w�$�#Ȧ�|������<e����j��N"}B,��"��@"r��|ϔwЈr}��K�1�>�J?�">��?ŉ�,���P �^!d�=bI�T'ƥq�`	�:U��!���k�:~kuSܬ�5�q�����k��@@��5����M�a㉼	���- ��&(^seCA[G��B���)�4y�������R�-��9���^��H�H�x8��գ~]�[��pS��F�1��P�udP?qU?�{�=h )�Fپm�n?��=���j>����
tCA0A�K�Uk�L3����H���%���mDSy��Ѳ��v����c�BrSX`+O��>�����W��k	t(�28���h���Ƿ�c5���T2A���ѺE|SH�ͷ�}�d����QS��\�i1��O�k�O( ��w�Z�hg�����OX9������|�t�˶h�ᚯ3�0�n�S0��!�&9!��@d����gSHvx������NĹ#��ԗw `����t����]��l���N���4�񲽜����K��iS�m]K�5����V�	��$�5�,y�:D)�v��h���{��]{�c������6]Nu:�pOg��Lx�u�������y�z�&St9�Øw|PE��8e�;ꙸnC�����ݵf����=����o^�`�&�;��q�T7�Gz���Z6�HK�6��C,"E)ܿ����s��­l��s�C�O
��j��W��	l�'�������\��N�
��� �����w
�xW�]"ߌ�L��u�h���]�o�vac�%��&��ǒ\ű��nxJ���_��WRx�	JJ�"�h8����[�TA�Hѽ�c�s�?�q�K&�48�8nt��N~Ҥ�F.Uq�xۅ�ł�IM�е�����t$4H����|���;��NC�#j��ͱ",%7�>�p]}��e�h24ʋ��e���&T`�
9�@�8��)�
@�/�a�^�"Z����G�ʸsau;���׃�?h(Z_u�}*��h������H��Ro�.��t�Z)�>6"��?��a�h�{��ƻ/G�i2��&���11�2��4'�,���b���}k
��	�[�д4ap�$��E( b4�w�&�n�E�=fS{��kC<�C9���`L*���� 	��uI���Q�:Q�p�=)*����r�_ϭ�����5a|��a�x��WnM��ҕ�,E������ ��g}$gQ%i�.8³,g���]pD���)i:�	Zw����Y|y����J��M#�>�ݡè�&�syy)�&��
��cy�NX7� ���d��<rU��XW���bT�.�r��h���I�]���%����0���22�$"�A��A��"*}�aCGR��w�t��&�����o�j����c���q�h�9��û��׶���fB��V=��!�L�Kn�
\v�re���L����E�͸W_o\���=�C��W�+3^�˟yg����J�KBN�P�q����	�S��_ꜣO���S���t7���i��}�I����^���cI˴�c3m���2���oR*�~�a#���u��L6�e= �0L�r�͝�}���S�q��&ZIn��$�7(���dFH�n�����R4L������q�O��5������%�w�8�����J0{(Y��[gFܲ(�8DJ����ن�FC�?ʋj���[�����@��}�bE[��Nsho췑�}w-�~�a���sL5��z9t��e�7d�$և��+�M�P �"���wH��Q'���p'1k�^SɁ����̼� J�SyHji�����k��8��%+w�i�݂4�F��7\U�,����Ϊ+�62ai|�k�D��I��!��سw�TuhK,7�w� S�A	�܊QJ� op����Y�O�%Z¿;�*��S�Nh9�=��R��u	`��Kq	(��W����E~V0����.-a�7��!,�E�o�sB�45��A��W{3��{�D���[�����Y#�k�3p ���!t�,�>�r^n�jSO��������]������t����O�x�s7?�}4��O�D��Źۘ0�}�f��	+g4�
�Q܄�F���?y_�٣^�,t����k���W�f!�G�r���s����Su$����i\ɫ�uEz=^^�Y����a~y�z��ɞ ��(-����(�l�vΗ�j��m/�Sk$i�M���`���w�|��,_R���]��#�͟�q�M������!dR�����)���1S�������h0�8�5��prګ|�.����Nc�8B�n?�͛6_�V�P  
�h��*�ق$vU�mA����O���t�����t���o��rw��W4�[��$f5�8��2��w���=�W�'#��.�n��c(�M���\��ID��������1z�>�]*��	��QCc���^
��CHL0i�����1[�t�o���ɭ�wwǄ���H���ltw! I�x�����e�ߧ�9�v
�"_�_f��c��9�	�9��a���+��P�|+����Os��^�J�U+VB�wśQ��x�ɘ�֡I�"5p Z��k4;{�S�A������S�BS��pmM-���\ ��6��E�Uq�1�� �v�2�['�S�t�ؓ�9p�.��/<���[cjN0�U���~
��*���i҃*,�}��U��7�2���)V��ѳ*�ئ�:kPoG"f�N`7�6VUQ����Dg�(bt{9���~I�5���%u�c_	u��:�k���We�/�$���N��v<���w�����	�ə���ǒr��ӹK�7���06�YĬ�!"��b���:E���6ߵ�4��c"�Cn�"/+�K���۷7�G�-��%��/���i������_yt�n৳�W��򶬔�Kv\.R��W4��G_�)�8�A�{ʤu����w�*�gz��<��U��Q�Ŧ���
��.�ݱ�E��� ����<mv�^Ew����
Ho�2_��߾������4CT�N�����lM�9��)�'��uJ���tw[�3]�r���93�a�4@�u���r����v�=�����J�/w@��<����e�Um��׀r�bjr�����j�1��r���L��1�����Kb��8N*��64f�����ǀ0Aw
ޕ�g���wy-0�-́Cz��G�CQ���h9��|)�	7/2�NX�`W��pd��Ś�N"~V85�<��k�y��cG�ܔ��Evk% ����i��oj��#<4	�A)�T]v �� �q����t�=o'�n��Ķ2��&.��PV:��{�QCU�����neв���oI(���-jN����$�J�����Z��n\h�[c�w:6d1������N zڋ��)c��� )R�8�1�$u�/�^vv���3�$�܁���3�}?�s�x���_.�(;��UY���Vl��f�<�[�T�j?��kL�1��K�},D���LQv�5�:ݿkL�ג�_�r�&��L�6o�2q���/a���[�#ɛ�$5��J��Wt��@�b?w�{�Byl�,۴Pb���>�ݨ�K��ȣ�\ח�Q��Q�hׯp(���Il��D�JI��AI@hJ�|��·�M~�ս��r�[�{��q[8p����x��ݡ%���RE9M��Z����2�b=�m��)�����/O�0�J��aH�&C*�˝@�szU��[+�E����o;�2�I5�%}�C��l�uS���y<]֗�w�ͬM�/�G����3�6|������`,u�@r�z��    �m�P��/�`9~�_ĞX���W��xA�������~ٶ�iĸ��>C,�����"Ac��R��|=��*�^�i�(��&��%nF�����P�~ˋnw.���︈��;?~��vm{�M�9. ���5/�L!a�(|[ I-'_�i,�=�VC�S"�kp��v�m�h���z{CQZ.��7�{��?�i��End6�բ���f�~�����2�/�w�8bk�Сa��
>�,�.@��4_����E]/^~�(o>������.���;��I�8Hq��Ľ��CF���������@21��5�޸���l=�X凃�v����ɟ?_����z�a30}MZ~+W[�b��x������/��I����&��"�vt3\;�^G`tJ��U�ns����Ϻj_N����98��K�� e)<F0�B�M3��<��Ɂ���0bX?��&���
ڒ���1p�Y��o�ڪ�W��_J�s)�����/,R�0-��I6�,�03�Ɛ3�����$���vddAIf\���K�`7���i	0؈-i0�����u2���վ��P��q[cr����ಭkH�F������tbx���~j<�Rf���,ٍKI��%�h\���J/�}ە
(���]K;ڠn��r;����g�������������?��Qn}�S vS�Q\�Ԛ�3�l&f�!���5���=@R����1ESU����]�ġ����~��)��T��+��{�z����W�([��W���Ӫas��cX]lq=g}�Q����X��"�W�do;6,�z���������! ���e�eOB�g��xlͩ��U�ߖ]d J4��p�����z��yB��P�z�z�n����*w塰��u�����BiX9D�k��G��E�L�j�@�!��gQ�P&�ac��#��=Rȑ��=�fHDq&@�;��KiDނblbj�����G��Σ'��ZZsM�!�����5i���s�08�\��:��׶<��uo9Ɯ�AW/��J�ۋop��AY����4{t6�̰��]�̻˘��M�k���t3���%��!��t�#��Cg�'�)����G��_�WGK�'�H?VK�R�Ds�cr=8섓ި�f��+��F��d�f�����܄�O�U_�����R��@aS���`�'�����{�����X�?����}��6Ʋ%��:�?�ƅnu[\&��z�f��=AZ�����AS��v�3Z���[�gDf����~�jX�o|�z�"EY�񻜢�t<lt��T�ܜ��'��F-�Y��G���	�"��Y.��-Ͳ�Oғ�I��� ��f%v���O��)�Q�q����>BO��xzS�@����y��!��,�5��c��å8�-�&�?��2ꂸ%ፙi7��#ǭK�g���v�\}LZ�1�`-��VBQ�	t�U�v_l�/r;1tW���F��;Ibp�I�����^�6�-����i:ج�DV��ʷo���Г1��OE������bcZƖ��t{X�U{�7V�G�/��O��`��o������Of�g�7�����=��X���Im۱X�d���~Jf'�1�c?���Ï�6G�6�חo	�/��k��l�?��H&��k_8~Q�!��8�īw(	n�!S�Yց�w�c����@����8�U����np(2t9�|��ܫ:/��3��v�t[e�#�n���g�[GK�.�V��4U�ą���4w��8��6�W}����mS`X�i4O��#�=\h��DO`����6��������[���~=�;A�1`>|��WF���bS�J���@L�O��m8�q�D�NYwT���w��WEY�C��`��ƍ�9�VVɝc��WL���;L���-:�G?w-�?�����&ծ�O��������}���f�1�f̓z+�d����³�y��e��������iL��H��m��?�ALѧ�q��;�?�M��	f��)p�\
 9������.ҥ�Z�7����9�_۫����J�(��X����u���˥���y�Ɵ&���|V�:�=�����:+���'�Xw(཭��u�~�sg^�c��)�:��t�M^H�Bi�Ҷlj�0���M^̹1Be"���'�Ʋ%Aͫ��@cF�����}G5�n�^㤡�}�o���*.�5L^��q��NJe��'1��w>��ʇ�|�o���^��R���ޞX�t��ԝq˭/���k8�y�6�����qF��}O�D�_�&���w�T���������d3���\Q����c����O{Q��4�7 �6�����ch��a�zs9���+z��d�2�Η�E��"�/�%ZQh�*RH|����B6[f��p��-��g�^����
�t��Gǭ��6
�7�x��	4�ӱ^�!L�)+ÍH,���а�zv;e&O�H?��r2�'�ha�����׬G0�����JK���8J���vjzm��9�Ur]ZINҘ^Kr>>zf[r=��j�y�W��iJ,1;P���:M)H�t?���eeE�-#ēQkd����	]hLhB����p�E���������E�`�4���x�_��AEGH�*����>�`��}̈́��6��W���)��b�~+����������Qv���+7�h1��x����������P~|8��3�S�E�y��3�0��>{�nJɄ�7f�T�V2!kcf*���Р��:6|����_�7u��Lg�Kr%���@
��7K\�L�ŗ���E�a!��'�"jh�I����Y����_�K}�-V�n���W�Dr�I��j����ÃPwr�Kq���]������.o�����u�����cbK��;1ζ��0�6�'���IR�p9,�_yU��g������&���	m�^K�����ϿE�͟*���N$�@�vje�XcWK�C��	������@��
K)�=���0��uhإ�N��Ѝy���w��8y�i>����(ׅ�w�~l��%�o�-��}=����� �=\N�����y����t[L�y ��߰?��6�����s�dyS���|�*"ƺ�����4��+*����g�0;����P��_��,��v.Sn?��2H��K���2&��溥�U��Ǉ��/�!�����}Ex��9�5_�1����t���/�2���ף~NFc����chTx��-�.m�S��F���JكK344a{����.��$�E<#�#�\}�uB���!�~:m#[a�	��ؑ�������ih�Fɽ��/H�A��U�ʉ3]�Ff�ߠrx��=չ��6}<�?1���;,}��/3À�
[���i2��"�{�x*�LKb�Ȁ�;=@���n�.{�iK��T�p 昶�NRRPH`���hA�m���lț�����1�4�J�6BpX���ki60�Ҹ2y��0�7&���8&1g�I�V���a�<4�0�n���Ӷ�Og����Y�rM
t;_�g�����&���b�s��(�mM�_���%h���r�����p��ʈ��P���I������H~Σɺ�Kb����)�N�����7��� �nĤ���0z�f��%��F0��K4lmC� �h�o�g��s���f5�(��۝�S�&n4Cj�{�˹���j�z���x6���8{�T�:�ǲ�4���sh��~$Z�T��:�%����%��&�����O��LS]���k��/�:�2.�����if�l�J꫑�4-߆D�l7�ooݐ�N��������Ak�U�P��2j�K�!:��E#V-o�0��W�*��s��@p:���qW�@����1���=�����woVw۶7k�w��A�������A�s:���e�`5ru}}+����Wp���d�%f]��Gd�:�T%bw]Ё@��MD�v�%��&�� ŉ�č�f�}0c苆�t� Z����P[���o��(��;��'�� g�2t[�4i��׹?�8�/V�����^����+�+��G��]���� {�V�i#�)��*    �S�4H,Zl~nvy+Ԋ�s�+7;�9l�y.�֞��A�'H3Zv����gT�).D�7X���Ǉ!���pV��7���P���H�IL}��0��T�Ĵ�(���iX8bd��Ѫ0a��U$f���MK���>�5��:H,�	&R����3�w2)'����7�u! H�h�GK�]]&�?����9&��pٝ�� 2H�,r��I��O��9�7��Dz6-��oG6Y�d$��Io�� �L�Y���	�/U�SR�� �D1�,-�hא�q�C@��N�o�z���?�-��I*͟�Z(A-+�G�� !o�m�V���?�y����FTQ�m� Aԭ��m��&�����jM�ִU��Z�){�	�k�{��k�]��z7Vnl�R��&�;�"�B�*ů�����yS�R�:�b�Q!���`.��h�?_ծy��-$c����^�� �#6����h�=Dǜ�i:�a�ћ2H!�D7(`����O�l:Y�����KlZ[�r]�nPB�0A��|�:��Qw�;NoD݅y�S��*^ԩ�Zaƅ��B���<���yB��i$��k
|��M��&�z��O�S�O����rc��N�� ��eBVt�ߓ5���nb��9a����sBx�
��W��W��hZ3/6�m��?�Ȧ�7,�I_� a�������@�הě�����eb�<^�0�<��AQ�����z��x��G�p��c�(��x�%��^���sۦۀpB�߳�IS��+��o��oDs����U�JO��a4�J�-\�h����A�,��pD����d1�#C�|y��Hc���5��ap��A����*;՟��$)��Nz�Q�ݫ�A��Z��u���Xtm#,_	��YOa� ad��>�������헓W6�U,�R�qy��m�y��m����9}���������	E��E�ZN��d��%��7H^!^`��7��k�T@T�;�$�8iA�5�Km�t���\e�(�#�&�W�3����\3{X�pɜkf���%�G�����"�)��K��=�f b���A$h�h�y������UQc|�|Ӳ ɗ9����HҦ2/)�N�Ժ����3&�w!w���`_���'������X-�������uWl��y���'����#�8�����o��T��8%�;���]$z�^~}UQ���w��C��am�d"�O�����B�[��r�=o�����~�S3�y-��3C$t�X�/f4�Jұ�{��4	6kx0܋��&�XȀ��~v���i�{|��4�����+F%���Ĵu�S��&�s~���L�6�-	��qsyق�h����&���`��H�D���¸��'N!��YM1��%�Y]z
�U�q�RЧ�q����h8�Q4���A�� 1aP$�.]��.����m��5�1Aw0ͼGx7r��	'��S��&T'��[�3@�RX0�3X\,�m���{�Ű�~ʘ7�b���n��1���Wp��MN��闸��7�z���&R3���ei�\�,�h-]c̏�y�^�'u�����Eu��&E�;��%<�s}j��K��n��_i�aO�z�ϭ�4���DGi�cҰ�}�z�!��"��|=lU^\v��N1��P0%Fd'�81�9VzҜȼ��v�(b�u����Q��QO3!HI}�u$��8@��2�rv��f �L�%�0�H�����Q�����$a3T�N��̆)�I�H�7�@HS<l�n�]��_�*��u>y5y����� ����k�Ͱ?�ڨ��G���=�#ď����I��J<{|	qφ#R �FQrqb���{U1�p7O�U���> |�m�J�[Ka
j_�6�:�X҈"�Wg��(��P���P���i6�Fs��+�A�OM</�j0a,���/�����Z�}l����-����7���O7$�5$^��>��f~;_T�f��g,u���V�`�;Yq� sRE���A�W� ��R��a�Z�G�	�hz������4uMs#f���ŕ@�i��4&��$m޻" �	���۫~�o&Ss)��}�0�0g�ƜV�`9��i�;����<þ�A��0�b֘�4��3BKG�~k�f�x=������F7rm^����y���u�/��j��2����g�g��guK[���)��/UD�|���֞r���?���^��ļ��]�VZ�{��#��<���+KL⴦�Pћ�?<�X��H���n�??z�I^M�ͅa�`W%�3����B�[�1C7@�\=�\Q#{佧fH�+y��RQ�4ڬ�h� ܩ�3�m�Y�`˦"A�~>7�c����R.-c�7�7�/�r��%�/�ظa��D3A;c�q�t<��_�l?���j�n��;�cC߇��x�{�+E�5��g,�������Ԓ/]U�x9Zy�E������!��z��!�w���1�������~�sX�,���M�h� 	�=4��G1�k�������Q����������6龓B
�ig�^O
�w!Sݖ�����g���L+O`���f� 7����%LA��S~tu$��Kf���#����߫g�����y4����N�g�q��`RD�{^Z� �-�6Vlyܬ@k�Mo�3��RC8�2�RC���4A�o��n��BUg����S�<7�e�qs@�%lzO!(I���@���q=��_y��������+�/=���G���Y�
fб/��ܪI9Hq�_��d&�-&���hw���@��s�./O=�~m�ufb�q�H�r�?N;k6��ysr��@�${~�;T�Iq�)�5���y�G� �SX~�D$�Y-��,���/�0�<�˒��4B9b  ������P����OO��]썢D����i�N9�� �j��sQ�M4��\`�K%l�8k�lө���u���)�x��W:���!�t$����~%%�D���XO�	l~����X�l~��\�`�c$���<�("s����jq;1��;���3ƿߠ�{����3)�"���W��y�~c؄�G��΃Ί	&�\Ɗv� *W�
R�|?ޜX:���
�iOs<=Gl~ B_b�a�,������$���Xv��㠃  �K��_���u�2�P��کL���5��a6?1P������m|z�G�?�B�Sf�}��&�;pV2Yo����O����������g���%[{s4q�?J���'�m|�`j��x]w�>� J�i:�p̆��n�x����D��������]W7�U�����8Va�CB:� BJVO�/�?�P51�����"�kn6*oXH�bM�\ϧA����}q�4���F���KrR=~ë9{8?���-�?�����[��D�%��:���;}������SF���Q�WY�{��VA&CD�?~jj����O�)5F�*�y[�P�y���P�+�P��K�s(�V�s'ʸ2��[儦�F��:�%,�9�>Cg�g�w#�>d�j�G�ߍp�uN<ɩ0�]R��h_g�r0�
��0���7�XrD�������R��n�(o��u'�壗��3:=F���8;<�����\p[j�l���ٔ����c�8=��!���s���"�I��Q&���J �a�9ڜF<�)	Ȋ٭h/�'d��?��N���)lbƇެk�,��J���$@9��N��rp����-�C�ĥ���tTX � V<��;�S�l	��"���5���?���5��a�4�Ø����6��Ĩ=�Xi��O�WX�in��WD���~�Irwz�S�4�O�R&�`Z1��	Y:�CO�����_M��9�ǕY2W�sJ�|;_/z�>��%S�^���lz,��p�v�_��.�{��/�%�Y� �M^u�Y0'�J��q��2ٮ��&Aڰ���W�m�RU,Lehu�r��{�(�1Y�?xf���T���_N6�ɧ�;8Y�52��:�9�I�ȁN�	�x��ح�ڑ�e��Ȧ�,C���7��W�_�>?}}<�.i1�JN
wI���f?!Bz~ r�<!�&���3[��:X' d��v��d�`���0    �Ũ�4*eV�P�r��O�x	�+(�yB���?0�?x�f^~W�N�vr��̋��^"�9)�E�v"ee��+7tH�s�����uBkD�S��懞"����g�U�z޸6��W���[,S�D����J4Վ��Sw�&���<�lY����|��&
ɛͅ����)�`�18��h�u�l��GP9��P�r�G�ï��/ph�[��6nb���bm��8��W�ӟ`>?�()?�������$������]̸���j�ظ�gXN�f�|�*V�|`�������/���l2��*o~�I����C����"'ۗ��}'4m���z
e�Aw��M�僇y'��7����	�'�1d�c(�V�<��]>�	9�����H�[�wU31���U�M�SfR�Z���Jr����#�\�wy�r�u���{�]Ȼ �&�c�B�|�t�����󯤩	���]���'pB~��Ӥ��E8�&��&?F�|wu��z(�-UN�ZE�1'��QL�����)B	�+Q��|�'��J���D�!�Q��I#<��x��<���!���
A�"O3E�2kP��	��d~R�c�#`�����iH������,�2��[��F�'/��"C����=�ے����%i��dh]>z���%������e^b�Z�6;^�6E���^�3DP����L�|���|$�6�OuE򡠗���d��/�}�z�Ӥ�3BŴ�Ӥq��g����@��$�?�	���el�޳~���������޽=ib� �J�]�^F
Z�%����&d���:�lt=C5���O��q5j�)�RvU�`�B19/a��$3�����˗ޅb��N�3��`3�@�i�A���θ�����6ۈ��p�V=�f�7h�=�����A���ں3�J��%`����wy	���Խ���c�;=}�J��2�Zv���$�e[v���-�M��;Nʯ wf�t���Θ{��"A�y���[$'Gs�IA�^��ӗ�Q�9��|d���&�4wF ����X�������d���o�IIN��V2�u8-mN# �t�B��`�h@�{O(�?������"���y�Y�\A���?��\,�T�����Dv�3��=�2M�^dI�.'.�a3���U=�\� ���Ҙ��)c�.J�B~+�鶲i���ڻ�������O��Mm�O2�T��$��M���A89tw��z�E�^�(;��� �v��h�w����p���B�N��~`��C ѬK����!{�����[ӝXrAZ�I<r[�|9ٝ�N�vf���� +��e�|�z��a'���#�=�&���Ut\���5���}:^c�)`���/��/ChLN��"SWCk��q�3k��z��ݱ���W��1z�t~8J����Nϟ�}�:X>���T��.��aM��+�=~��ݜ��	R��Z*̮ƟbL�Ðƭ���1�>��1o9�����L,�0�TP�L��W8'8��>w�j�ls���*���������ςsӾ3�t��K��������˗���tBv���ƀ[{}��M���
����X�v
�_>��e;�}��{{99��7T//OY�܌�*r������!�I� ����>F����������s�کs�h�J:�&@�:ё6�-}(H&��c�4F*5��~Kc��cކ/�x�Jq~������i�k�[��{'���c/��>���P�����)Z��\k0]�޾
9fob݉�uܣ�Π&���?�~�G�̧�,uv���T2'��/" #�q���4)Y�O�{��{O��ԙ�'Tt���J�݂?��~�aS��k$��&^�{���%�����y�{��W�I��,�Y���s��#�߾Fwți��բڮv�>ff���6�}�ڡ���N�OϿD�j�Ue�>�f��|��h�Ky&��X�9<����6�meUc���D
i���
8�X���ݗ����X[v��?�Y�v�b����cz�4�TS���۾���U��YV8�W9�c����3��l����%�	�~/i씴x �zxc��/<I6yv��p��'�t UR
۳P�x�2���(�壧H�/o�݀˥&,@��\����q��#������]�˳�,�h�wٮk�GO9��±�::�q�S @����^ �N1ړ
nd�S��^m7|�­~����� ڎ�y�1(�:#n��ꈘ�- ����M��w��Ez��"���j�m�o�ٿ�6���~ _�t��4�yښ���O�G��/��@.<Nv�&��!�����TQ��dM&�$Sc�x�5��GK��qu�fu\�+�n�EKc��:���ն��WA��"˗�f�+��8��#+��+�ķQ�?҄d�6������Y�J�%�����J9|�G��Дd�Z��ͪ����S���
�D=��z�]�N������{���7�q�������SMs�OU)��i7o���BDW��~����a��^�h�\��>&��@w}�ߍa��P���he�]�A����(d��$-LwV���T1��w���b�t�m�nt�����^��K��)%y�Ί[h1��u����6N�I���Ɖ������<:TԚya��z�8EՖ&n�hUm=aj����5~ n��~��j�-��?vS3別#��v��*��~��	=��r0q�6�wh�&܅bH*�8=2DL��2���P�n���dZ,"��ub�W�k��*ɱ0G�������}��ޓ�ݩv��]��q�"�������Ȑ�kU(bGJ`�CJ�k�&`������"�Me��
C�o8���+��&M8��W�%c �����pY�仮�Tl��������B��v�IGҦ4<`uL�1����C�z,z�:�	�'��h��l%�@x�R�n�nu�ʻ���G��x���mt�ՑԩY�ۂO$.+�r�W�Y&���n��@��!{��K��������80m�^[��)'���� �@v?����z�p���4!�*Ȯ*6yFn�]���J���.��T6+�l��g�҄,��h	����Y6��+n�!�)��3����Ϙ�J�+:���Cj9�6<�"�4@L������2��v���2����5�~++&S�k�0
m@bVV=���d���V�}�-+���Ͱ^�S0<5��2�E �p�xB�˟�)����o�g�%4R;xHx�e~̳!C*�I�4�I>	ʤq��j�V�s3�ɶ����&;6��i_��'��GR�����x������	wz�X}`3�̠뜁7�/HF��&���*x@g}��	=*I�q��z�k�+���᥶��k��f��Q,��W��}o��~�`��cr̪��M�������̹lw�c�Y@`&�����:++���������v��QWR��x�9L]��~ٚ��f����3��a�����|���Wx&���c�y�=Dw�d��p�<�{,5-n�TC-�#��.�9�n;��s���ud�����2�=��0�m��F@3�V�3�n�b�����RXv��h)�۝��j��p �����'������C���6���9�y�[<$�
�[ܸ�|FA���(au�&��ms�큀HI���c��q&t$��/��c.��T����ٮ�'��; )�[x��2/VWYA�����=�G`��F�p.�%0ʶDgi��6'8�$��<�tw(ɍ���*78��'�~�'�pS�{���ҸM�x�ƕ�1�����d�	r:u�x�u5b�1Ox���[坹V��*_R\�嶦�>eR9��3�N=,���E��^�QQ�s����m�����`uS��W�y�!��&W��X������N���%���3>{���QeE�����;�Ge� �Cs@8�UUF�}���"3�=���c\�X#y	UNS#�P�!|�P�6��T��;;	�b�e�����Ad�n��n���~d*�]1JƝ=�l+�d
�z�0rr��а�����H�"�}��D8
%�\)���� YϏ���d�/QÙD{��    �<�3��	��E�ov�e��XH�v��p˘��bf�lj�@J�X6�
;������d��V��\�l�Cz|�wG褗���6�d7G��(�m��IfT���Q�/��j����(�kNO�E�Hu&S,�wW�Y-��:�]]e����)&͐Q�P.����r�V�����f�n�d|�x^�Xst�y�hg �vP.F�h���V�e2��q�U-�ݭ����.��vd�����ʾ�GP���V.�/oF<IG8�ZLL(r���,�D�~�Z�M�ڎ����Ԩ%ߏUw��(H���(n��j�q${�Z�����O��+DS��1����fBjGF;��%�P���u.�"(I�\E�XP�V(��FXz��`���Ҭe�:;!,�⢝��פ#S_v�T½պ�nX��\%7U�˳����5�A(��F� :_�)��9���P}4�\��v��r=j�X��������د���n�묰\[6E�-5�����U�$�ࠤ�F����Q��0,,g
��a*�W�����E�]d�_���#��Q'�
�	�[�vU�vH�����&'E�`�KAe����$�v�+:
$�y���,?nz3k����E
JN���jӦ�	����rK��λ�/�Y��تq���79Y����.^�q�6��p(�8�vcȓ	VA�R�</��8(�]-x�p�������B���H�������|C�QY2ʍ�|��I�V�Y��_�V�N܍q.�~ܸb�(j�UQd��z�h�D�y� r�~#S��b��c��@�L�􁻆����R�.1�П`�(��~;&����~��Z��j�?(%mT�MP�+ӝ@ �$+�j���&�ͳ4#�S�Zl�0l���:�ˣ���GKB_3	 r�$�ӿ�g#'Ƞ�eֿ�r=���1�qQ������#?�Z'���C]Ao
��l0���ve�8���.b7�{�S�6��T�����Ä�˷�l��Po���(L�]e�Ѓ�G40��O����]ᯡ�>n�7C[8�?�<��i�Jڝ�(n+$��#m�O�鍯I�b�Ҩc�B�qrmj�^�=՞lWG;n�'j(e�3U���|Dv
����*�"|�_�w��|���/r��ga��ILvYYT����6�ErN	عQX��0�p#�LuT��j�7���y�+�{p4����0�3xLr�8:,N�NOy���TF K4�,���7����T�n]��&ڛ���Lz��~Q�k��7��+-J��N�J���odM5{]�b�x�tbl��}Ys���"�,�}����ιYT���b '��Ɠ��n�a��ݠ�~+�{�(Jb��jl�|J;o`�7Yo`�iL;�b�o�"+hX�l���`�ƌ��֜i�l�8�pSK)yc�����*��B���^d�3H�x�:����㗒l��6��p��f�uo���iʍP��S��r�E�Q��F���|���e(s�R���p>����j�,�h[�F�~P����X��@;�N�x*�#�q���*7�W,���VR�����/�s�8Bs�+��|�g�:��S��f��ھ�)v��*�ʛ�=�и�&�k�*�ֳ��)������)�!7�a�/	<���qlW˶�f��f(��+�k?�"�"GJ�ͪ��2��he�#��hm�,��u�EÆo?��n��˳m^ZB.M=��X�F-5�&�mV1��
�kW�(�~��9{�4�O�h�ݔ�x0��2��B���f(;W�8�i�(��"��F�_f�L�%�����f:UL�9��g��E
/��gzf7~�5i���Lu�=���G�>��)�*=MPl��}c��'��F�1ı���$F���G�<'︒TZ��8�۸�q�~���
��n��빨:�wy�R��o}!� Q� 'c��(щ�6�ٶ��]C�S�@�Fy<(�\-W:d�ji�T���DZ�1��%v��B���$h/5>c�ˇ�9Z�G�nV���XI�o�#���N�N͓�y0\��j4,�����q'"W��U��T�FoZ��#5~2e������_�Ȕd�-<�zDs�f�)׆缩�c?����c��7�����;�^s�[�0̥{q�)1�˨�/�4e���d�FS
��Y��� .��4�{�pw���2�r�hm,c{�<�CID`Ǒ��f�*�z�Z���Um�b�2��q!����e �,�B,� �&ۮ����/'#ؼ	O�Z�H����	:�\�p7Y߾R�فo�(1��Li'E5L�������N�g�ɷ�D蟩�j|�Ȕ9�K�������]5�����jw_u�Q:<�-[����CՕ�7�IS���Ju�B~I�3�P���T<w�.'�v�f��z�TB�r�{Ct�9��~cB��!L]4I�G�~m�w�����V�$tj�5���w(�>)v�F2�I�?ܡ��M���FS�� d?��`�����hq |��|9�i��Pc�B�v�Q ��,*C����?���&�0�QBc^Ss/ǵ? s��00�����Ud�Lx8���*����8�o� ������P��x�ixF�+i�״�o����˯j�gx��u�BiU~��`�\]9j	����(kk�:���nLU JILQ��^�V��1�0�$�${ƩW����Sd�゠*����nvU1u�4樊S"
f��&յY��ҔNJ\KU���5�"�]��``t���`�4A))���q(�����c���0	�x�ol��5v2!.Z����I�G�J�f�"uj�b�]�{F����|;eTb��+֬�_ ��!d�2Q���Mo$+�I�S���)]թ���9��\��p��T�I�U��v�E��QN�:��ޕ�vٯmE��jד��o��������ȋb�X������JE��<��)�X����DO:��	U^$�Ғe�"a�'P�	D/�c^BQ��m1��t�*�(&��/�5 ��2+n�/����I��ib��u��u8�0p�mt�Y��B=sS��w��\f\c�Y.�>~oV_�?���U�ލ'��RH�Xk�7� ���dq��#�6?f�����~1��չ�����ma���l�o��.4*�e����2Ji˴�@���<+��Zӡ�11�f�j޳�S*��V��F�q b�䶬��SQs�
{w�2�BRx��r0�����9K�r��&�e{C���و���6�5�i���VlX�U�J���mb�]� �U�f0*��J8����_��³��1�j8�����q_=L�	�U���j���z��l��J'/rgy#��# 鴵�8iu�ܑlyH9��7��f�m~�&=���yN��5fʕ���U^W(�3T���"�-�D�U��9<z�ր8�ZL�D��W�Qvh�l�f�#��e>��%���p�5)~*�~ٮ�d�;(�(|�%��,�˻�]˱�gc\���tBt����0rr�V7� �����>�<�:.�j��l��	�s���?1������S����'��f��_��]��o��L�e״��Ά;����fUr�W�o�յv�]�����:�2NA޼z�ڍ��	�A�+�省yq�4��.Kdn�4�o1U�YJ��AH�Kv(W+��^,��2�����T87�.�u�y�(�~[���2�	�K7�w%Y�2��0�o�Me��v(Yt��u��K-Qe�L:�i���ax�j���i(��1�����l��X���d�k{��+ �3Y@}�%�z&�K�B�H�!��d:g���v^�7�m�_�hit(���|����"+�2_fUQݼ������y쩠�I��)1G�S�%�,�qз)+f
hB2(�o���Owh���s��=N'�{�=i�_�X�oo:/�ski�����͙��,sd̡ñl<!�"6�
-p��L�h�GQ���7yd���]~8���s:�5�P��I���$� ��v�.��Wc^���"�-oT�ͤG���1)�tYdW��T���)�"���Q��������9�rx��G:�_��L��^:�M��3    �P�FPh�G[�B���*�E愘��'�����f>k�6�7K0r���wf�L��9�L��f�� ��v��,]C�I��siEj��z�8��4S r\]U��M,���?!b��Lǲ�ř�'I�/�����ulذ�+�45� ��J+��oV�)�F����.�2���f�LQ7

"{���T"�L��N��G���n��f6)D+;�f�h6�_w�8��1�3��>�0IJ�;�ӌ��	_�ۋi�G���6�A�Ia�i"͊���C<�	%�|����P�};3T6vݻ7V�����Ɯy�$p�V�-I���7��3y��{�[פ	uy
�j���U�3E��E�ls��〷��-	:�~@�MM"�)x�l�㑢l���+Y&S�Τ��s`�H�D(�	��\��+�jO�7��Ks;X��͘+�����p=of���
1�R���ފΥ"�@ 	�fV���q��*C��.��]��р_Q��at!�"8��o:��S��f��
��[$+oղ�B4F6��Sa�%2&�U������k�:N8�"��ZX���I��GPM$p�CJ���Y�cq��O����;e��Գ��R���d�P�S8i�����S��f
 �O�zU�i �d��7Q��(�z�j�v�f3�O�	��]���fF����4q3�NP�D��r�� �Q������Iڱ��ؽ��"_��E��DI��̗��ִ�$���T	c�Q����]�o���`�CE�{�K�߭��ٔ5�CWi�q�3،���}�f[��¨IVٿ����Q�%���u�|Y�)L��j*���'�v�J�_��kݛxgY�A�<��AIh_a���4����N��)���f���!zb�4|�V���`-b�ъ��Y�mV���"��� 濢r5�(
����f}E��(҉���I�Ͷp�E��ousSoj�4��k���0WPJؘ�C��L
�؈�{��Sw�$q�<������&z�{���O���*v'����F2�)1�v��1^։��Qg���i ˉ�,3�QA��:D�����w�6�zo��˞�qʺ{��{&�(MੲՐ�4A
 �t��%'��
r��� h��Ή���0�zoE����ŭ7�T#�y�c3Ϲ��w�H�eeF�sd�4�N2)H���Τ��노!Д���z��!��S�9���+�f:sZ�JC'�*��Y��[>J٤�{Fmnk)]��X]�Rs�m���.ik/�홝2�:���fqZkTB�x������r\6�Ƿ��Ί.�����=t��|�e�z�sZ'5��X^�GÔIi�V�(�+����4��}��|��H7}�j�9S�o�2����ʛƸ6��*6��4����Oapu����u���if��7P
ǋ�@��@���Ȁ�)�u�m������������:lN�"�	��]�aHe�E����Ա�8 �HF���/��)�Y��Q�h6i �r&�D���1L^v��6/ٺ��� ����	�4 ��H��	 '���e>,�b���������*� �S��ƥXj�^�;Y�;�v��>�������3�"��s���0!f���Y,�ž���r���vہ�_P_;�cj�
��a��f����.��H�bx9/�45)?*A^���4-|�����:���tz}k*[���?
_ú�Q��y�Py�a߼P���z���w�O!�,�k��Zf���6&o3V�x)Y#��ef�����R�6n^Ƃ7��8�:^4f~岕�֯�����	��*�u��Q<�%cGI�����}T;�G�-�e{��Ƕ!6��Nv�4��y�ȚE�b(m4qz���C�ҿ�/<N�g&�����+����� M��&��6��F����=A��m��[�k�%�l_�fe�PL�G}�ЋoD��d����&T�p���~�7�Wjn�3�;c�:Ӳ]�o�1/�$�++KY�����N�#�wrz�<�	���SȀ{?�����F�qۓm�7��7/�4)��5l5Vo�[*���&�\�%��B��2����j�R07P��y�Y��@�/Mh[��lh��o����J�7�����EY1����nu׫����U:��#G�sI��3/�y�:��������?��Ȉ�}M�r�� �[�v�l�>�kY���;�+�O1��3�I�U�ζy1̨�t��螺�n�-��E�������%���	^�"5���=/��۟y�'Mv�u^tWn |���Q"l��W�|��"���}X���h�Y���N@��f����"�v�:u�/௣lm���SRH�`�kyk����R�a�������{�=H�J������L���
<���8�^��c5:��'�Wt$�,��7�	�IY8�;Ls/�M���,Z�nsd�n�!O�j���D��1*���ޯ�)�9���p�i�
I5�Yց��x�����7�E��	w����?U8/؄�P���}|�:e��v��y<,��00L��v���(��l�ر�U+و��o�%�x��3ۉ|�6��x���I����_\2x��C���Ȼ��~��*�7�+�,q�
mS��e�%#�	TƋ~���2Q���n7=YcV.-%�jWB}|]�EE���C��H�ox�,��Q[}�O�f6b�Q�Ig�7M�1+,�J�V�7��Z�q����7)M�SH�ahIHS�e_y9��%S��&�^ݤ#,j��Y�����<�s�j*9��I)cVIw�jkw�g�\�����j�������0pQ�:��uŗ]+ch��1� G�+�������8B��G����8�1n�OSU|�/!�y����{ǽ�W��{�UX`��Kt!@����yd�|�5�L�tO(�k��/�<��G(������:�k�����8����&�\c�^��փ��6n����
AYk�!]�i=M�6Cf��O䂏���f��"�WWXS*L��}�����2��k��Z;�C'(�bהּ���P����N�ObikNe�kn�HY��f�<p.M����$�u�d�.\�	R�C`���~��� �Ev��<|��¼�P�u6�DO�y�'P �k���l{[3��=j�6?� Q��)���(��k� }�|�]��w�r�g!4�d����.{��j�X�0J
��{���k�E��M&�%�QI;C 1Jd��싖�m\��=y��o�������d3�M٭w��l�=��$� ����nBDʇ �&�e+��]����.�7���E�3��֩vvg��=r��q�(�H-���OW��Io��:����Las�Q'��`�Ҏ�r��_�w�+�i�k����K��kU'�l�ߥ_ 	2���1��̴�`�i�$��1/h���^#�\<v�����|���׺��<��Ko�2��W�4S�Z�8��q�@rR��O.��n�.�Mv̯ܞ����G��܊(�4d�����F3�)+�R{*�0o;��s�:>��ę�!ĕǲS��vm|���q��;��Sg�3P���=��x�=Θ�,DbA7�#8��軌jsߨA�ׂ��k�����ƭ�*oѝk�B��b<��i��wq�{$gbJ���W����>�x�w8�5���b�p����e�m�r¡6�۱��~5��zq,ڜP>Uv5C�(��79>�6o�Z�V�?Vi���2��le3-$��'�v�~1:�y�74S�.�XG�Od�7Tp �Cd���'CR��`5��]�p���ػ��^�O��6U���S�w/��1C�۰�lV/�]�[�����<��~�fqε�8g�Օo�8�!�:����L	|	�s�kS�֐�lD�v��|���l�g	���U�C��|Ym��?m'��n�U��q�A�(a�(jr��G�qQ�_Q�1�%�rQ��&�_Gm\<��c��C�4�C�3{ӱM\@�0;�~�f;R���ө���!����*JP�u�Ea�D��]�
�D���2�R�BM<[t��o�M/iC��#�����Llϋ��Z��]>�S^����^.��]��EPn�[.B<5u� 
(�Y�g�Oos���¤,    �\ ���*1ɓ���ݸ|�C���͑�'r��9�{�US���rJ�l�}�?�N�uZ�]p��y��:E��� �ޯ0:q��Prcj���P���!��8�=F�曮�u�SO�$�F�S�G0%��~��UnN_gcv�ף_�f�,4�Mb"4�� ����U�Q��k�m!���h�J���D7LՇ��_d�,�ֵϩ�i/��8AI�̬��t���5#F*�y�β�ߦ���7M�"I�	��!�-�(�B?�z:�����P*���liT{�O�UK��9N¹U���p횑��+��W���_�:!u�Py�m�j4�����������M�'G�k�HuGfL^ޠܫ�4'�E킰�gq��p�*���۶@���j�_19e�$�uԕҭ��S�WjRf;hOFkS�Mu☁kS6�=g�ХNпk�!���1�bP�R����1RӘ�T�� /���q�܌���!�:Ia��)��`��.϶y�,��Y�K���j�?��C��߽)#���y�9+���3����M�������!����Ym���P�����;�4e��@�!Q���,��ر����<[7�Mk�X1��ذ6��G�B/���| {l-eM�t���N�!%�^��Pڻ8:=㢎O����9��'CC��Q!�_o�3�dJ��.1������j�9C�ZqH����Ul��޺I��ID��Ç��$[�f���'�9�����t�j���O3�8d��x���A��Lm���V�q�~HY�F1ʎb�k�ň��sD�:�*��e6Pj"y��spj��i��>��Y�� #���(��o���<��O���#���IYm���ٓ����ˎhd|�\>z�d7f��[V QaM��7ي��߇�|����߬9/ńdXμ�]�f+����5o�K����i&Fs�PL���U�rq�]�۫�w��&l����ҷ�Q.6O�N�?�Nf��*r\]�M�[+`�m'�W�O�)ܰ5�K�1�ke��������o��~�L&x�*�k�Z��YM���}��� ϼ:�w{�q1t �'m������,�i��1��3�'�D)o6���!~	[���$�9�GI�XV�h�m�%���qq��}�la-�8v�������.:�;^dwU�]�RI�Jel��iGf&��
S���Y;G9y������Ȧ���X���M-;�N�3���D�����pY�Ǆ�}�~X�\�FQIߕ�[�8G���J4tCU����~�'ƒ�i�R�	�^#-�ڻ�^��7w��4�O|��n�mU8:�6��F���Sk܏\>~
���Et���ʘ�o�݃����+�L�je�m��$�àN��N�%�ٕu&3n���g���8�����/%��!S�b�mr���Y{=�ľ͚5�N;Z�@� ��5^G�j����k��LF��bib���1L��D��1�dy�_��ي��n?j�Şpʅk�hÉ�����Ȫ*W��ԈW������4�3��>P*e��$���IKi�'��Kܤ��H��V��lwW����L�]�R;�A�#�TcSC�戡p�U��!�\�[e���)���r} �M��^b\��G�l���)DM��'v��{�F�w�d��,���
�?�Z�D;B�<�9b�<$�?��P7o�]��X'�yC{�����9����6�j�ˣ5)��{tU�o�!	�2���3CC	bH3EnZe�]�P��?}�-�Cv\A��:T��2�~E��P=����lPLI������l�h��?�%�휡"ɼ�c���$Y, Ia�Ll�UǐF��e��?���vFU��g�x ޟ>=��U�~b�0;�~"�C�"㗍%�������-*?=����������[z�8ه��_�l�����v��XQ���q�:Q��a��[�!������r�|}8=��!}��y�i����<�.��X#�O����4Y�<?��������q��M��;��Q��v�16��p��8�?�����v@��2I���V&I�1�L�.>	��St_TO�zd�3h����?��U�mh�۬[/;E��/�hyz���A��K��6{B��2|�T�6�4�(9SrJ��wϟ�'W7�ݬ࿄��ʖ�H�_�|���V[����a���| ����k��E/���8QZX���9Pѯ��?�ۗn
�ϧ���g����ɇ��V�Q��|tV�P��1��m���mO��8b�{+�H�cڷ�Aơ��h�b�dx)�>=�i���V�Y�p�)��	�֯`m7A���ڿdp)��,���������	���kÖo�F/WN������jo����"��`�҆Ȱ�j"3�T2��d>�ݞ>���h"�o���x�v��G=T��&8r���������1+��g�*�-+�IG��5\쿞N�lן���y�;���Q�*R=�����ߏ^�J���f��^K�	TM�'\����p��ob�e*�y�ڇ��0�)Y��?������&��WJ��r�N�k�|<<�$&˧�_6��>��>~���O/���nI�o�M���v�B��j��2�j�ٲ1F5��A@��w��D�������&;�SJ��/pe�yz|>a����+>A�'hj+ފ������2�ǒ������g�?qGR��+�z�o�_�gXO/��� 	x�Y�[]Y�3NZ��������wS1������O������_9�E�Z��,Q�߬�"ES㘝Bm��M��6�#���^�?=�\5��������,��w?*9gVh����������A�	�������Y���U�_���0�?��pȭa�h�1.��;A�HA�����x���nq�B�D�.�/5�>=|>=���/O2uk,ؑ'��%A "����'����
�<��uf\�(S���ԫ!Qv�?X�`��:�v�'<�|��2&��g�m��q����F���O����o8k�(Y�����O�����?���T6���I˞|��- �~?�X;��o��fej� �8ݰ Dj��9*O�|{:\x7K�1����ۣ�u�gP��ׇST������Y/�r���:�n,�	�LF=e 0&x�<��qN��}�������fB���ϧ��p,��rh�{l�#؉�_wu]a �H��t�xF ���;V�1Y�bַ3�{4^<��k�ν=��fz��(&��f�Z� ��- �Rrw����H��u�_ܚr��:�(�Ki�Å�P��p�x����C8�'$��i��$mrZ]P��H?��D���/����RL⟚���ZRLB�_�bB�������N�n���9������������{��/�NNO�o�ZP{�u�Eb��5���k8ѣB& ���bf��>��?i��j}�_�=�x�Rޟ>}�p��ih�k�Z�}�B<yN���g�Y��@��f�MLǳ� �S����y��q�TϹ>M���25�p�i�5��z���g��i��%�O�O�N�K�{K��v^�<�s 1%������㷯d���m���,4�s�i��,�ަ�DF����#�c�?>�<�jA�"d��Z�cT��ԝ5x�d���꧇a1��{Қ��Xv<i_��x ~�N_^>fY���&Qw ��mb�/�v��q�����䬏�?x��х{��� O���sT~G��3���E���&���@XkTP��u�+�ɹ��y�ù?������������L&��{[�ـ����n�PX�O�ӹ���eH�Q&�_7f�ҡEl��xw�]Ǿ\6r�_�x9=F�a���+Sn����rM_�may� jr<}?h�7�[:�$�:�^I$�.�;p��y�����Y�el ϋuʡаK_ke褭(&���ⶢ�������i ��w��+�h}W���Cg��~?9#v�^fG����U�"1�L���'���POpeٙ��V��1���ކ� ����|O��fJ����c�\�����]Bh�84��t��㦷��Zt�e#������C�0�`��.�ZS-b��	o���:���; �  �����&&��Ė��N��5/�߿>~�P�7�^��2���.���c�
���z=�	'��z�۷��Nï2\��2kl�[�(s7Xcc��f���Q�x:}>?�+�	p��fX���,y%��c������q>=i�����/�����B�GEL��!'w/�/��s�7�TL83"��~��,3w����}Ւ�Lo���P�2eZ�W$7��]��=�Xɛ��)sb�����!'�9�:�5�x�����IP��g%��s��iɄ�\���/���+��逯QC�ujL/�����:��|��lvj�������_+a��ke���H[�C,�<yv��d'��!5A�G�`�f�	��W��6���C�h����ʻL�k�Gh������6Қ�E'��mn���o�ɗ#w�o�j�O�#J�oh�����f�R ������w�^Ӧ)�&�N���ov�	�{vU�/?�.��G���Th3`E�#Մ���5����'i��� K�ƺO#h�g�g�$K��ݞ>��������p3Å�}���L�p��bW�_���"ק����1����|lUܶ��c�Գ�]����6�&I�W��^6I��9�v���05�����>�sR�*�\��d��c��~�?�x:���^l���%�ĭ�|f&�g �ϥ	���Ĭ�OЮ_�=|�k�ͣ��a�pr�sp���f8�����HB���?{h�����< �p�v
��ĒM8mz�xL����'��q�M<�߻Z'nL<jw��N������ܺ�Ib��|y�\���N ��s��.~A���d�l�Om~~�:W�f��V	n����gR3f�g�����'��d���e,��dH�@�;�����a�I��p��S8��uP����5[�������!���            x������ � �             x������ � �      
   $   x�3��I�L����D\F�!�)��
x���qqq mT�      !   �   x�}�K
�@�u�)��?=}O��.��d��7�E0�P�*%p=�+`�����#�1qT�4O�f�cb�]����M��?i�u������ϥ�:�Q��%���ة����C���M�..�Jen��7?95h         �   x�m��jAE��_1?�MU����.bp���a������������`��mv{��$���~��\� 7��"@p�Ff�Is萋���at9���z�e�ZW�M��*G�4O ����Z�Fc9Q� Q�$��cl�<~K��ھw�����*�&��c~V-v����%�@Hk�:��/�C	            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �         U   x�3�4404�#����|N###]]c#++=C3#C�?(2��U�%���99���ى�9����99��\1z\\\ ��$            x������ � �      �   �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU      �   c   x�mͱ�0�ڙ"9�H�S�f�9��&Xr���L؉��{` �$Ǭ�b�/�@8�&���8�,T��G*Y�X�z6�7�ӘI�mud�B7��3�      �   �   x�m�;!E�ڬ"��6��v@3�T4���4�Jt>�~&�z|D�����O�M�n����&������;F�`g�9��8u��xi)�&�k_��[��٪]��¿�����y'm��M	�����d6��j�ب=��Q`*��C_z��      �   e  x����n�0E����d!	}�K\�A'������M��li�Jy�B�1s�X�^OhQθL���$ޛE�B|��( ��y_*���
^��|↽�r�6-�}A-J1������A� 18<И]��NYe����f,~�%�T�Ɂ��&��M9aE���04��ΠK��>�Y�C_Y4��0�%^��ChS3����q��q��^�����Wi�|�*�H�Z�wef#'F����;�w�k�qTR_�\_Z�?���Q�IM�e=o�bjִ��Q�Ƥ�]����G��roa;g�^���j�_q��nĥMѴ�r�������)�:u��E\���D<��h1브)�1uo�u�cI�~6SZقK��iS����?G����)�<u�&�8�lƅI�0�z�l�������c�\@�S4���t���ؼ��(� P��CX��@)�9��ӄ%� .#׶4���+p<�?P)��H�_[���/�U{�f��^L��@a�fl�̼���d=8�����t�fXB�i�G�ܽ�n�t�Il�9��"gw��,�%�c���/�y��+��(�e!^���<���(���v��(��      �   W  x���ߎ� ���S�=�ۺw���A�f���s���d�I&�]��a���N�b���x����Z<�ZIU~��Q��y����S�v���/��9N��	��>R���e�j�M�y't�(Ec��˾��H��ɐ71Y�Y�E��Δ�.6�tX���y�C��'Yc�#��a�X��18��X�8U���w��%�yH�.����cB~;�?D�F�w��8��X�%M^婌&Y������M3�d�h��g�UƗ,x]��y���h��Sm�tGEy�V�#�8�;���&)QLuTE����ކ��)b�ѵ6�5<SP��q��S��������lm��0���/��zoS���bBJ�4O��v�*����P��D�v) �)�c��#�`�9��s���$ 0Ձ�=_�L{tA���'���h%z�(�ÚJ�L{4PD�Ԙ��;�d
�55uq$�tH����g?D3-�%ո9o;<fY3��71���d���G�O�eA��hR�W�Lqt%ڝbUҕ����LkLA��b�4F��L9e�ʘ��Z��,�0u1�FC�ǝ�b��ջܷ���)�1�Y�Kv�a���s�\�QD�           x����n�:��5O��?L��a�)��:v���1(0�����C;���ʹ]>H�Hj�&��]��f�v ��?��������RF�_����o����\׹˞�0�����w*kn�q�f�ؿ%�FR��^�1{�����[f�Ȝy��t��W;�ŏ*uK�7�r�����=˿�2�u\�[��^g�W��6�D��/ƨƄ�
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
�e�����	�3U�N.ps��=@~h��0�d"��'166?�)���]��&ӆ� �����9�Ob��T!�k�{��v���i2HVj�p�u\��y83�JL y�K�F�\O�(f�<�����>���$3�T/�8&��R�`�Oh2{H ږ6:Pb���!C���)�j��c��ԡ��5�t�z�6[��&��b�&�/m�S_b�P�k2|(�3]� ��M~�Qy8�L��Xw����D�ݨ����3:m(	��Ώ��,2:J(���vX��2���'�b4��5^.��X{D��iA_�xr�s�:����N�q�n�#���:{�����.��f/8x'{����EspԴ�K�;�����d��>��y=E5F�L(Z \���e���Lf-�:L5��;��D�YB�����X��&����ԏEb�ɨ����!`�p�t�;j-4���}nwN��##B�A���l�q]`�ȈP0(�}[`��!�A�,����J�<���X���_��H�� K�cd�pR�W���1�dB)�7�����]��&SG���>�w2`������_�	��      �   �   x�}�Mo�@����+�`�\�a�"-��Z��̈́�[q$*���4�tלw}�H��.��2ꪺ�SL�x�ل_r{�.8���"�nୟw��p�+s*T���g�Sv����/lٞ�v��/� <OL�B�\��I!�0G�+�|8��&�Q-�����2�͎�|����i��{}���al�T�O�l+_b�4�ݿ�Q�k�4�RD��nk�q�0�Ff         m  x���An1EיS��l�N/{��`,航T���4S(EU�(�Xy����}���~���2<�WD�I՘j�T5���"��Ī���긻�������W�������	�A?�����f���%:%�+*��j�׫aw��s���H
yBԐ���}Fv��@ub� v�.�r�=����EgB�U�%�|�B�[*Ui��h�F:�m5�&� R�k��<��O��od��{�������|���h�>7��t^{,��g�g��h��cxȲA��&>F��G�}+!u�y�[�S�2c��asp���w��o]�ptw�\�MА�V���e��ccښ         /   x�3�t,N-���D\F�~�y���9R��SS2󰫈���� �f�     