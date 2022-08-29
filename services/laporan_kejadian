const fp = require("fastify-plugin");

const laporan_kejadian = (db) => {
  const create = async (id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal) => {

    const { id } = await db.one(
      "INSERT INTO laporan_kejadian (id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal) VALUES ($1, $2, $3, $4, $5) RETURNING id",
      [id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal]
    );

    return { id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal FROM laporan_kejadian WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal FROM laporan_kejadian WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal) => {
    db.one(
      "UPDATE laporan_kejadian SET id_kota = $1, id_kelurahan = $2, id_kecamatan = $3, kejadian $4, tanggal = $5, updated_at = CURRENT_TIMESTAMP WHERE id = $6 RETURNING id",
      [id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal, id]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE laporan_kejadian SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
  fastify.decorate("laporan_kejadian", laporan_kejadian(fastify.db));
  next();
});
