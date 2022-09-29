const fp = require("fastify-plugin");


const dashboard_wasdak_ppkm = (db) => {

    const get_jenis_perorangan = () => {
        const query = db.any(
            "SELECT jenis_wasdak, EXTRACT(year FROM tanggal_wasdak ) AS year, COUNT( jenis_wasdak) as count FROM dashboard_wasdak_ppkm Where jenis_wasdak = 'Perorangan' GROUP BY EXTRACT(year FROM tanggal_wasdak), jenis_wasdak"
        );
        return query;
    };

    const get_jenis_tempat_makan = () => {
        const query = db.any(
            "SELECT jenis_wasdak, EXTRACT(year FROM tanggal_wasdak ) AS year, COUNT( jenis_wasdak) as count FROM dashboard_wasdak_ppkm Where jenis_wasdak = 'Tempat Makan' GROUP BY EXTRACT(year FROM tanggal_wasdak), jenis_wasdak"
        );
        return query;
    };


    const get_jenis_perkantoran = () => {
        const query = db.any(
            "SELECT jenis_wasdak, EXTRACT(year FROM tanggal_wasdak ) AS year, COUNT( jenis_wasdak) as count FROM dashboard_wasdak_ppkm Where jenis_wasdak = 'Perkantoran' GROUP BY EXTRACT(year FROM tanggal_wasdak), jenis_wasdak"
        );
        return query;
    };

    const get_jenis_usaha = () => {
        const query = db.any(
            "SELECT jenis_wasdak, EXTRACT(year FROM tanggal_wasdak ) AS year, COUNT( jenis_wasdak) as count FROM dashboard_wasdak_ppkm Where jenis_wasdak = 'Tempat Usaha dan Lainnya' GROUP BY EXTRACT(year FROM tanggal_wasdak), jenis_wasdak"
        );
        return query;
    };

    const get_jenis_kerumunan = () => {
        const query = db.any(
            "SELECT jenis_wasdak, EXTRACT(year FROM tanggal_wasdak ) AS year, COUNT( jenis_wasdak) as count FROM dashboard_wasdak_ppkm Where jenis_wasdak = 'Kerumunan' GROUP BY EXTRACT(year FROM tanggal_wasdak), jenis_wasdak"
        );
        return query;
    };


    return {
        get_jenis_perorangan,
        get_jenis_tempat_makan,
        get_jenis_perkantoran,
        get_jenis_usaha,
        get_jenis_kerumunan
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_wasdak_ppkm", dashboard_wasdak_ppkm(fastify.db));
    next();
});