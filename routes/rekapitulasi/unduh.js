const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
    fastify.register(kepegawaian_pns);
    fastify.register(kepegawaian_non_pns);

    fastify.get(
        "/unduh-pegawai",
        {
            schema: {
                description:
                    "Endpoint ini digunakan untuk mengunduh seluruh data kepegawaian berstatus PNS, PTT, PJLP",
                tags: ["endpoint kepegawaian"],
                querystring: {
                    type: "object",
                    properties: {
                        status: {
                            type: "string",
                        },
                    },
                    required: ["status"],
                },
                response: {
                    200: {
                        description: "Success Response",
                        type: "string",
                    },
                },
            },
        },

        
    )
}