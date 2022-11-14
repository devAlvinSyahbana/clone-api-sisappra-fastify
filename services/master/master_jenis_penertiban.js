const fp = require("fastify-plugin");

const master_jenis_penertiban = (db) => {

  const find = () => {
    const query = db.any(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE is_deleted = 0 ORDER BY created_at DESC",
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE id = $1 AND is_deleted = 0",
      [id]
    );

    return query;
  };

  const findone_by_jenis_penertiban = (jenis_penertiban) => {
    const query = db.one(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE nama ilike $1 AND is_deleted = 0",
      [jenis_penertiban]
    );

    return query;
  };

  const create = async(jenis_penertiban, kode, created_by) => {

    const { max } = await db.one(
      "SELECT MAX(id) FROM master_jenis_penertiban"
    );

    let a = "";
    if (max == undefined ) {
      a = "I";
    } else {
      a = romanize((parseInt(max) + 1));
    }
    const query = await db.one(
      "INSERT INTO master_jenis_penertiban (nama, kode, is_deleted, created_by) VALUES ($1, $2, 0, $3) RETURNING id",
      [jenis_penertiban, a, created_by]
    );

    return query;
  };


  const update = (id, jenis_penertiban, updated_by) => {
    db.one(
      "UPDATE master_jenis_penertiban SET nama = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [jenis_penertiban, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE master_jenis_penertiban SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const filter = (q) => {
    const query = db.any(
      "SELECT id, nama as jenis_penertiban, kode FROM master_jenis_penertiban WHERE is_deleted = 0 AND nama ILIKE '%"+q+"%'",
    );

    return query;
  };

  return {
    find,
    findone,
    findone_by_jenis_penertiban,
    create,
    update,
    del,
    filter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "master_jenis_penertiban",
    master_jenis_penertiban(fastify.db)
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