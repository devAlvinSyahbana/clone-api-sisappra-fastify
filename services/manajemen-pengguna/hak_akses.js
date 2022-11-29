const fp = require("fastify-plugin");

const hak_akses = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT ha.id, ha.nama as nama_hak_akses, ha.kode, ha.wilayah_bidang, ha.kecamatan, ha.jabatan, mp.nama_permission FROM hak_akses ha left join modul_permission mp on ha.modul_permission = mp.id WHERE ha.is_deleted = 0 ORDER BY ha.created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT ha.id, ha.nama as nama_hak_akses, ha.kode, ha.wilayah_bidang, ha.kecamatan, ha.jabatan, mp.nama_permission FROM hak_akses ha left join modul_permission mp on ha.modul_permission = mp.id WHERE  ha.id = $1 AND ha.is_deleted = 0 ORDER BY ha.created_at DESC",
      [id]
    );

    return query;
  };

  const findone_by_nama_hak_akses = (nama_hak_akses) => {
    const query = db.one(
      "SELECT ha.id, ha.nama as nama_hak_akses, ha.kode, ha.wilayah_bidang, ha.kecamatan, ha.jabatan, mp.nama_permission FROM hak_akses ha left join modul_permission mp on ha.modul_permission = mp.id WHERE  ha.nama = $1 AND ha.is_deleted = 0 ORDER BY ha.created_at DESC",
      [nama_hak_akses]
    );

    return query;
  };

  const findone_by_kode = (kode) => {
    const query = db.one(
      "SELECT ha.id, ha.nama as nama_hak_akses, ha.kode, ha.wilayah_bidang, ha.kecamatan, ha.jabatan, mp.nama_permission FROM hak_akses ha left join modul_permission mp on ha.modul_permission = mp.id WHERE  ha.kode = $1 AND ha.is_deleted = 0 ORDER BY ha.created_at DESC",
      [kode]
    );

    return query;
  };


  const create = async (nama_hak_akses, wilayah_bidang, kecamatan, jabatan, modul_permission, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM hak_akses"
    );

    let kode = "";
    if (max == undefined) {
      kode = "HAKS1";
    } else {
      kode = "HAKS" + (parseInt(max) + 1);
    }

    const query = db.one(
      "INSERT INTO hak_akses (nama, kode, wilayah_bidang, kecamatan, jabatan, modul_permission, is_deleted, created_by) VALUES ($1, $2, $3, $4, $5, $6, 0, $7) RETURNING id",
      [nama_hak_akses, kode, wilayah_bidang, kecamatan, jabatan, modul_permission, created_by]
    );

    return query;
  };


  const update = (id, nama_hak_akses, wilayah_bidang, kecamatan, jabatan, modul_permission, updated_by) => {
    db.one(
      "UPDATE hak_akses SET nama = $1, wilayah_bidang = $2, kecamatan = $3, jabatan = $4, modul_permission = $5, updated_by = $6, updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
      [nama_hak_akses, wilayah_bidang, kecamatan, jabatan, modul_permission, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE hak_akses SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT ha.id, ha.nama as nama_hak_akses, ha.kode, mp.nama_permission FROM hak_akses ha left join modul_permission mp on ha.modul_permission = mp.id WHERE ha.nama ILIKE '%" + q + "%' AND ha.is_deleted = 0",
    );

    return query;
  };

  const countAllPenggunaByFilter = (qwhere) => {
    const query = db.one(
      `select count(id) as total from pengguna where is_deleted = 0${qwhere}`
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_nama_hak_akses,
    findone_by_kode,
    create,
    update,
    del,
    filter,
    countAllPenggunaByFilter
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "hak_akses",
    hak_akses(fastify.db)
  );
  next();
});