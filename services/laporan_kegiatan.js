const fp = require("fastify-plugin");

const laporan_kegiatan = (db) => {
  const create = async (id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal) => {

    const { id } = await db.one(
      "INSERT INTO laporan_kegiatan (id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal) VALUES ($1, $2, $3, $4, $5) RETURNING id",
      [id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal]
    );

    return { id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal FROM laporan_kegiatan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal FROM laporan_kegiatan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal) => {
    db.one(
      "UPDATE laporan_kegiatan SET id_kota = $1, id_kelurahan = $2, id_kecamatan = $3, kegiatan $4, tanggal = $5, updated_at = CURRENT_TIMESTAMP WHERE id = $6 RETURNING id",
      [id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal, id]
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
