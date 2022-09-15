const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const multer = require("fastify-multer");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);
  fastify.register(multer.contentParser);
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "/uploads/kepegawaian");
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + "-" + Date.now());
    },
  });
  const upload = multer({ storage: storage });

  function truePath(path) {
    return path.replace(/\\/g, "/");
  }

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil seluruh data kepegawaian berstatus PNS, PTT, PJLP",
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
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    nama: { type: "string" },
                    tempat_lahir: { type: "string" },
                    tgl_lahir: { type: "string" },
                    jenis_kelamin: { type: "string" },
                    agama: { type: "string" },
                    no_hp: { type: "string" },
                    kepegawaian_nrk: { type: "string" },
                    kepegawaian_status_pegawai: { type: "string" },
                    foto: { type: "string" },
                  },
                },
              },
              total_data: { type: "number" },
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
              qwhere += ` AND kpns.nama ILIKE '%${nama}%'`;
            }
            if (nrk) {
              qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nrk}%'`;
            }
            if (nopegawai) {
              qwhere += ` AND kpns.kepegawaian_nptt_npjlp ILIKE '%${nopegawai}%'`;
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
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/findone/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil detail data pribadi & kepegawaian berstatus PNS, PTT, PJLP berdasarkan id",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: { type: "number" },
            status: { type: "string" },
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
                  id: { type: "number" },
                  nama: { type: "string" },
                  tempat_lahir: { type: "string" },
                  tgl_lahir: { type: "string" },
                  jenis_kelamin_value: { type: "string" },
                  jenis_kelamin: { type: "string" },
                  agama_id: { type: "number" },
                  agama_name: { type: "string" },
                  nik: { type: "string" },
                  no_kk: { type: "string" },
                  status_perkawinan: { type: "string" },
                  no_hp: { type: "string" },
                  sesuai_ktp_alamat: { type: "string" },
                  sesuai_ktp_rtrw: { type: "string" },
                  sesuai_ktp_provinsi: { type: "string" },
                  sesuai_ktp_kabkota: { type: "string" },
                  sesuai_ktp_kecamatan: { type: "string" },
                  sesuai_ktp_kelurahan: { type: "string" },
                  domisili_alamat: { type: "string" },
                  domisili_rtrw: { type: "string" },
                  domisili_provinsi: { type: "string" },
                  domisili_kabkota: { type: "string" },
                  domisili_kecamatan: { type: "string" },
                  domisili_kelurahan: { type: "string" },
                  kepegawaian_nrk: { type: "string" },
                  kepegawaian_nip: { type: "string" },
                  kepegawaian_pangkat_id: { type: "number" },
                  kepegawaian_pangkat_name: { type: "string" },
                  kepegawaian_golongan_id: { type: "number" },
                  kepegawaian_golongan_name: { type: "string" },
                  kepegawaian_tmtpangkat: { type: "string" },
                  kepegawaian_pendidikan_pada_sk_id: { type: "number" },
                  kepegawaian_pendidikan_pada_sk_name: { type: "string" },
                  kepegawaian_jabatan_id: { type: "number" },
                  kepegawaian_jabatan_name: { type: "string" },
                  kepegawaian_eselon_id: { type: "number" },
                  kepegawaian_eselon_name: { type: "string" },
                  kepegawaian_tempat_tugas: { type: "string" },
                  kepegawaian_subbag_seksi_kecamatan: { type: "string" },
                  kepegawaian_kelurahan: { type: "string" },
                  kepegawaian_status_pegawai: { type: "string" },
                  kepegawaian_no_rekening: { type: "string" },
                  kepegawaian_no_karpeg: { type: "string" },
                  kepegawaian_no_kasirkasur: { type: "string" },
                  kepegawaian_no_taspen: { type: "string" },
                  kepegawaian_npwp: { type: "string" },
                  kepegawaian_no_bpjs_askes: { type: "string" },
                  kepegawaian_tmt_cpns: { type: "string" },
                  kepegawaian_sk_cpns: { type: "string" },
                  kepegawaian_tmt_pns: { type: "string" },
                  kepegawaian_tgl_sk_pns: { type: "string" },
                  kepegawaian_sk_pns: { type: "string" },
                  kepegawaian_no_sk_pangkat_terakhir: { type: "string" },
                  kepegawaian_tgl_sk_pangkat_terakhir: { type: "string" },
                  kepegawaian_sk_pangkat_terakhir: { type: "string" },
                  kepegawaian_diklat_pol_pp_dasar: { type: "string" },
                  kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_dasar_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural: { type: "string" },
                  kepegawaian_diklat_pol_pp_strutural_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_strutural_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns: { type: "string" },
                  kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_pol_pp_ppns_file_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp: { type: "string" },
                  kepegawaian_diklat_fungsional_pol_pp_no_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat: {
                    type: "string",
                  },
                  kepegawaian_diklat_fungsional_pol_pp_file_sertifikat: {
                    type: "string",
                  },
                  foto: { type: "string" },
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
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/find-data-keluarga/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: { type: "number" },
            status: { type: "string" },
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
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    hubungan: { type: "string" },
                    nama: { type: "string" },
                    tempat_lahir: { type: "string" },
                    tgl_lahir: { type: "string" },
                    jenis_kelamin: { type: "string" },
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
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/find-data-pendidikan/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengambil data pendidikan dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: { type: "number" },
            status: { type: "string" },
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
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    jenis_pendidikan: { type: "string" },
                    nama_sekolah: { type: "string" },
                    nomor_ijazah: { type: "string" },
                    tgl_ijazah: { type: "string" },
                    jurusan: { type: "string" },
                    fakultas: { type: "string" },
                    file_ijazah: { type: "string" },
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
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/count-keluarga/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk menghitung data keluarga dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: { type: "number" },
            status: { type: "string" },
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
                  total: { type: "number" },
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
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/get-pendidikan-terakhir/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mendapatkan data pendidikan terakhir dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            id: { type: "number" },
            status: { type: "string" },
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
                  jenis_pendidikan: { type: "string" },
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
          reply.send({ message: "success", code: 200, data: exec[0] });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/auto-search-pegawai",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk autocomplite kepegawaian berstatus PNS, PTT, PJLP",
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
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    nama: { type: "string" },
                    no_pegawai: { type: "string" },
                  },
                },
              },
              total_data: { type: "number" },
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
          qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nomor}%'`
          exec = await fastify.kepegawaian_pns.autocompliteFill(qwhere);
        } else {
          qwhere += ` AND kpnns.kepegawaian_nptt_npjlp ILIKE '%${nomor}%'`
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
          reply.send({ message: "success", code: 204 });
        }
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

  fastify.put(
    "/update/:id/:status",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengubah data kepegawaian dari salah satu pegawai berstatus PNS, PTT, PJLP berdasarkan id & status",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "update endpoint kepegawaian by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Parameter yang digunakan",
          type: "object",
          properties: {
            nama: { type: "string" },
            tempat_lahir: { type: "string" },
            tgl_lahir: { type: "string" },
            jenis_kelamin: { type: "string" },
            agama: { type: "number" },
            nik: { type: "string" },
            no_kk: { type: "string" },
            status_perkawinan: { type: "string" },
            no_hp: { type: "string" },
            sesuai_ktp_alamat: { type: "string" },
            sesuai_ktp_rtrw: { type: "string" },
            sesuai_ktp_provinsi: { type: "string" },
            sesuai_ktp_kabkota: { type: "string" },
            sesuai_ktp_kecamatan: { type: "string" },
            sesuai_ktp_kelurahan: { type: "string" },
            domisili_alamat: { type: "string" },
            domisili_rtrw: { type: "string" },
            domisili_provinsi: { type: "string" },
            domisili_kabkota: { type: "string" },
            domisili_kecamatan: { type: "string" },
            domisili_kelurahan: { type: "string" },
            kepegawaian_nrk: { type: "string" },
            kepegawaian_nip: { type: "string" },
            kepegawaian_pangkat: { type: "number" },
            kepegawaian_golongan: { type: "number" },
            kepegawaian_tmtpangkat: { type: "string" },
            kepegawaian_pendidikan_pada_sk: { type: "number" },
            kepegawaian_jabatan: { type: "number" },
            kepegawaian_eselon: { type: "number" },
            kepegawaian_tempat_tugas: { type: "string" },
            kepegawaian_subbag_seksi_kecamatan: { type: "string" },
            kepegawaian_kelurahan: { type: "string" },
            kepegawaian_status_pegawai: { type: "string" },
            kepegawaian_no_rekening: { type: "string" },
            kepegawaian_no_karpeg: { type: "string" },
            kepegawaian_no_kasirkasur: { type: "string" },
            kepegawaian_no_taspen: { type: "string" },
            kepegawaian_npwp: { type: "string" },
            kepegawaian_no_bpjs_askes: { type: "string" },
            kepegawaian_tmt_cpns: { type: "string" },
            kepegawaian_sk_cpns: { type: "string", format: "binary" },
            kepegawaian_tmt_pns: { type: "string" },
            kepegawaian_tgl_sk_pns: { type: "string" },
            kepegawaian_sk_pns: {
              type: "string",
              format: "binary",
            },
            kepegawaian_no_sk_pangkat_terakhir: { type: "string" },
            kepegawaian_tgl_sk_pangkat_terakhir: { type: "string" },
            kepegawaian_sk_pangkat_terakhir: {
              type: "string",
              format: "binary",
            },
            kepegawaian_diklat_pol_pp_dasar: { type: "string" },
            kepegawaian_diklat_pol_pp_dasar_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_dasar_file_sertifikat: {
              type: "string",
              format: "binary",
            },
            kepegawaian_diklat_pol_pp_strutural: { type: "string" },
            kepegawaian_diklat_pol_pp_strutural_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_strutural_file_sertifikat: {
              type: "string",
              format: "binary",
            },
            kepegawaian_diklat_pol_pp_ppns: { type: "string" },
            kepegawaian_diklat_pol_pp_ppns_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_pol_pp_ppns_file_sertifikat: {
              type: "string",
              format: "binary",
            },
            kepegawaian_diklat_fungsional_pol_pp: { type: "string" },
            kepegawaian_diklat_fungsional_pol_pp_no_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat: {
              type: "string",
            },
            kepegawaian_diklat_fungsional_pol_pp_file_sertifikat: {
              type: "string",
              format: "binary",
            },
            foto: { type: "string", format: "binary" },
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
      preHandler: upload.fields([
        { name: "foto", maxCount: 1 },
        {
          name: "kepegawaian_diklat_fungsional_pol_pp_file_sertifikat",
          maxCount: 1,
        },
        { name: "kepegawaian_diklat_pol_pp_ppns_file_sertifikat", maxCount: 1 },
        {
          name: "kepegawaian_diklat_pol_pp_strutural_file_sertifikat",
          maxCount: 1,
        },
        {
          name: "kepegawaian_diklat_pol_pp_dasar_file_sertifikat",
          maxCount: 1,
        },
        { name: "kepegawaian_sk_pangkat_terakhir", maxCount: 1 },
        { name: "kepegawaian_sk_pns", maxCount: 1 },
        { name: "kepegawaian_sk_cpns", maxCount: 1 },
      ]),
    },
    async (request, reply) => {
      console.log("request.files", request.files);
      const { id } = request.params;
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

      try {
        const kepegawaian_sk_pangkat_terakhir = "";
        const kepegawaian_sk_pns = "";
        const kepegawaian_sk_cpns = "";
        const kepegawaian_diklat_pol_pp_ppns_file_sertifikat = "";
        const kepegawaian_diklat_pol_pp_strutural_file_sertifikat = "";
        const kepegawaian_diklat_pol_pp_dasar_file_sertifikat = "";
        const kepegawaian_diklat_fungsional_pol_pp_file_sertifikat = "";
        const foto = "";
        // await fastify.kepegawaian_pns.update(
        //   id,
        //   nama,
        //   tempat_lahir,
        //   tgl_lahir,
        //   jenis_kelamin,
        //   agama,
        //   nik,
        //   no_kk,
        //   status_perkawinan,
        //   no_hp,
        //   sesuai_ktp_alamat,
        //   sesuai_ktp_rtrw,
        //   sesuai_ktp_provinsi,
        //   sesuai_ktp_kabkota,
        //   sesuai_ktp_kecamatan,
        //   sesuai_ktp_kelurahan,
        //   domisili_alamat,
        //   domisili_rtrw,
        //   domisili_provinsi,
        //   domisili_kabkota,
        //   domisili_kecamatan,
        //   domisili_kelurahan,
        //   kepegawaian_nrk,
        //   kepegawaian_nip,
        //   kepegawaian_pangkat,
        //   kepegawaian_golongan,
        //   kepegawaian_tmtpangkat,
        //   kepegawaian_pendidikan_pada_sk,
        //   kepegawaian_jabatan,
        //   kepegawaian_eselon,
        //   kepegawaian_tempat_tugas,
        //   kepegawaian_subbag_seksi_kecamatan,
        //   kepegawaian_kelurahan,
        //   kepegawaian_status_pegawai,
        //   kepegawaian_no_rekening,
        //   kepegawaian_no_karpeg,
        //   kepegawaian_no_kasirkasur,
        //   kepegawaian_no_taspen,
        //   kepegawaian_npwp,
        //   kepegawaian_no_bpjs_askes,
        //   kepegawaian_tmt_cpns,
        //   kepegawaian_sk_cpns,
        //   kepegawaian_tmt_pns,
        //   kepegawaian_tgl_sk_pns,
        //   kepegawaian_sk_pns,
        //   kepegawaian_no_sk_pangkat_terakhir,
        //   kepegawaian_tgl_sk_pangkat_terakhir,
        //   kepegawaian_sk_pangkat_terakhir,
        //   kepegawaian_diklat_pol_pp_dasar,
        //   kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        //   kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
        //   kepegawaian_diklat_pol_pp_dasar_file_sertifikat,
        //   kepegawaian_diklat_pol_pp_strutural,
        //   kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        //   kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
        //   kepegawaian_diklat_pol_pp_strutural_file_sertifikat,
        //   kepegawaian_diklat_pol_pp_ppns,
        //   kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        //   kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
        //   kepegawaian_diklat_pol_pp_ppns_file_sertifikat,
        //   kepegawaian_diklat_fungsional_pol_pp,
        //   kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        //   kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
        //   kepegawaian_diklat_fungsional_pol_pp_file_sertifikat,
        //   foto,
        //   ""
        // );

        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

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
