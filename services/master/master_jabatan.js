const fp = require("fastify-plugin");

const master_jabatan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jabatan, kode, status FROM master_jabatan WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jabatan, kode, status FROM master_jabatan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jabatan = (jabatan) => {
    const query = db.one(
      "SELECT id, nama as jabatan, kode, status FROM master_jabatan WHERE nama ilike $1 AND is_deleted = 0",
      [jabatan]
    );

    return query;
  };

  const create = async(jabatan, status, created_by) => {
    const { max } = await db.one(
        "SELECT MAX(id) FROM master_jabatan"
      );

      let a = "";
      if (max == undefined ) {
        a = "JBT1";
      } else {
        a = "JBT" + (parseInt(max) + 1);
      }

    const query = db.one(
      "INSERT INTO master_jabatan (nama, kode, status, is_deleted, created_by) VALUES ($1, $2, $3, 0, $4) RETURNING id",
      [jabatan, a, status, created_by]
    );

    return query;
  };


  const update = (id, jabatan, status, updated_by) => {
    db.one(
      "UPDATE master_jabatan SET nama = $1, status = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [jabatan, status, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jabatan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as jabatan FROM master_jabatan WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
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
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jabatan",
    master_jabatan(fastify.db)
  );
  next();
});