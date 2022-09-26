const fp = require("fastify-plugin");


const dashboard_titik_reklame_satpolpp = (db) => {


    const get_dashboard_titik_reklame_satpolpp = (qwhere) => {
        const query = db.any(
            "SELECT produk, pemilik_reklame, konstruksi_reklame, dtrs.nrk, dtrs.nama, tgl_pengecekan,    kawasan_kendali, status, keterangan, lokasi, lat, long, posisi, ukuran FROM public.dashboard_titik_reklame_satpolpp dtrs left join kepegawaian_pns kpns on kpns.kepegawaian_nrk = dtrs.nrk and kpns.nama = dtrs.nama WHERE dtrs.is_deleted = 0" + qwhere
        );
        return query;
    };

    return {
        get_dashboard_titik_reklame_satpolpp
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_titik_reklame_satpolpp", dashboard_titik_reklame_satpolpp(fastify.db));
    next();
});

1