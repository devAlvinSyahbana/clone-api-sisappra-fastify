"use strict";

const path = require("path");
const AutoLoad = require("@fastify/autoload");
const multer = require("fastify-multer");

module.exports = async function (fastify, opts) {
  // register multer content parser
  fastify.register(multer.contentParser);
  // setting prefix
  fastify.register(require("@fastify/static"), {
    root: path.join(__dirname, "uploads"),
    prefix: "/uploads/", // optional: default '/'
  });

  // setting up cors
  fastify.register(require("@fastify/cors"), (instance) => {
    return (req, callback) => {
      const corsOptions = {
        // This is NOT recommended for production as it enables reflection exploits
        origin: true,
      };

      // do not include CORS headers for requests from localhost
      if (/^localhost$/m.test(req.headers.origin)) {
        corsOptions.origin = false;
      }

      // callback expects two parameters: error and options
      callback(null, corsOptions);
    };
  });

  // Place here your custom code!

  // Do not touch the following lines

  // This loads all plugins defined in plugins
  // those should be support plugins that are reused
  // through your application
  fastify.register(AutoLoad, {
    dir: path.join(__dirname, "plugins"),
    options: Object.assign({}, opts),
  });

  // This loads all plugins defined in routes
  // define your routes in one of these
  fastify.register(AutoLoad, {
    dir: path.join(__dirname, "routes"),
    options: Object.assign({}, opts),
  });
};
