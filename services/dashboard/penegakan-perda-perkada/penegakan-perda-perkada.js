const fp = require("fastify-plugin");


const perda = (db) => {

    const get_kasus_perda = () => {
        const query = db.any(
            "SELECT kasus_perda, COUNT( kasus_perda) FROM dashboard_penegakan_perda_perkada GROUP BY kasus_perda"
        );
        return query;
    };

    const get_jenis_perda = () => {
        const query = db.any(
            "SELECT jenis_pelanggaran_perda, COUNT( jenis_pelanggaran_perda) FROM dashboard_penegakan_perda_perkada GROUP BY jenis_pelanggaran_perda"
        );
        return query;
    };

    return {
        get_kasus_perda,
        get_jenis_perda
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_penegakan_perda_perkada", perda(fastify.db));
    next();
});

1