const fp = require("fastify-plugin");

const akses_kontrol_mapping = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT id, id_hak_akses, id_akses_kontrol, id_permission, value_permission FROM akses_kontrol_mapping WHERE is_deleted = 0 ORDER BY created_at ASC"
        );

        return query;
    };

    const findOne = (id) => {
        const query = db.one(
            "SELECT id, id_hak_akses, id_akses_kontrol, id_permission, value_permission FROM akses_kontrol_mapping WHERE id = $1 AND is_deleted = 0 ",
            [id]
        );
        return query;
    };

    const create = async (
        id_hak_akses,
        id_akses_kontrol,
        id_permission,
        value_permission
    ) => {

        const { id } = await db.one(
            "INSERT INTO akses_kontrol_mapping (id_hak_akses, id_akses_kontrol, id_permission, value_permission) VALUES ($1, $2, $3, $4) RETURNING id",
            [
                id_hak_akses,
                id_akses_kontrol,
                id_permission,
                value_permission
            ]
        );

        return {
            id,
            id_hak_akses,
            id_akses_kontrol,
            id_permission,
            value_permission,
        };
    };

    const update = (
        id,
        id_hak_akses,
        id_akses_kontrol,
        id_permission,
        value_permission,

    ) => {
        db.one(
            "UPDATE akses_kontrol_mapping SET id_hak_akses = $1, id_akses_kontrol = $2, id_permission = $3, value_permission = $4, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
            [
                id_hak_akses,
                id_akses_kontrol,
                id_permission,
                value_permission,
                id,
            ]
        );
    };

    const del = async (id) => {
        await db.one(
            "UPDATE akses_kontrol_mapping SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
            [id]
        );

        return { id };
    };


    return {
        find,
        findOne,
        create,
        update,
        del,
    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("akses_kontrol_mapping", akses_kontrol_mapping(fastify.db));
    next();
});