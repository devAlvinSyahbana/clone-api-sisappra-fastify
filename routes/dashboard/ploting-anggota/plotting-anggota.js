const sarana_prasarana = require("../../../services/dashboard/plotting-anggota/plotting-anggota");

module.exports = async function (fastify, opts) {
    fastify.register(sarana_prasarana);

    // ^  jenis sarana prasarana
    fastify.get(
        "/sum-plotting-anggota", {
            schema: {
                description: "This is an endpoint for fetching all sarana prasarana per plotting_anggota",
                tags: ["dashboard_plotting_anggota"],
                response: {
                    200: {
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
                                        kota_kab: {
                                            type: "string"
                                        },
                                        kecamatan: {
                                            type: "string"
                                        },
                                        kelurahan: {
                                            type: "string"
                                        },
                                        lokasi: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        total_jaga_pagi: {
                                            type: "number"
                                        },
                                        total_jaga_sore: {
                                            type: "number"
                                        },
                                        total_jaga_malam: {
                                            type: "number"
                                        },
                                        rawan_terhadap: {
                                            type: "string"
                                        },
                                        pic: {
                                            type: "string"
                                        },
                                        pic_contact: {
                                            type: "string"
                                        },
                                        jam_jaga_pagi: {
                                            type: "string"
                                        },
                                        jam_jaga_sore: {
                                            type: "string"
                                        },
                                        jam_jaga_malam: {
                                            type: "string"
                                        }
                                    },
                                }
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.dashboard_plotting_anggota.get_plotting_anggota();

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