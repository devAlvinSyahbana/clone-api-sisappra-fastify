const fp = require("fastify-plugin");


const kepegawaian_ppns = (db) => {
    // ─── FIND ALL ────────────────────────────────────────────────────────────────
    const find = (limit, offset) => {
        const query = db.any(
            "SELECT kppns.id, mskpd.nama as skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, mpangkat.nama as pejabat_ppns_pangkat , mgol.nama as pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd =  mskpd.id left join master_pangkat mpangkat on kppns.pejabat_ppns_pangkat = mpangkat.id left join master_golongan mgol on kppns.pejabat_ppns_golongan = mgol.id WHERE kppns.is_deleted = 0 LIMIT " +
            limit + " OFFSET " + (parseInt(offset) - 1)
        );
        return query;
    };

    const findOne = (id) => {
        const query = db.one(
            "SELECT kppns.id, mskpd.nama as skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, mpangkat.nama as pejabat_ppns_pangkat , mgol.nama as pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd =  mskpd.id left join master_pangkat mpangkat on kppns.pejabat_ppns_pangkat = mpangkat.id left join master_golongan mgol on kppns.pejabat_ppns_golongan = mgol.id WHERE kppns.id = $1 AND kppns.is_deleted = 0 ",
            [id]
        );
        return query;
    };

    const countAll = () => {
        const query = db.one(
            "SELECT COUNT(id) as total FROM kepegawaian_ppns WHERE is_deleted = 0"
        );

        return query;
    };

    const find_rekap = (limit) => {
        const query = db.any(
            "SELECT mskpd.nama as skpd, count (kppns.skpd) as jumlah FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd = mskpd.id group by mskpd.nama UNION ALL SELECT 'Jumlah Keseluruhan' skpd, COUNT(skpd) FROM public.kepegawaian_ppns"
        );
        return query;
    };

    const find_rekap_jumlah = () => {
        const query = db.one(
            "select count (skpd) as jumlah_ppns, count(case when kp.skpd = 1 then 1 END) as satpol_pp, count(case when kp.skpd != 1 then 1 END) as skpd_lain from kepegawaian_ppns kp where is_deleted = 0"
        );
        return query;
    };

    const getDataUnduh = (qwhere) => {
        const query = db.any(
            "SELECT kppns.id, mskpd.nama, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, mpangkat.nama, mgol.nama, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd =  mskpd.id left join master_pangkat mpangkat on kppns.pejabat_ppns_pangkat = mpangkat.id left join master_golongan mgol on kppns.pejabat_ppns_golongan = mgol.id WHERE kppns.is_deleted = 0" +
            qwhere + " order by kepegawaian_ppns.skpd ASC, pejabat_ppns_nama"
        );

        return query;
    };

    // ─── FILTER ──────────────────────────────────────────────────────────────────
    const filter = (limit, offset, qwhere) => {
        const query = db.any(
            "SELECT kppns.id, mskpd.nama as skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, mpangkat.nama as pejabat_ppns_pangkat , mgol.nama as pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd =  mskpd.id left join master_pangkat mpangkat on kppns.pejabat_ppns_pangkat = mpangkat.id left join master_golongan mgol on kppns.pejabat_ppns_golongan = mgol.id WHERE kppns.is_deleted = 0" +
            qwhere +
            " LIMIT " +
            limit + " OFFSET " + (parseInt(offset) - 1)
        );
        return query;
    };

    const countAllFilter = (qwhere) => {
        const query = db.one(
            "SELECT COUNT(kppns.id) as total FROM kepegawaian_ppns kppns WHERE kppns.is_deleted = 0" +
            qwhere
        );

        return query;
    };

    const create = (
        skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, created_by
    ) => {
        const query = db.one(
            "INSERT INTO kepegawaian_ppns(skpd, pejabat_ppns_nama,pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, created_by) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING id",
            [
                skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, created_by
            ]
        );

        return query;
    };

    const update = (
        skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, updated_by, id
    ) => {
        console.log([
            skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, updated_by, id
        ])
        const query = db.one(
            "UPDATE public.kepegawaian_ppns SET skpd = $1, pejabat_ppns_nama = $2, pejabat_ppns_nip = $3, pejabat_ppns_nrk = $4, pejabat_ppns_pangkat = $5, pejabat_ppns_golongan = $6, no_sk_ppns = $7, no_ktp_ppns = $8, wilayah_kerja = $9, uu_yg_dikawal = $10, updated_by = $11 WHERE id = $12 RETURNING id ",
            [
                skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, updated_by, id
            ]
        );

        return query;
    };

    const unduh = () => {
        const query = db.any(
            "SELECT kppns.id, mskpd.nama, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, mpangkat.nama, mgol.nama, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal FROM public.kepegawaian_ppns kppns left join master_skpd mskpd on kppns.skpd =  mskpd.id left join master_pangkat mpangkat on kppns.pejabat_ppns_pangkat = mpangkat.id left join master_golongan mgol on kppns.pejabat_ppns_golongan = mgol.id WHERE kppns.is_deleted = 0"
        );
        return query;
    };

    return {
        find,
        findOne,
        countAll,
        find_rekap,
        find_rekap_jumlah,
        filter,
        countAllFilter,
        create,
        update,
        unduh
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("kepegawaian_ppns", kepegawaian_ppns(fastify.db));
    next();
});