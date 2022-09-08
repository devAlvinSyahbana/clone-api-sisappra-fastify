const { default: fastify } = require("fastify");
const uploadRoutes = require("./routes/upload/uploadRoutes");
fastify.register (uploadRoutes.routes);