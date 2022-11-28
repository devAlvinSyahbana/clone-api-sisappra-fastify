const sarana_prasarana = require("../../services/dashboard/sarana-prasarana");

module.exports = async function (fastify, opts) {
    fastify.register(sarana_prasarana);

    // ^  jenis sarana prasarana
    fastify.get(
        "/sum-jenis-sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching all sarana prasarana per jenis",
                // params: {
                //     description: "Find jenis_sarana_prasarana by kondisi",
                //     type: "object",
                // },
                querystring: {
                    type: "object",
                    properties: {
                        kondisi: {
                            type: "string"
                        },
                    },
                },
                tags: ["jenis_sarana_prasarana"],
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
                                        jenis_sarana_prasarana: {
                                            type: "string"
                                        },
                                        kondisi_sarana_prasarana: {
                                            type: "string"
                                        },
                                        jumlah: {
                                            type: "number"
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
            const {
                kondisi
            } = request.query;
            let qwhere = "";
            if (kondisi) {
                qwhere += ` kondisi_sarana_prasarana.kondisi_sarana_prasarana = '${kondisi}'`;
            }
            const exec = await fastify.sarana_prasarana.get_jenis_sarana_prasarana(qwhere);

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

    fastify.post(
        "/by-wilayah", {
            schema: {
                description: "This is an endpoint for fetching all sarana prasarana per kab/kota",
                tags: ["jenis_sarana_prasarana"],
                body : {
                    wilayah: { type: "string" },
                },
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
                                        jenis_sarana_prasarana: {
                                            type: "string"
                                        },
                                        year: {
                                            type: "number"
                                        },
                                        count: {
                                            type: "number"
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
            const { no_pegawai, kata_sandi } = request.body;
            const exec = await fastify.sarana_prasarana.get_sarpras_by_kab_kota(no_pegawai, kata_sandi);

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