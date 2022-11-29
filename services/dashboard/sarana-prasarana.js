const fp = require("fastify-plugin");


const sarana_prasarana = (db) => {


    const get_jenis_sarana_prasarana = (qwhere) => {
        const query = db.any(
            "SELECT jenis_sarana_prasarana.jenis_sarana_prasarana as jenis_sarana_prasarana, sarana_prasarana.jumlah, kondisi_sarana_prasarana.kondisi_sarana_prasarana FROM sarana_prasarana LEFT JOIN jenis_sarana_prasarana ON sarana_prasarana.jenis_sarana_prasarana=jenis_sarana_prasarana.id LEFT JOIN kondisi_sarana_prasarana ON sarana_prasarana.kondisi = kondisi_sarana_prasarana.id WHERE kondisi_sarana_prasarana.kondisi_sarana_prasarana = 'Layak'  GROUP BY jenis_sarana_prasarana.jenis_sarana_prasarana, kondisi_sarana_prasarana.kondisi_sarana_prasarana, sarana_prasarana.jumlah"
        );
        return query;
    };

    const get_jenis_sarana_prasarana_tidak_layak = (qwhere) => {
        const query = db.any(
            "SELECT jenis_sarana_prasarana.jenis_sarana_prasarana as jenis_sapras, sarana_prasarana.jumlah, kondisi_sarana_prasarana.kondisi_sarana_prasarana FROM sarana_prasarana LEFT JOIN jenis_sarana_prasarana ON sarana_prasarana.jenis_sarana_prasarana=jenis_sarana_prasarana.id LEFT JOIN kondisi_sarana_prasarana ON sarana_prasarana.kondisi = kondisi_sarana_prasarana.id WHERE kondisi_sarana_prasarana.kondisi_sarana_prasarana = 'Tidak Layak'  GROUP BY jenis_sarana_prasarana.jenis_sarana_prasarana, kondisi_sarana_prasarana.kondisi_sarana_prasarana, sarana_prasarana.jumlah"
        );
        return query;
    };

    const get_sarpras_by_kab_kota = () => {
        const query = db.any(
            "SELECT jenis_sarana_prasarana.jenis_sarana_prasarana as jenis_sarana_prasarana,EXTRACT(year FROM sapras_date) AS year, COUNT( sarana_prasarana.jenis_sarana_prasarana) as count FROM sarana_prasarana LEFT JOIN jenis_sarana_prasarana ON sarana_prasarana.jenis_sarana_prasarana=jenis_sarana_prasarana.id GROUP BY jenis_sarana_prasarana.jenis_sarana_prasarana, EXTRACT(year FROM sapras_date)"
        );
        return query;
    };

    return {
        get_jenis_sarana_prasarana,
        get_jenis_sarana_prasarana_tidak_layak,
        get_sarpras_by_kab_kota
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("sarana_prasarana", sarana_prasarana(fastify.db));
    next();
});