const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all kepegawaian",
        tags: ["endpoint kepegawaian"],
        querystring: {
          type: "object",
          properties: {
            limit: {
              type: "integer",
            },
            offset: {
              type: "integer",
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
      if (status) {
        if (status === "PNS") {
          if (nama) {
          }
          if (nrk) {
          }
          if (nopegawai) {
          }
          exec = await fastify.kepegawaian_pns.find(limit, offset);
          const { total } = await fastify.kepegawaian_pns.countAll();
          totalDt = total;
        } else {
          if (nama) {
          }
          if (nrk) {
          }
          if (nopegawai) {
          }
          exec = await fastify.kepegawaian_non_pns.find(limit, offset, status);
          const { total } = await fastify.kepegawaian_non_pns.countAll(status);
          totalDt = total;
        }
      } else {
        if (nama) {
        }
        if (nrk) {
        }
        if (nopegawai) {
        }
        exec = await fastify.kepegawaian_pns.find(limit, offset);
        const { total } = await fastify.kepegawaian_pns.countAll();
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
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/count-all",
    {
      schema: {
        description: "This is an endpoint for counting all kepegawaian",
        tags: ["endpoint kepegawaian"],
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
      const exec = await fastify.kepegawaian_pns.countAll();

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
    "/findone/:id",
    {
      schema: {
        description:
          "This is an endpoint for fetching a endpoint kepegawaian by id",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "Find one endpoint kepegawaian by id",
          type: "object",
          properties: {
            id: { type: "number" },
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
                  telepon: { type: "string" },
                  status_pic: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.kepegawaian_pns.findone(id);

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

  fastify.post(
    "/create",
    {
      schema: {
        description: "This is an endpoint for creating a endpoint kepegawaian",
        tags: ["endpoint kepegawaian"],
        body: {
          description: "Payload for creating a endpoint kepegawaian",
          type: "object",
          properties: {
            nama: { type: "string" },
            telepon: { type: "string" },
            created_by: { type: "number" },
          },
        },
        response: {
          201: {
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
      const { nama, telepon, created_by } = request.body;

      try {
        await fastify.kepegawaian_pns.create(nama, telepon, created_by);
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating an existing endpoint kepegawaian",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "update endpoint kepegawaian by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a endpoint kepegawaian",
          type: "object",
          properties: {
            nama: { type: "string" },
            telepon: { type: "string" },
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
      const { nama, telepon, updated_by } = request.body;

      try {
        await fastify.kepegawaian_pns.update(
          id,
          nama,
          telepon,

          updated_by
        );

        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update-pic/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating pic an existing endpoint kepegawaian",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "update pic endpoint kepegawaian by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating pic a endpoint kepegawaian",
          type: "object",
          properties: {
            status_pic: { type: "number" },
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
      const { status_pic, updated_by } = request.body;
      try {
        await fastify.kepegawaian_pns.update_pic(id, status_pic, updated_by);

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
          "This is an endpoint for DELETING an existing endpoint kepegawaian.",
        tags: ["endpoint kepegawaian"],
        params: {
          description: "endpoint kepegawaian by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data endpoint kepegawaian",
          type: "object",
          properties: {
            deleted_by: { type: "number" },
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
        await fastify.kepegawaian_pns.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
