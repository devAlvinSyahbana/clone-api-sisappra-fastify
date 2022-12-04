const fp = require("fastify-plugin");

const master_jenis_perda_perkada = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, judul, deskripsi FROM master_jenis_perda_perkada WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, judul, deskripsi FROM master_jenis_perda_perkada WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_perda_perkada = (judul, deskripsi) => {
    if (judul == undefined){judul = ""}
    if (deskripsi == undefined){deskripsi = ""}

    let a = "%" + judul;
    let b = "%" + deskripsi;

    const query = db.any(
      "SELECT id, judul, deskripsi FROM master_jenis_perda_perkada WHERE judul ilike $1 AND deskripsi ilike $2 AND is_deleted = 0",
      [a, b]
    );

    return query;
  };

  const create = async(judul, deskripsi, created_by) => {

    const query = db.one(
      "INSERT INTO master_jenis_perda_perkada (judul, deskripsi, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [judul, deskripsi, created_by]
    );

    return query;
  };


  const update = (id, judul, deskripsi, updated_by) => {
    db.one(
      "UPDATE master_jenis_perda_perkada SET judul = $1,  deskripsi = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [judul, deskripsi, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_perda_perkada SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as status_sarana_prasarana FROM status_sarana_prasarana WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_jenis_perda_perkada,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_perda_perkada",
    master_jenis_perda_perkada(fastify.db)
  );
  next();
});