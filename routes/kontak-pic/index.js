const kontak_pic = require("../../services/kontak_pic");


module.exports = async function (fastify, opts) {
  fastify.register(kontak_pic);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "This is an endpoint for fetching all kontak pic",
        tags: ["kontak pic"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data:{
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    nama: { type: "string" },
                    telepon: { type: "string" },
                    status_pic: { type: "number" },
                  },
                }
              }
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.kontak_pic.find();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        }else{
          reply.send({ message: "success", code: 204});
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
        description: "This is an endpoint for fetching a kontak pic by id",
        tags: ["kontak pic"],
        params: {
          description: "Find one kontak pic by id",
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
                  telepon: { type: "string" },
                  status_pic: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.kontak_pic.findone(id);

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500});
      }
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description: "This is an endpoint for creating a kontak pic",
        tags: ["kontak pic"],
        body: {
          description: "Payload for creating a kontak pic",
          type: "object",
          properties: {
            nama: { type: "string" },
            telepon: { type: "string" },
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
      const { nama, telepon, created_by } = request.body;

      try {
        await fastify.kontak_pic.create(
            nama,
            telepon, 
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
          "This is an endpoint for updating an existing kontak pic",
        tags: ["kontak pic"],
        params: {
          description: "update kontak pic by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a kontak pic",
          type: "object",
          properties: {
            nama: { type: "string" },
            telepon: { type: "string" },
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
      const { nama,telepon, updated_by } = request.body;

      try {
        await fastify.kontak_pic.update(
          id,
          nama,
          telepon, 
        
          updated_by
        );
  
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update-pic/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating pic an existing kontak pic",
        tags: ["kontak pic"],
        params: {
          description: "update pic kontak pic by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating pic a kontak pic",
          type: "object",
          properties: {
            status_pic: { type: "number" },
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
      const { status_pic, updated_by } = request.body;
      try {
        await fastify.kontak_pic.update_pic(
          id,
          status_pic,
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
          "This is an endpoint for DELETING an existing kontak pic.",
        tags: ["kontak pic"],
        params: {
          description: "kontak pic by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data kontak pic",
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
        await fastify.kontak_pic.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
