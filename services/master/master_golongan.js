const fp = require("fastify-plugin");

const master_golongan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, urutan_tingkat_golongan, nama as golongan FROM master_golongan WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, urutan_tingkat_golongan, nama as golongan FROM master_golongan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_golongan = (golongan) => {
    const query = db.one(
      "SELECT id, urutan_tingkat_golongan, nama as golongan FROM master_golongan WHERE nama ilike $1 AND is_deleted = 0",
      [golongan]
    );

    return query;
  };

  const create = async(golongan, urutan_tingkat_golongan, created_by) => {
    const query = db.one(
      "INSERT INTO master_golongan (nama, urutan_tingkat_golongan, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [golongan, urutan_tingkat_golongan, created_by]
    );

    return query;
  };


  const update = (id, golongan, urutan_tingkat_golongan, updated_by) => {
    db.one(
      "UPDATE master_golongan SET nama = $1, urutan_tingkat_golongan = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [golongan, urutan_tingkat_golongan, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_golongan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as golongan, urutan_tingkat_golongan FROM master_golongan WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_golongan,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_golongan",
    master_golongan(fastify.db)
  );
  next();
});