const laporan_pengawasan = require("../../../services/pelaporan/laporan_pengawasan");

module.exports = async function (fastify, opts) {
    fastify.register(laporan_pengawasan);

    fastify.get(
        "/find",
        {
            schema: {
                description:
                    "API untuk mengambil seluruh Laporan pengawasan",
                tags: ["laporan pengawasan"],
                response: {
                    200: {
                        description: "Berhasil Bro!",
                        type: "array",
                        items: {
                            type: "object",
                            properties: {
                                id: { type: "number" },
                                nrk: { type: "string" },
                                nama: { type: "string" },
                                tgl_pengecekan: { type: "string" },
                                share_location: { type: "string" },
                                alamat: { type: "string" },
                                lokasi_tiang: { type: "string" },
                                kawasan_kendali: { type: "string" },
                                status: { type: "string" },
                                ukuran: { type: "string" },
                                pemilik_reklame: { type: "string" },
                                konstruksi_reklame: { type: "string" },
                                konten_iklan: { type: "string" },
                            },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.laporan_pengawasan.find();
            console.log("string", exec)
            return exec;
        }
    );

    fastify.get(
        "/findone/:id",
        {
            schema: {
                description:
                    "API untuk mengambil Laporan pengawasan berdasarkan id",
                tags: ["laporan pengawasan"],
                params: {
                    description: "laporan pengawasan dari Id",
                    type: "object",
                    properties: {
                        id: { type: "number" },
                    },
                },
                response: {
                    200: {
                        description: "Berhasil Bro!",
                        type: "object",
                        properties: {
                            nrk: { type: "string" },
                            nama: { type: "string" },
                            tgl_pengecekan: { type: "string" },
                            share_location: { type: "string" },
                            alamat: { type: "string" },
                            lokasi_tiang: { type: "string" },
                            kawasan_kendali: { type: "string" },
                            status: { type: "string" },
                            ukuran: { type: "string" },
                            pemilik_reklame: { type: "string" },
                            konstruksi_reklame: { type: "string" },
                            konten_iklan: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const { id } = request.params;
            const exec = await fastify.laporan_pengawasan.findone(id);
            return exec;
        }
    );

    fastify.post(
        "/create",
        {
            schema: {
                description:
                    "API membuat laporan pengawasan",
                tags: ["laporan pengawasan"],
                body: {
                    description: "Payload for creating a laporan pengawasan",
                    type: "object",
                    properties: {
                        nrk: { type: "string" },
                        nama: { type: "string" },
                        tgl_pengecekan: { type: "string" },
                        share_location: { type: "string" },
                        alamat: { type: "string" },
                        lokasi_tiang: { type: "string" },
                        kawasan_kendali: { type: "string" },
                        status: { type: "string" },
                        ukuran: { type: "string" },
                        pemilik_reklame: { type: "string" },
                        konstruksi_reklame: { type: "string" },
                        konten_iklan: { type: "string" },
                    },
                },
                response: {
                    201: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            nrk: { type: "string" },
                            nama: { type: "string" },
                            tgl_pengecekan: { type: "string" },
                            share_location: { type: "string" },
                            alamat: { type: "string" },
                            lokasi_tiang: { type: "string" },
                            kawasan_kendali: { type: "string" },
                            status: { type: "string" },
                            ukuran: { type: "string" },
                            pemilik_reklame: { type: "string" },
                            konstruksi_reklame: { type: "string" },
                            konten_iklan: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const { nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan } = request.body;
            const exec = await fastify.laporan_pengawasan.create(
                nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan
            );
            reply.code(201).send(exec);
        }
    );

    fastify.put(
        "/update/:id",
        {
            schema: {
                description:
                    "API mengubah laporan pengawasan",
                tags: ["laporan pengawasan"],
                params: {
                    description: "Master area dampak risiko by Id",
                    type: "object",
                    properties: {
                        id: { type: "number" },
                    },
                },
                body: {
                    description: "Payload for updating a laporan pengawasan",
                    type: "object",
                    properties: {
                        nrk: { type: "string" },
                        nama: { type: "string" },
                        tgl_pengecekan: { type: "string" },
                        share_location: { type: "string" },
                        alamat: { type: "string" },
                        lokasi_tiang: { type: "string" },
                        kawasan_kendali: { type: "string" },
                        status: { type: "string" },
                        ukuran: { type: "string" },
                        pemilik_reklame: { type: "string" },
                        konstruksi_reklame: { type: "string" },
                        konten_iklan: { type: "string" },
                    },
                },
                response: {
                    200: {
                        description: "Success Response",
                        type: "object",
                        properties: {
                            id: { type: "number" },
                            nrk: { type: "string" },
                            nama: { type: "string" },
                            tgl_pengecekan: { type: "string" },
                            share_location: { type: "string" },
                            alamat: { type: "string" },
                            lokasi_tiang: { type: "string" },
                            kawasan_kendali: { type: "string" },
                            status: { type: "string" },
                            ukuran: { type: "string" },
                            pemilik_reklame: { type: "string" },
                            konstruksi_reklame: { type: "string" },
                            konten_iklan: { type: "string" },
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const { id } = request.params;
            const { nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan } = request.body;
            const exec = await fastify.laporan_pengawasan.update(
                id, nrk, nama, tgl_pengecekan, share_location, alamat, lokasi_tiang, kawasan_kendali, status, ukuran, pemilik_reklame, konstruksi_reklame, konten_iklan
            );

            return exec;
        }
    );

    fastify.delete(
        "/delete/:id",
        {
            schema: {
                description:
                    "This is an endpoint for DELETING an existing laporan pengawasan.",
                tags: ["laporan pengawasan"],
                params: {
                    description: "Master area dampak risiko by Id",
                    type: "object",
                    properties: {
                        id: { type: "number" },
                    },
                },
                response: {
                    204: {
                        type: "string",
                        default: "No Content",
                    },
                },
            },
        },
        async (request, reply) => {
            const { id } = request.params;
            await fastify.laporan_pengawasan.del(id);

            reply.status(204);
        }
    );
};
