const fp = require("fastify-plugin");

const master_golongan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as golongan FROM master_golongan WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as golongan FROM master_golongan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_golongan = (golongan) => {
    let a = "%" + golongan;

    const query = db.one(
      "SELECT id, nama as golongan FROM master_golongan WHERE nama ilike $1 AND is_deleted = 0",
      [a]
    );

    return query;
  };

  const create = async(golongan, created_by) => {
    const query = db.one(
      "INSERT INTO master_golongan (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [golongan, created_by]
    );

    return query;
  };


  const update = (id, golongan, updated_by) => {
    db.one(
      "UPDATE master_golongan SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [golongan, updated_by, id]
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

  return {
    find,
    findone,
    findone_by_golongan,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_golongan",
    master_golongan(fastify.db)
  );
  next();
});