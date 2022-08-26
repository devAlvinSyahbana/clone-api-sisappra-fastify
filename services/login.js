const fp = require("fastify-plugin");

const login = (db) => {

  const find_token = (token) => {
    const query = db.any(
      "SELECT id_pegawai, no_pegawai, token FROM auth_token WHERE token = $1",
      [token]
    );

    return query;
  };

  const create = (id_pegawai, no_pegawai, kata_sandi, email, hak_akses) => {
    const query = db.one(
      "INSERT INTO pengguna (id_pegawai, no_pegawai, kata_sandi, email, hak_akses, status_pengguna, is_deleted, created_by) VALUES ($1, $2, $3, $4, $5, 0, 0, 1) RETURNING id",
      [id_pegawai, no_pegawai, kata_sandi, email, hak_akses]
    );

    return query;
  };

  const create_token = (id_pegawai, no_pegawai, token) => {
    const query = db.one(
      "INSERT INTO auth_token (id_pegawai, no_pegawai, token) VALUES ($1, $2, $3) RETURNING id",
      [id_pegawai, no_pegawai, token]
    );

    return query;
  };

  const findone = (no_pegawai) => {
    const query = db.one(
      "SELECT * FROM pengguna WHERE no_pegawai = '$1' AND is_deleted = 0",
      [no_pegawai]
    );

    return query;
  };

  const update_password = (no_pegawai, kata_sandi, update_by) => {
    db.one(
      "UPDATE pengguna SET kata_sandi = $1, updated_at = CURRENT_TIMESTAMP, updated_by = $2  WHERE no_pegawai = '$4' RETURNING id",
      [kata_sandi, update_by, no_pegawai]
    );
  };

//   const update = (id, area_dampak_risiko_spbe) => {
//     db.one(
//       "UPDATE master_area_dampak_risiko SET area_dampak_risiko_spbe = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING id",
//       [area_dampak_risiko_spbe, id]
//     );
//   };

//   const del = async (id) => {
//     await db.one(
//       "UPDATE master_area_dampak_risiko SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
//       [id]
//     );

//     return { id };
//   };

  return {
    create,
    create_token,
    find_token,
    // find,
    findone,
    // update,
    // del,
    update_password,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "login",
    login(fastify.db)
  );
  next();
});
