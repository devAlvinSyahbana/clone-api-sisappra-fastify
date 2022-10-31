const master_eselon = require("../../../services/master/master_eselon");

module.exports = async function (fastify, opts) {
  fastify.register(master_eselon);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master eselon",
        tags: ["master eselon"],
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
                    eselon: { type: "string" },
                    urutan_tingkat_eselon: { type: "number" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_eselon.find();

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
        description: "This is an endpoint for fetching a master eselon",
        tags: ["master eselon"],
        params: {
          description: "Find one master eselon id",
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
                  eselon: { type: "string" },
                  urutan_tingkat_eselon: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_eselon.findone(id);

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
    "/findone-by-eselon/:eselon",
    {
      schema: {
        description: "This is an endpoint for fetching a master eselon",
        tags: ["master eselon"],
        params: {
          description: "Find one master eselon by eselon",
          type: "object",
          properties: {
            eselon: { type: "string" },
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
                    eselon: { type: "string" },
                    urutan_tingkat_eselon: { type: "number" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { eselon } = request.params;
      const exec = await fastify.master_eselon.findone_by_eselon(eselon);

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
        description: "This is an endpoint for creating a master eselon",
        tags: ["master eselon"],
        body: {
          description: "Payload for creating a master eselon",
          type: "object",
          properties: {
            eselon: { type: "string" },
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
      const { eselon, urutan_tingkat_eselon, created_by } = request.body;

      try {
        await fastify.master_eselon.create(
          eselon,
          urutan_tingkat_eselon,
          created_by
        );
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
          "This is an endpoint for updating an existing master eselon",
        tags: ["master eselon"],
        params: {
          description: "update master eselon by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master eselon",
          type: "object",
          properties: {
            eselon: { type: "string" },
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
      const { eselon, urutan_tingkat_eselon, updated_by } = request.body;

      try {
        await fastify.master_eselon.update(
          id,
          eselon,
          urutan_tingkat_eselon,
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
          "This is an endpoint for DELETING an existing master eselon.",
        tags: ["master eselon"],
        params: {
          description: "master eselon by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master eselon",
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
        await fastify.master_eselon.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master eselon",
        tags: ["master eselon"],
        params: {
          description: "Filter master eselon by search",
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
                    eselon: { type: "string" },
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
      const exec = await fastify.master_eselon.filter(q);

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
