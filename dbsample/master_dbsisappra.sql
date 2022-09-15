PGDMP     3    1                z         
   dbsisappra    14.4    14.4 d    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    25760 
   dbsisappra    DATABASE     j   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false                       1259    26249    master_agama    TABLE     �  CREATE TABLE public.master_agama (
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
       public         heap    postgres    false                       1259    26256    master_agama_id_seq    SEQUENCE     �   ALTER TABLE public.master_agama ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_agama_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    275                       1259    26257    master_eselon    TABLE     �  CREATE TABLE public.master_eselon (
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
       public         heap    postgres    false                       1259    26264    master_eselon_id_seq    SEQUENCE     �   ALTER TABLE public.master_eselon ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_eselon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    277                       1259    26265    master_golongan    TABLE     �  CREATE TABLE public.master_golongan (
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
       public         heap    postgres    false                       1259    26272    master_golongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_golongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_golongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    279                       1259    26273    master_jabatan    TABLE     �  CREATE TABLE public.master_jabatan (
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
       public         heap    postgres    false                       1259    26280    master_jabatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jabatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jabatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    281            6           1259    26387    master_jenis_bantuan    TABLE     �  CREATE TABLE public.master_jenis_bantuan (
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
       public         heap    postgres    false            5           1259    26386    master_jenis_bantuan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_bantuan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_bantuan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    310                       1259    26281    master_jenis_kegiatan    TABLE     �  CREATE TABLE public.master_jenis_kegiatan (
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
       public         heap    postgres    false                       1259    26288    master_jenis_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    283                       1259    26289    master_jenis_kejadian    TABLE     �  CREATE TABLE public.master_jenis_kejadian (
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
       public         heap    postgres    false                       1259    26296    master_jenis_kejadian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kejadian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kejadian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285            <           1259    26411    master_jenis_kekerasan    TABLE     �  CREATE TABLE public.master_jenis_kekerasan (
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
       public         heap    postgres    false            ;           1259    26410    master_jenis_kekerasan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_kekerasan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_kekerasan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    316            @           1259    26429    master_jenis_korban_jiwa    TABLE     �  CREATE TABLE public.master_jenis_korban_jiwa (
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
       public         heap    postgres    false            ?           1259    26428    master_jenis_korban_jiwa_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_korban_jiwa ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_korban_jiwa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    320            B           1259    26437    master_jenis_korban_material    TABLE     �  CREATE TABLE public.master_jenis_korban_material (
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
       public         heap    postgres    false            A           1259    26436 #   master_jenis_korban_material_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_korban_material ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_korban_material_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    322                       1259    26297    master_jenis_pelanggaran    TABLE     �  CREATE TABLE public.master_jenis_pelanggaran (
    id integer NOT NULL,
    nama character varying NOT NULL,
    kode_jenis_penertiban character varying NOT NULL,
    is_deleted integer DEFAULT 0,
    deleted_at timestamp without time zone,
    deleted_by character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);
 ,   DROP TABLE public.master_jenis_pelanggaran;
       public         heap    postgres    false                        1259    26304    master_jenis_pelanggaran_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pelanggaran ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pelanggaran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    287            :           1259    26403    master_jenis_penertiban    TABLE     �  CREATE TABLE public.master_jenis_penertiban (
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
       public         heap    postgres    false            9           1259    26402    master_jenis_penertiban_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penertiban ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penertiban_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    314            4           1259    26379    master_jenis_penindakan    TABLE     �  CREATE TABLE public.master_jenis_penindakan (
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
       public         heap    postgres    false            3           1259    26378    master_jenis_penindakan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penindakan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penindakan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    308            8           1259    26395    master_jenis_penyelesaian    TABLE     �  CREATE TABLE public.master_jenis_penyelesaian (
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
       public         heap    postgres    false            7           1259    26394     master_jenis_penyelesaian_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_penyelesaian ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_penyelesaian_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    312            !           1259    26305    master_jenis_perda_perkada    TABLE     �  CREATE TABLE public.master_jenis_perda_perkada (
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
       public         heap    postgres    false            "           1259    26312 !   master_jenis_perda_perkada_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_perda_perkada ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_perda_perkada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    289            #           1259    26313    master_jenis_pertolongan    TABLE     �  CREATE TABLE public.master_jenis_pertolongan (
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
       public         heap    postgres    false            $           1259    26320    master_jenis_pertolongan_id_seq    SEQUENCE     �   ALTER TABLE public.master_jenis_pertolongan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_jenis_pertolongan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    291            %           1259    26321    master_kecamatan    TABLE     �  CREATE TABLE public.master_kecamatan (
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
       public         heap    postgres    false            &           1259    26328    master_kecamatan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kecamatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    293            '           1259    26329    master_kelurahan    TABLE     �  CREATE TABLE public.master_kelurahan (
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
       public         heap    postgres    false            (           1259    26336    master_kelurahan_id_seq    SEQUENCE     �   ALTER TABLE public.master_kelurahan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    295            )           1259    26337    master_kota    TABLE     �  CREATE TABLE public.master_kota (
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
       public         heap    postgres    false            *           1259    26344    master_kota_id_seq    SEQUENCE     �   ALTER TABLE public.master_kota ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_kota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    297            +           1259    26345    master_pangkat    TABLE     �  CREATE TABLE public.master_pangkat (
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
       public         heap    postgres    false            ,           1259    26352    master_pangkat_id_seq    SEQUENCE     �   ALTER TABLE public.master_pangkat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pangkat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    299            -           1259    26353    master_pendidikan    TABLE     �  CREATE TABLE public.master_pendidikan (
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
       public         heap    postgres    false            .           1259    26360    master_pendidikan_id_seq    SEQUENCE     �   ALTER TABLE public.master_pendidikan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_pendidikan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    301            >           1259    26421    master_sumber_informasi    TABLE     �  CREATE TABLE public.master_sumber_informasi (
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
       public         heap    postgres    false            =           1259    26420    master_sumber_informasi_id_seq    SEQUENCE     �   ALTER TABLE public.master_sumber_informasi ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_sumber_informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    318            /           1259    26361    master_tempat_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_pelaksanaan (
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
       public         heap    postgres    false            0           1259    26368     master_tempat_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    303            1           1259    26369    master_tempat_seksi_pelaksanaan    TABLE     �  CREATE TABLE public.master_tempat_seksi_pelaksanaan (
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
       public         heap    postgres    false            2           1259    26376 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE     �   ALTER TABLE public.master_tempat_seksi_pelaksanaan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.master_tempat_seksi_pelaksanaan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    305                      0    26249    master_agama 
   TABLE DATA           �   COPY public.master_agama (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    275   ��                 0    26257    master_eselon 
   TABLE DATA           �   COPY public.master_eselon (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_eselon) FROM stdin;
    public          postgres    false    277   *�                 0    26265    master_golongan 
   TABLE DATA           �   COPY public.master_golongan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_golongan) FROM stdin;
    public          postgres    false    279   ��       
          0    26273    master_jabatan 
   TABLE DATA           �   COPY public.master_jabatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    281   j�       '          0    26387    master_jenis_bantuan 
   TABLE DATA           �   COPY public.master_jenis_bantuan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    310   ߗ                 0    26281    master_jenis_kegiatan 
   TABLE DATA           �   COPY public.master_jenis_kegiatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    283   ��                 0    26289    master_jenis_kejadian 
   TABLE DATA           �   COPY public.master_jenis_kejadian (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    285   ��       -          0    26411    master_jenis_kekerasan 
   TABLE DATA           �   COPY public.master_jenis_kekerasan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    316   	�       1          0    26429    master_jenis_korban_jiwa 
   TABLE DATA           �   COPY public.master_jenis_korban_jiwa (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    320   ��       3          0    26437    master_jenis_korban_material 
   TABLE DATA           �   COPY public.master_jenis_korban_material (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    322   q�                 0    26297    master_jenis_pelanggaran 
   TABLE DATA           �   COPY public.master_jenis_pelanggaran (id, nama, kode_jenis_penertiban, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    287   8�       +          0    26403    master_jenis_penertiban 
   TABLE DATA           �   COPY public.master_jenis_penertiban (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode) FROM stdin;
    public          postgres    false    314   О       %          0    26379    master_jenis_penindakan 
   TABLE DATA           �   COPY public.master_jenis_penindakan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    308   �       )          0    26395    master_jenis_penyelesaian 
   TABLE DATA           �   COPY public.master_jenis_penyelesaian (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    312   h�                 0    26305    master_jenis_perda_perkada 
   TABLE DATA           �   COPY public.master_jenis_perda_perkada (id, judul, deskripsi, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    289   ��                 0    26313    master_jenis_pertolongan 
   TABLE DATA           �   COPY public.master_jenis_pertolongan (id, nama, is_deleted, deleted_at, deleted_by, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    291   F�                 0    26321    master_kecamatan 
   TABLE DATA           �   COPY public.master_kecamatan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kota) FROM stdin;
    public          postgres    false    293   �                 0    26329    master_kelurahan 
   TABLE DATA           �   COPY public.master_kelurahan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, kode_kecamatan) FROM stdin;
    public          postgres    false    295   ��                 0    26337    master_kota 
   TABLE DATA           �   COPY public.master_kota (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    297   �                 0    26345    master_pangkat 
   TABLE DATA           �   COPY public.master_pangkat (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    299   ��                 0    26353    master_pendidikan 
   TABLE DATA           �   COPY public.master_pendidikan (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by, urutan_tingkat_pendidikan) FROM stdin;
    public          postgres    false    301   p�       /          0    26421    master_sumber_informasi 
   TABLE DATA           �   COPY public.master_sumber_informasi (id, nama, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    318   ��                  0    26361    master_tempat_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    303   ��       "          0    26369    master_tempat_seksi_pelaksanaan 
   TABLE DATA           �   COPY public.master_tempat_seksi_pelaksanaan (id, nama, kode, is_deleted, deleted_at, deleted_by, created_at, created_by, updated_at, updated_by) FROM stdin;
    public          postgres    false    305   �       :           0    0    master_agama_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.master_agama_id_seq', 6, true);
          public          postgres    false    276            ;           0    0    master_eselon_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.master_eselon_id_seq', 6, true);
          public          postgres    false    278            <           0    0    master_golongan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.master_golongan_id_seq', 15, true);
          public          postgres    false    280            =           0    0    master_jabatan_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_jabatan_id_seq', 30, true);
          public          postgres    false    282            >           0    0    master_jenis_bantuan_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.master_jenis_bantuan_id_seq', 6, true);
          public          postgres    false    309            ?           0    0    master_jenis_kegiatan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kegiatan_id_seq', 19, true);
          public          postgres    false    284            @           0    0    master_jenis_kejadian_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kejadian_id_seq', 14, true);
          public          postgres    false    286            A           0    0    master_jenis_kekerasan_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.master_jenis_kekerasan_id_seq', 5, true);
          public          postgres    false    315            B           0    0    master_jenis_korban_jiwa_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_korban_jiwa_id_seq', 7, true);
          public          postgres    false    319            C           0    0 #   master_jenis_korban_material_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.master_jenis_korban_material_id_seq', 7, true);
          public          postgres    false    321            D           0    0    master_jenis_pelanggaran_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pelanggaran_id_seq', 2, true);
          public          postgres    false    288            E           0    0    master_jenis_penertiban_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_penertiban_id_seq', 18, true);
          public          postgres    false    313            F           0    0    master_jenis_penindakan_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_jenis_penindakan_id_seq', 2, true);
          public          postgres    false    307            G           0    0     master_jenis_penyelesaian_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_penyelesaian_id_seq', 1, false);
          public          postgres    false    311            H           0    0 !   master_jenis_perda_perkada_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_jenis_perda_perkada_id_seq', 2, true);
          public          postgres    false    290            I           0    0    master_jenis_pertolongan_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.master_jenis_pertolongan_id_seq', 6, true);
          public          postgres    false    292            J           0    0    master_kecamatan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_kecamatan_id_seq', 44, true);
          public          postgres    false    294            K           0    0    master_kelurahan_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.master_kelurahan_id_seq', 267, true);
          public          postgres    false    296            L           0    0    master_kota_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.master_kota_id_seq', 6, true);
          public          postgres    false    298            M           0    0    master_pangkat_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.master_pangkat_id_seq', 15, true);
          public          postgres    false    300            N           0    0    master_pendidikan_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.master_pendidikan_id_seq', 9, true);
          public          postgres    false    302            O           0    0    master_sumber_informasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.master_sumber_informasi_id_seq', 4, true);
          public          postgres    false    317            P           0    0     master_tempat_pelaksanaan_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.master_tempat_pelaksanaan_id_seq', 13, true);
          public          postgres    false    304            Q           0    0 &   master_tempat_seksi_pelaksanaan_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.master_tempat_seksi_pelaksanaan_id_seq', 87, true);
          public          postgres    false    306               �   x�3��,�I��4���!###]]cCCS+S#+�L���wQfqIj�B@Q~IjqIb�FK]l�9�K�s2�1�aQn�鑙�R����bSN�Ҕ��DL�&XT�qzg��g�&c1���=... ,�BU         e   x�u�=
�0�99���I#�M����k���Fx[��K^���&�@s�8D�ʙ��d��K�, f'H�+X��e��-%�4�8��6"�	��8,         �   x�m�;�@�z|
.�~���PR��s�3��� ��v�dY�f�ry��z�^x�����e.1�秿�r;�6$
MĦ��l�iӏ��rｨ�$xF���ȳ�u�"t�b��E�*���t�&���.&�����6t�	���P�`Jԧډ	�K��T;1�}�O�/�_��s����3��h,X� �Zʏ      
   e  x����n�0E����d!	}�K\�A'������M��li�Jy�B�1s�X�^OhQθL���$ޛE�B|��( ��y_*���
^��|↽�r�6-�}A-J1������A� 18<И]��NYe����f,~�%�T�Ɂ��&��M9aE���04��ΠK��>�Y�C_Y4��0�%^��ChS3����q��q��^�����Wi�|�*�H�Z�wef#'F����;�w�k�qTR_�\_Z�?���Q�IM�e=o�bjִ��Q�Ƥ�]����G��roa;g�^���j�_q��nĥMѴ�r�������)�:u��E\���D<��h1브)�1uo�u�cI�~6SZقK��iS����?G����)�<u�&�8�lƅI�0�z�l�������c�\@�S4���t���ؼ��(� P��CX��@)�9��ӄ%� .#׶4���+p<�?P)��H�_[���/�U{�f��^L��@a�fl�̼���d=8�����t�fXB�i�G�ܽ�n�t�Il�9��"gw��,�%�c���/�y��+��(�e!^���<���(���v��(��      '   �   x�}�A� E�p
. ������Hj�`S[������&F�Y�b���c�a��U�jZ2Յ�0#��0 ;��,)�:��:����}�H9f.}?��X��j�s��o�  �&�**=WW�����fIL�tN|~Q���C��N�+��/eQ����F5�cy���q��_��=@:X�«�\���h/O�         �  x���Mn�0���S��Y��v�ӈv �$)�?G�LK�,���^U=#� �!U#,����E&�g��*�ԋ�_���i�n��V;/,~�(vk׶_buC�߶�{u�)����� }c��h���܎ט �Ę����2�k�T�5V5��Nx�Öi�0�����������v�2�;��B96Ú�!�����K���$��N��Ֆ^��ʰ@i�o�Pg4�؉%���j��	��H`4u�ʐ�i�"q���0��S�\I�|)]���k��RZ�);��ԥ��~��
�٩K����X�%��j�s�1u�qd�����V��	ӥ�W��OW���s�Ak���@�S�U�[i�>�m�8��m���a(w��R����2`.��X�]R]k�gR���ǘ��l��~�O��a�w��F����0��<�j�i��H�(x�h�lɀ��"�t��~,�S�6\9+ľ��x�Ǚ#Z�uz��_.�/�a�         Q  x���A�� E���@8�@v���APU��?�@*u�t$F���o����1Sjϵpq�1���1����'	���%G-���Eӱٍ4S��B���a+���rB	�A�$)�N�[,>?�V���r4���b�g��.%��f)�j�3���ί�\kv
4׃�НV{W�ts*]�%�-�9MG�pV���q�S�۴Q���AX�z�~w7%�s�ף���[m��
�:�klO��KQ釻9O[QX��_�Ps) � ٺ\��nُ_�
�鱬��螏�M�AH�+�U�c�\\┼;%�^��_~�r��s[��������>y�4.b�Y      -   �   x�u��
�0���)rl��M���m		A���9�#�C�83���[�Gy��PB�Wа�OHU���J����
�2�A0yH~�y���Zi&n�����r�F����,��l�C\��}Ii���cP5��݈M	!^8�      1   �   x�u�A�1��uz���%i�6�]��� �.~����+�B
Y��{	n�6�������9t��D<!�� ֳ����`}]�t^��9�1�E��n�E��'��D�.m-ZǦGf
��0�e{�D��}ѿrm��8��!&����U}i}�1sd�s�ojm=v'�����!���5����On      3   �   x�u��
�0��s�}��$M:�[dS��J����ϡ2q �wʏ?��Nzue��f�l�sD��t��h������.C�Y󥆱��!�p��`�az��Ɠ�z�Sd[F9�l�:��q�٭�:�m �nr:�bnCfW�:�k&0������Z�s�@�n�]��|fg���η�iGv���?UH         �   x�U��
�0�s�y�����Xo��Efs�e��v:D!�O೪�K�g��ι��M
�O�K����<q�TT�֬�!$jqh-��)`o\����[ӏ.\���@�t�eL. I��[���_��`��O����[�*)      +   %  x���ێ�0���S�rV�(�&�Y�4�P#��?�:@!ZMg��W�g������)��;4�m)t�8O��bz���i��#��|u�\�/w�P!*c+Y0�mi6��G 2����;�[:A{gO�=�D�vn׹Z3]pW�'8��o]m�*�b�@{�7�#=A7���*n�u*��z�7!M��u�R�WO��L8Bk�����>gR,�=n`��;(+)N��x�b
�c�f=[��Z(]dف�%=���0�T_��j+U^�?"�a�Vt�M�� �Pe�y%8�ƨ\�|��|b� ma��"L�8�Q����HOZ�����A��#�ȯ�b��?g�"d�;��!
��i����;Q�Z���I'�����fDbLN��%���_��8�I����L�l�7�3��:N��p\[��D|{�K��<NC�v��~�͋�c
=³	���������}��:�k����LY#�����`E��1�94h��?����-��°Rj�v�E�����ǒ�E�o�oPJ��~7^A�|1B�_��L�      %   S   x�3����S�,-.�,��4���!###]K]CCS+3+c=KscScNC�.CNM�ZL�LM�LMMM�!Z�b���� ���      )      x������ � �         �   x���=
�0����@�e�-�!B�v�"j������צ�й ��$ާ�9M>:�1H�p�������<'�&ϋgG�J\���)���ri�zV�<����ҺU}��4(��h�Z��
�N{������!oS�V��M�	�O�n�"ģ(.s<|�t�W`z���ck���MA�B��\Y         �   x���M��0F���@#�$�g���d�v���1a*U�!y�����6]�%*'�lE~�C��^�����B��F��z��a�v�1�T���tWs�nR��*Y�o�g>&��E�bO����?L}3�Q�,��u �`����Y�fQ3[���[HO��)�#�6�����Uؚ�,k{�J����$���z`�}8T���N|R-         |  x���[��0E��*���$�"�h0ȀZ-���1׆�F���$>"E��˧�Q����Qt�D)�Czt��[y|3J������<�ؐ*���>d�fʴ�E����1��)$�ܳ�)k��˜���S�g7Lԑ���$����S���m"�{�zJ�B���6�����:~P��5�G|�W�>�[�O�O�B�i��5�r�~�%%��+e�_�A-ξ��췖�~������n�V{�[0=M$[���@��m��(�¨�=�M�j�Ʊ{9��ޡJ=���L3�}Lt��,C;�'0����uӆ!�)t):���E7�paHZ����E�S���)��s4C<�F,�qK&��B�\[<5�%�f��!��B�e_<�:��7�"8����P���}�u�C�\�aJ��S�P�F3�|�������laJ� �n&�x���R�+&�y�ah���q�-��_ϐ$Xb�3��
cŴ�cJ�u�,�0|��/>����0��עK+_d��y�z�����q�v��u��3�z�1/�A����qUaK�ZG�g�eVaZ"�)��e�6ݰ}훶� �/8�B+&mv�7�\���-C�����Ԍ�w�0˰�.��E�(�L)         1  x��[ێ��}v���#l0���tP�@ �VK���q�|��gFZ��4�3gU��\�UE%^�6?�l��b�Ѝ������r�~���\gR���y���}�K#�L��L�falc[�n��3��a2O�Ż�n���n4����lC��Y͒]Ͳ[�ıJ|tϗLD+]��>�tb��4K��n��6/3e�}��^������4��������-7��8������7wj8Ud+��SF����3F��J'�[~*�%Jҟ9��p�(%��<�fq87Tɬ��'
w��䓩s0�ê�ɯ}�?����q>�������ƹ���/���qf�������[P��-ؿ�y��~�?-wr�ĳ��α���\o����q�.�k_���M7"3]��~��A8S
-��8�0_�T)j�ݖ���{nܿE�Oz0��	>n=�ɱ�2��o�s~3���]�3���nFG��FY�i=_���;�,�:�7�Ҝ}��p����Hy�g�u�����kN`4���~:0�(?��B��3�-��[����兺h�^\ǏԨ{	�(�у�0�V��B�޺%3T	ػ�Qr��qi_�� �ff=������١+�E��j�83t#Fs����խ�
t�73�%�{���6b��� � Ŷ����W8W�B|P��>z��
wuU�e�PdV��+M%�SZ�@��U%�y��k���*|��%�~��&����iR�t%8ly���9�:n'(�O^�������5�����IN��S�.�O���֧�+���Ss%8ݹNx{�ťn�m��h�W
�6��(ݺ�ea(	�K�ӟ7�A��u���c#Ȇ�Qf�A�A)DX%��|�G�C�C�R<��ϫ�QG2�:�n:���7��~�9�k�2R�m~������4���;���gq�4����ͥ�'KK-ò���-��V��ڭ�a-�� ����а@8j(��o��Z�#-s�9=Y���ĸ�s����D�wi�:���w���~tt�Xd �'���h`��/q���J��Y���n�A��,sM�d�0P]�и�eΞ~^}?���Ck���ҙ����/�+���q�*Rژ?�뇰�X\���E|�,�J��W>�������k��ĩ�u���/��t�DG��+�?�忤��5��<,k[O8�¡�+mMH���b��кKX,$�U�l��W����p%*�]k�F/X	d+������q,'��n1��XQ��������J<fJ����P[H�^8������[�|_��B|XPd�+W���%,(2X��>�WS��aUQ���J��"���O��9�� �f7�NOg �=�\�]�-�>�x��sHX]dx�#�- Q��̽*:�ӡ\IX_d�Yp�w�����ڰ����ktWV�GC㵟��X�$Ц�(�o���7�9Xkdp-8V���IQ�<Y��^<Aq�ɆfMy���x��v-}�z��ã���U%3�����l���� G�	���刹�!E�*$����,C2��B3Q�0`9�ԇ���%pH󼊂Fx��h�[r�k��	K��r���7X�d2X��3o���g��yV6��&�D�w��Sg �B�� r V:�B�~���0XT�T��,�{��l�#(��>�.���'��p��q�	˟�e|��HX�dʯ38dB b���3��������H�K���P��琰a���{v_��	d����pP	>�[���	�m�I�yp�뙌��iz[w΁MF+?��<6�MA�a�86S�R4�ʰ?$����X�w�3]`�5L��6�P0rЄ �4�G�T����Ѵ=|	f�V3�@��~%[��\��&0�����(x8���&Cyb��ZT�nX�d<�^�>����a���賕a��mT����<�`͓��Y�s�k�6�>m�=~FMk��.X��E��b��O�lQ�����˲opr�����^������<ɷ�gc�Gۈs����5���[������y���]��$�Fd��c��a_�בquRb���&�̉}� Ƣ7��Nr�Bh|�eN����=X�ν$�F��B&� :)V2�ߍxND��:��2Z�ͺ�Vt���<
��Fu�1q����Gu�Nw�Iܒ������$n�V��iƭ��F
�����<�>x��I
�&J&(�E���u��Fz�j�ڶ� ﴱ�&*N�����[Q?�Ƿ�)�y�C�vj[��:��xxK��.�;�n]� ��;�ly����ãd"��v�h�C����}P�J�aw��ID�ѳ�
HD��j��O
hJ��F�&ɥ��L[HN�\"©��ns�&E/�jPb:��q�z�oa����*��v��EC������|�p\��-��＆^7a���Ŭv'�o�*���%	<R���y�V��E�"�[�V��ESb�n!2aON�UĸƘ�g�n�����K]q7-aç8���s������9���o�$��6���G�J	ץ������K���t�iZ�~���N	�v(Ɠ�7=(��ȟT%��0�%M7�,�VqF�t��r E�H��g�Q^��>���.�wM��?r�Po���G���D	u7���}��rj��ʒ�.��W:%����ؚ����7X�/^��ǐTA��Ț�7���@�o4�����C�u�@�%&����(�z�D�5��|���%���M7��B3��'/y(h�}(�`�f�Iw4 ð��lBAH����hg")���ab~��H�byj�OM149�F������^�S����F��R%���4E����:����Az7~�4���7PC-p�vݯ>�@3���\̇[^PP�����.�ch�(�+D��DF�)�WN"�.��3��@�����c	4~���M_�,|9x�����a��#��~��TضW� >Z�P�S>:l�<ď�~:�<��ɋ/.n@���T�͞����	�s�(��S�F��B�-؏�B>���ц>l�\��#����?$ghv-���nuʊ_�0p6V����\.��àt         �   x�}�K�  �5����S�n�] -6|v��9D����j&yN�3b�}7΄�������b�58a�t�&�Ȯ��W��.��������?�6�&;���癬1�����pS���:\4{�S565��X�t ��W��6$�|��
:רj��R�.�mf         �   x�}�M�0�u{�^ 23���@�ݱ��c`A���+*�tj�]ߗy����=];���m����n��Qy�Q�)�0�ԕ�5u�ZpR��p���GĠ�:;0#4�6�t�Utj��Ͼ'�I���bׇTƨbV~>g�S����C�t��g����;�b�z燹����� ͛��Y�w
�����Ǵ�         }   x�m�;
A���^`��{��	�c��?�.(�NCe���c*�AZ�x�y˺���,R1��I� �Vڡo�VGF\�961c�j�c3��6;��b:ű��i��m�߆�lg���J�>L�      /   �   x�u�K
� ൞�e�P�1�N� ���!���!�ì����4m���Z^���{;�Q۠�pD��������.����v��'t��e�JR�{-���!K#^�EM��:�G�7���#�)�t�1s          i  x�}�]��  �g<X7���}#��(%��I���vb�(|3��`����Zn���G�k�_��`v�`{�����eu.k�Esi�z~y�B2��SBX6�۲�m�Y�=��[e�@���<C����SLf��v�5��d+�ܣ�q�Xg��%��2�f��&�wp��z�&����ݜ��uPt�i�d!���
��]t�27_0x\BӐM&��R��LP�M�_����=��1������Oh�G9=K�[J|��s��2X��E*��
�;g0Q�hakj�,��'v8�F[y��]Җ�ʁr8E�ri�\i�"Ջ2M�l!���T�]\٭�^h�C��(�_6���      "   �  x���ے�8�����v����N�-s,I�*���B�a����S������/X2�eZ��3]:�s��X�$K~w��8ϊ���L���G�����/�u���uf�}:�y�U�����_~/�� {z�(�|?���oڴZ�f�]V��qBL|��4f�_U|jlw�ͰJ
,��2m=��r�[J%.D�z�c�3��2/��4�&���$��:�����̼�H�jET���k�>6�
f��XNr�M��S_��C����g_�m��t�i��-Y�=�͵�dl#��f����2$����.�]�����;˨z��_�r^&ބO�~&ja0�,�Tx��T����Q.`b����#��ɶ��R�jR�U�8�!��`�3���a��;���('1��C��^]9���y[{�y�a�1�dlsYm'�'W��h@2�v�n��~Z�76 ���4ռ�r��nZ�}�r��WA�[d\�O���j��e7��[���;���xx�q��[�Q�l���ahkk�h8���[�+5�$�,��c[}0[l	;q��T�4v('Ͼ|��q#� ����F�Q�H�K���*�;N�����״�@`,�>┏�Jj83��ilN��3tv-s�s^$���:��䮱��)��)i5�%�a�9�q�%p����+��WN���_����ϱ��S�����p4D_��X�$��1�n��G���ͳ�X��5�/�g'+�,�r�й�>R�¥͹��`���]_�b��)��"���:��P0���`[�nc�)�E��
1o[��p%E�``��n
G�6�`��L7�+��"k�h2�o�M� �*�;i4|�+@�d1�d�
�e�����	�3U�N.ps��=@~h��0�d"��'166?�)���]��&ӆ� �����9�Ob��T!�k�{��v���i2HVj�p�u\��y83�JL y�K�F�\O�(f�<�����>���$3�T/�8&��R�`�Oh2{H ږ6:Pb���!C���)�j��c��ԡ��5�t�z�6[��&��b�&�/m�S_b�P�k2|(�3]� ��M~�Qy8�L��Xw����D�ݨ����3:m(	��Ώ��,2:J(���vX��2���'�b4��5^.��X{D��iA_�xr�s�:����N�q�n�#���:{�����.��f/8x'{����EspԴ�K�;�����d��>��y=E5F�L(Z \���e���Lf-�:L5��;��D�YB�����X��&����ԏEb�ɨ����!`�p�t�;j-4���}nwN��##B�A���l�q]`�ȈP0(�}[`��!�A�,����J�<���X���_��H�� K�cd�pR�W���1�dB)�7�����]��&SG���>+�*��������C-��     