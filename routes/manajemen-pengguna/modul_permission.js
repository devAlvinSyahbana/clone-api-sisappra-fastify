const modul_permission = require("../../../api-sisappra-fastify/services/manajemen-pengguna/modul_permission");

module.exports = async function (fastify, opts) {
    fastify.register(modul_permission);

    // get semua data akses kontrol
    fastify.get(
        "/modul-permission/find",
        {
            schema: {
                description:
                    "API untuk mengambil seluruh data modul permission",
                tags: ["modul permission"],
                response: {
                    200: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: { type: "string" },
                            code: { type: "string" },
                            data: {
                                type: "array",
                                items: {
                                    type: "object",
                                    properties: {
                                        id: { type: "number" },
                                        akses_kontrol: { type: "number" },
                                        nama_permission: { type: "string" },
                                        status: { type: "number" },

                                    },
                                },
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.modul_permission.find();
            console.log("string", exec)
            try {
                if (exec) {
                    reply.send({ message: "success", code: 200, data: exec });
                } else {
                    reply.send({ message: "success", code: 204 });
                }
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // get semua data modul permission by id
    fastify.get(
        "/modul-permission/findone/:id", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil data modul permission by id",
            tags: ["modul permission"],
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
                                akses_kontrol: {
                                    type: "number"
                                },
                                nama_permission: {
                                    type: "string"
                                },
                                status: {
                                    type: "number"
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
            const exec = await fastify.modul_permission.findOne(id);
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

    // create data modul permission
    fastify.post(
        "/modul-permission/create",
        {
            schema: {
                description:
                    "This is an endpoint for creating data modul permission",
                tags: ["modul permission"],
                body: {
                    description: "Payload for creating a modul permission",
                    type: "object",
                    properties: {
                        akses_kontrol: { type: "number" },
                        nama_permission: { type: "string" },
                        status: { type: "number" },

                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            akses_kontrol: { type: "number" },
                            nama_permission: { type: "string" },
                            status: { type: "number" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                akses_kontrol,
                nama_permission,
                status } = request.body;
            const exec = await fastify.modul_permission.create(
                akses_kontrol,
                nama_permission,
                status,
            );
            reply.code(201).send(exec);
        }
    );

    // delete data modul permission
    fastify.delete(
        "/modul-permission/delete/:id",
        {
            schema: {
                description:
                    "This is an endpoint for deleting data modul permission",
                tags: ["modul permission"],
                params: {
                    description: "deleting data modul permission by Id",
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
                await fastify.modul_permission.del(id, "");

                reply.send({ message: "success", code: 204 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );
}  