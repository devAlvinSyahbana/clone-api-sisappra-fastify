const kepegawaian_pns = require("../../services/kepegawaian/kepegawaian_pns");
const kepegawaian_non_pns = require("../../services/kepegawaian/kepegawaian_non_pns");
const XLSX = require("xlsx");

module.exports = async function (fastify, opts) {
  fastify.register(kepegawaian_pns);
  fastify.register(kepegawaian_non_pns);

  fastify.get(
    "/unduh-pegawai",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengunduh seluruh data kepegawaian berstatus PNS, PTT, PJLP",
        tags: ["endpoint kepegawaian"],
        querystring: {
          type: "object",
          properties: {
            status: {
              type: "string",
            },
          },
          required: ["status"],
        },
        response: {
          200: {
            description: "Success Response",
            type: "string",
          },
        },
      },
    },
    async (request, reply) => {
      const { status } = request.query;
      let headerKepegawaian = [];
      let dataKepegawaian = [];
      let headerKeluarga = [];
      let dataKeluarga = [];
      let headerPendidikan = [];
      let dataPendidikan = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
        if (status == "PNS") {
          headerKepegawaian = [
            "Id",
            //data pribadi
            "Nama",
            "Tempat Lahir",
            "Tanggal Lahir",
            "Jenis Kelamin",
            "Agama",
            "NIK",
            "Nomor KK",
            "Status Perkawinan",
            "Nomor HP",
            "Alamat Sesuai KTP",
            "RT/RW Sesuai KTP",
            "Provinsi Sesuai KTP",
            "Kab/Kota Sesuai KTP",
            "Kecamatan Sesuai KTP",
            "Kelurahan Sesuai KTP",
            "Alamat Domisili",
            "RT/RW Domisili",
            "Provinsi Domisili",
            "Kab/Kota Domisili",
            "Kecamatan Domisili",
            "Kelurahan Domisili",
            //data kepegawaian
            "NRK",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Kelurahan",
            "Status Pegawai",
            "Nomor Rekening",
            "Nomor KARPEG",
            "Nomor Karis/Karsu",
            "Nomor TASPEN",
            "Nomor NPWP",
            "Nomor BPJS/ASKES",
            "TMT CPNS",
            "TMT PNS",
            "Tanggal SK PNS",
            "Nomor SK Pangkat Terakhir",
            "Tanggal SK Pangkat",
            "Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Diklat Struktural",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Diklat PPNS",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Diklat Fungsional Pol PP",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_pns.getDataUnduh();
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }
        if (status == "PTT") {
          headerKepegawaian = [
            "Id",
            //data pribadi
            "Nama",
            "Tempat Lahir",
            "Tanggal Lahir",
            "Jenis Kelamin",
            "Agama",
            "NIK",
            "Nomor KK",
            "Status Perkawinan",
            "Nomor HP",
            "Alamat Sesuai KTP",
            "RT/RW Sesuai KTP",
            "Provinsi Sesuai KTP",
            "Kab/Kota Sesuai KTP",
            "Kecamatan Sesuai KTP",
            "Kelurahan Sesuai KTP",
            "Alamat Domisili",
            "RT/RW Domisili",
            "Provinsi Domisili",
            "Kab/Kota Domisili",
            "Kecamatan Domisili",
            "Kelurahan Domisili",
            //data kepegawaian
            "NPTT",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Kelurahan",
            "Status Pegawai",
            "Nomor Rekening",
            "Nomor KARPEG",
            "Nomor Karis/Karsu",
            "Nomor TASPEN",
            "Nomor NPWP",
            "Nomor BPJS/ASKES",
            "TMT CPNS",
            "TMT PNS",
            "Tanggal SK PNS",
            "Nomor SK Pangkat Terakhir",
            "Tanggal SK Pangkat",
            "Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Diklat Struktural",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Diklat PPNS",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Diklat Fungsional Pol PP",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_non_pns.getDataUnduh(status);
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_non_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_non_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }
        if (status == "PJLP") {
          headerKepegawaian = [
            "Id",
            //data pribadi
            "Nama",
            "Tempat Lahir",
            "Tanggal Lahir",
            "Jenis Kelamin",
            "Agama",
            "NIK",
            "Nomor KK",
            "Status Perkawinan",
            "Nomor HP",
            "Alamat Sesuai KTP",
            "RT/RW Sesuai KTP",
            "Provinsi Sesuai KTP",
            "Kab/Kota Sesuai KTP",
            "Kecamatan Sesuai KTP",
            "Kelurahan Sesuai KTP",
            "Alamat Domisili",
            "RT/RW Domisili",
            "Provinsi Domisili",
            "Kab/Kota Domisili",
            "Kecamatan Domisili",
            "Kelurahan Domisili",
            //data kepegawaian
            "NPJLP",
            "NIP",
            "Pangkat",
            "Golongan",
            "TMT Pangkat",
            "Pendidikan Pada SK",
            "Jabatan",
            "Eselon",
            "Tempat Tugas",
            "Subag/Seksi/Kecamatan",
            "Kelurahan",
            "Status Pegawai",
            "Nomor Rekening",
            "Nomor KARPEG",
            "Nomor Karis/Karsu",
            "Nomor TASPEN",
            "Nomor NPWP",
            "Nomor BPJS/ASKES",
            "TMT CPNS",
            "TMT PNS",
            "Tanggal SK PNS",
            "Nomor SK Pangkat Terakhir",
            "Tanggal SK Pangkat",
            "Diklat Pol PP Dasar",
            "Nomor Sertifikat Diklat Pol PP Dasar",
            "Tanggal Sertifikat Diklat Pol PP Dasar",
            "Diklat Struktural",
            "Nomor Sertifikat Diklat Struktural",
            "Tanggal Sertifikat Diklat Struktural",
            "Diklat PPNS",
            "Nomor Sertifikat Diklat PPNS",
            "Tanggal Sertifikat Diklat PPNS",
            "Diklat Fungsional Pol PP",
            "Nomor Sertifikat Diklat Fungsional Pol PP",
            "Tanggal Sertifikat Diklat Fungsional Pol PP",
          ];
          headerKeluarga = [
            "Keluarga Dari",
            "Nama Keluarga",
            "Hubungan Keluarga",
            "Tempat, Tanggal Lahir",
            "Jenis Kelamin",
          ];
          headerPendidikan = [
            "Pendidikan Dari",
            "Jenis Pendidikan",
            "Nama Sekolah",
            "Nomor Ijazah",
            "Tanggal Ijazah",
            "Jurusan",
            "Fakultas",
          ];

          const getData = await fastify.kepegawaian_non_pns.getDataUnduh(status);
          const convertData = await getData.map(function (item) {
            return Object.values(item);
          });
          dataKepegawaian = convertData;

          const employeDataKeluarga = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });
          if (employeDataKeluarga) {
            let r = 2;
            for (const entity of employeDataKeluarga) {
              const getDataKeluarga =
                await fastify.kepegawaian_non_pns.findKeluarga(entity.id);
              if (getDataKeluarga.length > 0) {
                for (let i = 0; i < getDataKeluarga.length; i++) {
                  const klrg = getDataKeluarga[i];
                  const date_born = new Date(klrg.tgl_lahir);
                  if (i === 0) {
                    dataKeluarga.push([
                      entity.nama,
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  } else {
                    dataKeluarga.push([
                      "",
                      klrg.nama,
                      klrg.hubungan,
                      `${klrg.tempat_lahir}, ${date_born.toLocaleDateString()}`,
                      klrg.jenis_kelamin,
                    ]);
                  }
                }
              } else {
                dataKeluarga.push([entity.nama, "-", "-", "-", "-"]);
              }
              r++;
            }
          }

          const employeDataPendidikan = await getData.filter((item) => {
            return { id: item.id, nama: item.nama };
          });

          if (employeDataPendidikan) {
            let r = 2;
            for (const entity of employeDataPendidikan) {
              const getDataPendidikan =
                await fastify.kepegawaian_non_pns.findPendidikan(entity.id);
              if (getDataPendidikan.length > 0) {
                for (let i = 0; i < getDataPendidikan.length; i++) {
                  const pendik = getDataPendidikan[i];
                  const date_ijazah = new Date(pendik.tgl_ijazah);
                  if (i === 0) {
                    dataPendidikan.push([
                      entity.nama,
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  } else {
                    dataPendidikan.push([
                      "",
                      pendik.jenis_pendidikan,
                      pendik.nama_sekolah,
                      pendik.nomor_ijazah,
                      date_ijazah.toLocaleDateString(),
                      pendik.jurusan,
                      pendik.fakultas,
                    ]);
                  }
                }
              } else {
                dataPendidikan.push([
                  entity.nama,
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                  "-",
                ]);
              }
              r++;
            }
          }
        }

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerKepegawaian, ...dataKepegawaian];
        const wsDataKeluarga = [headerKeluarga, ...dataKeluarga];
        const wsDataPendidikan = [headerPendidikan, ...dataPendidikan];
        // Buat Workbook
        const fileName = "DATA KEPEGAWAIAN " + status;
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - KEPEGAWAIAN",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA KEPEGAWAIAN");
        wb.SheetNames.push("DATA KELUARGA");
        wb.SheetNames.push("DATA PENDIDIKAN");
        // Buat Sheet dengan Data
        const ws_kepegawaian = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        const ws_keluarga = XLSX.utils.aoa_to_sheet(wsDataKeluarga);
        const ws_pendidikan = XLSX.utils.aoa_to_sheet(wsDataPendidikan);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA KEPEGAWAIAN"] = ws_kepegawaian;
        wb.Sheets["DATA KELUARGA"] = ws_keluarga;
        wb.Sheets["DATA PENDIDIKAN"] = ws_pendidikan;

        const wopts = { bookType: "xlsx", bookSST: false, type: "buffer" };
        const wBuffer = XLSX.write(wb, wopts);

        reply.header(
          "Content-Type",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );
        reply.header(
          "Content-Disposition",
          "attachment; filename=" + `${fileName}.xlsx`
        );
        reply.send(wBuffer);
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/unduh-data-pegawai-struktural",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengunduh data pegawai pejabat struktural",
        tags: ["endpoint pegawai pejabat struktural"],
        querystring: {
          type: "object",
          properties: {
            nama: {
              type: "string",
            },
            nip: {
              type: "string",
            },
            nrk: {
              type: "string",
            },
            kecamatan_seksi: {
              type: "string",
            },
            kelurahan: {
              type: "string",
            },
            jabatan: {
              type: "string",
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "string",
          },
        },
      },
    },
    async (request, reply) => {
      const { nama, nrk, kecamatan_seksi, kelurahan, jabatan, nip } = request.query;
      let headerKepegawaian = [];
      let dataKepegawaian = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header

        headerKepegawaian = [
          "Id",
          "Nama",
          "Nip",
          "Nrk",
          "Jabatan",
          "Tempat Tugas",
          "Keterangan",
        ];
        
        let qwhere = "";
        if (nama) {
          qwhere += ` AND kpns.nama ILIKE '%${nama}%'`;
        }
        if (nrk) {
          qwhere += ` AND kpns.kepegawaian_nrk ILIKE '%${nrk}%'`;
        }
        if (nip) {
          qwhere += ` AND kpns.kepegawaian_nip ILIKE '%${nip}%'`;
        }
        if (kecamatan_seksi) {
          qwhere += ` AND kpns.kepegawaian_subbag_seksi_kecamatan ILIKE '%${kecamatan_seksi}%'`;
        }
        if (jabatan) {
          qwhere += ` AND kpns.kepegawaian_jabatan ILIKE '%${jabatan}%'`;
        }
        if (kelurahan) {
          qwhere += ` AND kpns.kepegawaian_kelurahan ILIKE '%${kelurahan}%'`;
        }

        const getData = await fastify.kepegawaian_pns.getDataUnduhPejabatStruktural(qwhere);
        console.log(getData)
        const convertData = await getData.map(function (item) {
          return Object.values(item);
        });
        dataKepegawaian = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerKepegawaian, ...dataKepegawaian];

        // Buat Workbook
        const fileName = "DATA PEGAWAIAN PEJABAT STRUKTURAL ";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - KEPEGAWAIAN",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA PEJABAT STRUKTURAL");

        // Buat Sheet dengan Data
        const ws_kepegawaian = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);

        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA KEPEGAWAIAN"] = ws_kepegawaian;


        const wopts = { bookType: "xlsx", bookSST: false, type: "buffer" };
        const wBuffer = XLSX.write(wb, wopts);

        reply.header(
          "Content-Type",
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );
        reply.header(
          "Content-Disposition",
          "attachment; filename=" + `${fileName}.xlsx`
        );
        reply.send(wBuffer);
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
};
