const fp = require("fastify-plugin");

const laporan_pengawasan = (db) => {
  const create = async (tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan) => {

    const { id } = await db.one(
      "INSERT INTO laporan_pengawasan (tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
      [tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan]
    );

    return {tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan};
  };

  const find = () => {
    const query = db.any(
      "SELECT tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan FROM laporan_pengawasan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan FROM laporan_pengawasan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan) => {
    db.one(
      "UPDATE laporan_pengawasan SET tanggal_pelaporan = $1, id_kota = $2, id_kecamatan = $3, id_kelurahan $4, deskripsi = $5, id_jenis_pengawasan = $6 updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
      [tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan, id]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE laporan_pengawasan SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
  fastify.decorate("laporan_pengawasan", laporan_pengawasan(fastify.db));
  next();
});
