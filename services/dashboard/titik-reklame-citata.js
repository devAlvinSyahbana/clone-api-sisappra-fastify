const fp = require("fastify-plugin");


const dashboard_titik_reklame_citata = (db) => {


    const get_dashboard_titik_reklame_citata = (qwhere) => {
        const query = db.any(
            "SELECT mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, produk, nama_perusahaan, pic, tgl_sk_terbit, tgl_exp, masa_berlaku, lokasi, lat, long, ukuran, ketinggian, keterangan FROM public.dashboard_titik_reklame_citata dtrc right join master_kota mkota on mkota.kode = dtrc.kota right join master_kecamatan mkec on mkec.kode = dtrc.kecamatan right join master_kelurahan mkel on mkel.kode = dtrc.kelurahan WHERE dtrc.is_deleted = 0" + qwhere
        );
        return query;
    };

    return {
        get_dashboard_titik_reklame_citata
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_titik_reklame_citata", dashboard_titik_reklame_citata(fastify.db));
    next();
});