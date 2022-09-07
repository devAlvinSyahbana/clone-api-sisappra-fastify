const kepegawaian = require("../../../services/dashboard/kepegawaian/kepegawaian");

module.exports = async function (fastify, opts) {
    fastify.register(kepegawaian);

    // fastify.post(
    //     "/create", {
    //         schema: {
    //             description: "This is an endpoint for creating kepegawaian",
    //             tags: ["kepegawaian"],
    //             body: {
    //                 description: "Payload for creating kepegawaian",
    //                 type: "object",
    //                 properties: {
    //                     id_pegawai: {
    //                         type: "string"
    //                     },
    //                     status_kepegawaian: {
    //                         type: "string"
    //                     },
    //                     pendidikan_terakhir: {
    //                         type: "string"
    //                     },
    //                     golongan: {
    //                         type: "string"
    //                     },
    //                     eselon: {
    //                         type: "string"
    //                     },
    //                     jenis_kediklatan: {
    //                         type: "string"
    //                     },
    //                     usia: {
    //                         type: "number"
    //                     },
    //                     usia_pensiun: {
    //                         type: "number"
    //                     },
    //                     status_ppns: {
    //                         type: "string"
    //                     }
    //                 },
    //             },
    //             response: {
    //                 201: {
    //                     description: "Success Response",
    //                     type: "object",
    //                     properties: {
    //                         id_pegawai: {
    //                             type: "string"
    //                         },
    //                         status_kepegawaian: {
    //                             type: "string"
    //                         },
    //                         pendidikan_terakhir: {
    //                             type: "number"
    //                         },
    //                         golongan: {
    //                             type: "string"
    //                         },
    //                         eselon: {
    //                             type: "string"
    //                         },
    //                         jenis_kediklatan: {
    //                             type: "string"
    //                         },
    //                         usia: {
    //                             type: "number"
    //                         },
    //                         usia_pensiun: {
    //                             type: "number"
    //                         },
    //                         status_ppns: {
    //                             type: "string"
    //                         }
    //                     },
    //                 },
    //             },
    //         },
    //     },
    //     async (request, reply) => {
    //         const {
    //             id_pegawai,
    //             status_kepegawaian,
    //             pendidikan_terakhir,
    //             golongan,
    //             eselon,
    //             jenis_kediklatan,
    //             usia,
    //             usia_pensiun,
    //             status_ppns
    //         } = request.body;
    //         const exec = await fastify.kepegawaian.create(
    //             id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns
    //         );
    //         reply.code(201).send(exec);
    //     }
    // );

    // fastify.get(
    //     "/sum-provinsi", {
    //         schema: {
    //             description: "This is an endpoint for fetching all kepegawaian per provinsi",
    //             tags: ["kepegawaian"],
    //             response: {
    //                 200: {
    //                     description: "Success Response",
    //                     type: "array",
    //                     items: {
    //                         type: "object",
    //                         properties: {
    //                             status_kepegawaian: {
    //                                 type: "string"
    //                             },
    //                             count: {
    //                                 type: "string"
    //                             },
    //                         },
    //                     },
    //                 },
    //             },
    //         },
    //     },
    //     async (request, reply) => {
    //         const exec = await fastify.kepegawaian.get_total_pegawai_provinsi();
    //         reply.code(200).send(exec);
    //     }
    // );

    // ^  status kepegawaian
    fastify.get(
        "/sum-status-kepegawaian", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per status kepegawaian",
                tags: ["kepegawaian"],
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
                                        status_kepegawaian: {
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
            const exec = await fastify.kepegawaian.get_status_kepegawaian();

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

    // ^ pendidikan terakhir
    fastify.get(
        "/sum-pendidikan-terakhir", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per pendidikan terakhir",
                tags: ["kepegawaian"],
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
                                        pendidikan_terakhir: {
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
            const exec = await fastify.kepegawaian.get_pendidikan_terakhir();

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

    // ^ golongan
    fastify.get(
        "/sum-golongan", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per golongan",
                tags: ["kepegawaian"],
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
                                        golongan: {
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
            const exec = await fastify.kepegawaian.get_golongan();

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

    // ^ eselon
    fastify.get(
        "/sum-eselon", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per eselon",
                tags: ["kepegawaian"],
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
                                        eselon: {
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
            const exec = await fastify.kepegawaian.get_eselon();

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

    // ^ usia
    fastify.get(
        "/sum-usia", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per usia",
                tags: ["kepegawaian"],
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
                                        range_umur: {
                                            type: "string"
                                        },
                                        jumlah: {
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
            const exec = await fastify.kepegawaian.get_usia();

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

    // ^ status ppns
    fastify.get(
        "/sum-status-ppns", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per status ppns",
                tags: ["kepegawaian"],
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
                                        status_ppns: {
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
            const exec = await fastify.kepegawaian.get_status_ppns();

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