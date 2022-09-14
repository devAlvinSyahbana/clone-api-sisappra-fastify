const sarana_prasarana = require("../../services/sarana_prasarana");
const multer = require("fastify-multer");
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "/uploads/sarana_prasarana");
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + "-" + Date.now());
  },
});
const upload = multer({ storage: storage });

module.exports = async function (fastify, opts) {
  fastify.register(sarana_prasarana);
  fastify.register(multer.contentParser);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all sarana_prasarana",
        tags: ["sarana_prasarana"],
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
                    jenis_sarana_prasarana: { type: "string" },
                    status_sarana_prasarana: { type: "string" },
                    jumlah: { type: "number" },
                    kondisi: { type: "string" },
                    keterangan: { type: "string" },
                    dokumentasi: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.find();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/find-jenis-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all jenis-sarana-prasarana",
        tags: ["sarana_prasarana"],
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
                    jenis_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.find_jenis_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/find-kondisi-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all kondisi-sarana-prasarana",
        tags: ["sarana_prasarana"],
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
                    kondisi_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec =
        await fastify.sarana_prasarana.find_kondisi_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/find-status-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all status-sarana-prasarana",
        tags: ["sarana_prasarana"],
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
                    status_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec =
        await fastify.sarana_prasarana.find_status_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/findjenis/:jenis_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            jenis_sarana_prasarana: { type: "string" },
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
                    jenis_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_jenis_sarana_prasarana(
        jenis_sarana_prasarana
      );

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
    "/findstatus/:status_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            status_sarana_prasarana: { type: "string" },
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
                    status_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { status_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_status_sarana_prasarana(
        status_sarana_prasarana
      );

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
    "/findkondisi/:kondisi_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            kondisi_sarana_prasarana: { type: "string" },
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
                    kondisi_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kondisi_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_kondisi_sarana_prasarana(
        kondisi_sarana_prasarana
      );

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
    "/filter",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
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
            jenis_sarana_prasarana: {
              type: "integer",
            },
            status_sarana_prasarana: {
              type: "integer",
            },
            kondisi_sarana_prasarana: {
              type: "integer",
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
                    jenis_sarana_prasarana: { type: "string" },
                    status_sarana_prasarana: { type: "string" },
                    jumlah: { type: "number" },
                    kondisi: { type: "string" },
                    keterangan: { type: "string" },
                    dokumentasi: { type: "string" },
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
      const {
        limit,
        offset,
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        kondisi_sarana_prasarana,
      } = request.query;
      let exec = null;
      let totalDt = 0;
      let qwhere = "";
      if (jenis_sarana_prasarana) {
        qwhere += ` AND sp.jenis_sarana_prasarana = ${jenis_sarana_prasarana}`;
      }
      if (status_sarana_prasarana) {
        qwhere += ` AND sp.status_sarana_prasarana = ${status_sarana_prasarana}`;
      }
      if (kondisi_sarana_prasarana) {
        qwhere += ` AND sp.kondisi = ${kondisi_sarana_prasarana}`;
      }
      exec = await fastify.sarana_prasarana.filter(limit, offset, qwhere);
      const { total } = await fastify.sarana_prasarana.countAllFilter(qwhere);
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
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/findFilter",
    {
      schema: {
        description: "This is an endpoint for fetching all sarana_prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "array",
            items: {
              type: "object",
              properties: {
                jenis_sarana_prasarana: {
                  type: "string",
                },
                status_sarana_prasarana: {
                  type: "string",
                },
                kondisi: {
                  type: "string",
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.findFilter();
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description: "This is an endpoint for creating a sample crud",
        tags: ["sarana_prasarana"],
        body: {
          description: "Payload for creating a sample crud",
          type: "object",
          properties: {
            jenis_sarana_prasarana: {
              type: "string",
            },
            status_sarana_prasarana: {
              type: "string",
            },
            jumlah: {
              type: "number",
            },
            kondisi: {
              type: "string",
            },
            keterangan: {
              type: "string",
            },
            file_dokumentasi: {
              type: "string",
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              jenis_sarana_prasarana: {
                type: "string",
              },
              status_sarana_prasarana: {
                type: "string",
              },
              jumlah: {
                type: "number",
              },
              kondisi: {
                type: "string",
              },
              keterangan: {
                type: "string",
              },
              file_dokumentasi: {
                type: "string",
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        file_dokumentasi,
      } = request.body;
      const exec = await fastify.sarana_prasarana.create(
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        file_dokumentasi
      );
      reply.code(201).send(exec);
    }
  );

  // fastify.post("/uploadSchema", {
  //   schema: {
  //     tags: ["sarana_prasarana"],
  //     consumes: ["multipart/form-data"],
  //     body: {
  //       type: "object",
  //       properties: {
  //         fileName: {
  //           type: "array",
  //           items: {
  //             type: "string",
  //             format: "binary",
  //           },
  //         },
  //       },
  //       required: ["fileName"],
  //     },
  //   },
  //   handler: (request, reply) => {
  //   const {
  //     file
  //   } = request.body.file;
  //   console.log(file);
  //   reply.send({
  //     file
  //   });
  // },
  // });

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating an existing sarana_prasarana",
        tags: ["sarana_prasarana"],
        params: {
          description: "update sarana_prasarana by Id",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating a sarana_prasarana",
          type: "object",
          properties: {
            jenis_sarana_prasarana: { type: "string" },
            status_sarana_prasarana: { type: "string" },
            jumlah: { type: "number" },
            kondisi: { type: "string" },
            keterangan: { type: "string" },
            file_dokumentasi: { type: "string" },
            updated_by: { type: "number" },
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
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        file_dokumentasi,
        updated_by,
      } = request.body;

      try {
        await fastify.sarana_prasarana.update(
          id,
          jenis_sarana_prasarana,
          status_sarana_prasarana,
          jumlah,
          kondisi,
          keterangan,
          file_dokumentasi,
          updated_by
        );

        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing sarana_prasarana",
        tags: ["sarana_prasarana"],
        params: {
          description: "sarana_prasarana by Id",
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
      const { deleted_by } = request.body;

      try {
        await fastify.login.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
