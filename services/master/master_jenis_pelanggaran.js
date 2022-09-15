const fp = require("fastify-plugin");

const master_jenis_pelanggaran = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_pelanggaran, kode FROM master_jenis_pelanggaran WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_pelanggaran, kode FROM master_jenis_pelanggaran WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_pelanggaran = (jenis_pelanggaran) => {
    const query = db.one(
      "SELECT id, nama as jenis_pelanggaran, kode FROM master_jenis_pelanggaran WHERE nama ilike $1 AND is_deleted = 0",
      [jenis_pelanggaran]
    );

    return query;
  };

  const create = async(jenis_pelanggaran, created_by) => {
    const { max } = await db.one(
      "SELECT MAX(id) FROM master_jenis_pelanggaran"
    );
    let a = romanize((parseInt(max) + 1));

    const query = db.one(
      "INSERT INTO master_jenis_pelanggaran (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [jenis_pelanggaran, a, created_by]
    );

    return query;
  };


  const update = (id, jenis_pelanggaran, updated_by) => {
    db.one(
      "UPDATE master_jenis_pelanggaran SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jenis_pelanggaran, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_pelanggaran SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  return {
    find,
    findone,
    findone_by_jenis_pelanggaran,
    create,
    update,
    del,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_pelanggaran",
    master_jenis_pelanggaran(fastify.db)
  );
  next();
});

function romanize(num) {
  if (!+num) return false;
  var digits = String(+num).split('');
  var key = ['','C','CC','CCC','CD','D','DC','DCC','DCCC','CM',
             '','X','XX','XXX','XL','L','LX','LXX','LXXX','XC',
             '','I','II','III','IV','V','VI','VII','VIII','IX'];
  var roman = '', i = 3;
  while (i--) roman = (key[+digits.pop() + (i * 10)] || '') + roman;
  return Array(+digits.join('') + 1).join('M') + roman;
}