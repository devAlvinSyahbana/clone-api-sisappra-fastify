const fp = require("fastify-plugin");

const global = (db) => {
  const filterProv = (q) => {
    const query = db.any(
      "SELECT * FROM master_global_provinces WHERE name ILIKE '%" +
        q +
        "%' ORDER BY name ASC"
    );

    return query;
  };

  const filterKabKot = (id, q) => {
    const query = db.any(
      "SELECT * FROM master_global_regencies WHERE province_id = '" +
        id +
        "' AND name ILIKE '%" +
        q +
        "%' ORDER BY name ASC"
    );

    return query;
  };

  const filterKec = (id, q) => {
    const query = db.any(
      "SELECT * FROM master_global_districts WHERE regency_id = '" +
        id +
        "' AND name ILIKE '%" +
        q +
        "%' ORDER BY name ASC"
    );

    return query;
  };

  const filterKel = (id, q) => {
    const query = db.any(
      "SELECT * FROM master_global_villages WHERE district_id = '" +
        id +
        "' AND name ILIKE '%" +
        q +
        "%' ORDER BY name ASC"
    );

    return query;
  };

  return {
    filterProv,
    filterKabKot,
    filterKec,
    filterKel,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("global", global(fastify.db));
  next();
});
