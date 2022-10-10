const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);
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
        offset,
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
        uu_yg_dikawal
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
          uu_yg_dikawal
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

  // ^ Pensiun
  fastify.get(
    "/unduh-data-pegawai-pensiun", {
      schema: {
        description: "Endpoint ini digunakan untuk mengunduh data pegawai pensiun",
        tags: ["endpoint rekapitulasi pegawai pensiun"],
        querystring: {
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            nopegawai: {
              type: "string",
            },
            nip: {
              type: "string",
            },
            tempat_tugas_bidang: {
              type: "string",
            },
            tempat_tugas_kecamatan: {
              type: "string",
            },
            status: {
              type: "string",
            },
            tahun_pensiun: {
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
    async (request, reply) => {
      const {
        nama,
        nopegawai,
        nip,
        tempat_tugas_bidang,
        tempat_tugas_kecamatan,
        status,
        tahun_pensiun
      } = request.query;
      let headerpensiun = [];
      let datapensiun = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        headerpensiun = [
          "Nama",
          "No pegawai",
          "NIP",
          "Jabatan",
          "Tempat Tugas / Bidang",
          "Tempat Tugas Kecamatan / Seksi",
          "Status",
          "Tahun Pensiun",
        ];

        let qwhere = "";
        if (status === "PNS") {
          if (nama || nopegawai || nip || tempat_tugas_bidang || tempat_tugas_kecamatan || tahun_pensiun) {
            if (nama) {
              qwhere += ` AND kpns.nama ILIKE '%${nama}%'`;
            }
            if (nopegawai) {
              qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nopegawai}%'`;
            }
            if (nip) {
              qwhere += ` AND kpns.kepegawaian_nip ILIKE '%${nip}%'`;
            }
            if (tempat_tugas_bidang) {
              qwhere += ` AND kpns.tempat_tugas_bidang ILIKE '%${tempat_tugas_bidang}%'`;
            }
            if (tempat_tugas_kecamatan) {
              qwhere += ` AND kpns.kepegawaian_subbag_seksi_kecamatan ILIKE '%${tempat_tugas_kecamatan}%'`;
            }
            if (tahun_pensiun) {
              qwhere += ` AND CASE WHEN kepegawaian_eselon = 1 or kepegawaian_eselon = 2 THEN EXTRACT(YEAR FROM tgl_lahir) + 60 ELSE EXTRACT(YEAR FROM tgl_lahir) + 58 END = ${tahun_pensiun}`;
            }
            exec = await fastify.kepegawaian_pns.filterPensiun(limit, offset, qwhere);
          } else {
            exec = await fastify.kepegawaian_pns.findPensiun(limit, offset);
          }
        } else {
          if (nama || nopegawai || nip || tempat_tugas_bidang || tempat_tugas_kecamatan || status || tahun_pensiun) {
            if (nama) {
              qwhere += ` AND nama ILIKE '%${nama}%'`;
            }
            if (nopegawai) {
              qwhere += ` AND kepegawaian_nptt_npjlp ILIKE '%${nopegawai}%'`;
            }
            if (nip) {
              qwhere += ` AND kpns.kepegawaian_nip ILIKE '%${nip}%'`;
            }
            if (tempat_tugas_bidang) {
              qwhere += ` AND tempat_tugas_bidang ILIKE '%${tempat_tugas_bidang}%'`;
            }
            if (tempat_tugas_kecamatan) {
              qwhere += ` AND kepegawaian_subbag_seksi_kecamatan ILIKE '%${tempat_tugas_kecamatan}%'`;
            }
            if (status) {
              qwhere += ` AND kepegawaian_status_pegawai ILIKE '%${status}%'`;
            }
            if (tahun_pensiun) {
              qwhere += ` AND CASE WHEN kepegawaian_eselon = 1 or kepegawaian_eselon = 2 THEN EXTRACT(YEAR FROM tgl_lahir) + 60 ELSE EXTRACT(YEAR FROM tgl_lahir) + 58 END = ${tahun_pensiun}`;
            }
            getData = await fastify.kepegawaian_non_pns.filterPensiun(
              limit,
              offset,
              status,
              qwhere
            );
          } else {
            getData = await fastify.kepegawaian_non_pns.findPensiun(
              limit,
              offset,
              status
            );
          }
        }
        const convertData = await getData.map(function (item) {
          return Object.values(item);
        });
        datapensiun = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDatapensiun = [headerpensiun, ...datapensiun];
        console.log(wsDatapensiun)

        // Buat Workbook
        const fileName = "DATA PEGAWAIAN PPNS";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - pensiun",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA PPNS");

        // Buat Sheet dengan Data
        const ws_pensiun = XLSX.utils.aoa_to_sheet(wsDatapensiun);

        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA PPNS"] = ws_pensiun;


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