const kepegawaian = require("../../../services/dashboard/kepegawaian/kepegawaian");

module.exports = async function (fastify, opts) {
    fastify.register(kepegawaian);

    fastify.post(
        "/create", {
            schema: {
                description: "This is an endpoint for creating kepegawaian",
                tags: ["kepegawaian"],
                body: {
                    description: "Payload for creating kepegawaian",
                    type: "object",
                    properties: {
                        id_pegawai: {
                            type: "string"
                        },
                        status_kepegawaian: {
                            type: "string"
                        },
                        pendidikan_terakhir: {
                            type: "string"
                        },
                        golongan: {
                            type: "string"
                        },
                        eselon: {
                            type: "string"
                        },
                        jenis_kediklatan: {
                            type: "string"
                        },
                        usia: {
                            type: "number"
                        },
                        usia_pensiun: {
                            type: "number"
                        },
                        status_ppns: {
                            type: "string"
                        }
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id_pegawai: {
                                type: "string"
                            },
                            status_kepegawaian: {
                                type: "string"
                            },
                            pendidikan_terakhir: {
                                type: "number"
                            },
                            golongan: {
                                type: "string"
                            },
                            eselon: {
                                type: "string"
                            },
                            jenis_kediklatan: {
                                type: "string"
                            },
                            usia: {
                                type: "number"
                            },
                            usia_pensiun: {
                                type: "number"
                            },
                            status_ppns: {
                                type: "string"
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                id_pegawai,
                status_kepegawaian,
                pendidikan_terakhir,
                golongan,
                eselon,
                jenis_kediklatan,
                usia,
                usia_pensiun,
                status_ppns
            } = request.body;
            const exec = await fastify.kepegawaian.create(
                id_pegawai, status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns
            );
            reply.code(201).send(exec);
        }
    );

    fastify.get(
        "/sum-provinsi", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per provinsi",
                tags: ["kepegawaian"],
                response: {
                    200: {
                        description: "Success Response",
                        type: "array",
                        items: {
                            type: "object",
                            properties: {
                                status_kepegawaian: {
                                    type: "string"
                                },
                                count: {
                                    type: "string"
                                },
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.kepegawaian.get_total_pegawai_provinsi();
            reply.code(200).send(exec);
        }
    );

    // ^  status kepegawaian
    fastify.get(
        "/sum-status-kepegawaian", {
            schema: {
                description: "This is an endpoint for fetching all kepegawaian per status kepegawaian",
                tags: ["kepegawaian"],
                response: {
                    200: {
                        description: "Success Response",
                        type: "array",
                        properties: {
                            status_kepegawaian: {
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
            const exec = await fastify.kepegawaian.get_status_kepegawaian();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            pendidikan_terakhir: {
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
            const exec = await fastify.kepegawaian.get_pendidikan_terakhir();
            reply.code(200).send(exec);
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
                        description: "Success Response",
                        type: "array",
                        properties: {
                            pendidikan_terakhir: {
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
            const exec = await fastify.kepegawaian.get_pendidikan_terakhir();
            reply.code(200).send(exec);
        }
    );

    // fastify.get(
    //     "/findone/:id_pegawai", {
    //         schema: {
    //             description: "This is an endpoint for fetching a kepegawaian by id",
    //             tags: ["kepegawaian"],
    //             params: {
    //                 description: "Find one kepegawaian by Id",
    //                 type: "object",
    //                 properties: {
    //                     id_pegawai: {
    //                         type: "string"
    //                     },
    //                 },
    //             },
    //             response: {
    //                 200: {
    //                     description: "Success Response",
    //                     type: "object",
    //                     properties: {
    //                         id: {
    //                             type: "string"
    //                         },
    //                         id_pegawai: {
    //                             type: "string"
    //                         },
    //                         status_kepegawaian: {
    //                             type: "string"
    //                         },
    //                         pendidikan_terakhir: {
    //                             type: "string"
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
    //             id_pegawai
    //         } = request.params;
    //         const exec = await fastify.kepegawaian.findone(id_pegawai);
    //         return exec;
    //     }
    // );

    // fastify.put(
    //     "/update/:id_pegawai", {
    //         schema: {
    //             description: "This is an endpoint for updating an existing kepegawaian",
    //             tags: ["kepegawaian"],
    //             params: {
    //                 description: "Kepegawaian risiko by Id",
    //                 type: "object",
    //                 properties: {
    //                     id_pegawai: {
    //                         type: "string"
    //                     }
    //                 },
    //             },
    //             body: {
    //                 description: "Payload for updating a kepegawaian",
    //                 type: "object",
    //                 properties: {
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
    //                 200: {
    //                     description: "Success Response",
    //                     type: "object",
    //                     properties: {
    //                         status_kepegawaian: {
    //                             type: "string"
    //                         },
    //                         pendidikan_terakhir: {
    //                             type: "string"
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
    //             id_pegawai
    //         } = request.params;
    //         const {
    //             status_kepegawaian,
    //             pendidikan_terakhir,
    //             golongan,
    //             eselon,
    //             jenis_kediklatan,
    //             usia,
    //             usia_pensiun,
    //             status_ppns
    //         } = request.body;

    //         const exec = await fastify.kepegawaian.update(
    //             status_kepegawaian, pendidikan_terakhir, golongan, eselon, jenis_kediklatan, usia, usia_pensiun, status_ppns
    //         );

    //         return exec;
    //     }
    // );

    // fastify.delete(
    //     "/delete/:id_pegawai", {
    //         schema: {
    //             description: "This is an endpoint for DELETING an existing kepegawaian.",
    //             tags: ["kepegawaian"],
    //             params: {
    //                 description: "delete kepegawaian by id_pegawai",
    //                 type: "object",
    //                 properties: {
    //                     id_pegawai: {
    //                         type: "string"
    //                     },
    //                 },
    //             },
    //             response: {
    //                 204: {
    //                     type: "string",
    //                     default: "No Content",
    //                 },
    //             },
    //         },
    //     },
    //     async (request, reply) => {
    //         const {
    //             id_pegawai
    //         } = request.params;
    //         await fastify.kepegawaian.del(id);

    //         reply.status(204);
    //     }
    // );
};