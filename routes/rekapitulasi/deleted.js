const kepegawaian_pns = require("../../services/rekapitulasi/deleted");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing Rekapitulasi Pejabat Struktural.",
        tags: ["endpoint rekapitulasi pejabat struktural"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          204: {
            type: "string",
            default: "No Content",
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      await fastify.kepegawaian_pns.del(id);

      reply.status(204);
    }
  );
};