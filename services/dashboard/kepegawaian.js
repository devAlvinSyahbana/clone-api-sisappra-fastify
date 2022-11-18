const fp = require("fastify-plugin");


const kepegawaian = (db) => {

    const get_status_kepegawaian = () => {
        const query = db.any(
            "SELECT kepegawaian_status_pegawai as status_kepegawaian, COUNT(*) FROM public.kepegawaian_pns  GROUP BY kepegawaian_status_pegawai union SELECT kepegawaian_status_pegawai, COUNT(*) FROM public.kepegawaian_non_pns GROUP BY kepegawaian_status_pegawai order by count asc"
        );
        return query;
    };

    const get_pendidikan_terakhir = () => {
        const query = db.any(
            "select mp.nama as pendidikan_terakhir, sum(jumlah) as count from (SELECT kp.kepegawaian_pendidikan_pada_sk as pendidikan, COUNT(kp.kepegawaian_pendidikan_pada_sk) as jumlah FROM kepegawaian_pns kp where kp.kepegawaian_pendidikan_pada_sk IS NOT NULL and not kp.kepegawaian_pendidikan_pada_sk = 1 group by kp.kepegawaian_pendidikan_pada_sk union all SELECT knp.kepegawaian_pendidikan_pada_sk, COUNT(knp.kepegawaian_pendidikan_pada_sk) FROM kepegawaian_non_pns knp where knp.kepegawaian_pendidikan_pada_sk IS NOT NULL and not knp.kepegawaian_pendidikan_pada_sk = 1 group by knp.kepegawaian_pendidikan_pada_sk ) as z left join master_pendidikan mp on z.pendidikan = mp.id group by mp.nama, mp.urutan_tingkat_pendidikan ORDER BY mp.urutan_tingkat_pendidikan"
        );
        return query;
    };


    const get_golongan = () => {
        const query = db.any(
            "SELECT z.* from (SELECT kepegawaian_golongan as golongan, COUNT(*) FROM public.kepegawaian_pns GROUP BY kepegawaian_golongan union SELECT kepegawaian_golongan, COUNT(*) FROM public.kepegawaian_non_pns GROUP BY kepegawaian_golongan order by golongan asc) as z where z.golongan is not null"
        );
        return query;
    };

    const get_eselon = () => {
        const query = db.any(
            "SELECT z.* from (SELECT kepegawaian_eselon as eselon, COUNT(*) FROM public.kepegawaian_pns GROUP BY kepegawaian_eselon union SELECT kepegawaian_eselon, COUNT(*) FROM public.kepegawaian_non_pns GROUP BY kepegawaian_eselon order by eselon asc) as z where z.eselon is not null"
        );
        return query;
    };

    const get_usia = () => {
        const query = db.any(
            "SELECT CASE WHEN z.usia BETWEEN 0 and 20 THEN '0 - 20' WHEN usia BETWEEN 21 and 25 THEN '21 - 25' WHEN usia BETWEEN 26 and 30 THEN '26 - 30' WHEN usia BETWEEN 31 and 35 THEN '31 - 35' WHEN usia BETWEEN 36 and 40 THEN '36 - 40' WHEN usia BETWEEN 41 and 45 THEN '41 - 45' WHEN usia BETWEEN 46 and 50 THEN '46 - 50' WHEN usia BETWEEN 51 and 55 THEN '51 - 55' WHEN usia BETWEEN 56 and 60 THEN '56 - 60' END as range_umur, COUNT(*) AS jumlah FROM (SELECT EXTRACT(YEAR FROM age(cast(tgl_lahir as date))) as usia from kepegawaian_pns  UNION ALL SELECT EXTRACT(YEAR FROM age(cast(tgl_lahir as date))) from kepegawaian_non_pns) as z GROUP BY range_umur order by range_umur"
        );
        return query;
    };

    const get_status_ppns = () => {
        const query = db.any(
            "SELECT s.nama as skpd, COUNT(*) FROM public.kepegawaian_ppns k left join master_skpd s on k.skpd= s.id GROUP BY k.skpd, s.nama ORDER BY count desc"
        );
        return query;
    };

    return {
        get_status_kepegawaian,
        get_pendidikan_terakhir,
        get_golongan,
        get_eselon,
        get_usia,
        get_status_ppns
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("kepegawaian", kepegawaian(fastify.db));
    next();
});