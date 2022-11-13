const fp = require("fastify-plugin");

const master_sumber_informasi = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as sumber_informasi FROM master_sumber_informasi WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as sumber_informasi FROM master_sumber_informasi WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_sumber_informasi = (sumber_informasi) => {
    const query = db.one(
      "SELECT id, nama as sumber_informasi FROM master_sumber_informasi WHERE nama ilike $1 AND is_deleted = 0",
      [sumber_informasi]
    );

    return query;
  };

  const create = async(sumber_informasi, created_by) => {
    const query = db.one(
      "INSERT INTO master_sumber_informasi (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [sumber_informasi, created_by]
    );

    return query;
  };


  const update = (id, sumber_informasi, updated_by) => {
    db.one(
      "UPDATE master_sumber_informasi SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [sumber_informasi, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_sumber_informasi SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as sumber_informasi FROM master_sumber_informasi WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_sumber_informasi,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_sumber_informasi",
    master_sumber_informasi(fastify.db)
  );
  next();
});