const struktur_data_hirarki = require("../../../services/master/struktur_data_hirarki");
const struktur_data_hirarki1 = require("../../../services/master/struktur_data_hirarki1");

module.exports = async function (fastify, opts) {
  fastify.register(struktur_data_hirarki);
  fastify.register(struktur_data_hirarki1);

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

  // ─── Hirarki 1 ───────────────────────────────────────────────────────
  fastify.get(
    "/find/hirarki", {
      schema: {
        description: "This is an endpoint for fetching all struktur data hirarki",
        tags: ["struktur data hirarki1"],
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
                    parentid: {
                      type: "number"
                    },
                    name: {
                      type: "string"
                    },
                    positionname: {
                      type: "string"
                    },
                    phone: {
                      type: "string"
                    },
                    email: {
                      type: "string"
                    },
                    team: {
                      type: "string"
                    },
                    location: {
                      type: "string"
                    },
                    department: {
                      type: "string"
                    },
                    description: {
                      type: "string"
                    },
                    imageurl: {
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
      const exec = await fastify.struktur_data_hirarki1.find();

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
    "/findone/hirarki/:id", {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        params: {
          description: "Find one struktur data hirarki1 by id",
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
                  parentid: {
                    type: "number"
                  },
                  name: {
                    type: "string"
                  },
                  positionname: {
                    type: "string"
                  },
                  phone: {
                    type: "string"
                  },
                  email: {
                    type: "string"
                  },
                  team: {
                    type: "string"
                  },
                  location: {
                    type: "string"
                  },
                  department: {
                    type: "string"
                  },
                  description: {
                    type: "string"
                  },
                  imageurl: {
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
      const exec = await fastify.struktur_data_hirarki1.findone(id);

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
    "/find-by-parent-id/hirarki/:parentid", {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        params: {
          description: "Find struktur data hirarki1 by parent id",
          type: "object",
          properties: {
            parentid: {
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
                    parentid: {
                      type: "number"
                    },
                    name: {
                      type: "string"
                    },
                    positionname: {
                      type: "string"
                    },
                    phone: {
                      type: "string"
                    },
                    email: {
                      type: "string"
                    },
                    team: {
                      type: "string"
                    },
                    location: {
                      type: "string"
                    },
                    department: {
                      type: "string"
                    },
                    description: {
                      type: "string"
                    },
                    imageurl: {
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
        parentid
      } = request.params;
      const exec = await fastify.struktur_data_hirarki1.find_by_parentId(parentid);
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
    "/create/hirarki", {
      schema: {
        description: "This is an endpoint for creating a struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        body: {
          description: "Payload for creating a struktur data hirarki1",
          type: "object",
          properties: {
            parentid: {
              type: "number"
            },
            name: {
              type: "string"
            },
            positionname: {
              type: "string"
            },
            phone: {
              type: "string"
            },
            email: {
              type: "string"
            },
            team: {
              type: "string"
            },
            location: {
              type: "string"
            },
            department: {
              type: "string"
            },
            description: {
              type: "string"
            },
            imageurl: {
              type: "string"
            },
            created_by: {
              type: "string"
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
        parentid,
        name,
        positionName,
        phone,
        email,
        team,
        location,
        department,
        description,
        imageurl,
        created_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki1.create(parentid, name, positionName, phone, email, team, location, department, description, imageurl, created_by);
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
    "/update/hirarki/:id", {
      schema: {
        description: "This is an endpoint for updating an existing struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        params: {
          description: "update struktur data hirarki1 by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for updating a struktur data hirarki1",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
            parentid: {
              type: "number"
            },
            name: {
              type: "string"
            },
            positionname: {
              type: "string"
            },
            phone: {
              type: "string"
            },
            email: {
              type: "string"
            },
            team: {
              type: "string"
            },
            location: {
              type: "string"
            },
            department: {
              type: "string"
            },
            description: {
              type: "string"
            },
            imageurl: {
              type: "string"
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
        parentid,
        name,
        positionName,
        phone,
        email,
        team,
        location,
        department,
        description,
        imageurl,
        updated_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki1.update(id, parentid, name, positionName, phone, email, team, location, department, description, imageurl, updated_by);
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
    "/delete/hirarki/:id", {
      schema: {
        description: "This is an endpoint for DELETING an existing struktur data hirarki1.",
        tags: ["struktur data hirarki1"],
        params: {
          description: "struktur data hirarki1 by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for deleted data struktur data hirarki1",
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
        await fastify.struktur_data_hirarki1.del(id, deleted_by);
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