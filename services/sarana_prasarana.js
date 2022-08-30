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
        "SELECT * FROM sarana_prasarana ORDER BY created_at DESC"
    );
    return query;
  };

  const update = (jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi) => {
    db.one(
      "UPDATE jenis_sarana_prasarana,status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi = $1, $2, $3, $4, $5, $6 updated_at = CURRENT_TIMESTAMP WHERE id= $7 RETURNING id",
      [jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, dokumentasi]
    );
  };

  
  
  
  const del = async (id) => {
    await db.one(
      "UPDATE sarana_prasarana SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id]
    );

    return { id };
  };

  const post = () => {
    const query = db.any(
        "UPDATE * FROM sarana_prasarana ORDER BY created_at DESC"
    );
    return query;
  };

  // const findone = (id) => {
  //   const query = db.one(
  //     "SELECT jenis_sarana_prasarana, status_sarana_prasarana, kondisi FROM sample_crud WHERE id = $1 AND is_deleted = 0",
  //     [jenis_sarana_prasarana, status_sarana_prasarana, kondisi]
  //   );
  
  
  return {
    create,
    update,
    del,
    find,
    // findone,  
    findFilter,
    post,
    
    
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
  next();
});
