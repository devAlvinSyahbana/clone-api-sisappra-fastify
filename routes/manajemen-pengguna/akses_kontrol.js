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
                                nama_akses_kontrol: { type: "string" },
                                kode_akses_kontrol: { type: "string" },
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
        "/akses-kontrol/find/:id", {
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
                                nama_akses_kontrol: {
                                    type: "string"
                                },
                                kode_akses_kontrol: {
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
                        nama_akses_kontrol: { type: "string" },
                        kode_akses_kontrol: { type: "string" },
                        level: { type: "string" },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            nama_akses_kontrol: { type: "string" },
                            kode_akses_kontrol: { type: "string" },
                            level: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                nama_akses_kontrol,
                kode_akses_kontrol,
                level } = request.body;
            const exec = await fastify.akses_kontrol.create(
                nama_akses_kontrol,
                kode_akses_kontrol,
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
                        nama_akses_kontrol: { type: "string" },
                        kode_akses_kontrol: { type: "string" },
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
                nama_akses_kontrol,
                kode_akses_kontrol,
                level,
            } = request.body;

            try {
                await fastify.akses_kontrol.update(
                    id,
                    nama_akses_kontrol,
                    kode_akses_kontrol,
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