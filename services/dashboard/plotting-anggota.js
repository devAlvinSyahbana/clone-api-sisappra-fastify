const fp = require("fastify-plugin");


const dashboard_plotting_anggota = (db) => {


    const get_plotting_anggota = () => {
        const query = db.any(
            "SELECT mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long,total_jaga_pagi, total_jaga_sore, total_jaga_malam, rawan_terhadap, pic, pic_contact, jam_jaga_pagi, jam_jaga_sore, jam_jaga_malam FROM public.dashboard_plotting_anggota dpt left join master_kota mkota on mkota.kode = dpt.kota left join master_kecamatan mkec on mkec.kode = dpt.kecamatan left join master_kelurahan mkel on mkel.kode = dpt.kelurahan"
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