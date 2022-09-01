const login = require("../../services/login");
const bcrypt = require("fastify-bcrypt");
const jwtToken = require("fastify-jwt");

module.exports = async function (fastify, opts) {
  fastify.register(login);
  fastify.register(bcrypt, {
    saltWorkFactor: 10,
  });
  fastify.register(jwtToken, {
    secret: "8ziQ3!S6gnFZ",
  });

  fastify.get(
    "/find",
    {
      schema: {
        description: "This is an endpoint for fetching all pengguna login",
        tags: ["login"],
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
                    id_pegawai: { type: "string" },
                    no_pegawai: { type: "string" },
                    email: { type: "string" },
                    hak_akses: { type: "number" },
                    status_pengguna: { type: "number" },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const exec = await fastify.login.find();

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
    "/findone/:id",
    {
      schema: {
        description: "This is an endpoint for fetching a login id",
        tags: ["login"],
        params: {
          description: "Find one login id",
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
                  id_pegawai: { type: "string" },
                  no_pegawai: { type: "string" },
                  email: { type: "string" },
                  hak_akses: { type: "number" },
                  status_pengguna: { type: "number" },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { id } = request.params;
      const exec = await fastify.login.findone(id);

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

  fastify.post(
    "/sign-in",
    {
      schema: {
        description: "This is an endpoint for sign-in a login acount",
        tags: ["login"],
        body: {
          description: "Payload for sign-in a login acount",
          type: "object",
          properties: {
            no_pegawai: { type: "string" },
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
                  id: { type: "number" },
                  id_pegawai: { type: "string" },
                  no_pegawai: { type: "string" },
                  email: { type: "string" },
                  hak_akses: { type: "number" },
                  status_pengguna: { type: "number" },
                },
              },
              api_token: { type: "string" },
            },
          },
        },
      },
    },
    async (request, reply) => {
      const { no_pegawai, kata_sandi } = request.body;
      const exec = await fastify.login.findone_sign_in(no_pegawai);

      const objres = {
        id: exec.id,
        id_pegawai: exec.id_pegawai,
        no_pegawai: exec.no_pegawai,
        email: exec.email,
        hak_akses: exec.hak_akses,
        status_pengguna: exec.status_pengguna,
      };

      try {
        if (await fastify.bcrypt.compare(kata_sandi, exec.kata_sandi)) {
          try {
            let token = fastify.jwt.sign({ foo: "bar" });
            await fastify.login.create_token(exec.id, token);

            reply.send({
              message: "success",
              code: 200,
              data: objres,
              api_token: token,
            });
          } catch (error) {
            reply.send({ message: error.message, code: 500 });
          }
        } else {
          reply.send({ message: "not allowed", code: 204 });
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
            hak_akses: { type: "number" },
            created_by: { type: "number" },
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
      const {
        id_pegawai,
        no_pegawai,
        kata_sandi,
        email,
        hak_akses,
        created_by,
      } = request.body;
      const bycript_pass = await fastify.bcrypt.hash(kata_sandi);

      const { jmlh } = await fastify.login.findone_no_pegawai(no_pegawai);

      try {
        if (parseInt(jmlh) == 0) {
          await fastify.login.create(
            id_pegawai,
            no_pegawai,
            bycript_pass,
            email,
            hak_akses,
            created_by
          );

          reply.send({ message: "success", code: 200 });
        } else {
          reply.send({ message: "Already Reported", code: 208 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.post(
    "/verify_token",
    {
      schema: {
        description: "This is an endpoint for verify token a login",
        tags: ["login"],
        body: {
          description: "Payload for verify token a login",
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
                  id_penguna: { type: "string" },
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
          reply.send({ message: "success", code: 200, data: exec });
        } else {
          reply.send({ message: "success", code: 204 });
        }
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update/:id",
    {
      schema: {
        description: "This is an endpoint for updating an existing login",
        tags: ["login"],
        params: {
          description: "update login by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating a login",
          type: "object",
          properties: {
            id_pegawai: { type: "string" },
            no_pegawai: { type: "string" },
            email: { type: "string" },
            hak_akses: { type: "number" },
            status_pengguna: { type: "number" },
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
        id_pegawai,
        no_pegawai,
        email,
        hak_akses,
        status_pengguna,
        updated_by,
      } = request.body;

      try {
        await fastify.login.update(
          id,
          id_pegawai,
          no_pegawai,
          email,
          hak_akses,
          status_pengguna,
          updated_by
        );

        reply.send({ message: "success", code: 200 });
      } catch (error) {
        reply.send({ message: error.message, code: 500 });
      }
    }
  );

  fastify.put(
    "/update-password/:id",
    {
      schema: {
        description:
          "This is an endpoint for updating password an existing login",
        tags: ["login"],
        params: {
          description: "update password login by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for updating password a login",
          type: "object",
          properties: {
            kata_sandi: { type: "string" },
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
      const { kata_sandi, updated_by } = request.body;
      const bycript_pass = await fastify.bcrypt.hash(kata_sandi);
      try {
        await fastify.login.update_password(id, bycript_pass, updated_by);

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
        description: "This is an endpoint for DELETING an existing login.",
        tags: ["login"],
        params: {
          description: "login by Id",
          type: "object",
          properties: {
            id: { type: "number" },
          },
        },
        body: {
          description: "Payload for deleted data login",
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
