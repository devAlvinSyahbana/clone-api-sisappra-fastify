const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const kepegawaian_rekapitulasi = require("../../services/kepegawaian/kepegawaian_rekapitulasi");
const multer = require("fastify-multer");
const XLSX = require("xlsx");
// const moment = require("moment");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);
  fastify.register(kepegawaian_rekapitulasi);
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
    "/Pensiun", {
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
            // nama: {
            //   type: "string",
            // },
            // nrk_nptt_pjlp: {
            //   type: "string",
            // },
            tempat_tugas: {
              type: "number",
            },
            seksi_kecamatan: {
              type: "number",
            },
            // status_pegawai: {
            //   type: "string",
            // },
            tahun_pensiun: {
              type: "number",
            },
          },
          required: ["limit", "offset"],
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
                    id: {
                      type: "number"
                    },
                    nama: {
                      type: "string"
                    },
                    nip: {
                      type: "string"
                    },
                    nrk_nptt_pjlp: {
                      type: "string"
                    },
                    kepegawaian_status_pegawai: {
                      type: "string"
                    },
                    jabatan: {
                      type: "string"
                    },
                    tempat_tugas: {
                      type: "string"
                    },
                    subbag_seksi_kecamatan: {
                      type: "string"
                    },
                    tempat_lahir: {
                      type: "string"
                    },
                    tgl_lahir: {
                      type: "string"
                    },
                    tahun_pensiun: {
                      type: "number"
                    },
                  },
                }
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
        nama,
        nrk_nptt_pjlp,
        tempat_tugas,
        seksi_kecamatan,
        status_pegawai,
        tahun_pensiun
      } = request.query;
      const exec = await fastify.kepegawaian_rekapitulasi.PensiunFindFilter(nama, nrk_nptt_pjlp, tempat_tugas, seksi_kecamatan, status_pegawai, tahun_pensiun, limit, offset);
      const {
        count
      } = await fastify.kepegawaian_rekapitulasi.PensiunCount(nama, nrk_nptt_pjlp, tempat_tugas, seksi_kecamatan, status_pegawai, tahun_pensiun);
      console.log(count)
      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec,
            total_data: count
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500
        });
      }
    }
  );

  // ^ Unduh
  fastify.get(
    "/Pensiun-unduh", {
      schema: {
        description: "This is an endpoint for fetching a rekapitulasi pegawai pensiun",
        tags: ["pensiun"],
        querystring: {
          description: "Find one pegawai pensiun",
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            nrk_nptt_pjlp: {
              type: "string",
            },
            tempat_tugas: {
              type: "number",
            },
            seksi_kecamatan: {
              type: "number",
            },
            status_pegawai: {
              type: "string",
            },
            tahun_pensiun: {
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
        nrk_nptt_pjlp,
        tempat_tugas,
        seksi_kecamatan,
        status_pegawai,
        tahun_pensiun
      } = request.query;
      let headerData = [];
      let data = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        headerData = ["Nama", "NIP", "No Pegawai", "Status Pegawai", "Jabatan", "Tempat Tugas", "Subbag Seksi Kecamatan", "Tempat Lahir", "Tanggal Lahir", "Tahun Pensiun"];


        const getData = await fastify.kepegawaian_rekapitulasi.PensiunUnduh(nama, nrk_nptt_pjlp, tempat_tugas, seksi_kecamatan, status_pegawai, tahun_pensiun);

        const convertData = getData.map(function (item) {
          return Object.values(item);
        });
        data = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerData, ...data];
        // Buat Workbook
        const fileName = "REKAPITULASI PENSIUN KEPEGAWAIAN";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - REKAPITULASI PENSIUN KEPEGAWAIAN",
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