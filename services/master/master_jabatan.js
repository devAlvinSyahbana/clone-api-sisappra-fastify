const fp = require("fastify-plugin");

const master_jabatan = (db) => {
  const find = (limit, offset, qwhere) => {
    const query = db.any(
      `SELECT id, nama as jabatan, kode, status, id_master_tempat_seksi_pelaksanaan, level FROM master_jabatan WHERE is_deleted = 0${qwhere} ORDER BY created_at DESC LIMIT ${limit} OFFSET ${
        parseInt(offset) - 1
      }`
    );

    return query;
  };

  const countAll = (qwhere) => {
    const query = db.one(
      `SELECT COUNT(id) as total_data FROM master_jabatan WHERE is_deleted = 0${qwhere}`
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jabatan, kode, status, id_master_tempat_seksi_pelaksanaan, level FROM master_jabatan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jabatan = (jabatan) => {
    const query = db.one(
      "SELECT id, nama as jabatan, kode, status, id_master_tempat_seksi_pelaksanaan, level FROM master_jabatan WHERE nama ilike $1 AND is_deleted = 0",
      [jabatan]
    );

    return query;
  };

  const create = async (
    nama,
    status,
    level,
    id_master_tempat_seksi_pelaksanaan,
    created_by
  ) => {
    const { max } = await db.one("SELECT MAX(id) FROM master_jabatan");

    let a = "";
    if (max == undefined) {
      a = "JBT1";
    } else {
      a = "JBT" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO master_jabatan (nama, kode, status, created_by, level, id_master_tempat_seksi_pelaksanaan) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
      [
        nama,
        a,
        status,
        created_by,
        level && level !== "" ? level : a,
        id_master_tempat_seksi_pelaksanaan,
      ]
    );

    return query;
  };

  const update = (id, values) => {
    db.one(
      `UPDATE master_jabatan SET${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jabatan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id,
    };
  };

  const filter = (qwhere) => {
    const query = db.any(
      `SELECT id, nama as jabatan FROM master_jabatan WHERE is_deleted = 0${qwhere}`
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_jabatan,
    create,
    update,
    del,
    filter,
    countAll,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("master_jabatan", master_jabatan(fastify.db));
  next();
});
