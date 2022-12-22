const fp = require("fastify-plugin");

const kepegawaian_pns = (db) => {
  //done
  const autocompliteFill = (qwhere) => {
    const query = db.any(
      "SELECT kpns.id, personil.nama, personil.nrk as no_pegawai FROM public.t_data_pegawai_pns kpns LEFT JOIN public.t_personil personil ON kpns.personil_id = personil.id WHERE kpns.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const getDataUnduh = () => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.nik, kpns.no_kk, kpns.status_perkawinan, kpns.no_hp, kpns.sesuai_ktp_alamat, kpns.sesuai_ktp_rtrw, kpns.sesuai_ktp_provinsi, kpns.sesuai_ktp_kabkota, kpns.sesuai_ktp_kecamatan, kpns.sesuai_ktp_kelurahan, kpns.domisili_alamat, kpns.domisili_rtrw, kpns.domisili_provinsi, kpns.domisili_kabkota, kpns.domisili_kecamatan, kpns.domisili_kelurahan, kpns.kepegawaian_nrk, kpns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, kpns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, kpns.kepegawaian_tempat_tugas, kpns.kepegawaian_subbag_seksi_kecamatan, kpns.kepegawaian_kelurahan, kpns.kepegawaian_status_pegawai, kpns.kepegawaian_no_rekening, kpns.kepegawaian_no_karpeg, kpns.kepegawaian_no_kasirkasur, kpns.kepegawaian_no_taspen, kpns.kepegawaian_npwp, kpns.kepegawaian_no_bpjs_askes, kpns.kepegawaian_tmt_cpns, kpns.kepegawaian_tmt_pns, kpns.kepegawaian_tgl_sk_pns, kpns.kepegawaian_no_sk_pangkat_terakhir, kpns.kepegawaian_tgl_sk_pangkat_terakhir, kpns.kepegawaian_sk_pangkat_terakhir, kpns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_pns kpns LEFT JOIN master_agama ma ON ma.id = kpns.agama LEFT JOIN master_golongan mg ON mg.id = kpns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpns.kepegawaian_pangkat WHERE kpns.is_deleted = 0 ORDER BY kpns.nama ASC"
    );

    return query;
  };

  const getDataUnduhPejabatStruktural = (qwhere) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.kepegawaian_nip, kpns.kepegawaian_nrk, mj.nama as kepegawaian_jabatan, kpns.kepegawaian_tempat_tugas FROM kepegawaian_pns kpns LEFT JOIN master_jabatan mj ON mj.id = kpns.kepegawaian_jabatan WHERE kpns.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const countKeluarga = (id) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM t_keluarga WHERE personil_id = " +
      id
    );

    return query;
  };

  const findPendidikanTerakhir = (id) => {
    const query = db.any(
      "SELECT kpns_pend.* FROM kepegawaian_pns_pendidikan kpns_pend WHERE kpns_pend.is_deleted = 0 AND kpns_pend.id_pegawai = " +
      id +
      " ORDER BY kpns_pend.tgl_ijazah DESC"
    );

    if (query) {
      return query;
    }
    return false;
  };

  const findPendidikan = (id) => {
    const query = db.any(
      "SELECT kpen.* FROM kepegawaian_pns_pendidikan kpen WHERE kpen.is_deleted = 0 AND kpen.id_pegawai = " +
      id +
      " ORDER BY kpen.tgl_ijazah DESC"
    );

    return query;
  };

  const findKeluarga = (id) => {
    const query = db.any(
      "SELECT klgr.id, hub.status as hubungan, klgr.nama, klgr.tempat_lahir, to_char(klgr.tgl_lahir, 'dd Mon YYYY') as tgl_lahir, jk.jenis_kelamin FROM t_keluarga klgr LEFT JOIN m_status_hubungan hub ON klgr.status_hubungan_id = hub.id LEFT JOIN m_j_kelamin jk ON klgr.j_kelamin_id = jk.id WHERE klgr.personil_id = " +
      id
    );

    return query;
  };

  const findoneKeluarga = (id) => {
    const query = db.one(
      "SELECT klgr.id, hub.id as hubungan_id, hub.status as hubungan, klgr.nama, klgr.tempat_lahir, to_char(klgr.tgl_lahir, 'dd Mon YYYY') as tgl_lahir, jk.id as jenis_kelamin_id, jk.jenis_kelamin FROM t_keluarga klgr LEFT JOIN m_status_hubungan hub ON klgr.status_hubungan_id = hub.id LEFT JOIN m_j_kelamin jk ON klgr.j_kelamin_id = jk.id WHERE klgr.id = " +
      id
    );
    if (query) {
      return query;
    }
    return false;
  };

  const findonePendidikan = (id) => {
    const query = db.one(
      "SELECT pend.* FROM kepegawaian_pns_pendidikan pend WHERE pend.is_deleted = 0 AND pend.id = " +
      id
    );
    if (query) {
      return query;
    }
    return false;
  };

  // ^ find
  const find = (limit, offset) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, kpns.agama, kpns.no_hp, kpns.kepegawaian_nrk as no_pegawai, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_pns kpns WHERE kpns.is_deleted = 0 ORDER BY kpns.created_at DESC LIMIT " +
      limit +
      " OFFSET " +
      offset
    );

    return query;
  };

  // ^ filter
  const filter = (limit, offset, qwhere) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, kpns.agama, kpns.no_hp, kpns.kepegawaian_nrk as no_pegawai, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_pns kpns WHERE kpns.is_deleted = 0" +
      qwhere +
      " LIMIT " +
      limit +
      " OFFSET " +
      (parseInt(offset) - 1)
    );

    return query;
  };

  const countAll = () => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_pns WHERE is_deleted = 0"
    );

    return query;
  };

  const countAllFilter = (qwhere) => {
    const query = db.one(
      "SELECT COUNT(kpns.id) as total FROM kepegawaian_pns kpns WHERE kpns.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT kpns.* FROM kepegawaian_pns kpns WHERE kpns.id = $1 AND kpns.is_deleted = 0",
      [id]
    );

    if (query) {
      return query;
    }
    return false;
  };

  const cekByNoPegawai = (id) => {
    const query = db.one(
      "SELECT count(kpns.id) as total FROM kepegawaian_pns kpns WHERE kpns.kepegawaian_nrk = $1 AND kpns.is_deleted = 0",
      [id]
    );

    if (query) {
      return query;
    }
    return false;
  };

  //done
  //untuk sementara foreign key dan tanggal harus diisi
  const update = (
    nama,
    tempat_lahir,
    tgl_lahir,
    status_perkawinan,
    no_hp,
    sesuai_ktp_alamat,
    sesuai_ktp_rt,
    sesuai_ktp_provinsi,
    sesuai_ktp_kabkota,
    sesuai_ktp_kecamatan,
    sesuai_ktp_kelurahan,
    domisili_alamat,
    domisili_rtrw,
    domisili_provinsi,
    domisili_kabkota,
    domisili_kecamatan,
    domisili_kelurahan,
    kepegawaian_nrk,
    kepegawaian_nip,
    kepegawaian_pangkat,
    kepegawaian_golongan,
    kepegawaian_tmtpangkat,
    kepegawaian_pendidikan_pada_sk,
    kepegawaian_jabatan,
    kepegawaian_eselon,
    id_tempat_tugas,
    id_seksi,
    kepegawaian_kelurahan,
    kepegawaian_status_pegawai,
    kepegawaian_no_rekening,
    kepegawaian_no_karpeg,
    kepegawaian_no_kasirkasur,
    kepegawaian_no_taspen,
    kepegawaian_npwp,
    kepegawaian_no_bpjs_askes,
    kepegawaian_tmt_cpns,
    kepegawaian_tmt_pns,
    kepegawaian_tgl_sk_pns,
    kepegawaian_no_sk_pangkat_terakhir,
    kepegawaian_tgl_sk_pangkat_terakhir,
    kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
    kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
    kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
    kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
    updated_by,
    id,
    umur,
    alamat_domisili_personil_id,
    sesuai_ktp_rw,
    sesuai_ktp_rtrw,
  ) => {
    db.one(
      "BEGIN TRANSACTION; UPDATE t_data_pegawai_pns SET nip = $23, pangkat = $24, golongan = $25, tmt_pangkat = $26, pendidikan_sk = $27, jabatan = $28, eselon = $29, id_tempat_tugas = $30, id_seksi = $31, kepegawaian_kelurahan = $32, status_pegawai = $33, nomor_rekening = $34, nomor_karpeg = $35, nomor_karis_karsu = $36, nomor_taspen = $37, npwp = $38, nomor_bpjs_kes = $39, tmt_cpns = $40, kepegawaian_tmt_pns = TO_DATE($41, 'YYYYMMDD'), kepegawaian_tgl_sk_pns = TO_DATE($42, 'YYYYMMDD'), nomor_sk_pangkat = $43, tgl_sk_pangkat = TO_DATE($44, 'YYYYMMDD'), nomor_sertifikat = $45, tgl_sertifikat = TO_DATE($46, 'YYYYMMDD'), kepegawaian_diklat_pol_pp_strutural_no_sertifikat = $47, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat = TO_DATE($48, 'YYYYMMDD'), kepegawaian_diklat_pol_pp_ppns_no_sertifikat = $49, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat = TO_DATE($50, 'YYYYMMDD'),kepegawaian_diklat_fungsional_pol_pp_no_sertifikat = $51, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat = TO_DATE($52, 'YYYYMMDD'), updated_by = $53, updated_at = CURRENT_TIMESTAMP FROM t_data_pegawai_pns dpns, t_personil per  WHERE dpns.id = $54 AND dpns.personil_id = per.id RETURNING dpns.id; UPDATE t_personil set nama = $1, tempat_lahir = $2, tgl_lahir = TO_DATE($3, 'YYYYMMDD'), umur = $55, j_kelamin_id = $4, agama_id = $5, nik = $6, no_kk = $7, status_kawin_id = $8, nohp = $9, alamat_ktp = $10, no_rt = $11, no_rw = $57, provinsi = $12, kab_kota = $13, kecamatan = $14, kelurahan = $15, domisili_rtrw = $17, domisili_provinsi = $18, domisili_kabkota = $19, domisili_kecamatan = $20, domisili_kelurahan = $21 FROM t_data_pegawai_pns dpns, t_personil per  WHERE dpns.id = $54 AND dpns.personil_id = per.id RETURNING per.id; COMMIT;",
      [
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        agama,
        nik,
        no_kk,
        status_perkawinan,
        no_hp,
        sesuai_ktp_alamat,
        sesuai_ktp_rt,
        sesuai_ktp_provinsi,
        sesuai_ktp_kabkota,
        sesuai_ktp_kecamatan,
        kepegawaian_pendidikan_pada_sk,
        kepegawaian_jabatan,
        kepegawaian_eselon,
        id_tempat_tugas,
        id_seksi,
        kepegawaian_kelurahan,
        kepegawaian_status_pegawai,
        kepegawaian_no_rekening,
        kepegawaian_no_karpeg,
        kepegawaian_no_kasirkasur,
        kepegawaian_no_taspen,
        kepegawaian_npwp,
        kepegawaian_no_bpjs_askes,
        kepegawaian_tmt_cpns,
        kepegawaian_tmt_pns,
        kepegawaian_tgl_sk_pns,
        kepegawaian_no_sk_pangkat_terakhir,
        kepegawaian_tgl_sk_pangkat_terakhir,
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
        updated_by,
        id,
        umur,
        alamat_domisili_personil_id,
        sesuai_ktp_rw
      ]
    );
  };


  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_pns SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id,
    };
  };

  const createKeluargaPNS = (
    hubungan,
    nama,
    tempat_lahir,
    tgl_lahir,
    jenis_kelamin,
    id_pegawai
  ) => {
    const query = db.one(
      "INSERT INTO t_keluarga (status_hubungan_id, nama, tempat_lahir, tgl_lahir, j_kelamin_id, personil_id) VALUES (CAST($1 AS INTEGER), $2, $3, TO_DATE($4, 'YYYYMMDD'), CAST($5 AS INTEGER), $6) RETURNING id",
      [hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai]
    );

    return query;
  };


  const updateKeluargaPNS = (
    id,
    hubungan,
    nama,
    tempat_lahir,
    tgl_lahir,
    jenis_kelamin,
    id_pegawai
  ) => {
    db.one(
      "UPDATE t_keluarga SET status_hubungan_id = $1, nama = $2, tempat_lahir = $3, tgl_lahir = TO_DATE($4, 'YYYYMMDD'), j_kelamin_id = $5, personil_id = $6 WHERE id = $7 RETURNING id",
      [hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai, id]
    );
  };

  const delKelPNS = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_pns_keluarga SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  //create pendidikan pns
  const createPendidikanPNS = async (
    jenis_pendidikan,
    nama_sekolah,
    nomor_ijazah,
    tgl_ijazah,
    jurusan,
    fakultas,
    file_ijazah,
    id_pegawai
  ) => {
    const query = await db.one(
      "INSERT INTO kepegawaian_pns_pendidikan (jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, id_pegawai) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
      [
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
      ]
    );

    return query;
  };

  //update pendidikan pns
  const updatePendidikanPNS = (
    id,
    jenis_pendidikan,
    nama_sekolah,
    nomor_ijazah,
    tgl_ijazah,
    jurusan,
    fakultas,
    file_ijazah,
    id_pegawai
  ) => {
    db.one(
      "UPDATE t_pendidikan_formal SET jenis_pendidikan_id = $1, nama_sekolah = $2, nomor_ijazah = $3, tgl_ijazah = $4, jurusan = $5, fakultas = $6, personil_id = $7, WHERE id = $8 RETURNING id",
      [
        jenis_pendidikan,
        nama_sekolah,
        nomor_ijazah,
        tgl_ijazah,
        jurusan,
        fakultas,
        file_ijazah,
        id_pegawai,
        id,
      ]
    );
  };

  //delete pendidikan pns
  const delPendidikanPNS = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_pns_pendidikan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const updateFilePendidikan = (id, updated_by, values) => {
    db.one(
      `UPDATE kepegawaian_pns_pendidikan SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  const updateFile = (id, updated_by, values) => {
    db.one(
      `UPDATE kepegawaian_pns SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  return {
    updateFile,
    cekByNoPegawai,
    updateFilePendidikan,
    autocompliteFill,
    getDataUnduh,
    countKeluarga,
    findPendidikanTerakhir,
    findPendidikan,
    findKeluarga,
    findoneKeluarga,
    findonePendidikan,
    filter,
    countAllFilter,
    countAll,
    find,
    findone,
    update,
    del,
    getDataUnduhPejabatStruktural,
    createKeluargaPNS,
    updateKeluargaPNS,
    delKelPNS,
    createPendidikanPNS,
    updatePendidikanPNS,
    delPendidikanPNS,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_pns", kepegawaian_pns(fastify.db));
  next();
});
