const sample_crud = require("../../services/sample_crud");

module.exports = async function (fastify, opts) {
  fastify.register(sample_crud);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "This is an endpoint for fetching all sample crud",
        tags: ["sample crud"],
        response: {
          200: {
            description: "Success Response",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: { type: "number" },
                kode: { type: "string" },
                area_dampak_risiko_spbe: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sample_crud.find();
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sample crud by id",
        tags: ["sample crud"],
        params: {
          description: "Find one sample crud by Id",
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
              id: { type: "number" },
              kode: { type: "string" },
              area_dampak_risiko_spbe: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.sample_crud.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "This is an endpoint for creating a sample crud",
        tags: ["sample crud"],
        body: {
          description: "Payload for creating a sample crud",
          type: "object",
          properties: {
            area_dampak_risiko_spbe: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              kode: { type: "string" },
              area_dampak_risiko_spbe: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { area_dampak_risiko_spbe } = request.body;
      const exec = await fastify.sample_crud.create(
        area_dampak_risiko_spbe
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating an existing sample crud",
        tags: ["sample crud"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a sample crud",
          type: "object",
          properties: {
            area_dampak_risiko_spbe: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              kode: { type: "string" },
              area_dampak_risiko_spbe: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { area_dampak_risiko_spbe } = request.body;

      const exec = await fastify.sample_crud.update(
        id,
        area_dampak_risiko_spbe
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing sample crud.",
        tags: ["sample crud"],
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
      await fastify.sample_crud.del(id);

      reply.status(204);
    }
  );
};
