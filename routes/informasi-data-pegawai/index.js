const kepegawaian_pns = require("../../services/kepegawaian_service/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian_service/kepegawaian_non_pns");
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

  // ^ find
  fastify.get(
    "/find",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil seluruh data kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["informasi-data-pegawai"],
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
                    no_pegawai: {
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
      const { limit, offset, status, nama, nrk, nopegawai } = request.query;
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
            const { total } = await fastify.kepegawaian_pns.countAllFilter(
              qwhere
            );
            totalDt = total;
          } else {
            exec = await fastify.kepegawaian_pns.find(limit, offset);
            const { total } = await fastify.kepegawaian_pns.countAll();
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
            const { total } = await fastify.kepegawaian_non_pns.countAll(
              status
            );
            totalDt = total;
          } else {
            exec = await fastify.kepegawaian_non_pns.find(
              limit,
              offset,
              status
            );
            const { total } = await fastify.kepegawaian_non_pns.countAll(
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
          const { total } = await fastify.kepegawaian_pns.countAllFilter(
            qwhere
          );
          totalDt = total;
        } else {
          exec = await fastify.kepegawaian_pns.find(limit, offset);
          const { total } = await fastify.kepegawaian_pns.countAll();
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

  // ^ findone
  fastify.get(
    "/findone/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil detail data pribadi & kepegawaian berstatus PNS, PTT, PJLP berdasarkan id",
        tags: ["informasi-data-pegawai"],
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
                  kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_file_sertifikat: {
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
                  kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_file_sertifikat: {
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
                  kepegawaian_pangkat: {
                    type: "number",
                  },
                  kepegawaian_kelurahan: {
                    type: "string",
                  },
                  status_kenaikan_pangkat: {
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
      const { id, status } = request.params;
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
    "/find-data-keluarga/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
      const { id, status } = request.params;
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

  fastify.get(
    "/findone-data-keluarga/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil detail data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
    async (request, reply) => {
      const { id, status } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findoneKeluarga(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findoneKeluarga(id);
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
    "/find-data-pendidikan/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil data pendidikan dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id, status } = request.params;
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

  fastify.get(
    "/findone-data-pendidikan/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil detail data pendidikan dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id, status } = request.params;
      let exec = null;
      if (!status || status == "PNS") {
        exec = await fastify.kepegawaian_pns.findonePendidikan(id);
      } else {
        exec = await fastify.kepegawaian_non_pns.findonePendidikan(id);
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
    "/count-keluarga/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk menghitung data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
      const { id, status } = request.params;
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
    "/get-pendidikan-terakhir/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mendapatkan data pendidikan terakhir dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
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
      const { id, status } = request.params;
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
    "/auto-search-pegawai",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk autocomplete kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["informasi-data-pegawai"],
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
      const { status, nomor } = request.query;
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

  // ^ update by id status
  fastify.put(
    "/update/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengubah data kepegawaian dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "update Endpoint Informasi Data Pegawai by Id",
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
            kepegawaian_no_sk_pangkat_terakhir: {
              type: "string",
            },
            kepegawaian_tgl_sk_pangkat_terakhir: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat: {
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
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id, status } = request.params;
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
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
      } = request.body;
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
          kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
          kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
          kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
          kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
          kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
          kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
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
  fastify.post(
    "/update-file/:id/:status",
    {
      schema: {
        tags: ["informasi-data-pegawai"],
      },
      preHandler: upload.fields([
        {
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
      const { id, status } = request.params;
      let vals = "";
      try {
        const kepegawaian_sk_pangkat_terakhir = request.files[
          "kepegawaian_sk_pangkat_terakhir"
        ]
          ? await truePath(
              request.files["kepegawaian_sk_pangkat_terakhir"][0].path
            )
          : "";

        const kepegawaian_sk_pns = request.files["kepegawaian_sk_pns"]
          ? await truePath(request.files["kepegawaian_sk_pns"][0].path)
          : "";
        const kepegawaian_sk_cpns = request.files["kepegawaian_sk_cpns"]
          ? await truePath(request.files["kepegawaian_sk_cpns"][0].path)
          : "";
        const kepegawaian_diklat_pol_pp_ppns_file_sertifikat = request.files[
          "kepegawaian_diklat_pol_pp_ppns_file_sertifikat"
        ]
          ? await truePath(
              request.files["kepegawaian_diklat_pol_pp_ppns_file_sertifikat"][0]
                .path
            )
          : "";
        const kepegawaian_diklat_pol_pp_strutural_file_sertifikat = request
          .files["kepegawaian_diklat_pol_pp_strutural_file_sertifikat"]
          ? await truePath(
              request.files[
                "kepegawaian_diklat_pol_pp_strutural_file_sertifikat"
              ][0].path
            )
          : "";
        const kepegawaian_diklat_pol_pp_dasar_file_sertifikat = request.files[
          "kepegawaian_diklat_pol_pp_dasar_file_sertifikat"
        ]
          ? await truePath(
              request.files[
                "kepegawaian_diklat_pol_pp_dasar_file_sertifikat"
              ][0].path
            )
          : "";
        const kepegawaian_diklat_fungsional_pol_pp_file_sertifikat = request
          .files["kepegawaian_diklat_fungsional_pol_pp_file_sertifikat"]
          ? await truePath(
              request.files[
                "kepegawaian_diklat_fungsional_pol_pp_file_sertifikat"
              ][0].path
            )
          : "";
        const foto = request.files["foto"]
          ? await truePath(request.files["foto"][0].path)
          : "";

        (await kepegawaian_sk_pangkat_terakhir) !== ""
          ? (vals += `kepegawaian_sk_pangkat_terakhir = '${kepegawaian_sk_pangkat_terakhir}', `)
          : null;
        (await kepegawaian_sk_pns) !== ""
          ? (vals += `kepegawaian_sk_pns = '${kepegawaian_sk_pns}', `)
          : null;
        (await kepegawaian_sk_cpns) !== ""
          ? (vals += `kepegawaian_sk_cpns = '${kepegawaian_sk_cpns}', `)
          : null;
        (await kepegawaian_diklat_pol_pp_ppns_file_sertifikat) !== ""
          ? (vals += `kepegawaian_diklat_pol_pp_ppns_file_sertifikat = '${kepegawaian_diklat_pol_pp_ppns_file_sertifikat}', `)
          : null;
        (await kepegawaian_diklat_pol_pp_strutural_file_sertifikat) !== ""
          ? (vals += `kepegawaian_diklat_pol_pp_strutural_file_sertifikat = '${kepegawaian_diklat_pol_pp_strutural_file_sertifikat}', `)
          : null;
        (await kepegawaian_diklat_pol_pp_dasar_file_sertifikat) !== ""
          ? (vals += `kepegawaian_diklat_pol_pp_dasar_file_sertifikat = '${kepegawaian_diklat_pol_pp_dasar_file_sertifikat}', `)
          : null;
        (await kepegawaian_diklat_fungsional_pol_pp_file_sertifikat) !== ""
          ? (vals += `kepegawaian_diklat_fungsional_pol_pp_file_sertifikat = '${kepegawaian_diklat_fungsional_pol_pp_file_sertifikat}', `)
          : null;
        (await foto) !== "" ? (vals += `foto = '${foto}', `) : null;

        if (vals !== "") {
          if (status === "PNS") {
            await fastify.kepegawaian_pns.updateFile(id, "", vals);
          } else {
            await fastify.kepegawaian_non_pns.updateFile(id, "", vals, status);
          }
          reply.send({
            message: "success",
            code: 200,
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

  fastify.post(
    "/update-file-pendidikan/:id/:status",
    {
      schema: {
        tags: ["informasi-data-pegawai"],
      },
      preHandler: upload.fields([
        {
          name: "file_ijazah",
          maxCount: 1,
        },
      ]),
    },
    async (request, reply) => {
      const { id, status } = request.params;
      const file_ijazah = request.files["file_ijazah"]
        ? await truePath(request.files["file_ijazah"][0].path)
        : "";
      try {
        if (status === "PNS") {
          await fastify.kepegawaian_pns.updateFilePendidikan(
            id,
            "",
            `file_ijazah = '${file_ijazah}',`
          );
        } else {
          await fastify.kepegawaian_non_pns.updateFilePendidikan(
            id,
            "",
            `file_ijazah = '${file_ijazah}',`
          );
        }
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  // create keluarga PNS
  fastify.post(
    "/create-keluarga-PNS",
    {
      schema: {
        description: "This is an endpoint for creating data keluarga pns",
        tags: ["informasi-data-pegawai"],
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
        const { id } = await fastify.kepegawaian_pns.createKeluargaPNS(
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
    "/update-keluarga-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for updating data keluarga pns",
        tags: ["informasi-data-pegawai"],
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
      const { id } = request.params;
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
        reply.send({ message: "success", code: 200 });
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
    "/delete-keluarga-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for deleting keluarga pns",
        tags: ["informasi-data-pegawai"],
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
      const { id } = request.params;
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

  // ─── Rekap PPNS ──────────────────────────────────────────────────────────────
  // ^ table
  fastify.get(
    "/PPNS-rekapitulasi",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil seluruh Rekapitulasi data kepegawaian berstatus PPNS",
        tags: ["informasi-data-pegawai"],
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
                    skpd: {
                      type: "string",
                    },
                    jumlah: {
                      type: "number",
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

  // create keluarga non pns
  fastify.post(
    "/create-keluarga-non-PNS",
    {
      schema: {
        description: "This is an endpoint for creating data keluarga non pns",
        tags: ["informasi-data-pegawai"],
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
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "object",
                properties: {
                  id: { type: "number" },
                  hubungan: { type: "string" },
                  nama: { type: "string" },
                  tempat_lahir: { type: "string" },
                  tgl_lahir: { type: "string" },
                  jenis_kelamin: { type: "string" },
                  id_pegawai: { type: "number" },
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
        const { id } = await fastify.kepegawaian_non_pns.createKeluargaNonPNS(
          hubungan,
          nama,
          tempat_lahir,
          tgl_lahir,
          jenis_kelamin,
          id_pegawai
        );
        reply.send({ message: "success", code: 200, data: { return_id: id } });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //update keluarga non pns
  fastify.put(
    "/update-keluarga-non-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for updating data keluarga non pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for updating data keluarga non pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating keluarga non pns",
          type: "object",
          properties: {
            hubungan: { type: "string" },
            nama: { type: "string" },
            tempat_lahir: { type: "string" },
            tgl_lahir: { type: "string" },
            jenis_kelamin: { type: "string" },
            id_pegawai: { type: "number" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
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
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //delete keluarga non pns
  fastify.delete(
    "/delete-keluarga-non-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for deleting keluarga non pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for deleting data keluarga non pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      try {
        await fastify.kepegawaian_non_pns.delKelNonPNS(id, "");
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //create pendidikan pns
  fastify.post(
    "/create-pendidikan-PNS",
    {
      schema: {
        description: "This is an endpoint for creating data pendidikan pns",
        tags: ["informasi-data-pegawai"],
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
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "object",
                properties: {
                  return_id: { type: "number" },
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
        const { id } = await fastify.kepegawaian_pns.createPendidikanPNS(
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({ message: "success", code: 200, data: { return_id: id } });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //update pendidikan pns
  fastify.put(
    "/update-pendidikan-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for updating data pendidikan pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for updating data pendidikan pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating pendidikan pns",
          type: "object",
          properties: {
            jenis_pendidikan: { type: "number" },
            nama_sekolah: { type: "string" },
            nomor_ijazah: { type: "string" },
            tgl_ijazah: { type: "string" },
            jurusan: { type: "string" },
            fakultas: { type: "string" },
            file_ijazah: { type: "string" },
            id_pegawai: { type: "number" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
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
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //deleted pendidikan pns
  fastify.delete(
    "/delete-pendidikan-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for deleting pendidikan pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for deleting data pendidikan pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      try {
        await fastify.kepegawaian_pns.delPendidikanPNS(id, "");
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //create pendidikan non pns
  fastify.post(
    "/create-pendidikan-non-PNS",
    {
      schema: {
        description: "This is an endpoint for creating data pendidikan non pns",
        tags: ["informasi-data-pegawai"],
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
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "object",
                properties: {
                  id: { type: "number" },
                  jenis_pendidikan: { type: "number" },
                  nama_sekolah: { type: "string" },
                  nomor_ijazah: { type: "string" },
                  tgl_ijazah: { type: "string" },
                  jurusan: { type: "string" },
                  fakultas: { type: "string" },
                  file_ijazah: { type: "string" },
                  id_pegawai: { type: "number" },
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
        const { id } = await fastify.kepegawaian_non_pns.createPendidikanNonPNS(
          jenis_pendidikan,
          nama_sekolah,
          nomor_ijazah,
          tgl_ijazah,
          jurusan,
          fakultas,
          file_ijazah,
          id_pegawai
        );
        reply.send({ message: "success", code: 200, data: { return_id: id } });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //updated pendidikan non pns
  fastify.put(
    "/update-pendidikan-non-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for updating data pendidikan non pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for updating data pendidikan non pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating pendidikan non pns",
          type: "object",
          properties: {
            jenis_pendidikan: { type: "number" },
            nama_sekolah: { type: "string" },
            nomor_ijazah: { type: "string" },
            tgl_ijazah: { type: "string" },
            jurusan: { type: "string" },
            fakultas: { type: "string" },
            file_ijazah: { type: "string" },
            id_pegawai: { type: "number" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
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
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  //deleted pendidikan non pns
  fastify.delete(
    "/delete-pendidikan-non-PNS/:id",
    {
      schema: {
        description: "This is an endpoint for deleting pendidikan non pns",
        tags: ["informasi-data-pegawai"],
        params: {
          description: "Payload for deleting data pendidikan non pns",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      try {
        await fastify.kepegawaian_non_pns.delPendidikanNonPNS(id, "");
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/unduh-pegawai",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengunduh seluruh data kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["informasi-data-pegawai"],
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
      let headerKeluarga = [];
      let dataKeluarga = [];
      let headerPendidikan = [];
      let dataPendidikan = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        if (status == "PNS") {
          headerKepegawaian = [
            "Id",
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
            "Kelurahan",
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
            "Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_pns.getDataUnduh();
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }
        if (status == "PTT") {
          headerKepegawaian = [
            "Id",
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
            "NPTT",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Kelurahan",
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
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_non_pns.getDataUnduh(
            status
          );
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_non_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_non_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }
        if (status == "PJLP") {
          headerKepegawaian = [
            "Id",
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
            "NPJLP",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Kelurahan",
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
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_non_pns.getDataUnduh(
            status
          );
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_non_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return {
              id: item.id,
              nama: item.nama,
            };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_non_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerKepegawaian, ...dataKepegawaian];
        const wsDataKeluarga = [headerKeluarga, ...dataKeluarga];
        const wsDataPendidikan = [headerPendidikan, ...dataPendidikan];
        // Buat Workbook
        const fileName = "DATA KEPEGAWAIAN " + status;
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - KEPEGAWAIAN",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA KEPEGAWAIAN");
        wb.SheetNames.push("DATA KELUARGA");
        wb.SheetNames.push("DATA PENDIDIKAN");
        // Buat Sheet dengan Data
        const ws_kepegawaian = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        const ws_keluarga = XLSX.utils.aoa_to_sheet(wsDataKeluarga);
        const ws_pendidikan = XLSX.utils.aoa_to_sheet(wsDataPendidikan);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA KEPEGAWAIAN"] = ws_kepegawaian;
        wb.Sheets["DATA KELUARGA"] = ws_keluarga;
        wb.Sheets["DATA PENDIDIKAN"] = ws_pendidikan;

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
};
