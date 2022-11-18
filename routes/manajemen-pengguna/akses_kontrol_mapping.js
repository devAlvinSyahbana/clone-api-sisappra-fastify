const akses_kontrol_mapping = require("../../services/manajemen-pengguna/akses_kontrol_mapping");

module.exports = async function (fastify, opts) {
    fastify.register(akses_kontrol_mapping);

    // get semua data akses kontrol mapping
    fastify.get(
        "/akses-kontrol-mapping/find", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil data akses kontrol mapping",
            tags: ["akses kontrol mapping"],
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
                                id_hak_akses: {
                                    type: "number"
                                },
                                id_akses_kontrol: {
                                    type: "number"
                                },
                                id_permission: {
                                    type: "number"
                                },
                                value_permission: {
                                    type: "boolean"
                                },
                            },
                        },
                    },
                },
            },
        },
    },
        async (request, reply) => {
            const exec = await fastify.akses_kontrol_mapping.find();
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

    // get semua data akses kontrol mapping by id
    fastify.get(
        "/akses-kontrol-mapping/findone/:id", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil data akses kontrol mapping by id",
            tags: ["akses kontrol mapping"],
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
                                id_hak_akses: {
                                    type: "number"
                                },
                                id_akses_kontrol: {
                                    type: "number"
                                },
                                id_permission: {
                                    type: "number"
                                },
                                value_permission: {
                                    type: "boolean"
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
            const exec = await fastify.akses_kontrol_mapping.findOne(id);
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

    // create data akses mapping kontrol
    fastify.post(
        "/akses-kontrol-mapping/create",
        {
            schema: {
                description:
                    "This is an endpoint for creating data akses kontrol mapping",
                tags: ["akses kontrol mapping"],
                body: {
                    description: "Payload for creating a akses kontrol",
                    type: "object",
                    properties: {
                        id_hak_akses: { type: "number" },
                        id_akses_kontrol: { type: "number" },
                        id_permission: { type: "number" },
                        value_permission: { type: "boolean" },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            id_hak_akses: { type: "number" },
                            id_akses_kontrol: { type: "number" },
                            id_permission: { type: "number" },
                            value_permission: { type: "boolean" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                modul,
                level } = request.body;
            try {
                await fastify.akses_kontrol_mapping.create(modul, level);
                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // update data akses kontrol mapping
    fastify.put(
        "akses-kontrol-mapping/update/:id",
        {
            schema: {
                description:
                    "This is an endpoint for updating data akses kontrol mapping",
                tags: ["akses kontrol"],
                params: {
                    description: "update data akses kontrol mapping by Id",
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
                        id_hak_akses: { type: "number" },
                        id_akses_kontrol: { type: "number" },
                        id_permission: { type: "number" },
                        value_permission: { type: "boolean" },
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
                id_hak_akses,
                id_akses_kontrol,
                id_permission,
                value_permission,
            } = request.body;

            try {
                await fastify.akses_kontrol_mapping.update(
                    id,
                    id_hak_akses,
                    id_akses_kontrol,
                    id_permission,
                    value_permission,
                );

                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // delete data akses kontrol mapping
    fastify.delete(
        "/akses-kontrol-mapping/delete/:id",
        {
            schema: {
                description:
                    "This is an endpoint for deleting data akses kontrol mapping",
                tags: ["akses kontrol mapping"],
                params: {
                    description: "deleting data akses kontrol mapping by Id",
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