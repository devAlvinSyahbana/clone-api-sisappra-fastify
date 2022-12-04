const fp = require("fastify-plugin");

const pengguna = (db) => {
  const find = () => {
    const query = db.any(
      `select pgn.id, (CASE WHEN (pgw.nama IS NOT NULL OR pgw.nama != '') THEN pgw.nama ELSE pgn.nama_lengkap END) as nama_lengkap, pgn.hak_akses, pgn.email, pgn.no_pegawai, pgn.created_at as tgl_bergabung, pgn.terakhir_login, (CASE WHEN (pgw.foto IS NOT NULL OR pgw.foto != '') THEN pgw.foto ELSE pgn.foto END) as foto from pengguna pgn left join ( select knp.id, knp.nama, knp.kepegawaian_nptt_npjlp as no_pegawai, knp.kepegawaian_status_pegawai as status_pegawai, knp.foto from kepegawaian_non_pns knp left join master_jabatan mj on mj.id = knp.kepegawaian_jabatan left join master_agama ma on ma.id = knp.agama union all select kp.id, kp.nama, kp.kepegawaian_nrk as no_pegawai, kp.kepegawaian_status_pegawai as status_pegawai, kp.foto from kepegawaian_pns kp left join master_jabatan mj on mj.id = kp.kepegawaian_jabatan left join master_agama ma on ma.id = kp.agama ) pgw on pgw.no_pegawai = pgn.no_pegawai WHERE pgn.is_deleted = 0 ORDER BY pgn.created_at DESC`
    );

    return query;
  };

  const findOne = (id) => {
    const query = db.one(
      "select pgn.id, (CASE WHEN (pgw.nama IS NOT NULL OR pgw.nama != '') THEN pgw.nama ELSE pgn.nama_lengkap END) as nama_lengkap, pgn.hak_akses, pgn.email, pgn.no_pegawai, pgn.created_at as tgl_bergabung, pgn.terakhir_login, (CASE WHEN (pgw.foto IS NOT NULL OR pgw.foto != '') THEN pgw.foto ELSE pgn.foto END) as foto, kata_sandi from pengguna pgn left join ( select knp.id, knp.nama, knp.kepegawaian_nptt_npjlp as no_pegawai, knp.kepegawaian_status_pegawai as status_pegawai, knp.foto from kepegawaian_non_pns knp left join master_jabatan mj on mj.id = knp.kepegawaian_jabatan left join master_agama ma on ma.id = knp.agama union all select kp.id, kp.nama, kp.kepegawaian_nrk as no_pegawai, kp.kepegawaian_status_pegawai as status_pegawai, kp.foto from kepegawaian_pns kp left join master_jabatan mj on mj.id = kp.kepegawaian_jabatan left join master_agama ma on ma.id = kp.agama ) pgw on pgw.no_pegawai = pgn.no_pegawai WHERE pgn.id = $1 AND pgn.is_deleted = 0 ",
      [id]
    );
    if (query) {
      return query;
    }
    return false
  };

  const filterNamaPegawai = (limit, offset, qwhere) => {
    const query = db.any(
      "select pgn.id, (CASE WHEN (pgw.nama IS NOT NULL OR pgw.nama != '') THEN pgw.nama ELSE pgn.nama_lengkap END) as nama_lengkap, pgn.hak_akses, pgn.email, pgn.no_pegawai, pgn.created_at as tgl_bergabung, pgn.terakhir_login, (CASE WHEN (pgw.foto IS NOT NULL OR pgw.foto != '') THEN pgw.foto ELSE pgn.foto END) as foto, kata_sandi from pengguna pgn left join ( select knp.id, knp.nama, knp.kepegawaian_nptt_npjlp as no_pegawai, knp.kepegawaian_status_pegawai as status_pegawai, knp.foto from kepegawaian_non_pns knp left join master_jabatan mj on mj.id = knp.kepegawaian_jabatan left join master_agama ma on ma.id = knp.agama union all select kp.id, kp.nama, kp.kepegawaian_nrk as no_pegawai, kp.kepegawaian_status_pegawai as status_pegawai, kp.foto from kepegawaian_pns kp left join master_jabatan mj on mj.id = kp.kepegawaian_jabatan left join master_agama ma on ma.id = kp.agama ) pgw on pgw.no_pegawai = pgn.no_pegawai WHERE pgn.is_deleted = 0" +
      qwhere +
      " LIMIT " +
      limit +
      " OFFSET " +
      (parseInt(offset) - 1)
    );

    return query;
  };

  const countAllFilter = (qwhere) => {
    const query = db.one(
      "SELECT COUNT(pgn.id) as total FROM pengguna pgn WHERE pgn.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const create = async (
    no_pegawai,
    kata_sandi,
    email,
    hak_akses,
    status_pengguna,
    nama_lengkap,
    created_by
  ) => {

    const {
      id
    } = await db.one(
      "INSERT INTO pengguna (no_pegawai, kata_sandi, email, hak_akses, status_pengguna, nama_lengkap, created_by) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id",
      [
        no_pegawai,
        kata_sandi,
        email,
        hak_akses,
        status_pengguna,
        nama_lengkap,
        created_by
      ]
    );

    return {
      id,
      no_pegawai,
      kata_sandi,
      email,
      hak_akses,
      status_pengguna,
      nama_lengkap,
      created_by,
    };
  };

  const update = (
    id,
    kata_sandi,
    hak_akses,
    status_pengguna,
    updated_by,
    foto,
  ) => {
    db.one(
      "UPDATE pengguna SET kata_sandi =$1, hak_akses = $2, status_pengguna = $3, updated_by = $4, foto = $5, updated_at = CURRENT_TIMESTAMP WHERE id = $6 RETURNING id",
      [
        kata_sandi,
        hak_akses,
        status_pengguna,
        updated_by,
        foto,
        id,
      ]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE pengguna SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return {
      id
    };
  };

  const getDataUnduhManajemenPengguna = (qwhere) => {
    const query = db.any(
      "select pgn.id, (CASE WHEN (pgw.nama IS NOT NULL OR pgw.nama != '') THEN pgw.nama ELSE pgn.nama_lengkap END) as nama_lengkap, pgn.email, ha.nama as hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login, (CASE WHEN (pgw.foto IS NOT NULL OR pgw.foto != '') THEN pgw.foto ELSE pgn.foto END) as foto from pengguna pgn left join ( select knp.id, knp.nama, knp.kepegawaian_nptt_npjlp as no_pegawai, knp.kepegawaian_status_pegawai as status_pegawai, knp.foto from kepegawaian_non_pns knp left join master_jabatan mj on mj.id = knp.kepegawaian_jabatan left join master_agama ma on ma.id = knp.agama union all select kp.id, kp.nama, kp.kepegawaian_nrk as no_pegawai, kp.kepegawaian_status_pegawai as status_pegawai, kp.foto from kepegawaian_pns kp left join master_jabatan mj on mj.id = kp.kepegawaian_jabatan left join master_agama ma on ma.id = kp.agama ) pgw on pgw.no_pegawai = pgn.no_pegawai left join hak_akses ha on pgn.hak_akses = ha.id WHERE pgn.is_deleted = 0" + qwhere
    );

    return query;
  };

  // const getDataUnduhManajemenPengguna = (qwhere) => {
  //   const query = db.any(
  //     "SELECT pgn.id, pgn.nama_lengkap, pgn.email, ha.nama as hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login FROM pengguna pgn LEFT JOIN hak_akses ha ON ha.id = pgn.hak_akses WHERE pgn.is_deleted = 0" + qwhere
  //   );

  //   return query;
  // };

  const updateFoto = (id, updated_by, values) => {
    return db.one(
      `UPDATE pengguna SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };


  return {
    find,
    findOne,
    countAllFilter,
    create,
    filterNamaPegawai,
    update,
    del,
    getDataUnduhManajemenPengguna,
    updateFoto,
  };
}

module.exports = fp((fastify, options, next) => {
  fastify.decorate("pengguna", pengguna(fastify.db));
  next();
});