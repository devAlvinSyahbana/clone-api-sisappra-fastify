const fp = require("fastify-plugin");

const status_sarana_prasarana = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, status_sarana_prasarana as status_sarana_prasarana FROM status_sarana_prasarana WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, status_sarana_prasarana as status_sarana_prasarana FROM status_sarana_prasarana WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_status_sarana_prasarana = (status_sarana_prasarana) => {
    const query = db.one(
      "SELECT id, status_sarana_prasarana as status_sarana_prasarana FROM status_sarana_prasarana WHERE status_sarana_prasarana ilike $1 AND is_deleted = 0",
      [status_sarana_prasarana]
    );

    return query;
  };

  const create = async(status_sarana_prasarana, created_by) => {
    const query = db.one(
      "INSERT INTO status_sarana_prasarana (status_sarana_prasarana, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
      [status_sarana_prasarana, created_by]
    );

    return query;
  };


  const update = (id, status_sarana_prasarana, updated_by) => {
    db.one(
      "UPDATE status_sarana_prasarana SET status_sarana_prasarana = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [status_sarana_prasarana, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE status_sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, status_sarana_prasarana as status_sarana_prasarana FROM status_sarana_prasarana WHERE is_deleted = 0 AND status_sarana_prasarana ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_status_sarana_prasarana,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "status_sarana_prasarana",
    status_sarana_prasarana(fastify.db)
  );
  next();
});