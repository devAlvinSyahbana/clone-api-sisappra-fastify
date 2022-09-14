const fp = require("fastify-plugin");

const master_eselon = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as eselon, urutan_tingkat_eselon FROM master_eselon WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as eselon, urutan_tingkat_eselon FROM master_eselon WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_eselon = (eselon) => {
    let a = eselon;

    const query = db.one(
      "SELECT id, nama as eselon, urutan_tingkat_eselon FROM master_eselon WHERE nama ilike $1 AND is_deleted = 0",
      [a]
    );

    return query;
  };

  const create = async(eselon, urutan_tingkat_eselon, created_by) => {
    const query = db.one(
      "INSERT INTO master_eselon (nama, urutan_tingkat_eselon, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [eselon, urutan_tingkat_eselon, created_by]
    );

    return query;
  };


  const update = (id, eselon, urutan_tingkat_eselon, updated_by) => {
    db.one(
      "UPDATE master_eselon SET nama = $1, urutan_tingkat_eselon = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [eselon, updated_by, urutan_tingkat_eselon, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_eselon SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_eselon,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_eselon",
    master_eselon(fastify.db)
  );
  next();
});