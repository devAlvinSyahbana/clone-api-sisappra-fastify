const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_ppns = require("../../services/kepegawaian/kepegawaian_ppns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const kepegawaian_rekapitulasi = require("../../services/kepegawaian/kepegawaian_rekapitulasi");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
    fastify.register(kepegawaian_pns);
    fastify.register(kepegawaian_non_pns);
    fastify.register(kepegawaian_ppns);
    fastify.register(kepegawaian_rekapitulasi);
    fastify.register(multer.contentParser);
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

    fastify.post(
        "/rekapitulasi-duk-pegawai/create", {
            schema: {
                description: "This is an endpoint for creating a pegawai",
                tags: ["endpoint rekapitulasi pegawai pejabat"],
                body: {
                    description: "Payload for creating a pegawai",
                    type: "object",
                    properties: {
                        nama: {
                            type: "string",
                        },
                        nrk_nptt_npjlp: {
                            type: "number",
                        },
                        nip: {
                            type: "string",
                        },
                        status_pegawai: {
                            type: "string",
                        },
                        created_by: {
                            type: "number",
                        },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string",
                            },
                            code: {
                                type: "string",
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                nama,
                nrk_nptt_npjlp,
                nip,
                status_pegawai,
                created_by
            } =
            request.body;

            try {
                await fastify.kepegawaian_rekapitulasi.create_rekapitulasi_duk_pegawai(
                    nama,
                    nrk_nptt_npjlp,
                    nip,
                    status_pegawai,
                    created_by
                );
                reply.send({
                    message: "success",
                    code: 200,
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500,
                });
            }
        }
    );

    fastify.delete(
        "/rekapitulasi-duk-pegawai/delete/:id", {
            schema: {
                description: "This is an endpoint for DELETING an existing pegawai.",
                tags: ["endpoint rekapitulasi pegawai pejabat"],
                params: {
                    description: "pegawai by Id",
                    type: "object",
                    properties: {
                        id: {
                            type: "number",
                        },
                    },
                },
                body: {
                    description: "Payload for deleted data pegawai",
                    type: "object",
                    properties: {
                        status_pegawai: {
                            type: "string",
                        },
                        deleted_by: {
                            type: "number",
                        },
                    },
                },
                response: {
                    204: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string",
                            },
                            code: {
                                type: "string",
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
                status_pegawai,
                deleted_by
            } = request.body;

            try {
                await fastify.kepegawaian_rekapitulasi.del_rekapitulasi_duk_pegawai(
                    id,
                    status_pegawai,
                    deleted_by
                );
                reply.send({
                    message: "success",
                    code: 204,
                });
            } catch (error) {
                reply.send({
                    message: error.message,
                    code: 500,
                });
            }
        }
    );

    fastify.get(
        "/rekapitulasi-duk-pegawai/FindFilter", {
            schema: {
                description: "This is an endpoint for fetching a duk rekapitulasi",
                tags: ["endpoint rekapitulasi pegawai pejabat"],
                querystring: {
                    description: "Find one duk rekapitulasi pegawai polpp",
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
                        nama: {
                            type: "string",
                        },
                        nrk_nptt_pjlp: {
                            type: "string",
                        },
                        nip: {
                            type: "string",
                        },
                        status_pegawai: {
                            type: "string",
                        },
                        id_tempat_tugas: {
                            type: "number",
                        },
                        id_seksi_kecamatan: {
                            type: "number",
                        },
                        id_jabatan_kelurahan: {
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
                                type: "string",
                            },
                            code: {
                                type: "string",
                            },
                            data: {
                                type: "array",
                                items: {
                                    type: "object",
                                    properties: {
                                        id: {
                                            type: "number",
                                        },
                                        nama: {
                                            type: "string",
                                        },
                                        nip: {
                                            type: "string",
                                        },
                                        nrk_nptt_npjlp: {
                                            type: "number",
                                        },
                                        jabatan: {
                                            type: "string",
                                        },
                                        status_pegawai: {
                                            type: "string",
                                        },
                                        tempat_tugas: {
                                            type: "string",
                                        },
                                        tanggal_lahir: {
                                            type: "string",
                                        },
                                        agama: {
                                            type: "string",
                                        },
                                        alamat: {
                                            type: "string",
                                        },
                                    },
                                },
                            },
                            total_data: {
                                type: "number",
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const {
                nama,
                nip,
                nrk_nptt_pjlp,
                status_pegawai,
                id_tempat_tugas,
                id_seksi_kecamatan,
                id_jabatan_kelurahan,
                limit,
                offset,
            } = request.query;
            const exec =
                await fastify.kepegawaian_rekapitulasi.find_duk_rekapitulasi_pegawai(
                    nama,
                    nip,
                    nrk_nptt_pjlp,
                    status_pegawai,
                    id_tempat_tugas,
                    id_seksi_kecamatan,
                    id_jabatan_kelurahan,
                    limit,
                    offset
                );
            const {
                count
            } =
            await fastify.kepegawaian_rekapitulasi.count_duk_rekapitulasi_pegawai(
                nama,
                nip,
                nrk_nptt_pjlp,
                status_pegawai,
                id_tempat_tugas,
                id_seksi_kecamatan,
                id_jabatan_kelurahan,
            );

            try {
                if (exec) {
                    reply.send({
                        message: "success",
                        code: 200,
                        data: exec,
                        total_data: count,
                    });
                } else {
                    reply.send({
                        message: "success",
                        code: 204,
                    });
                }
            } catch (error) {
                reply.send({
                    message: error,
                    code: 500,
                });
            }
        }
    );

    fastify.get(
        "/rekapitulasi-duk-pegawai/UnduhPDF", {
            schema: {
                description: "This is an endpoint for fetching a duk rekapitulasi",
                tags: ["endpoint rekapitulasi pegawai pejabat"],
                querystring: {
                    description: "Find one duk rekapitulasi pegawai polpp",
                    type: "object",
                    properties: {
                        nama: {
                            type: "string",
                        },
                        nrk_nptt_pjlp: {
                            type: "string",
                        },
                        nip: {
                            type: "string",
                        },
                        status_pegawai: {
                            type: "string",
                        },
                        id_tempat_tugas: {
                            type: "number",
                        },
                        id_seksi_kecamatan: {
                            type: "number",
                        },
                        id_jabatan_kelurahan: {
                            type: "number",
                        },
                    },
                },
                response: {
                    200: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            message: {
                                type: "string",
                            },
                            code: {
                                type: "string",
                            },
                            data: {
                                type: "array",
                                items: {
                                    type: "object",
                                    properties: {
                                        id: {
                                            type: "number",
                                        },
                                        nama: {
                                            type: "string",
                                        },
                                        nip: {
                                            type: "string",
                                        },
                                        nrk_nptt_npjlp: {
                                            type: "number",
                                        },
                                        jabatan: {
                                            type: "string",
                                        },
                                        status_pegawai: {
                                            type: "string",
                                        },
                                        tempat_tugas: {
                                            type: "string",
                                        },
                                        tanggal_lahir: {
                                            type: "string",
                                        },
                                        agama: {
                                            type: "string",
                                        },
                                        alamat: {
                                            type: "string",
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
                nama,
                nip,
                nrk_nptt_pjlp,
                status_pegawai,
                id_tempat_tugas,
                id_seksi_kecamatan,
                id_jabatan_kelurahan,
            } = request.query;
            const exec =
                await fastify.kepegawaian_rekapitulasi.find_duk_rekapitulasi_pegawaiPDF(
                    nama,
                    nip,
                    nrk_nptt_pjlp,
                    status_pegawai,
                    id_tempat_tugas,
                    id_seksi_kecamatan,
                    id_jabatan_kelurahan,
                );
            console.log(exec)
            try {
                if (exec) {
                    reply.send({
                        message: "success",
                        code: 200,
                        data: exec,
                    });
                } else {
                    reply.send({
                        message: "success",
                        code: 204,
                    });
                }
            } catch (error) {
                reply.send({
                    message: error,
                    code: 500,
                });
            }
        }
    );

    fastify.get(
        "/rekapitulasi-duk-pegawai/UnduhExcel", {
            schema: {
                description: "This is an endpoint for fetching a rekapitulasi pegawai naik pangkat",
                tags: ["endpoint rekapitulasi pegawai pejabat"],
                querystring: {
                    description: "Find one jumlah pegawai polpp",
                    type: "object",
                    properties: {
                        nama: {
                            type: "string",
                        },
                        nrk_nptt_pjlp: {
                            type: "string",
                        },
                        nip: {
                            type: "string",
                        },
                        status_pegawai: {
                            type: "string",
                        },
                        id_tempat_tugas: {
                            type: "number",
                        },
                        id_seksi_kecamatan: {
                            type: "number",
                        },
                        id_jabatan_kelurahan: {
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
                nama,
                nip,
                nrk_nptt_pjlp,
                status_pegawai,
                id_tempat_tugas,
                id_seksi_kecamatan,
                id_jabatan_kelurahan,
            } = request.query;
            let headerData = [];
            let data = [];
            try {
                const wb = XLSX.utils.book_new();
                // Definisikan header
                headerData = [
                    "No",
                    "Nama",
                    "NIP",
                    "NRK/NPTT/NPJLP",
                    "Jabatan",
                    "Status Pegawai",
                    "Tempat Tugas",
                    "Tanggal Lahir",
                    "Agama",
                    "Alamat",
                ];

                const getData =
                    await fastify.kepegawaian_rekapitulasi.unduh_duk_rekapitulasi_pegawai(
                        nama,
                        nip,
                        nrk_nptt_pjlp,
                        status_pegawai,
                        id_tempat_tugas,
                        id_seksi_kecamatan,
                        id_jabatan_kelurahan,
                    );

                const convertData = getData.map(function (item) {
                    return Object.values(item);
                });
                data = convertData;

                // Definisikan rows untuk ditulis ke dalam spreadsheet
                const wsDataKepegawaian = [headerData, ...data];
                // Buat Workbook
                const fileName = "REKAPITULASI DUK KEPEGAWAIAN";
                wb.Props = {
                    Title: fileName,
                    Author: "SISAPPRA - REKAPITULASI DUK KEPEGAWAIAN",
                    CreatedDate: new Date(),
                };
                // Buat Sheet
                wb.SheetNames.push("DATA REKAPITULASI");
                // Buat Sheet dengan Data
                const ws = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
                // const ws = XLSX.utils.aoa_to_sheet(wsData);
                wb.Sheets["DATA REKAPITULASI"] = ws;

                const wopts = {
                    bookType: "xlsx",
                    bookSST: false,
                    type: "buffer",
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
                    code: 500,
                });
            }
        }
    );

    // ─────────────────────────────────────────────────────────────────────────────
};