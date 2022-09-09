PGDMP     /                    z         
   dbsisappra    14.5    14.5 	    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    17355 
   dbsisappra    DATABASE     m   CREATE DATABASE dbsisappra WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
    DROP DATABASE dbsisappra;
                postgres    false            �            1259    17420    laporan_kegiatan    TABLE     �  CREATE TABLE public.laporan_kegiatan (
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
       public         heap    postgres    false            �            1259    17427    laporan_kegiatan_id_seq    SEQUENCE     �   ALTER TABLE public.laporan_kegiatan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.laporan_kegiatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            s          0    17420    laporan_kegiatan 
   TABLE DATA           <  COPY public.laporan_kegiatan (id, pelaksana_bidang_wilayah, tindak_lanjut, administrasi, peringatan, is_deleted, deleted_by, deleted_at, created_by, created_at, updated_by, updated_at, penutupan_atau_penyegelan, pencabutan_izin, yang_lainnya, denda, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pecabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam) FROM stdin;
    public          postgres    false    224   �       {           0    0    laporan_kegiatan_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.laporan_kegiatan_id_seq', 4, true);
          public          postgres    false    225            �           2606    17665 &   laporan_kegiatan laporan_kegiatan_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.laporan_kegiatan
    ADD CONSTRAINT laporan_kegiatan_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.laporan_kegiatan DROP CONSTRAINT laporan_kegiatan_pkey;
       public            postgres    false    224            s   �   x�Ő�
�@�뽧�����i#X�N�jzz���cb��u�ea�faf���w�M����3�>1(h�@HT�/�HQ���$��}Ce"�}E��:�
v���O�� ���K�#Dt�"�,����:��qڇ�3Cj�t�r
��f�Bi�5.��
e':V���̚��B�����     