const fp = require("fastify-plugin");

const kepegawaian_non_pns = (db) => {
  const autocompliteFill = (qwhere) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.kepegawaian_nptt_npjlp as no_pegawai FROM kepegawaian_non_pns kpnns WHERE kpnns.is_deleted = 0" +
      qwhere
    );

    return query;
  };

  const getDataUnduh = (status) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpnns.nik, kpnns.no_kk, kpnns.status_perkawinan, kpnns.no_hp, kpnns.sesuai_ktp_alamat, kpnns.sesuai_ktp_rtrw, kpnns.sesuai_ktp_provinsi, kpnns.sesuai_ktp_kabkota, kpnns.sesuai_ktp_kecamatan, kpnns.sesuai_ktp_kelurahan, kpnns.domisili_alamat, kpnns.domisili_rtrw, kpnns.domisili_provinsi, kpnns.domisili_kabkota, kpnns.domisili_kecamatan, kpnns.domisili_kelurahan, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, kpnns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, kpnns.kepegawaian_tempat_tugas, kpnns.kepegawaian_subbag_seksi_kecamatan, kpnns.kepegawaian_kelurahan, kpnns.kepegawaian_status_pegawai, kpnns.kepegawaian_no_rekening, kpnns.kepegawaian_no_karpeg, kpnns.kepegawaian_no_kasirkasur, kpnns.kepegawaian_no_taspen, kpnns.kepegawaian_npwp, kpnns.kepegawaian_no_bpjs_askes, kpnns.kepegawaian_tmt_cpns, kpnns.kepegawaian_tmt_pns, kpnns.kepegawaian_tgl_sk_pns, kpnns.kepegawaian_no_sk_pangkat_terakhir, kpnns.kepegawaian_tgl_sk_pangkat_terakhir, kpnns.kepegawaian_sk_pangkat_terakhir, kpnns.kepegawaian_diklat_pol_pp_dasar, kpnns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural, kpnns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns, kpnns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp, kpnns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama ma ON ma.id = kpnns.agama LEFT JOIN master_golongan mg ON mg.id = kpnns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpnns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpnns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpnns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpnns.kepegawaian_pangkat WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
      status +
      "' ORDER BY kpnns.nama ASC"
    );

    return query;
  };

  const countKeluarga = (id) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns_keluarga WHERE id_pegawai = " +
      id
    );

    return query;
  };

  const findPendidikanTerakhir = (id) => {
    const query = db.any(
      "SELECT jenis_pendidikan FROM kepegawaian_non_pns_pendidikan WHERE id_pegawai = " +
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
      "SELECT mpen.nama as jenis_pendidikan, kpen.nama_sekolah, kpen.nomor_ijazah, kpen.tgl_ijazah, kpen.jurusan, kpen.fakultas, kpen.file_ijazah FROM kepegawaian_non_pns_pendidikan kpen LEFT JOIN master_pendidikan mpen ON mpen.id = kpen.jenis_pendidikan WHERE kpen.id_pegawai = " + id
    );

    return query;
  };

  const findKeluarga = (id) => {
    const query = db.any(
      "SELECT klgr.hubungan, klgr.nama, klgr.tempat_lahir, klgr.tgl_lahir, CASE WHEN klgr.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin FROM kepegawaian_non_pns_keluarga klgr WHERE klgr.id_pegawai = " +
      id
    );

    return query;
  };

  // ^ find 
  const find = (limit, offset, status) => {
    const query = db.any(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpnns.no_hp, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_status_pegawai, kpnns.foto FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama ma ON ma.id = CAST (kpnns.agama AS INTEGER) WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
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
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, to_char(kpnns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpnns.no_hp, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_status_pegawai, kpnns.foto FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama ma ON ma.id = CAST (kpnns.agama AS INTEGER) WHERE kpnns.is_deleted = 0 AND kpnns.kepegawaian_status_pegawai = '" +
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
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
      status +
      "'" +
      qwhere
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, kpnns.tgl_lahir, CASE WHEN kpnns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, magama.id as agama_id, magama.nama as agama_name, kpnns.nik, kpnns.no_kk, kpnns.status_perkawinan, kpnns.no_hp, kpnns.sesuai_ktp_alamat, kpnns.sesuai_ktp_rtrw, kpnns.sesuai_ktp_provinsi, kpnns.sesuai_ktp_kabkota, kpnns.sesuai_ktp_kecamatan, kpnns.sesuai_ktp_kelurahan, kpnns.domisili_alamat, kpnns.domisili_rtrw, kpnns.domisili_provinsi, kpnns.domisili_kabkota, kpnns.domisili_kecamatan, kpnns.domisili_kelurahan, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_nip, mpang.id as kepegawaian_pangkat_id, mpang.nama as kepegawaian_pangkat_name, mg.id as kepegawaian_golongan_id, mg.nama as kepegawaian_golongan_name, kpnns.kepegawaian_tmtpangkat, mp.id as kepegawaian_pendidikan_pada_sk_id, mp.nama as kepegawaian_pendidikan_pada_sk_name, mj.id as kepegawaian_jabatan_id, mj.nama as kepegawaian_jabatan_name, mes.id as kepegawaian_eselon_id, mes.nama as kepegawaian_eselon_name, kpnns.kepegawaian_tempat_tugas, kpnns.kepegawaian_subbag_seksi_kecamatan, kpnns.kepegawaian_kelurahan, kpnns.kepegawaian_status_pegawai, kpnns.kepegawaian_no_rekening, kpnns.kepegawaian_no_karpeg, kpnns.kepegawaian_no_kasirkasur, kpnns.kepegawaian_no_taspen, kpnns.kepegawaian_npwp, kpnns.kepegawaian_no_bpjs_askes, kpnns.kepegawaian_tmt_cpns, kpnns.kepegawaian_sk_cpns, kpnns.kepegawaian_tmt_pns, kpnns.kepegawaian_tgl_sk_pns, kpnns.kepegawaian_sk_pns, kpnns.kepegawaian_no_sk_pangkat_terakhir, kpnns.kepegawaian_tgl_sk_pangkat_terakhir, kpnns.kepegawaian_sk_pangkat_terakhir, kpnns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, kpnns.foto FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama magama ON kpnns.agama = magama.id LEFT JOIN master_golongan mg ON mg.id = kpnns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpnns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpnns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpnns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpnns.kepegawaian_pangkat WHERE kpnns.id = $1 AND kpnns.is_deleted = 0",
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

  const create = (nama, telepon, created_by) => {
    const query = db.one(
      "INSERT INTO kontak_pic ( nama, telepon, status_pic, is_deleted, created_by) VALUES ($1, $2, 0, 0, $3) RETURNING id",
      [nama, telepon, created_by]
    );

    return query;
  };

  const update = (id, nama, telepon, updated_by) => {
    db.one(
      "UPDATE kontak_pic SET nama = $1, telepon = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
      [nama, telepon, updated_by, id]
    );
  };

  const del = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_non_pns SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return {
      id
    };
  };

  /* ----------------------------------- duk ---------------------------------- */

  // ^ find duk
  const findDuk = (limit, offset, status) => {
    const query = db.any(
      "SELECT knpns.id, knpns.nama, knpns.tempat_lahir, to_char(knpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN knpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, knpns.nik, knpns.no_kk, knpns.status_perkawinan, knpns.no_hp, knpns.sesuai_ktp_alamat, knpns.sesuai_ktp_rtrw, knpns.sesuai_ktp_provinsi, knpns.sesuai_ktp_kabkota, knpns.sesuai_ktp_kecamatan, knpns.sesuai_ktp_kelurahan, knpns.domisili_alamat, knpns.domisili_rtrw, knpns.domisili_provinsi, knpns.domisili_kabkota, knpns.domisili_kecamatan, knpns.domisili_kelurahan, knpns.kepegawaian_nptt_npjlp, knpns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, knpns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, knpns.kepegawaian_tempat_tugas, knpns.kepegawaian_subbag_seksi_kecamatan, knpns.kepegawaian_kelurahan, knpns.kepegawaian_status_pegawai, knpns.kepegawaian_no_rekening, knpns.kepegawaian_no_karpeg, knpns.kepegawaian_no_kasirkasur, knpns.kepegawaian_no_taspen, knpns.kepegawaian_npwp, knpns.kepegawaian_no_bpjs_askes, knpns.kepegawaian_tmt_cpns, knpns.kepegawaian_tmt_pns, knpns.kepegawaian_tgl_sk_pns, knpns.kepegawaian_no_sk_pangkat_terakhir, knpns.kepegawaian_tgl_sk_pangkat_terakhir, knpns.kepegawaian_sk_pangkat_terakhir, knpns.kepegawaian_diklat_pol_pp_dasar, knpns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, knpns.kepegawaian_diklat_pol_pp_strutural, knpns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, knpns.kepegawaian_diklat_pol_pp_ppns, knpns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, knpns.kepegawaian_diklat_fungsional_pol_pp, knpns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, knpns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_non_pns knpns LEFT JOIN master_agama ma ON ma.id = CAST (knpns.agama AS INTEGER) LEFT JOIN master_golongan mg ON mg.id = CAST (knpns.kepegawaian_golongan AS INTEGER) LEFT JOIN master_pendidikan mp ON mp.id = CAST (knpns.kepegawaian_pendidikan_pada_sk AS INTEGER) LEFT JOIN master_jabatan mj ON mj.id = CAST (knpns.kepegawaian_jabatan AS INTEGER) LEFT JOIN master_eselon mes ON mes.id = knpns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = CAST (knpns.kepegawaian_pangkat AS INTEGER) WHERE knpns.is_deleted = 0 AND knpns.kepegawaian_status_pegawai = '" +
      status +
      "' ORDER BY mj.id ASC LIMIT " +
      limit +
      " OFFSET " +
      offset
    );

    return query;
  };

  // ^ filter duk
  const filterDuk = (limit, offset, status, qwhere) => {
    const query = db.any(
      "SELECT knpns.id, knpns.nama, knpns.tempat_lahir, to_char(knpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN knpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, knpns.nik, knpns.no_kk, knpns.status_perkawinan, knpns.no_hp, knpns.sesuai_ktp_alamat, knpns.sesuai_ktp_rtrw, knpns.sesuai_ktp_provinsi, knpns.sesuai_ktp_kabkota, knpns.sesuai_ktp_kecamatan, knpns.sesuai_ktp_kelurahan, knpns.domisili_alamat, knpns.domisili_rtrw, knpns.domisili_provinsi, knpns.domisili_kabkota, knpns.domisili_kecamatan, knpns.domisili_kelurahan, knpns.kepegawaian_nptt_npjlp, knpns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, knpns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, knpns.kepegawaian_tempat_tugas, knpns.kepegawaian_subbag_seksi_kecamatan, knpns.kepegawaian_kelurahan, knpns.kepegawaian_status_pegawai, knpns.kepegawaian_no_rekening, knpns.kepegawaian_no_karpeg, knpns.kepegawaian_no_kasirkasur, knpns.kepegawaian_no_taspen, knpns.kepegawaian_npwp, knpns.kepegawaian_no_bpjs_askes, knpns.kepegawaian_tmt_cpns, knpns.kepegawaian_tmt_pns, knpns.kepegawaian_tgl_sk_pns, knpns.kepegawaian_no_sk_pangkat_terakhir, knpns.kepegawaian_tgl_sk_pangkat_terakhir, knpns.kepegawaian_sk_pangkat_terakhir, knpns.kepegawaian_diklat_pol_pp_dasar, knpns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, knpns.kepegawaian_diklat_pol_pp_strutural, knpns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, knpns.kepegawaian_diklat_pol_pp_ppns, knpns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, knpns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, knpns.kepegawaian_diklat_fungsional_pol_pp, knpns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, knpns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_non_pns knpns LEFT JOIN master_agama ma ON ma.id = CAST (knpns.agama AS INTEGER) LEFT JOIN master_golongan mg ON mg.id = CAST (knpns.kepegawaian_golongan AS INTEGER) LEFT JOIN master_pendidikan mp ON mp.id = CAST (knpns.kepegawaian_pendidikan_pada_sk AS INTEGER) LEFT JOIN master_jabatan mj ON mj.id = CAST (knpns.kepegawaian_jabatan AS INTEGER) LEFT JOIN master_eselon mes ON mes.id = knpns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = CAST (knpns.kepegawaian_pangkat AS INTEGER)  WHERE knpns.is_deleted = 0 AND knpns.kepegawaian_status_pegawai = '" +
      status +
      "'" +
      qwhere +
      " LIMIT " +
      limit +
      " ORDER BY mj.id ASC OFFSET " +
      (parseInt(offset) - 1)
    );

    return query;
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
      "INSERT INTO kepegawaian_non_pns_keluarga (hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
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
      "UPDATE kepegawaian_non_pns_keluarga SET hubungan = $1, nama = $2, tempat_lahir = $3, tgl_lahir = $4, jenis_kelamin = $5, id_pegawai = $6, updated_at = CURRENT_TIMESTAMP WHERE id = $7 RETURNING id",
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
  const updatePendidikanNonPNS = (id, jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, id_pegawai) => {
    db.one(
      "UPDATE kepegawaian_non_pns_pendidikan SET jenis_pendidikan = $1, nama_sekolah = $2, nomor_ijazah = $3, tgl_ijazah = $4, jurusan = $5, fakultas = $6, file_ijazah = $7, id_pegawai = $8, updated_at = CURRENT_TIMESTAMP WHERE id = $9 RETURNING id",
      [jenis_pendidikan, nama_sekolah, nomor_ijazah, tgl_ijazah, jurusan, fakultas, file_ijazah, id_pegawai, id]
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

  return {
    cekByNoPegawai,
    autocompliteFill,
    getDataUnduh,
    countKeluarga,
    findPendidikanTerakhir,
    findPendidikan,
    findKeluarga,
    filter,
    countAllFilter,
    countAll,
    create,
    find,
    findone,
    update,
    del,
    findDuk,
    filterDuk,
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