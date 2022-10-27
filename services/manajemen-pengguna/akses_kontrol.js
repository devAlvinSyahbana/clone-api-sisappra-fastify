const fp = require("fastify-plugin");

const akses_kontrol = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT id, nama_akses_kontrol, kode_akses_kontrol, level, created_at as tanggal_buat FROM akses_kontrol WHERE is_deleted = 0 ORDER BY created_at DESC"
        );

        return query;
    };

    const findOne = (id) => {
        const query = db.one(
          "SELECT id, nama_akses_kontrol, kode_akses_kontrol, level, created_at as tanggal_buat FROM akses_kontrol WHERE id = $1 AND is_deleted = 0 ",
          [id]
        );
        return query;
      };

    const create = async (
        nama_akses_kontrol,
        kode_akses_kontrol,
        level
    ) => {

        const { id } = await db.one(
            "INSERT INTO akses_kontrol (nama_akses_kontrol, kode_akses_kontrol, level) VALUES ($1, $2, $3) RETURNING id",
            [
                nama_akses_kontrol,
                kode_akses_kontrol,
                level
            ]
        );

        return {
            nama_akses_kontrol,
            kode_akses_kontrol,
            level
        };
    };

    const update = (
        id,
        nama_akses_kontrol,
        kode_akses_kontrol,
        level,

    ) => {
        db.one(
            "UPDATE akses_kontrol SET nama_akses_kontrol = $1, kode_akses_kontrol = $2, level =$3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
            [
                nama_akses_kontrol,
                kode_akses_kontrol,
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
        // countAllFilter,
        create,
        // filter,
        update,
        del,
        // getDataUnduhManajemenPengguna,
    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("akses_kontrol", akses_kontrol(fastify.db));
    next();
});