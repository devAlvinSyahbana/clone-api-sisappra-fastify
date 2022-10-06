const fp = require("fastify-plugin");

const struktur_data_hirarki = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, level, sub_level, id_relasi_hirarki, kategori FROM struktur_data_hirarki WHERE is_deleted = 0 ORDER BY level DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, level, sub_level, id_relasi_hirarki, kategori FROM struktur_data_hirarki WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_sub_level = (sub_level) => {
    const query = db.one(
      "SELECT id, level, sub_level, id_relasi_hirarki, kategori FROM struktur_data_hirarki WHERE sub_level ilike '%" + sub_level + "%' AND is_deleted = 0",
    );

    return query;
  };

  const create = async(level, sub_level, id_relasi_hirarki, kategori, created_by) => {
    const query = db.one(
      "INSERT INTO struktur_data_hirarki (level, sub_level, id_relasi_hirarki, kategori, is_deleted, created_by) VALUES ($1, $2, $3, $4, 0, $5) RETURNING id",
      [level, sub_level, id_relasi_hirarki, kategori, created_by]
    );

    return query;
  };


  const update = (id, level, sub_level, id_relasi_hirarki, kategori, updated_by) => {
    db.one(
      "UPDATE struktur_data_hirarki SET level = $1, sub_level = $2, id_relasi_hirarki = $3, kategori = $4, updated_by = $5, updated_at = CURRENT_TIMESTAMP WHERE id = $6 RETURNING id",
      [level, sub_level, id_relasi_hirarki, kategori, updated_by, id]
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
    findone_by_sub_level,
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