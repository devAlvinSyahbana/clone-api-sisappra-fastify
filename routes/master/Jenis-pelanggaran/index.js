const master_jenis_pelanggaran  = require("../../../services/master/master_jenis_pelanggaran");

module.exports = async function (fastify, opts) {
  fastify.register(master_jenis_pelanggaran);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jenis pelanggaran",
        tags: ["master jenis pelanggaran"],
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
                    jenis_pelanggaran: { type: "string" },
                    kode_penertiban: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_jenis_pelanggaran.find();

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
        description: "This is an endpoint for fetching a master jenis pelanggaran",
        tags: ["master jenis pelanggaran"],
        params: {
          description: "Find one master jenis pelanggaran id",
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
                  jenis_pelanggaran: { type: "string" },
                  kode_penertiban: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_jenis_pelanggaran.findone(id);

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
    "/findone-by-kode-penertiban/:kode_penertiban",
    {
      schema: {
        description: "This is an endpoint for fetching a master jenis pelanggaran",
        tags: ["master jenis pelanggaran"],
        params: {
          description: "Find one master jenis pelanggaran by jenis pelanggaran",
          type: "object",
          properties: {
            kode_penertiban: { type: "string" },
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
                    jenis_pelanggaran: { type: "string" },
                    kode_penertiban: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kode_penertiban } = request.params;
      const exec = await fastify.master_jenis_pelanggaran.findone_by_kode_penertiban(kode_penertiban);

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
        description: "This is an endpoint for creating a master jenis pelanggaran",
        tags: ["master jenis pelanggaran"],
        body: {
          description: "Payload for creating a master jenis pelanggaran",
          type: "object",
          properties: {
            jenis_pelanggaran: { type: "string" },
            kode_penertiban: { type: "string" },
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
      const {jenis_pelanggaran, kode_penertiban, created_by} = request.body;

      try {
        await fastify.master_jenis_pelanggaran.create(jenis_pelanggaran, kode_penertiban, created_by);
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
        description: "This is an endpoint for updating an existing master jenis pelanggaran",
        tags: ["master jenis pelanggaran"],
        params: {
          description: "update master jenis pelanggaran by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jenis pelanggaran",
          type: "object",
          properties: {
            jenis_pelanggaran: { type: "string" },
            kode_penertiban: { type: "string" },
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
      const {jenis_pelanggaran, kode_penertiban, updated_by } = request.body;

      try {
        await fastify.master_jenis_pelanggaran.update(id,jenis_pelanggaran, kode_penertiban, updated_by);
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
        description: "This is an endpoint for DELETING an existing master jenis pelanggaran.",
        tags: ["master jenis pelanggaran"],
        params: {
          description: "master jenis pelanggaran by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jenis pelanggaran",
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
        await fastify.master_jenis_pelanggaran.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
