const fp = require("fastify-plugin");

const kepegawaian_rekapitulasi = (db) => {
  const jumlah_pegawai_polpp = (tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter_1 = "";
    let filter_2 = "";
    let filter_3 = "";

    if (tempat_tugas != undefined) {
      filter_1 += ` and kp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_2 += ` and knp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${tempat_tugas}%'`;
    }

    if (seksi_kecamatan != undefined) {
      filter_1 += ` and kp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_2 += ` and knp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${seksi_kecamatan}%'`;
    }

    if (kelurahan != undefined) {
      filter_1 += ` and kp.kepegawaian_jabatan = ${kelurahan}`;
      filter_2 += ` and knp.kepegawaian_jabatan = ${kelurahan}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${kelurahan}%'`;
    }

    const query = db.one(
      "select (z.a + y.a) as jmlh_seluruh_pegawai_satpol, z.b as jmlh_seluruh_pns, z.c as jmlh_seluruh_cpns, y.a as jmlh_seluruh_non_pns, y.b as jmlh_seluruh_non_pns_ptt, y.c as jmlh_seluruh_non_pns_pjlp, x.a as jmlh_seluruh_ppns_satpolpp, x.b as jmlh_seluruh_ppns_unit_kerja_lain from( select count(kp.*) as a, count(case when kp.kepegawaian_status_pegawai  = 'PNS' then 1 end) as b, count(case when kp.kepegawaian_status_pegawai  = 'CPNS' then 1 end) as c from kepegawaian_pns kp where kp.is_deleted = 0 " +
        filter_1 +
        " ) as z, ( select  count(knp.*) as a,  count(case when knp.kepegawaian_status_pegawai = 'PTT' then 1 end) as b,  count(case when knp.kepegawaian_status_pegawai = 'PJLP' then 1 end) as c from  kepegawaian_non_pns knp  where  knp.is_deleted = 0  " +
        filter_2 +
        " ) as y, ( select count(case when kp2.skpd = 1 then 1 end) as a, count(case when kp2.skpd != 1 then 1 end) as b from kepegawaian_ppns kp2 where kp2.is_deleted = 0 " +
        filter_3 +
        "  ) as x"
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_pendidikan = (
    tempat_tugas,
    seksi_kecamatan,
    kelurahan
  ) => {
    let filter_1 = "";
    let filter_2 = "";

    if (tempat_tugas != undefined) {
      filter_1 += ` and kp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_2 += ` and knp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
    }

    if (seksi_kecamatan != undefined) {
      filter_1 += ` and kp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_2 += ` and knp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
    }

    if (kelurahan != undefined) {
      filter_1 += ` and kp.kepegawaian_jabatan = ${kelurahan}`;
      filter_2 += ` and knp.kepegawaian_jabatan = ${kelurahan}`;
    }

    const query = db.any(
      "select z.pendidikan, sum(z.jumlah) as jumlah from (select mp.nama as pendidikan, count(kp.id) as jumlah from kepegawaian_pns kp inner join master_pendidikan mp on kp.kepegawaian_pendidikan_pada_sk = mp.id where kp.is_deleted = 0 " +
        filter_1 +
        " group by mp.nama union all select mp.nama as pendidikan, count(knp.id) as jumlah from kepegawaian_non_pns knp inner join master_pendidikan mp on knp.kepegawaian_pendidikan_pada_sk = mp.id where knp.is_deleted = 0 " +
        filter_2 +
        " group by mp.nama) as z group by z.pendidikan"
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_golongan = (
    tempat_tugas,
    seksi_kecamatan,
    kelurahan
  ) => {
    let filter_1 = "";
    let filter_2 = "";
    let filter_3 = "";

    if (tempat_tugas != undefined) {
      filter_1 += ` and kp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_2 += ` and knp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${tempat_tugas}%'`;
    }

    if (seksi_kecamatan != undefined) {
      filter_1 += ` and kp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_2 += ` and knp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${seksi_kecamatan}%'`;
    }

    if (kelurahan != undefined) {
      filter_1 += ` and kp.kepegawaian_jabatan = ${kelurahan}`;
      filter_2 += ` and knp.kepegawaian_jabatan = ${kelurahan}`;
      filter_3 = ` and kp2.wilayah_kerja ilike '%${kelurahan}%'`;
    }

    const query = db.any(
      "select z.golongan, sum(z.jumlah) as jumlah from ( select mg.nama as golongan, count(kp.id) as jumlah from kepegawaian_pns kp inner join master_golongan mg on kp.kepegawaian_golongan = mg.id where kp.is_deleted = 0 " +
        filter_1 +
        " group by mg.nama union all select mg.nama as golongan, count(knp.id) as jumlah from kepegawaian_non_pns knp inner join master_golongan mg on knp.kepegawaian_golongan = mg.id where knp.is_deleted = 0 " +
        filter_2 +
        " group by mg.nama union all select mg.nama as golongan, count(kp2.id) as jumlah from kepegawaian_ppns kp2 inner join master_golongan mg on kp2.pejabat_ppns_golongan = mg.id where kp2.is_deleted = 0 " +
        filter_3 +
        " group by mg.nama) as z group by z.golongan"
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_diklat = (
    tempat_tugas,
    seksi_kecamatan,
    kelurahan
  ) => {
    let filter_1 = "";
    let filter_2 = "";

    if (tempat_tugas != undefined) {
      filter_1 += ` and kp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
      filter_2 += ` and knp.kepegawaian_tempat_tugas = ${tempat_tugas}`;
    }

    if (seksi_kecamatan != undefined) {
      filter_1 += ` and kp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
      filter_2 += ` and knp.kepegawaian_subbag_seksi_kecamatan = ${seksi_kecamatan}`;
    }

    if (kelurahan != undefined) {
      filter_1 += ` and kp.kepegawaian_jabatan = ${kelurahan}`;
      filter_2 += ` and knp.kepegawaian_jabatan = ${kelurahan}`;
    }

    const query = db.one(
      `select sum(z.a) as diklat_pol_pp_dasar, sum(z.b) as diklat_pol_pp_strutural, sum(z.c) as diklat_pol_pp_ppns, sum(z.d) as diklat_fungsional_pol_pp, (sum(z.a)+sum(z.b)+sum(z.c)+sum(z.d)) as jmlh_keseluruhan from ( select count(case when (kp.kepegawaian_diklat_pol_pp_dasar_no_sertifikat IS NOT NULL or kp.kepegawaian_diklat_pol_pp_dasar_no_sertifikat != '') then 1 end) as a, count(case when (kp.kepegawaian_diklat_pol_pp_strutural_no_sertifikat IS NOT null or kp.kepegawaian_diklat_pol_pp_strutural_no_sertifikat != '') then 1 end) as b, count(case when (kp.kepegawaian_diklat_pol_pp_ppns_no_sertifikat IS NOT null or kp.kepegawaian_diklat_pol_pp_ppns_no_sertifikat != '') then 1 end) as c, count(case when (kp.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat IS NOT null or kp.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat != '') then 1 end) as d from kepegawaian_pns kp where kp.is_deleted = 0${filter_1} 
      union all 
      select count(case when (knp.kepegawaian_diklat_pol_pp_dasar_no_sertifikat IS NOT null or knp.kepegawaian_diklat_pol_pp_dasar_no_sertifikat != '') then 1 end) as a, count(case when (knp.kepegawaian_diklat_pol_pp_strutural_no_sertifikat IS NOT null or knp.kepegawaian_diklat_pol_pp_strutural_no_sertifikat != '') then 1 end) as b, count(case when (knp.kepegawaian_diklat_pol_pp_ppns_no_sertifikat IS NOT null or knp.kepegawaian_diklat_pol_pp_ppns_no_sertifikat != '') then 1 end) as c, count(case when (knp.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat IS NOT null or knp.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat != '') then 1 end) as d from kepegawaian_non_pns knp where knp.is_deleted = 0${filter_2} ) as z`
    );

    return query;
  };

  const find_rekapitulasi_jft = (
    limit,
    offset,
    nama,
    nrk,
    bidang_wilayah,
    pelaksana,
    jabatan
  ) => {
    let filter = "";

    if (bidang_wilayah != undefined) {
      filter += " and kp.kepegawaian_tempat_tugas = " + bidang_wilayah;
    }
    if (pelaksana != undefined) {
      filter +=
        " and kp.kepegawaian_subbag_seksi_kecamatan = " + pelaksana;
    }
    if (nama != undefined) {
      filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'";
    }
    if (nrk != undefined) {
      filter =
        filter + " and kp.kepegawaian_nrk ilike '" + "%" + nrk + "%" + "'";
    }
    if (jabatan != undefined) {
      filter = filter + " and kp.kepegawaian_jabatan = " + parseInt(jabatan);
    }

    const query = db.any(
      "select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, kp.kepegawaian_tempat_tugas as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' " +
        filter +
        " order by kp.id desc LIMIT " +
        limit +
        " OFFSET " +
        (parseInt(offset) - 1),
      [filter]
    );

    return query;
  };

  const count_rekapitulasi_jft = (
    nama,
    nrk,
    bidang_wilayah,
    pelaksana,
    jabatan
  ) => {
    let filter = "";

    if (bidang_wilayah != undefined) {
      filter += " and kp.kepegawaian_tempat_tugas = '" + bidang_wilayah + "'";
    }
    if (pelaksana != undefined) {
      filter +=
        " and kp.kepegawaian_subbag_seksi_kecamatan = '" + pelaksana + "'";
    }
    if (nama != undefined) {
      filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'";
    }
    if (nrk != undefined) {
      filter =
        filter + " and kp.kepegawaian_nrk ilike '" + "%" + nrk + "%" + "'";
    }
    if (jabatan != undefined) {
      filter = filter + " and kp.kepegawaian_jabatan = " + parseInt(jabatan);
    }

    const query = db.one(
      "select count(kp.id) from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' " +
        filter
    );

    return query;
  };

  const unduh_rekapitulasi_jft = (
    nama,
    nrk,
    bidang_wilayah,
    pelaksana,
    jabatan
  ) => {
    let filter = "";

    if (bidang_wilayah != undefined) {
      filter += " and kp.kepegawaian_tempat_tugas = " + bidang_wilayah;
    }
    if (pelaksana != undefined) {
      filter += " and kp.kepegawaian_subbag_seksi_kecamatan = " + pelaksana;
    }
    if (nama != undefined) {
      filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'";
    }
    if (nrk != undefined) {
      filter =
        filter + " and kp.kepegawaian_nrk ilike '" + "%" + nrk + "%" + "'";
    }
    if (jabatan != undefined) {
      filter = filter + " and kp.kepegawaian_jabatan = " + parseInt(jabatan);
    }

    const query = db.any(
      "select ROW_NUMBER() OVER (ORDER BY kp.id desc) AS nomor, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, mtp.nama as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id where kp.is_deleted = 0 and mj.status = 'JFT' " +
        filter
    );

    return query;
  };

  const update_rekapitulasi_kenaikan_pangkat = (
    id,
    status_kenaikan_pangkat,
    updated_by
  ) => {
    db.one(
      "UPDATE  kepegawaian_pns SET status_kenaikan_pangkat = $1, updated_by = $2, updated_at = CURRENT_TIMESTAMP WHERE id = $3 RETURNING id",
      [status_kenaikan_pangkat, updated_by, id]
    );
  };

  const find_rekapitulasi_kenaikan_pangkat = (
    limit,
    offset,
    nama,
    nrk,
    nip,
    pangkat,
    status_kenaikan_pangkat,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan,
    tahun_jnp
  ) => {
    let filter = "";

    filter = filter_rekapitulasi_kenaikan_pangkat(nama,
      nrk,
      nip,

      pangkat,
      status_kenaikan_pangkat,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan,
      tahun_jnp);

    const query = db.any(
      "select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, mtp.nama as tempat_tugas, mtsp.nama as subbag_seksi_kecamatan, mp.nama as pangkat, mg.nama as golongan, kp.kepegawaian_tmtpangkat as tmt_pangkat, me.nama as eselon, mskp.nama as status_kenaikan_pangkat, (extract( year FROM kp.kepegawaian_tmtpangkat )::int + mskp.masa_naik_pangkat::int) as jadwal_kenaikan_pangkat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_pangkat mp on kp.kepegawaian_pangkat = mp.id left join master_golongan mg on kp.kepegawaian_golongan = mg.id left join master_eselon me on kp.kepegawaian_eselon = me.id left join master_status_kenaikan_pangkat mskp on kp.status_kenaikan_pangkat = mskp.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id left join master_tempat_seksi_pelaksanaan mtsp on kp.kepegawaian_subbag_seksi_kecamatan = mtsp.id where kp.is_deleted = 0 " +
        filter +
        " order by kp.id desc LIMIT " +
        limit +
        " OFFSET " +
        (parseInt(offset) - 1),
      [filter]
    );

    return query;
  };

  const count_rekapitulasi_kenaikan_pangkat = (
    nama,
    nrk,
    nip,
    pangkat,
    status_kenaikan_pangkat,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan,
    tahun_jnp
  ) => {
    let filter = "";

    filter = filter_rekapitulasi_kenaikan_pangkat(nama,
      nrk,
      nip,

      pangkat,
      status_kenaikan_pangkat,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan,
      tahun_jnp);

    const query = db.one(
      "select count(kp.id) from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_pangkat mp on kp.kepegawaian_pangkat = mp.id left join master_golongan mg on kp.kepegawaian_golongan = mg.id left join master_eselon me on kp.kepegawaian_eselon = me.id left join master_status_kenaikan_pangkat mskp on kp.status_kenaikan_pangkat = mskp.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id left join master_tempat_seksi_pelaksanaan mtsp on kp.kepegawaian_subbag_seksi_kecamatan = mtsp.id where kp.is_deleted = 0 " +
        filter,
      [filter]
    );

    return query;
  };

  const findone_rekapitulasi_kenaikan_pangkat = (id) => {
    const query = db.one(
      "select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, mtp.nama as tempat_tugas, mtsp.nama as subbag_seksi_kecamatan, mp.nama as pangkat, mg.nama as golongan, kp.kepegawaian_tmtpangkat as tmt_pangkat, me.nama as eselon, mskp.nama as status_kenaikan_pangkat, (extract( year FROM kp.kepegawaian_tmtpangkat )::int + mskp.masa_naik_pangkat::int) as jadwal_kenaikan_pangkat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_pangkat mp on kp.kepegawaian_pangkat = mp.id left join master_golongan mg on kp.kepegawaian_golongan = mg.id left join master_eselon me on kp.kepegawaian_eselon = me.id left join master_status_kenaikan_pangkat mskp on kp.status_kenaikan_pangkat = mskp.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id left join master_tempat_seksi_pelaksanaan mtsp on kp.kepegawaian_subbag_seksi_kecamatan = mtsp.id where kp.is_deleted = 0 and kp.id = " +
        id
    );

    return query;
  };

  const unduh_rekapitulasi_kenaikan_pangkat = (
    nama,
    nrk,
    nip,
    pangkat,
    status_kenaikan_pangkat,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan,
    tahun_jnp
  ) => {
    let filter = "";

    filter = filter_rekapitulasi_kenaikan_pangkat(nama,
      nrk,
      nip,

      pangkat,
      status_kenaikan_pangkat,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan,
      tahun_jnp);

    const query = db.any(
      "select ROW_NUMBER() OVER (ORDER BY kp.id desc), kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, mtp.nama as tempat_tugas, mtsp.nama as subbag_seksi_kecamatan, mp.nama as pangkat, mg.nama as golongan, kp.kepegawaian_tmtpangkat as tmt_pangkat, me.nama as eselon, mskp.nama as status_kenaikan_pangkat, (extract( year FROM kp.kepegawaian_tmtpangkat )::int + mskp.masa_naik_pangkat::int) as jadwal_kenaikan_pangkat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_pangkat mp on kp.kepegawaian_pangkat = mp.id left join master_golongan mg on kp.kepegawaian_golongan = mg.id left join master_eselon me on kp.kepegawaian_eselon = me.id left join master_status_kenaikan_pangkat mskp on kp.status_kenaikan_pangkat = mskp.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id left join master_tempat_seksi_pelaksanaan mtsp on kp.kepegawaian_subbag_seksi_kecamatan = mtsp.id where kp.is_deleted = 0 " +
        filter,
      [filter]
    );

    return query;
  };

  const find_duk_rekapitulasi_pegawai = (
    nama,
    nip,
    nrk_nptt_pjlp,
    status_pegawai,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan,
    limit,
    offset
  ) => {

    let ftr =  filter_duk_rekapitulasi_pegawai(nama,
      nip,
      nrk_nptt_pjlp,
      status_pegawai,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan);

    let filter_1 = ftr.filter_1;
    let filter_2 = ftr.filter_2;

    const query = db.any(
      "select z.* from (select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk_nptt_npjlp, mj.nama as jabatan, kp.kepegawaian_status_pegawai as status_pegawai, mtp.nama as tempat_tugas,  to_char( kp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma.nama as agama, kp.domisili_alamat as alamat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_agama ma on kp.agama = ma.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id where kp.is_deleted = 0" +
        filter_1 +
        "union all select knp.id, knp.nama, knp.kepegawaian_nip, knp.kepegawaian_nptt_npjlp,  mj2.nama as jabatan, knp.kepegawaian_status_pegawai , mtp.nama as tempat_tugas, to_char( kNp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma2.nama as agama, knp.domisili_alamat  from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id left join master_agama ma2 on knp.agama = ma2.id left join master_tempat_pelaksanaan mtp on knp.kepegawaian_tempat_tugas = mtp.id where knp.is_deleted = 0" +
        filter_2 +
        ") as z limit " +
        limit +
        " offset " +
        (parseInt(offset) - 1)
    );

    return query;
  };

  const count_duk_rekapitulasi_pegawai = (
    nama,
    nip,
    nrk_nptt_pjlp,
    status_pegawai,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan
  ) => {

    let ftr =  filter_duk_rekapitulasi_pegawai(nama,
      nip,
      nrk_nptt_pjlp,
      status_pegawai,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan);

    let filter_1 = ftr.filter_1;
    let filter_2 = ftr.filter_2;

    const query = db.one(
      "select count(z.*) from (select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk_nptt_npjlp, mj.nama as jabatan, kp.kepegawaian_status_pegawai as status_pegawai, mtp.nama as tempat_tugas,  to_char( kp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma.nama as agama, kp.domisili_alamat as alamat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_agama ma on kp.agama = ma.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id where kp.is_deleted = 0" +
        filter_1 +
        "union all select knp.id, knp.nama, knp.kepegawaian_nip, knp.kepegawaian_nptt_npjlp,  mj2.nama as jabatan, knp.kepegawaian_status_pegawai , mtp.nama as tempat_tugas, to_char( kNp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma2.nama as agama, knp.domisili_alamat  from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id left join master_agama ma2 on knp.agama = ma2.id left join master_tempat_pelaksanaan mtp on knp.kepegawaian_tempat_tugas = mtp.id where knp.is_deleted = 0" +
        filter_2 +
        ") as z "
    );

    return query;
  };

  const unduh_duk_rekapitulasi_pegawai = (
    nama,
    nip,
    nrk_nptt_pjlp,
    status_pegawai,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan
  ) => {


    let ftr =  filter_duk_rekapitulasi_pegawai(nama,
      nip,
      nrk_nptt_pjlp,
      status_pegawai,
      tempat_tugas,
      seksi_kecamatan,
      jabatan_kelurahan);

    let filter_1 = ftr.filter_1;
    let filter_2 = ftr.filter_2;

    const query = db.any(
      "select ROW_NUMBER() OVER (ORDER BY z.* desc), z.* from (select kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk_nptt_npjlp, mj.nama as jabatan, kp.kepegawaian_status_pegawai as status_pegawai, mtp.nama as tempat_tugas,  to_char( kp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma.nama as agama, kp.domisili_alamat as alamat from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id left join master_agama ma on kp.agama = ma.id left join master_tempat_pelaksanaan mtp on kp.kepegawaian_tempat_tugas = mtp.id where kp.is_deleted = 0" +
        filter_1 +
        "union all select knp.nama, knp.kepegawaian_nip, knp.kepegawaian_nptt_npjlp,  mj2.nama as jabatan, knp.kepegawaian_status_pegawai , mtp.nama as tempat_tugas, to_char( kNp.tgl_lahir, 'DD-MM-YYYY') as tanggal_lahir, ma2.nama as agama, knp.domisili_alamat  from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id left join master_agama ma2 on knp.agama = ma2.id left join master_tempat_pelaksanaan mtp on knp.kepegawaian_tempat_tugas = mtp.id where knp.is_deleted = 0" +
        filter_2 +
        ") as z "
    );

    return query;
  };

  const create_rekapitulasi_duk_pegawai = async (
    nama,
    nrk_nptt_npjlp,
    nip,
    status_pegawai,
    created_by
  ) => {
    let query;

    if (status_pegawai == "PNS" || status_pegawai == "pns") {
      query = db.one(
        "INSERT INTO kepegawaian_pns (nama, kepegawaian_nrk, kepegawaian_nip, kepegawaian_status_pegawai, is_deleted, created_by) VALUES ($1, $2, $3, $4, 0, $5) RETURNING id",
        [nama, nrk_nptt_npjlp, nip, status_pegawai, created_by]
      );
    } else {
      query = db.one(
        "INSERT INTO kepegawaian_non_pns (nama, kepegawaian_nptt_npjlp, kepegawaian_nip, kepegawaian_status_pegawai, is_deleted, created_by) VALUES ($1, $2, $3, $4, 0, $5) RETURNING id",
        [nama, nrk_nptt_npjlp, nip, status_pegawai, created_by]
      );
    }
    return query;
  };

  const del_rekapitulasi_duk_pegawai = async (
    id,
    status_pegawai,
    deleted_by
  ) => {
    let query;

    if (status_pegawai == "PNS" || status_pegawai == "pns") {
      query = db.one(
        "UPDATE kepegawaian_pns SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
        [id, deleted_by]
      );
    } else {
      query = db.one(
        "UPDATE kepegawaian_non_pns SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
        [id, deleted_by]
      );
    }
    return query;
  };

  // ─── PENSIUN ─────────────────────────────────────────────────────────────────

  // ^ find pensiun
  const PensiunFindFilter = (
    nama,
    nrk_nptt_pjlp,
    tempat_tugas,
    seksi_kecamatan,
    status_pegawai,
    tahun_pensiun,
    limit,
    offset
  ) => {
    let filter_1 = "";
    let filter_2 = "";
    let filter_pensiun_1 = "";
    let filter_pensiun_2 = "";
    console.log(nama);
    if (nama != undefined) {
      filter_1 = filter_1 + " and kp.nama ilike '" + "%" + nama + "%" + "'";
      filter_2 = filter_2 + " and knp.nama ilike '" + "%" + nama + "%" + "'";
    }

    if (nrk_nptt_pjlp != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_nrk ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_nptt_npjlp ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
    }

    if (status_pegawai != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
    }

    if (tempat_tugas != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
    }

    if (seksi_kecamatan != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
    }

    if (tahun_pensiun != undefined) {
      filter_pensiun_1 =
        filter_pensiun_1 + " z.tahun_pensiun = " + tahun_pensiun;
      filter_pensiun_2 =
        filter_pensiun_2 + " x.tahun_pensiun = " + tahun_pensiun;
    } else {
      filter_pensiun_1 =
        filter_pensiun_1 +
        " z.tahun_pensiun = date_part('year', now()) or z.tahun_pensiun = (date_part('year', now()) + 1)";
      filter_pensiun_2 =
        filter_pensiun_2 +
        " x.tahun_pensiun = date_part('year', now()) or x.tahun_pensiun = (date_part('year', now()) + 1)";
    }
    console.log(filter_1);
    console.log(filter_2);
    const query = db.any(
      "select y.* from (select z.*from (select kp.nama, kp.kepegawaian_nip as nip,kp.kepegawaian_nrk as nrk_nptt_pjlp,kp.kepegawaian_status_pegawai,mj.nama as jabatan,kp.kepegawaian_tempat_tugas as tempat_tugas,kp.kepegawaian_subbag_seksi_kecamatan as subbag_seksi_kecamatan, kp.tempat_lahir,kp.tgl_lahir,case when kp.kepegawaian_eselon = 1 or kp.kepegawaian_eselon = 2 then (date_part('year', kp.tgl_lahir) + 60) else  (date_part('year', kp.tgl_lahir) + 58) end as tahun_pensiun from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 " +
        filter_1 +
        " ) as z where " +
        filter_pensiun_1 +
        " union select x.*from (select knp.nama, knp.kepegawaian_nip,knp.kepegawaian_nptt_npjlp,knp.kepegawaian_status_pegawai,mj2.nama,knp.kepegawaian_tempat_tugas,knp.kepegawaian_subbag_seksi_kecamatan,knp.tempat_lahir,knp.tgl_lahir,(date_part('year', knp.tgl_lahir) + 56) as tahun_pensiun from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id where knp.is_deleted = 0 " +
        filter_2 +
        " ) as x where " +
        filter_pensiun_2 +
        ") as y ORDER BY tahun_pensiun asc LIMIT " +
        limit +
        " OFFSET " +
        (parseInt(offset) - 1)
    );

    return query;
  };

  const PensiunCount = (
    nama,
    nrk_nptt_pjlp,
    tempat_tugas,
    seksi_kecamatan,
    status_pegawai,
    tahun_pensiun
  ) => {
    let filter_1 = "";
    let filter_2 = "";
    let filter_pensiun_1 = "";
    let filter_pensiun_2 = "";

    if (nama != undefined) {
      filter_1 = filter_1 + " and kp.nama ilike '" + "%" + nama + "%" + "'";
      filter_2 = filter_2 + " and knp.nama ilike '" + "%" + nama + "%" + "'";
    }

    if (nrk_nptt_pjlp != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_nrk ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_nptt_npjlp ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
    }

    if (status_pegawai != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
    }

    if (tempat_tugas != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
    }

    if (seksi_kecamatan != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
    }

    if (tahun_pensiun != undefined) {
      filter_pensiun_1 =
        filter_pensiun_1 + " z.tahun_pensiun = " + tahun_pensiun;
      filter_pensiun_2 =
        filter_pensiun_2 + " x.tahun_pensiun = " + tahun_pensiun;
    } else {
      filter_pensiun_1 =
        filter_pensiun_1 +
        " z.tahun_pensiun = date_part('year', now()) or z.tahun_pensiun = (date_part('year', now()) + 1)";
      filter_pensiun_2 =
        filter_pensiun_2 +
        " x.tahun_pensiun = date_part('year', now()) or x.tahun_pensiun = (date_part('year', now()) + 1)";
    }

    const query = db.one(
      "select count(y.*) from (select z.*from (select kp.nama, kp.kepegawaian_nip as nip,kp.kepegawaian_nrk as no_pegawai,kp.kepegawaian_status_pegawai,mj.nama as jabatan,kp.kepegawaian_tempat_tugas as tempat_tugas,kp.kepegawaian_subbag_seksi_kecamatan as subbag_seksi_kecamatan, kp.tempat_lahir,kp.tgl_lahir,case when kp.kepegawaian_eselon = 1 or kp.kepegawaian_eselon = 2 then (date_part('year', kp.tgl_lahir) + 60) else  (date_part('year', kp.tgl_lahir) + 58) end as tahun_pensiun from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 " +
        filter_1 +
        " ) as z where " +
        filter_pensiun_1 +
        " union all select x.*from (select knp.nama, knp.kepegawaian_nip,knp.kepegawaian_nptt_npjlp,knp.kepegawaian_status_pegawai,mj2.nama,knp.kepegawaian_tempat_tugas,knp.kepegawaian_subbag_seksi_kecamatan,knp.tempat_lahir,knp.tgl_lahir,(date_part('year', knp.tgl_lahir) + 56) as tahun_pensiun from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id where knp.is_deleted = 0 " +
        filter_2 +
        " ) as x where " +
        filter_pensiun_2 +
        ") as y"
    );

    return query;
  };

  const PensiunUnduh = (
    nama,
    nrk_nptt_pjlp,
    tempat_tugas,
    seksi_kecamatan,
    status_pegawai,
    tahun_pensiun
  ) => {
    let filter_1 = "";
    let filter_2 = "";
    let filter_pensiun_1 = "";
    let filter_pensiun_2 = "";

    if (nama != undefined) {
      filter_1 = filter_1 + " and kp.nama ilike '" + "%" + nama + "%" + "'";
      filter_2 = filter_2 + " and knp.nama ilike '" + "%" + nama + "%" + "'";
    }

    if (nrk_nptt_pjlp != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_nrk ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_nptt_npjlp ilike '" +
        "%" +
        nrk_nptt_pjlp +
        "%" +
        "'";
    }

    if (status_pegawai != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_status_pegawai ilike '" +
        "%" +
        status_pegawai +
        "%" +
        "'";
    }

    if (tempat_tugas != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_tempat_tugas ilike '" +
        "%" +
        tempat_tugas +
        "%" +
        "'";
    }

    if (seksi_kecamatan != undefined) {
      filter_1 =
        filter_1 +
        " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
      filter_2 =
        filter_2 +
        " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" +
        "%" +
        seksi_kecamatan +
        "%" +
        "'";
    }

    if (tahun_pensiun != undefined) {
      filter_pensiun_1 =
        filter_pensiun_1 + " z.tahun_pensiun = " + tahun_pensiun;
      filter_pensiun_2 =
        filter_pensiun_2 + " x.tahun_pensiun = " + tahun_pensiun;
    } else {
      filter_pensiun_1 =
        filter_pensiun_1 +
        " z.tahun_pensiun = date_part('year', now()) or z.tahun_pensiun = (date_part('year', now()) + 1)";
      filter_pensiun_2 =
        filter_pensiun_2 +
        " x.tahun_pensiun = date_part('year', now()) or x.tahun_pensiun = (date_part('year', now()) + 1)";
    }

    const query = db.any(
      "select y.* from (select z.*from (select kp.nama, kp.kepegawaian_nip as nip,kp.kepegawaian_nrk as no_pegawai,kp.kepegawaian_status_pegawai,mj.nama as jabatan,kp.kepegawaian_tempat_tugas as tempat_tugas,kp.kepegawaian_subbag_seksi_kecamatan as subbag_seksi_kecamatan, kp.tempat_lahir,kp.tgl_lahir,case when kp.kepegawaian_eselon = 1 or kp.kepegawaian_eselon = 2 then (date_part('year', kp.tgl_lahir) + 60) else  (date_part('year', kp.tgl_lahir) + 58) end as tahun_pensiun from kepegawaian_pns kp left join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 " +
        filter_1 +
        " ) as z where " +
        filter_pensiun_1 +
        " union all select x.*from (select knp.nama, knp.kepegawaian_nip,knp.kepegawaian_nptt_npjlp,knp.kepegawaian_status_pegawai,mj2.nama,knp.kepegawaian_tempat_tugas,knp.kepegawaian_subbag_seksi_kecamatan,knp.tempat_lahir,knp.tgl_lahir,(date_part('year', knp.tgl_lahir) + 56) as tahun_pensiun from kepegawaian_non_pns knp left join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id where knp.is_deleted = 0 " +
        filter_2 +
        " ) as x where " +
        filter_pensiun_2 +
        ") as y ORDER BY tahun_pensiun asc"
    );

    return query;
  };

  // ─── FUNCTION FILTER ─────────────────────────────────────────────────────────────────

  let filter_rekapitulasi_kenaikan_pangkat = (
    nama,
    nrk,
    nip,
    pangkat,
    status_kenaikan_pangkat,
    tempat_tugas,
    seksi_kecamatan,
    jabatan_kelurahan,
    tahun_jnp) => {

    let filter = "";

    if (tempat_tugas != undefined) {
      filter =  filter +  " and kp.kepegawaian_tempat_tugas = " +  tempat_tugas;
    }

    if (seksi_kecamatan != undefined) {
      filter =  filter + " and kp.kepegawaian_subbag_seksi_kecamatan = " + seksi_kecamatan;
    }

    if (jabatan_kelurahan != undefined) {
      filter = filter + " and kp.kepegawaian_jabatan = " + jabatan_kelurahan;
    }
    if (nama != undefined) {
      filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'";
    }
    if (nrk != undefined) {
      filter =
        filter + " and kp.kepegawaian_nrk ilike '" + "%" + nrk + "%" + "'";
    }
    if (nip != undefined) {
      filter =
        filter + " and kp.kepegawaian_nip ilike '" + "%" + nip + "%" + "'";
    }
    if (status_kenaikan_pangkat != undefined) {
      filter =
        filter + " and kp.status_kenaikan_pangkat = " + status_kenaikan_pangkat;
    }
    if (pangkat != undefined) {
      filter = filter + " and kp.kepegawaian_pangkat = " + pangkat;
    }
    if (tahun_jnp != undefined) {
      filter =
        filter +
        " and (extract( year FROM kp.kepegawaian_tmtpangkat )::int + mskp.masa_naik_pangkat::int) = " +
        tahun_jnp;
    }

    return filter;
  }

  let filter_duk_rekapitulasi_pegawai = (
    nama,
    nip,
    nrk_nptt_pjlp,
    status_pegawai,
    tempat_tugas,
    seksi_kecamatan,
    kelurahan) => {

      let filter_1 = "";
      let filter_2 = "";
  
      if (nama != undefined) {
        filter_1 = filter_1 + " and kp.nama ilike '" + "%" + nama + "%" + "'";
        filter_2 = filter_2 + " and knp.nama ilike '" + "%" + nama + "%" + "'";
      }
  
      if (nrk_nptt_pjlp != undefined) {
        filter_1 = filter_1 + " and kp.kepegawaian_nrk ilike '" + "%" + nrk_nptt_pjlp + "%" + "'";
        filter_2 = filter_2 + " and knp.kepegawaian_nptt_npjlp ilike '" + "%" + nrk_nptt_pjlp + "%" + "'";
      }
  
      if (nip != undefined) {
        filter_1 = filter_1 + " and kp.kepegawaian_nip ilike '" + "%" + nip + "%" + "'";
        filter_2 = filter_2 + " and knp.kepegawaian_nip ilike '" + "%" + nip + "%" + "'";
      }
  
      if (status_pegawai != undefined) {
        filter_1 = filter_1 + " and kp.kepegawaian_status_pegawai ilike '" + "%" + status_pegawai + "%" + "'";
        filter_2 = filter_2 + " and knp.kepegawaian_status_pegawai ilike '" + "%" + status_pegawai + "%" + "'";
      }
  
      if (tempat_tugas != undefined) {
        filter_1 =  filter_1 +  " and kp.kepegawaian_tempat_tugas = " +  tempat_tugas;
        filter_2 =  filter_2 +  " and knp.kepegawaian_tempat_tugas = " +  tempat_tugas;
      }
  
      if (seksi_kecamatan != undefined) {
        filter_1 =  filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan = " + seksi_kecamatan;
        filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan = " + seksi_kecamatan;
      }
  
      if (kelurahan != undefined) {
        filter_1 = filter_1 + " and kp.kepegawaian_jabatan = " +  kelurahan;
        filter_2 = filter_2 + " and knp.kepegawaian_jabatan = " + kelurahan;
      }

    return {filter_1, filter_2};
  }

//  ─── RETURN ─────────────────────────────────────────────────────────────────

  return {
    jumlah_pegawai_polpp,
    jumlah_pegawai_polpp_by_pendidikan,
    jumlah_pegawai_polpp_by_golongan,
    jumlah_pegawai_polpp_by_diklat,
    find_rekapitulasi_jft,
    find_duk_rekapitulasi_pegawai,
    find_rekapitulasi_kenaikan_pangkat,
    findone_rekapitulasi_kenaikan_pangkat,
    count_rekapitulasi_jft,
    count_rekapitulasi_kenaikan_pangkat,
    count_duk_rekapitulasi_pegawai,
    unduh_rekapitulasi_jft,
    unduh_rekapitulasi_kenaikan_pangkat,
    unduh_duk_rekapitulasi_pegawai,
    create_rekapitulasi_duk_pegawai,
    update_rekapitulasi_kenaikan_pangkat,
    del_rekapitulasi_duk_pegawai,
    PensiunUnduh,
    PensiunCount,
    PensiunFindFilter,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_rekapitulasi",
    kepegawaian_rekapitulasi(fastify.db)
  );
  next();
});
