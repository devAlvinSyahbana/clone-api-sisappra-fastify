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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            kasus_tramtibum: {
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
            const exec = await fastify.dashboard_tramtibum.get_kasus_tramtibum();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            jenis_pelanggaran_perda_tramtibum: {
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
            const exec = await fastify.dashboard_tramtibum.get_jenis_pelanggaran_perda_tramtibum();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            kegiatan_tramtibum: {
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
            const exec = await fastify.dashboard_tramtibum.get_kegiatan_tramtibum();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
        }
    );


};