// const fp = require("fastify-plugin");


// const penegakan-perda-perkada = (db) => {


//     const get_jenis_penegakan_perda_perkada = () => {
//         const query = db.any(
//             "SELECT jenis_sarana_prasarana, COUNT( jenis_sarana_prasarana) FROM jenis_sarana_prasarana GROUP BY jenis_sarana_prasarana"
//         );
//         return query;
//     };

//     return {
//         get_penegakan_perda_perkada
//     };
// };

// module.exports = fp((fastify, options, next) => {
//     fastify.decorate("penegakan-perda-perkada", dashboard_penegakan_perda_perkada(fastify.db));
//     next();
// });

// 1