const kepegawaian_ppns = require("../../services/kepegawaian/kepegawaian_ppns");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_ppns);
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

  // ─── Ppns ───────────────────────────────────────────────────────────────────────
  // ^ find
  fastify.get(
    "/PPNS", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil seluruh data kepegawaian berstatus PPNS",
        tags: ["PPNS"],
        querystring: {
          type: "object",
          properties: {
            limit: {
              type: "number",
              default: 10,
            },
            skpd: {
              type: "number"
            },
            pejabat_ppns_nama: {
              type: "string"
            },
            pejabat_ppns_nip: {
              type: "string"
            },
            pejabat_ppns_nrk: {
              type: "string"
            },
            pejabat_ppns_pangkat: {
              type: "number"
            },
            pejabat_ppns_golongan: {
              type: "number"
            },
          },
          required: ["limit"],
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
                    skpd: {
                      type: "string"
                    },
                    pejabat_ppns_nama: {
                      type: "string"
                    },
                    pejabat_ppns_nip: {
                      type: "string"
                    },
                    pejabat_ppns_nrk: {
                      type: "string"
                    },
                    pejabat_ppns_pangkat: {
                      type: "string"
                    },
                    pejabat_ppns_golongan: {
                      type: "string"
                    },
                    no_sk_ppns: {
                      type: "string"
                    },
                    no_ktp_ppns: {
                      type: "string"
                    },
                    wilayah_kerja: {
                      type: "string"
                    },
                    uu_yg_dikawal: {
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
        limit,
        skpd,
        pejabat_ppns_nama,
        pejabat_ppns_nip,
        pejabat_ppns_nrk,
        pejabat_ppns_pangkat,
        pejabat_ppns_golongan
      } = request.query;
      let exec = null;
      let qwhere = "";
      if (skpd || pejabat_ppns_nama || pejabat_ppns_nip || pejabat_ppns_nrk || pejabat_ppns_pangkat || pejabat_ppns_golongan) {
        if (skpd) {
          qwhere += ` AND skpd = ${skpd}`;
        }
        if (pejabat_ppns_nama) {
          qwhere += ` AND pejabat_ppns_nama ILIKE '%${pejabat_ppns_nama}%'`;
        }
        if (pejabat_ppns_nip) {
          qwhere += ` AND pejabat_ppns_nip ILIKE '%${pejabat_ppns_nip}%'`;
        }
        if (pejabat_ppns_nrk) {
          qwhere += ` AND pejabat_ppns_nrk ILIKE '%${pejabat_ppns_nrk}%'`;
        }
        if (pejabat_ppns_pangkat) {
          qwhere += ` AND pejabat_ppns_pangkat = ${pejabat_ppns_pangkat}`;
        }
        if (pejabat_ppns_golongan) {
          qwhere += ` AND pejabat_ppns_golongan = ${pejabat_ppns_golongan}`;
        }
        exec = await fastify.kepegawaian_ppns.filter(limit, qwhere);
      } else {
        exec = await fastify.kepegawaian_ppns.find(limit);
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

  // ^ Post
  fastify.post(
    "/create-PPNS", {
      schema: {
        description: "This is an endpoint for creating data PPNS",
        tags: ["PPNS"],
        body: {
          description: "Payload for creating data PPNS",
          type: "object",
          properties: {
            skpd: {
              type: "number"
            },
            pejabat_ppns_nama: {
              type: "string"
            },
            pejabat_ppns_nip: {
              type: "string"
            },
            pejabat_ppns_nrk: {
              type: "string"
            },
            pejabat_ppns_pangkat: {
              type: "number"
            },
            pejabat_ppns_golongan: {
              type: "number"
            },
            no_sk_ppns: {
              type: "string"
            },
            no_ktp_ppns: {
              type: "string"
            },
            wilayah_kerja: {
              type: "string"
            },
            uu_yg_dikawal: {
              type: "string"
            },
            created_by: {
              type: "string"
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
                  id: {
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
        skpd,
        pejabat_ppns_nama,
        pejabat_ppns_nip,
        pejabat_ppns_nrk,
        pejabat_ppns_pangkat,
        pejabat_ppns_golongan,
        no_sk_ppns,
        no_ktp_ppns,
        wilayah_kerja,
        uu_yg_dikawal,
        created_by
      } = request.body;
      try {
        const {
          id
        } = await fastify.kepegawaian_ppns.create(
          skpd,
          pejabat_ppns_nama,
          pejabat_ppns_nip,
          pejabat_ppns_nrk,
          pejabat_ppns_pangkat,
          pejabat_ppns_golongan,
          no_sk_ppns,
          no_ktp_ppns,
          wilayah_kerja,
          uu_yg_dikawal,
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

  // ^ Edit
  fastify.put(
    "/update-ppns/:id", {
      schema: {
        description: "Endpoint ini digunakan untuk mengubah data kepegawaian dari salah satu pegawai berstatus PPNS berdasarkan id",
        tags: ["PPNS"],
        params: {
          description: "update PPNS by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            skpd: {
              type: "number"
            },
            pejabat_ppns_nama: {
              type: "string"
            },
            pejabat_ppns_nip: {
              type: "string"
            },
            pejabat_ppns_nrk: {
              type: "string"
            },
            pejabat_ppns_pangkat: {
              type: "number"
            },
            pejabat_ppns_golongan: {
              type: "number"
            },
            no_sk_ppns: {
              type: "string"
            },
            no_ktp_ppns: {
              type: "string"
            },
            wilayah_kerja: {
              type: "string"
            },
            uu_yg_dikawal: {
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
        id,
      } = request.params;
      const {
        skpd,
        pejabat_ppns_nama,
        pejabat_ppns_nip,
        pejabat_ppns_nrk,
        pejabat_ppns_pangkat,
        pejabat_ppns_golongan,
        no_sk_ppns,
        no_ktp_ppns,
        wilayah_kerja,
        uu_yg_dikawal,
        updated_by
      } = request.body;
      try {
        await fastify.kepegawaian_ppns.update(
          skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan, no_sk_ppns, no_ktp_ppns, wilayah_kerja, uu_yg_dikawal, updated_by, id
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

  // ─── Rekap PPNS ──────────────────────────────────────────────────────────────
  // ^ table ppns
  fastify.get(
    "/PPNS-rekapitulasi", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil seluruh Rekapitulasi data kepegawaian berstatus PPNS",
        tags: ["PPNS"],
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
                    skpd: {
                      type: "string"
                    },
                    jumlah: {
                      type: "number"
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
      const exec = await fastify.kepegawaian_ppns.find_rekap();
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

  // ^ bawah table ppns
  fastify.get(
    "/PPNS-rekapitulasi-jumlah", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil seluruh Rekapitulasi data kepegawaian berstatus PPNS",
        tags: ["PPNS"],
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
                  jumlah_ppns: {
                    type: "number"
                  },
                  satpol_pp: {
                    type: "number"
                  },
                  skpd_lain: {
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
      const exec = await fastify.kepegawaian_ppns.find_rekap_jumlah();
      console.log(exec)
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