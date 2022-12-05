const laporan_kegiatan = require("../../../services/pelaporan/laporan_kegiatan");

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
                pelaksana_bidang_wilayah: { type: "string" },
                keterangan: { type: "string" },
                penghalauan: { type: "string" },
                pembubaran: { type: "string" },
                pengusiran: { type: "string" },
                teguran_tertulis: { type: "string" },
                penyegelan: { type: "string" },
                penghentian_kegiatan: { type: "string" },
                pembongkaran: { type: "string" },
                ditertibkan: { type: "string" },
                bongkar_sendiri: { type: "string" },
                pemusnahan: { type: "string" },
                pencabutan_izin: { type: "string" },
                pembekuan_sementara_izin: { type: "string" },
                razia: { type: "string" },
                penjemputan: { type: "string" },
                penangkapan: { type: "string" },
                penyitaan: { type: "string" },
                pembersihan: { type: "string" },
                pencopotan_pelepasan_pencabutan: { type: "string" },
                penyidikan: { type: "string" },
                kerja_sosial: { type: "string" },
                denda_administratif: { type: "string" },
                terbit_izin: { type: "string" },
                dikembalikan: { type: "string" },
                belum_diterbitkan: { type: "string" },
                lain_lain: { type: "string" },
                tidak_ditemukan: { type: "string" },
                pengadilan_yustisi: { type: "string" },
                non_pengadilan: { type: "string" },
                penghentian_kegiatan_sementara_1x24jam: { type: "string" },
                penghentian_kegiatan_sementara_3x24jam: { type: "string" },
                penghentian_kegiatan_sementara_7x24jam: { type: "string" },
                jumlah_pengawasan_dan_penindakan: { type: "string" },
                peringatan: { type: "string" },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.laporan_kegiatan.find();
      console.log("string", exec)
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
              pelaksana_bidang_wilayah: { type: "string" },
              keterangan: { type: "string" },
              penghalauan: { type: "string" },
              pembubaran: { type: "string" },
              pengusiran: { type: "string" },
              teguran_tertulis: { type: "string" },
              penyegelan: { type: "string" },
              penghentian_kegiatan: { type: "string" },
              pembongkaran: { type: "string" },
              ditertibkan: { type: "string" },
              bongkar_sendiri: { type: "string" },
              pemusnahan: { type: "string" },
              pencabutan_izin: { type: "string" },
              pembekuan_sementara_izin: { type: "string" },
              razia: { type: "string" },
              penjemputan: { type: "string" },
              penangkapan: { type: "string" },
              penyitaan: { type: "string" },
              pembersihan: { type: "string" },
              pencopotan_pelepasan_pencabutan: { type: "string" },
              penyidikan: { type: "string" },
              kerja_sosial: { type: "string" },
              denda_administratif: { type: "string" },
              terbit_izin: { type: "string" },
              dikembalikan: { type: "string" },
              belum_diterbitkan: { type: "string" },
              lain_lain: { type: "string" },
              tidak_ditemukan: { type: "string" },
              pengadilan_yustisi: { type: "string" },
              non_pengadilan: { type: "string" },
              penghentian_kegiatan_sementara_1x24jam: { type: "string" },
              penghentian_kegiatan_sementara_3x24jam: { type: "string" },
              penghentian_kegiatan_sementara_7x24jam: { type: "string" },
              jumlah_pengawasan_dan_penindakan: { type: "string" },
              peringatan: { type: "string" },
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
            pelaksana_bidang_wilayah: { type: "string" },
            keterangan: { type: "string" },
            penghalauan: { type: "string" },
            pembubaran: { type: "string" },
            pengusiran: { type: "string" },
            teguran_tertulis: { type: "string" },
            penyegelan: { type: "string" },
            penghentian_kegiatan: { type: "string" },
            pembongkaran: { type: "string" },
            ditertibkan: { type: "string" },
            bongkar_sendiri: { type: "string" },
            pemusnahan: { type: "string" },
            pencabutan_izin: { type: "string" },
            pembekuan_sementara_izin: { type: "string" },
            razia: { type: "string" },
            penjemputan: { type: "string" },
            penangkapan: { type: "string" },
            penyitaan: { type: "string" },
            pembersihan: { type: "string" },
            pencopotan_pelepasan_pencabutan: { type: "string" },
            penyidikan: { type: "string" },
            kerja_sosial: { type: "string" },
            denda_administratif: { type: "string" },
            terbit_izin: { type: "string" },
            dikembalikan: { type: "string" },
            belum_diterbitkan: { type: "string" },
            lain_lain: { type: "string" },
            tidak_ditemukan: { type: "string" },
            pengadilan_yustisi: { type: "string" },
            non_pengadilan: { type: "string" },
            penghentian_kegiatan_sementara_1x24jam: { type: "string" },
            penghentian_kegiatan_sementara_3x24jam: { type: "string" },
            penghentian_kegiatan_sementara_7x24jam: { type: "string" },
            jumlah_pengawasan_dan_penindakan: { type: "string" },
            peringatan: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              pelaksana_bidang_wilayah: { type: "string" },
              keterangan: { type: "string" },
              penghalauan: { type: "string" },
              pembubaran: { type: "string" },
              pengusiran: { type: "string" },
              teguran_tertulis: { type: "string" },
              penyegelan: { type: "string" },
              penghentian_kegiatan: { type: "string" },
              pembongkaran: { type: "string" },
              ditertibkan: { type: "string" },
              bongkar_sendiri: { type: "string" },
              pemusnahan: { type: "string" },
              pencabutan_izin: { type: "string" },
              pembekuan_sementara_izin: { type: "string" },
              razia: { type: "string" },
              penjemputan: { type: "string" },
              penangkapan: { type: "string" },
              penyitaan: { type: "string" },
              pembersihan: { type: "string" },
              pencopotan_pelepasan_pencabutan: { type: "string" },
              penyidikan: { type: "string" },
              kerja_sosial: { type: "string" },
              denda_administratif: { type: "string" },
              terbit_izin: { type: "string" },
              dikembalikan: { type: "string" },
              belum_diterbitkan: { type: "string" },
              lain_lain: { type: "string" },
              tidak_ditemukan: { type: "string" },
              pengadilan_yustisi: { type: "string" },
              non_pengadilan: { type: "string" },
              penghentian_kegiatan_sementara_1x24jam: { type: "string" },
              penghentian_kegiatan_sementara_3x24jam: { type: "string" },
              penghentian_kegiatan_sementara_7x24jam: { type: "string" },
              jumlah_pengawasan_dan_penindakan: { type: "string" },
              peringatan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan } = request.body;
      const exec = await fastify.laporan_kegiatan.create(
        pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan
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
            pelaksana_bidang_wilayah: { type: "string" },
            keterangan: { type: "string" },
            penghalauan: { type: "string" },
            pembubaran: { type: "string" },
            pengusiran: { type: "string" },
            teguran_tertulis: { type: "string" },
            penyegelan: { type: "string" },
            penghentian_kegiatan: { type: "string" },
            pembongkaran: { type: "string" },
            ditertibkan: { type: "string" },
            bongkar_sendiri: { type: "string" },
            pemusnahan: { type: "string" },
            pencabutan_izin: { type: "string" },
            pembekuan_sementara_izin: { type: "string" },
            razia: { type: "string" },
            penjemputan: { type: "string" },
            penangkapan: { type: "string" },
            penyitaan: { type: "string" },
            pembersihan: { type: "string" },
            pencopotan_pelepasan_pencabutan: { type: "string" },
            penyidikan: { type: "string" },
            kerja_sosial: { type: "string" },
            denda_administratif: { type: "string" },
            terbit_izin: { type: "string" },
            dikembalikan: { type: "string" },
            belum_diterbitkan: { type: "string" },
            lain_lain: { type: "string" },
            tidak_ditemukan: { type: "string" },
            pengadilan_yustisi: { type: "string" },
            non_pengadilan: { type: "string" },
            penghentian_kegiatan_sementara_1x24jam: { type: "string" },
            penghentian_kegiatan_sementara_3x24jam: { type: "string" },
            penghentian_kegiatan_sementara_7x24jam: { type: "string" },
            jumlah_pengawasan_dan_penindakan: { type: "string" },
            peringatan: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              id: { type: "number" },
              pelaksana_bidang_wilayah: { type: "string" },
              keterangan: { type: "string" },
              penghalauan: { type: "string" },
              pembubaran: { type: "string" },
              pengusiran: { type: "string" },
              teguran_tertulis: { type: "string" },
              penyegelan: { type: "string" },
              penghentian_kegiatan: { type: "string" },
              pembongkaran: { type: "string" },
              ditertibkan: { type: "string" },
              bongkar_sendiri: { type: "string" },
              pemusnahan: { type: "string" },
              pencabutan_izin: { type: "string" },
              pembekuan_sementara_izin: { type: "string" },
              razia: { type: "string" },
              penjemputan: { type: "string" },
              penangkapan: { type: "string" },
              penyitaan: { type: "string" },
              pembersihan: { type: "string" },
              pencopotan_pelepasan_pencabutan: { type: "string" },
              penyidikan: { type: "string" },
              kerja_sosial: { type: "string" },
              denda_administratif: { type: "string" },
              terbit_izin: { type: "string" },
              dikembalikan: { type: "string" },
              belum_diterbitkan: { type: "string" },
              lain_lain: { type: "string" },
              tidak_ditemukan: { type: "string" },
              pengadilan_yustisi: { type: "string" },
              non_pengadilan: { type: "string" },
              penghentian_kegiatan_sementara_1x24jam: { type: "string" },
              penghentian_kegiatan_sementara_3x24jam: { type: "string" },
              penghentian_kegiatan_sementara_7x24jam: { type: "string" },
              jumlah_pengawasan_dan_penindakan: { type: "string" },
              peringatan: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan } = request.body;
      const exec = await fastify.laporan_kegiatan.update(
        id, pelaksana_bidang_wilayah, keterangan, penghalauan, pembubaran, pengusiran, teguran_tertulis, penyegelan, penghentian_kegiatan, pembongkaran, ditertibkan, bongkar_sendiri, pemusnahan, pencabutan_izin, pembekuan_sementara_izin, razia, penjemputan, penangkapan, penyitaan, pembersihan, pencopotan_pelepasan_pencabutan, penyidikan, kerja_sosial, denda_administratif, terbit_izin, dikembalikan, belum_diterbitkan, lain_lain, tidak_ditemukan, pengadilan_yustisi, non_pengadilan, penghentian_kegiatan_sementara_1x24jam, penghentian_kegiatan_sementara_3x24jam, penghentian_kegiatan_sementara_7x24jam, jumlah_pengawasan_dan_penindakan, peringatan
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
