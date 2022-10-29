const akses_kontrol = require("../../services/manajemen-pengguna/akses_kontrol");

module.exports = async function (fastify, opts) {
    fastify.register(akses_kontrol);

    // get semua data pengguna
    fastify.get(
        "/find",
        {
            schema: {
                description:
                    "API untuk mengambil seluruh data akses kontrol",
                tags: ["akses kontrol"],
                response: {
                    200: {
                        description: "Succes Response",
                        type: "array",
                        items: {
                            type: "object",
                            properties: {
                                id: { type: "number" },
                                nama_akses_kontrol: { type: "string" },
                                kode_akses_kontrol: { type: "string" },
                                level: { type: "string" },
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.akses_kontrol.find();
            console.log("string", exec)
            return exec;
        }
    );
}