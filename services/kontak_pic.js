const fp = require("fastify-plugin");

const kontak_pic = (db) => {
      const find = () => {
        const query = db.any(
          "SELECT * FROM kontak_pic WHERE is_deleted = 0 ORDER BY created_at DESC"
        );
    
        return query;
      };
    
      const findone = (id) => {
        const query = db.one(
          "SELECT * FROM kontak_pic WHERE id = $1 AND is_deleted = 0",
          [id]
        );
    
        return query;
      };
      
      const findone_status_pic = (status_pic) => {
        const query = db.one(
          "SELECT * FROM kontak_pic WHERE status_pic = $1 AND is_deleted = 0",
          [status_pic]
        );
    
        return query;
      };

      const create = (nama, telepon, created_by) => {
        const query = db.one(
          "INSERT INTO kontak_pic ( nama, telepon, status_pic, is_deleted, created_by) VALUES ($1, $2, 0, 0, $3) RETURNING id",
          [nama, telepon, created_by]
        );
    
        return query;
      };
    
      const update = (id, nama, telepon, updated_by) => {
        db.one(
          "UPDATE kontak_pic SET nama = $1, telepon = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
          [nama, telepon, updated_by, id]
        );
      };

      const update_pic = (id, status_pic, updated_by) => {
        db.one(
          "UPDATE kontak_pic SET status_pic = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
          [status_pic, updated_by, id]
        );
      };
    
      const del = async (id, deleted_by) => {
        await db.one(
          "UPDATE kontak_pic SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
          [id, deleted_by]
        );
    
        return { id };
      };
    
      return {
        create,
        find,
        findone,
        findone_status_pic,
        update,
        update_pic,
        del,
      };
    };

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kontak_pic", kontak_pic(fastify.db));
  next();
});
