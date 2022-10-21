const pengguna = require("../../services/manajemen-pengguna/pengguna");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
    fastify.register(pengguna);

    // get data by id
    fastify.get(
        "/find/:id", {
        schema: {
            description: "Endpoint ini digunakan untuk mengambil seluruh data manajemen pengguna",
            tags: ["manajemen pengguna"],
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
                                id_pegawai: {
                                    type: "string"
                                },
                                nama_lengkap: {
                                    type: "string"
                                },
                                no_pegawai: {
                                    type: "string"
                                },
                                email: {
                                    type: "string"
                                },
                                hak_akses: {
                                    type: "number"
                                },
                                status_pengguna: {
                                    type: "number"
                                },
                                tgl_bergabung: {
                                    type: "string"
                                },
                                terakhir_login: {
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
            const exec = await fastify.pengguna.findOne(id);
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

    // get semua data pengguna
    // fastify.get(
    //     "/find",
    //     {
    //         schema: {
    //             description:
    //                 "API untuk mengambil seluruh data user pengguna",
    //             tags: ["manajemen pengguna"],
    //             response: {
    //                 200: {
    //                     description: "Succes Response",
    //                     type: "array",
    //                     items: {
    //                         type: "object",
    //                         properties: {
    //                             id: { type: "number" },
    //                             nama_lengkap: { type: "string" },
    //                             id_pegawai: { type: "string" },
    //                             no_pegawai: { type: "string" },
    //                             email: { type: "string" },
    //                             kata_sandi: { type: "string" },
    //                             hak_akses: { type: "number" },
    //                             status_pengguna: { type: "number" },
    //                             terakhir_login: { type: "string" },
    //                         },
    //                     },
    //                 },
    //             },
    //         },
    //     },
    //     async (request, reply) => {
    //         const exec = await fastify.pengguna.find();
    //         console.log("string", exec)
    //         return exec;
    //     }
    // );

    // filter data pengguna
    fastify.get(
        "/filter-data-pengguna", {
        schema: {
            description: "Endpoint ini digunakan untuk memfilter data pengguna",
            tags: ["manajemen pengguna"],
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
                    nama_lengkap: {
                        type: "string",
                    },
                    email: {
                        type: "string",
                    },
                    hak_akses: {
                        type: "number",
                    },
                    // terakhir_login: {
                    //     type: "string",
                    // },
                    // tgl_bergabung: {
                    //     type: "string",
                    // },
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
                                    id_pegawai: {
                                        type: "string"
                                    },
                                    nama_lengkap: {
                                        type: "string"
                                    },
                                    no_pegawai: {
                                        type: "string"
                                    },
                                    // kata_sandi: {
                                    //     type: "string"
                                    // },
                                    email: {
                                        type: "string"
                                    },
                                    hak_akses: {
                                        type: "number"
                                    },
                                    status_pengguna: {
                                        type: "number"
                                    },
                                    terakhir_login: {
                                        type: "string"
                                    },
                                    tgl_bergabung: {
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
                id_pegawai,
                nama_lengkap,
                no_pegawai,
                email,
                hak_akses,
                status_pengguna,
                terakhir_login,
                tgl_bergabung
            } = request.query;
            let exec = null;
            let totalDt = 0;
            let qwhere = "";
            if (id_pegawai) {
                qwhere += ` AND pgn.id_pegawai ILIKE '%${id_pegawai}%'`;
            }
            if (nama_lengkap) {
                qwhere += ` AND pgn.nama_lengkap ILIKE '%${nama_lengkap}%'`;
            }
            if (no_pegawai) {
                qwhere += ` AND pgn.no_pegawai ILIKE '%${no_pegawai}%'`;
            }
            if (email) {
                qwhere += ` AND pgn.email ILIKE '%${email}%'`;
            }
            if (hak_akses) {
                qwhere += ` AND pgn.hak_akses ILIKE ${hak_akses}`;
            }
            if (status_pengguna) {
                qwhere += ` AND pgn.status_pengguna ILIKE ${status_pengguna}`;
            }
            if (terakhir_login) {
                qwhere += ` AND pgn.terakhir_login ILIKE '%${terakhir_login}%'`;
            }
            if (tgl_bergabung) {
                qwhere += ` AND pgn.tgl_bergabung ILIKE '%${tgl_bergabung}%'`;
            }
            exec = await fastify.pengguna.filter(limit, offset, qwhere);
            const {
                total
            } = await fastify.pengguna.countAllFilter(
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

    // create data pengguna
    fastify.post(
        "/create",
        {
            schema: {
                description:
                    "This is an endpoint for creating data pengguna",
                tags: ["manajemen pengguna"],
                body: {
                    description: "Payload for creating a pengguna",
                    type: "object",
                    properties: {
                        nama_lengkap: { type: "string" },
                        id_pegawai: { type: "string" },
                        no_pegawai: { type: "string" },
                        kata_sandi: { type: "string" },
                        email: { type: "string" },
                        hak_akses: { type: "number" },
                        status_pengguna: { type: "number" },
                        terakhir_login: { type: "string" },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            nama_lengkap: { type: "string" },
                            id_pegawai: { type: "string" },
                            no_pegawai: { type: "string" },
                            kata_sandi: { type: "string" },
                            email: { type: "string" },
                            hak_akses: { type: "number" },
                            status_pengguna: { type: "number" },
                            terakhir_login: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                id_pegawai,
                no_pegawai,
                kata_sandi,
                email,
                hak_akses,
                status_pengguna,
                nama_lengkap,
                terakhir_login } = request.body;
            const exec = await fastify.pengguna.create(
                id_pegawai,
                no_pegawai,
                kata_sandi,
                email,
                hak_akses,
                status_pengguna,
                nama_lengkap,
                terakhir_login
            );
            reply.code(201).send(exec);
        }
    );

    // update data pengguna 
    fastify.put(
        "/update/:id",
        {
            schema: {
                description:
                    "This is an endpoint for updating data pengguna",
                tags: ["manajemen pengguna"],
                params: {
                    description: "update data pengguna by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number",
                        },
                    },
                },
                body: {
                    description: "Payload for updating a data pengguna",
                    type: "object",
                    properties: {
                        nama_lengkap: { type: "string" },
                        id_pegawai: { type: "string" },
                        no_pegawai: { type: "string" },
                        kata_sandi: { type: "string" },
                        email: { type: "string" },
                        hak_akses: { type: "number" },
                        status_pengguna: { type: "number" },
                        terakhir_login: { type: "string" },
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
                id_pegawai,
                no_pegawai,
                kata_sandi,
                email,
                hak_akses,
                status_pengguna,
                nama_lengkap,
                terakhir_login,
            } = request.body;

            try {
                await fastify.pengguna.update(
                    id,
                    id_pegawai,
                    no_pegawai,
                    kata_sandi,
                    email,
                    hak_akses,
                    status_pengguna,
                    nama_lengkap,
                    terakhir_login
                );

                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // delete data pengguna
    fastify.delete(
        "/delete/:id",
        {
            schema: {
                description:
                    "This is an endpoint for deleting data pengguna",
                tags: ["manajemen pengguna"],
                params: {
                    description: "deleting data pengguna by Id",
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
                await fastify.pengguna.del(id, "");

                reply.send({ message: "success", code: 204 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );

    // unduh data pengguna
    fastify.get(
        "/unduh-data-pengguna", {
        schema: {
            description: "Endpoint ini digunakan untuk mengunduh data daftar pengguna",
            tags: ["manajemen pengguna"],
            querystring: {
                type: "object",
                properties: {
                    nama_lengkap: {
                        type: "string",
                    },
                    email: {
                        type: "string",
                    },
                    hak_akses: {
                        type: "number",
                    },
                },
            },
            response: {
                200: {
                    description: "Success Response",
                    type: "string",
                },
            },
        },
    },
        async (request, reply) => {
            const {
                nama_lengkap,
                email,
                hak_akses
            } = request.query;
            let headerPengguna = [];
            let dataPengguna = [];
            try {

                const wb = XLSX.utils.book_new();
                // Definisikan header
                headerPengguna = [
                    "Id",
                    "Nama Lengkap",
                    "Email",
                    "Hak Akses",
                    "tgl bergabung",
                    "terakhir login",
                ];
                let qwhere = "";
                if (nama_lengkap) {
                    qwhere += ` AND pgn.nama_lengkap ILIKE '%${nama_lengkap}%'`;
                }
                if (email) {
                    qwhere += ` AND pgn.email ILIKE '%${email}%'`;
                }
                if (hak_akses) {
                    qwhere += ` AND pgn.kepegawaian_nip = ${hak_akses}`;
                }

                const getData = await fastify.pengguna.getDataUnduhManajemenPengguna(qwhere);

                const convertData = await getData.map(function (item) {
                    return Object.values(item);
                });
                dataPengguna = convertData;

                // Definisikan rows untuk ditulis ke dalam spreadsheet
                const wsDataPengguna = [headerPengguna, ...dataPengguna];

                // Buat Workbook
                const fileName = "DATA DAFTAR PENGGUNA MANAJEMEN";
                wb.Props = {
                    Title: fileName,
                    Author: "SISAPPRA IAM",
                    CreatedDate: new Date(),
                };
                // Buat Sheet
                wb.SheetNames.push("DATA PENGGUNA MANAJEMEN");

                // Buat Sheet dengan Data
                const ws_pengguna = XLSX.utils.aoa_to_sheet(wsDataPengguna);

                // const ws = XLSX.utils.aoa_to_sheet(wsData);
                wb.Sheets["DATA PENGGUNA MANAJEMEN"] = ws_pengguna;

                const wopts = {
                    bookType: "xlsx",
                    bookSST: false,
                    type: "buffer"
                };
                const wBuffer = XLSX.write(wb, wopts);

                reply.header(
                    "Content-Type",
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                );
                reply.header(
                    "Content-Disposition",
                    "attachment; filename=" + `${fileName}.xlsx`
                );
                reply.send(wBuffer);
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );

}