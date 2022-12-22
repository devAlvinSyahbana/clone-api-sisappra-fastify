const fp = require("fastify-plugin");

const kepegawaian_pns = (db) => {
  const autocompliteFill = (qwhere) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.kepegawaian_nrk as no_pegawai FROM kepegawaian_pns kpns WHERE kpns.is_deleted = 0" +
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
      "SELECT COUNT(id) as total FROM kepegawaian_pns_keluarga WHERE is_deleted = 0 AND id_pegawai = " +
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
      "SELECT klgr.id, klgr.hubungan, klgr.nama, klgr.tempat_lahir, klgr.tgl_lahir, CASE WHEN klgr.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin FROM kepegawaian_pns_keluarga klgr WHERE klgr.is_deleted = 0 AND klgr.id_pegawai = " +
      id
    );

    return query;
  };

  const findoneKeluarga = (id) => {
    const query = db.one(
      "SELECT klgr.* FROM kepegawaian_pns_keluarga klgr WHERE klgr.is_deleted = 0 AND klgr.id = " +
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

  const update = (
    id,
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
    sesuai_ktp_rtrw,
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
    kepegawaian_tempat_tugas,
    kepegawaian_subbag_seksi_kecamatan,
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
    updated_by
  ) => {
    db.one(
      "UPDATE kepegawaian_pns SET nama = $1, tempat_lahir = $2, tgl_lahir = $3, jenis_kelamin = $4, agama = $5, nik = $6, no_kk = $7, status_perkawinan = $8, no_hp = $9, sesuai_ktp_alamat = $10, sesuai_ktp_rtrw = $11, sesuai_ktp_provinsi = $12, sesuai_ktp_kabkota = $13, sesuai_ktp_kecamatan = $14, sesuai_ktp_kelurahan = $15, domisili_alamat = $16, domisili_rtrw = $17, domisili_provinsi = $18, domisili_kabkota = $19, domisili_kecamatan = $20, domisili_kelurahan = $21, kepegawaian_nrk = $22, kepegawaian_nip = $23, kepegawaian_pangkat = $24, kepegawaian_golongan = $25, kepegawaian_tmtpangkat = $26, kepegawaian_pendidikan_pada_sk = $27, kepegawaian_jabatan = $28, kepegawaian_eselon = $29, kepegawaian_tempat_tugas = $30, kepegawaian_subbag_seksi_kecamatan = $31, kepegawaian_kelurahan = $32, kepegawaian_status_pegawai = $33, kepegawaian_no_rekening = $34, kepegawaian_no_karpeg = $35, kepegawaian_no_kasirkasur = $36, kepegawaian_no_taspen = $37, kepegawaian_npwp = $38, kepegawaian_no_bpjs_askes = $39, kepegawaian_tmt_cpns = $40, kepegawaian_tmt_pns = $41, kepegawaian_tgl_sk_pns = $42, kepegawaian_no_sk_pangkat_terakhir = $43, kepegawaian_tgl_sk_pangkat_terakhir = $44, kepegawaian_diklat_pol_pp_dasar_no_sertifikat = $45, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat = $46, kepegawaian_diklat_pol_pp_strutural_no_sertifikat = $47, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat = $48, kepegawaian_diklat_pol_pp_ppns_no_sertifikat = $49, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat = $50, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat = $51, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat = $52, updated_by = $53, updated_at = CURRENT_TIMESTAMP WHERE id = $54 RETURNING id",
      [
        nama,
        tempat_lahir,
        tgl_lahir ? tgl_lahir : null,
        jenis_kelamin,
        agama,
        nik,
        no_kk,
        status_perkawinan,
        no_hp,
        sesuai_ktp_alamat,
        sesuai_ktp_rtrw,
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
        kepegawaian_tmtpangkat ? kepegawaian_tmtpangkat : null,
        kepegawaian_pendidikan_pada_sk,
        kepegawaian_jabatan,
        kepegawaian_eselon,
        kepegawaian_tempat_tugas,
        kepegawaian_subbag_seksi_kecamatan,
        kepegawaian_kelurahan,
        kepegawaian_status_pegawai,
        kepegawaian_no_rekening,
        kepegawaian_no_karpeg,
        kepegawaian_no_kasirkasur,
        kepegawaian_no_taspen,
        kepegawaian_npwp,
        kepegawaian_no_bpjs_askes,
        kepegawaian_tmt_cpns ? kepegawaian_tmt_cpns : null,
        kepegawaian_tmt_pns ? kepegawaian_tmt_pns : null,
        kepegawaian_tgl_sk_pns ? kepegawaian_tgl_sk_pns : null,
        kepegawaian_no_sk_pangkat_terakhir,
        kepegawaian_tgl_sk_pangkat_terakhir
          ? kepegawaian_tgl_sk_pangkat_terakhir
          : null,
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat
          : null,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat
          : null,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat
          : null,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat ?
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat :
        null,
        updated_by,
        id,
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
      "INSERT INTO kepegawaian_pns_keluarga (hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
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
      "UPDATE kepegawaian_pns_keluarga SET hubungan = $1, nama = $2, tempat_lahir = $3, tgl_lahir = $4, jenis_kelamin = $5, id_pegawai = $6, updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
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
      "UPDATE kepegawaian_pns_pendidikan SET jenis_pendidikan = $1, nama_sekolah = $2, nomor_ijazah = $3, tgl_ijazah = $4, jurusan = $5, fakultas = $6, file_ijazah = $7, id_pegawai = $8, updated_at = CURRENT_TIMESTAMP WHERE id = $9 RETURNING id",
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
