const fp = require("fastify-plugin");

const laporan_ppns = (db) => {
    const create = async (id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan) => {

        const { id } = await db.one(
            "INSERT INTO laporan_ppns (id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id",
            [id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan]
        );

        return { id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan };
    };

    const find = () => {
        const query = db.any(
            "SELECT id, id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan FROM laporan_ppns WHERE is_deleted = 0 ORDER BY created_at DESC"
        );
        return query;
    };

    const findone = (id) => {
        const query = db.one(
            "SELECT id, id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan FROM laporan_ppns WHERE id = $1 AND is_deleted = 0",
            [id]
        );

        return query;
    };

    const update = (id, id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan) => {
        db.one(
            "UPDATE laporan_ppns SET id_nama = $1, nip = $2, golongan = $3, sekep_ppns = $4, tempat_tugas = $5, tahun_diklat = $6, keterangan = $7, updated_at = CURRENT_TIMESTAMP WHERE id = $8 RETURNING id",
            [id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan, id]
        );
    };

    const del = async (id) => {
        await db.one(
            "UPDATE laporan_ppns SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
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
    fastify.decorate("laporan_ppns", laporan_ppns(fastify.db));
    next();
});
