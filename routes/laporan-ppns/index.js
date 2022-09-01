const laporan_ppns = require("../../services/laporan_ppns");

module.exports = async function (fastify, opts) {
  fastify.register(laporan_ppns);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "API untuk mengambil seluruh Laporan ppns",
        tags: ["laporan ppns"],
        response: {
          200: {
            description: "Berhasil Bro!",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: { type: "number" },
                id_nama: { type: "string" },
                nip: { type: "string" },
                golongan: { type: "string" },
                sekep_ppns: { type: "string" },
                tempat_tugas: { type: "string" },
                tahun_diklat: { type: "string" },
                keterangan: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_ppns.find();
      console.log("string", exec)
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "API untuk mengambil Laporan ppns berdasarkan id",
        tags: ["laporan ppns"],
        params: {
          description: "laporan ppns dari Id",
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
              id_nama: { type: "string" },
              nip: { type: "string" },
              golongan: { type: "string" },
              sekep_ppns: { type: "string" },
              tempat_tugas: { type: "string" },
              tahun_diklat: { type: "string" },
              keterangan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_ppns.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "API membuat laporan ppns",
        tags: ["laporan ppns"],
        body: {
          description: "Payload for creating a laporan ppns",
          type: "object",
          properties: {
            id_nama: { type: "string" },
            nip: { type: "string" },
            golongan: { type: "string" },
            sekep_ppns: { type: "string" },
            tempat_tugas: { type: "string" },
            tahun_diklat: { type: "string" },
            keterangan: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              id_nama: { type: "string" },
              nip: { type: "string" },
              golongan: { type: "string" },
              sekep_ppns: { type: "string" },
              tempat_tugas: { type: "string" },
              tahun_diklat: { type: "string" },
              keterangan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan } = request.body;
      const exec = await fastify.laporan_ppns.create(
        id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "API mengubah laporan ppns",
        tags: ["laporan ppns"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a laporan ppns",
          type: "object",
          properties: {
            id_kota: { type: "string" },
            id_kelurahan: { type: "string" },
            id_kecamatan: { type: "string" },
            ppns: { type: "string" },
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
              ppns: { type: "string" },
              tanggal: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan } = request.body;
      const exec = await fastify.laporan_ppns.update(
        id, id_nama, nip, golongan, sekep_ppns, tempat_tugas, tahun_diklat, keterangan
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing laporan ppns.",
        tags: ["laporan ppns"],
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
      await fastify.laporan_ppns.del(id);

      reply.status(204);
    }
  );
};
