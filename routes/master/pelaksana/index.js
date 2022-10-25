const master_tempat_seksi_pelaksanaan = require("../../../services/master/master_tempat_seksi_pelaksanaan");

module.exports = async function (fastify, opts) {
  fastify.register(master_tempat_seksi_pelaksanaan);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master pelaksana",
        tags: ["master pelaksana"],
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
                    nama: { type: "string" },
                    kode: { type: "string" },
                    group: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.master_tempat_seksi_pelaksanaan.find();

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
        description: "This is an endpoint for fetching a master pelaksana",
        tags: ["master pelaksana"],
        params: {
          description: "Find one master pelaksana id",
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
                  nama: { type: "string" },
                  kode: { type: "string" },
                  id_tempat_pelaksanaan: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_tempat_seksi_pelaksanaan.findone(id);

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
        description: "This is an endpoint for creating a master pelaksana",
        tags: ["master pelaksana"],
        body: {
          description: "Payload for creating a master pelaksana",
          type: "object",
          properties: {
            name: { type: "string" },
            id_tempat_pelaksanaan: { type: "number" },
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
      const { name, id_tempat_pelaksanaan, created_by } = request.body;

      try {
        await fastify.master_tempat_seksi_pelaksanaan.create(
          name,
          id_tempat_pelaksanaan,
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
          "This is an endpoint for updating an existing master pelaksana",
        tags: ["master pelaksana"],
        params: {
          description: "update master pelaksana by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master pelaksana",
          type: "object",
          properties: {
            name: { type: "string" },
            id_tempat_pelaksanaan: { type: "number" },
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
      const { name, id_tempat_pelaksanaan, updated_by } = request.body;

      try {
        await fastify.master_tempat_seksi_pelaksanaan.update(
          id,
          name,
          updated_by,
          id_tempat_pelaksanaan
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
          "This is an endpoint for DELETING an existing master pelaksana.",
        tags: ["master pelaksana"],
        params: {
          description: "master pelaksana by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master pelaksana",
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
        await fastify.master_tempat_seksi_pelaksanaan.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/filter",
    {
      schema: {
        description: "This is an endpoint for filtering a master pelaksana",
        tags: ["master pelaksana"],
        querystring: {
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            id_tempat_pelaksanaan: {
              type: "number",
            },
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
                    nama: { type: "string" },
                    kode: { type: "string" },
                    id_tempat_pelaksanaan: { type: "number" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const params = request.query;
      let qwhere = "";
      if (params) {
        Object.keys(params).forEach(function (key) {
          if (key == "id_tempat_pelaksanaan") {
            qwhere += ` AND ${key} = ${params[key]}`;
          } else {
            qwhere += ` AND ${key} ILIKE '%${params[key]}%'`;
          }
        });
      }
      const exec = await fastify.master_tempat_seksi_pelaksanaan.filter(qwhere);

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
