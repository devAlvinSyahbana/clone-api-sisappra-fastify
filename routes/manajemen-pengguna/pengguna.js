const pengguna = require("../../services/manajemen-pengguna/pengguna");
const kepegawaian_pns = require("../../services/kepegawaian_service/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian_service/kepegawaian_non_pns");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
    fastify.register(pengguna);
    fastify.register(kepegawaian_pns);
    fastify.register(kepegawaian_non_pns);
    //------------ Define the Storage to Store files------------
    var filename = "";
    const storage = multer.diskStorage({
        destination: async (req, file, cb) => {
            let rParam = req.params;
            let rData = null;
            if (rParam.status == "PNS") {
                rData = await fastify.kepegawaian_pns.findone(rParam.id);
            } else {
                rData = await fastify.kepegawaian_non_pns.findone(rParam.id);
            }
            let fileFormat = file.mimetype.split("/");
            let dateTimestamp = Date.now();
            filename =
                rData.kepegawaian_nrk +
                "-" +
                file.fieldname +
                "-" +
                dateTimestamp +
                "." +
                fileFormat[fileFormat.length - 1];

            return cb(null, "uploads/kepegawaian");
        },
        filename: (req, file, cb) => {
            cb(null, filename);
        },
    });

    const upload = multer({
        storage: storage,
    });

    function truePath(path) {
        return path.replace(/\\/g, "/");
    }

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
    //     "/find-example",
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
    //                             tgl_bergabung: { type: "string" },
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
                    hak_akses: {
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
                                    nama_lengkap: {
                                        type: "string"
                                    },
                                    hak_akses: {
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
                nama_lengkap,
                hak_akses,
                terakhir_login,
                tgl_bergabung
            } = request.query;
            let exec = null;
            let totalDt = 0;
            let qwhere = "";
            if (nama_lengkap) {
                qwhere += ` AND pgn.nama_lengkap ILIKE '%${nama_lengkap}%'`;
            }
            if (hak_akses) {
                qwhere += ` AND pgn.hak_akses = ${hak_akses}`;
            }
            if (terakhir_login) {
                qwhere += ` AND pgn.terakhir_login ILIKE '%${terakhir_login}%'`;
            }
            if (tgl_bergabung) {
                qwhere += ` AND pgn.tgl_bergabung ILIKE '%${tgl_bergabung}%'`;
            }
            exec = await fastify.pengguna.filterNamaPegawai(limit, offset, qwhere);
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
                        created_by: { type: "number" },
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
                            created_by: { type: "number" },
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
                created_by } = request.body;
            const exec = await fastify.pengguna.create(
                id_pegawai,
                no_pegawai,
                kata_sandi,
                email,
                hak_akses,
                status_pengguna,
                nama_lengkap,
                created_by,
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
                        updated_by: { type: "number" },
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
                updated_by,
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
                    updated_by
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

    // upload file foto
    fastify.post(
        "/update-image/:id",
        {
            schema: {
                tags: ["manajemen pengguna"],
            },
            preHandler: upload.fields([
                {
                    name: "image",
                    maxCount: 1,
                },
            ]),
        },
        async (request, reply) => {
            const { id } = request.params;
            const image = request.files["image"]
                ? await truePath(request.files["image"][0].path)
                : "";
            try {
                await fastify.pengguna.updateFoto(
                    id,
                    "",
                    `image = '${image}',`
                );
                reply.send({ message: "success", code: 200 });
            } catch (error) {
                reply.send({ message: error.message, code: 500 });
            }
        }
    );
}