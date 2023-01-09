const fp = require("fastify-plugin");

const akses_kontrol = (db) => {
  const find = () => {
    const query = db.any(
      "SELECT id, modul, kode, level, created_at as tanggal_buat FROM akses_kontrol WHERE is_deleted = 0 ORDER BY level ASC"
    );

    return query;
  };

  const findOne = (id) => {
    const query = db.one(
      "SELECT id, modul, kode, level, created_at as tanggal_buat FROM akses_kontrol WHERE id = $1 AND is_deleted = 0 ",
      [id]
    );
    return query;
  };

  const findOne_modul = (modul) => {
    const query = db.one(
      "SELECT id, modul, kode, level, created_at as tanggal_buat FROM akses_kontrol WHERE modul = $1 AND is_deleted = 0 ",
      [modul]
    );
    return query;
  };

  const filter_no_limit_offset = (qwhere) => {
    const query = db.any(
      "SELECT ak.id, ak.modul, ak.kode, ak.level, ak.created_at as tanggal_buat FROM akses_kontrol ak WHERE ak.is_deleted = 0 " + qwhere
    );

    return query;
  };

  const filter = (limit, offset, qwhere) => {
    const query = db.any(
      "SELECT ak.id, ak.modul, ak.kode, ak.level, ak.created_at as tanggal_buat FROM akses_kontrol ak WHERE ak.is_deleted = 0" +
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
      "SELECT COUNT(ak.id) as total FROM akses_kontrol ak WHERE ak.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const create = async (modul, level) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM akses_kontrol"
    );

    let a = "";
    if (max == undefined) {
      a = "AK1";
      level = a
    } else {
      a = "AK" + (parseInt(max) + 1);
      if (level == "") { level = a }
    }


    const query = db.one(
      "INSERT INTO akses_kontrol (modul, is_deleted, kode, level) VALUES ($1, 0, $2, $3) RETURNING id",
      [modul, a, level]
    );

    return query;
  };

  const update = (
    id,
    modul,
    level,

  ) => {
    db.one(
      "UPDATE akses_kontrol SET modul = $1, level = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [
        modul,
        level,
        id,
      ]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE akses_kontrol SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return { id };
  };

  const filterModulPermission = (qwhere) => {
    const query = db.any(
      "SELECT * FROM modul_permission WHERE is_deleted = 0 AND status = 0" +
      qwhere + "ORDER BY urutan ASC"
    );

    return query;
  };


  return {
    find,
    findOne,
    findOne_modul,
    countAllFilter,
    create,
    filter,
    update,
    del,
    filterModulPermission,
    filter_no_limit_offset
  };
}

module.exports = fp((fastify, options, next) => {
  fastify.decorate("akses_kontrol", akses_kontrol(fastify.db));
  next();
});