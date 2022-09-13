const master_kelurahan  = require("../../../services/master/master_kelurahan");

module.exports = async function (fastify, opts) {
  fastify.register(master_kelurahan);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master kelurahan",
        tags: ["master kelurahan"],
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
                    kode: { type: "string" },
                    kelurahan: { type: "string" },
                    kecamatan: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_kelurahan.find();

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
        description: "This is an endpoint for fetching a master kelurahan",
        tags: ["master kelurahan"],
        params: {
          description: "Find one master kelurahan id",
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
                  kode: { type: "string" },
                  kelurahan: { type: "string" },
                  kecamatan: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_kelurahan.findone(id);

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
    "/findone-by-kelurahan/:kecamatan/:kelurahan",
    {
      schema: {
        description: "This is an endpoint for fetching a master kelurahan",
        tags: ["master kelurahan"],
        params: {
          description: "Find one master kelurahan by kelurahan",
          type: "object",
          properties: {
            kecamatan: { type: "string" },
            kelurahan: { type: "string" },
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
                  kode: { type: "string" },
                  kelurahan: { type: "string" },
                  kecamatan: { type: "string" },
              
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kecamatan, kelurahan } = request.params;
      const exec = await fastify.master_kelurahan.findone_by_kelurahan(kecamatan, kelurahan);

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
        description: "This is an endpoint for creating a master kelurahan",
        tags: ["master kelurahan"],
        body: {
          description: "Payload for creating a master kelurahan",
          type: "object",
          properties: {
            kode_kecamatan: { type: "string" },
            kelurahan: { type: "string" },
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
      const {kode_kecamatan,kelurahan, created_by} = request.body;

      try {
        await fastify.master_kelurahan.create(kelurahan, kode_kecamatan, created_by);
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
        description: "This is an endpoint for updating an existing master kelurahan",
        tags: ["master kelurahan"],
        params: {
          description: "update master kelurahan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master kelurahan",
          type: "object",
          properties: {
            kode_kecamatan: { type: "string" },
            kelurahan: { type: "string" },
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
      const {kode_kecamatan, kelurahan, updated_by } = request.body;

      try {
        await fastify.master_kelurahan.update(id, kelurahan, kode_kecamatan, updated_by);
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
        description: "This is an endpoint for DELETING an existing master kelurahan.",
        tags: ["master kelurahan"],
        params: {
          description: "master kelurahan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master kelurahan",
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
        await fastify.master_kelurahan.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
