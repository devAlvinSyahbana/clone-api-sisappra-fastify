const laporan_kejadian = require("../../services/laporan_kejadian");

module.exports = async function (fastify, opts) {
  fastify.register(laporan_kejadian);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "API untuk mengambil seluruh Laporan kejadian",
        tags: ["laporan kejadian"],
        response: {
          200: {
            description: "Berhasil Bro!",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: { type: "number" },
                id_kota: { type: "string" },
                id_kelurahan: { type: "string" },
                id_kecamatan: { type: "string" },
                kejadian: { type: "string" },
                tanggal: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_kejadian.find();
      console.log("string",exec)
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "API untuk mengambil Laporan kejadian berdasarkan id",
        tags: ["laporan kejadian"],
        params: {
          description: "laporan kejadian dari Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          200: {
            description: "Berhasil Bro!",
            type: "object",
            properties: {
              id: { type: "number" },
              id_kota: { type: "string" },
              id_kelurahan: { type: "string" },
              id_kecamatan: { type: "string" },
              kejadian: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_kejadian.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "API membuat laporan kejadian",
        tags: ["laporan kejadian"],
        body: {
          description: "Payload for creating a laporan kejadian",
          type: "object",
          properties: {
            id_kota: { type: "string" },
            id_kelurahan: { type: "string" },
            id_kecamatan: { type: "string" },
            kejadian: { type: "string" },
            tanggal: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              id_kota: { type: "string" },
              id_kelurahan: { type: "string" },
              id_kecamatan: { type: "string" },
              kejadian: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal } = request.body;
      const exec = await fastify.laporan_kejadian.create(
        id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "API mengubah laporan kejadian",
        tags: ["laporan kejadian"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a laporan kejadian",
          type: "object",
          properties: {
            id_kota: { type: "string" },
            id_kelurahan: { type: "string" },
            id_kecamatan: { type: "string" },
            kejadian: { type: "string" },
            tanggal: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              id_kota: { type: "string" },
              id_kelurahan: { type: "string" },
              id_kecamatan: { type: "string" },
              kejadian: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal } = request.body;
      const exec = await fastify.laporan_kejadian.update(
        id, id_kota, id_kelurahan, id_kecamatan, kejadian, tanggal
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing laporan kejadian.",
        tags: ["laporan kejadian"],
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
      await fastify.laporan_kejadian.del(id);

      reply.status(204);
    }
  );
};
