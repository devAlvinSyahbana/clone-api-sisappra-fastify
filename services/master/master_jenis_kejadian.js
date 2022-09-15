const fp = require("fastify-plugin");

const master_jenis_kejadian = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_kejadian FROM master_jenis_kejadian WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_kejadian FROM master_jenis_kejadian WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_kejadian = (jenis_kejadian) => {
    let a = "%" + jenis_kejadian;

    const query = db.one(
      "SELECT id, nama as jenis_kejadian FROM master_jenis_kejadian WHERE nama ilike $1 AND is_deleted = 0",
      [a]
    );

    return query;
  };

  const create = async(jenis_kejadian, created_by) => {
    const query = db.one(
      "INSERT INTO master_jenis_kejadian (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [jenis_kejadian, created_by]
    );

    return query;
  };


  const update = (id, jenis_kejadian, updated_by) => {
    db.one(
      "UPDATE master_jenis_kejadian SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jenis_kejadian, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_kejadian SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_jenis_kejadian,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_kejadian",
    master_jenis_kejadian(fastify.db)
  );
  next();
});