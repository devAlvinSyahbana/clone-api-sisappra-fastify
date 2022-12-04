const fp = require("fastify-plugin");

const master_tempat_seksi_pelaksanaan = (db) => {
  const find = () => {
    const query = db.any(
      `SELECT a.id, a.nama, a.kode, b.nama as group FROM master_tempat_seksi_pelaksanaan a LEFT JOIN master_tempat_pelaksanaan b ON b.id = a.id_tempat_pelaksanaan WHERE a.is_deleted = 0 ORDER BY a.created_at DESC`
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama, kode, id_tempat_pelaksanaan FROM master_tempat_seksi_pelaksanaan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const create = async (skpd, id_tempat_pelaksanaan, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_tempat_seksi_pelaksanaan"
    );

    let a = "";
    if (max == undefined) {
      a = "PLSK1";
    } else {
      a = "PLSK" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO master_tempat_seksi_pelaksanaan (nama, kode, is_deleted, created_by, id_tempat_pelaksanaan) VALUES ($1, $2, 0, $3, $4) RETURNING id",
      [skpd, a, created_by, id_tempat_pelaksanaan]
    );

    return query;
  };

  const update = (id, skpd, updated_by, id_tempat_pelaksanaan) => {
    db.one(
      "UPDATE master_tempat_seksi_pelaksanaan SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP, id_tempat_pelaksanaan = $4 WHERE id = $3 RETURNING id",
      [skpd, updated_by, id, id_tempat_pelaksanaan]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_tempat_seksi_pelaksanaan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id,
    };
  };

  const filter = (qwhere) => {
    const query = db.any(
      `SELECT id, nama, kode, id_tempat_pelaksanaan FROM master_tempat_seksi_pelaksanaan WHERE is_deleted = 0${qwhere}`
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
    "master_tempat_seksi_pelaksanaan",
    master_tempat_seksi_pelaksanaan(fastify.db)
  );
  next();
});
