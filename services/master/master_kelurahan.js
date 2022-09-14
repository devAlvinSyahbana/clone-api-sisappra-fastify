const fp = require("fastify-plugin");

const master_kelurahan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan, mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.is_deleted = 0 ORDER BY mk.created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan,mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.id = $1 AND mk.is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_kelurahan = (kecamatan, kelurahan) => {
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    let a = "%"+kelurahan;
    let b = "%"+kecamatan;

    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan, mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.nama LIKE $1 AND mkec.nama LIKE $2 AND mk.is_deleted = 0",
      [a, b]
    );

    return query;
  };

  const create = async(kelurahan, kode_kecamatan, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_kelurahan"
    );
    let a = "KEL" + (parseInt(max) + 1);

    const query = db.one(
      "INSERT INTO master_kelurahan (nama, kode, kode_kecamatan, is_deleted, created_by) VALUES ($1, $2, $3, 0, $4) RETURNING id",
      [kelurahan, a, kode_kecamatan, created_by]
    );

    return query;
  };


  const update = (id, kelurahan, kode_kecamatan, updated_by) => {
    db.one(
      "UPDATE master_kelurahan SET nama = $1, kode_kecamatan = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [kelurahan, kode_kecamatan, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_kelurahan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_kelurahan,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_kelurahan",
    master_kelurahan(fastify.db)
  );
  next();
});