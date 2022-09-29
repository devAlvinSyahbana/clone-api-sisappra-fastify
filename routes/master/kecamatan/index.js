const master_kecamatan = require("../../../services/master/master_kecamatan");

module.exports = async function (fastify, opts) {
  fastify.register(master_kecamatan);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master kecamatan",
        tags: ["master kecamatan"],
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
                    kode_kecamatan: { type: "string" },
                    kecamatan: { type: "string" },
                    kode_kota: { type: "string" },
                    kota: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_kecamatan.find();

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
        description: "This is an endpoint for fetching a master kecamatan",
        tags: ["master kecamatan"],
        params: {
          description: "Find one master kecamatan id",
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
                  kode_kecamatan: { type: "string" },
                  kecamatan: { type: "string" },
                  kode_kota: { type: "string" },
                  kota: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_kecamatan.findone(id);

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
    "/findone-by-kecamatan",
    {
      schema: {
        description: "This is an endpoint for fetching a master kecamatan",
        tags: ["master kecamatan"],
        querystring: {
          description: "Find one master kecamatan by kecamatan",
          type: "object",
          properties: {
            kota: { type: "string" },
            kecamatan: { type: "string" },
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
                    kode_kecamatan: { type: "string" },
                    kecamatan: { type: "string" },
                    kode_kota: { type: "string" },
                    kota: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kota, kecamatan } = request.query;
      const exec = await fastify.master_kecamatan.findone_by_kecamatan(kota, kecamatan);
      console.log(exec)

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
        description: "This is an endpoint for creating a master kecamatan",
        tags: ["master kecamatan"],
        body: {
          description: "Payload for creating a master kecamatan",
          type: "object",
          properties: {
            kode_kota: { type: "string" },
            kecamatan: { type: "string" },
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
      const { kode_kota, kecamatan, created_by } = request.body;

      try {
        await fastify.master_kecamatan.create(kode_kota, kecamatan, created_by);
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
        description: "This is an endpoint for updating an existing master kecamatan",
        tags: ["master kecamatan"],
        params: {
          description: "update master kecamatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master kecamatan",
          type: "object",
          properties: {
            kode_kota: { type: "string" },
            kecamatan: { type: "string" },
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
      const { kode_kota, kecamatan, updated_by } = request.body;

      try {
        await fastify.master_kecamatan.update(id, kecamatan, kode_kota, updated_by);
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
        description: "This is an endpoint for DELETING an existing master kecamatan.",
        tags: ["master kecamatan"],
        params: {
          description: "master kecamatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master kecamatan",
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
        await fastify.master_kecamatan.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/filter/:q",
    {
      schema: {
        description: "This is an endpoint for filtering a master kecamatan",
        tags: ["master kecamatan"],
        params: {
          description: "Filter master kecamatan by search",
          type: "object",
          properties: {
            q: { type: "string" },
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
      const { q } = request.params;
      const exec = await fastify.master_kecamatan.filter(q);

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
};
