const global = require("../../../services/master/global");

module.exports = async function (fastify, opts) {
  fastify.register(global);

  fastify.get(
    "/filter/:id/:q",
    {
      schema: {
        description:
          "This is an endpoint for filtering a master global kab kota",
        tags: ["master global"],
        params: {
          description: "Filter master global kab kota by search",
          type: "object",
          properties: {
            id: { type: "string" },
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
                    id: { type: "string" },
                    province_id: { type: "string" },
                    name: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { q, id } = request.params;
      const exec = await fastify.global.filterKabKot(id, q);

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
