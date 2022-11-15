const fp = require("fastify-plugin");

const pengguna = (db) => {
  const find = () => {
    const query = db.any(
      "SELECT pgn.id, kpnns.nama as nama_lengkap, kpns.nama as nama_lengkap, pgn.hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login, knp.kepegawaian_nptt_npjlp as nrk, kp.kepegawaian_nrk as nrk FROM pengguna pgn LEFT JOIN kepegawaian_non_pns kpnns on kpnns.id = pgn.id LEFT JOIN kepegawaian_non_pns knp on knp.id = pgn.id LEFT JOIN kepegawaian_pns kpns on kpns.id = pgn.id LEFT JOIN kepegawaian_pns kp on kp.id = pgn.id WHERE pgn.is_deleted = 0 ORDER BY pgn.created_at ASC"
    );

    return query;
  };

  const findOne = (id) => {
    const query = db.one(
      "SELECT pgn.id, kpnns.nama as nama_lengkap, kpns.nama as nama_lengkap, pgn.hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login, knp.kepegawaian_nptt_npjlp as nrk, kp.kepegawaian_nrk as nrk FROM pengguna pgn LEFT JOIN kepegawaian_non_pns kpnns on kpnns.id = pgn.id LEFT JOIN kepegawaian_non_pns knp on knp.id = pgn.id LEFT JOIN kepegawaian_pns kpns on kpns.id = pgn.id LEFT JOIN kepegawaian_pns kp on kp.id = pgn.id WHERE pgn.id = $1 AND pgn.is_deleted = 0 ",
      [id]
    );
    return query;
  };

  const filter = (limit, offset, qwhere) => {
    const query = db.any(
      "SELECT pgn.id, pgn.nama_lengkap, pgn.email, pgn.hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login, status_pengguna, id_pegawai, no_pegawai FROM pengguna pgn WHERE pgn.is_deleted = 0" +
      qwhere +
      " LIMIT " +
      limit +
      " OFFSET " +
      (parseInt(offset) - 1)
    );

    return query;
  };

  const filterNamaPegawai = (limit, offset, qwhere) => {
    const query = db.any(
      "SELECT pgn.id, kpnns.nama as nama_lengkap, kpns.nama as nama_lengkap, pgn.hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login, knp.kepegawaian_nptt_npjlp as nrk, kp.kepegawaian_nrk as nrk FROM pengguna pgn LEFT JOIN kepegawaian_non_pns kpnns on kpnns.id = pgn.id LEFT JOIN kepegawaian_non_pns knp on knp.id = pgn.id LEFT JOIN kepegawaian_pns kpns on kpns.id = pgn.id LEFT JOIN kepegawaian_pns kp on kp.id = pgn.id WHERE pgn.is_deleted = 0" +
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
    id_pegawai,
    no_pegawai,
    kata_sandi,
    email,
    hak_akses,
    status_pengguna,
    nama_lengkap,
    created_by
  ) => {

    const { id } = await db.one(
      "INSERT INTO pengguna (id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, nama_lengkap, created_by) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
      [
        id_pegawai,
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
      id_pegawai,
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
    id_pegawai,
    no_pegawai,
    kata_sandi,
    email,
    hak_akses,
    status_pengguna,
    nama_lengkap,
    updated_by,
    foto,
  ) => {
    db.one(
      "UPDATE pengguna SET id_pegawai = $1, no_pegawai = $2, kata_sandi =$3, email = $4, hak_akses = $5, status_pengguna = $6, nama_lengkap = $7, updated_by = $8, foto = $9, updated_at = CURRENT_TIMESTAMP WHERE id = $10 RETURNING id",
      [
        id_pegawai,
        no_pegawai,
        kata_sandi,
        email,
        hak_akses,
        status_pengguna,
        nama_lengkap,
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

    return { id };
  };

  const getDataUnduhManajemenPengguna = (qwhere) => {
    const query = db.any(
      "SELECT pgn.id, pgn.nama_lengkap, pgn.email, ha.nama as hak_akses, pgn.created_at as tgl_bergabung, pgn.terakhir_login FROM pengguna pgn LEFT JOIN hak_akses ha ON ha.id = pgn.hak_akses WHERE pgn.is_deleted = 0" + qwhere
    );

    return query;
  };

  const updateFoto = (id, updated_by, values) => {
    db.one(
      `UPDATE pengguna SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };


  return {
    find,
    findOne,
    countAllFilter,
    create,
    filter,
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