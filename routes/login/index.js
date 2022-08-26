const login = require("../../services/login");
const bcrypt = require("fastify-bcrypt");
const jwtToken = require('fastify-jwt');

module.exports = async function (fastify, opts) {
  fastify.register(login);
  fastify.register(bcrypt, {
    saltWorkFactor: 10,
  });

  fastify.register(jwtToken, {
    secret: '8ziQ3!S6gnFZ'
  });

  fastify.get(
    "/findone",
    {
      schema: {
        description: "This is an endpoint for fetching a login by no_pegawai",
        tags: ["login"],
        params: {
          description: "Find one login by no_pegawai",
          type: "object",
          properties: {
            no_pegawai: { type: "number" },
            kata_sandi: { type: "string" },
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
                  id_pegawai: { type: "string" },
                  no_pegawai: { type: "string" },
                  email: { type: "string" },
                  hak_akses: { type: "string" },
                  status_pengguna: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { no_pegawai, kata_sandi } = request.params;
      const exec = await fastify.login.findone(no_pegawai);

      try {
        if (await fastify.bcrypt.compare(kata_sandi, exec.kata_sandi)) {
          reply.send({ message: "success", code: 200, data: { ...exec } });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500});
      }
    }
  );

  fastify.post(
    "/sign-in",
    {
      schema: {
        description: "This is an endpoint for creating a login",
        tags: ["login"],
        body: {
          description: "Payload for creating a login",
          type: "object",
          properties: {
            no_pegawai: { type: "number" },
            kata_sandi: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "object",
                properties: {
                  id_pegawai: { type: "string" },
                  no_pegawai: { type: "string" },
                  email: { type: "string" },
                  hak_akses: { type: "string" },
                  status_pengguna: { type: "string" },
                },
              },
              api_token: { type: "string"},
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { no_pegawai, kata_sandi } = request.body;
      const exec = await fastify.login.findone(no_pegawai);

     
   
      console.log(kata_sandi)
      console.log(exec.kata_sandi)
      console.log(exec.id_pegawai)

      const objres = {
        id_pegawai: exec.id_pegawai,
        no_pegawai: exec.no_pegawai,
        email: exec.email,
        hak_akses: exec.hak_akses,
        status_pengguna: exec.status_pengguna,
      };

      try {
        if (await fastify.bcrypt.compare(kata_sandi, exec.kata_sandi)) {
          try {
            let token = fastify.jwt.sign({ foo: 'bar' })
            await fastify.login.create_token(exec.id_pegawai, exec.id_pegawai, token);

            reply.send({ message: "success", code: 200, data: objres, api_token: token });
          } catch (error) {
            reply.send({ message: error.message, code: 500 });
          }     
        } else {
          reply.send({ message: "not allowed", code: 204});
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.post(
    "/create",
    {
      schema: {
        description: "This is an endpoint for creating a login",
        tags: ["login"],
        body: {
          description: "Payload for creating a login",
          type: "object",
          properties: {
            id_pegawai: { type: "string" },
            no_pegawai: { type: "string" },
            kata_sandi: { type: "string" },
            email: { type: "string" },
            hak_akses: { type: "string" },
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
      const { id_pegawai, no_pegawai, kata_sandi, email, hak_akses } = request.body;
      const bycript_pass = await fastify.bcrypt.hash(kata_sandi);

      try {
        await fastify.login.create(
          id_pegawai,
          no_pegawai,
          bycript_pass,
          email,
          hak_akses
        );
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update/:no_pegawai",
    {
      schema: {
        description: "This is an endpoint for updating an existing login",
        tags: ["login"],
        params: {
          description: "login by Id and no_pegawai",
          type: "object",
          properties: {
            id: { type: "number" },
            no_pegawai: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a login",
          type: "object",
          properties: {
            kata_sandi: { type: "string" },
            update_by: { type: "string" },
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
      const { no_pegawai } = request.params;
      const { kata_sandi, update_by } = request.body;
      const bycript_pass = await fastify.bcrypt.hash(kata_sandi);

      try {
        await fastify.login.update_password(
          no_pegawai,
          bycript_pass,
          update_by
        );
        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.post(
    "/verify_token",
    {
      schema: {
        description: "This is an endpoint for creating a login",
        tags: ["login"],
        body: {
          description: "Payload for creating a login",
          type: "object",
          properties: {
            api_token: { type: "string" },
          },
        },
        response: {
          201: {
            description: "Success Response",
            type: "object",
            properties: {
              message: { type: "string" },
              code: { type: "string" },
              data: {
                type: "object",
                properties: {
                  id_pegawai: { type: "string" },
                  no_pegawai: { type: "string" },
                  token: { type: "string" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { api_token } = request.body;
      const exec = await fastify.login.find_token(api_token);
      
      try {
        if (exec) {
          reply.send({ message: "success", code: 200, data: exec});
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error, code: 500});
      }
    }
  );

  //   fastify.put(
  //     "/update/:id",
  //     {
  //       schema: {
  //         description:
  //           "This is an endpoint for updating an existing master area dampak risiko",
  //         tags: ["master area dampak risiko"],
  //         params: {
  //           description: "Master area dampak risiko by Id",
  //           type: "object",
  //           properties: {
  //             id: { type: "number" },
  //           },
  //         },
  //         body: {
  //           description: "Payload for updating a master area dampak risiko",
  //           type: "object",
  //           properties: {
  //             area_dampak_risiko_spbe: { type: "string" },
  //           },
  //         },
  //         response: {
  //           200: {
  //             description: "Success Response",
  //             type: "object",
  //             properties: {
  //               id: { type: "number" },
  //               kode: { type: "string" },
  //               area_dampak_risiko_spbe: { type: "string" },
  //             },
  //           },
  //         },
  //       },
  //     },
  //     async (request, reply) => {
  //       const { id } = request.params;
  //       const { area_dampak_risiko_spbe } = request.body;

  //       const exec = await fastify.master_area_dampak_risiko.update(
  //         id,
  //         area_dampak_risiko_spbe
  //       );

  //       return exec;
  //     }
  //   );

  //   fastify.delete(
  //     "/delete/:id",
  //     {
  //       schema: {
  //         description:
  //           "This is an endpoint for DELETING an existing master area dampak risiko.",
  //         tags: ["master area dampak risiko"],
  //         params: {
  //           description: "Master area dampak risiko by Id",
  //           type: "object",
  //           properties: {
  //             id: { type: "number" },
  //           },
  //         },
  //         response: {
  //           204: {
  //             type: "string",
  //             default: "No Content",
  //           },
  //         },
  //       },
  //     },
  //     async (request, reply) => {
  //       const { id } = request.params;
  //       await fastify.master_area_dampak_risiko.del(id);

  //       reply.status(204);
  //     }
  //   );
};
