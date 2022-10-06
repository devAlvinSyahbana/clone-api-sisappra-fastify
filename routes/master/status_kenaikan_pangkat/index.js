const master_status_kenaikan_pangkat  = require("../../../services/master/master_status_kenaikan_pangkat");

module.exports = async function (fastify, opts) {
  fastify.register(master_status_kenaikan_pangkat);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master status kenaikan pangkat",
        tags: ["master status kenaikan pangkat"],
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
                    status_kenaikan_pangkat: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_status_kenaikan_pangkat.find();

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
        description: "This is an endpoint for fetching a master status kenaikan pangkat",
        tags: ["master status_kenaikan_pangkat"],
        params: {
          description: "Find one master status kenaikan pangkat id",
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
                  status_kenaikan_pangkat: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_status_kenaikan_pangkat.findone(id);

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
    "/findone-by-status-kenaikan-pangkat/:status_kenaikan_pangkat",
    {
      schema: {
        description: "This is an endpoint for fetching a master status kenaikan pangkat",
        tags: ["master status kenaikan pangkat"],
        params: {
          description: "Find one master status kenaikan pangkat by status kenaikan pangkat",
          type: "object",
          properties: {
            status_kenaikan_pangkat: { type: "string" },
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
                  status_kenaikan_pangkat: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { status_kenaikan_pangkat } = request.params;
      const exec = await fastify.master_status_kenaikan_pangkat.findone_by_status_kenaikan_pangkat(status_kenaikan_pangkat);

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
        description: "This is an endpoint for creating a master status kenaikan pangkat",
        tags: ["master status kenaikan pangkat"],
        body: {
          description: "Payload for creating a master status kenaikan pangkat",
          type: "object",
          properties: {
            status_kenaikan_pangkat: { type: "string" },
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
      const {status_kenaikan_pangkat,created_by} = request.body;

      try {
        await fastify.master_status_kenaikan_pangkat.create(status_kenaikan_pangkat,created_by);
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
        description: "This is an endpoint for updating an existing master status kenaikan pangkat",
        tags: ["master status kenaikan pangkat"],
        params: {
          description: "update master status kenaikan pangkat by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master status kenaikan pangkat",
          type: "object",
          properties: {
            status_kenaikan_pangkat: { type: "string" },
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
      const {status_kenaikan_pangkat, updated_by } = request.body;

      try {
        await fastify.master_status_kenaikan_pangkat.update(id,status_kenaikan_pangkat,updated_by);
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
        description: "This is an endpoint for DELETING an existing master status kenaikan pangkat.",
        tags: ["master status kenaikan pangkat"],
        params: {
          description: "master status kenaikan pangkat by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master status kenaikan pangkat",
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
        await fastify.master_status_kenaikan_pangkat.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master status kenaikan pangkat",
        tags: ["master status kenaikan pangkat"],
        params: {
          description: "Filter master status kenaikan pangkat by search",
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
                    status_kenaikan_pangkat: { type: "string" },
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
      const exec = await fastify.master_status_kenaikan_pangkat.filter(q);

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
