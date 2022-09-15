const sarana_prasarana = require("../../services/sarana_prasarana");
const multer = require("fastify-multer");
const XLSX = require("xlsx");
const path = require("path");
const fs = require("fs");
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "/uploads/sarana_prasarana");
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + "-" + Date.now());
  },
});
const upload = multer({ storage: storage });

module.exports = async function (fastify, opts) {
  fastify.register(sarana_prasarana);
  fastify.register(multer.contentParser);

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all sarana_prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    jenis_sarana_prasarana: { type: "string" },
                    status_sarana_prasarana: { type: "string" },
                    jumlah: { type: "number" },
                    kondisi: { type: "string" },
                    keterangan: { type: "string" },
                    dokumentasi: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.find();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/find-jenis-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all jenis-sarana-prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    jenis_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.find_jenis_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/find-kondisi-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all kondisi-sarana-prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    kondisi_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec =
        await fastify.sarana_prasarana.find_kondisi_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/find-status-sarana-prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching all status-sarana-prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    status_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec =
        await fastify.sarana_prasarana.find_status_sarana_prasarana();

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );
  fastify.get(
    "/findjenis/:jenis_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            jenis_sarana_prasarana: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    jenis_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_jenis_sarana_prasarana(
        jenis_sarana_prasarana
      );

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/findstatus/:status_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            status_sarana_prasarana: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    status_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { status_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_status_sarana_prasarana(
        status_sarana_prasarana
      );

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/findkondisi/:kondisi_sarana_prasarana",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            kondisi_sarana_prasarana: { type: "string" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    kondisi_sarana_prasarana: { type: "string" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { kondisi_sarana_prasarana } = request.params;
      const exec = await fastify.sarana_prasarana.find_kondisi_sarana_prasarana(
        kondisi_sarana_prasarana
      );

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/filter",
    {
      schema: {
        description:
          "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        querystring: {
          type: "object",
          properties: {
            limit: {
              type: "integer",
              default: 10,
            },
            offset: {
              type: "integer",
              default: 1,
            },
            jenis_sarana_prasarana: {
              type: "integer",
            },
            status_sarana_prasarana: {
              type: "integer",
            },
            kondisi_sarana_prasarana: {
              type: "integer",
            },
          },
          required: ["limit", "offset"],
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: { type: "number" },
                    jenis_sarana_prasarana: { type: "string" },
                    status_sarana_prasarana: { type: "string" },
                    jumlah: { type: "number" },
                    kondisi: { type: "string" },
                    keterangan: { type: "string" },
                    dokumentasi: { type: "string" },
                  },
                },
              },
              total_data: { type: "number" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        limit,
        offset,
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        kondisi_sarana_prasarana,
      } = request.query;
      let exec = null;
      let totalDt = 0;
      let qwhere = "";
      if (jenis_sarana_prasarana) {
        qwhere += ` AND sp.jenis_sarana_prasarana = ${jenis_sarana_prasarana}`;
      }
      if (status_sarana_prasarana) {
        qwhere += ` AND sp.status_sarana_prasarana = ${status_sarana_prasarana}`;
      }
      if (kondisi_sarana_prasarana) {
        qwhere += ` AND sp.kondisi = ${kondisi_sarana_prasarana}`;
      }
      exec = await fastify.sarana_prasarana.filter(limit, offset, qwhere);
      const { total } = await fastify.sarana_prasarana.countAllFilter(qwhere);
      totalDt = total;
      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec,
            total_data: totalDt,
          });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500 });
      }
    }
  );

  fastify.get(
    "/findFilter",
    {
      schema: {
        description: "This is an endpoint for fetching all sarana_prasarana",
        tags: ["sarana_prasarana"],
        response: {
          200: {
            description: "Success Response",
            type: "array",
            items: {
              type: "object",
              properties: {
                jenis_sarana_prasarana: {
                  type: "string",
                },
                status_sarana_prasarana: {
                  type: "string",
                },
                kondisi: {
                  type: "string",
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.findFilter();
      return exec;
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description: "This is an endpoint for creating a sample crud",
        tags: ["sarana_prasarana"],
        body: {
          description: "Payload for creating a sample crud",
          type: "object",
          properties: {
            jenis_sarana_prasarana: {
              type: "string",
            },
            status_sarana_prasarana: {
              type: "string",
            },
            jumlah: {
              type: "number",
            },
            kondisi: {
              type: "string",
            },
            keterangan: {
              type: "string",
            },
            file_dokumentasi: {
              type: "string",
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { jenis_sarana_prasarana,status_sarana_prasarana,jumlah,kondisi,keterangan,file_dokumentasi,created_by} = request.body;
      try {
        await fastify.sarana_prasarana.create( jenis_sarana_prasarana,status_sarana_prasarana,jumlah,kondisi,keterangan,file_dokumentasi,created_by);
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  // fastify.post("/uploadSchema", {
  //   schema: {
  //     tags: ["sarana_prasarana"],
  //     consumes: ["multipart/form-data"],
  //     body: {
  //       type: "object",
  //       properties: {
  //         fileName: {
  //           type: "array",
  //           items: {
  //             type: "string",
  //             format: "binary",
  //           },
  //         },
  //       },
  //       required: ["fileName"],
  //     },
  //   },
  //   handler: (request, reply) => {
  //   const {
  //     file
  //   } = request.body.file;
  //   console.log(file);
  //   reply.send({
  //     file
  //   });
  // },
  // });

  fastify.put(
    "/update/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating an existing sarana_prasarana",
        tags: ["sarana_prasarana"],
        params: {
          description: "update sarana_prasarana by Id",
          type: "object",
          properties: {
            id: {
              type: "number",
            },
          },
        },
        body: {
          description: "Payload for updating a sarana_prasarana",
          type: "object",
          properties: {
            jenis_sarana_prasarana: { type: "string" },
            status_sarana_prasarana: { type: "string" },
            jumlah: { type: "number" },
            kondisi: { type: "string" },
            keterangan: { type: "string" },
            file_dokumentasi: { type: "string" },
            updated_by: { type: "number" },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const {
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        file_dokumentasi,
        updated_by,
      } = request.body;

      try {
        await fastify.sarana_prasarana.update(
          id,
          jenis_sarana_prasarana,
          status_sarana_prasarana,
          jumlah,
          kondisi,
          keterangan,
          file_dokumentasi,
          updated_by
        );

        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.delete(
    "/delete/:id",
    {
      schema: {
        description:
          "This is an endpoint for DELETING an existing sarana_prasarana",
        tags: ["sarana_prasarana"],
        params: {
          description: "sarana_prasarana by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const { deleted_by } = request.body;

      try {
        await fastify.login.del(id, deleted_by);
        reply.send({ message: "success", code: 204 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.get(
    "/unduh",
    {
      schema: {
        description:
          "Endpoint ini digunakan untuk mengunduh seluruh data sarana dan prasarana",
        tags: ["sarana_prasarana"],
        querystring: {
          type: "object",
          properties: {
            jenis_sarana_prasarana: {
              type: "integer",
            },
            status_sarana_prasarana: {
              type: "integer",
            },
            kondisi_sarana_prasarana: {
              type: "integer",
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
      const {
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        kondisi_sarana_prasarana,
      } = request.query;
      let qwhere = "";
      if (jenis_sarana_prasarana) {
        qwhere += ` AND sp.jenis_sarana_prasarana = ${jenis_sarana_prasarana}`;
      }
      if (status_sarana_prasarana) {
        qwhere += ` AND sp.status_sarana_prasarana = ${status_sarana_prasarana}`;
      }
      if (kondisi_sarana_prasarana) {
        qwhere += ` AND sp.kondisi = ${kondisi_sarana_prasarana}`;
      }
      let headerData = [];
      let data = [];
      try {
        const wb = XLSX.utils.book_new();
        // Definisikan header
          headerData = [
            //data pribadi
            "Jenis Sarana & Prasarana",
            "Status Sarana & Prasarana",
            "Jumlah",
            "Kondisi",
            "Keterangan",
          ];

          const getData = await fastify.sarana_prasarana.unduh(qwhere);
          const convertData = getData.map(function (item) {
            return Object.values(item);
          });
          data = convertData;

        // Definisikan rows untuk ditulis ke dalam spreadsheet
        const wsDataKepegawaian = [headerData, ...data];
        // Buat Workbook
        const fileName = "DATA SARANA DAN PRASARANA";
        wb.Props = {
          Title: fileName,
          Author: "SISAPPRA - SARANA DAN PRASARANA",
          CreatedDate: new Date(),
        };
        // Buat Sheet
        wb.SheetNames.push("DATA SARANA PRASARANA");
        // Buat Sheet dengan Data
        const ws = XLSX.utils.aoa_to_sheet(wsDataKepegawaian);
        // const ws = XLSX.utils.aoa_to_sheet(wsData);
        wb.Sheets["DATA SARANA PRASARANA"] = ws;

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
