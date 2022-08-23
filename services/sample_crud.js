const fp = require("fastify-plugin");

const sample_crud = (db) => {
  const create = async (area_dampak_risiko_spbe) => {
    const { count } = await db.one(
      "SELECT COUNT(*) FROM sample_crud WHERE is_deleted = 0"
    );
    const kode = "MADR" + (parseInt(count) > 0 ? parseInt(count) + 1 : 1);

    const { id } = await db.one(
      "INSERT INTO sample_crud (kode, area_dampak_risiko_spbe) VALUES ($1, $2) RETURNING id",
      [kode, area_dampak_risiko_spbe]
    );

    return { id, kode, area_dampak_risiko_spbe };
  };

  const find = () => {
    const query = db.any(
      "SELECT id, kode, area_dampak_risiko_spbe FROM sample_crud WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, kode, area_dampak_risiko_spbe FROM sample_crud WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, area_dampak_risiko_spbe) => {
    db.one(
      "UPDATE sample_crud SET area_dampak_risiko_spbe = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING id",
      [area_dampak_risiko_spbe, id]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE sample_crud SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return { id };
  };

  return {
    create,
    find,
    findone,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("sample_crud", sample_crud(fastify.db));
  next();
});
