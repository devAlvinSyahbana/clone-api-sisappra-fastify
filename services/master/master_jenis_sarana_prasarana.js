const fp = require("fastify-plugin");

const sarana_prasarana = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as sarana_prasarana FROM sarana_prasarana WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as sarana_prasarana FROM sarana_prasarana WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_sarana_prasarana = (sarana_prasarana) => {
    const query = db.one(
      "SELECT id, nama as sarana_prasarana FROM sarana_prasarana WHERE nama ilike $1 AND is_deleted = 0",
      [sarana_prasarana]
    );

    return query;
  };

  const create = async(sarana_prasarana, created_by) => {
    const query = db.one(
      "INSERT INTO sarana_prasarana (nama, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [sarana_prasarana, created_by]
    );

    return query;
  };


  const update = (id, sarana_prasarana, updated_by) => {
    db.one(
      "UPDATE sarana_prasarana SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [sarana_prasarana, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
    findone_by_sarana_prasarana,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "sarana_prasarana",
    sarana_prasarana(fastify.db)
  );
  next();
});