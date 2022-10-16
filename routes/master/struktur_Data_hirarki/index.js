const struktur_data_hirarki  = require("../../../services/master/struktur_data_hirarki");

module.exports = async function (fastify, opts) {
  fastify.register(struktur_data_hirarki);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all struktur data hirarki",
        tags: ["struktur data hirarki"],
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
                    level: { type: "string" },
                    sub_level: { type: "string" },
                    id_relasi_hirarki: { type: "number" },
                    kategori: { type: "number" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.struktur_data_hirarki.find();

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
        description: "This is an endpoint for fetching a struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "Find one struktur data hirarki by id",
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
                  level: { type: "string" },
                  sub_level: { type: "string" },
                  id_relasi_hirarki: { type: "number" },
                  kategori: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.struktur_data_hirarki.findone(id);

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
    "/findone-by-sub-level/:sub_level",
    {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "Find one struktur data hirarki by sub_level",
          type: "object",
          properties: {
            sub_level: { type: "string" },
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
                  level: { type: "string" },
                  sub_level: { type: "string" },
                  id_relasi_hirarki: { type: "number" },
                  kategori: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { sub_level } = request.params;
      const exec = await fastify.struktur_data_hirarki.findone_by_sub_level(sub_level);

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
        description: "This is an endpoint for creating a struktur data hirarki",
        tags: ["struktur data hirarki"],
        body: {
          description: "Payload for creating a struktur data hirarki",
          type: "object",
          properties: {
            level: { type: "string" },
            sub_level: { type: "string" },
            id_relasi_hirarki: { type: "number" },
            kategori: { type: "number" },
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
      const {level, sub_level, id_relasi_hirarki, kategori, created_by} = request.body;

      try {
        await fastify.struktur_data_hirarki.create(level, sub_level, id_relasi_hirarki, kategori, created_by);
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
        description: "This is an endpoint for updating an existing struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "update struktur data hirarki by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a struktur data hirarki",
          type: "object",
          properties: {
            level: { type: "string" },
            sub_level: { type: "string" },
            id_relasi_hirarki: { type: "number" },
            kategori: { type: "number" },
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
      const {level, sub_level, id_relasi_hirarki, kategori, updated_by } = request.body;

      try {
        await fastify.struktur_data_hirarki.update(id,level, sub_level, id_relasi_hirarki, kategori,updated_by);
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
        description: "This is an endpoint for DELETING an existing struktur data hirarki.",
        tags: ["struktur data hirarki"],
        params: {
          description: "struktur data hirarki by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data struktur data hirarki",
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
        await fastify.struktur_data_hirarki.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
