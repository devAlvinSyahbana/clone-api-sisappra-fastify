const master_jenis_penertiban = require("../../../services/master/master_jenis_penertiban");

module.exports = async function (fastify, opts) {
  fastify.register(master_jenis_penertiban);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jenis penertiban",
        tags: ["master jenis penertiban"],
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
                    jenis_penertiban: { type: "string" },
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
      const exec = await fastify.master_jenis_penertiban.find();

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
        description: "This is an endpoint for fetching a master jenis penertiban",
        tags: ["master jenis penertiban"],
        params: {
          description: "Find one master jenis_ppenertibanid",
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
                  jenis_penertiban: { type: "string" },
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
      const exec = await fastify.master_jenis_penertiban.findone(id);

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
    "/findone-by-jenis-penertiban/:jenis_penertiban",
    {
      schema: {
        description: "This is an endpoint for fetching a master jenis penertiban",
        tags: ["master jenis penertiban"],
        params: {
          description: "Find one master jenis_ppenertibanby jenis penertiban",
          type: "object",
          properties: {
            jenis_penertiban: { type: "string" },
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
                  jenis_penertiban: { type: "string" },
                  kode: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_penertiban} = request.params;
      const exec = await fastify.master_jenis_penertiban.findone_by_jenis_penertiban(jenis_penertiban);

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
        description: "This is an endpoint for creating a master jenis penertiban",
        tags: ["master jenis penertiban"],
        body: {
          description: "Payload for creating a master jenis penertiban",
          type: "object",
          properties: {
            jenis_penertiban: { type: "string" },
            kode: { type: "string" },
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
      const {jenis_penertiban, kode, created_by} = request.body;

      try {
        await fastify.master_jenis_penertiban.create(jenis_penertiban, kode,created_by);
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
        description: "This is an endpoint for updating an existing master jenis penertiban",
        tags: ["master jenis penertiban"],
        params: {
          description: "update master jenis_ppenertibanby Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jenis penertiban",
          type: "object",
          properties: {
            jenis_penertiban: { type: "string" },
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
      const {jenis_penertiban, kode, updated_by } = request.body;

      try {
        await fastify.master_jenis_penertiban.update(id,jenis_penertiban, kode, updated_by);
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
        description: "This is an endpoint for DELETING an existing master jenis penertiban.",
        tags: ["master jenis penertiban"],
        params: {
          description: "master jenis_ppenertibanby Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jenis penertiban",
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
        await fastify.master_jenis_penertiban.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master jenis penertiban",
        tags: ["master jenis penertiban"],
        params: {
          description: "Filter master jenis penertiban by search",
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
                    jenis_penertiban: { type: "string" },
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
      const exec = await fastify.master_jenis_penertiban.filter(q);

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
