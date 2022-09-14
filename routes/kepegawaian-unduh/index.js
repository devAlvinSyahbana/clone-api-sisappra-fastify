const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const XLSX = require("xlsx");
const path = require("path");
const fs = require("fs");

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
    async (request, reply) => {
      const { status } = request.query;
      let headerKepegawaian = [];
      let dataKepegawaian = [];
      //   let headerKeluarga = [];
      //   let headerPendidikan = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        if (status == "PNS") {
          headerKepegawaian = [
            //data pribadi
            "Nama",
            "Tempat Lahir",
            "Tanggal Lahir",
            "Jenis Kelamin",
            "Agama",
            "NIK",
            "Nomor KK",
            "Status Perkawinan",
            "Nomor HP",
            "Alamat Sesuai KTP",
            "RT/RW Sesuai KTP",
            "Provinsi Sesuai KTP",
            "Kab/Kota Sesuai KTP",
            "Kecamatan Sesuai KTP",
            "Kelurahan Sesuai KTP",
            "Alamat Domisili",
            "RT/RW Domisili",
            "Provinsi Domisili",
            "Kab/Kota Domisili",
            "Kecamatan Domisili",
            "Kelurahan Domisili",
            //data kepegawaian
            "NRK",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Status Pegawai",
            "Nomor Rekening",
            "Nomor KARPEG",
            "Nomor Karis/Karsu",
            "Nomor TASPEN",
            "Nomor NPWP",
            "Nomor BPJS/ASKES",
            "TMT CPNS",
            "TMT PNS",
            "Tanggal SK PNS",
            "Nomor SK Pangkat Terakhir",
            "Tanggal SK Pangkat",
            "Diklat Struktural",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Diklat PPNS",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
          ];

          const getData = await fastify.kepegawaian_pns.getDataUnduh();
          const convertData = getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;
        }
        // if (status == "PTT") {
        //   headerKepegawaian = [
        //     //data pribadi
        //     "Nama",
        //     "Tempat Lahir",
        //     "Tanggal Lahir",
        //     "Jenis Kelamin",
        //     "Agama",
        //     "NIK",
        //     "Nomor KK",
        //     "Status Perkawinan",
        //     "Nomor HP",
        //     "Alamat Sesuai KTP",
        //     "RT/RW Sesuai KTP",
        //     "Provinsi Sesuai KTP",
        //     "Kab/Kota Sesuai KTP",
        //     "Kecamatan Sesuai KTP",
        //     "Kecamatan Sesuai KTP",
        //     "Kelurahan Sesuai KTP",
        //     "Alamat Domisili",
        //     "RT/RW Domisili",
        //     "Provinsi Domisili",
        //     "Kab/Kota Domisili",
        //     "Kecamatan Domisili",
        //     "Kecamatan Domisili",
        //     "Kelurahan Domisili",
        //     //data kepegawaian
        //     "NRK",
        //     "NPTT",
        //     "Pangkat",
        //     "Golongan",
        //     "TMT Pangkat",
        //     "Pendidikan Pada SK",
        //     "Jabatan",
        //     "Eselon",
        //     "Tempat Tugas",
        //     "Subag/Seksi/Kecamatan",
        //     "Status Pegawai",
        //     "Nomor Rekening",
        //     "Nomor KARPEG",
        //     "Nomor Karis/Karsu",
        //     "Nomor TASPEN",
        //     "Nomor NPWP",
        //     "Nomor BPJS/ASKES",
        //     "TMT CPNS",
        //     "TMT PNS",
        //     "Tanggal SK PNS",
        //     "Nomor SK Pangkat Terakhir",
        //     "Tanggal SK Pangkat",
        //     "Diklat Struktural",
        //     "Nomor Sertifikat Diklat Struktural",
        //     "Tanggal Sertifikat Diklat Struktural",
        //     "Diklat PPNS",
        //     "Nomor Sertifikat Diklat PPNS",
        //     "Tanggal Sertifikat Diklat PPNS",
        //   ];
        // }
        // if (status == "PJLP") {
        //   headerKepegawaian = [
        //     //data pribadi
        //     "Nama",
        //     "Tempat Lahir",
        //     "Tanggal Lahir",
        //     "Jenis Kelamin",
        //     "Agama",
        //     "NIK",
        //     "Nomor KK",
        //     "Status Perkawinan",
        //     "Nomor HP",
        //     "Alamat Sesuai KTP",
        //     "RT/RW Sesuai KTP",
        //     "Provinsi Sesuai KTP",
        //     "Kab/Kota Sesuai KTP",
        //     "Kecamatan Sesuai KTP",
        //     "Kecamatan Sesuai KTP",
        //     "Kelurahan Sesuai KTP",
        //     "Alamat Domisili",
        //     "RT/RW Domisili",
        //     "Provinsi Domisili",
        //     "Kab/Kota Domisili",
        //     "Kecamatan Domisili",
        //     "Kecamatan Domisili",
        //     "Kelurahan Domisili",
        //     //data kepegawaian
        //     "NRK",
        //     "NPJLP",
        //     "Pangkat",
        //     "Golongan",
        //     "TMT Pangkat",
        //     "Pendidikan Pada SK",
        //     "Jabatan",
        //     "Eselon",
        //     "Tempat Tugas",
        //     "Subag/Seksi/Kecamatan",
        //     "Status Pegawai",
        //     "Nomor Rekening",
        //     "Nomor KARPEG",
        //     "Nomor Karis/Karsu",
        //     "Nomor TASPEN",
        //     "Nomor NPWP",
        //     "Nomor BPJS/ASKES",
        //     "TMT CPNS",
        //     "TMT PNS",
        //     "Tanggal SK PNS",
        //     "Nomor SK Pangkat Terakhir",
        //     "Tanggal SK Pangkat",
        //     "Diklat Struktural",
        //     "Nomor Sertifikat Diklat Struktural",
        //     "Tanggal Sertifikat Diklat Struktural",
        //     "Diklat PPNS",
        //     "Nomor Sertifikat Diklat PPNS",
        //     "Tanggal Sertifikat Diklat PPNS",
        //   ];
        // }

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerKepegawaian, ...dataKepegawaian];
        // Buat Workbook
        const fileName = "DATA KEPEGAWAIAN " + status;
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA KEPEGAWAIAN");
        wb.SheetNames.push("DATA KELUARGA");
        wb.SheetNames.push("DATA PENDIDIKAN");
        // Buat Sheet dengan Data
        const ws_kepegawaian = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA KEPEGAWAIAN"] = ws_kepegawaian;

        const wopts = { bookType: "xlsx", bookSST: false, type: "buffer" };
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
        // reply.send("success");
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  // fastify.post(
  //   "/create",
  //   {
  //     schema: {
  //       description: "This is an endpoint for creating a endpoint kepegawaian",
  //       tags: ["endpoint kepegawaian"],
  //       body: {
  //         description: "Payload for creating a endpoint kepegawaian",
  //         type: "object",
  //         properties: {
  //           nama: { type: "string" },
  //           telepon: { type: "string" },
  //           created_by: { type: "number" },
  //         },
  //       },
  //       response: {
  //         201: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: { type: "string" },
  //             code: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const { nama, telepon, created_by } = request.body;

  //     try {
  //       await fastify.kepegawaian_pns.create(nama, telepon, created_by);
  //       reply.send({ message: "success", code: 200 });
  //     } catch (error) {
  //       reply.send({ message: error.message, code: 500 });
  //     }
  //   }
  // );

  // fastify.put(
  //   "/update/:id",
  //   {
  //     schema: {
  //       description:
  //         "This is an endpoint for updating an existing endpoint kepegawaian",
  //       tags: ["endpoint kepegawaian"],
  //       params: {
  //         description: "update endpoint kepegawaian by Id",
  //         type: "object",
  //         properties: {
  //           id: { type: "number" },
  //         },
  //       },
  //       body: {
  //         description: "Payload for updating a endpoint kepegawaian",
  //         type: "object",
  //         properties: {
  //           nama: { type: "string" },
  //           telepon: { type: "string" },
  //           updated_by: { type: "number" },
  //         },
  //       },
  //       response: {
  //         200: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: { type: "string" },
  //             code: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const { id } = request.params;
  //     const { nama, telepon, updated_by } = request.body;

  //     try {
  //       await fastify.kepegawaian_pns.update(
  //         id,
  //         nama,
  //         telepon,

  //         updated_by
  //       );

  //       reply.send({ message: "success", code: 200 });
  //     } catch (error) {
  //       reply.send({ message: error.message, code: 500 });
  //     }
  //   }
  // );

  // fastify.put(
  //   "/update-pic/:id",
  //   {
  //     schema: {
  //       description:
  //         "This is an endpoint for updating pic an existing endpoint kepegawaian",
  //       tags: ["endpoint kepegawaian"],
  //       params: {
  //         description: "update pic endpoint kepegawaian by Id",
  //         type: "object",
  //         properties: {
  //           id: { type: "number" },
  //         },
  //       },
  //       body: {
  //         description: "Payload for updating pic a endpoint kepegawaian",
  //         type: "object",
  //         properties: {
  //           status_pic: { type: "number" },
  //           updated_by: { type: "number" },
  //         },
  //       },
  //       response: {
  //         200: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: { type: "string" },
  //             code: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const { id } = request.params;
  //     const { status_pic, updated_by } = request.body;
  //     try {
  //       await fastify.kepegawaian_pns.update_pic(id, status_pic, updated_by);

  //       reply.send({ message: "success", code: 200 });
  //     } catch (error) {
  //       reply.send({ message: error.message, code: 500 });
  //     }
  //   }
  // );

  // fastify.delete(
  //   "/delete/:id",
  //   {
  //     schema: {
  //       description:
  //         "This is an endpoint for DELETING an existing endpoint kepegawaian.",
  //       tags: ["endpoint kepegawaian"],
  //       params: {
  //         description: "endpoint kepegawaian by Id",
  //         type: "object",
  //         properties: {
  //           id: { type: "number" },
  //         },
  //       },
  //       body: {
  //         description: "Payload for deleted data endpoint kepegawaian",
  //         type: "object",
  //         properties: {
  //           deleted_by: { type: "number" },
  //         },
  //       },
  //       response: {
  //         204: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: { type: "string" },
  //             code: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const { id } = request.params;
  //     const { deleted_by } = request.body;

  //     try {
  //       await fastify.kepegawaian_pns.del(id, deleted_by);
  //       reply.send({ message: "success", code: 204 });
  //     } catch (error) {
  //       reply.send({ message: error.message, code: 500 });
  //     }
  //   }
  // );
};
