const struktur_data_hirarki = require("../../../services/master/struktur_data_hirarki");

module.exports = async function (fastify, opts) {
  fastify.register(struktur_data_hirarki);

  fastify.get(
    "/find", {
      schema: {
        description: "This is an endpoint for fetching all struktur data hirarki",
        tags: ["struktur data hirarki"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number"
                    },
                    parent_id: {
                      type: "number"
                    },
                    nama: {
                      type: "string"
                    },
                    jabatan: {
                      type: "number"
                    },
                    tim: {
                      type: "string"
                    },
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
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.get(
    "/findone/:id", {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "Find one struktur data hirarki by id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "object",
                properties: {
                  id: {
                    type: "number"
                  },
                  parent_id: {
                    type: "number"
                  },
                  nama: {
                    type: "string"
                  },
                  jabatan: {
                    type: "number"
                  },
                  tim: {
                    type: "string"
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      const exec = await fastify.struktur_data_hirarki.findone(id);

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500
        });
      }
    }
  );

  fastify.get(
    "/find-by-parent-id/:parent_id", {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "Find struktur data hirarki by parent id",
          type: "object",
          properties: {
            parent_id: {
              type: "number"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number"
                    },
                    parent_id: {
                      type: "number"
                    },
                    nama: {
                      type: "string"
                    },
                    jabatan: {
                      type: "number"
                    },
                    tim: {
                      type: "string"
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        parent_id
      } = request.params;
      const exec = await fastify.struktur_data_hirarki.find_by_parent_id(parent_id);
      console.log(exec)
      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500
        });
      }
    }
  );

  fastify.post(
    "/create", {
      schema: {
        description: "This is an endpoint for creating a struktur data hirarki",
        tags: ["struktur data hirarki"],
        body: {
          description: "Payload for creating a struktur data hirarki",
          type: "object",
          properties: {
            parent_id: {
              type: "number"
            },
            nama: {
              type: "string"
            },
            jabatan: {
              type: "number"
            },
            tim: {
              type: "string"
            },
            created_by: {
              type: "number"
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        parent_id,
        nama,
        jabatan,
        tim,
        created_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki.create(parent_id, nama, jabatan, tim, created_by);
        reply.send({
          message: "success",
          code: 200
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.put(
    "/update/:id", {
      schema: {
        description: "This is an endpoint for updating an existing struktur data hirarki",
        tags: ["struktur data hirarki"],
        params: {
          description: "update struktur data hirarki by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for updating a struktur data hirarki",
          type: "object",
          properties: {
            parent_id: {
              type: "number"
            },
            nama: {
              type: "string"
            },
            jabatan: {
              type: "number"
            },
            tim: {
              type: "string"
            },
            updated_by: {
              type: "number"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      const {
        parent_id,
        nama,
        jabatan,
        tim,
        updated_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki.update(id, parent_id, nama, jabatan, tim, updated_by);
        reply.send({
          message: "success",
          code: 200
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.delete(
    "/delete/:id", {
      schema: {
        description: "This is an endpoint for DELETING an existing struktur data hirarki.",
        tags: ["struktur data hirarki"],
        params: {
          description: "struktur data hirarki by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for deleted data struktur data hirarki",
          type: "object",
          properties: {
            deleted_by: {
              type: "number"
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      const {
        deleted_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki.del(id, deleted_by);
        reply.send({
          message: "success",
          code: 204
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );
};