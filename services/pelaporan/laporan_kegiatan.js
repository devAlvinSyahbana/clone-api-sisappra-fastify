const fp = require("fastify-plugin");

const laporan_kegiatan = (db) => {
  const create = async (pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan) => {

    const { id } = await db.one(
      "INSERT INTO laporan_kegiatan (pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $13, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35) RETURNING id",
      [pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan]
    );

    return { pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan FROM laporan_kegiatan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan FROM laporan_kegiatan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan) => {
    db.one(
      "UPDATE laporan_kegiatan SET pelaksana_bidang_wilayah = $1, keterangan = $2, penghalauan = $3, pembubaran = $4, pengusiran = $5, teguran_tertulis = $6, penyegelan = $7, penghentian_kegiatan = $8, pembongkaran = $9, ditertibkan = $10, bongkar_sendiri = $11, pemusnahan = $12, pencabutan_izin = $13, pembekuan_sementara_izin = $14, razia = $15, penjemputan = $16, penangkapan = $17, penyitaan = $18, pembersihan = $19, pencopotan_pelepasan_pencabutan = $20, penyidikan = $21, kerja_sosial = $22, denda_administratif = $23, terbit_izin = $24, dikembalikan = $25, belum_diterbitkan = $26, lain_lain = $27, tidak_ditemukan = $28, pengadilan_yustisi = $29, non_pengadilan = $30, penghentian_kegiatan_sementara_1x24jam = $31, penghentian_kegiatan_sementara_3x24jam = $32, penghentian_kegiatan_sementara_7x24jam = $33, jumlah_pengawasan_dan_penindakan = $34, peringatan = $35 updated_at = CURRENT_TIMESTAMP WHERE id = $36 RETURNING id",
      [pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan, id]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE laporan_kegiatan SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return { id };
  };

  return {
    create,
    find,
    findone,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("laporan_kegiatan", laporan_kegiatan(fastify.db));
  next();
});
