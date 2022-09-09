const dashboard_penegakan_perda_perkada = require("../../../services/dashboard/penegakan-perda-perkada/penegakan-perda-perkada");

module.exports = async function (fastify, opts) {
    fastify.register(dashboard_penegakan_perda_perkada);

    // ^  kasus penegakan perda perkada
    fastify.get(
        "/sum-kasus-perda", {
            schema: {
                description: "This is an endpoint for fetching all penegakan perda perkada per kasus",
                tags: ["dashboard_penegakan_perda_perkada"],
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
                                        kasus_perda: {
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
            const exec = await fastify.dashboard_penegakan_perda_perkada.get_kasus_perda();

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

    // ^  jenis penegakan perda perkada
    fastify.get(
        "/sum-jenis-perda", {
            schema: {
                description: "This is an endpoint for fetching all penegakan perda perkada per jenis",
                tags: ["dashboard_penegakan_perda_perkada"],
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
                                        jenis_pelanggaran_perda: {
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
            const exec = await fastify.dashboard_penegakan_perda_perkada.get_jenis_perda();

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