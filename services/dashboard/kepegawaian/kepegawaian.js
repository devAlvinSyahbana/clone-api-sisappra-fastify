const fp = require("fastify-plugin");


const kepegawaian = (db) => {

    const create = (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns) => {
        const query = db.one(
            "INSERT INTO kepegawaian (id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id_pegawai",
            [id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns]
        );

        return query;
    };

    const get_total_pegawai_provinsi = () => {
        const query = db.one(
            "SELECT SUM(vdk.provinsi_count + vdk.sekretariat_count + vdk.bidang_penegakan_count + vdk.bidang_penyidik_pns_count + vdk.bidang_tramtibum_count + vdk.bidang_pengawasan_tempat_usaha_count + vdk.bidang_perlindungan_masyarakat_count) AS jumlah_provinsi   FROM v_dashboard_kepegawaian_provinsi vdk;"
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
            "SELECT pendidikan_terakhir, COUNT(pendidikan_terakhir) FROM dashboard_kepegawaian GROUP BY pendidikan_terakhir;"
        );
        return query;
    };


    const get_eselon = () => {
        const query = db.any(
            "SELECT pendidikan_terakhir, COUNT(pendidikan_terakhir) FROM dashboard_kepegawaian GROUP BY pendidikan_terakhir;"
        );
        return query;
    };

    // const get_total_pegawai_kecamatan = () => {
    //     const query = db.one(
    //         "SELECT COUNT(id_pegawai) as jumlah FROM kepegawaian WHERE is_deleted = 0"
    //     );
    //     return query;
    // };

    // const findone = (id_pegawai) => {
    //     const query = db.one(
    //         "SELECT id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns FROM kepegawaian WHERE id_pegawai = $1",
    //         [id_pegawai]
    //     );
    //     return query;
    // };

    // const update = (id_pegawai) => {
    //     db.one(
    //         "UPDATE kepegawaian SET status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns = $1, $2, $3, $4, $5, $6, $7, $8, updated_at = CURRENT_TIMESTAMP WHERE id_pegawai= $9 RETURNING id_pegawai",
    //         [status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns]
    //     );
    // };

    // const del = async (id_pegawai) => {
    //     await db.one(
    //         "UPDATE kepegawaian SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP WHERE id_pegawai = $1 RETURNING id_pegawai",
    //         [id_pegawai]
    //     );

    //     return {
    //         id_pegawai
    //     };
    // };


    return {
        create,
        get_total_pegawai_provinsi,
        get_status_kepegawaian,
        get_pendidikan_terakhir
        // findone,
        // update,
        // del,

    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("kepegawaian", kepegawaian(fastify.db));
    next();
});

1