const fp = require("fastify-plugin");

const master_kota = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as kota, kode FROM master_kota WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as kota, kode FROM master_kota WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_kota = (kota) => {
    const query = db.one(
      "SELECT id, nama as kota, kode FROM master_kota WHERE nama ilike $1 AND is_deleted = 0",
      [kota]
    );

    return query;
  };

  const create = async(kota, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_kota"
    );

    let a = "";
    if (max == undefined ) {
      a = "KOBA1";
    } else {
      a = "KOBA" + (parseInt(max) + 1);
    }


    const query = db.one(
      "INSERT INTO master_kota (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [kota, a, created_by]
    );

    return query;
  };


  const update = (id, kota, updated_by) => {
    db.one(
      "UPDATE master_kota SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [kota, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_kota SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as kota, kode FROM master_kota WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_kota,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_kota",
    master_kota(fastify.db)
  );
  next();
});