const sarana_prasarana = require("../../services/sarana_prasarana");
const fileUpload = require("fastify-file-upload");

module.exports = async function (fastify, opts) {
  fastify.register(sarana_prasarana);
  fastify.register(fileUpload);

  fastify.get(
    "/find", {
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
                jumlah: {
                  type: "number",
                },
                kondisi: {
                  type: "string",
                },
                keterangan: {
                  type: "string",
                },
                dokumentasi: {
                  type: "string",
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.sarana_prasarana.find();
      return exec;
    }
  );


  // fastify.get(
  //   "/findone/:id",
  //   {
  //     schema: {
  //       description:
  //         "This is an endpoint for fetching a sample crud by id",
  //       tags: ["sarana_prasarana"],
  //       params: {
  //         description: "Find one sample crud by Id",
  //         type: "object",
  //         properties: {
  //           jenis_sarana_prasarana: { type: "number" },
  //           status_sarana_prasarana: { type: "string" },
  //           kondisi: { type: "string" },
  //         },
  //       },
  //       response: {
  //         200: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             jenis_sarana_prasarana: { type: "number" },
  //             status_sarana_prasarana: { type: "string" },
  //             kondisi: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const { id } = request.params;
  //     const exec = await fastify.sample_crud.findone(id);
  //     return exec;
  //   }
  // );






  // fastify.get(
  //   "/findFilter",
  //   {
  //     schema: {
  //       description: "This is an endpoint for fetching all sarana_prasarana",
  //       tags: ["sarana_prasarana"],
  //       response: {
  //         200: {
  //           description: "Success Response",
  //           type: "array",
  //           items: {
  //             type: "object",
  //             properties: {
  //               jenis_sarana_prasarana: {
  //                 type: "string",
  //               },
  //               status_sarana_prasarana: {
  //                 type: "string",
  //               },
  //               kondisi: {
  //                 type: "string",
  //               },
  //             },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const exec = await fastify.sarana_prasarana.findFilter();
  //     return exec;
  //   }
  // );

  fastify.post(
    "/create", {
      schema: {
        description: "This is an endpoint for creating a sample crud",
        tags: ["sarana_prasarana"],
        body: {
          description: "Payload for creating a sample crud",
          type: "object",
          properties: {
            jenis_sarana_prasarana: {
              type: "string"
            },
            status_sarana_prasarana: {
              type: "string"
            },
            jumlah: {
              type: "number"
            },
            kondisi: {
              type: "string"
            },
            keterangan: {
              type: "string"
            },
            dokumentasi: {
              type: "string"
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              jenis_sarana_prasarana: {
                type: "string"
              },
              status_sarana_prasarana: {
                type: "string"
              },
              jumlah: {
                type: "number"
              },
              kondisi: {
                type: "string"
              },
              keterangan: {
                type: "string"
              },
              dokumentasi: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        dokumentasi,
      } = request.body;
      const exec = await fastify.sarana_prasarana.create(
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        dokumentasi
      );
      reply.code(201).send(exec);
    }
  );

  // fastify.post(
  //   "/upload-dokumentasi",
  //   {
  //     schema: {
  //       description: "This is an endpoint for Upload a file to the server",
  //       tags: ["sarana_prasarana"],
  //       summary: "Upload a file to the server",
  //       consumes: ["multipart/form-data"],
  //       body: {
  //         description: "Payload for Upload a file to the server",
  //         type: "object",
  //         properties: {
  //           media: {
  //             type: "string",
  //             format: "binary",
  //           },
  //         },
  //       },
  //       // "requestBody": {
  //       //   "required": true,
  //       //   "content": {
  //       //     "multipart/form-data": {
  //       //       "schema": {
  //       //         "type": "object",
  //       //         "properties": {
  //       //           "media": {
  //       //             "type": "string",
  //       //             "format": "base64"
  //       //           }
  //       //         }
  //       //       }
  //       //     }
  //       //   }
  //       // },
  //       // consumes: ["multipart/form-data"],
  //       // body: {
  //       //   description: "Payload for Upload a file to the server",
  //       //   type: "object",
  //       //   properties: {
  //       //     filename: {
  //       //       type: "object",
  //       //       properties: {
  //       //         content: {
  //       //           type: "image/png",
  //       //           schema: {
  //       //             type: "string",
  //       //             format: "binary",
  //       //           },
  //       //         },
  //       //       },
  //       //     },
  //       //   },
  //       // },
  //       response: {
  //         201: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: { type: "string" },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     console.log(request.body);
  //     reply.code(201).send(true);
  //   }
  // );

  fastify.post(
    "/uploadSchema", {
      schema: {
        tags: ["sarana_prasarana"],
        consumes: ["multipart/form-data"],
        body: {
          type: "object",
          properties: {
            fileName: {
              type: "array",
              items: {
                type: "string",
                format: "binary",
              },
            },
          },
          required: ["fileName"],
        },
      },
      handler: (request, reply) => {
        const {
          file
        } = request.body.file;
        console.log(file);
        reply.send({
          file
        });
      },
    });

  fastify.put(
    "/update/:id", {
      schema: {
        description: "This is an endpoint for updating an existing sample crud",
        tags: ["sarana_prasarana"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for updating a sample crud",
          type: "object",
          properties: {
            jenis_sarana_prasarana: {
              type: "string"
            },
            status_sarana_prasarana: {
              type: "string"
            },
            jumlah: {
              type: "number"
            },
            kondisi: {
              type: "string"
            },
            keterangan: {
              type: "string"
            },
            dokumentasi: {
              type: "string"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              jenis_sarana_prasarana: {
                type: "string"
              },
              status_sarana_prasarana: {
                type: "string"
              },
              jumlah: {
                type: "number"
              },
              kondisi: {
                type: "string"
              },
              keterangan: {
                type: "string"
              },
              dokumentasi: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        jenis_sarana_prasarana
      } = request.body;
      const {
        status_sarana_prasarana
      } = request.body;
      const {
        jumlah
      } = request.body;
      const {
        kondisi
      } = request.body;
      const {
        keterangan
      } = request.body;
      const {
        dokumentasi
      } = request.body;

      const exec = await fastify.sarana_prasarana.update(
        jenis_sarana_prasarana,
        status_sarana_prasarana,
        jumlah,
        kondisi,
        keterangan,
        dokumentasi
      );

      return exec;
    }
  );

  fastify.delete(
    "/delete/:id", {
      schema: {
        description: "This is an endpoint for DELETING an existing sample crud.",
        tags: ["sarana_prasarana"],
        params: {
          description: "Master area dampak risiko by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        response: {
          204: {
            type: "number",
            default: "No Content",
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      await fastify.sarana_prasarana.del(id);

      reply.status(204);
    }
  );
};