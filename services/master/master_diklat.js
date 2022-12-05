const fp = require("fastify-plugin");

const master_diklat = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as diklat FROM master_diklat WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as diklat FROM master_diklat WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_diklat = (diklat) => {
    const query = db.one(
      "SELECT id, nama as diklat FROM master_diklat WHERE nama ilike $1 AND is_deleted = 0",
      [diklat]
    );

    return query;
  };

  const create = async(diklat, created_by) => {
    const query = db.one(
      "INSERT INTO master_diklat (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [diklat, created_by]
    );

    return query;
  };


  const update = (id, diklat, updated_by) => {
    db.one(
      "UPDATE master_diklat SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [diklat, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_diklat SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as diklat FROM master_diklat WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_diklat,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_diklat",
    master_diklat(fastify.db)
  );
  next();
});