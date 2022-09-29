const fp = require("fastify-plugin");


const kepegawaian_ppns = (db) => {
    const find = (limit) => {
        const query = db.any(
            "SELECT id, skpd, nama, nip, nrk, pangkat, golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_dikawal FROM public.kepegawaian_ppns WHERE is_deleted = 0 LIMIT " +
            limit
        );
        return query;
    };

    const filter = (limit, qwhere) => {
        const query = db.any(
            "SELECT id, skpd, nama, nip, nrk, pangkat, golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_dikawal FROM public.kepegawaian_ppns WHERE is_deleted = 0" +
            qwhere +
            " LIMIT " +
            limit
        );
        return query;
    };

    const create = (
        skpd, nama, nip, nrk, pangkat, golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_dikawal
    ) => {
        const query = db.one(
            "INSERT INTO public.kepegawaian_ppns(skpd, nama, nip, nrk, pangkat, golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_dikawal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING id",
            [
                skpd, nama, nip, nrk, pangkat, golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_dikawal
            ]
        );

        return query;
    };


    return {
        find,
        filter,
        create
    };
};

module.exports = fp((fastify, options, next) => {
    fastify.decorate("kepegawaian_ppns", kepegawaian_ppns(fastify.db));
    next();
});