const fp = require("fastify-plugin");

const laporan_tamu_daerah = (db) => {
  const create = async (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan) => {

    const { id } = await db.one(
      "INSERT INTO laporan_tamu_daerah (tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id",
      [tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan]
    );

    return { tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan FROM laporan_tamu_daerah WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan FROM laporan_tamu_daerah WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan) => {
    db.one(
      "UPDATE laporan_tamu_daerah SET tanggal_kunjungan = $1, waktu_mulai_kunjungan = $2, waktu_selesai_kunjungan = $3, asal_instansi = $4, jml_pengunjung = $5, maksud_dan_tujuan = $6, pejabat_penerima_kunjungan = $7, tempat_kunjungan = $8, pelaksanaan = $9, updated_at = CURRENT_TIMESTAMP WHERE id = $10 RETURNING id",
      [tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan, id]
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
