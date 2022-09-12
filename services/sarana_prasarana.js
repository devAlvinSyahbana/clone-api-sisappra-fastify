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
        "select sp.id, jsp.jenis_sarana_prasarana, ssp.status_sarana_prasarana, sp.jumlah, ksp.kondisi_sarana_prasarana as kondisi , sp.keterangan, sp.file_dokumentasi as dokumentasi from sarana_prasarana sp left join jenis_sarana_prasarana jsp on sp.jenis_sarana_prasarana = jsp.id left join status_sarana_prasarana ssp on sp.status_sarana_prasarana  = ssp.id left join kondisi_sarana_prasarana ksp on sp.kondisi = ksp.id where sp.is_deleted = 0 order by sp.created_at desc"
    );
    return query;
  };
  const find_jenis_sarana_prasarana = () => {
    const query = db.any(
        "select * from jenis_sarana_prasarana where is_deleted = 0 order by created_at"
    );
    return query;
  };
  const find_kondisi_sarana_prasarana = () => {
    const query = db.any(
        "select * from kondisi_sarana_prasarana where is_deleted = 0 order by created_at"
    );
    return query;
  };
  const find_status_sarana_prasarana = () => {
    const query = db.any(
        "select * from status_sarana_prasarana where is_deleted = 0 order by created_at"
    );
    return query;
  };

  const findone = (jenis_sarana_prasarana,status_sarana_prasarana,kondisi_sarana_prasarana) => {
    const query = db.any(
      "select sp.id, jsp.jenis_sarana_prasarana, ssp.status_sarana_prasarana, sp.jumlah, ksp.kondisi_sarana_prasarana as kondisi , sp.keterangan, sp.file_dokumentasi as dokumentasi from sarana_prasarana sp left join jenis_sarana_prasarana jsp on sp.jenis_sarana_prasarana = jsp.id left join status_sarana_prasarana ssp on sp.status_sarana_prasarana  = ssp.id left join kondisi_sarana_prasarana ksp on sp.kondisi = ksp.id where sp.jenis_sarana_prasarana = $1 and sp.status_sarana_prasarana = $2 and sp.kondisi = $3 and sp.is_deleted = 0 order by sp.created_at desc",
      [jenis_sarana_prasarana,status_sarana_prasarana,kondisi_sarana_prasarana]
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
    find_jenis_sarana_prasarana,
    find_status_sarana_prasarana,
    find_kondisi_sarana_prasarana,
    findone,
    findFilter,
    post,

    
    
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
  next();
});
