const fp = require("fastify-plugin");

const master_kecamatan = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kecamatan, mk.nama as kecamatan, mk.kode_kota, mkot.nama as kota FROM master_kecamatan mk JOIN master_kota mkot on mk.kode_kota = mkot.kode WHERE mk.is_deleted = 0 ORDER BY mk.created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT mk.id, mk.kode as kode_kecamatan, mk.nama as kecamatan, mk.kode_kota, mkot.nama as kota FROM master_kecamatan mk JOIN master_kota mkot on mk.kode_kota = mkot.kode WHERE mk.id = $1 AND mk.is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_kecamatan = (kota, kecamatan) => {
    if (kota == undefined){kota = ""}
    if (kecamatan == undefined){kecamatan = ""}

    let a = kota + "%";
    let b = kecamatan + "%";
 
    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kecamatan, mk.nama as kecamatan, mk.kode_kota, mkot.nama as kota FROM master_kecamatan mk JOIN master_kota mkot on mk.kode_kota = mkot.kode WHERE mk.nama ilike $1 AND mkot.nama ilike $2 AND mk.is_deleted = 0 " ,
      [b, a]
    );

    return query;
  };

  const create = async(kode_kota, kecamatan, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_kecamatan"
    );

    let a = "";
    if (max == undefined ) {
      a = "KEC1";
    } else {
      a = "KEC" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO master_kecamatan (nama, kode, kode_kota, is_deleted, created_by) VALUES ($1, $2, $3, 0, $4) RETURNING id",
      [kecamatan, a, kode_kota, created_by]
    );

    return query;
  };


  const update = (id, kecamatan, kode_kota, updated_by) => {
    db.one(
      "UPDATE master_kecamatan SET nama = $1, kode_kota = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [kecamatan, kode_kota, updated_by,  id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_kecamatan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as kecamatan, kode FROM master_kecamatan WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_kecamatan,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_kecamatan",
    master_kecamatan(fastify.db)
  );
  next();
});