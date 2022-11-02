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
            offset: {
              type: "integer",
              default: 1,
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
        skpd,
        pejabat_ppns_nama,
        pejabat_ppns_nip,
        pejabat_ppns_nrk,
        pejabat_ppns_pangkat,
        pejabat_ppns_golongan
      } = request.query;
      let exec = null;
      let totalDt = 0;
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
        exec = await fastify.kepegawaian_ppns.filter(limit, offset, qwhere);
        const {
          total
        } = await fastify.kepegawaian_ppns.countAllFilter(
          qwhere
        );
        totalDt = total;
      } else {
        exec = await fastify.kepegawaian_ppns.find(limit, offset);
        const {
          total
        } = await fastify.kepegawaian_ppns.countAll();
        totalDt = total;
      }
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
  );

  // ^ find one by id
  fastify.get(
    "/PPNS/:id", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil seluruh data kepegawaian berstatus PPNS",
        tags: ["PPNS"],
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
      const exec = await fastify.kepegawaian_ppns.findOne(id);
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
    "/update-PPNS/:id", {
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

  // ^ Unduh
  fastify.get(
    "/unduh-PPNS", {
      schema: {
        description: "Endpoint unduh PPNS",
        tags: ["PPNS"],
        querystring: {
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
        skpd,
        pejabat_ppns_nama,
        pejabat_ppns_nip,
        pejabat_ppns_nrk,
        pejabat_ppns_pangkat,
        pejabat_ppns_golongan,
      } = request.query;
      let headerData = [];
      let data = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        headerData = ["Id", "SKPD", "Nama", "NIP", "NRK", "Pangkat", "Golongan", "No SK PPNS", "No KTP PPNS", "Wilayah Kerja", "UU Yang Dikawal", ];

        const getData = await fastify.kepegawaian_ppns.unduhPpns(skpd, pejabat_ppns_nama, pejabat_ppns_nip, pejabat_ppns_nrk, pejabat_ppns_pangkat, pejabat_ppns_golongan);
        const convertData = getData.map(function (item) {
          ``
          return Object.values(item);
        });
        data = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerData, ...data];
        // Buat Workbook
        const fileName = "Rekapitulasi Pegawai PPNS";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - Rekapitulasi Pegawai PPNS",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA Rekapitulasi PPNS");
        // Buat Sheet dengan Data
        const ws = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA Rekapitulasi PPNS"] = ws;

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