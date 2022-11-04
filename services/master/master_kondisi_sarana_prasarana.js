const fp = require("fastify-plugin");

const kondisi_sarana_prasarana = (db) => {

    const find = () => {
        const query = db.any(
            "SELECT id, kondisi_sarana_prasarana FROM kondisi_sarana_prasarana WHERE is_deleted = 0 ORDER BY created_at DESC",
        );

        return query;
    };

    const findone = (id) => {
        const query = db.one(
            "SELECT id, kondisi_sarana_prasarana FROM kondisi_sarana_prasarana WHERE id = $1 AND is_deleted = 0",
            [id]
        );

        return query;
    };

    const findone_by_kondisi_sarana_prasarana = (kondisi_sarana_prasarana) => {
        const query = db.one(
            "SELECT id, kondisi_sarana_prasarana FROM kondisi_sarana_prasarana WHERE kondisi_sarana_prasarana ilike $1 AND is_deleted = 0",
            [kondisi_sarana_prasarana]
        );

        return query;
    };

    const create = async (kondisi_sarana_prasarana, created_by) => {
        const query = db.one(
            "INSERT INTO kondisi_sarana_prasarana (kondisi_sarana_prasarana, is_deleted, created_by) VALUES ($1, 0, $2) RETURNING id",
            [kondisi_sarana_prasarana, created_by]
        );

        return query;
    };


    const update = (id, kondisi_sarana_prasarana, updated_by) => {
        db.one(
            "UPDATE kondisi_sarana_prasarana SET kondisi_sarana_prasarana = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
            [kondisi_sarana_prasarana, updated_by, id]
        );
    };

    const del = async (id, deleted_by) => {
        await db.one(
            "UPDATE kondisi_sarana_prasarana SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
            [id, deleted_by]
        );

        return {
            id
        };
    };

    const filter = (q) => {
        const query = db.any(
            "SELECT id, kondisi_sarana_prasarana FROM kondisi_sarana_prasarana WHERE is_deleted = 0 AND kondisi_sarana_prasarana ILIKE '%" + q + "%'",
        );

        return query;
    };

    return {
        find,
        findone,
        findone_by_kondisi_sarana_prasarana,
        create,
        update,
        del,
        filter,
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate(
        "kondisi_sarana_prasarana",
        kondisi_sarana_prasarana(fastify.db)
    );
    next();
});