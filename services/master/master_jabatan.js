const fp = require("fastify-plugin");

const master_jabatan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jabatan, kode FROM master_jabatan WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jabatan, kode FROM master_jabatan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jabatan = (jabatan) => {
    let a = "%" + jabatan;

    const query = db.one(
      "SELECT id, nama as jabatan, kode FROM master_jabatan WHERE nama ilike $1 AND is_deleted = 0",
      [a]
    );

    return query;
  };

  const create = async(jabatan, created_by) => {
    const { max } = await db.one(
        "SELECT MAX(id) FROM master_jabatan"
      );
      let a = "JBT" + (parseInt(max) + 1);

    const query = db.one(
      "INSERT INTO master_jabatan (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [jabatan, a, created_by]
    );

    return query;
  };


  const update = (id, jabatan, updated_by) => {
    db.one(
      "UPDATE master_jabatan SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jabatan, updated_by, id]
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

  return {
    find,
    findone,
    findone_by_jabatan,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jabatan",
    master_jabatan(fastify.db)
  );
  next();
});