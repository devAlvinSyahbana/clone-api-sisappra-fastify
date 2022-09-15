const fp = require("fastify-plugin");

const master_jenis_korban_jiwa = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_korban_jiwa FROM master_jenis_korban_jiwa WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_korban_jiwa FROM master_jenis_korban_jiwa WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_korban_jiwa = (jenis_korban_jiwa) => {
    const query = db.one(
      "SELECT id, nama as jenis_korban_jiwa FROM master_jenis_korban_jiwa WHERE nama ilike $1 AND is_deleted = 0",
      [jenis_korban_jiwa]
    );

    return query;
  };

  const create = async(jenis_korban_jiwa, created_by) => {
    const query = db.one(
      "INSERT INTO master_jenis_korban_jiwa (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [jenis_korban_jiwa, created_by]
    );

    return query;
  };


  const update = (id, jenis_korban_jiwa, updated_by) => {
    db.one(
      "UPDATE master_jenis_korban_jiwa SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jenis_korban_jiwa, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_korban_jiwa SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_jenis_korban_jiwa,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_korban_jiwa",
    master_jenis_korban_jiwa(fastify.db)
  );
  next();
});