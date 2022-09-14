const fp = require("fastify-plugin");

const kepegawaian_non_pns = (db) => {
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
      "SELECT kpnns.id, kpnns.nama, kpnns.tempat_lahir, kpnns.tgl_lahir, kpnns.jenis_kelamin, magama.id as agama_id, magama.nama as agama_name, kpnns.nik, kpnns.no_kk, kpnns.status_perkawinan, kpnns.no_hp, kpnns.sesuai_ktp_alamat, kpnns.sesuai_ktp_rtrw, kpnns.sesuai_ktp_provinsi, kpnns.sesuai_ktp_kabkota, kpnns.sesuai_ktp_kecamatan, kpnns.sesuai_ktp_kelurahan, kpnns.domisili_alamat, kpnns.domisili_rtrw, kpnns.domisili_provinsi, kpnns.domisili_kabkota, kpnns.domisili_kecamatan, kpnns.domisili_kelurahan, kpnns.kepegawaian_nptt_npjlp as kepegawaian_nrk, kpnns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.id as kepegawaian_golongan_id, mg.nama as kepegawaian_golongan_name, kpnns.kepegawaian_tmtpangkat, mp.id as kepegawaian_pendidikan_pada_sk_id, mp.nama as kepegawaian_pendidikan_pada_sk_name, mj.id as kepegawaian_jabatan_id, mj.nama as kepegawaian_jabatan_name, mes.id as kepegawaian_eselon_id, mes.nama as kepegawaian_eselon_name, kpnns.kepegawaian_tempat_tugas, kpnns.kepegawaian_subbag_seksi_kecamatan, kpnns.kepegawaian_kelurahan, kpnns.kepegawaian_status_pegawai, kpnns.kepegawaian_no_rekening, kpnns.kepegawaian_no_karpeg, kpnns.kepegawaian_no_kasirkasur, kpnns.kepegawaian_no_taspen, kpnns.kepegawaian_npwp, kpnns.kepegawaian_no_bpjs_askes, kpnns.kepegawaian_tmt_cpns, kpnns.kepegawaian_sk_cpns, kpnns.kepegawaian_tmt_pns, kpnns.kepegawaian_tgl_sk_pns, kpnns.kepegawaian_sk_pns, kpnns.kepegawaian_no_sk_pangkat_terakhir, kpnns.kepegawaian_tgl_sk_pangkat_terakhir, kpnns.kepegawaian_sk_pangkat_terakhir, kpnns.kepegawaian_diklat_pol_pp_dasar, kpnns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kpnns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural, kpnns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns, kpnns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpnns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp, kpnns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kpnns.kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, kpnns.foto FROM kepegawaian_non_pns kpnns LEFT JOIN master_agama magama ON kpnns.agama = magama.id LEFT JOIN master_golongan mg ON mg.id = kpnns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpnns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpnns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpnns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpnns.kepegawaian_pangkat WHERE kpnns.id = $1 AND kpnns.is_deleted = 0",
      [id]
    );

    return query;
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
      "UPDATE kontak_pic SET is_deleted = 1, deleted_by = $2, deleted_at = CURRENT_TIMESTAMP WHERE id = $1 RETURNING id",
      [id, deleted_by]
    );

    return { id };
  };

  return {
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
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_non_pns", kepegawaian_non_pns(fastify.db));
  next();
});
