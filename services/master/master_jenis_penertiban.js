const fp = require("fastify-plugin");

const master_jenis_penertiban = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_penertiban = (jenis_penertiban) => {
    const query = db.one(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE nama ilike $1 AND is_deleted = 0",
      [jenis_penertiban]
    );

    return query;
  };

  const create = async(jenis_penertiban, kode, created_by) => {
    const query = await db.one(
      "INSERT INTO master_jenis_penertiban (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [jenis_penertiban, kode, created_by]
    );

    return query;
  };


  const update = (id, jenis_penertiban, kode, updated_by) => {
    db.one(
      "UPDATE master_jenis_penertiban SET nama = $1, kode = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [jenis_penertiban, kode, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_penertiban SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as jenis_penertiban FROM master_jenis_penertiban WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_jenis_penertiban,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_penertiban",
    master_jenis_penertiban(fastify.db)
  );
  next();
});