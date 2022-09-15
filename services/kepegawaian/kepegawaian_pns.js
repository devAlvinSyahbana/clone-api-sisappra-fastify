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
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.nik, kpns.no_kk, kpns.status_perkawinan, kpns.no_hp, kpns.sesuai_ktp_alamat, kpns.sesuai_ktp_rtrw, kpns.sesuai_ktp_provinsi, kpns.sesuai_ktp_kabkota, kpns.sesuai_ktp_kecamatan, kpns.sesuai_ktp_kelurahan, kpns.domisili_alamat, kpns.domisili_rtrw, kpns.domisili_provinsi, kpns.domisili_kabkota, kpns.domisili_kecamatan, kpns.domisili_kelurahan, kpns.kepegawaian_nrk, kpns.kepegawaian_nip, mpang.nama as kepegawaian_pangkat, mg.nama as kepegawaian_golongan, kpns.kepegawaian_tmtpangkat, mp.nama as kepegawaian_pendidikan_pada_sk, mj.nama as kepegawaian_jabatan, mes.nama as kepegawaian_eselon, kpns.kepegawaian_tempat_tugas, kpns.kepegawaian_subbag_seksi_kecamatan, kpns.kepegawaian_kelurahan, kpns.kepegawaian_status_pegawai, kpns.kepegawaian_no_rekening, kpns.kepegawaian_no_karpeg, kpns.kepegawaian_no_kasirkasur, kpns.kepegawaian_no_taspen, kpns.kepegawaian_npwp, kpns.kepegawaian_no_bpjs_askes, kpns.kepegawaian_tmt_cpns, kpns.kepegawaian_tmt_pns, kpns.kepegawaian_tgl_sk_pns, kpns.kepegawaian_no_sk_pangkat_terakhir, kpns.kepegawaian_tgl_sk_pangkat_terakhir, kpns.kepegawaian_sk_pangkat_terakhir, kpns.kepegawaian_diklat_pol_pp_dasar, kpns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural, kpns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns, kpns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp, kpns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat FROM kepegawaian_pns kpns LEFT JOIN master_agama ma ON ma.id = kpns.agama LEFT JOIN master_golongan mg ON mg.id = kpns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpns.kepegawaian_pangkat WHERE kpns.is_deleted = 0 ORDER BY kpns.nama ASC"
    );

    return query;
  };

  const countKeluarga = (id) => {
    const query = db.one(
      "SELECT COUNT(id) as total FROM kepegawaian_pns_keluarga WHERE id_pegawai = " +
        id
    );

    return query;
  };

  const findPendidikanTerakhir = (id) => {
    const query = db.any(
      "SELECT mpend.nama as jenis_pendidikan FROM kepegawaian_pns_pendidikan kpns_pend LEFT JOIN master_pendidikan mpend ON mpend.id = kpns_pend.jenis_pendidikan WHERE kpns_pend.id_pegawai = " +
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
      "SELECT mpen.nama as jenis_pendidikan, kpen.nama_sekolah, kpen.nomor_ijazah, kpen.tgl_ijazah, kpen.jurusan, kpen.fakultas, kpen.file_ijazah FROM kepegawaian_pns_pendidikan kpen LEFT JOIN master_pendidikan mpen ON mpen.id = kpen.jenis_pendidikan WHERE kpen.id_pegawai = " +
        id
    );

    return query;
  };

  const findKeluarga = (id) => {
    const query = db.any(
      "SELECT klgr.hubungan, klgr.nama, klgr.tempat_lahir, klgr.tgl_lahir, CASE WHEN klgr.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin FROM kepegawaian_pns_keluarga klgr WHERE klgr.id_pegawai = " +
        id
    );

    return query;
  };

  const find = (limit, offset) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.no_hp, kpns.kepegawaian_nrk, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_pns kpns LEFT JOIN master_agama ma ON ma.id = CAST (kpns.agama AS INTEGER) WHERE kpns.is_deleted = 0 ORDER BY kpns.created_at DESC LIMIT " +
        limit +
        " OFFSET " +
        offset
    );

    return query;
  };

  const filter = (limit, offset, qwhere) => {
    const query = db.any(
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, to_char(kpns.tgl_lahir, 'dd Mon YYYY') AS tgl_lahir, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, ma.nama as agama, kpns.no_hp, kpns.kepegawaian_nrk, kpns.kepegawaian_status_pegawai, kpns.foto FROM kepegawaian_pns kpns LEFT JOIN master_agama ma ON ma.id = CAST (kpns.agama AS INTEGER) WHERE kpns.is_deleted = 0" +
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
      "SELECT kpns.id, kpns.nama, kpns.tempat_lahir, kpns.tgl_lahir, kpns.jenis_kelamin as jenis_kelamin_value, CASE WHEN kpns.jenis_kelamin = 'L' THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin, magama.id as agama_id, magama.nama as agama_name, kpns.nik, kpns.no_kk, kpns.status_perkawinan, kpns.no_hp, kpns.sesuai_ktp_alamat, kpns.sesuai_ktp_rtrw, kpns.sesuai_ktp_provinsi, kpns.sesuai_ktp_kabkota, kpns.sesuai_ktp_kecamatan, kpns.sesuai_ktp_kelurahan, kpns.domisili_alamat, kpns.domisili_rtrw, kpns.domisili_provinsi, kpns.domisili_kabkota, kpns.domisili_kecamatan, kpns.domisili_kelurahan, kpns.kepegawaian_nrk, kpns.kepegawaian_nip, mpang.id as kepegawaian_pangkat_id, mpang.nama as kepegawaian_pangkat_name, mg.id as kepegawaian_golongan_id, mg.nama as kepegawaian_golongan_name, kpns.kepegawaian_tmtpangkat, mp.id as kepegawaian_pendidikan_pada_sk_id, mp.nama as kepegawaian_pendidikan_pada_sk_name, mj.id as kepegawaian_jabatan_id, mj.nama as kepegawaian_jabatan_name, mes.id as kepegawaian_eselon_id, mes.nama as kepegawaian_eselon_name, kpns.kepegawaian_tempat_tugas, kpns.kepegawaian_subbag_seksi_kecamatan, kpns.kepegawaian_kelurahan, kpns.kepegawaian_status_pegawai, kpns.kepegawaian_no_rekening, kpns.kepegawaian_no_karpeg, kpns.kepegawaian_no_kasirkasur, kpns.kepegawaian_no_taspen, kpns.kepegawaian_npwp, kpns.kepegawaian_no_bpjs_askes, kpns.kepegawaian_tmt_cpns, kpns.kepegawaian_sk_cpns, kpns.kepegawaian_tmt_pns, kpns.kepegawaian_tgl_sk_pns, kpns.kepegawaian_sk_pns, kpns.kepegawaian_no_sk_pangkat_terakhir, kpns.kepegawaian_tgl_sk_pangkat_terakhir, kpns.kepegawaian_sk_pangkat_terakhir, kpns.kepegawaian_diklat_pol_pp_dasar, kpns.kepegawaian_diklat_pol_pp_dasar_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_dasar_file_sertifikat, kpns.kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural, kpns.kepegawaian_diklat_pol_pp_strutural_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat, kepegawaian_diklat_pol_pp_strutural_file_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns, kpns.kepegawaian_diklat_pol_pp_ppns_no_sertifikat, kpns.kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat, kepegawaian_diklat_pol_pp_ppns_file_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp, kpns.kepegawaian_diklat_fungsional_pol_pp_no_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat, kpns.kepegawaian_diklat_fungsional_pol_pp_file_sertifikat, kpns.foto FROM kepegawaian_pns kpns LEFT JOIN master_agama magama ON kpns.agama = magama.id LEFT JOIN master_golongan mg ON mg.id = kpns.kepegawaian_golongan LEFT JOIN master_pendidikan mp ON mp.id = kpns.kepegawaian_pendidikan_pada_sk LEFT JOIN master_jabatan mj ON mj.id = kpns.kepegawaian_jabatan LEFT JOIN master_eselon mes ON mes.id = kpns.kepegawaian_eselon LEFT JOIN master_pangkat mpang ON mpang.id = kpns.kepegawaian_pangkat WHERE kpns.id = $1 AND kpns.is_deleted = 0",
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
    kepegawaian_sk_cpns,
    kepegawaian_tmt_pns,
    kepegawaian_tgl_sk_pns,
    kepegawaian_sk_pns,
    kepegawaian_no_sk_pangkat_terakhir,
    kepegawaian_tgl_sk_pangkat_terakhir,
    kepegawaian_sk_pangkat_terakhir,
    kepegawaian_diklat_pol_pp_dasar,
    kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
    kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_dasar_file_sertifikat,
    kepegawaian_diklat_pol_pp_strutural,
    kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
    kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_strutural_file_sertifikat,
    kepegawaian_diklat_pol_pp_ppns,
    kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
    kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
    kepegawaian_diklat_pol_pp_ppns_file_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp,
    kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
    kepegawaian_diklat_fungsional_pol_pp_file_sertifikat,
    foto,
    updated_by
  ) => {
    db.one(
      "UPDATE kepegawaian_pns SET nama = $1, telepon = $2, updated_by = $3, updated_at = CURRENT_TIMESTAMP WHERE id = $4 RETURNING id",
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
        kepegawaian_sk_cpns,
        kepegawaian_tmt_pns,
        kepegawaian_tgl_sk_pns,
        kepegawaian_sk_pns,
        kepegawaian_no_sk_pangkat_terakhir,
        kepegawaian_tgl_sk_pangkat_terakhir,
        kepegawaian_sk_pangkat_terakhir,
        kepegawaian_diklat_pol_pp_dasar,
        kepegawaian_diklat_pol_pp_dasar_no_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_dasar_file_sertifikat,
        kepegawaian_diklat_pol_pp_strutural,
        kepegawaian_diklat_pol_pp_strutural_no_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_strutural_file_sertifikat,
        kepegawaian_diklat_pol_pp_ppns,
        kepegawaian_diklat_pol_pp_ppns_no_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_tgl_sertifikat,
        kepegawaian_diklat_pol_pp_ppns_file_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp,
        kepegawaian_diklat_fungsional_pol_pp_no_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_tgl_sertifikat,
        kepegawaian_diklat_fungsional_pol_pp_file_sertifikat,
        foto,
        updated_by,
        id,
      ]
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
  };
};

module.exports = fp((fastify, options, next) => {
  fastify.decorate("kepegawaian_pns", kepegawaian_pns(fastify.db));
  next();
});
