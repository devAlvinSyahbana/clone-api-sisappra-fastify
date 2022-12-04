const status_sarana_prasarana  = require("../../../services/master/master_status_sarana_prasarana");

module.exports = async function (fastify, opts) {
  fastify.register(status_sarana_prasarana);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master status sarana prasarana",
        tags: ["master status sarana prasarana"],
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
      const exec = await fastify.status_sarana_prasarana.find();

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
        description: "This is an endpoint for fetching a master status sarana prasarana",
        tags: ["master status sarana prasarana"],
        params: {
          description: "Find one master status sarana prasarana id",
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
                  status_sarana_prasarana: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.status_sarana_prasarana.findone(id);

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
    "/findone-by-jenis-kejadian/:status_sarana_prasarana",
    {
      schema: {
        description: "This is an endpoint for fetching a master status sarana prasarana",
        tags: ["master status sarana prasarana"],
        params: {
          description: "Find one master status sarana prasarana by status sarana prasarana",
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
    async (request, reply) => {
      const { status_sarana_prasarana } = request.params;
      const exec = await fastify.status_sarana_prasarana.findone_by_status_sarana_prasarana(status_sarana_prasarana);

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
        description: "This is an endpoint for creating a master status sarana prasarana",
        tags: ["master status sarana prasarana"],
        body: {
          description: "Payload for creating a master status sarana prasarana",
          type: "object",
          properties: {
            status_sarana_prasarana: { type: "string" },
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
      const {status_sarana_prasarana,created_by} = request.body;

      try {
        await fastify.status_sarana_prasarana.create(status_sarana_prasarana,created_by);
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
        description: "This is an endpoint for updating an existing master status sarana prasarana",
        tags: ["master status sarana prasarana"],
        params: {
          description: "update master status sarana prasarana by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master status sarana prasarana",
          type: "object",
          properties: {
            status_sarana_prasarana: { type: "string" },
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
      const {status_sarana_prasarana, updated_by } = request.body;

      try {
        await fastify.status_sarana_prasarana.update(id,status_sarana_prasarana,updated_by);
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
        description: "This is an endpoint for DELETING an existing master status sarana prasarana.",
        tags: ["master status sarana prasarana"],
        params: {
          description: "master status sarana prasarana by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master status sarana prasarana",
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
        await fastify.status_sarana_prasarana.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master status sarana prasarana",
        tags: ["master status sarana prasarana"],
        params: {
          description: "Filter master status sarana prasarana by search",
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
      const { q } = request.params;
      const exec = await fastify.status_sarana_prasarana.filter(q);

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
