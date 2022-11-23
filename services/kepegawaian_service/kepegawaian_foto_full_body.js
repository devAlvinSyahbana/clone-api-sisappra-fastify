const fp = require("fastify-plugin");

const kepegawaian_foto_full_body = (db) => {
  const findone = (qwhere) => {
    const query = db.one(
      `SELECT kflb.* FROM kepegawaian_foto_full_body kflb WHERE kflb.is_deleted = 0${qwhere}`
    );

    if (query) {
      return query;
    }
    return false;
  };

  const countAllFilter = (qwhere) => {
    const query = db.one(
      `SELECT COUNT(kflb.id) as total FROM kepegawaian_foto_full_body kflb WHERE kflb.is_deleted = 0${qwhere}`
    );

    return query;
  };

  const createFile = (id_pegawai, status_pegawai, path_foto) => {
    const query = db.one(
      "INSERT INTO kepegawaian_foto_full_body (id_pegawai, status_pegawai,path_foto) VALUES ($1, $2, $3) RETURNING id",
      [id_pegawai, status_pegawai, path_foto]
    );

    return query;
  };

  const updateFile = (id, updated_by, values) => {
    db.one(
      `UPDATE kepegawaian_foto_full_body SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  return {
    countAllFilter,
    createFile,
    updateFile,
    findone,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_foto_full_body",
    kepegawaian_foto_full_body(fastify.db)
  );
  next();
});
