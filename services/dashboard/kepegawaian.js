const fp = require("fastify-plugin");


const kepegawaian = (db) => {

    const create = (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns) => {
        const query = db.one(
            "INSERT INTO kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id_pegawai",
            [id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns]
        );

        return query;
    };


    const get_status_kepegawaian = () => {
        const query = db.any(
            "SELECT status_kepegawaian, COUNT(*) FROM public.dashboard_kepegawaian GROUP BY status_kepegawaian;"
        );
        return query;
    };

    const get_pendidikan_terakhir = () => {
        const query = db.any(
            "SELECT pendidikan_terakhir, COUNT(pendidikan_terakhir) FROM dashboard_kepegawaian WHERE NOT status_kepegawaian='PPNS' GROUP BY pendidikan_terakhir;"
        );
        return query;
    };

    const get_golongan = () => {
        const query = db.any(
            "SELECT golongan, COUNT( golongan) FROM dashboard_kepegawaian WHERE NOT status_kepegawaian='PPNS' GROUP BY golongan;"
        );
        return query;
    };

    const get_eselon = () => {
        const query = db.any(
            "SELECT eselon, COUNT( eselon) FROM dashboard_kepegawaian WHERE NOT status_kepegawaian='PPNS' GROUP BY eselon;"
        );
        return query;
    };

    const get_usia = () => {
        const query = db.any(
            "SELECT CASE WHEN usia BETWEEN 0 and 20 THEN '0 - 20'  WHEN usia BETWEEN 21 and 25 THEN '21 - 25'  WHEN usia BETWEEN 26 and 30 THEN '26 - 30' WHEN usia BETWEEN 31 and 35 THEN '31 - 35' WHEN usia BETWEEN 36 and 40 THEN '36 - 40' WHEN usia BETWEEN 41 and 45 THEN '41 - 45' WHEN usia BETWEEN 46 and 50 THEN '46 - 50' WHEN usia BETWEEN 51 and 55 THEN '51 - 55' WHEN usia BETWEEN 56 and 60 THEN '56 - 60' END as range_umur,  COUNT(*) AS jumlah FROM dashboard_kepegawaian WHERE NOT status_kepegawaian='PPNS' GROUP BY range_umur"
        );
        return query;
    };

    const get_status_ppns = () => {
        const query = db.any(
            "SELECT status_ppns, COUNT( status_ppns) FROM dashboard_kepegawaian WHERE status_kepegawaian='PPNS'  GROUP BY status_ppns"
        );
        return query;
    };

    return {
        create,
        get_total_pegawai_provinsi,
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