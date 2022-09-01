const fp = require("fastify-plugin");


const sarana_prasarana = (db) => {


  const create = (jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi) => {
    const query = db.one(
        "INSERT INTO sarana_prasarana (jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
      [jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi]
    );

    return query;
  };
  const findFilter = () => {
    const query = db.any(
        "SELECT jenis_sarana_prasarana, status_sarana_prasarana, kondisi FROM sarana_prasarana ORDER BY created_at DESC"
    );
    return query;
  };
  
  const find = () => {
    const query = db.any(
        "SELECT  sp.id, jsp.jenis_sarana_prasarana, ssp.status_sarana_prasarana, sp.jumlah, ksp.kondisi, sp.keterangan, sp.dokumentasi FROM sarana_prasarana sp ORDER BY created_at DESC"
    );
    return query;
  };
  const findone = (id) => {
    const query = db.one(
      "SELECT * FROM sarana_prasarana WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id,jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, updated_by) => {
    db.one(
      "UPDATE sarana_prasarana SET jenis_sarana_prasarana = $1, status_sarana_prasarana =$2, jumlah =$3, kondisi =$4, keterangan =$5, dokumentasi =$6 updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
      [jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi, updated_by, id]
    );
  };

  
  
  
  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return { id };
  };

  const post = () => {
    const query = db.any(
        "UPDATE * FROM sarana_prasarana ORDER BY created_at DESC"
    );
    return query;
  };

  
  
  return {
    create,
    update,
    del,
    find,
    findone,
    findFilter,
    post,
    
    
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
  next();
});
