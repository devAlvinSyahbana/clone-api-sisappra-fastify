const sarana_prasarana = require("../../services/sarana_prasarana");
const fileUpload = require("fastify-file-upload");

module.exports = async function (fastify, opts) {
  fastify.register(sarana_prasarana);
  fastify.register(fileUpload);

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
              data:{
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
                }
              }
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
        }else{
          reply.send({ message: "success", code: 204});
        }

      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }     
    }
  );

  
  fastify.get(
    "/findone/:id",
    {
      schema: {
        description: "This is an endpoint for fetching a sarana_prasarana by id",
        tags: ["sarana_prasarana"],
        params: {
          description: "Find one sarana_prasarana by id",
          type: "object",
          properties: {
            id: { type: "number" },
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
                type: "object",
                properties: {
                  id: { type: "number" },
                  jenis_sarana_prasarana: { type: "string" },
                  status_sarana_prasarana: { type: "string" },
                  kondisi: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.sarana_prasarana.findone(id);

      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500});
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
            jenis_sarana_prasarana: { type: "string" },
            status_sarana_prasarana: { type: "string" },
            jumlah: { type: "number" },
            kondisi: { type: "string" },
            keterangan: { type: "string" },
            dokumentasi: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
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
      const { file} = request.body.file;
      console.log(file);
      reply.send({ file });
    },
  });

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
            id: { type: "number" },
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
            dokumentasi: { type: "string" },
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
      const { jenis_sarana_prasarana,status_sarana_prasarana,jumlah,kondisi,keterangan,dokumentasi, updated_by } = request.body;

      try {
        await fastify.sarana_prasarana.update(
          id,
          jenis_sarana_prasarana,
          status_sarana_prasarana,
          jumlah, 
          kondisi, 
          keterangan,
          dokumentasi,
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
        body: {
          description: "Payload for deleted data sarana_prasarana",
          type: "object",
          properties: {
            deleted_by: { type: "number" },
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
};
