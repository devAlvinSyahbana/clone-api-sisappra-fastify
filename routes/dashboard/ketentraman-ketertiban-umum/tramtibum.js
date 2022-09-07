const dashboard_tramtibum = require("../../../services/dashboard/ketentraman-ketertiban-umum/tramtibum");

module.exports = async function (fastify, opts) {
    fastify.register(dashboard_tramtibum);

    // ^  kasus penegakan tramtibum
    fastify.get(
        "/sum-kasus-tramtibum", {
            schema: {
                description: "This is an endpoint for fetching all penegakan tramtibum per kasus",
                tags: ["dashboard_tramtibum"],
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
                                        kasus_tramtibum: {
                                            type: "string"
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
            const exec = await fastify.dashboard_tramtibum.get_kasus_tramtibum();

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

    // ^  jenis pelanggaran perda tramtibum
    fastify.get(
        "/sum-jenis-pelanggaran-perda-tramtibum", {
            schema: {
                description: "This is an endpoint for fetching all penegakan tramtibum per pelanggaran",
                tags: ["dashboard_tramtibum"],
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
                                        jenis_pelanggaran_perda_tramtibum: {
                                            type: "string"
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
            const exec = await fastify.dashboard_tramtibum.get_jenis_pelanggaran_perda_tramtibum();

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

    // ^  kasus penegakan tramtibum
    fastify.get(
        "/sum-kegiatan-tramtibum", {
            schema: {
                description: "This is an endpoint for fetching all kegiatan per kegiatan",
                tags: ["dashboard_tramtibum"],
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
                                        kegiatan_tramtibum: {
                                            type: "string"
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
            const exec = await fastify.dashboard_tramtibum.get_kegiatan_tramtibum();

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