const fp = require("fastify-plugin");

const kepegawaian_pns = (db) => {

  const del = async (id) => {
    await db.one(
      "UPDATE kepegawaian_pns SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return { id };
  };

  return {
    create,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_pns", kepegawaian_pns(fastify.db));
  next();
});
