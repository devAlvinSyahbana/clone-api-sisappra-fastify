const kejadian = require("../../services/dashboard/kejadian");

module.exports = async function (fastify, opts) {
    fastify.register(kejadian);

    // ^  jenis kejadian
    fastify.get(
        "/kejadian", {
            schema: {
                description: "This is an endpoint for fetching all kejadian per kejadian",
                tags: ["dashboard_kejadian"],
                querystring: {
                    type: "object",
                    properties: {
                        kota: {
                            type: "string"
                        },
                        kecamatan: {
                            type: "string"
                        },
                        kelurahan: {
                            type: "string"
                        },
                        jenis_kejadian: {
                            type: "string"
                        },
                        tanggal_awal_kejadian: {
                            type: "string"
                        },
                        tanggal_akhir_kejadian: {
                            type: "string"
                        },
                    },
                },
                response: {
                    200: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string"
                            },
                            code: {
                                type: "string"
                            },
                            data: {
                                type: "array",
                                items: {
                                    type: "object",
                                    properties: {
                                        nama: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        nama_kota: {
                                            type: "string"
                                        },
                                        nama_kec: {
                                            type: "string"
                                        },
                                        nama_kel: {
                                            type: "string"
                                        },
                                        jenis_kejadian: {
                                            type: "string"
                                        },
                                        tanggal_awal_kejadian: {
                                            type: "string"
                                        },
                                        tanggal_akhir_kejadian: {
                                            type: "string"
                                        },
                                        jumlah_korban_jiwa: {
                                            type: "number"
                                        },
                                        jumlah_korban_materiil: {
                                            type: "number"
                                        },
                                    },
                                }
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                kota,
                kecamatan,
                kelurahan,
                jenis_kejadian,
                tanggal_awal_kejadian,
                tanggal_akhir_kejadian
            } = request.query;
            let exec = null;
            let qwhere = "";
            if (kota || kecamatan || kelurahan || jenis_kejadian || tanggal_awal_kejadian || tanggal_akhir_kejadian) {
                if (kota) {
                    qwhere += ` AND dk.kota = '${kota}'`;
                }
                if (kecamatan) {
                    qwhere += ` AND dk.kecamatan = '${kecamatan}'`;
                }
                if (kelurahan) {
                    qwhere += ` AND dk.kelurahan = '${kelurahan}'`;
                }
                if (jenis_kejadian) {
                    qwhere += ` AND dk.jenis_kejadian = '${jenis_kejadian}'`;
                }
                if (tanggal_awal_kejadian) {
                    qwhere += ` AND dk.tanggal_awal_kejadian = '${tanggal_awal_kejadian}'`;
                }
                if (tanggal_akhir_kejadian) {
                    qwhere += ` AND dk.tanggal_akhir_kejadian = '${tanggal_akhir_kejadian}'`;
                }
                exec = await fastify.dashboard_kejadian.get_kejadian(qwhere);
            }
            try {
                if (exec) {
                    reply.send({
                        message: "success",
                        code: 200,
                        data: exec
                    });
                } else {
                    reply.send({
                        message: "success",
                        code: 204
                    });
                }
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );


};