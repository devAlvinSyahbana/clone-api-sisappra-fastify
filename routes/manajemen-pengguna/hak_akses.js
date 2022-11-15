const hak_akses = require("../../services/manajemen-pengguna/hak_akses");

module.exports = async function (fastify, opts) {
  fastify.register(hak_akses);

  fastify.get(
    "/hak-akses/find",
    {
      schema: {
        description: "This is an endpoint for fetching all hak akses",
        tags: ["hak akses"],
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
                    nama_hak_akses: { type: "string" },
                    kode: { type: "string" },
                    nama_permission: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.hak_akses.find();

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
    "/hak-akses/findone/:id",
    {
      schema: {
        description: "This is an endpoint for fetching a hak akses",
        tags: ["hak akses"],
        params: {
          description: "Find one hak akses id",
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
                  nama_hak_akses: { type: "string" },
                  kode: { type: "string" },
                  nama_permission: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.hak_akses.findone(id);

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
    "/hak-akses/findone-by-nama-hak-akses/:nama_hak_akses",
    {
      schema: {
        description: "This is an endpoint for fetching a hak akses",
        tags: ["hak akses"],
        params: {
          description: "Find one hak akses by nama_hak_akses",
          type: "object",
          properties: {
            nama_hak_akses: { type: "string" },
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
                  nama_hak_akses: { type: "string" },
                  kode: { type: "string" },
                  nama_permission: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { nama_hak_akses } = request.params;
      const exec = await fastify.hak_akses.findone_by_nama_hak_akses(nama_hak_akses);

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
    "/hak-akses/findone-by-kode/:kode",
    {
      schema: {
        description: "This is an endpoint for fetching a hak akses",
        tags: ["hak akses"],
        params: {
          description: "Find one hak akses by kode",
          type: "object",
          properties: {
            kode: { type: "string" },
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
                  nama_hak_akses: { type: "string" },
                  kode: { type: "string" },
                  nama_permission: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kode } = request.params;
      const exec = await fastify.hak_akses.findone_by_kode(kode);

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
    "/hak-akses/create",
    {
      schema: {
        description: "This is an endpoint for creating a hak akses",
        tags: ["hak akses"],
        body: {
          description: "Payload for creating a hak akses",
          type: "object",
          properties: {
            nama_hak_akses: { type: "string" },
            created_by: { type: "number" },
            id_modul_permission: { type: "number" },
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
      const { nama_hak_akses, id_modul_permission, created_by } = request.body;

      try {
        await fastify.hak_akses.create(nama_hak_akses, id_modul_permission, created_by);
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/hak-akses/update/:id",
    {
      schema: {
        description: "This is an endpoint for updating an existing hak akses",
        tags: ["hak akses"],
        params: {
          description: "update hak akses by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a hak akses",
          type: "object",
          properties: {
            nama_hak_akses: { type: "string" },
            id_modul_permission: { type: "number" },
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
      const { nama_hak_akses, id_modul_permission, updated_by } = request.body;

      try {
        await fastify.hak_akses.update(id, nama_hak_akses, id_modul_permission, updated_by);
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.delete(
    "/hak-akses/delete/:id",
    {
      schema: {
        description: "This is an endpoint for DELETING an existing hak akses.",
        tags: ["hak akses"],
        params: {
          description: "hak akses by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data hak akses",
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
        await fastify.hak_akses.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/hak-akses/filter-nama_hak_akses/:q",
    {
      schema: {
        description: "This is an endpoint for filtering a hak akses",
        tags: ["hak akses"],
        params: {
          description: "Filter hak akses by search",
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
                    nama_hak_akses: { type: "string" },
                    kode: { type: "string" },
                    nama_permission: { type: "string" },
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
      const exec = await fastify.hak_akses.filter(q);

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

  // get count data by id
  fastify.get(
    "/hak-akses/count-total-data", {
    schema: {
      description: "Endpoint ini digunakan untuk mengambil jumlah total data hak akses",
      tags: ["hak akses"],
      querystring: {
        type: "object",
        properties: {
          id_hak_akses: {
            type: "number",
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
                total_data: {
                  type: "number"
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
        id_hak_akses
      } = request.query;
      let qwhere = "";
      if (id_hak_akses) {
        qwhere += ` AND hak_akses = ${id_hak_akses}`;
      }
      const {
        total
      } = await fastify.hak_akses.countAllPenggunaByFilter(
        qwhere
      );

      try {
        reply.send({
          message: "success",
          code: 200,
          data: { total_data: total },
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  )

};
