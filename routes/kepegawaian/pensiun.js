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

  // ^ Find and Filter Pensiun 
  fastify.get(
    "/pegawai-pensiun", {
      schema: {
        description: "This is an endpoint for updating all pensiun",
        tags: ["pensiun"],
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
          required: ["limit", "offset", "status"],
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
                    nama: {
                      type: "string"
                    },
                    kepegawaian_nip: {
                      type: "string"
                    },
                    kepegawaian_nrk: {
                      type: "string"
                    },
                    kepegawaian_jabatan: {
                      type: "string"
                    },
                    kepegawaian_tempat_tugas: {
                      type: "string"
                    },
                    kepegawaian_subbag_seksi_kecamatan: {
                      type: "string"
                    },
                    tempat_lahir: {
                      type: "string"
                    },
                    tgl_lahir: {
                      type: "string"
                    },
                    tahun_pensiun: {
                      type: "string"
                    },
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
        limit,
        offset,
        nama,
        nopegawai,
        nip,
        tempat_tugas_bidang,
        tempat_tugas_kecamatan,
        status,
        tahun_pensiun
      } = request.query;
      let exec = null;
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
          exec = await fastify.kepegawaian_non_pns.filterPensiun(
            limit,
            offset,
            status,
            qwhere
          );
        } else {
          exec = await fastify.kepegawaian_non_pns.findPensiun(
            limit,
            offset,
            status
          );
        }
      }
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

  // ^ Unduh
  fastify.get(
    "/unduh-data-pegawai-pensiun", {
      schema: {
        description: "Endpoint ini digunakan untuk mengunduh data pegawai pensiun",
        tags: ["pensiun"],
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