const dashboard_titik_rawan = require("../../services/dashboard/titik-rawan");

module.exports = async function (fastify, opts) {
    fastify.register(dashboard_titik_rawan);
    fastify.get(
        "/titik-rawan-by-kejadian", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per jenis pmks",
                tags: ["dashboard_titik_rawan"],
                querystring: {
                    type: "object",
                    properties: {
                        kejadian: {
                            type: "string"
                        },
                    },
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
                                        id: {
                                            type: "integer"
                                        },
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const {
                kejadian
            } = request.query;
            let qwhere = "";
            if (kejadian) {
                qwhere += ` kategori = '${kejadian}'`;
            }
            const exec = await fastify.dashboard_titik_rawan.titik_rawan(qwhere);

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
    // ^  pkms
    fastify.get(
        "/titik-rawan-pmks", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per jenis pmks",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_pmks();

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

    // ^ pkl
    fastify.get(
        "/titik-rawan-pkl", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per pkl",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_pkl();

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

    // ^ banjir
    fastify.get(
        "/titik-rawan-banjir", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per banjir",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_banjir();

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

    // ^ kebakaran
    fastify.get(
        "/titik-rawan-kebakaran", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per kebakaran",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_kebakaran();

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

    // ^ macet
    fastify.get(
        "/titik-rawan-macet", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per macet",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_macet();

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

    // ^ konflik
    fastify.get(
        "/titik-rawan-konflik", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per konflik",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_konflik();

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

    // ^ tramtibum
    fastify.get(
        "/titik-rawan-tramtibum", {
            schema: {
                description: "This is an endpoint for fetching all dashboard_titik_rawan per tramtibum",
                tags: ["dashboard_titik_rawan"],
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
                                        rawan_terhadap: {
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
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        kategori: {
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
            const exec = await fastify.dashboard_titik_rawan.titik_rawan_tramtibum();

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