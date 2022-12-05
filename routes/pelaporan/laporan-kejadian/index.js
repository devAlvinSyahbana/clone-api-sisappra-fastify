const laporan_kejadian = require("../../../services/pelaporan/laporan_kejadian");

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
                bidang_wilayah: { type: "string" },
                jumlah_kejadian: { type: "string" },
                banjir: { type: "string" },
                hewan_buas_dan_berbisa: { type: "string" },
                kebakaran: { type: "string" },
                kecelakaan: { type: "string" },
                pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
                kerusakan_konstruksi: { type: "string" },
                kriminalitas: { type: "string" },
                pembunuhan: { type: "string" },
                penemuan_mayat: { type: "string" },
                penyelamatan_orang: { type: "string" },
                pohon_tumbang: { type: "string" },
                tawuran: { type: "string" },
                terorisme: { type: "string" },
                unjuk_rasa: { type: "string" },
                keterangan: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_kejadian.find();
      console.log("string", exec)
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
              bidang_wilayah: { type: "string" },
              jumlah_kejadian: { type: "string" },
              banjir: { type: "string" },
              hewan_buas_dan_berbisa: { type: "string" },
              kebakaran: { type: "string" },
              kecelakaan: { type: "string" },
              pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
              kerusakan_konstruksi: { type: "string" },
              kriminalitas: { type: "string" },
              pembunuhan: { type: "string" },
              penemuan_mayat: { type: "string" },
              penyelamatan_orang: { type: "string" },
              pohon_tumbang: { type: "string" },
              tawuran: { type: "string" },
              terorisme: { type: "string" },
              unjuk_rasa: { type: "string" },
              keterangan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.laporan_kejadian.findone(id);
      console.log(exec)
      if (exec) {
        reply.send({ message: "hooh tenan", code: 200, data: exec });
      } else {
        reply.send({ message: "hooh tenan", code :204 });
      }
      
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
            bidang_wilayah: { type: "string" },
            jumlah_kejadian: { type: "string" },
            banjir: { type: "string" },
            hewan_buas_dan_berbisa: { type: "string" },
            kebakaran: { type: "string" },
            kecelakaan: { type: "string" },
            pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
            kerusakan_konstruksi: { type: "string" },
            kriminalitas: { type: "string" },
            pembunuhan: { type: "string" },
            penemuan_mayat: { type: "string" },
            penyelamatan_orang: { type: "string" },
            pohon_tumbang: { type: "string" },
            tawuran: { type: "string" },
            terorisme: { type: "string" },
            unjuk_rasa: { type: "string" },
            keterangan: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              bidang_wilayah: { type: "string" },
              jumlah_kejadian: { type: "string" },
              banjir: { type: "string" },
              hewan_buas_dan_berbisa: { type: "string" },
              kebakaran: { type: "string" },
              kecelakaan: { type: "string" },
              pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
              kerusakan_konstruksi: { type: "string" },
              kriminalitas: { type: "string" },
              pembunuhan: { type: "string" },
              penemuan_mayat: { type: "string" },
              penyelamatan_orang: { type: "string" },
              pohon_tumbang: { type: "string" },
              tawuran: { type: "string" },
              terorisme: { type: "string" },
              unjuk_rasa: { type: "string" },
              keterangan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempuan_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan } = request.body;
      const exec = await fastify.laporan_kejadian.create(
        bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempuan_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan
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
            bidang_wilayah: { type: "string" },
            jumlah_kejadian: { type: "string" },
            banjir: { type: "string" },
            hewan_buas_dan_berbisa: { type: "string" },
            kebakaran: { type: "string" },
            kecelakaan: { type: "string" },
            pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
            kerusakan_konstruksi: { type: "string" },
            kriminalitas: { type: "string" },
            pembunuhan: { type: "string" },
            penemuan_mayat: { type: "string" },
            penyelamatan_orang: { type: "string" },
            pohon_tumbang: { type: "string" },
            tawuran: { type: "string" },
            terorisme: { type: "string" },
            unjuk_rasa: { type: "string" },
            keterangan: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              bidang_wilayah: { type: "string" },
              jumlah_kejadian: { type: "string" },
              banjir: { type: "string" },
              hewan_buas_dan_berbisa: { type: "string" },
              kebakaran: { type: "string" },
              kecelakaan: { type: "string" },
              pendampingan_kekerasan_pada_perempuan_dan_anak: { type: "string" },
              kerusakan_konstruksi: { type: "string" },
              kriminalitas: { type: "string" },
              pembunuhan: { type: "string" },
              penemuan_mayat: { type: "string" },
              penyelamatan_orang: { type: "string" },
              pohon_tumbang: { type: "string" },
              tawuran: { type: "string" },
              terorisme: { type: "string" },
              unjuk_rasa: { type: "string" },
              keterangan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempuan_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan } = request.body;
      const exec = await fastify.laporan_kejadian.update(
        id, bidang_wilayah, jumlah_kejadian, banjir, hewan_buas_dan_berbisa, kebakaran, kecelakaan, pendampingan_kekerasan_pada_perempuan_dan_anak, kerusakan_konstruksi, kriminalitas, pembunuhan, penemuan_mayat, penyelamatan_orang, pohon_tumbang, tawuran, terorisme, unjuk_rasa, keterangan
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
