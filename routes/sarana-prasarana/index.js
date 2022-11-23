const sarana_prasarana = require("../../services/sarana_prasarana");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
    fastify.register(sarana_prasarana);
    //------------ Define the Storage to Store files------------
    var filename = "";
    const storage = multer.diskStorage({
        destination: async (req, file, cb) => {
            let fileFormat = file.mimetype.split("/");
            let dateTimestamp = Date.now();
            filename =
                dateTimestamp +
                "-" +
                file.fieldname +
                "." +
                fileFormat[fileFormat.length - 1];

            return cb(null, "uploads/sarana_prasarana");
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

    fastify.get(
        "/all", {
            schema: {
                description: "This is an endpoint for fetching all sarana_prasarana",
                tags: ["sarana-prasarana"],
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
            const exec = await fastify.sarana_prasarana.find_all_sarana_prasarana();
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
        "/findone/:id", {
            schema: {
                description: "This is an endpoint for fetching a sarana_prasarana by id",
                tags: ["sarana-prasarana"],
                params: {
                    description: "Find one sarana_prasarana by id",
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
                                    jenis_sarana_prasarana_id: {
                                        type: "number"
                                    },
                                    jenis_sarana_prasarana_name: {
                                        type: "string"
                                    },
                                    status_sarana_prasarana_id: {
                                        type: "number"
                                    },
                                    status_sarana_prasarana_name: {
                                        type: "string"
                                    },
                                    jumlah: {
                                        type: "number"
                                    },
                                    kondisi_id: {
                                        type: "number"
                                    },
                                    kondisi_name: {
                                        type: "string"
                                    },
                                    keterangan: {
                                        type: "string"
                                    },
                                    dokumentasi: {
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
            const exec = await fastify.sarana_prasarana.findone(id);
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
        "/findjenis/:jenis_sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching a sarana_prasarana by id",
                tags: ["sarana-prasarana"],
                params: {
                    description: "Find one sarana_prasarana by id",
                    type: "object",
                    properties: {
                        jenis_sarana_prasarana: {
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
                                        jenis_sarana_prasarana: {
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
                jenis_sarana_prasarana
            } = request.params;
            const exec = await fastify.sarana_prasarana.find_jenis_sarana_prasarana(
                jenis_sarana_prasarana
            );

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
        "/findstatus/:status_sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching a sarana_prasarana by id",
                tags: ["sarana-prasarana"],
                params: {
                    description: "Find one sarana_prasarana by id",
                    type: "object",
                    properties: {
                        status_sarana_prasarana: {
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
                                        status_sarana_prasarana: {
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
                status_sarana_prasarana
            } = request.params;
            const exec = await fastify.sarana_prasarana.find_status_sarana_prasarana(
                status_sarana_prasarana
            );

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
        "/findkondisi/:kondisi_sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching a sarana_prasarana by id",
                tags: ["sarana-prasarana"],
                params: {
                    description: "Find one sarana_prasarana by id",
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
                kondisi_sarana_prasarana
            } = request.params;
            const exec = await fastify.sarana_prasarana.find_kondisi_sarana_prasarana(
                kondisi_sarana_prasarana
            );

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
        "/filter", {
            schema: {
                description: "This is an endpoint for fetching a sarana_prasarana by id",
                tags: ["sarana-prasarana"],
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
                        jenis_sarana_prasarana: {
                            type: "integer",
                        },
                        status_sarana_prasarana: {
                            type: "integer",
                        },
                        kondisi_sarana_prasarana: {
                            type: "integer",
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
                                        jenis_sarana_prasarana: {
                                            type: "string"
                                        },
                                        status_sarana_prasarana: {
                                            type: "string"
                                        },
                                        jumlah: {
                                            type: "number"
                                        },
                                        kondisi: {
                                            type: "string"
                                        },
                                        keterangan: {
                                            type: "string"
                                        },
                                        dokumentasi: {
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
                jenis_sarana_prasarana,
                status_sarana_prasarana,
                kondisi_sarana_prasarana,
            } = request.query;
            let exec = null;
            let totalDt = 0;
            let qwhere = "";
            if (jenis_sarana_prasarana) {
                qwhere += ` AND sp.jenis_sarana_prasarana = ${jenis_sarana_prasarana}`;
            }
            if (status_sarana_prasarana) {
                qwhere += ` AND sp.status_sarana_prasarana = ${status_sarana_prasarana}`;
            }
            if (kondisi_sarana_prasarana) {
                qwhere += ` AND sp.kondisi = ${kondisi_sarana_prasarana}`;
            }
            exec = await fastify.sarana_prasarana.filter(limit, offset, qwhere);
            const {
                total
            } = await fastify.sarana_prasarana.countAllFilter(qwhere);
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
                    message: error,
                    code: 500
                });
            }
        }
    );

    fastify.post(
        "/create", {
            schema: {
                description: "This is an endpoint for creating a sample crud",
                tags: ["sarana-prasarana"],
                body: {
                    description: "Payload for creating a sample crud",
                    type: "object",
                    properties: {
                        jenis_sarana_prasarana: {
                            type: "number",
                        },
                        status_sarana_prasarana: {
                            type: "number",
                        },
                        jumlah: {
                            type: "number",
                        },
                        kondisi: {
                            type: "number",
                        },
                        keterangan: {
                            type: "string",
                        },
                        created_by: {
                            type: "string",
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
                            data: {
                                type: "object",
                                properties: {
                                    return_id: {
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
                jenis_sarana_prasarana,
                status_sarana_prasarana,
                jumlah,
                kondisi,
                keterangan,
                created_by,
            } = request.body;
            try {
                const {
                    id
                } = await fastify.sarana_prasarana.create(
                    jenis_sarana_prasarana,
                    status_sarana_prasarana,
                    jumlah,
                    kondisi,
                    keterangan,
                    created_by
                );
                reply.send({
                    message: "success",
                    code: 200,
                    data: {
                        return_id: id
                    }
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500
                });
            }
        }
    );

    fastify.post(
        "/upload-file/:id", {
            schema: {
                tags: ["sarana-prasarana"],
            },
            preHandler: upload.fields([{
                name: "file_dokumentasi",
                maxCount: 1
            }]),
        },
        async (request, reply) => {
            const {
                id
            } = request.params;
            const file_dokumentasi = request.files["file_dokumentasi"] ?
                await truePath(request.files["file_dokumentasi"][0].path) :
                "";
            try {
                await fastify.sarana_prasarana.updateFile(id, file_dokumentasi, "");
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
                description: "This is an endpoint for updating an existing sarana_prasarana",
                tags: ["sarana-prasarana"],
                params: {
                    description: "update sarana_prasarana by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number",
                        },
                    },
                },
                body: {
                    description: "Payload for updating a sarana_prasarana",
                    type: "object",
                    properties: {
                        jenis_sarana_prasarana: {
                            type: "number"
                        },
                        status_sarana_prasarana: {
                            type: "number"
                        },
                        jumlah: {
                            type: "number"
                        },
                        kondisi: {
                            type: "number"
                        },
                        keterangan: {
                            type: "string"
                        },
                        updated_by: {
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
                jenis_sarana_prasarana,
                status_sarana_prasarana,
                jumlah,
                kondisi,
                keterangan,
                updated_by,
            } = request.body;

            try {
                await fastify.sarana_prasarana.update(
                    id,
                    jenis_sarana_prasarana,
                    status_sarana_prasarana,
                    jumlah,
                    kondisi,
                    keterangan,
                    updated_by
                );

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
                description: "This is an endpoint for DELETING an existing sarana_prasarana",
                tags: ["sarana-prasarana"],
                params: {
                    description: "sarana_prasarana by Id",
                    type: "object",
                    properties: {
                        id: {
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

            try {
                await fastify.sarana_prasarana.del(id, "");
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
        "/unduh", {
            schema: {
                description: "Endpoint ini digunakan untuk mengunduh seluruh data sarana dan prasarana",
                tags: ["sarana-prasarana"],
                querystring: {
                    type: "object",
                    properties: {
                        jenis_sarana_prasarana: {
                            type: "integer",
                        },
                        status_sarana_prasarana: {
                            type: "integer",
                        },
                        kondisi_sarana_prasarana: {
                            type: "integer",
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
                jenis_sarana_prasarana,
                status_sarana_prasarana,
                kondisi_sarana_prasarana,
            } = request.query;
            let qwhere = "";
            if (jenis_sarana_prasarana) {
                qwhere += ` AND sp.jenis_sarana_prasarana = ${jenis_sarana_prasarana}`;
            }
            if (status_sarana_prasarana) {
                qwhere += ` AND sp.status_sarana_prasarana = ${status_sarana_prasarana}`;
            }
            if (kondisi_sarana_prasarana) {
                qwhere += ` AND sp.kondisi = ${kondisi_sarana_prasarana}`;
            }
            let headerData = [];
            let data = [];
            try {
                const wb = XLSX.utils.book_new();
                // Definisikan header
                headerData = [
                    //data pribadi
                    "Jenis Sarana & Prasarana",
                    "Status Sarana & Prasarana",
                    "Jumlah",
                    "Kondisi",
                    "Keterangan",
                ];

                const getData = await fastify.sarana_prasarana.unduh(qwhere);
                const convertData = getData.map(function (item) {
                    return Object.values(item);
                });
                data = convertData;

                // Definisikan rows untuk ditulis ke dalam spreadsheet
                const wsDataKepegawaian = [headerData, ...data];
                // Buat Workbook
                const fileName = "DATA SARANA DAN PRASARANA";
                wb.Props = {
                    Title: fileName,
                    Author: "SISAPPRA - SARANA DAN PRASARANA",
                    CreatedDate: new Date(),
                };
                // Buat Sheet
                wb.SheetNames.push("DATA SARANA PRASARANA");
                // Buat Sheet dengan Data
                const ws = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
                // const ws = XLSX.utils.aoa_to_sheet(wsData);
                wb.Sheets["DATA SARANA PRASARANA"] = ws;

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
};