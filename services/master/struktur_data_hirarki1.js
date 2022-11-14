const fp = require("fastify-plugin");

const struktur_data_hirarki1 = (db) => {

  // ─── Hirarki1 ────────────────────────────────────────────────────────────────

  const find = () => {
    const query = db.any(
      "SELECT hirarki.id as id, parentid, name, mj.nama as position_name, team, tempat_lahir, to_char(hirarki.tanggal_lahir, 'dd Mon YYYY') AS tanggal_lahir, nrk, status_pegawai, jenis_kelamin, ma.nama as agama, image_url FROM hirarki left join master_jabatan mj on hirarki.position_name = mj.id left join master_agama ma on hirarki.agama = ma.id where parentid is not NULL order by hirarki.id asc",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT hirarki.id as id, parentid, name, mj.nama as position_name, team, tempat_lahir, to_char(hirarki.tanggal_lahir, 'dd Mon YYYY') AS tanggal_lahir, nrk, status_pegawai, jenis_kelamin, ma.nama as agama, image_url FROM hirarki left join master_jabatan mj on hirarki.position_name = mj.id left join master_agama ma on hirarki.agama = ma.id where hirarki.id = $1 AND parentid is not NULL order by hirarki.id  ",
      [id]
      // AND is_deleted = 0 
    );

    return query;
  };

  const find_by_parentid = (parentid) => {
    console.log("ini console", typeof parentid)
    const query = db.any(
      "SELECT hirarki.id as id, parentid, name, mj.nama as position_name, team, tempat_lahir, to_char(hirarki.tanggal_lahir, 'dd Mon YYYY') AS tanggal_lahir, nrk, status_pegawai, jenis_kelamin, ma.nama as agama, image_url FROM hirarki left join master_jabatan mj on hirarki.position_name = mj.id left join master_agama ma on hirarki.agama = ma.id where hirarki.parentid = '" + parentid + "'  order by hirarki.id"
    );
    // WHERE is_deleted = 0 AND 
    return query;
  };

  const create = async (parentid, name, positionName, team, tempatLahir, tanggalLahir, nrk, statusPegawai, jenisKelamin, agama, imageUrl, created_by) => {
    const query = db.one(
      "INSERT INTO hirarki (parentid, name, positionName, team, tempatLahir, tanggalLahir, nrk, statusPegawai, jenisKelamin, agama,imageUrl, created_by, is_deleted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, ,$12, 0) RETURNING id",
      [parentid, name, positionName, team, tempatLahir, tanggalLahir, nrk, statusPegawai, jenisKelamin, agama, imageUrl, created_by]
    );

    return query;
  };

  const update = (id, parentid, name, positionName, team, tempatLahir, tanggalLahir, nrk, statusPegawai, jenisKelamin, agama, imageUrl, updated_by) => {
    db.one(
      "UPDATE hirarki SET parentid = $1, name = $2, positionName = $3, team = $4, tempatLahir = $5, tanggalLahir = $6, nrk = $7, statusPegawai = $8, jenisKelamin = $9, agama = $10, imageUrl = $11, updated_at = CURRENT_TIMESTAMP WHERE id = $12 RETURNING id",
      [parentid, name, positionName, team, tempatLahir, tanggalLahir, nrk, statusPegawai, jenisKelamin, agama, imageUrl, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE hirarki SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    find_by_parentid,
    create,
    update,
    del
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "struktur_data_hirarki1",
    struktur_data_hirarki1(fastify.db)
  );
  next();
});