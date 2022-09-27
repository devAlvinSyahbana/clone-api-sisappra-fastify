const fp = require("fastify-plugin");


const dashboard_tramtibum = (db) => {

    const get_kasus_tramtibum = () => {
        const query = db.any(
            "SELECT kasus_tramtibum, COUNT( kasus_tramtibum) FROM dashboard_tramtibum GROUP BY kasus_tramtibum"
        );
        return query;
    };

    const get_jenis_pelanggaran_perda_tramtibum = () => {
        const query = db.any(
            "SELECT jenis_pelanggaran_perda_tramtibum, COUNT( jenis_pelanggaran_perda_tramtibum) FROM dashboard_tramtibum GROUP BY jenis_pelanggaran_perda_tramtibum"
        );
        return query;
    };


    const get_kegiatan_tramtibum = () => {
        const query = db.any(
            "SELECT kegiatan_tramtibum, COUNT( kegiatan_tramtibum) FROM dashboard_tramtibum GROUP BY kegiatan_tramtibum"
        );
        return query;
    };


    return {
        get_kasus_tramtibum,
        get_jenis_pelanggaran_perda_tramtibum,
        get_kegiatan_tramtibum
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_tramtibum", dashboard_tramtibum(fastify.db));
    next();
});