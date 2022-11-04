const kondisi_sarana_prasarana = require("../../../services/master/master_kondisi_sarana_prasarana");

module.exports = async function (fastify, opts) {
    fastify.register(kondisi_sarana_prasarana);

    fastify.get(
        "/find", {
            schema: {
                description: "This is an endpoint for fetching all master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
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
                                        kondisi_sarana_prasarana: {
                                            type: "string"
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
            const exec = await fastify.kondisi_sarana_prasarana.find();

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

    fastify.get(
        "/findone/:id", {
            schema: {
                description: "This is an endpoint for fetching a master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
                params: {
                    description: "Find one master kondisi sarana prasarana id",
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
                                    kondisi_sarana_prasarana: {
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
            const exec = await fastify.kondisi_sarana_prasarana.findone(id);

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
                    message: error,
                    code: 500
                });
            }
        }
    );

    fastify.get(
        "/find-by/:kondisi_sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching a master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
                params: {
                    description: "Find one master kondisi sarana prasarana by kondisi sarana prasarana",
                    type: "object",
                    properties: {
                        kondisi_sarana_prasarana: {
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
                                    kondisi_sarana_prasarana: {
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
                kondisi_sarana_prasarana
            } = request.params;
            const exec = await fastify.kondisi_sarana_prasarana.findone_by_kondisi_sarana_prasarana(kondisi_sarana_prasarana);

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
                    message: error,
                    code: 500
                });
            }
        }
    );

    fastify.post(
        "/create", {
            schema: {
                description: "This is an endpoint for creating a master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
                body: {
                    description: "Payload for creating a master kondisi sarana prasarana",
                    type: "object",
                    properties: {
                        kondisi_sarana_prasarana: {
                            type: "string"
                        },
                        created_by: {
                            type: "number"
                        },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string"
                            },
                            code: {
                                type: "string"
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                kondisi_sarana_prasarana,
                created_by
            } = request.body;

            try {
                await fastify.kondisi_sarana_prasarana.create(kondisi_sarana_prasarana, created_by);
                reply.send({
                    message: "success",
                    code: 200
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );

    fastify.put(
        "/update/:id", {
            schema: {
                description: "This is an endpoint for updating an existing master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
                params: {
                    description: "update master kondisi sarana prasarana by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number"
                        },
                    },
                },
                body: {
                    description: "Payload for updating a master kondisi sarana prasarana",
                    type: "object",
                    properties: {
                        kondisi_sarana_prasarana: {
                            type: "string"
                        },
                        updated_by: {
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
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                id
            } = request.params;
            const {
                kondisi_sarana_prasarana,
                updated_by
            } = request.body;

            try {
                await fastify.kondisi_sarana_prasarana.update(id, kondisi_sarana_prasarana, updated_by);
                reply.send({
                    message: "success",
                    code: 200
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );

    fastify.delete(
        "/delete/:id", {
            schema: {
                description: "This is an endpoint for DELETING an existing master kondisi sarana prasarana.",
                tags: ["master kondisi sarana prasarana"],
                params: {
                    description: "master kondisi sarana prasarana by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number"
                        },
                    },
                },
                body: {
                    description: "Payload for deleted data master kondisi sarana prasarana",
                    type: "object",
                    properties: {
                        deleted_by: {
                            type: "number"
                        },
                    },
                },
                response: {
                    204: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string"
                            },
                            code: {
                                type: "string"
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
            const {
                deleted_by
            } = request.body;

            try {
                await fastify.kondisi_sarana_prasarana.del(id, deleted_by);
                reply.send({
                    message: "success",
                    code: 204
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );

    fastify.get(
        "/filter/:q", {
            schema: {
                description: "This is an endpoint for filtering a master kondisi sarana prasarana",
                tags: ["master kondisi sarana prasarana"],
                params: {
                    description: "Filter master kondisi sarana prasarana by search",
                    type: "object",
                    properties: {
                        q: {
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
                                type: "array",
                                items: {
                                    type: "object",
                                    properties: {
                                        id: {
                                            type: "number"
                                        },
                                        kondisi_sarana_prasarana: {
                                            type: "string"
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
            const {
                q
            } = request.params;
            const exec = await fastify.kondisi_sarana_prasarana.filter(q);

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
                    message: error,
                    code: 500
                });
            }
        }
    );
};