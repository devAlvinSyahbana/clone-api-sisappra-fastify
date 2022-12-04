const fp = require("fastify-plugin");

const master_status_kenaikan_pangkat = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as status_kenaikan_pangkat FROM master_status_kenaikan_pangkat WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as status_kenaikan_pangkat, masa_naik_pangkat FROM master_status_kenaikan_pangkat WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_status_kenaikan_pangkat = (status_kenaikan_pangkat) => {
    const query = db.one(
      "SELECT id, nama as status_kenaikan_pangkat, masa_naik_pangkat FROM master_status_kenaikan_pangkat WHERE nama ilike $1 AND is_deleted = 0",
      [status_kenaikan_pangkat]
    );

    return query;
  };

  const create = async(status_kenaikan_pangkat, masa_naik_pangkat, created_by) => {
    const query = db.one(
      "INSERT INTO master_status_kenaikan_pangkat (nama, masa_naik_pangkat, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [status_kenaikan_pangkat, masa_naik_pangkat, created_by]
    );

    return query;
  };


  const update = (id, status_kenaikan_pangkat, masa_naik_pangkat, updated_by) => {
    db.one(
      "UPDATE master_status_kenaikan_pangkat SET nama = $1, masa_naik_pangkat = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [status_kenaikan_pangkat, masa_naik_pangkat, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_status_kenaikan_pangkat SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as status_kenaikan_pangkat, masa_naik_pangkat FROM master_status_kenaikan_pangkat WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_status_kenaikan_pangkat,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_status_kenaikan_pangkat",
    master_status_kenaikan_pangkat(fastify.db)
  );
  next();
});