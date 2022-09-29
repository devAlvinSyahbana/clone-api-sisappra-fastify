const fp = require("fastify-plugin");

const kepegawaian_rekapitulasi = (db) => {
  const jumlah_pegawai_polpp = (tempat_tugas, seksi_kecamatan) => {
    if (tempat_tugas == undefined){tempat_tugas = ""}
    if (seksi_kecamatan == undefined){seksi_kecamatan = ""}

    tempat_tugas = "%"+tempat_tugas;
    seksi_kecamatan = "%"+seksi_kecamatan;

    const query = db.one(
      "select (count(kp.id) + count(knp.*)) as jmlh_seluruh_pegawai_satpol, count(case when kp.kepegawaian_status_pegawai  = 'PNS' then 1 end) as jmlh_seluruh_pns, count(case when kp.kepegawaian_status_pegawai  = 'CPNS' then 1 end) as jmlh_seluruh_cpns, count(knp.*) as jmlh_seluruh_non_pns, count(case when knp.kepegawaian_status_pegawai = 'PTT' then 1 end) as jmlh_seluruh_non_pns_ptt, count(case when knp.kepegawaian_status_pegawai = 'PJLP' then 1 end) as jmlh_seluruh_non_pns_pjlp, count(kp.*) as seluruh_ppns_satpolpp, count(kp.*) as jmlh_seluruh_ppns_unit_kerja_lain from kepegawaian_pns kp, kepegawaian_non_pns knp where kp.is_deleted = 0 and kp.kepegawaian_tempat_tugas  ilike $1 and kp.kepegawaian_subbag_seksi_kecamatan ilike $2 and knp.is_deleted = 0 and knp.kepegawaian_tempat_tugas ilike $1 and knp.kepegawaian_subbag_seksi_kecamatan ilike $2",
      [tempat_tugas, seksi_kecamatan]
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_pendidikan = (tempat_tugas, seksi_kecamatan) => {
    if (tempat_tugas == undefined){tempat_tugas = ""}
    if (seksi_kecamatan == undefined){seksi_kecamatan = ""}

    tempat_tugas = "%"+tempat_tugas;
    seksi_kecamatan = "%"+seksi_kecamatan;

    const query = db.any(
        "select z.pendidikan, sum(z.jumlah) as jumlah from (select mp.nama as pendidikan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_pendidikan mp on kp.kepegawaian_pendidikan_pada_sk = mp.id where kp.is_deleted = 0 and kp.kepegawaian_tempat_tugas  ilike $1 and kp.kepegawaian_subbag_seksi_kecamatan ilike $2 group by mp.nama union all select mp.nama as pendidikan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_pendidikan mp on knp.kepegawaian_pendidikan_pada_sk = mp.id where knp.kepegawaian_tempat_tugas ilike $1 and knp.kepegawaian_subbag_seksi_kecamatan ilike $2 group by mp.nama) as z group by z.pendidikan",
        [tempat_tugas, seksi_kecamatan]
    );

    return query;
  };


  const jumlah_pegawai_polpp_by_golongan = (tempat_tugas, seksi_kecamatan) => {
    if (tempat_tugas == undefined){tempat_tugas = ""}
    if (seksi_kecamatan == undefined){seksi_kecamatan = ""}

    tempat_tugas = "%"+tempat_tugas;
    seksi_kecamatan = "%"+seksi_kecamatan;

    const query = db.any(
      "select z.golongan, sum(z.jumlah) as jumlah from ( select mg.nama as golongan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_golongan mg on kp.kepegawaian_golongan = mg.id where kp.is_deleted = 0 and kp.kepegawaian_tempat_tugas  ilike $1 and kp.kepegawaian_subbag_seksi_kecamatan ilike $2 group by mg.nama union all select mg.nama as golongan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_golongan mg on knp.kepegawaian_golongan = mg.id where knp.is_deleted = 0 and knp.kepegawaian_tempat_tugas ilike $1 and knp.kepegawaian_subbag_seksi_kecamatan ilike $2 group by mg.nama) as z group by z.golongan",
      [tempat_tugas, seksi_kecamatan]
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_diklat = (tempat_tugas, seksi_kecamatan) => {
    if (tempat_tugas == undefined){tempat_tugas = ""}
    if (seksi_kecamatan == undefined){seksi_kecamatan = ""}

    tempat_tugas = "%"+tempat_tugas;
    seksi_kecamatan = "%"+seksi_kecamatan;

    const query = db.one(
        "select sum(z.a) as diklat_pol_pp_dasar, sum(z.b) as diklat_pol_pp_strutural, sum(z.c) as diklat_pol_pp_ppns, sum(z.d) as diklat_fungsional_pol_pp, (sum(z.a)+sum(z.b)+sum(z.c)+sum(z.d)) as jmlh_keseluruhan from ( select count(case when kp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when kp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when kp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when kp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_pns kp where kp.is_deleted = 0 and kp.kepegawaian_tempat_tugas  ilike $1 and kp.kepegawaian_subbag_seksi_kecamatan ilike $2 union all select count(case when knp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when knp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when knp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when knp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_non_pns knp where  knp.kepegawaian_tempat_tugas ilike $1 and knp.kepegawaian_subbag_seksi_kecamatan ilike $2 ) as z",
        [tempat_tugas, seksi_kecamatan]
    );

    return query;
  };

  const find_rekapitulasi_jft = (limit, offset,nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" +tempat_tugas +"'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + seksi_kecamatan+"'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan+"'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%"+nama+"'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%" +nrk+"'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = " + jabatan}

    console.log(filter)


    const query = db.any(
      "select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, kp.kepegawaian_tempat_tugas as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' "+filter+" order by kp.id desc LIMIT " + limit + " OFFSET " + (parseInt(offset) - 1),
      [filter]
    );

    return query;
  };

  

  const count_rekapitulasi_jft = (nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" +tempat_tugas+"'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + seksi_kecamatan+"'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan+"'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%" + nama+"'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%" +nrk+"'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = " + jabatan}

    const query = db.one(
      "select count(kp.id) from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' "+
      filter,
    );

    return query;
  };
  const unduh_rekapitulasi_jft = (nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" +tempat_tugas+"'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + seksi_kecamatan+"'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan+"'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%" + nama+"'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%" +nrk+"'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = " + jabatan}

    const query = db.any(
        "select ROW_NUMBER() OVER (ORDER BY kp.id desc) AS nomor, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, kp.kepegawaian_tempat_tugas as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' " +
        filter,
    );

    return query;
  };
  

  return {
    jumlah_pegawai_polpp,
    jumlah_pegawai_polpp_by_pendidikan,
    jumlah_pegawai_polpp_by_golongan,
    jumlah_pegawai_polpp_by_diklat,
    find_rekapitulasi_jft,
    unduh_rekapitulasi_jft,
    count_rekapitulasi_jft
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_rekapitulasi",
    kepegawaian_rekapitulasi(fastify.db)
  );
  next();
});