const akses_kontrol_mapping = require("../../services/manajemen-pengguna/akses_kontrol_mapping");

module.exports = async function (fastify, opts) {
    fastify.register(akses_kontrol_mapping);

    // get semua data akses kontrol mapping
    fastify.get(
        "/akses-kontrol-mapping/find",
        {
            schema: {
                description: "This is an endpoint for fetching all akses kontrol mapping",
                tags: ["akses kontrol mapping"],
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
        },
        async (request, reply) => {
            const exec = await fastify.akses_kontrol_mapping.find();
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
                id_hak_akses,
                id_akses_kontrol,
                id_permission,
                value_permission } = request.body;
            try {
                await fastify.akses_kontrol_mapping.create(id_hak_akses, id_akses_kontrol, id_permission, value_permission);
                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // update data akses kontrol mapping
    fastify.put(
        "/akses-kontrol-mapping/update/:id",
        {
            schema: {
                description:
                    "This is an endpoint for updating data akses kontrol mapping",
                tags: ["akses kontrol mapping"],
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
                await fastify.akses_kontrol_mapping.del(id, "");

                reply.send({ message: "success", code: 204 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // get semua data akses kontrol mapping by filter by id_hak_akses
    fastify.get(
        "/akses-kontrol-mapping/filter/:id_hak_akses", {
        schema: {
            description: "Endpoint ini digunakan untuk memfilter akses kontrol mapping",
            tags: ["akses kontrol mapping"],
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
                    id_hak_akses: {
                        type: "number",
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
                id_hak_akses,
                id_akses_kontrol,
                id_permission,
                value_permission
            } = request.query;
            let exec = null;
            let totalDt = 0;
            let qwhere = "";
            if (id_hak_akses) {
                qwhere += ` AND id_hak_akses = ${id_hak_akses}`;
            }
            if (id_akses_kontrol) {
                qwhere += ` AND id_akses_kontrol = ${id_akses_kontrol}`;
            }
            if (id_permission) {
                qwhere += ` AND id_permission = ${id_permission}`;
            }
            if (value_permission) {
                qwhere += ` AND value_permission ILIKE '%${tgl_bergabung}%'`;
            }
            exec = await fastify.akses_kontrol_mapping.filter(limit, offset, qwhere);
            const {
                total
            } = await fastify.akses_kontrol_mapping.countAllFilter(
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
}