const fp = require("fastify-plugin");

const master_agama = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as agama FROM master_agama WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as agama FROM master_agama WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_agama = (agama) => {
    const query = db.one(
      "SELECT id, nama as agama FROM master_agama WHERE nama ilike $1 AND is_deleted = 0",
      [agama]
    );

    return query;
  };

  const create = async(agama, created_by) => {
    const query = db.one(
      "INSERT INTO master_agama (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [agama, created_by]
    );

    return query;
  };


  const update = (id, agama, updated_by) => {
    db.one(
      "UPDATE master_agama SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [agama, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_agama SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as agama FROM master_agama WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_agama,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_agama",
    master_agama(fastify.db)
  );
  next();
});