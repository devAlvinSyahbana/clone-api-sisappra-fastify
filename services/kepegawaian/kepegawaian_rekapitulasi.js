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
      "select (count(kp.id) + count(knp.*)) as jmlh_seluruh_pegawai_satpol, count(case when kp.kepegawaian_status_pegawai  = 'PNS' then 1 end) as seluruh_pns, count(case when kp.kepegawaian_status_pegawai  = 'CPNS' then 1 end) as seluruh_cpns, count(knp.*) as jmlh_seluruh_non_pns, count(case when knp.kepegawaian_status_pegawai = 'PTT' then 1 end) as jmlh_seluruh_non_pns_ptt, count(case when knp.kepegawaian_status_pegawai = 'PJLP' then 1 end) as jmlh_seluruh_non_pns_pjlp, count(kp.*) as seluruh_ppns_satpolpp, count(kp.*) as jmlh_seluruh_ppns_unit_kerja_lain from kepegawaian_pns kp, kepegawaian_non_pns knp where kp.is_deleted = 0 and kp.domisili_provinsi ilike $1 and kp.domisili_kabkota ilike $2 and kp.domisili_kecamatan ilike $3 and kp.domisili_kelurahan ilike $4 and knp.is_deleted = 0 and knp.domisili_provinsi ilike $1 and knp.domisili_kabkota ilike $2 and knp.domisili_kecamatan ilike $3 and knp.domisili_kelurahan ilike $4",
      [provnsi, kota, kecamatan, kelurahan]
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_pendidikan = (provnsi, kota, kecamatan, kelurahan) => {
    if (provnsi == undefined){provnsi = ""}
    if (kota == undefined){kota = ""}
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    provnsi = "%"+provnsi;
    kota = "%"+kota;
    kecamatan = "%"+kecamatan;
    kelurahan = "%"+kelurahan;

    const query = db.any(
        "select z.pendidikan, sum(z.jumlah) as jumlah from (select mp.nama as pendidikan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_pendidikan mp on kp.kepegawaian_pendidikan_pada_sk = mp.id where kp.is_deleted = 0 and kp.domisili_provinsi ilike $1 and kp.domisili_kabkota ilike $2 and kp.domisili_kecamatan ilike $3 and kp.domisili_kelurahan ilike $4 group by mp.nama union all select mp.nama as pendidikan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_pendidikan mp on knp.kepegawaian_pendidikan_pada_sk = mp.id where knp.is_deleted = 0 and knp.domisili_provinsi ilike $1 and knp.domisili_kabkota ilike $2 and knp.domisili_kecamatan ilike $3 and knp.domisili_kelurahan ilike $4 group by mp.nama) as z group by z.pendidikan",
        [provnsi, kota, kecamatan, kelurahan]
    );

    return query;
  };


  const jumlah_pegawai_polpp_by_golongan = (provnsi, kota, kecamatan, kelurahan) => {
    if (provnsi == undefined){provnsi = ""}
    if (kota == undefined){kota = ""}
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    provnsi = "%"+provnsi;
    kota = "%"+kota;
    kecamatan = "%"+kecamatan;
    kelurahan = "%"+kelurahan;

    const query = db.any(
      "select z.golongan, sum(z.jumlah) as jumlah from ( select mg.nama as golongan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_golongan mg on kp.kepegawaian_golongan = mg.id where kp.is_deleted = 0 and kp.domisili_provinsi ilike $1 and kp.domisili_kabkota ilike $2 and kp.domisili_kecamatan ilike $3 and kp.domisili_kelurahan ilike $4 group by mg.nama union all select mg.nama as golongan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_golongan mg on knp.kepegawaian_golongan = mg.id where knp.is_deleted = 0 and knp.domisili_provinsi ilike $1 and knp.domisili_kabkota ilike $2 and knp.domisili_kecamatan ilike $3 and knp.domisili_kelurahan ilike $4 group by mg.nama) as z group by z.golongan",
      [provnsi, kota, kecamatan, kelurahan]
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_diklat = (provnsi, kota, kecamatan, kelurahan) => {
    if (provnsi == undefined){provnsi = ""}
    if (kota == undefined){kota = ""}
    if (kecamatan == undefined){kecamatan = ""}
    if (kelurahan == undefined){kelurahan = ""}

    provnsi = "%"+provnsi;
    kota = "%"+kota;
    kecamatan = "%"+kecamatan;
    kelurahan = "%"+kelurahan;

    const query = db.one(
        "select sum(z.a) as diklat_pol_pp_dasar, sum(z.b) as diklat_pol_pp_strutural, sum(z.c) as diklat_pol_pp_ppns, sum(z.d) as diklat_fungsional_pol_pp, (sum(z.a)+sum(z.b)+sum(z.c)+sum(z.d)) as jmlh_keseluruhan from ( select count(case when kp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when kp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when kp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when kp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_pns kp where kp.is_deleted = 0 and kp.domisili_provinsi ilike $1 and kp.domisili_kabkota ilike $2 and kp.domisili_kecamatan ilike $3 and kp.domisili_kelurahan ilike $4 union all select count(case when knp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when knp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when knp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when knp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_non_pns knp where knp.is_deleted = 0 and knp.domisili_provinsi ilike $1 and knp.domisili_kabkota ilike $2 and knp.domisili_kecamatan ilike $3 and knp.domisili_kelurahan ilike $4) as z",
        [provnsi, kota, kecamatan, kelurahan]
    );

    return query;
  };
  

  return {
    jumlah_pegawai_polpp,
    jumlah_pegawai_polpp_by_pendidikan,
    jumlah_pegawai_polpp_by_golongan,
    jumlah_pegawai_polpp_by_diklat
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_rekapitulasi",
    kepegawaian_rekapitulasi(fastify.db)
  );
  next();
});