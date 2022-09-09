const fp = require("fastify-plugin");

const laporan_pengawasan = (db) => {
  const create = async (nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) => {

    const { id } = await db.one(
      "INSERT INTO laporan_pengawasan (nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING id",
      [nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan]
    );

    return {nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan};
  };

  const find = () => {
    const query = db.any(
      "SELECT id, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan FROM laporan_pengawasan WHERE is_deleted = 0 ORDER BY created_at DESC"
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan FROM laporan_pengawasan WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const update = (id, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan) => {
    db.one(
      "UPDATE laporan_pengawasan SET nrk = $1, nama = $2, tgl_pengecekan = $3, share_location = $4, alamat = $5, lokasi_tiang = $6, kawasan_kendali = $7, status = $8, ukuran = $9, pemilik_reklame = $10, konstruksi_reklame = $11, konten_iklan = $12, updated_at = CURRENT_TIMESTAMP WHERE id = $13 RETURNING id",
      [nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan, id]
    );
  };

  const del = async (id) => {
    await db.one(
      "UPDATE laporan_pengawasan SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
  fastify.decorate("laporan_pengawasan", laporan_pengawasan(fastify.db));
  next();
});
