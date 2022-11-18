const master_sumber_informasi  = require("../../../services/master/master_sumber_informasi");

module.exports = async function (fastify, opts) {
  fastify.register(master_sumber_informasi);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master sumber informasi",
        tags: ["master sumber informasi"],
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
                    sumber_informasi: { type: "string" },
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
      const exec = await fastify.sumber_informasi.find();

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
        description: "This is an endpoint for fetching a master sumber informasi",
        tags: ["master sumber informasi"],
        params: {
          description: "Find one master sumber informasi id",
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
                  sumber_informasi: { type: "string" },
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
      const exec = await fastify.sumber_informasi.findone(id);

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
    "/findone-by-sumber_informasi/:sumber_informasi",
    {
      schema: {
        description: "This is an endpoint for fetching a master sumber informasi",
        tags: ["master sumber informasi"],
        params: {
          description: "Find one master sumber informasi by sumber_informasi",
          type: "object",
          properties: {
            sumber_informasi: { type: "string" },
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
                  sumber_informasi: { type: "string" },
                  kode: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { sumber_informasi } = request.params;
      const exec = await fastify.sumber_informasi.findone_by_sumber_informasi(sumber_informasi);

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
        description: "This is an endpoint for creating a master sumber informasi",
        tags: ["master sumber informasi"],
        body: {
          description: "Payload for creating a master sumber informasi",
          type: "object",
          properties: {
            sumber_informasi: { type: "string" },
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
      const {sumber_informasi,created_by} = request.body;

      try {
        await fastify.sumber_informasi.create(sumber_informasi,created_by);
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
        description: "This is an endpoint for updating an existing master sumber informasi",
        tags: ["master sumber informasi"],
        params: {
          description: "update master sumber informasi by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master sumber informasi",
          type: "object",
          properties: {
            sumber_informasi: { type: "string" },
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
      const {sumber_informasi, updated_by } = request.body;

      try {
        await fastify.sumber_informasi.update(id,sumber_informasi,updated_by);
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
        description: "This is an endpoint for DELETING an existing master sumber informasi.",
        tags: ["master sumber informasi"],
        params: {
          description: "master sumber informasi by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master sumber informasi",
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
        await fastify.sumber_informasi.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master sumber informasi",
        tags: ["master sumber informasi"],
        params: {
          description: "Filter master sumber informasi by search",
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
                    sumber_informasi: { type: "string" },
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
      const { q } = request.params;
      const exec = await fastify.sumber_informasi.filter(q);

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
