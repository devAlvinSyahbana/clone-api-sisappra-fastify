const fp = require("fastify-plugin");

const master_skpd = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as skpd, kode FROM master_skpd WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as skpd, kode FROM master_skpd WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_skpd = (skpd) => {
    const query = db.one(
      "SELECT id, nama as skpd, kode FROM master_skpd WHERE nama ilike $1 AND is_deleted = 0",
      [skpd]
    );

    return query;
  };

  const create = async(skpd, created_by) => {
 
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_skpd"
    );

    let a = "";
    if (max == undefined ) {
      a = "SKPD1";
    } else {
      a = "SKPD" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO master_skpd (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [skpd, a, created_by]
    );

    return query;
  };


  const update = (id, skpd, updated_by) => {
    db.one(
      "UPDATE master_skpd SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [skpd, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_skpd SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as skpd, kode FROM master_skpd WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };


  return {
    find,
    findone,
    findone_by_skpd,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_skpd",
    master_skpd(fastify.db)
  );
  next();
});