const fp = require("fastify-plugin");

const master_jenis_korban_material = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_korban_material FROM master_jenis_korban_material WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_korban_material FROM master_jenis_korban_material WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_korban_material = (jenis_korban_material) => {
    const query = db.one(
      "SELECT id, nama as jenis_korban_material FROM master_jenis_korban_material WHERE nama ilike $1 AND is_deleted = 0",
      [jenis_korban_material]
    );

    return query;
  };

  const create = async(jenis_korban_material, created_by) => {
    const query = db.one(
      "INSERT INTO master_jenis_korban_material (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [jenis_korban_material, created_by]
    );

    return query;
  };


  const update = (id, jenis_korban_material, updated_by) => {
    db.one(
      "UPDATE master_jenis_korban_material SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jenis_korban_material, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_korban_material SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as jenis_korban_material FROM master_jenis_korban_material WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_jenis_korban_material,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_korban_material",
    master_jenis_korban_material(fastify.db)
  );
  next();
});