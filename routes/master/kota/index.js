const master_jenis_perda_perkada  = require("../../../services/master/master_jenis_perda_perkada");

module.exports = async function (fastify, opts) {
  fastify.register(master_jenis_perda_perkada);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jenis perda perkada",
        tags: ["master jenis perda perkada"],
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
                    judul: { type: "string" },
                    deskripsi: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_jenis_perda_perkada.find();

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
        description: "This is an endpoint for fetching a master jenis perda perkada",
        tags: ["master jenis perda perkada"],
        params: {
          description: "Find one master jenis perda perkada id",
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
                  judul: { type: "string" },
                  deskripsi: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_jenis_perda_perkada.findone(id);

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
    "/findone-by-jenis-perda-perkada/:judul/:deskripsi",
    {
      schema: {
        description: "This is an endpoint for fetching a master jenis perda perkada",
        tags: ["master jenis perda perkada"],
        params: {
          description: "Find one master jenis perda perkada by judul and deskripsi",
          type: "object",
          properties: {
            judul: { type: "string" },
            deskripsi: { type: "string" },
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
                    judul: { type: "string" },
                    deskripsi: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { judul, deskripsi } = request.params;
      const exec = await fastify.master_jenis_perda_perkada.findone_by_jenis_perda_perkada(judul, deskripsi);

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
        description: "This is an endpoint for creating a master jenis perda perkada",
        tags: ["master jenis perda perkada"],
        body: {
          description: "Payload for creating a master jenis perda perkada",
          type: "object",
          properties: {
            judul: { type: "string" },
            deskripsi: { type: "string" },
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
      const {judul,deskripsi, created_by} = request.body;

      try {
        await fastify.master_jenis_perda_perkada.create(judul,deskripsi, created_by);
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
        description: "This is an endpoint for updating an existing master jenis perda perkada",
        tags: ["master jenis perda perkada"],
        params: {
          description: "update master jenis perda perkada by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jenis perda perkada",
          type: "object",
          properties: {
            judul: { type: "string" },
            deskripsi: { type: "string" },
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
      const {judul, deskripsi, updated_by } = request.body;

      try {
        await fastify.master_jenis_perda_perkada.update(id, judul, deskripsi, updated_by);
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
        description: "This is an endpoint for DELETING an existing master jenis perda perkada.",
        tags: ["master jenis perda perkada"],
        params: {
          description: "master jenis perda perkada by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jenis perda perkada",
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
        await fastify.master_jenis_perda_perkada.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};