const fp = require("fastify-plugin");

const kepegawaian_rekapitulasi = (db) => {
  const jumlah_pegawai_polpp = (tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter_1 = ""
    let filter_2 = ""
    let filter_3 = ""
    
    if(tempat_tugas != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_3 = filter_3 + " and kp2.wilayah_kerja ilike '" + "%" + tempat_tugas + "'";
    }
    
    if(seksi_kecamatan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    }
    
    if(kelurahan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    }
    const query = db.one(
      "select (z.a + y.a) as jmlh_seluruh_pegawai_satpol, z.b as jmlh_seluruh_pns, z.c as jmlh_seluruh_cpns, y.a as jmlh_seluruh_non_pns, y.b as jmlh_seluruh_non_pns_ptt, y.c as jmlh_seluruh_non_pns_pjlp, x.a as jmlh_seluruh_ppns_satpolpp, x.b as jmlh_seluruh_ppns_unit_kerja_lain from( select count(kp.*) as a, count(case when kp.kepegawaian_status_pegawai  = 'PNS' then 1 end) as b, count(case when kp.kepegawaian_status_pegawai  = 'CPNS' then 1 end) as c from kepegawaian_pns kp where kp.is_deleted = 0 " + filter_1 + " ) as z, ( select  count(knp.*) as a,  count(case when knp.kepegawaian_status_pegawai = 'PTT' then 1 end) as b,  count(case when knp.kepegawaian_status_pegawai = 'PJLP' then 1 end) as c from  kepegawaian_non_pns knp  where  knp.is_deleted = 0  " + filter_2 + " ) as y, ( select count(case when kp2.skpd = 1 then 1 end) as a, count(case when kp2.skpd != 1 then 1 end) as b from kepegawaian_ppns kp2 where kp2.is_deleted = 0 " + filter_3 + "  ) as x",
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_pendidikan = (tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter_1 = ""
    let filter_2 = ""
    
    if(tempat_tugas != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    }
    
    if(seksi_kecamatan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    }
    
    if(kelurahan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    }

    const query = db.any(
        "select z.pendidikan, sum(z.jumlah) as jumlah from (select mp.nama as pendidikan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_pendidikan mp on kp.kepegawaian_pendidikan_pada_sk = mp.id where kp.is_deleted = 0 " + filter_1 +" group by mp.nama union all select mp.nama as pendidikan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_pendidikan mp on knp.kepegawaian_pendidikan_pada_sk = mp.id where knp.is_deleted = 0 " + filter_2 + " group by mp.nama) as z group by z.pendidikan",
    );

    return query;
  };


  const jumlah_pegawai_polpp_by_golongan = (tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter_1 = ""
    let filter_2 = ""
    let filter_3 = ""
    
    if(tempat_tugas != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_3 = filter_3 + " and kp2.wilayah_kerja ilike '" + tempat_tugas + "'";
    }
    
    if(seksi_kecamatan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    }
    
    if(kelurahan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    }

    const query = db.any(
      "select z.golongan, sum(z.jumlah) as jumlah from ( select mg.nama as golongan, count(kp.*) as jumlah from kepegawaian_pns kp inner join master_golongan mg on kp.kepegawaian_golongan = mg.id where kp.is_deleted = 0 " + filter_1 + " group by mg.nama union all select mg.nama as golongan, count(knp.*) as jumlah from kepegawaian_non_pns knp inner join master_golongan mg on knp.kepegawaian_golongan = mg.id where knp.is_deleted = 0 " + filter_2 + " group by mg.nama union all select mg.nama as golongan, count(kp2.*) as jumlah from kepegawaian_ppns kp2 inner join master_golongan mg on kp2.pejabat_ppns_golongan = mg.id where kp2.is_deleted = 0 " + filter_3 + " group by mg.nama) as z group by z.golongan",
    );

    return query;
  };

  const jumlah_pegawai_polpp_by_diklat = (tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter_1 = ""
    let filter_2 = ""
    
    if(tempat_tugas != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    }
    
    if(seksi_kecamatan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan ilike '" + "%" + seksi_kecamatan + "%" + "'";
    }
    
    if(kelurahan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" + "'";
    }

    const query = db.one(
        "select sum(z.a) as diklat_pol_pp_dasar, sum(z.b) as diklat_pol_pp_strutural, sum(z.c) as diklat_pol_pp_ppns, sum(z.d) as diklat_fungsional_pol_pp, (sum(z.a)+sum(z.b)+sum(z.c)+sum(z.d)) as jmlh_keseluruhan from ( select count(case when kp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when kp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when kp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when kp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_pns kp where kp.is_deleted = 0 " + filter_1 +" union all select count(case when knp.kepegawaian_diklat_pol_pp_dasar = 'true' then 1 end) as a, count(case when knp.kepegawaian_diklat_pol_pp_strutural = 'true' then 1 end) as b, count(case when knp.kepegawaian_diklat_pol_pp_ppns = 'true' then 1 end) as c, count(case when knp.kepegawaian_diklat_fungsional_pol_pp = 'true' then 1 end) as d from kepegawaian_non_pns knp where knp.is_deleted = 0 " + filter_2 + " ) as z",
    );

    return query;
  };

  const find_rekapitulasi_jft = (limit, offset,nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%"  +tempat_tugas + "%" + "'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + seksi_kecamatan + "%" + "'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '"+ "%"  + kelurahan+ "%" + "'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%"  + nrk + "%" + "'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = "+ jabatan}

    console.log(filter)


    const query = db.any(
      "select kp.id, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, kp.kepegawaian_tempat_tugas as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' "+filter+" order by kp.id desc LIMIT " + limit + " OFFSET " + (parseInt(offset) - 1),
      [filter]
    );

    return query;
  };

  const count_rekapitulasi_jft = (nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%"  + tempat_tugas + "%" + "'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '"+ "%"  + seksi_kecamatan+ "%" + "'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan+ "%" + "'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%" + nama + "%" + "'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%"  + nrk + "%" + "'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = " + jabatan}

    const query = db.one(
      "select count(kp.id) from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' "+
      filter,
    );

    return query;
  };

  const unduh_rekapitulasi_jft = (nama, nrk, jabatan, tempat_tugas, seksi_kecamatan, kelurahan) => {
    let filter = "";

    if (tempat_tugas != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%"  + tempat_tugas + "%" +  "'"}
    if (seksi_kecamatan != undefined){filter = filter + " and kp.kepegawaian_tempat_tugas ilike '" + "%"  + seksi_kecamatan + "%" +  "'"}
    if (kelurahan != undefined){filter = filter + " and kp.kepegawaian_kelurahan ilike '" + "%" + kelurahan + "%" +  "'"}
    if (nama != undefined){filter = filter + " and kp.nama ilike '" + "%" + nama + "%" +  "'"}
    if (nrk != undefined){filter = filter + " and kp.kepegawaian_nrk ilike '" + "%"  + nrk + "%" +  "'"}
    if (jabatan != undefined){filter = filter + " and kp.kepegawaian_jabatan = " + jabatan}

    const query = db.any(
        "select ROW_NUMBER() OVER (ORDER BY kp.id desc) AS nomor, kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk, mj.nama as jabatan, kp.kepegawaian_tempat_tugas as tempat_tugas from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id where kp.is_deleted = 0 and mj.status = 'JFT' " +
        filter,
    );

    return query;
  };

  const duk_rekapitulasi_pegawai = (nama, nip, nrk_nptt_pjlp, status_pegawai, tempat_tugas, seksi_kecamatan, kelurahan, limit, offset) => {
    let filter_1 = ""
    let filter_2 = ""

    if(nama != undefined){
      filter_1 = filter_1 + " and kp.nama ilike '" + "%" + nama + "%" + "'";
      filter_2 = filter_2 + " and knp.nama ilike '"+ "%"  + nama + "%" + "'";
    }

    if( nrk_nptt_pjlp != undefined){
      filter_1 = filter_1 + " and kp.kepegawaian_nrk ilike '" + "%" +  nrk_nptt_pjlp + "%" + "'";
      filter_2 = filter_2 + " and knp.kepegawaian_nptt_npjlp ilike '" + "%" +  nrk_nptt_pjlp + "%" + "'";
    }

    if( nip != undefined){
      filter_1 = filter_1 + " and kp.kepegawaian_nip ilike '"+ "%"  +  nip + "%" + "'";
      filter_2 = filter_2 + " and knp.kepegawaian_nip ilike '"+ "%"  +  nip + "%" + "'";
    }

    if( status_pegawai != undefined){
      filter_1 = filter_1 + " and kp.kepegawaian_status_pegawai ilike '"+ "%"  +  status_pegawai + "%" + "'";
      filter_2 = filter_2 + " and knp.kepegawaian_status_pegawai ilike '" + "%" +  status_pegawai + "%" + "'";
    }
    
    if(tempat_tugas != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_tempat_tugas ilike '" + "%" + tempat_tugas + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_tempat_tugas ilike '" + "%"  + tempat_tugas + "%" + "'";
    }
    
    if(seksi_kecamatan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_subbag_seksi_kecamatan ilike '"+ "%"  + seksi_kecamatan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_subbag_seksi_kecamatan ilike '"+ "%"  + seksi_kecamatan + "%" + "'";
    }
    
    if(kelurahan != undefined){
    filter_1 = filter_1 + " and kp.kepegawaian_kelurahan ilike '"+ "%"  + kelurahan + "%" + "'";
    filter_2 = filter_2 + " and knp.kepegawaian_kelurahan ilike '"+ "%"  + kelurahan + "%" + "'";
    }

    const query = db.any(
      "select z.* from (select kp.nama, kp.kepegawaian_nip as nip, kp.kepegawaian_nrk as nrk_nptt_npjlp, mj.nama as jabatan, kp.kepegawaian_status_pegawai as status_pegawai, kp.kepegawaian_tempat_tugas as tempat_tugas, kp.tgl_lahir as tanggal_lahir, ma.nama as agama, kp.domisili_alamat as alamat from kepegawaian_pns kp inner join master_jabatan mj on kp.kepegawaian_jabatan = mj.id inner join master_agama ma on kp.agama = ma.id where kp.is_deleted = 0"+
      filter_1 + "union all select knp.nama, knp.kepegawaian_nip, knp.kepegawaian_nptt_npjlp,  mj2.nama as jabatan, knp.kepegawaian_status_pegawai , knp.kepegawaian_tempat_tugas , knp.tgl_lahir as tanggal_lahir, ma2.nama as agama, knp.domisili_alamat  from kepegawaian_non_pns knp inner join master_jabatan mj2 on knp.kepegawaian_jabatan = mj2.id inner join master_agama ma2 on knp.agama = ma2.id where knp.is_deleted = 0" + filter_2 +
      ") as z limit " + limit +  " offset " + (parseInt(offset) - 1),
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
    count_rekapitulasi_jft,
    duk_rekapitulasi_pegawai
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate(
    "kepegawaian_rekapitulasi",
    kepegawaian_rekapitulasi(fastify.db)
  );
  next();
});