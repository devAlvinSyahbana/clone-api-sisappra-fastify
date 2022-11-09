const fp = require("fastify-plugin");

const pengguna = (db) => {
  const find = () => {
    const query = db.any(
      "SELECT id, id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, nama_lengkap, terakhir_login FROM pengguna WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findOne = (id) => {
    const query = db.one(
      "SELECT id, id_pegawai, nama_lengkap, no_pegawai, email, hak_akses, status_pengguna, terakhir_login, created_at as tgl_bergabung FROM pengguna WHERE id = $1 AND is_deleted = 0 ",
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


  return {
    find,
    findOne,
    countAllFilter,
    create,
    filter,
    update,
    del,
    getDataUnduhManajemenPengguna,
  };
}

module.exports = fp((fastify, options, next) => {
  fastify.decorate("pengguna", pengguna(fastify.db));
  next();
});