const hirarki = require("../../../services/master/struktur_data_hirarki");

module.exports = async function (fastify, opts) {
  fastify.register(hirarki);

  fastify.get(
    "/find-id", {
      schema: {
        description: "This is an endpoint for fetching all struktur data hirarki",
        tags: ["hirarki"],
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number"
                    },
                    parentid: {
                      type: "number"
                    },
                    position_name: {
                      type: "string"
                    },
                    team: {
                      type: "number"
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.hirarki.find();

      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.get(
    "/find/:position_name", {
      schema: {
        description: "This is an endpoint for fetching all struktur data hirarki",
        tags: ["hirarki"],
        params: {
          description: "Find one hirarki by position name",
          type: "object",
          properties: {
            position_name: {
              type: "number"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number"
                    },
                    nama: {
                      type: "string"
                    },
                    position_name: {
                      type: "string"
                    },
                    team: {
                      type: "string"
                    },
                    tempat_lahir: {
                      type: "string"
                    },
                    tanggal_lahir: {
                      type: "string"
                    },
                    nrk: {
                      type: "string"
                    },
                    status_pegawai: {
                      type: "string"
                    },
                    jenis_kelamin: {
                      type: "string"
                    },
                    agama: {
                      type: "string"
                    },
                    image_url: {
                      type: "string"
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        position_name
      } = request.params;
      const exec = await fastify.hirarki.findposition(position_name);
      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  // fastify.get(
  //   "/findone/hirarki/:position_name", {
  //     schema: {
  //       description: "This is an endpoint for fetching a hirarki",
  //       tags: ["struktur data hirarki1"],
  //       params: {
  //         description: "Find one struktur data hirarki1 by id",
  //         type: "object",
  //         properties: {
  //           position_name: {
  //             type: "number"
  //           },
  //         },
  //       },
  //       response: {
  //         200: {
  //           description: "Success Response",
  //           type: "object",
  //           properties: {
  //             message: {
  //               type: "string"
  //             },
  //             code: {
  //               type: "string"
  //             },
  //             data: {
  //               type: "array",
  //               items: {
  //                 type: "object",
  //                 properties: {
  //                   id: {
  //                     type: "number"
  //                   },
  //                   nama: {
  //                     type: "string"
  //                   },
  //                   position_name: {
  //                     type: "string"
  //                   },
  //                   team: {
  //                     type: "string"
  //                   },
  //                   tempat_lahir: {
  //                     type: "string"
  //                   },
  //                   tanggal_lahir: {
  //                     type: "string"
  //                   },
  //                   nrk: {
  //                     type: "string"
  //                   },
  //                   status_pegawai: {
  //                     type: "string"
  //                   },
  //                   jenis_kelamin: {
  //                     type: "string"
  //                   },
  //                   agama: {
  //                     type: "string"
  //                   },
  //                   image_url: {
  //                     type: "string"
  //                   },
  //                 },
  //               },
  //             },
  //           },
  //         },
  //       },
  //     },
  //   },
  //   async (request, reply) => {
  //     const {
  //       position_name
  //     } = request.params;
  //     const exec = await fastify.struktur_data_hirarki.findposition(position_name);

  //     try {
  //       if (exec) {
  //         reply.send({
  //           message: "success",
  //           code: 200,
  //           data: exec
  //         });
  //       } else {
  //         reply.send({
  //           message: "success",
  //           code: 204
  //         });
  //       }
  //     } catch (error) {
  //       reply.send({
  //         message: error,
  //         code: 500
  //       });
  //     }
  //   }
  // );

  fastify.get(
    "/find-by-parent-id/hirarki/:parentid", {
      schema: {
        description: "This is an endpoint for fetching a struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        params: {
          description: "Find struktur data hirarki1 by parent id",
          type: "object",
          properties: {
            parentid: {
              type: "string"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
              data: {
                type: "array",
                items: {
                  type: "object",
                  properties: {
                    id: {
                      type: "number"
                    },
                    parentid: {
                      type: "string"
                    },
                    name: {
                      type: "string"
                    },
                    position_name: {
                      type: "string"
                    },
                    team: {
                      type: "string"
                    },
                    tempat_lahir: {
                      type: "string"
                    },
                    tanggal_lahir: {
                      type: "string"
                    },
                    nrk: {
                      type: "string"
                    },
                    status_pegawai: {
                      type: "string"
                    },
                    jenis_kelamin: {
                      type: "string"
                    },
                    agama: {
                      type: "string"
                    },
                    image_url: {
                      type: "string"
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        parentid
      } = request.params;
      const exec = await fastify.struktur_data_hirarki1.find_by_parentid(parentid);
      console.log(exec)
      try {
        if (exec) {
          reply.send({
            message: "success",
            code: 200,
            data: exec
          });
        } else {
          reply.send({
            message: "success",
            code: 204
          });
        }
      } catch (error) {
        reply.send({
          message: error,
          code: 500
        });
      }
    }
  );

  fastify.post(
    "/create/hirarki", {
      schema: {
        description: "This is an endpoint for creating a struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        body: {
          description: "Payload for creating a struktur data hirarki1",
          type: "object",
          properties: {
            parentid: {
              type: "string"
            },
            name: {
              type: "string"
            },
            position_name: {
              type: "string"
            },
            team: {
              type: "string"
            },
            tempat_lahir: {
              type: "string"
            },
            tanggal_lahir: {
              type: "string"
            },
            nrk: {
              type: "string"
            },
            status_pegawai: {
              type: "string"
            },
            jenis_kelamin: {
              type: "string"
            },
            agama: {
              type: "string"
            },
            image_url: {
              type: "string"
            },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        parentid,
        name,
        position_name,
        team,
        tempat_lahir,
        tanggal_lahir,
        nrk,
        status_pegawai,
        jenis_kelamin,
        agama,
        image_url,
        created_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki1.create(parentid, name, position_name, team, tempat_lahir, tanggal_lahir, nrk, status_pegawai, jenis_kelamin, agama, image_url, created_by);
        reply.send({
          message: "success",
          code: 200
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.put(
    "/update/hirarki/:id", {
      schema: {
        description: "This is an endpoint for updating an existing struktur data hirarki1",
        tags: ["struktur data hirarki1"],
        params: {
          description: "update struktur data hirarki1 by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for updating a struktur data hirarki1",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
            parentid: {
              type: "string"
            },
            name: {
              type: "string"
            },
            position_name: {
              type: "string"
            },
            team: {
              type: "string"
            },
            tempat_lahir: {
              type: "string"
            },
            tanggal_lahir: {
              type: "string"
            },
            nrk: {
              type: "string"
            },
            status_pegawai: {
              type: "string"
            },
            jenis_kelamin: {
              type: "string"
            },
            agama: {
              type: "string"
            },
            image_url: {
              type: "string"
            },
          },
        },
        response: {
          200: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      const {
        parentid,
        name,
        position_name,
        team,
        tempat_lahir,
        tanggal_lahir,
        nrk,
        status_pegawai,
        jenis_kelamin,
        agama,
        image_url,
        updated_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki1.update(id, parentid, name, position_name, team, tempat_lahir, tanggal_lahir, nrk, status_pegawai, jenis_kelamin, agama, image_url, updated_by);
        reply.send({
          message: "success",
          code: 200
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

  fastify.delete(
    "/delete/hirarki/:id", {
      schema: {
        description: "This is an endpoint for DELETING an existing struktur data hirarki1.",
        tags: ["struktur data hirarki1"],
        params: {
          description: "struktur data hirarki1 by Id",
          type: "object",
          properties: {
            id: {
              type: "number"
            },
          },
        },
        body: {
          description: "Payload for deleted data struktur data hirarki1",
          type: "object",
          properties: {
            deleted_by: {
              type: "number"
            },
          },
        },
        response: {
          204: {
            description: "Success Response",
            type: "object",
            properties: {
              message: {
                type: "string"
              },
              code: {
                type: "string"
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const {
        id
      } = request.params;
      const {
        deleted_by
      } = request.body;

      try {
        await fastify.struktur_data_hirarki1.del(id, deleted_by);
        reply.send({
          message: "success",
          code: 204
        });
      } catch (error) {
        reply.send({
          message: error.message,
          code: 500
        });
      }
    }
  );

};