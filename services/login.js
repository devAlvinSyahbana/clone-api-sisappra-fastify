const fp = require("fastify-plugin");

const login = (db) => {

  const find_token = (token) => {
    const query = db.one(
      "SELECT id_pengguna, token FROM auth_token WHERE token = $1",
      [token]
    );

    return query;
  };

  const find = () => {
    const query = db.any(
      "SELECT id, no_pegawai, email, hak_akses, status_pengguna FROM pengguna WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT * FROM pengguna WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_pegawai = (no_pegawai) => {
    const query = db.one(
      "select z.* from( select kp.id, kp.nama, kp.kepegawaian_nrk as nrk_nptt_npjlp from kepegawaian_pns kp where kp.is_deleted = 0 and kp.kepegawaian_nrk = $1 union all select knp.id, knp.nama, knp.kepegawaian_nptt_npjlp as nrk from kepegawaian_non_pns knp where knp.is_deleted = 0 and knp.kepegawaian_nptt_npjlp = $1) as z",
      [no_pegawai]
    );

    return query;
  };

  const findone_no_pegawai = (no_pegawai) => {
    const query = db.one(
      "SELECT count(id) as jmlh FROM pengguna WHERE no_pegawai = $1 AND is_deleted = 0",
      [no_pegawai]
    );

    return query;
  };

  const findone_sign_in = (no_pegawai) => {
    const query = db.one(
      "SELECT * FROM pengguna WHERE no_pegawai = $1 AND is_deleted = 0",
      [no_pegawai]
    );

    return query;
  };

  const create = (no_pegawai, kata_sandi, email, nama_pegawai, created_by) => {
    const query = db.one(
      "INSERT INTO pengguna (no_pegawai, kata_sandi, email, hak_akses, nama_lengkap, status_pengguna, is_deleted, created_by) VALUES ($1, $2, $3, 1,  $4, 0, 0, $5) RETURNING id",
      [no_pegawai, kata_sandi, email, nama_pegawai, created_by]
    );

    return query;
  };

  const create_token = (id, token) => {
    const query = db.one(
      "INSERT INTO auth_token (id_pengguna, token) VALUES ($1, $2) RETURNING id",
      [id, token]
    );

    return query;
  };

  const update = (id, id_pegawai, no_pegawai, email, hak_akses, status_pengguna, updated_by) => {
    db.one(
      "UPDATE pengguna SET id_pegawai = $1, no_pegawai = $2, email = $3, hak_akses = $4, status_pengguna = $5, updated_by = $6, updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
      [id_pegawai, no_pegawai, email, hak_akses, status_pengguna, updated_by, id]
    );
  };

  const update_password = (id, kata_sandi, updated_by) => {
    db.one(
      "UPDATE pengguna SET kata_sandi = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [kata_sandi, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE pengguna SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    create,
    create_token,
    find_token,
    find,
    findone,
    findone_pegawai,
    findone_sign_in,
    findone_no_pegawai,
    update,
    update_password,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "login",
    login(fastify.db)
  );
  next();
});