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
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns_keluarga WHERE is_deleted = 0 AND id_pegawai = " +
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
      "SELECT klgr.id, klgr.hubungan, klgr.nama, klgr.tempat_lahir, klgr.tgl_lahir, CASE WHEN klgr.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin FROM kepegawaian_non_pns_keluarga klgr WHERE klgr.is_deleted = 0 AND klgr.id_pegawai = " +
        id
    );

    return query;
  };

  const findoneKeluarga = (id) => {
    const query = db.one(
      "SELECT klgr.* FROM kepegawaian_non_pns_keluarga klgr WHERE klgr.is_deleted = 0 AND klgr.id = " +
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
      "SELECT COUNT(id) as total FROM kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
        status +
        "'" +
        qwhere
    );

    return query;
  };

  const findone = (id) => {
    const query = db.one(
      "SELECT kpnns.* FROM kepegawaian_non_pns kpnns WHERE kpnns.id = $1 AND kpnns.is_deleted = 0",
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
    kepegawaian_nptt_npjlp,
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
    kepegawaian_diklat_pol_pp_dasar,
    kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
    kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_strutural,
    kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
    kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_ppns,
    kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
    kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp,
    kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
    updated_by
    ) => {
    db.one(
      "UPDATE kepegawaian_non_pns SET nama = $1, tempat_lahir = $2, tgl_lahir = $3, jenis_kelamin = $4, agama = $5, nik = $6, no_kk = $7, status_perkawinan = $8, no_hp = $9, sesuai_ktp_alamat = $10, sesuai_ktp_rtrw = $11, sesuai_ktp_provinsi = $12, sesuai_ktp_kabkota = $13, sesuai_ktp_kecamatan = $14, sesuai_ktp_kelurahan = $15, domisili_alamat = $16, domisili_rtrw = $17, domisili_provinsi = $18, domisili_kabkota = $19, domisili_kecamatan = $20, domisili_kelurahan = $21, kepegawaian_nptt_npjlp = $22, kepegawaian_nip = $23, kepegawaian_pangkat = $24, kepegawaian_golongan = $25, kepegawaian_tmtpangkat = $26, kepegawaian_pendidikan_pada_sk = $27, kepegawaian_jabatan = $28, kepegawaian_eselon = $29, kepegawaian_tempat_tugas = $30, kepegawaian_subbag_seksi_kecamatan = $31, kepegawaian_kelurahan = $32, kepegawaian_status_pegawai = $33, kepegawaian_no_rekening = $34, kepegawaian_no_karpeg = $35, kepegawaian_no_kasirkasur = $36, kepegawaian_no_taspen = $37, kepegawaian_npwp = $38, kepegawaian_no_bpjs_askes = $39, kepegawaian_tmt_cpns = $40, kepegawaian_tmt_pns = $41, kepegawaian_tgl_sk_pns = $42, kepegawaian_no_sk_pangkat_terakhir = $43, kepegawaian_tgl_sk_pangkat_terakhir = $44, kepegawaian_diklat_pol_pp_dasar = $45, kepegawaian_diklat_pol_pp_dasar_no_sertifikat = $46, kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat = $47, kepegawaian_diklat_pol_pp_strutural = $48, kepegawaian_diklat_pol_pp_strutural_no_sertifikat = $49, kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat = $50, kepegawaian_diklat_pol_pp_ppns = $51, kepegawaian_diklat_pol_pp_ppns_no_sertifikat = $52, kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat = $53, kepegawaian_diklat_fungsional_pol_pp = $54, kepegawaian_diklat_fungsional_pol_pp_no_sertifikat = $55, kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat = $56, updated_by = $57, updated_at = CURRENT_TIMESTAMP WHERE id = $58 RETURNING id",
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
        kepegawaian_nptt_npjlp,
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
        kepegawaian_diklat_pol_pp_dasar,
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat
          : null,
        kepegawaian_diklat_pol_pp_strutural,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat
          : null,
        kepegawaian_diklat_pol_pp_ppns,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat
          ? kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat
          : null,
        kepegawaian_diklat_fungsional_pol_pp,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat
          ? kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat
          : null,
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

  /* --------------------------------- pensiun -------------------------------- */

  // ^ find pensiun
  const findPensiun = (limit, offset, status) => {
    const query = db.any(
      "SELECT nama, kepegawaian_nip, kepegawaian_nptt_npjlp as kepegawaian_nrk, kepegawaian_jabatan, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, tempat_lahir, tgl_lahir, CASE WHEN kepegawaian_eselon = 1 or kepegawaian_eselon = 2 THEN EXTRACT(YEAR FROM tgl_lahir) + 60 ELSE EXTRACT(YEAR FROM tgl_lahir) + 58 END AS tahun_pensiun FROM public.kepegawaian_non_pns WHERE is_deleted = 0 AND kepegawaian_status_pegawai = '" +
        status +
        "' ORDER BY created_at DESC LIMIT " +
        limit +
        " OFFSET " +
        offset
    );

    return query;
  };

  // ^ filter pensiun
  const filterPensiun = (limit, offset, status, qwhere) => {
    const query = db.any(
      "SELECT nama, kepegawaian_nip, kepegawaian_nptt_npjlp as kepegawaian_nrk, kepegawaian_jabatan, kepegawaian_tempat_tugas, kepegawaian_subbag_seksi_kecamatan, tempat_lahir, tgl_lahir, CASE WHEN kepegawaian_eselon = 1 or kepegawaian_eselon = 2 THEN EXTRACT(YEAR FROM tgl_lahir) + 60 ELSE EXTRACT(YEAR FROM tgl_lahir) + 58 END AS tahun_pensiun FROM public.kepegawaian_non_pns WHERE is_deleted = 0 and kepegawaian_status_pegawai = '" +
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
      [hubungan, nama, tempat_lahir, tgl_lahir, jenis_kelamin, id_pegawai]
    );

    return query;
  };

  const updateKeluargaNonPNS = (
    id,
    hubungan,
    nama,
    tempat_lahir,
    tgl_lahir,
    jenis_kelamin,
    id_pegawai
  ) => {
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

    return { id };
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
  const updatePendidikanNonPNS = (
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
      "UPDATE kepegawaian_non_pns_pendidikan SET jenis_pendidikan = $1, nama_sekolah = $2, nomor_ijazah = $3, tgl_ijazah = $4, jurusan = $5, fakultas = $6, file_ijazah = $7, id_pegawai = $8, updated_at = CURRENT_TIMESTAMP WHERE id = $9 RETURNING id",
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

  //delete pendidikan non pns
  const delPendidikanNonPNS = async (id, deleted_by) => {
    await db.one(
      "UPDATE kepegawaian_non_pns_pendidikan SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return { id };
  };

  const updateFilePendidikan = (id, updated_by, values) => {
    db.one(
      `UPDATE kepegawaian_non_pns_pendidikan SET ${values} updated_at = CURRENT_TIMESTAMP WHERE id = ${id} RETURNING id`
    );
  };

  return {
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
    create,
    find,
    findone,
    update,
    del,
    findDuk,
    filterDuk,
    findPensiun,
    filterPensiun,
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
