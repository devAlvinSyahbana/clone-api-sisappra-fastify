const sarana_prasarana = require("../../../services/dashboard/sarana-prasarana/sarana-prasarana");

module.exports = async function (fastify, opts) {
    fastify.register(sarana_prasarana);

    // ^  jenis sarana prasarana
    fastify.get(
        "/sum-jenis-sarana_prasarana", {
            schema: {
                description: "This is an endpoint for fetching all sarana prasarana per jenis",
                tags: ["jenis_sarana_prasarana"],
                response: {
                    200: {
                        description: "Success Response",
                        type: "array",
                        properties: {
                            jenis_sarana_prasarana: {
                                type: "string"
                            },
                            count: {
                                type: "number"
                            }
                        },
                    },
                },
            },
        },
        async (request, reply) => {
            const exec = await fastify.jenis_sarana_prasarana.get_jenis_sarana_prasarana();
            console.log("ini loh console", exec)
            reply.code(200).send(exec);
        }
    );

};