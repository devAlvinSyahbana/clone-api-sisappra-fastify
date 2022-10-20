const master_jabatan = require("../../../services/master/master_jabatan");

module.exports = async function (fastify, opts) {
  fastify.register(master_jabatan);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all master jabatan",
        tags: ["master jabatan"],
        querystring: {
          type: "object",
          properties: {
            limit: {
              type: "integer",
              default: 10,
            },
            offset: {
              type: "integer",
              default: 1,
            },
            nama: {
              type: "string",
            },
            kode: {
              type: "string",
            },
          },
          required: ["limit", "offset"],
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
                    jabatan: { type: "string" },
                    kode: { type: "string" },
                    status: { type: "string" },
                    id_master_tempat_seksi_pelaksanaan: { type: "number" },
                    level: { type: "string" },
                  },
                },
              },
              total_data: {
                type: "number",
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
          if (key !== "limit" && key !== "offset") {
            qwhere += ` AND ${key} LIKE '%${params[key]}%'`;
          }
        });
      }
      const exec = await fastify.master_jabatan.find(
        params.limit,
        params.offset,
        qwhere
      );

      const { total_data } = await fastify.master_jabatan.countAll(qwhere);

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec,
            total_data: total_data,
          });
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
        description: "This is an endpoint for fetching a master jabatan",
        tags: ["master jabatan"],
        params: {
          description: "Find one master jabatan id",
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
                  jabatan: { type: "string" },
                  kode: { type: "string" },
                  status: { type: "string" },
                  id_master_tempat_seksi_pelaksanaan: { type: "number" },
                  level: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.master_jabatan.findone(id);

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
    "/findone-by-jabatan/:jabatan",
    {
      schema: {
        description: "This is an endpoint for fetching a master jabatan",
        tags: ["master jabatan"],
        params: {
          description: "Find one master jabatan by jabatan",
          type: "object",
          properties: {
            jabatan: { type: "string" },
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
                  jabatan: { type: "string" },
                  kode: { type: "string" },
                  status: { type: "string" },
                  id_master_tempat_seksi_pelaksanaan: { type: "number" },
                  level: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jabatan } = request.params;
      const exec = await fastify.master_jabatan.findone_by_jabatan(jabatan);

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
        description: "This is an endpoint for creating a master jabatan",
        tags: ["master jabatan"],
        body: {
          description: "Payload for creating a master jabatan",
          type: "object",
          properties: {
            nama: { type: "string" },
            status: { type: "string" },
            level: { type: "string" },
            id_master_tempat_seksi_pelaksanaan: { type: "number" },
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
      const {
        nama,
        status,
        level,
        id_master_tempat_seksi_pelaksanaan,
        created_by,
      } = request.body;

      try {
        await fastify.master_jabatan.create(
          nama,
          status,
          level,
          id_master_tempat_seksi_pelaksanaan,
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
          "This is an endpoint for updating an existing master jabatan",
        tags: ["master jabatan"],
        params: {
          description: "update master jabatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a master jabatan",
          type: "object",
          properties: {
            nama: { type: "string" },
            status: { type: "string" },
            level: { type: "string" },
            id_master_tempat_seksi_pelaksanaan: { type: "number" },
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
      const {
        nama,
        status,
        level,
        id_master_tempat_seksi_pelaksanaan,
        updated_by,
      } = request.body;
      let val = "";
      if (nama && nama !== "") {
        val += ` nama = '${nama}',`;
      }
      if (status && status !== "") {
        val += ` status = '${status}',`;
      }
      if (level && level !== "") {
        val += ` level = '${level}',`;
      }
      if (id_master_tempat_seksi_pelaksanaan) {
        val += ` id_master_tempat_seksi_pelaksanaan = ${id_master_tempat_seksi_pelaksanaan},`;
      }
      if (updated_by) {
        val += ` updated_by = '${updated_by}',`;
      }
      try {
        await fastify.master_jabatan.update(id, val);
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
          "This is an endpoint for DELETING an existing master jabatan.",
        tags: ["master jabatan"],
        params: {
          description: "master jabatan by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data master jabatan",
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
        await fastify.master_jabatan.del(id, deleted_by);
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
        description: "This is an endpoint for filtering a master jabatan",
        tags: ["master jabatan"],
        params: {
          description: "Filter master jabatan by search",
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
                    jabatan: { type: "string" },
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
      const exec = await fastify.master_jabatan.filter(q);

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
