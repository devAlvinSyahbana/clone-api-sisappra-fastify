const akses_kontrol = require("../../../api-sisappra-fastify/services/manajemen-pengguna/akses_kontrol");

module.exports = async function (fastify, opts) {
    fastify.register(akses_kontrol);

    // get semua data akses kontrol
    fastify.get(
        "/akses-kontrol/find",
        {
            schema: {
                description:
                    "API untuk mengambil seluruh data akses kontrol",
                tags: ["akses kontrol"],
                response: {
                    200: {
                        description: "Succes Response",
                        type: "array",
                        items: {
                            type: "object",
                            properties: {
                                id: { type: "number" },
                                modul: { type: "string" },
                                kode: { type: "string" },
                                level: { type: "string" },
                                tanggal_buat: { type: "string" },
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.akses_kontrol.find();
            console.log("string", exec)
            return exec;
        }
    );

    // get semua data akses kontrol by id
    fastify.get(
        "/akses-kontrol/findone/:id", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil data akses kontrol",
            tags: ["akses kontrol"],
            params: {
                description: "Parameter yang digunakan",
                type: "object",
                properties: {
                    id: {
                        type: "number"
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
                            type: "object",
                            properties: {
                                id: {
                                    type: "number"
                                },
                                modul: {
                                    type: "string"
                                },
                                kode: {
                                    type: "string"
                                },
                                level: {
                                    type: "string"
                                },
                                tanggal_buat: {
                                    type: "string"
                                },
                            },
                        },
                    },
                },
            },
        },
    },
        async (request, reply) => {
            const {
                id
            } = request.params;
            const exec = await fastify.akses_kontrol.findOne(id);
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

    // get semua data akses kontrol by modul
    fastify.get(
        "/akses-kontrol/findone-by-modul/:modul", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil data akses kontrol",
            tags: ["akses kontrol"],
            params: {
                description: "Parameter yang digunakan",
                type: "object",
                properties: {
                    modul: {
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
                            type: "object",
                            properties: {
                                id: {
                                    type: "number"
                                },
                                modul: {
                                    type: "string"
                                },
                                kode: {
                                    type: "string"
                                },
                                level: {
                                    type: "string"
                                },
                                tanggal_buat: {
                                    type: "string"
                                },
                            },
                        },
                    },
                },
            },
        },
    },
        async (request, reply) => {
            const {
                modul
            } = request.params;
            const exec = await fastify.akses_kontrol.findOne_modul(modul);
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

    //filter data akses kontrol
    fastify.get(
        "/akses-kontrol/filter/:modul", {
        schema: {
            description: "Endpoint ini digunakan untuk memfilter akses kontrol",
            tags: ["akses kontrol"],
            querystring: {
                type: "object",
                properties: {
                    limit: {
                        type: "integer",
                        default: 10,
                    },
                    offset: {
                        type: "integer",
                        default: 1,
                    },
                    modul: {
                        type: "string",
                    },
                },
                required: ["limit", "offset"],
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
                                    id: {
                                        type: "number"
                                    },
                                    modul: {
                                        type: "string"
                                    },
                                    kode: {
                                        type: "string"
                                    },
                                    level: {
                                        type: "string"
                                    },
                                },
                            },
                        },
                        total_data: {
                            type: "number"
                        },
                    },
                },
            },
        },
    },
        async (request, reply) => {
            const {
                limit,
                offset,
                modul,
                kode,
                level
            } = request.query;
            let exec = null;
            let totalDt = 0;
            let qwhere = "";
            if (modul) {
                qwhere += ` AND modul ILIKE '%${modul}%'`;
            }
            if (kode) {
                qwhere += ` AND kode ILIKE '%${kode}%'`;
            }
            if (level) {
                qwhere += ` AND level ILIKE '%${level}%'`;
            }
            exec = await fastify.akses_kontrol.filter(limit, offset, qwhere);
            const {
                total
            } = await fastify.akses_kontrol.countAllFilter(
                qwhere
            );
            totalDt = total;
            try {
                if (exec) {
                    reply.send({
                        message: "success",
                        code: 200,
                        data: exec,
                        total_data: totalDt,
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
    )

    // create data akses kontrol
    fastify.post(
        "/akses-kontrol/create",
        {
            schema: {
                description:
                    "This is an endpoint for creating data akses kontrol",
                tags: ["akses kontrol"],
                body: {
                    description: "Payload for creating a akses kontrol",
                    type: "object",
                    properties: {
                        modul: { type: "string" },
                        level: { type: "string" },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            modul: { type: "string" },
                            level: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                modul,
                level } = request.body;
            const exec = await fastify.akses_kontrol.create(
                modul,
                level,
            );
            reply.code(201).send(exec);
        }
    );

    // update data akses kontrol
    fastify.put(
        "akses-kontrol/update/:id",
        {
            schema: {
                description:
                    "This is an endpoint for updating data akses kontrol",
                tags: ["akses kontrol"],
                params: {
                    description: "update data akses kontrol by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number",
                        },
                    },
                },
                body: {
                    description: "Payload for updating a data akses kontrol",
                    type: "object",
                    properties: {
                        modul: { type: "string" },
                        level: { type: "string" },
                    },
                },
                response: {
                    200: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: { type: "string" },
                            code: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const { id } = request.params;
            const {
                modul,
                level,
            } = request.body;

            try {
                await fastify.akses_kontrol.update(
                    id,
                    modul,
                    level,
                );

                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // delete data akses kontrol
    fastify.delete(
        "/akses_kontrol/delete/:id",
        {
            schema: {
                description:
                    "This is an endpoint for deleting data akses kontrol",
                tags: ["akses kontrol"],
                params: {
                    description: "deleting data akses kontrol by Id",
                    type: "object",
                    properties: {
                        id: { type: "number" },
                    },
                },
                response: {
                    204: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: { type: "string" },
                            code: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const { id } = request.params;
            try {
                await fastify.akses_kontrol.del(id, "");

                reply.send({ message: "success", code: 204 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );
}