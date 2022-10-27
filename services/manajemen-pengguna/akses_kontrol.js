const fp = require("fastify-plugin");

const akses_kontrol = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT id, nama_akses_kontrol, kode_akses_kontrol, level, created_at as tanggal_buat FROM akses_kontrol WHERE is_deleted = 0 ORDER BY created_at DESC"
        );

        return query;
    };

    const create = async (
        nama_akses_kontrol,
        kode_akses_kontrol,
        level,
        tanggal_buat
    ) => {

        const { id } = await db.one(
            "INSERT INTO pengguna (nama_akses_kontrol, kode_akses_kontrol, level, tanggal_buat) VALUES ($1, $2, $3, $4) RETURNING id",
            [
                nama_akses_kontrol,
                kode_akses_kontrol,
                level,
                tanggal_buat
            ]
        );

        return {
            nama_akses_kontrol,
            kode_akses_kontrol,
            level,
            tanggal_buat,
        };
    };


    return {
        find,
        // findOne,
        // countAllFilter,
        create,
        // filter,
        // update,
        // del,
        // getDataUnduhManajemenPengguna,
    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("akses_kontrol", akses_kontrol(fastify.db));
    next();
});