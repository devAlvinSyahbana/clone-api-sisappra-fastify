const fp = require("fastify-plugin");


const dashboard_kejadian = (db) => {

    const get_kejadian = (qwhere) => {
        const query = db.any(
            "SELECT dk.nama, lat, long, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, jenis_kejadian, tanggal_awal_kejadian, tanggal_akhir_kejadian, jumlah_korban_jiwa, jumlah_korban_materiil FROM public.dashboard_kejadian dk right join master_kota mkota on mkota.kode = dk.kota right join master_kecamatan mkec on mkec.kode = dk.kecamatan right join master_kelurahan mkel on mkel.kode = dk.kelurahan WHERE dk.is_deleted = 0" + qwhere
        );
        return query;
    };

    return {
        get_kejadian
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_kejadian", dashboard_kejadian(fastify.db));
    next();
});