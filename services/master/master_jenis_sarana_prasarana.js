const fp = require("fastify-plugin");

const jenis_sarana_prasarana = (db) => {

    const find = () => {
        const query = db.any(
            "SELECT id, jenis_sarana_prasarana FROM jenis_sarana_prasarana WHERE is_deleted = 0 ORDER BY created_at DESC",
        );

        return query;
    };

    const findone = (id) => {
        const query = db.one(
            "SELECT id, jenis_sarana_prasarana FROM jenis_sarana_prasarana WHERE id = $1 AND is_deleted = 0",
            [id]
        );

        return query;
    };

    const findone_by_jenis_sarana_prasarana = (jenis_sarana_prasarana) => {
        const query = db.one(
            "SELECT id, jenis_sarana_prasarana FROM jenis_sarana_prasarana WHERE jenis_sarana_prasarana ilike $1 AND is_deleted = 0",
            [jenis_sarana_prasarana]
        );

        return query;
    };

    const create = async (jenis_sarana_prasarana, created_by) => {
        const query = db.one(
            "INSERT INTO jenis_sarana_prasarana (jenis_sarana_prasarana, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
            [jenis_sarana_prasarana, created_by]
        );

        return query;
    };


    const update = (id, jenis_sarana_prasarana, updated_by) => {
        db.one(
            "UPDATE jenis_sarana_prasarana SET jenis_sarana_prasarana = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
            [jenis_sarana_prasarana, updated_by, id]
        );
    };

    const del = async (id, deleted_by) => {
        await db.one(
            "UPDATE jenis_sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
            [id, deleted_by]
        );

        return {
            id
        };
    };

    const filter = (q) => {
        const query = db.any(
            "SELECT id, jenis_sarana_prasarana FROM jenis_sarana_prasarana WHERE is_deleted = 0 AND jenis_sarana_prasarana ILIKE '%" + q + "%'",
        );

        return query;
    };

    return {
        find,
        findone,
        findone_by_jenis_sarana_prasarana,
        create,
        update,
        del,
        filter,
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate(
        "jenis_sarana_prasarana",
        jenis_sarana_prasarana(fastify.db)
    );
    next();
});