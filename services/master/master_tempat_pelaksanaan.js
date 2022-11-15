const fp = require("fastify-plugin");

const master_tempat_pelaksanaan = (db) => {
  const find = () => {
    const query = db.any(
      "SELECT id, nama, kode, kategori FROM master_tempat_pelaksanaan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama, kode, kategori FROM master_tempat_pelaksanaan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const create = async (nama, kategori, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_tempat_pelaksanaan"
    );

    let a = "";
    if (max == undefined) {
      a = "PLBK1";
    } else {
      a = "PLBK" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO master_tempat_pelaksanaan (nama, kode, is_deleted, created_by, kategori) VALUES ($1, $2, 0, $3, $4) RETURNING id",
      [nama, a, created_by, kategori]
    );

    return query;
  };

  const update = (id, nama, updated_by, kategori) => {
    db.one(
      "UPDATE master_tempat_pelaksanaan SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP, kategori = $4 WHERE id = $3 RETURNING id",
      [nama, updated_by, id, kategori]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_tempat_pelaksanaan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id,
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama, kode, kategori FROM master_tempat_pelaksanaan WHERE is_deleted = 0 AND nama ILIKE '%" +
        q +
        "%'"
    );

    return query;
  };

  return {
    find,
    findone,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_tempat_pelaksanaan",
    master_tempat_pelaksanaan(fastify.db)
  );
  next();
});
