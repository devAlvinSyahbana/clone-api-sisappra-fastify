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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            kasus_perda: {
                                type: "string"
                            },
                            count: {
                                type: "number"
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.dashboard_penegakan_perda_perkada.get_kasus_perda();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            jenis_pelanggaran_perda: {
                                type: "string"
                            },
                            count: {
                                type: "number"
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.dashboard_penegakan_perda_perkada.get_jenis_perda();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
        }
    );

};