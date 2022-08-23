const fp = require("fastify-plugin");
const fastify = require("fastify")();

module.exports = fp(async function (fastify, opts) {
  await fastify.register(require("@fastify/swagger"), {
    routePrefix: "/documentation",
    swagger: {
      info: {
        title: "Manrisk API",
        description: "Manrisk API Documentation",
        version: "0.1.0",
      },
      host: "localhost:3000",
      schemes: ["http"],
      consumes: ["application/json"],
      produces: ["application/json"],
    },
    exposeRoute: true,
  });
});
