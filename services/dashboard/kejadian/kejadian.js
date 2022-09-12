const fp = require("fastify-plugin");


const dashboard_plotting_anggota = (db) => {


    const get_plotting_anggota = () => {
        const query = db.any(
            "SELECT kota_kab, kecamatan, kelurahan, lokasi, long, lat, total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam FROM public.dashboard_plotting_anggota;"
        );
        return query;
    };

    return {
        get_plotting_anggota
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_plotting_anggota", dashboard_plotting_anggota(fastify.db));
    next();
});

1