const fp = require("fastify-plugin");

const modul_permission = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT id, akses_kontrol, nama_permission, status FROM modul_permission WHERE is_deleted = 0 ORDER BY created_at DESC"
        );

        return query;
    };

    const findOne = (id) => {
        const query = db.one(
            "SELECT id, akses_kontrol, nama_permission, status FROM modul_permission WHERE id = $1 AND is_deleted = 0 ",
            [id]
        );
        return query;
    };

    const create = async (
        akses_kontrol,
        nama_permission,
        status

    ) => {

        const { id } = await db.one(
            "INSERT INTO modul_permission (akses_kontrol, nama_permission, status) VALUES ($1, $2, $3) RETURNING id",
            [
                akses_kontrol,
                nama_permission,
                status
            ]
        );

        return {
            akses_kontrol,
            nama_permission,
            status,
        };
    };

    const del = async (id) => {
        await db.one(
            "UPDATE modul_permission SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
            [id]
        );

        return { id };
    };

    return {
        find,
        findOne,
        create,
        del,

    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("modul_permission", modul_permission(fastify.db));
    next();
});