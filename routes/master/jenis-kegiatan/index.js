const master_jenis_kegiatan  = require("../../../services/master/master_jenis_kegiatan");

module.exports = async function (fastify, opts) {
  fastify.register(master_jenis_kegiatan);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jenis kegiatan",
        tags: ["master jenis kegiatan"],
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
                    jenis_kegiatan: { type: "string" },
                    kode: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_jenis_kegiatan.find();

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
        description: "This is an endpoint for fetching a master jenis kegiatan",
        tags: ["master jenis kegiatan"],
        params: {
          description: "Find one master jenis kegiatan id",
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
                  jenis_kegiatan: { type: "string" },
                  kode: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_jenis_kegiatan.findone(id);

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
    "/findone-by-jenis-kegiatan/:jenis_kegiatan",
    {
      schema: {
        description: "This is an endpoint for fetching a master jenis kegiatan",
        tags: ["master jenis kegiatan"],
        params: {
          description: "Find one master jenis kegiatan by jenis_kegiatan",
          type: "object",
          properties: {
            jenis_kegiatan: { type: "string" },
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
                  jenis_kegiatan: { type: "string" },
                  kode: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_kegiatan } = request.params;
      const exec = await fastify.master_jenis_kegiatan.findone_by_jenis_kegiatan(jenis_kegiatan);

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
        description: "This is an endpoint for creating a master jenis kegiatan",
        tags: ["master jenis kegiatan"],
        body: {
          description: "Payload for creating a master jenis kegiatan",
          type: "object",
          properties: {
            jenis_kegiatan: { type: "string" },
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
      const {jenis_kegiatan,created_by} = request.body;

      try {
        await fastify.master_jenis_kegiatan.create(jenis_kegiatan,created_by);
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
        description: "This is an endpoint for updating an existing master jenis kegiatan",
        tags: ["master jenis kegiatan"],
        params: {
          description: "update master jenis kegiatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jenis kegiatan",
          type: "object",
          properties: {
            jenis_kegiatan: { type: "string" },
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
      const {jenis_kegiatan, updated_by } = request.body;

      try {
        await fastify.master_jenis_kegiatan.update(id,jenis_kegiatan,updated_by);
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
        description: "This is an endpoint for DELETING an existing master jenis kegiatan.",
        tags: ["master jenis kegiatan"],
        params: {
          description: "master jenis kegiatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jenis kegiatan",
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
        await fastify.master_jenis_kegiatan.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
