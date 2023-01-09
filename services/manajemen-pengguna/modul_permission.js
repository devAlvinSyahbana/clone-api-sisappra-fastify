const fp = require("fastify-plugin");

const modul_permission = (db) => {
    const find = () => {
        const query = db.any(
            "SELECT mp.id, mp.akses_kontrol, mp.nama_permission, mp.status, ak.modul as akses_kontrol_name, ak.id as akses_kontrol_id FROM modul_permission mp LEFT JOIN akses_kontrol ak on ak.id = mp.akses_kontrol WHERE mp.is_deleted = 0 AND mp.status = 0 ORDER BY mp.urutan ASC "
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
        const getlasturutan  = await db.any(`select urutan from modul_permission WHERE akses_kontrol = ${akses_kontrol} order by urutan desc LIMIT 1`)
        console.log(" nih urutan nih ",getlasturutan)
        let urutan_val = ''
        if (getlasturutan.length > 0) {
            const last_number = parseInt(getlasturutan[0].urutan.slice(-1));

            if (last_number > 0) {
                urutan_val = akses_kontrol + '-' + (last_number + 1)
            } else {
                urutan_val = akses_kontrol + '-1'
            }
        } else {
            urutan_val = akses_kontrol + '-1'
        }
        const { id } = await db.one(
            "INSERT INTO modul_permission (akses_kontrol, nama_permission, status, urutan) VALUES ($1, $2, $3, $4) RETURNING id",
            [
                akses_kontrol,
                nama_permission,
                status,
                urutan_val
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
        // update,
        del,

    };
}

module.exports = fp((fastify, options, next) => {
    fastify.decorate("modul_permission", modul_permission(fastify.db));
    next();
});