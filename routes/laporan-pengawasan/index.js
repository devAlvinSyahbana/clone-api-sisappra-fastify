const laporan_pengawasan = require("../../services/laporan_pengawasan");

module.exports = async function (fastify, opts) {
  fastify.register(laporan_pengawasan);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "API untuk mengambil seluruh Laporan pengawasan",
        tags: ["laporan pengawasan"],
        response: {
          200: {
            description: "Berhasil Bro!",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: { type: "number" },
                tanggal_pelaporan: { type: "string" },
                id_kota: { type: "string" },
                id_kecamatan: { type: "string" },
                id_kelurahan: { type: "string" },
                deskripsi: { type: "string" },
                id_jenis_pengawasan: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_pengawasan.find();
      console.log("string", exec)
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "API untuk mengambil Laporan pengawasan berdasarkan id",
        tags: ["laporan pengawasan"],
        params: {
          description: "laporan pengawasan dari Id",
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
              tanggal_pelaporan: { type: "string" },
              id_kota: { type: "string" },
              id_kecamatan: { type: "string" },
              id_kelurahan: { type: "string" },
              deskripsi: { type: "string" },
              id_jenis_pengawasan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_pengawasan.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "API membuat laporan pengawasan",
        tags: ["laporan pengawasan"],
        body: {
          description: "Payload for creating a laporan pengawasan",
          type: "object",
          properties: {
            tanggal_pelaporan: { type: "string" },
            id_kota: { type: "string" },
            id_kecamatan: { type: "string" },
            id_kelurahan: { type: "string" },
            deskripsi: { type: "string" },
            id_jenis_pengawasan: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              tanggal_pelaporan: { type: "string" },
              id_kota: { type: "string" },
              id_kecamatan: { type: "string" },
              id_kelurahan: { type: "string" },
              deskripsi: { type: "string" },
              id_jenis_pengawasan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan } = request.body;
      const exec = await fastify.laporan_pengawasan.create(
        tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "API mengubah laporan pengawasan",
        tags: ["laporan pengawasan"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a laporan pengawasan",
          type: "object",
          properties: {
            tanggal_pelaporan: { type: "string" },
            id_kota: { type: "string" },
            id_kecamatan: { type: "string" },
            id_kelurahan: { type: "string" },
            deskripsi: { type: "string" },
            id_jenis_pengawasan: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              tanggal_pelaporan: { type: "string" },
              id_kota: { type: "string" },
              id_kecamatan: { type: "string" },
              id_kelurahan: { type: "string" },
              deskripsi: { type: "string" },
              id_jenis_pengawasan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan } = request.body;
      const exec = await fastify.laporan_pengawasan.update(
        id, tanggal_pelaporan, id_kota, id_kecamatan, id_kelurahan, deskripsi, id_jenis_pengawasan
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing laporan pengawasan .",
        tags: ["laporan pengawasan"],
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
      await fastify.laporan_pengawasan.del(id);

      reply.status(204);
    }
  );
};
