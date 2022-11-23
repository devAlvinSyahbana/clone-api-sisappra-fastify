const fp = require("fastify-plugin");

const sarana_prasarana = (db) => {
  const findone = (id) => {
    const query = db.one(
      "select sp.id, jsp.id as jenis_sarana_prasarana_id, jsp.jenis_sarana_prasarana as jenis_sarana_prasarana_name, ssp.id as status_sarana_prasarana_id, ssp.status_sarana_prasarana as status_sarana_prasarana_name, sp.jumlah, ksp.id as kondisi_id, ksp.kondisi_sarana_prasarana as kondisi_name, sp.keterangan, sp.file_dokumentasi as dokumentasi from sarana_prasarana sp left join jenis_sarana_prasarana jsp on sp.jenis_sarana_prasarana = jsp.id left join status_sarana_prasarana ssp on sp.status_sarana_prasarana  = ssp.id left join kondisi_sarana_prasarana ksp on sp.kondisi = ksp.id where sp.is_deleted = 0 AND sp.id = $1",
      [id]
    );

    return query;
  };

  const create = (
    jenis_sarana_prasarana,
    status_sarana_prasarana,
    jumlah,
    kondisi,
    keterangan,
    created_by
  ) => {
    const query = db.one(
      "INSERT INTO sarana_prasarana (jenis_sarana_prasarana, status_sarana_prasarana, jumlah, kondisi, keterangan, created_by) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
      [
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        created_by,
      ]
    );

    return query;
  };
  const find_jenis_sarana_prasarana = (jenis_sarana_prasarana) => {
    const query = db.any(
      "select id,jenis_sarana_prasarana from jenis_sarana_prasarana where is_deleted = 0 and jenis_sarana_prasarana ilike '%" +
        jenis_sarana_prasarana +
        "%' order by jenis_sarana_prasarana asc"
    );
    return query;
  };
  const find_all_sarana_prasarana = () => {
    const query = db.any(
        "SELECT jenis_sarana_prasarana.jenis_sarana_prasarana, status_sarana_prasarana.status_sarana_prasarana, jumlah, kondisi_sarana_prasarana.kondisi_sarana_prasarana, keterangan, file_dokumentasi, pelaksana FROM public.sarana_prasarana LEFT JOIN jenis_sarana_prasarana ON sarana_prasarana.jenis_sarana_prasarana = jenis_sarana_prasarana.id LEFT JOIN kondisi_sarana_prasarana ON sarana_prasarana.kondisi = kondisi_sarana_prasarana.id LEFT JOIN status_sarana_prasarana ON sarana_prasarana.status_sarana_prasarana = status_sarana_prasarana.id"
    );
    return query;
};
  const find_kondisi_sarana_prasarana = (kondisi_sarana_prasarana) => {
    const query = db.any(
      "select id,kondisi_sarana_prasarana from kondisi_sarana_prasarana where is_deleted = 0 and kondisi_sarana_prasarana ilike '%" +
        kondisi_sarana_prasarana +
        "%' order by kondisi_sarana_prasarana asc"
    );
    return query;
  };
  const find_status_sarana_prasarana = (status_sarana_prasarana) => {
    const query = db.any(
      "select id,status_sarana_prasarana from status_sarana_prasarana where is_deleted = 0 and status_sarana_prasarana ilike '%" +
        status_sarana_prasarana +
        "%' order by status_sarana_prasarana asc"
    );
    return query;
  };

  const filter = (limit, offset, qwhere) => {
    const query = db.any(
      "select sp.id, jsp.jenis_sarana_prasarana, ssp.status_sarana_prasarana, sp.jumlah, ksp.kondisi_sarana_prasarana as kondisi , sp.keterangan, sp.file_dokumentasi as dokumentasi from sarana_prasarana sp left join jenis_sarana_prasarana jsp on sp.jenis_sarana_prasarana = jsp.id left join status_sarana_prasarana ssp on sp.status_sarana_prasarana  = ssp.id left join kondisi_sarana_prasarana ksp on sp.kondisi = ksp.id where sp.is_deleted = 0" +
        qwhere +
        " order by sp.created_at desc" +
        " LIMIT " +
        limit +
        " OFFSET " +
        (parseInt(offset) - 1)
    );

    return query;
  };

  const countAllFilter = (qwhere) => {
    const query = db.one(
      "SELECT COUNT(sp.id) as total FROM sarana_prasarana sp  WHERE sp.is_deleted = 0" +
        qwhere
    );

    return query;
  };

  const update = (
    id,
    jenis_sarana_prasarana,
    status_sarana_prasarana,
    jumlah,
    kondisi,
    keterangan,
    updated_by
  ) => {
    db.one(
      "UPDATE sarana_prasarana SET jenis_sarana_prasarana = $1, status_sarana_prasarana = $2, jumlah =$3, kondisi = $4, keterangan = $5, updated_at = CURRENT_TIMESTAMP, updated_by = $6 WHERE id = $7 RETURNING id",
      [
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        updated_by,
        id,
      ]
    );
  };

  const updateFile = (id, file_dokumentasi, updated_by) => {
    db.one(
      "UPDATE sarana_prasarana SET file_dokumentasi = $1, updated_at = CURRENT_TIMESTAMP, updated_by = $2 WHERE id = $3 RETURNING id",
      [file_dokumentasi, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return { id };
  };

  const unduh = (qwhere) => {
    const query = db.any(
      "select jsp.jenis_sarana_prasarana, ssp.status_sarana_prasarana, sp.jumlah, ksp.kondisi_sarana_prasarana as kondisi, sp.keterangan from sarana_prasarana sp left join jenis_sarana_prasarana jsp on sp.jenis_sarana_prasarana = jsp.id left join status_sarana_prasarana ssp on sp.status_sarana_prasarana  = ssp.id left join kondisi_sarana_prasarana ksp on sp.kondisi = ksp.id where sp.is_deleted = 0" +
        qwhere +
        " order by jsp.jenis_sarana_prasarana ASC"
    );
    return query;
  };

  return {
    findone,
    create,
    update,
    del,
    find_jenis_sarana_prasarana,
    find_all_sarana_prasarana,
    find_status_sarana_prasarana,
    find_kondisi_sarana_prasarana,
    filter,
    countAllFilter,
    unduh,
    updateFile,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
  next();
});
