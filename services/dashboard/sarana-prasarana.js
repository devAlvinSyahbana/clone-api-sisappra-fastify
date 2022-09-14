const fp = require("fastify-plugin");


const sarana_prasarana = (db) => {


    const get_jenis_sarana_prasarana = () => {
        const query = db.any(
            "SELECT jenis_sarana_prasarana.jenis_sarana_prasarana as jenis_sarana_prasarana, EXTRACT(year FROM sapras_date) AS year, COUNT( sarana_prasarana.jenis_sarana_prasarana) as count FROM sarana_prasarana LEFT JOIN jenis_sarana_prasarana ON sarana_prasarana.jenis_sarana_prasarana=jenis_sarana_prasarana.id GROUP BY jenis_sarana_prasarana.jenis_sarana_prasarana, EXTRACT(year FROM sapras_date)"
        );
        return query;
    };

    return {
        get_jenis_sarana_prasarana
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
    next();
});

1