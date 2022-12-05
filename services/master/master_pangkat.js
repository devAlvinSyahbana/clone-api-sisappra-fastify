const fp = require("fastify-plugin");

const master_pangkat = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as pangkat FROM master_pangkat WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as pangkat FROM master_pangkat WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_pangkat = (pangkat) => {
    const query = db.one(
      "SELECT id, nama as pangkat FROM master_pangkat WHERE nama ilike $1 AND is_deleted = 0",
      [pangkat]
    );

    return query;
  };

  const create = async(pangkat, created_by) => {
    const query = db.one(
      "INSERT INTO master_pangkat (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [pangkat, created_by]
    );

    return query;
  };


  const update = (id, pangkat, updated_by) => {
    db.one(
      "UPDATE master_pangkat SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [pangkat, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_pangkat SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as pangkat FROM master_pangkat WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_pangkat,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_pangkat",
    master_pangkat(fastify.db)
  );
  next();
});