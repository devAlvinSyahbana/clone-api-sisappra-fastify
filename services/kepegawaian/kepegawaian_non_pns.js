const fp = require("fastify-plugin");

const kepegawaian_non_pns = (db) => {
  const countKeluarga = (id) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns_keluarga WHERE id_pegawai = " +
        id
    );

    return query;
  };

  const findPendidikanTerakhir = (id) => {
    const query = db.any(
      "SELECT jenis_pendidikan FROM kepegawaian_non_pns_pendidikan WHERE id_pegawai = " +
        id +
        " ORDER BY tgl_ijazah DESC"
    );

    if (query) {
      return query;
    }
    return false;
  };

  const findPendidikan = (id) => {
    const query = db.any(
      "SELECT * FROM kepegawaian_non_pns_pendidikan WHERE id_pegawai = " + id
    );

    return query;
  };

  const findKeluarga = (id) => {
    const query = db.any(
      "SELECT * FROM kepegawaian_non_pns_keluarga WHERE id_pegawai = " + id
    );

    return query;
  };

  const find = (limit, offset, status) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.no_hp, kpns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_non_pns kpns LEFT JOIN master_agama ma ON ma.id = CAST (kpns.agama AS INTEGER) WHERE kpns.is_deleted = 0 AND kpns.kepegawaian_status_pegawai = '" +
        status +
        "' ORDER BY kpns.created_at DESC LIMIT " +
        limit +
        " OFFSET " +
        offset
    );

    return query;
  };

  const filter = (limit, offset, status, qwhere) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.no_hp, kpns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_non_pns kpns LEFT JOIN master_agama ma ON ma.id = CAST (kpns.agama AS INTEGER) WHERE kpns.is_deleted = 0 AND kpns.kepegawaian_status_pegawai = '" +
        status +
        "'" +
        qwhere +
        " LIMIT " +
        limit +
        " OFFSET " +
        (parseInt(offset) - 1)
    );

    return query;
  };

  const countAll = (status) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
        status +
        "'"
    );

    return query;
  };

  const countAllFilter = (status, qwhere) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
        status +
        "'" +
        qwhere
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT * FROM kepegawaian_non_pns WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const create = (nama, telepon, created_by) => {
    const query = db.one(
      "INSERT INTO kontak_pic ( nama, telepon, status_pic, is_deleted, created_by) VALUES ($1, $2, 0, 0, $3) RETURNING id",
      [nama, telepon, created_by]
    );

    return query;
  };

  const update = (id, nama, telepon, updated_by) => {
    db.one(
      "UPDATE kontak_pic SET nama = $1, telepon = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [nama, telepon, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE kontak_pic SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return { id };
  };

  return {
    countKeluarga,
    findPendidikanTerakhir,
    findPendidikan,
    findKeluarga,
    filter,
    countAllFilter,
    countAll,
    create,
    find,
    findone,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_non_pns", kepegawaian_non_pns(fastify.db));
  next();
});
