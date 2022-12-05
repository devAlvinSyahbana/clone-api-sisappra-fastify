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

  // const findone_by_kelurahan = (kecamatan, kelurahan) => {
  //   if (kecamatan == undefined){kecamatan = ""}
  //   if (kelurahan == undefined){kelurahan = ""}

  //   let a = kelurahan + "%";
  //   let b = kecamatan + "%";

  //   const query = db.any(
  //     "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan, mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.nama ILIKE $1 AND mkec.nama ILIKE $2 AND mk.is_deleted = 0",
  //     [a, b]
  //   );

  //   return query;
  // };

  const findone_by_kelurahan = (kecamatan, kelurahan) => {
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan, mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.nama ILIKE '%"+kelurahan+"%' AND mkec.nama ILIKE '%"+kecamatan+"%' AND mk.is_deleted = 0",
     
    );

    return query;
  };
  
  const find_by_kode_kecamatan = (kode_kecamatan) => {
    const query = db.any(
      "SELECT mk.id, mk.kode as kode_kelurahan, mk.nama as kelurahan, mk.kode_kecamatan, mkec.nama as kecamatan FROM master_kelurahan mk JOIN master_kecamatan mkec on mk.kode_kecamatan = mkec.kode WHERE mk.kode_kecamatan ILIKE $1 AND mk.is_deleted = 0",
      [kode_kecamatan]
    );

    return query;
  };

  const create = async(kelurahan, kode_kecamatan, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_kelurahan"
    );

    let a = "";
    if (max == undefined ) {
      a = "KEL1";
    } else {
      a = "KEL" + (parseInt(max) + 1);
    }

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

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as kelurahan FROM master_kelurahan WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_kelurahan,
    find_by_kode_kecamatan,
    create,
    update,
    del,
    filter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_kelurahan",
    master_kelurahan(fastify.db)
  );
  next();
});