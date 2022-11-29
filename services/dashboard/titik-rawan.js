const fp = require("fastify-plugin");


const dashboard_titik_rawan = (db) => {

    const titik_rawan = (qwhere) => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where"+ qwhere
        );
        return query;
    };

    const titik_rawan_pmks = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'PMKS'"
        );
        return query;
    };

    const titik_rawan_pkl = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'PKL'"
        );
        return query;
    };


    const titik_rawan_banjir = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'Banjir'"
        );
        return query;
    };

    const titik_rawan_kebakaran = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'Kebakaran'"
        );
        return query;
    };

    const titik_rawan_macet = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota right join master_kecamatan mkec on mkec.kode = dtr.kecamatan right join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'Macet'"
        );
        return query;
    };

    const titik_rawan_konflik = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr right join master_kota mkota on mkota.kode = dtr.kota left join master_kecamatan mkec on mkec.kode = dtr.kecamatan left join master_kelurahan mkel on mkel.kode = dtr.kelurahan where rawan_terhadap = 'Konflik'"
        );
        return query;
    };

    const titik_rawan_tramtibum = () => {
        const query = db.any(
            "SELECT rawan_terhadap, mkota.nama as nama_kota, mkec.nama as nama_kec, mkel.nama as nama_kel, lokasi, lat, long, kategori FROM public.dashboard_titik_rawan dtr left join master_kota mkota on mkota.kode = dtr.kota left join master_kecamatan mkec on mkec.kode = dtr.kecamatan left join master_kelurahan mkel on mkel.kode = dtr.kelßurahan where rawan_terhadap = 'Tramtibum'"
        );
        return query;
    };

    return {
        titik_rawan,
        titik_rawan_pmks,
        titik_rawan_pkl,
        titik_rawan_banjir,
        titik_rawan_kebakaran,
        titik_rawan_macet,
        titik_rawan_konflik,
        titik_rawan_tramtibum,
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("dashboard_titik_rawan", dashboard_titik_rawan(fastify.db));
    next();
});