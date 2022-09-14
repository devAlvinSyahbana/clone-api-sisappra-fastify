const fp = require("fastify-plugin");

const master_pendidikan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, urutan_tingkat_pendidikan, nama as pendidikan FROM master_pendidikan WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, urutan_tingkat_pendidikan, nama as pendidikan FROM master_pendidikan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_pendidikan = (pendidikan) => {
    let a = pendidikan;

    const query = db.one(
      "SELECT id, urutan_tingkat_pendidikan,  nama as pendidikan FROM master_pendidikan WHERE nama ilike $1 AND is_deleted = 0",
      [a]
    );

    return query;
  };

  const create = async(pendidikan, urutan_tingkat_pendidikan, created_by) => {
    const query = db.one(
      "INSERT INTO master_pendidikan (nama, urutan_tingkat_pendidikan, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [pendidikan, urutan_tingkat_pendidikan, created_by]
    );

    return query;
  };


  const update = (id, pendidikan, urutan_tingkat_pendidikan, updated_by) => {
    db.one(
      "UPDATE master_pendidikan SET nama = $1, urutan_tingkat_pendidikan = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [pendidikan, urutan_tingkat_pendidikan, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_pendidikan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_pendidikan,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_pendidikan",
    master_pendidikan(fastify.db)
  );
  next();
});