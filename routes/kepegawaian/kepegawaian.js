const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_ppns = require("../../services/kepegawaian/kepegawaian_ppns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const kepegawaian_rekapitulasi = require("../../services/kepegawaian/kepegawaian_rekapitulasi");
const multer = require("fastify-multer");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);
  fastify.register(kepegawaian_ppns);
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

  // ~ jangan dihapus commentnya
  // ^ find
  fastify.get(
    "/find", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil seluruh data kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["endpoint kepegawaian"],
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
            status: {
              type: "string",
            },
            nama: {
              type: "string",
            },
            nrk: {
              type: "string",
            },
            nopegawai: {
              type: "string",
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
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    nama: {
                      type: "string",
                    },
                    tempat_lahir: {
                      type: "string",
                    },
                    tgl_lahir: {
                      type: "string",
                    },
                    jenis_kelamin: {
                      type: "string",
                    },
                    agama: {
                      type: "string",
                    },
                    no_hp: {
                      type: "string",
                    },
                    kepegawaian_nrk: {
                      type: "string",
                    },
                    kepegawaian_status_pegawai: {
                      type: "string",
                    },
                    foto: {
                      type: "string",
                    },
                  },
                },
              },
              total_data: {
                type: "number",
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
        status,
        nama,
        nrk,
        nopegawai
      } = request.query;
      let exec = null;
      let totalDt = 0;
      let qwhere = "";
      if (status) {
        if (status === "PNS") {
          if (nama || nrk || nopegawai) {
            if (nama) {
              qwhere += ` AND kpns.nama ILIKE '%${nama}%'`;
            }
            if (nrk) {
              qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nrk}%'`;
            }
            if (nopegawai) {
              qwhere += ` AND kpns.kepegawaian_nip ILIKE '%${nopegawai}%'`;
            }
            exec = await fastify.kepegawaian_pns.filter(limit, offset, qwhere);
            const {
              total
            } = await fastify.kepegawaian_pns.countAllFilter(
              qwhere
            );
            totalDt = total;
          } else {
            exec = await fastify.kepegawaian_pns.find(limit, offset);
            const {
              total
            } = await fastify.kepegawaian_pns.countAll();
            totalDt = total;
          }
        } else {
          if (nama || nrk || nopegawai) {
            if (nama) {
              qwhere += ` AND kpnns.nama ILIKE '%${nama}%'`;
            }
            if (nrk) {
              qwhere += ` AND kpnns.kepegawaian_nrk ILIKE '%${nrk}%'`;
            }
            if (nopegawai) {
              qwhere += ` AND kpnns.kepegawaian_nptt_npjlp ILIKE '%${nopegawai}%'`;
            }
            exec = await fastify.kepegawaian_non_pns.filter(
              limit,
              offset,
              status,
              qwhere
            );
            const {
              total
            } = await fastify.kepegawaian_non_pns.countAll(
              status
            );
            totalDt = total;
          } else {
            exec = await fastify.kepegawaian_non_pns.find(
              limit,
              offset,
              status
            );
            const {
              total
            } = await fastify.kepegawaian_non_pns.countAll(
              status
            );
            totalDt = total;
          }
        }
      } else {
        if (nama || nrk || nopegawai) {
          if (nama) {
            qwhere += ` AND kpns.nama ILIKE '%${nama}%'`;
          }
          if (nrk) {
            qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nrk}%'`;
          }
          if (nopegawai) {
            qwhere += ` AND kpns.kepegawaian_nip ILIKE '%${nopegawai}%'`;
          }
          exec = await fastify.kepegawaian_pns.filter(limit, offset, qwhere);
          const {
            total
          } = await fastify.kepegawaian_pns.countAllFilter(
            qwhere
          );
          totalDt = total;
        } else {
          exec = await fastify.kepegawaian_pns.find(limit, offset);
          const {
            total
          } = await fastify.kepegawaian_pns.countAll();
          totalDt = total;
        }
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // ^ find One
  fastify.get(
    "/filter-rekapitulasi-pejabat-struktural", {
      schema: {
        description: "Endpoint ini digunakan untuk memfilter data Rekapitulasi Pejabat Struktural",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
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
            nip: {
              type: "string",
            },
            nrk: {
              type: "string",
            },
            bidang_wilayah: {
              type: "number",
            },
            pelaksana: {
              type: "number",
            },
            jabatan: {
              type: "number",
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
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    row_number: {
                      type: "number",
                    },
                    id: {
                      type: "number",
                    },
                    nama: {
                      type: "string",
                    },
                    kepegawaian_nip: {
                      type: "string",
                    },
                    kepegawaian_nrk: {
                      type: "string",
                    },
                    kepegawaian_jabatan: {
                      type: "number",
                    },
                    kepegawaian_tempat_tugas: {
                      type: "number",
                    },
                  },
                },
              },
              total_data: {
                type: "number",
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
        nrk,
        bidang_wilayah,
        pelaksana,
        jabatan,
        nip,
      } = request.query;
      let exec = null;
      let totalDt = 0;
      let qwhere = "";
      if (nama) {
        qwhere += ` AND kp.nama ILIKE '%${nama}%'`;
      }
      if (nrk) {
        qwhere += ` AND kp.kepegawaian_nrk ILIKE '%${nrk}%'`;
      }
      if (nip) {
        qwhere += ` AND kp.kepegawaian_nip ILIKE '%${nip}%'`;
      }

      if (bidang_wilayah) {
        qwhere += ` AND kp.kepegawaian_tempat_tugas = ${bidang_wilayah}`;
      }
      if (jabatan) {
        qwhere += ` AND kp.kepegawaian_jabatan = ${jabatan}`;
      }
      if (pelaksana) {
        qwhere += ` AND kp.kepegawaian_subbag_seksi_kecamatan = ${pelaksana}`;
      }
      exec = await fastify.kepegawaian_pns.filterRekapitulasiPejabatStruktural(
        limit,
        offset,
        qwhere
      );
      const {
        total
      } =
      await fastify.kepegawaian_pns.countAllFilterPejabatStruktural(qwhere);
      totalDt = total;
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/findone/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil detail data pribadi & kepegawaian berstatus PNS, PTT, PJLP berdasarkan id",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number",
                  },
                  nama: {
                    type: "string",
                  },
                  tempat_lahir: {
                    type: "string",
                  },
                  tgl_lahir: {
                    type: "string",
                  },
                  jenis_kelamin_value: {
                    type: "string",
                  },
                  jenis_kelamin: {
                    type: "string",
                  },
                  agama_id: {
                    type: "number",
                  },
                  agama_name: {
                    type: "string",
                  },
                  nik: {
                    type: "string",
                  },
                  no_kk: {
                    type: "string",
                  },
                  status_perkawinan: {
                    type: "string",
                  },
                  no_hp: {
                    type: "string",
                  },
                  sesuai_ktp_alamat: {
                    type: "string",
                  },
                  sesuai_ktp_rtrw: {
                    type: "string",
                  },
                  sesuai_ktp_provinsi: {
                    type: "string",
                  },
                  sesuai_ktp_kabkota: {
                    type: "string",
                  },
                  sesuai_ktp_kecamatan: {
                    type: "string",
                  },
                  sesuai_ktp_kelurahan: {
                    type: "string",
                  },
                  domisili_alamat: {
                    type: "string",
                  },
                  domisili_rtrw: {
                    type: "string",
                  },
                  domisili_provinsi: {
                    type: "string",
                  },
                  domisili_kabkota: {
                    type: "string",
                  },
                  domisili_kecamatan: {
                    type: "string",
                  },
                  domisili_kelurahan: {
                    type: "string",
                  },
                  kepegawaian_nrk: {
                    type: "string",
                  },
                  kepegawaian_nip: {
                    type: "string",
                  },
                  kepegawaian_pangkat_id: {
                    type: "number",
                  },
                  kepegawaian_pangkat_name: {
                    type: "string",
                  },
                  kepegawaian_golongan_id: {
                    type: "number",
                  },
                  kepegawaian_golongan_name: {
                    type: "string",
                  },
                  kepegawaian_tmtpangkat: {
                    type: "string",
                  },
                  kepegawaian_pendidikan_pada_sk_id: {
                    type: "number",
                  },
                  kepegawaian_pendidikan_pada_sk_name: {
                    type: "string",
                  },
                  kepegawaian_jabatan_id: {
                    type: "number",
                  },
                  kepegawaian_jabatan_name: {
                    type: "string",
                  },
                  kepegawaian_eselon_id: {
                    type: "number",
                  },
                  kepegawaian_eselon_name: {
                    type: "string",
                  },
                  kepegawaian_tempat_tugas: {
                    type: "string",
                  },
                  kepegawaian_subbag_seksi_kecamatan: {
                    type: "string",
                  },
                  kepegawaian_kelurahan: {
                    type: "string",
                  },
                  kepegawaian_status_pegawai: {
                    type: "string",
                  },
                  kepegawaian_no_rekening: {
                    type: "string",
                  },
                  kepegawaian_no_karpeg: {
                    type: "string",
                  },
                  kepegawaian_no_kasirkasur: {
                    type: "string",
                  },
                  kepegawaian_no_taspen: {
                    type: "string",
                  },
                  kepegawaian_npwp: {
                    type: "string",
                  },
                  kepegawaian_no_bpjs_askes: {
                    type: "string",
                  },
                  kepegawaian_tmt_cpns: {
                    type: "string",
                  },
                  kepegawaian_sk_cpns: {
                    type: "string",
                  },
                  kepegawaian_tmt_pns: {
                    type: "string",
                  },
                  kepegawaian_tgl_sk_pns: {
                    type: "string",
                  },
                  kepegawaian_sk_pns: {
                    type: "string",
                  },
                  kepegawaian_no_sk_pangkat_terakhir: {
                    type: "string",
                  },
                  kepegawaian_tgl_sk_pangkat_terakhir: {
                    type: "string",
                  },
                  kepegawaian_sk_pangkat_terakhir: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp_file_sertifikat: {
                    type: "string",
                  },
                  foto: {
                    type: "string",
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
        id,
        status
      } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findone(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findone(id);
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  // ^ find keluarga by id status
  fastify.get(
    "/find-data-keluarga/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    hubungan: {
                      type: "string",
                    },
                    nama: {
                      type: "string",
                    },
                    tempat_lahir: {
                      type: "string",
                    },
                    tgl_lahir: {
                      type: "string",
                    },
                    jenis_kelamin: {
                      type: "string",
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
        id,
        status
      } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findKeluarga(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findKeluarga(id);
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  // ^ find pendidikan by id status
  fastify.get(
    "/find-data-pendidikan/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk mengambil data pendidikan dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    jenis_pendidikan: {
                      type: "string",
                    },
                    nama_sekolah: {
                      type: "string",
                    },
                    nomor_ijazah: {
                      type: "string",
                    },
                    tgl_ijazah: {
                      type: "string",
                    },
                    jurusan: {
                      type: "string",
                    },
                    fakultas: {
                      type: "string",
                    },
                    file_ijazah: {
                      type: "string",
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
        id,
        status
      } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findPendidikan(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findPendidikan(id);
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  // ^ count keluarga by id status
  fastify.get(
    "/count-keluarga/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk menghitung data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  total: {
                    type: "number",
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
        id,
        status
      } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.countKeluarga(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.countKeluarga(id);
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  // ^ find pendidikan terakhir by id status
  fastify.get(
    "/get-pendidikan-terakhir/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk mendapatkan data pendidikan terakhir dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  jenis_pendidikan: {
                    type: "string",
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
        id,
        status
      } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findPendidikanTerakhir(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findPendidikanTerakhir(id);
      }
      try {
        if (exec.length > 0) {
          reply.send({
            message: "success",
            code: 200,
            data: exec[0],
          });
        } else {
          reply.send({
            message: "success",
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  // ^ autocomplete
  fastify.get(
    "/auto-search-pegawai", {
      schema: {
        description: "Endpoint ini digunakan untuk autocomplete kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["endpoint kepegawaian"],
        querystring: {
          type: "object",
          properties: {
            status: {
              type: "string",
            },
            nomor: {
              type: "string",
            },
          },
          required: ["status", "nomor"],
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    nama: {
                      type: "string",
                    },
                    no_pegawai: {
                      type: "string",
                    },
                  },
                },
              },
              total_data: {
                type: "number",
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        status,
        nomor
      } = request.query;
      let exec = null;
      let qwhere = "";
      if (status === "PNS") {
        qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nomor}%'`;
        exec = await fastify.kepegawaian_pns.autocompliteFill(qwhere);
      } else {
        qwhere += ` AND kpnns.kepegawaian_nptt_npjlp ILIKE '%${nomor}%'`;
        exec = await fastify.kepegawaian_non_pns.autocompliteFill(qwhere);
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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // ^ post
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

  // ^ update by id status
  fastify.put(
    "/update/:id/:status", {
      schema: {
        description: "Endpoint ini digunakan untuk mengubah data kepegawaian dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "update endpoint kepegawaian by Id",
          type: "object",
          properties: {
            status: {
              type: "string",
            },
            id: {
              type: "number",
            },
            status: {
              type: "string",
            },
          },
        },
        body: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            tempat_lahir: {
              type: "string",
            },
            tgl_lahir: {
              type: "string",
            },
            jenis_kelamin: {
              type: "string",
            },
            agama: {
              type: "number",
            },
            nik: {
              type: "string",
            },
            no_kk: {
              type: "string",
            },
            status_perkawinan: {
              type: "string",
            },
            no_hp: {
              type: "string",
            },
            sesuai_ktp_alamat: {
              type: "string",
            },
            sesuai_ktp_rtrw: {
              type: "string",
            },
            sesuai_ktp_provinsi: {
              type: "string",
            },
            sesuai_ktp_kabkota: {
              type: "string",
            },
            sesuai_ktp_kecamatan: {
              type: "string",
            },
            sesuai_ktp_kelurahan: {
              type: "string",
            },
            domisili_alamat: {
              type: "string",
            },
            domisili_rtrw: {
              type: "string",
            },
            domisili_provinsi: {
              type: "string",
            },
            domisili_kabkota: {
              type: "string",
            },
            domisili_kecamatan: {
              type: "string",
            },
            domisili_kelurahan: {
              type: "string",
            },
            kepegawaian_nrk: {
              type: "string",
            },
            kepegawaian_nip: {
              type: "string",
            },
            kepegawaian_pangkat: {
              type: "number",
            },
            kepegawaian_golongan: {
              type: "number",
            },
            kepegawaian_tmtpangkat: {
              type: "string",
            },
            kepegawaian_pendidikan_pada_sk: {
              type: "number",
            },
            kepegawaian_jabatan: {
              type: "number",
            },
            kepegawaian_eselon: {
              type: "number",
            },
            kepegawaian_tempat_tugas: {
              type: "string",
            },
            kepegawaian_subbag_seksi_kecamatan: {
              type: "string",
            },
            kepegawaian_kelurahan: {
              type: "string",
            },
            kepegawaian_status_pegawai: {
              type: "string",
            },
            kepegawaian_no_rekening: {
              type: "string",
            },
            kepegawaian_no_karpeg: {
              type: "string",
            },
            kepegawaian_no_kasirkasur: {
              type: "string",
            },
            kepegawaian_no_taspen: {
              type: "string",
            },
            kepegawaian_npwp: {
              type: "string",
            },
            kepegawaian_no_bpjs_askes: {
              type: "string",
            },
            kepegawaian_tmt_cpns: {
              type: "string",
            },
            kepegawaian_sk_cpns: {
              type: "string",
              format: "binary",
            },
            kepegawaian_tmt_pns: {
              type: "string",
            },
            kepegawaian_tgl_sk_pns: {
              type: "string",
            },
            // kepegawaian_sk_pns: {
            //   type: "string",
            //   format: "binary",
            // },
            kepegawaian_no_sk_pangkat_terakhir: {
              type: "string",
            },
            kepegawaian_tgl_sk_pangkat_terakhir: {
              type: "string",
            },
            // kepegawaian_sk_pangkat_terakhir: {
            //   type: "string",
            //   format: "binary",
            // },
            kepegawaian_diklat_pol_pp_dasar: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
              type: "string",
            },
            // kepegawaian_diklat_pol_pp_dasar_file_sertifikat: {
            //   type: "string",
            //   format: "binary",
            // },
            kepegawaian_diklat_pol_pp_strutural: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat: {
              type: "string",
            },
            // kepegawaian_diklat_pol_pp_strutural_file_sertifikat: {
            //   type: "string",
            //   format: "binary",
            // },
            kepegawaian_diklat_pol_pp_ppns: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
              type: "string",
            },
            // kepegawaian_diklat_pol_pp_ppns_file_sertifikat: {
            //   type: "string",
            //   format: "binary",
            // },
            kepegawaian_diklat_fungsional_pol_pp: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat: {
              type: "string",
            },
            // kepegawaian_diklat_fungsional_pol_pp_file_sertifikat: {
            //   type: "string",
            //   format: "binary",
            // },
            // foto: { type: "string", format: "binary" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id,
        status
      } = request.params;
      const {
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        agama,
        nik,
        no_kk,
        status_perkawinan,
        no_hp,
        sesuai_ktp_alamat,
        sesuai_ktp_rtrw,
        sesuai_ktp_provinsi,
        sesuai_ktp_kabkota,
        sesuai_ktp_kecamatan,
        sesuai_ktp_kelurahan,
        domisili_alamat,
        domisili_rtrw,
        domisili_provinsi,
        domisili_kabkota,
        domisili_kecamatan,
        domisili_kelurahan,
        kepegawaian_nrk,
        kepegawaian_nip,
        kepegawaian_pangkat,
        kepegawaian_golongan,
        kepegawaian_tmtpangkat,
        kepegawaian_pendidikan_pada_sk,
        kepegawaian_jabatan,
        kepegawaian_eselon,
        kepegawaian_tempat_tugas,
        kepegawaian_subbag_seksi_kecamatan,
        kepegawaian_kelurahan,
        kepegawaian_status_pegawai,
        kepegawaian_no_rekening,
        kepegawaian_no_karpeg,
        kepegawaian_no_kasirkasur,
        kepegawaian_no_taspen,
        kepegawaian_npwp,
        kepegawaian_no_bpjs_askes,
        kepegawaian_tmt_cpns,
        kepegawaian_tmt_pns,
        kepegawaian_tgl_sk_pns,
        kepegawaian_no_sk_pangkat_terakhir,
        kepegawaian_tgl_sk_pangkat_terakhir,
        kepegawaian_diklat_pol_pp_dasar,
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_strutural,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_ppns,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
      } = request.body;
      console.log(status);
      try {
        await fastify.kepegawaian_pns.update(
          id,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          agama,
          nik,
          no_kk,
          status_perkawinan,
          no_hp,
          sesuai_ktp_alamat,
          sesuai_ktp_rtrw,
          sesuai_ktp_provinsi,
          sesuai_ktp_kabkota,
          sesuai_ktp_kecamatan,
          sesuai_ktp_kelurahan,
          domisili_alamat,
          domisili_rtrw,
          domisili_provinsi,
          domisili_kabkota,
          domisili_kecamatan,
          domisili_kelurahan,
          kepegawaian_nrk,
          kepegawaian_nip,
          kepegawaian_pangkat,
          kepegawaian_golongan,
          kepegawaian_tmtpangkat,
          kepegawaian_pendidikan_pada_sk,
          kepegawaian_jabatan,
          kepegawaian_eselon,
          kepegawaian_tempat_tugas,
          kepegawaian_subbag_seksi_kecamatan,
          kepegawaian_kelurahan,
          kepegawaian_status_pegawai,
          kepegawaian_no_rekening,
          kepegawaian_no_karpeg,
          kepegawaian_no_kasirkasur,
          kepegawaian_no_taspen,
          kepegawaian_npwp,
          kepegawaian_no_bpjs_askes,
          kepegawaian_tmt_cpns,
          kepegawaian_tmt_pns,
          kepegawaian_tgl_sk_pns,
          kepegawaian_no_sk_pangkat_terakhir,
          kepegawaian_tgl_sk_pangkat_terakhir,
          kepegawaian_diklat_pol_pp_dasar,
          kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
          kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
          kepegawaian_diklat_pol_pp_strutural,
          kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
          kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
          kepegawaian_diklat_pol_pp_ppns,
          kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
          kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
          kepegawaian_diklat_fungsional_pol_pp,
          kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
          kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
          ""
        );

        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // ^ update file by id status
  fastify.put(
    "/update-file/:id/:status", {
      preHandler: upload.fields([{
          name: "foto",
          maxCount: 1,
        },
        {
          name: "kepegawaian_diklat_fungsional_pol_pp_file_sertifikat",
          maxCount: 1,
        },
        {
          name: "kepegawaian_diklat_pol_pp_ppns_file_sertifikat",
          maxCount: 1,
        },
        {
          name: "kepegawaian_diklat_pol_pp_strutural_file_sertifikat",
          maxCount: 1,
        },
        {
          name: "kepegawaian_diklat_pol_pp_dasar_file_sertifikat",
          maxCount: 1,
        },
        {
          name: "kepegawaian_sk_pangkat_terakhir",
          maxCount: 1,
        },
        {
          name: "kepegawaian_sk_pns",
          maxCount: 1,
        },
        {
          name: "kepegawaian_sk_cpns",
          maxCount: 1,
        },
      ]),
    },
    async (request, reply) => {
      console.log("request.files", request.files);
      const {
        id
      } = request.params;

      try {
        const kepegawaian_sk_pangkat_terakhir = request.files[
            "kepegawaian_sk_pangkat_terakhir"
          ] ?
          await truePath(
            request.files["kepegawaian_sk_pangkat_terakhir"][0].path
          ) :
          "";

        const kepegawaian_sk_pns = request.files["kepegawaian_sk_pns"] ?
          await truePath(request.files["kepegawaian_sk_pns"][0].path) :
          "";
        const kepegawaian_sk_cpns = request.files["kepegawaian_sk_cpns"] ?
          await truePath(request.files["kepegawaian_sk_cpns"][0].path) :
          "";
        const kepegawaian_diklat_pol_pp_ppns_file_sertifikat = request.files[
            "kepegawaian_diklat_pol_pp_ppns_file_sertifikat"
          ] ?
          await truePath(
            request.files["kepegawaian_diklat_pol_pp_ppns_file_sertifikat"][0]
            .path
          ) :
          "";
        const kepegawaian_diklat_pol_pp_strutural_file_sertifikat = request
          .files["kepegawaian_diklat_pol_pp_strutural_file_sertifikat"] ?
          await truePath(
            request.files[
              "kepegawaian_diklat_pol_pp_strutural_file_sertifikat"
            ][0].path
          ) :
          "";
        const kepegawaian_diklat_pol_pp_dasar_file_sertifikat = request.files[
            "kepegawaian_diklat_pol_pp_dasar_file_sertifikat"
          ] ?
          await truePath(
            request.files[
              "kepegawaian_diklat_pol_pp_dasar_file_sertifikat"
            ][0].path
          ) :
          "";
        const kepegawaian_diklat_fungsional_pol_pp_file_sertifikat = request
          .files["kepegawaian_diklat_fungsional_pol_pp_file_sertifikat"] ?
          await truePath(
            request.files[
              "kepegawaian_diklat_fungsional_pol_pp_file_sertifikat"
            ][0].path
          ) :
          "";
        const foto = request.files["foto"] ?
          await truePath(request.files["foto"][0].path) :
          "";
        // await fastify.kepegawaian_pns.updateFile(
        //   id,
        //   foto,
        //   kepegawaian_diklat_fungsional_pol_pp_file_sertifikat,
        //   kepegawaian_diklat_pol_pp_ppns_file_sertifikat,
        //   kepegawaian_diklat_pol_pp_strutural_file_sertifikat,
        //   kepegawaian_diklat_pol_pp_dasar_file_sertifikat,
        //   kepegawaian_sk_pangkat_terakhir,
        //   kepegawaian_sk_pns,
        //   kepegawaian_sk_cpns,
        //   ""
        // );

        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // ^ update pic by id
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

  /* ----------------------------------- rekapitulasi ---------------------------------- */

  fastify.delete(
    "/delete-rekapitulasi-pegawai/:id", {
      schema: {
        description: "This is an endpoint for DELETING an existing endpoint data rekapitulasi pegawai pejabat struktural.",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        params: {
          description: "endpoint rekapitulasi pegawai pejabat struktural by Id",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for deleted data endpoint rekapitulasi pegawai pejabat struktural",
          type: "object",
          properties: {
            deleted_by: {
              type: "number",
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        deleted_by
      } = request.body;

      try {
        await fastify.kepegawaian_pns.del(id, deleted_by);
        reply.send({
          message: "success",
          code: 204,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-jumlah-pegawai-polpp", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp id",
          type: "object",
          properties: {
            tempat_tugas: {
              type: "string",
            },
            seksi_kecamatan: {
              type: "string",
            },
            kelurahan: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  jmlh_seluruh_pegawai_satpol: {
                    type: "number",
                  },
                  jmlh_seluruh_pns: {
                    type: "number",
                  },
                  jmlh_seluruh_cpns: {
                    type: "number",
                  },
                  jmlh_seluruh_non_pns: {
                    type: "number",
                  },
                  jmlh_seluruh_non_pns_ptt: {
                    type: "number",
                  },
                  jmlh_seluruh_non_pns_pjlp: {
                    type: "number",
                  },
                  jmlh_seluruh_ppns_satpolpp: {
                    type: "number",
                  },
                  jmlh_seluruh_ppns_unit_kerja_lain: {
                    type: "number",
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
        tempat_tugas,
        seksi_kecamatan
      } = request.query;
      const exec = await fastify.kepegawaian_rekapitulasi.jumlah_pegawai_polpp(
        tempat_tugas,
        seksi_kecamatan
      );

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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-jumlah-pegawai-polpp-by-pendidikan", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp by pendidikan",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
          type: "object",
          properties: {
            tempat_tugas: {
              type: "string",
            },
            seksi_kecamatan: {
              type: "string",
            },
            kelurahan: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  list: {
                    type: "array",
                    items: {
                      type: "object",
                      properties: {
                        pendidikan: {
                          type: "string",
                        },
                        jumlah: {
                          type: "number",
                        },
                      },
                    },
                  },
                  jmlh_keseluruhan: {
                    type: "number",
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
        tempat_tugas,
        seksi_kecamatan,
        kelurahan
      } = request.query;
      const exec =
        await fastify.kepegawaian_rekapitulasi.jumlah_pegawai_polpp_by_pendidikan(
          tempat_tugas,
          seksi_kecamatan,
          kelurahan
        );

      let jum = 0;
      for (let index = 0; index < exec.length; index++) {
        jum = parseInt(exec[index].jumlah) + parseInt(jum);
      }

      let data = {
        list: exec,
        jmlh_keseluruhan: jum,
      };

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: data,
          });
        } else {
          reply.send({
            message: "success",
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-jumlah-pegawai-polpp-by-golongan", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp by golongan",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
          type: "object",
          properties: {
            tempat_tugas: {
              type: "string",
            },
            seksi_kecamatan: {
              type: "string",
            },
            kelurahan: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  list: {
                    type: "array",
                    items: {
                      type: "object",
                      properties: {
                        golongan: {
                          type: "string",
                        },
                        jumlah: {
                          type: "number",
                        },
                      },
                    },
                  },
                  jmlh_keseluruhan: {
                    type: "number",
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
        tempat_tugas,
        seksi_kecamatan,
        kelurahan
      } = request.query;
      const exec =
        await fastify.kepegawaian_rekapitulasi.jumlah_pegawai_polpp_by_golongan(
          tempat_tugas,
          seksi_kecamatan,
          kelurahan
        );

      let jum = 0;
      for (let index = 0; index < exec.length; index++) {
        jum = parseInt(exec[index].jumlah) + parseInt(jum);
      }

      let data = {
        list: exec,
        jmlh_keseluruhan: jum,
      };

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: data,
          });
        } else {
          reply.send({
            message: "success",
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-jumlah-pegawai-polpp-by-diklat", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp by diklat",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
          type: "object",
          properties: {
            tempat_tugas: {
              type: "string",
            },
            seksi_kecamatan: {
              type: "string",
            },
            kelurahan: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  diklat_pol_pp_dasar: {
                    type: "number",
                  },
                  diklat_pol_pp_strutural: {
                    type: "number",
                  },
                  diklat_pol_pp_ppns: {
                    type: "number",
                  },
                  diklat_fungsional_pol_pp: {
                    type: "number",
                  },
                  jmlh_keseluruhan: {
                    type: "number",
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
        tempat_tugas,
        seksi_kecamatan,
        kelurahan
      } = request.query;
      const exec =
        await fastify.kepegawaian_rekapitulasi.jumlah_pegawai_polpp_by_diklat(
          tempat_tugas,
          seksi_kecamatan,
          kelurahan
        );

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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-pegawai-jft/find", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp by golongan",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
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
            nrk: {
              type: "string",
            },
            bidang_wilayah: {
              type: "number",
            },
            pelaksana: {
              type: "number",
            },
            jabatan: {
              type: "number",
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
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    nama: {
                      type: "string",
                    },
                    nip: {
                      type: "string",
                    },
                    nrk: {
                      type: "number",
                    },
                    jabatan: {
                      type: "string",
                    },
                    tempat_tugas: {
                      type: "string",
                    },
                  },
                },
              },
              jumlah: {
                type: "number",
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
        nrk,
        bidang_wilayah,
        pelaksana,
        jabatan
      } =
      request.query;
      const exec = await fastify.kepegawaian_rekapitulasi.find_rekapitulasi_jft(
        limit,
        offset,
        nama,
        nrk,
        bidang_wilayah,
        pelaksana,
        jabatan
      );
      const {
        count
      } =
      await fastify.kepegawaian_rekapitulasi.count_rekapitulasi_jft(
        nama,
        nrk,
        bidang_wilayah,
        pelaksana,
        jabatan
      );
      let total = count;

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec,
            jumlah: total,
          });
        } else {
          reply.send({
            message: "success",
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-pegawai-jft/unduh", {
      schema: {
        description: "This is an endpoint for fetching a jumlah pegawai polpp by golongan",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            nrk: {
              type: "string",
            },
            bidang_wilayah: {
              type: "number",
            },
            pelaksana: {
              type: "number",
            },
            jabatan: {
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
        nrk,
        bidang_wilayah,
        pelaksana,
        jabatan
      } = request.query;
      let headerData = [];
      let data = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        headerData = ["No", "Nama", "NIP", "NRK", "Jabatan", "Tempat Tugas"];

        const getData =
          await fastify.kepegawaian_rekapitulasi.unduh_rekapitulasi_jft(
            nama,
            nrk,
            bidang_wilayah,
            pelaksana,
            jabatan
          );

        const convertData = getData.map(function (item) {
          return Object.values(item);
        });
        data = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerData, ...data];
        // Buat Workbook
        const fileName = "REKAPITULASI PEGAWAI PEJABAT JFT";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - REKAPITULASI PEGAWAI PEJABAT JFT",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA REKAPITULASI JFT");
        // Buat Sheet dengan Data
        const ws = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA REKAPITULASI JFT"] = ws;

        const wopts = {
          bookType: "xlsx",
          bookSST: false,
          type: "buffer",
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
          code: 500,
        });
      }
    }
  );

  fastify.put(
    "/update-status-kenaikan-pangkat/:id", {
      schema: {
        description: "This is an endpoint for updating an existing status kenaikan pangkat",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        params: {
          description: "update status kenaikan pangkat by Id",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating a status kenaikan pangkat",
          type: "object",
          properties: {
            status_kenaikan_pangkat: {
              type: "number",
            },
            updated_by: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        status_kenaikan_pangkat,
        updated_by
      } = request.body;

      try {
        await fastify.kepegawaian_rekapitulasi.update_rekapitulasi_kenaikan_pangkat(
          id,
          status_kenaikan_pangkat,
          updated_by
        );
        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-pegawai-naik-pangkat/find", {
      schema: {
        description: "This is an endpoint for fetching a rekapitulasi pegawai naik pangkat",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
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
            nrk: {
              type: "string",
            },
            nip: {
              type: "string",
            },
            id_pangkat: {
              type: "number",
            },
            id_status_kenaikan_pangkat: {
              type: "number",
            },
            id_tempat_tugas: {
              type: "number",
            },
            id_seksi_kecamatan: {
              type: "number",
            },
            id_jabatan_kelurahan: {
              type: "number",
            },
            tahun_jnp: {
              type: "number",
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
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number",
                    },
                    nama: {
                      type: "string",
                    },
                    nrk: {
                      type: "number",
                    },
                    nip: {
                      type: "string",
                    },

                    jabatan: {
                      type: "string",
                    },
                    tempat_tugas: {
                      type: "string",
                    },
                    subbag_seksi_kecamatan: {
                      type: "string",
                    },
                    pangkat: {
                      type: "string",
                    },
                    golongan: {
                      type: "string",
                    },
                    tmt_pangkat: {
                      type: "string",
                    },
                    eselon: {
                      type: "string",
                    },
                    status_kenaikan_pangkat: {
                      type: "string",
                    },
                    jadwal_kenaikan_pangkat: {
                      type: "string",
                    },
                  },
                },
              },
              total_data: {
                type: "number",
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
        nrk,
        nip,
        id_pangkat,
        id_status_kenaikan_pangkat,
        id_tempat_tugas,
        id_seksi_kecamatan,
        id_jabatan_kelurahan,
        tahun_jnp,
      } = request.query;
      const exec =
        await fastify.kepegawaian_rekapitulasi.find_rekapitulasi_kenaikan_pangkat(
          limit,
          offset,
          nama,
          nrk,
          nip,
          id_pangkat,
          id_status_kenaikan_pangkat,
          id_tempat_tugas,
          id_seksi_kecamatan,
          id_jabatan_kelurahan,
          tahun_jnp
        );
      const {
        count
      } =
      await fastify.kepegawaian_rekapitulasi.count_rekapitulasi_kenaikan_pangkat(
        nama,
        nrk,
        nip,
        id_pangkat,
        id_status_kenaikan_pangkat,
        id_tempat_tugas,
        id_seksi_kecamatan,
        id_jabatan_kelurahan,
        tahun_jnp
      );

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec,
            total_data: count,
          });
        } else {
          reply.send({
            message: "success",
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-pegawai-naik-pangkat/findone/:id", {
      schema: {
        description: "This is an endpoint for fetching a pegawai",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        params: {
          description: "Find one pegawai naik pangkat id",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number",
                  },
                  nama: {
                    type: "string",
                  },
                  nrk: {
                    type: "number",
                  },
                  nip: {
                    type: "string",
                  },

                  jabatan: {
                    type: "string",
                  },
                  tempat_tugas: {
                    type: "string",
                  },
                  subbag_seksi_kecamatan: {
                    type: "string",
                  },
                  pangkat: {
                    type: "string",
                  },
                  golongan: {
                    type: "string",
                  },
                  tmt_pangkat: {
                    type: "string",
                  },
                  eselon: {
                    type: "string",
                  },
                  status_kenaikan_pangkat: {
                    type: "string",
                  },
                  jadwal_kenaikan_pangkat: {
                    type: "string",
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
      const exec =
        await fastify.kepegawaian_rekapitulasi.findone_rekapitulasi_kenaikan_pangkat(
          id
        );

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
            code: 204,
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500,
        });
      }
    }
  );

  fastify.get(
    "/rekapitulasi-pegawai-naik-pangkat/unduh", {
      schema: {
        description: "This is an endpoint for fetching a rekapitulasi pegawai naik pangkat",
        tags: ["endpoint rekapitulasi pegawai pejabat"],
        querystring: {
          description: "Find one jumlah pegawai polpp",
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            nrk: {
              type: "string",
            },
            nip: {
              type: "string",
            },
            id_pangkat: {
              type: "number",
            },
            id_status_kenaikan_pangkat: {
              type: "number",
            },
            id_tempat_tugas: {
              type: "number",
            },
            id_seksi_kecamatan: {
              type: "number",
            },
            id_jabatan_kelurahan: {
              type: "number",
            },
            tahun_jnp: {
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
        nrk,
        nip,
        id_pangkat,
        id_status_kenaikan_pangkat,
        id_tempat_tugas,
        id_seksi_kecamatan,
        id_jabatan_kelurahan,
        tahun_jnp,
      } = request.query;
      let headerData = [];
      let data = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        headerData = [
          "No",
          "Nama",
          "NIP",
          "NRK",
          "Jabatan",
          "Tempat Tugas",
          "Seksi Kecamatan",
          "Pangkat",
          "Golongan",
          "TMT Pangkat",
          "Eselon",
          "Status Kenaikan Pangkat",
          "Jadwal Kenaikan Pangkat",
        ];

        const getData =
          await fastify.kepegawaian_rekapitulasi.unduh_rekapitulasi_kenaikan_pangkat(
            nama,
            nrk,
            nip,
            id_pangkat,
            id_status_kenaikan_pangkat,
            id_tempat_tugas,
            id_seksi_kecamatan,
            id_jabatan_kelurahan,
            tahun_jnp
          );

        const convertData = getData.map(function (item) {
          return Object.values(item);
        });
        data = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerData, ...data];
        // Buat Workbook
        const fileName = "REKAPITULASI KEPEGAWAIAN NAIK PANGKAT";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - REKAPITULASI KEPEGAWAIAN NAIK PANGKAT",
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
          type: "buffer",
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
          code: 500,
        });
      }
    }
  );

  // create keluarga PNS
  fastify.post(
    "/create-keluarga-PNS", {
      schema: {
        description: "This is an endpoint for creating data keluarga pns",
        tags: ["endpoint kepegawaian"],
        body: {
          description: "Payload for creating data keluarga pns",
          type: "object",
          properties: {
            hubungan: {
              type: "string",
            },
            nama: {
              type: "string",
            },
            tempat_lahir: {
              type: "string",
            },
            tgl_lahir: {
              type: "string",
            },
            jenis_kelamin: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number",
                  },
                  hubungan: {
                    type: "string",
                  },
                  nama: {
                    type: "string",
                  },
                  tempat_lahir: {
                    type: "string",
                  },
                  tgl_lahir: {
                    type: "string",
                  },
                  jenis_kelamin: {
                    type: "string",
                  },
                  id_pegawai: {
                    type: "number",
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
        hubungan,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        id_pegawai,
      } = request.body;
      try {
        const {
          id
        } = await fastify.kepegawaian_pns.createKeluargaPNS(
          hubungan,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
          data: {
            return_id: id,
          },
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // update keluarga PNS
  fastify.put(
    "/update-keluarga-PNS/:id", {
      schema: {
        description: "This is an endpoint for updating data keluarga pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for updating data keluarga pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating keluarga pns",
          type: "object",
          properties: {
            hubungan: {
              type: "string",
            },
            nama: {
              type: "string",
            },
            tempat_lahir: {
              type: "string",
            },
            tgl_lahir: {
              type: "string",
            },
            jenis_kelamin: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        hubungan,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        id_pegawai,
      } = request.body;
      try {
        const exec = await fastify.kepegawaian_pns.updateKeluargaPNS(
          id,
          hubungan,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // delete keluarga PNS
  fastify.delete(
    "/delete-keluarga-PNS/:id", {
      schema: {
        description: "This is an endpoint for deleting keluarga pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for deleting data keluarga pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      try {
        await fastify.kepegawaian_pns.delKelPNS(id, "");
        reply.send({
          message: "success",
          code: 204,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // create keluarga non pns
  fastify.post(
    "/create-keluarga-non-PNS", {
      schema: {
        description: "This is an endpoint for creating data keluarga non pns",
        tags: ["endpoint kepegawaian"],
        body: {
          description: "Payload for creating data keluarga non pns",
          type: "object",
          properties: {
            hubungan: {
              type: "string",
            },
            nama: {
              type: "string",
            },
            tempat_lahir: {
              type: "string",
            },
            tgl_lahir: {
              type: "string",
            },
            jenis_kelamin: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number",
                  },
                  hubungan: {
                    type: "string",
                  },
                  nama: {
                    type: "string",
                  },
                  tempat_lahir: {
                    type: "string",
                  },
                  tgl_lahir: {
                    type: "string",
                  },
                  jenis_kelamin: {
                    type: "string",
                  },
                  id_pegawai: {
                    type: "number",
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
        hubungan,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        id_pegawai,
      } = request.body;
      try {
        const {
          id
        } = await fastify.kepegawaian_non_pns.createKeluargaNonPNS(
          hubungan,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
          data: {
            return_id: id,
          },
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //update keluarga non pns
  fastify.put(
    "/update-keluarga-non-PNS/:id", {
      schema: {
        description: "This is an endpoint for updating data keluarga non pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for updating data keluarga non pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating keluarga non pns",
          type: "object",
          properties: {
            hubungan: {
              type: "string",
            },
            nama: {
              type: "string",
            },
            tempat_lahir: {
              type: "string",
            },
            tgl_lahir: {
              type: "string",
            },
            jenis_kelamin: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        hubungan,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        id_pegawai,
      } = request.body;
      try {
        const exec = await fastify.kepegawaian_non_pns.updateKeluargaNonPNS(
          id,
          hubungan,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //delete keluarga non pns
  fastify.delete(
    "/delete-keluarga-non-PNS/:id", {
      schema: {
        description: "This is an endpoint for deleting keluarga non pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for deleting data keluarga non pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      try {
        await fastify.kepegawaian_non_pns.delKelNonPNS(id, "");
        reply.send({
          message: "success",
          code: 204,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //create pendidikan pns
  fastify.post(
    "/create-pendidikan-PNS", {
      schema: {
        description: "This is an endpoint for creating data pendidikan pns",
        tags: ["endpoint kepegawaian"],
        body: {
          description: "Payload for creating data pendidikan pns",
          type: "object",
          properties: {
            jenis_pendidikan: {
              type: "number",
            },
            nama_sekolah: {
              type: "string",
            },
            nomor_ijazah: {
              type: "string",
            },
            tgl_ijazah: {
              type: "string",
            },
            jurusan: {
              type: "string",
            },
            fakultas: {
              type: "string",
            },
            file_ijazah: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  return_id: {
                    type: "number",
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
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
      } = request.body;
      try {
        const {
          id
        } = await fastify.kepegawaian_pns.createPendidikanPNS(
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
          data: {
            return_id: id,
          },
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //update pendidikan pns
  fastify.put(
    "/update-pendidikan-PNS/:id", {
      schema: {
        description: "This is an endpoint for updating data pendidikan pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for updating data pendidikan pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating pendidikan pns",
          type: "object",
          properties: {
            jenis_pendidikan: {
              type: "number",
            },
            nama_sekolah: {
              type: "string",
            },
            nomor_ijazah: {
              type: "string",
            },
            tgl_ijazah: {
              type: "string",
            },
            jurusan: {
              type: "string",
            },
            fakultas: {
              type: "string",
            },
            file_ijazah: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
      } = request.body;
      try {
        const exec = await fastify.kepegawaian_pns.updatePendidikanPNS(
          id,
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //deleted pendidikan pns
  fastify.delete(
    "/delete-pendidikan-PNS/:id", {
      schema: {
        description: "This is an endpoint for deleting pendidikan pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for deleting data pendidikan pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      try {
        await fastify.kepegawaian_pns.delPendidikanPNS(id, "");
        reply.send({
          message: "success",
          code: 204,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //create pendidikan non pns
  fastify.post(
    "/create-pendidikan-non-PNS", {
      schema: {
        description: "This is an endpoint for creating data pendidikan non pns",
        tags: ["endpoint kepegawaian"],
        body: {
          description: "Payload for creating data pendidikan non pns",
          type: "object",
          properties: {
            jenis_pendidikan: {
              type: "number",
            },
            nama_sekolah: {
              type: "string",
            },
            nomor_ijazah: {
              type: "string",
            },
            tgl_ijazah: {
              type: "string",
            },
            jurusan: {
              type: "string",
            },
            fakultas: {
              type: "string",
            },
            file_ijazah: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number",
                  },
                  jenis_pendidikan: {
                    type: "number",
                  },
                  nama_sekolah: {
                    type: "string",
                  },
                  nomor_ijazah: {
                    type: "string",
                  },
                  tgl_ijazah: {
                    type: "string",
                  },
                  jurusan: {
                    type: "string",
                  },
                  fakultas: {
                    type: "string",
                  },
                  file_ijazah: {
                    type: "string",
                  },
                  id_pegawai: {
                    type: "number",
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
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
      } = request.body;
      try {
        const {
          id
        } = await fastify.kepegawaian_non_pns.createPendidikanNonPNS(
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
          data: {
            return_id: id,
          },
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //updated pendidikan non pns
  fastify.put(
    "/update-pendidikan-non-PNS/:id", {
      schema: {
        description: "This is an endpoint for updating data pendidikan non pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for updating data pendidikan non pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating pendidikan non pns",
          type: "object",
          properties: {
            jenis_pendidikan: {
              type: "number",
            },
            nama_sekolah: {
              type: "string",
            },
            nomor_ijazah: {
              type: "string",
            },
            tgl_ijazah: {
              type: "string",
            },
            jurusan: {
              type: "string",
            },
            fakultas: {
              type: "string",
            },
            file_ijazah: {
              type: "string",
            },
            id_pegawai: {
              type: "number",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      const {
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
      } = request.body;
      try {
        const exec = await fastify.kepegawaian_non_pns.updatePendidikanNonPNS(
          id,
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({
          message: "success",
          code: 200,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  //deleted pendidikan non pns
  fastify.delete(
    "/delete-pendidikan-non-PNS/:id", {
      schema: {
        description: "This is an endpoint for deleting pendidikan non pns",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Payload for deleting data pendidikan non pns",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string",
              },
              code: {
                type: "string",
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
      try {
        await fastify.kepegawaian_non_pns.delPendidikanNonPNS(id, "");
        reply.send({
          message: "success",
          code: 204,
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500,
        });
      }
    }
  );

  // ─────────────────────────────────────────────────────────────────────────────
};