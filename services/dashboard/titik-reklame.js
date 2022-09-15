const fp = require("fastify-plugin");


const dashboard_titik_reklame_satpolpp = (db) => {


    const get_dashboard_titik_reklame = () => {
        const query = db.any(
            "SELECT jenis_dashboard_titik_reklame.jenis_dashboard_titik_reklame as jenis_dashboard_titik_reklame, EXTRACT(year FROM sapras_date) AS year, COUNT( dashboard_titik_reklame.jenis_dashboard_titik_reklame) as count FROM dashboard_titik_reklame LEFT JOIN jenis_dashboard_titik_reklame ON dashboard_titik_reklame.jenis_dashboard_titik_reklame=jenis_dashboard_titik_reklame.id GROUP BY jenis_dashboard_titik_reklame.jenis_dashboard_titik_reklame, EXTRACT(year FROM sapras_date)"
        );
        return query;
    };

    return {
        get_dashboard_titik_reklame
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_titik_reklame_satpolpp", dashboard_titik_reklame_satpolpp(fastify.db));
    next();
});

1