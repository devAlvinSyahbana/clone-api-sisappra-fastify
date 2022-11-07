const fp = require("fastify-plugin");

const struktur_data_hirarki1 = (db) => {

  // ─── Hirarki1 ────────────────────────────────────────────────────────────────

  const find = () => {
    const query = db.any(
      "SELECT id, parentid, name, positionName, phone, email, team, location, department, description, imageurl FROM struktur_data_hirarki1 WHERE is_deleted = 0 order by id asc",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, parentid, name, positionName, phone, email, team, location, department, description, imageurl FROM struktur_data_hirarki1 WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const find_by_parentId = (parentId) => {
    const query = db.any(
      "SELECT id, parentid, name, positionName, phone, email, team, location, department, description, imageurl FROM struktur_data_hirarki1 WHERE is_deleted = 0 AND parentid = " + parentid + "  order by id asc"
    );

    return query;
  };

  const create = async (parentid, name, positionName, phone, email, team, location, department, description, imageurl, created_by) => {
    const query = db.one(
      "INSERT INTO struktur_data_hirarki1 (parentid, name, positionName, phone, email, team, location, department, description, imageurl, created_by, is_deleted) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, 0) RETURNING id",
      [parentid, name, positionName, phone, email, team, location, department, description, imageurl, created_by]
    );

    return query;
  };

  const update = (id, parentid, name, positionName, phone, email, team, location, department, description, imageurl, updated_by) => {
    db.one(
      "UPDATE struktur_data_hirarki1 SET parentid = $1, name = $2, positionName = $3, phone = $4, email = $5, team = $6, location = $7, department = $8, description = $9, imageurl = $10, updated_by = $11, updated_at = CURRENT_TIMESTAMP WHERE id = $12 RETURNING id",
      [parentid, name, positionName, phone, email, team, location, department, description, imageurl, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE struktur_data_hirarki1 SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    find_by_parentId,
    create,
    update,
    del
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "struktur_data_hirarki1",
    struktur_data_hirarki1(fastify.db)
  );
  next();
});