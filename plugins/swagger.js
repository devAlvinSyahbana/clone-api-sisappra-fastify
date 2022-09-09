const fp = require("fastify-plugin");
const fastify = require("fastify")();

module.exports = fp(async function (fastify, opts) {
  await fastify.register(require("@fastify/swagger"), {
    routePrefix: "/documentation",
    swagger: {
      info: {
        title: "SISAPPRA API",
        description: "SISAPPRA API Documentation",
        version: "0.1.0",
      },
      host: `${process.env.FASTIFY_ADDRESS}:${process.env.PORT}`,
      schemes: ["http"],
      consumes: ["application/json"],
      produces: ["application/json"],
    },
    exposeRoute: true,
  });
});
