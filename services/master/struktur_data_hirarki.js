const fp = require("fastify-plugin");

const struktur_data_hirarki = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, parent_id, nama, jabatan, tim FROM struktur_data_hirarki WHERE is_deleted = 0 order by id asc",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, parent_id, nama, jabatan, tim FROM struktur_data_hirarki WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const find_by_parent_id = (parent_id) => {
    const query = db.any(
      "SELECT id, parent_id, nama, jabatan, tim FROM struktur_data_hirarki WHERE parent_id = " + parent_id + "AND is_deleted = 0 order by id asc"
    );

    return query;
  };

  const create = async (parent_id, nama, jabatan, tim, created_by) => {
    const query = db.one(
      "INSERT INTO struktur_data_hirarki (parent_id, nama, jabatan, tim, is_deleted, created_by) VALUES ($1, $2, $3, $4, 0, $5) RETURNING id",
      [parent_id, nama, jabatan, tim, created_by]
    );

    return query;
  };


  const update = (id, parent_id, nama, jabatan, tim, updated_by) => {
    db.one(
      "UPDATE struktur_data_hirarki SET parent_id = $1, nama = $2, jabatan = $3, tim = $4, updated_by = $5, updated_at = CURRENT_TIMESTAMP WHERE id = $6 RETURNING id",
      [parent_id, nama, jabatan, tim, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE struktur_data_hirarki SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    find_by_parent_id,
    create,
    update,
    del
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "struktur_data_hirarki",
    struktur_data_hirarki(fastify.db)
  );
  next();
});