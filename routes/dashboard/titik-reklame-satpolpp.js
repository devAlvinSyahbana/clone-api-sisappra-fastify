const titik_reklame_satpolpp = require("../../services/dashboard/titik-reklame-satpolpp");

module.exports = async function (fastify, opts) {
    fastify.register(titik_reklame_satpolpp);

    // ^  titik reklame satpol pp
    fastify.get(
        "/titik-reklame-satpolpp", {
            schema: {
                description: "This is an endpoint for fetching all titik reklame per satpol pp",
                tags: ["dashboard_titik_reklame_satpolpp"],
                querystring: {
                    type: "object",
                    properties: {
                        produk: {
                            type: "string"
                        },
                        pemilik_reklame: {
                            type: "string"
                        },
                        nrk: {
                            type: "string"
                        },
                        nama: {
                            type: "string"
                        },
                        posisi: {
                            type: "string"
                        },
                        lokasi: {
                            type: "string"
                        },
                        tgl_pengecekan: {
                            type: "string"
                        }
                    },
                },
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
                                        produk: {
                                            type: "string"
                                        },
                                        pemilik_reklame: {
                                            type: "string"
                                        },
                                        konstruksi_reklame: {
                                            type: "string"
                                        },
                                        nrk: {
                                            type: "string"
                                        },
                                        nama: {
                                            type: "string"
                                        },
                                        tgl_pengecekan: {
                                            type: "string"
                                        },
                                        kawasan_kendali: {
                                            type: "string"
                                        },
                                        status: {
                                            type: "string"
                                        },
                                        keterangan: {
                                            type: "string"
                                        },
                                        lokasi: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        posisi: {
                                            type: "string"
                                        },
                                        ukuran: {
                                            type: "string"
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
            const {
                produk,
                pemilik_reklame,
                nrk,
                nama,
                posisi,
                lokasi,
                tgl_pengecekan
            } = request.query;
            let exec = null;
            let qwhere = "";
            if (produk || pemilik_reklame || nrk || nama || posisi || lokasi || tgl_pengecekan) {
                if (produk) {
                    qwhere += ` AND dtrs.produk = '${produk}'`;
                }
                if (pemilik_reklame) {
                    qwhere += ` AND dtrs.pemilik_reklame = '${pemilik_reklame}'`;
                }
                if (nrk) {
                    qwhere += ` AND dtrs.nrk = '${nrk}'`;
                }
                if (nama) {
                    qwhere += ` AND dtrs.nama = '${nama}'`;
                }
                if (posisi) {
                    qwhere += ` AND dtrs.posisi = '${posisi}'`;
                }
                if (lokasi) {
                    qwhere += ` AND dtrs.lokasi = '${lokasi}'`;
                }
                if (tgl_pengecekan) {
                    qwhere += ` AND dtrs.tgl_pengecekan = '${tgl_pengecekan}'`;
                }
                exec = await fastify.dashboard_titik_reklame_satpolpp.get_dashboard_titik_reklame_satpolpp(qwhere);
            }
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