const fp = require("fastify-plugin");


const jenis_sarana_prasarana = (db) => {


    const get_jenis_sarana_prasarana = () => {
        const query = db.any(
            "SELECT jenis_sarana_prasarana, COUNT( jenis_sarana_prasarana) FROM jenis_sarana_prasarana GROUP BY jenis_sarana_prasarana"
        );
        return query;
    };

    return {
        get_jenis_sarana_prasarana
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("jenis_sarana_prasarana", jenis_sarana_prasarana(fastify.db));
    next();
});

1