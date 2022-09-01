const fp = require("fastify-plugin");

const laporan_tamu_daerah = (db) => {
  const create = async (tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan) => {

    const { id } = await db.one(
      "INSERT INTO laporan_tamu_daerah (id_kota, id_kelurahan, id_kecamatan, tamu_daerah, tanggal) VALUES ($1, $2, $3, $4, $5) RETURNING id",
      [tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan]
    );

    return { tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan FROM laporan_tamu_daerah WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan) => {
    db.one(
      "UPDATE laporan_tamu_daerah SET tanggal_kunjungan = $1, waktu_mulai_kunjungan = $2, asal_instansi = $3, jml_pengunjung = $4, maksud_dan_tujuan = $5, pejabat_penerima_kunjungan = $6, tempat_kunjungan = $7, updated_at CURRENT_TIMESTAMP WHERE id = $8 RETURNING id",
      [tanggal_kunjungan, waktu_mulai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE laporan_tamu_daerah SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
  fastify.decorate("laporan_tamu_daerah", laporan_tamu_daerah(fastify.db));
  next();
});
