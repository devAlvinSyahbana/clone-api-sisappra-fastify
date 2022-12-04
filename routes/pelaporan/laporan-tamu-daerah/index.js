const laporan_tamu_daerah = require("../../../services/pelaporan/laporan_tamu_daerah");

module.exports = async function (fastify, opts) {
  fastify.register(laporan_tamu_daerah);

  fastify.get(
    "/find",
    {
      schema: {
        description:
          "API untuk mengambil seluruh Laporan Tamu Daerah",
        tags: ["laporan tamu daerah"],
        response: {
          200: {
            description: "Berhasil Bro!",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: { type: "number" },
                tanggal_kunjungan: { type: "string" },
                waktu_mulai_kunjungan: { type: "string" },
                waktu_selesai_kunjungan: { type: "string" },
                asal_instansi: { type: "string" },
                jml_pengunjung: { type: "string" },
                maksud_dan_tujuan: { type: "string" },
                pejabat_penerima_kunjungan: { type: "string" },
                tempat_kunjungan: { type: "string" },
                pelaksanaan: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_tamu_daerah.find();
      console.log("string", exec)
      return exec;
    }
  );

  fastify.get(
    "/findone/:id",
    {
      schema: {
        description:
          "API untuk mengambil Laporan tamu daerah berdasarkan id",
        tags: ["laporan tamu daerah"],
        params: {
          description: "laporan tamu daerah dari Id",
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
              tanggal_kunjungan: { type: "string" },
              waktu_mulai_kunjungan: { type: "string" },
              waktu_selesai_kunjungan: { type: "string" },
              asal_instansi: { type: "string" },
              jml_pengunjung: { type: "string" },
              maksud_dan_tujuan: { type: "string" },
              pejabat_penerima_kunjungan: { type: "string" },
              tempat_kunjungan: { type: "string" },
              pelaksanaan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_tamu_daerah.findone(id);
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description:
          "API membuat laporan tamu daerah",
        tags: ["laporan tamu daerah"],
        body: {
          description: "Payload for creating a laporan tamu daerah",
          type: "object",
          properties: {
            tanggal_kunjungan: { type: "string" },
            waktu_mulai_kunjungan: { type: "string" },
            waktu_selesai_kunjungan: { type: "string" },
            asal_instansi: { type: "string" },
            jml_pengunjung: { type: "string" },
            maksud_dan_tujuan: { type: "string" },
            pejabat_penerima_kunjungan: { type: "string" },
            tempat_kunjungan: { type: "string" },
            pelaksanaan: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              tanggal_kunjungan: { type: "string" },
              waktu_mulai_kunjungan: { type: "string" },
              waktu_selesai_kunjungan: { type: "string" },
              asal_instansi: { type: "string" },
              jml_pengunjung: { type: "string" },
              maksud_dan_tujuan: { type: "string" },
              pejabat_penerima_kunjungan: { type: "string" },
              tempat_kunjungan: { type: "string" },
              pelaksanaan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan } = request.body;
      const exec = await fastify.laporan_tamu_daerah.create(
        tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan
      );
      reply.code(201).send(exec);
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "API mengubah laporan tamu daerah",
        tags: ["laporan tamu daerah"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a laporan tamu_daerah",
          type: "object",
          properties: {
            tanggal_kunjungan: { type: "string" },
            waktu_mulai_kunjungan: { type: "string" },
            waktu_selesai_kunjungan: { type: "string" },
            asal_instansi: { type: "string" },
            jml_pengunjung: { type: "string" },
            maksud_dan_tujuan: { type: "string" },
            pejabat_penerima_kunjungan: { type: "string" },
            tempat_kunjungan: { type: "string" },
            pelaksanaan: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              tanggal_kunjungan: { type: "string" },
              waktu_mulai_kunjungan: { type: "string" },
              waktu_selesai_kunjungan: { type: "string" },
              asal_instansi: { type: "string" },
              jml_pengunjung: { type: "string" },
              maksud_dan_tujuan: { type: "string" },
              pejabat_penerima_kunjungan: { type: "string" },
              tempat_kunjungan: { type: "string" },
              pelaksanaan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan } = request.body;
      const exec = await fastify.laporan_tamu_daerah.update(
        id, tanggal_kunjungan, waktu_mulai_kunjungan, waktu_selesai_kunjungan, asal_instansi, jml_pengunjung, maksud_dan_tujuan, pejabat_penerima_kunjungan, tempat_kunjungan, pelaksanaan
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing laporan tamu daerah .",
        tags: ["laporan tamu daerah"],
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
      await fastify.laporan_tamu_daerah.del(id);

      reply.status(204);
    }
  );
};
