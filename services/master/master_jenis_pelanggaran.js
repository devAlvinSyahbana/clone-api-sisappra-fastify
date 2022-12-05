const fp = require("fastify-plugin");

const master_jenis_pelanggaran = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_pelanggaran, kode_penertiban FROM master_jenis_pelanggaran WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_pelanggaran, kode_penertiban FROM master_jenis_pelanggaran WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_kode_penertiban = (kode_penertiban) => {
    const query = db.any(
      "SELECT id, nama as jenis_pelanggaran, kode_penertiban FROM master_jenis_pelanggaran WHERE kode_penertiban ilike $1 AND is_deleted = 0",
      [kode_penertiban]
    );

    return query;
  };

  const create = async(jenis_pelanggaran, kode_penertiban, created_by) => {
    const query = db.one(
      "INSERT INTO master_jenis_pelanggaran (nama, kode_penertiban, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [jenis_pelanggaran, kode_penertiban, created_by]
    );

    return query;
  };


  const update = (id, jenis_pelanggaran, kode_penertiban, updated_by) => {
    db.one(
      "UPDATE master_jenis_pelanggaran SET nama = $1, kode_penertiban = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [jenis_pelanggaran, kode_penertiban, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_pelanggaran SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_kode_penertiban,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_pelanggaran",
    master_jenis_pelanggaran(fastify.db)
  );
  next();
});
