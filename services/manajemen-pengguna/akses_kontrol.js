const fp = require("fastify-plugin");

const akses_kontrol = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT id, modul, kode, level, created_at as tanggal_buat FROM akses_kontrol WHERE is_deleted = 0 ORDER BY created_at DESC"
        );

        return query;
    };

    const findOne = (id) => {
        const query = db.one(
            "SELECT id, modul, kode, level, created_at as tanggal_buat FROM akses_kontrol WHERE id = $1 AND is_deleted = 0 ",
            [id]
        );
        return query;
    };

    const filter = (limit, offset, qwhere) => {
        const query = db.any(
          "SELECT ak.id, ak.modul FROM akses_kontrol ak WHERE ak.is_deleted = 0" +
          qwhere +
          " LIMIT " +
          limit +
          " OFFSET " +
          (parseInt(offset) - 1)
        );
    
        return query;
      };

    // const filter = (limit, offset, qwhere) => {
    //     const query = db.any(
    //       "SELECT * FROM akses_kontrol WHERE is_deleted = 0 AND level = '' AND modul ILIKE '%{modul}%'" +
    //       qwhere +
    //       " LIMIT " +
    //       limit +
    //       " OFFSET " +
    //       (parseInt(offset) - 1)
    //     );
    
    //     return query;
    //   };

      const countAllFilter = (qwhere) => {
        const query = db.one(
          "SELECT COUNT(ak.id) as total FROM akses_kontrol ak WHERE ak.is_deleted = 0" +
          qwhere
        );
    
        return query;
      };

    const create = async (
        modul,
        level
    ) => {

        const { id } = await db.one(
            "INSERT INTO akses_kontrol (modul, level) VALUES ($1, $2) RETURNING id",
            [
                modul,
                level
            ]
        );

        return {
            modul,
            level
        };
    };

    const update = (
        id,
        modul,
        level,

    ) => {
        db.one(
            "UPDATE akses_kontrol SET modul = $1, level = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
            [
                modul,
                level,
                id,
            ]
        );
    };

    const del = async (id) => {
        await db.one(
            "UPDATE akses_kontrol SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
            [id]
        );

        return { id };
    };


    return {
        find,
        findOne,
        countAllFilter,
        create,
        filter,
        update,
        del,
        // getDataUnduhManajemenPengguna,
    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("akses_kontrol", akses_kontrol(fastify.db));
    next();
});