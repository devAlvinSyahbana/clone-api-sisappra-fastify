const titik_reklame_citata = require("../../services/dashboard/titik-reklame-citata");

module.exports = async function (fastify, opts) {
    fastify.register(titik_reklame_citata);

    // ^  titik reklame satpol pp
    fastify.get(
        "/titik-reklame-citata", {
            schema: {
                description: "This is an endpoint for fetching all titik reklame per citata",
                tags: ["dashboard_titik_reklame_citata"],
                querystring: {
                    type: "object",
                    properties: {
                        produk: {
                            type: "string"
                        },
                        nama_perusahaan: {
                            type: "string"
                        },
                        pic: {
                            type: "string"
                        },
                        posisi: {
                            type: "string"
                        },
                        lokasi: {
                            type: "string"
                        },
                        tgl_sk_terbit: {
                            type: "string"
                        },
                        tgl_exp: {
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
                                        nama_perusahaan: {
                                            type: "string"
                                        },
                                        pic: {
                                            type: "string"
                                        },
                                        tgl_sk_terbit: {
                                            type: "string"
                                        },
                                        tgl_exp: {
                                            type: "string"
                                        },
                                        masa_berlaku: {
                                            type: "string"
                                        },
                                        lokasi: {
                                            type: "string"
                                        },
                                        kota: {
                                            type: "string"
                                        },
                                        kecamatan: {
                                            type: "string"
                                        },
                                        kelurahan: {
                                            type: "string"
                                        },
                                        lat: {
                                            type: "string"
                                        },
                                        long: {
                                            type: "string"
                                        },
                                        ukuran: {
                                            type: "string"
                                        },
                                        ketinggian: {
                                            type: "string"
                                        },
                                        keterangan: {
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
                nama_perusahaan,
                pic,
                posisi,
                lokasi,
                tgl_sk_terbit,
                tgl_exp
            } = request.query;
            let exec = null;
            let qwhere = "";
            if (produk || nama_perusahaan || pic || posisi || lokasi || tgl_sk_terbit || tgl_exp) {
                if (produk) {
                    qwhere += ` AND dtrc.produk = '${produk}'`;
                }
                if (nama_perusahaan) {
                    qwhere += ` AND dtrc.nama_perusahaan = '${nama_perusahaan}'`;
                }
                if (pic) {
                    qwhere += ` AND dtrc.pic = '${pic}'`;
                }
                if (posisi) {
                    qwhere += ` AND dtrc.posisi = '${posisi}'`;
                }
                if (lokasi) {
                    qwhere += ` AND dtrc.lokasi = '${lokasi}'`;
                }
                if (tgl_sk_terbit) {
                    qwhere += ` AND dtrc.tgl_sk_terbit = '${tgl_sk_terbit}'`;
                }
                if (tgl_exp) {
                    qwhere += ` AND dtrc.tgl_exp = '${tgl_exp}'`;
                }
                exec = await fastify.dashboard_titik_reklame_citata.get_dashboard_titik_reklame_citata(qwhere);
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