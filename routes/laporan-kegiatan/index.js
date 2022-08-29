const laporan_kegiatan = require("../../services/laporan_kegiatan");

module.exports = async function (fastify, opts) {
  fastify.register(laporan_kegiatan);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "API untuk mengambil seluruh Laporan Kegiatan",
        tags: ["laporan kegiatan"],
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
                kegiatan: { type: "string" },
                tanggal: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_kegiatan.find();
      console.log("string",exec)
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "API untuk mengambil Laporan Kegiatan berdasarkan id",
        tags: ["laporan kegiatan"],
        params: {
          description: "laporan kegiatan dari Id",
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
              kegiatan: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_kegiatan.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "API membuat laporan kegiatan",
        tags: ["laporan kegiatan"],
        body: {
          description: "Payload for creating a laporan kegiatan",
          type: "object",
          properties: {
            id_kota: { type: "string" },
            id_kelurahan: { type: "string" },
            id_kecamatan: { type: "string" },
            kegiatan: { type: "string" },
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
              kegiatan: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal } = request.body;
      const exec = await fastify.laporan_kegiatan.create(
        id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "API mengubah laporan kegiatan",
        tags: ["laporan kegiatan"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a laporan kegiatan",
          type: "object",
          properties: {
            id_kota: { type: "string" },
            id_kelurahan: { type: "string" },
            id_kecamatan: { type: "string" },
            kegiatan: { type: "string" },
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
              kegiatan: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal } = request.body;
      const exec = await fastify.laporan_kegiatan.update(
        id, id_kota, id_kelurahan, id_kecamatan, kegiatan, tanggal
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing laporan kegiatan.",
        tags: ["laporan kegiatan"],
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
      await fastify.laporan_kegiatan.del(id);

      reply.status(204);
    }
  );
};
