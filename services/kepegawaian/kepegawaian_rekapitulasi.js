const fp = require("fastify-plugin");

const kepegawaian_rekapitulasi = (db) => {
  const jumlah_pegawai_polpp = (provnsi, kota, kecamatan, kelurahan) => {
    if (provnsi == undefined){provnsi = ""}
    if (kota == undefined){kota = ""}
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    provnsi = "%"+provnsi;
    kota = "%"+kota;
    kecamatan = "%"+kecamatan;
    kelurahan = "%"+kelurahan;

    const query = db.one(
      "select (count(kp.id) + count(knp.*)) as jmlh_seluruh_pegawai_satpol, count(kp.*) as jmlh_seluruh_pns, count(kp.*) as seluruh_cpns, count(knp.*) as jmlh_seluruh_non_pns, count(case when knp.kepegawaian_status_pegawai = 'PTT' then 1 end) as jmlh_seluruh_non_pns_ptt, count(case when knp.kepegawaian_status_pegawai = 'PJLP' then 1 end) as jmlh_seluruh_non_pns_pjlp, count(kp.*) as seluruh_ppns_satpolpp, count(kp.*) as jmlh_seluruh_ppns_unit_kerja_lain from kepegawaian_pns kp, kepegawaian_non_pns knp where kp.is_deleted = 0 and kp.domisili_provinsi ilike $1 and kp.domisili_kabkota ilike $2 and kp.domisili_kecamatan ilike $3 and kp.domisili_kelurahan ilike $4 and knp.is_deleted = 0 and knp.domisili_provinsi ilike $1 and knp.domisili_kabkota ilike $2 and knp.domisili_kecamatan ilike $3 and knp.domisili_kelurahan ilike $4",
      [provnsi, kota, kecamatan, kelurahan]
    );

    return query;
  };
  

  return {
    jumlah_pegawai_polpp
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_rekapitulasi",
    kepegawaian_rekapitulasi(fastify.db)
  );
  next();
});