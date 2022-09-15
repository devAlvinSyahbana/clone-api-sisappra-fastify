const master_jenis_korban_material  = require("../../../services/master/master_jenis_korban_material");

module.exports = async function (fastify, opts) {
  fastify.register(master_jenis_korban_material);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jenis korban material",
        tags: ["master jenis korban material"],
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
                    jenis_korban_material: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_jenis_korban_material.find();

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
        description: "This is an endpoint for fetching a master jenis korban material",
        tags: ["master jenis korban material"],
        params: {
          description: "Find one master jenis korban material id",
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
                  jenis_korban_material: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_jenis_korban_material.findone(id);

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
    "/findone-by-jenis-korban-material/:jenis_korban_material",
    {
      schema: {
        description: "This is an endpoint for fetching a master jenis korban material",
        tags: ["master jenis korban material"],
        params: {
          description: "Find one master jenis korban material by jenis korban material",
          type: "object",
          properties: {
            jenis_korban_material: { type: "string" },
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
                  jenis_korban_material: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_korban_material } = request.params;
      const exec = await fastify.master_jenis_korban_material.findone_by_jenis_korban_material(jenis_korban_material);

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
        description: "This is an endpoint for creating a master jenis korban material",
        tags: ["master jenis korban material"],
        body: {
          description: "Payload for creating a master jenis korban material",
          type: "object",
          properties: {
            jenis_korban_material: { type: "string" },
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
      const {jenis_korban_material,created_by} = request.body;

      try {
        await fastify.master_jenis_korban_material.create(jenis_korban_material,created_by);
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
        description: "This is an endpoint for updating an existing master jenis korban material",
        tags: ["master jenis korban material"],
        params: {
          description: "update master jenis korban material by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jenis korban material",
          type: "object",
          properties: {
            jenis_korban_material: { type: "string" },
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
      const {jenis_korban_material, updated_by } = request.body;

      try {
        await fastify.master_jenis_korban_material.update(id,jenis_korban_material,updated_by);
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
        description: "This is an endpoint for DELETING an existing master jenis korban material.",
        tags: ["master jenis korban material"],
        params: {
          description: "master jenis korban material by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jenis korban material",
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
        await fastify.master_jenis_korban_material.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

};
