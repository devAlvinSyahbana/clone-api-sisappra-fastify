const fp = require("fastify-plugin");

const kepegawaian_non_pns = (db) => {
  const autocompliteFill = (qwhere) => {
    const query = db.any(
      "SELECT kpnns.id, personil.nama, kpnns.nptt as no_pegawai FROM public.t_data_pegawai_nptt kpnns LEFT JOIN public.t_personil personil ON kpnns.personil_id = personil.id WHERE kpnns.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const getDataUnduh = (status) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpnns.nik, kpnns.no_kk, kpnns.status_perkawinan, kpnns.no_hp, kpnns.sesuai_ktp_alamat, kpnns.sesuai_ktp_rtrw, kpnns.sesuai_ktp_provinsi, kpnns.sesuai_ktp_kabkota, kpnns.sesuai_ktp_kecamatan, kpnns.sesuai_ktp_kelurahan, kpnns.domisili_alamat, kpnns.domisili_rtrw, kpnns.domisili_provinsi, kpnns.domisili_kabkota, kpnns.domisili_kecamatan, kpnns.domisili_kelurahan, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, kpnns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, kpnns.kepegawaian_tempat_tugas, kpnns.kepegawaian_subbag_seksi_kecamatan, kpnns.kepegawaian_kelurahan, kpnns.kepegawaian_status_pegawai, kpnns.kepegawaian_no_rekening, kpnns.kepegawaian_no_karpeg, kpnns.kepegawaian_no_kasirkasur, kpnns.kepegawaian_no_taspen, kpnns.kepegawaian_npwp, kpnns.kepegawaian_no_bpjs_askes, kpnns.kepegawaian_tmt_cpns, kpnns.kepegawaian_tmt_pns, kpnns.kepegawaian_tgl_sk_pns, kpnns.kepegawaian_no_sk_pangkat_terakhir, kpnns.kepegawaian_tgl_sk_pangkat_terakhir, kpnns.kepegawaian_sk_pangkat_terakhir, kpnns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama ma ON ma.id = kpnns.agama LEFT JOIN master_golongan mg ON mg.id = kpnns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpnns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpnns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpnns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpnns.kepegawaian_pangkat WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
        status +
        "' ORDER BY kpnns.nama ASC"
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
      "SELECT jenis_pendidikan FROM kepegawaian_non_pns_pendidikan WHERE is_deleted = 0 AND id_pegawai = " +
      id +
      " ORDER BY tgl_ijazah DESC"
    );

    if (query) {
      return query;
    }
    return false;
  };

  const findPendidikan = (id) => {
    const query = db.any(
      "SELECT kpen.* FROM kepegawaian_non_pns_pendidikan kpen WHERE kpen.is_deleted = 0 AND kpen.id_pegawai = " +
      id +
      " ORDER BY kpen.tgl_ijazah DESC"
    );

    return query;
  };

  const findonePendidikan = (id) => {
    const query = db.one(
      "SELECT pend.* FROM kepegawaian_non_pns_pendidikan pend WHERE pend.is_deleted = 0 AND pend.id = " +
      id
    );
    if (query) {
      return query;
    }
    return false;
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

  // ^ find
  const find = (limit, offset, status) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, kpnns.agama, kpnns.no_hp, kpnns.kepegawaian_nptt_npjlp as no_pegawai, kpnns.kepegawaian_status_pegawai, kpnns.foto FROM kepegawaian_non_pns kpnns WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
      status +
      "' ORDER BY kpnns.created_at DESC LIMIT " +
      limit +
      " OFFSET " +
      offset
    );

    return query;
  };

  // ^ filter
  const filter = (limit, offset, status, qwhere) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, kpnns.agama, kpnns.no_hp, kpnns.kepegawaian_nptt_npjlp as no_pegawai, kpnns.kepegawaian_status_pegawai, kpnns.foto FROM kepegawaian_non_pns kpnns WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
      status +
      "'" +
      qwhere +
      " LIMIT " +
      limit +
      " OFFSET " +
      (parseInt(offset) - 1)
    );

    return query;
  };

  const countAll = (status) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
      status +
      "'"
    );

    return query;
  };

  const countAllFilter = (status, qwhere) => {
    const query = db.one(
      "SELECT COUNT(kpnns.id) as total FROM kepegawaian_non_pns kpnns WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
      status +
      "'" +
      qwhere
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT kpnns.*, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk FROM kepegawaian_non_pns kpnns WHERE kpnns.id = $1 AND kpnns.is_deleted = 0",
      [id]
    );

    if (query) {
      return query;
    }
    return false;
  };

  const cekByNoPegawai = (id) => {
    const query = db.one(
      "SELECT count(kpnns.id) as total FROM kepegawaian_non_pns kpnns WHERE kpnns.kepegawaian_nptt_npjlp = $1 AND kpnns.is_deleted = 0",
      [id]
    );

    if (query) {
      return query;
    }
    return false;
  };

  const update = (
    kepegawaian_nptt,//nptt
    id,
    ptt_gelombang,
    no_sk_gubernur,
    tgl_kontrak,
    tmt_sampai_dengan,
    tipe_tempat_tugas,
    kepegawaian_tempat_tugas,
    kepegawaian_npwp,
    kepegawaian_no_rekening,
    kepegawaian_no_bpjs_askes,
    no_bpjs_ketenagakerjaan,
    file_path,
    file_path_sk_gubernur,
    id_bidang,
    id_seksi,
    kepegawaian_golongan,
    kepegawaian_jabatan,
    kepegawaian_nrk,
    nama,
    tempat_lahir,
    tgl_lahir,
    nik,
    no_kk,
    status_perkawinan,
    umur,
    no_hp,
    sesuai_ktp_alamat,
    sesuai_ktp_rt,
    sesuai_ktp_rw,
    sesuai_ktp_kelurahan,
    sesuai_ktp_kecamatan,
    sesuai_ktp_kabkota,
    sesuai_ktp_provinsi,
    alamat_domisili_personil_id,
    domisili_alamat,
    domisili_rtrw,
    domisili_provinsi,
    domisili_kabkota,
    domisili_kecamatan,
    domisili_kelurahan,
    updated_by
  ) => {
    db.one(
      "BEGIN TRANSACTION; UPDATE t_data_pegawai_nptt SET nptt = $1, ptt_gelombang = $2, no_skgubernur = $3, tgl_kontrak = TO_DATE($4, YYYYMMDD), tmt_sampai_dengan = $5, tipe_tempat_tugas = $6, id_tempat_tugas = $7, kepegawaian_npwp = $8, norek_dki = $9, no_bpjs_kes = $10, no_bpjs_ketenagakerjaan = $11, file_path = $12, file_path_sk_gubernur = $13, id_bidang = $14, id_seksi = $15, kepegawaian_golongan = $16, kepegawaian_jabatan = $17 FROM t_data_pegawai_nptt nptt, t_personil per  WHERE nptt.id = $54 AND nptt.personil_id = per.id RETURNING nptt.id; UPDATE t_personil set nama = $19, tempat_lahir = $20, tgl_lahir = TO_DATE($21, 'YYYYMMDD'), j_kelamin_id = $22, agama_id = $23 nik = $24, no_kk = $25, status_kawin_id = $26, umur = $27,  nohp = $28, alamat_ktp = $29, no_rt = $30, no_rw = $31, kelurahan = $32, kecamatan = $33, kab_kota = $34, provinsi = $35, domisili_alamat = $37, domisili_rtrw = $38, domisili_provinsi = $39, domisili_kabkota = $40,  domisili_kecamatan = $41, domisili_kelurahan = $42 FROM t_data_pegawai_nptt nptt, t_personil per  WHERE nptt.id = $43 AND nptt.personil_id = per.id RETURNING per.id; COMMIT;",
      [
        kepegawaian_nptt,
        ptt_gelombang,
        no_sk_gubernur,
        tgl_kontrak,
        tmt_sampai_dengan,
        tipe_tempat_tugas,
        kepegawaian_tempat_tugas,
        kepegawaian_npwp,
        kepegawaian_no_rekening,
        kepegawaian_no_bpjs_askes,
        no_bpjs_ketenagakerjaan,
        file_path,
        file_path_sk_gubernur,
        id_bidang,
        id_seksi,
        kepegawaian_golongan,
        kepegawaian_jabatan,
        kepegawaian_nrk,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        agama,
        nik,
        no_kk,
        status_perkawinan,
        umur,
        no_hp,
        sesuai_ktp_alamat,
        sesuai_ktp_rt,
        sesuai_ktp_rw,
        sesuai_ktp_kelurahan,
        sesuai_ktp_kecamatan,
        sesuai_ktp_kabkota,
        sesuai_ktp_provinsi,
        alamat_domisili_personil_id,
        domisili_alamat,
        domisili_rtrw,
        domisili_provinsi,
        domisili_kabkota,
        domisili_kecamatan,
        domisili_kelurahan,
        updated_by,
        id,
      ]
    );
  };


  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_non_pns SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id,
    };
  };

  // create keluarga non pns
  const createKeluargaNonPNS = (
    hubungan,
    nama,
    tempat_lahir,
    tgl_lahir,
    jenis_kelamin,
    id_pegawai
  ) => {
    const query = db.one(
      "INSERT INTO t_keluarga (status_hubungan_id, nama, tempat_lahir, tgl_lahir, j_kelamin_id, personil_id) VALUES (CAST($1 AS INTEGER), $2, $3, TO_DATE($4, 'YYYYMMDD'), CAST($5 AS INTEGER), $6) RETURNING id",
      [
        hubungan,
        nama,
        tempat_lahir,
        tgl_lahir,
        jenis_kelamin,
        id_pegawai,
      ]
    );

    return query;
  };


  const updateKeluargaNonPNS = (id, hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai) => {
    db.one(
      "UPDATE t_keluarga SET status_hubungan_id = $1, nama = $2, tempat_lahir = $3, tgl_lahir = $4, j_kelamin_id = $5, personil_id = $6 WHERE id = $7 RETURNING id",
      [hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai, id]
    );
  };


  const delKelNonPNS = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_non_pns_keluarga SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  //create pendidikan non pns
  const createPendidikanNonPNS = (
    jenis_pendidikan,
    nama_sekolah,
    nomor_ijazah,
    tgl_ijazah,
    jurusan,
    fakultas,
    file_ijazah,
    id_pegawai
  ) => {
    const query = db.one(
      "INSERT INTO kepegawaian_non_pns_pendidikan (jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, id_pegawai) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
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

  //update pendidikan non pns
  const updatePendidikanNonPNS = (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas,  id_pegawai) => {
    db.one(
      "UPDATE t_pendidikan_formal SET jenis_pendidikan_id = $1, nama_sekolah = $2, nomor_ijazah = $3, tgl_ijazah = $4, jurusan = $5, fakultas = $6, personil_id = $7, WHERE id = $8 RETURNING id",
      [jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas,  id_pegawai, id]
    );
  };


  //delete pendidikan non pns
  const delPendidikanNonPNS = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_non_pns_pendidikan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  const updateFilePendidikan = (id, updated_by, values) => {
    db.one(
      `UPDATE kepegawaian_non_pns_pendidikan SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  const updateFile = (id, updated_by, values, status) => {
    db.one(
      `UPDATE kepegawaian_non_pns SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} AND kepegawaian_status_pegawai = '${status}' RETURNING id`
    );
  };

  return {
    updateFile,
    updateFilePendidikan,
    cekByNoPegawai,
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
    createKeluargaNonPNS,
    updateKeluargaNonPNS,
    delKelNonPNS,
    createPendidikanNonPNS,
    updatePendidikanNonPNS,
    delPendidikanNonPNS,
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_non_pns", kepegawaian_non_pns(fastify.db));
  next();
});
